<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Your head content here -->
    <link rel="stylesheet" href="./css/table-filter.css">
    <style>
        /* Your styles here */
        .max-30 {
            max-height: 30vh;
            overflow-y: auto;
        }

        .a-edit-icon {
            cursor: pointer;
        }

        .font-x-large {
            font-size: 1.5em;
        }
    </style>

</head>

<body>
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <?php include 'header.php'; ?>

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
                                    <div class="row">
                                        <div class="col-12 d-flex justify-content-between align-items-center">
                                            <div class="flex-grow-1 text-center">
                                                <h2 class="m-t-p5 mb-0 mb-5">CUSTOMER TRANSACTION</h2>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="table-data" class="table-responsive filterable max-30">
                                        <table id="data-table" class="table table-striped tableFixHead">
                                            <thead>
                                                <tr class="text-center">
                                                    <th>Sno</th>
                                                    <th>Date</th>
                                                    <th>Customer Name</th>
                                                    <th>Balance Amount</th>
                                                    <th>Payment Type</th>
                                                    <th>Paid Amount</th>
                                                    <th>New Balance</th>
                                                    <th>Notes</th>


                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $userName = $_SESSION['userName'] ?? null;
                                                $branchName = $_SESSION['admin'] ?? null;

                                                $branchId = null;
                                                $getCustomerTransaction = "";

                                                if (strtolower($userName) == "admin") {

                                                    $getCustomerTransaction = "
                                                   SELECT ct.*, cd.CUSTOMER_NAME 
                                                   FROM customer_transaction ct
                                                   JOIN customer_details cd ON ct.CUSTOMER_ID = cd.CUSTOMER_ID ORDER BY ct.CREATED_AT DESC   ";
                                                } else {
                                                    if ($branchName) {

                                                        $stmt = $conn->prepare("SELECT BRANCH_OFFICE_ID FROM branch_details WHERE BRANCH_NAME = ?");
                                                        $stmt->bind_param("s", $branchName);
                                                        $stmt->execute();
                                                        $result = $stmt->get_result();
                                                        $branchData = $result->fetch_assoc();
                                                        $stmt->close();

                                                        if ($branchData) {
                                                            $branchId = $branchData['BRANCH_OFFICE_ID'];
                                                            $getCustomerTransaction = "
                                                            SELECT ct.*, cd.CUSTOMER_NAME 
                                                            FROM customer_transaction ct
                                                            JOIN customer_details cd ON ct.CUSTOMER_ID = cd.CUSTOMER_ID
                                                            WHERE cd.BRANCH_ID = ?
                                                            ORDER BY ct.CREATED_AT DESC
                                                                ";
                                                        } else {
                                                            echo "<tr><td colspan='8' class='text-center'>Branch not found</td></tr>";
                                                        }
                                                    } else {
                                                        echo "<tr><td colspan='8' class='text-center'>Branch name not set</td></tr>";
                                                    }
                                                }

                                                if ($getCustomerTransaction) {
                                                    if (isset($branchId)) {
                                                        $stmt = $conn->prepare($getCustomerTransaction);
                                                        $stmt->bind_param("i", $branchId);
                                                        $stmt->execute();
                                                        $result = $stmt->get_result();
                                                    } else {
                                                        $result = mysqli_query($conn, $getCustomerTransaction);
                                                    }

                                                    $sno = 1;
                                                    if ($result && mysqli_num_rows($result) > 0) {
                                                        while ($row = $result->fetch_assoc()) {
                                                ?>
                                                            <tr class="text-center">
                                                                <td><?php echo $sno++; ?></td>
                                                                <td><?php echo strtoupper(date('d-M-Y', strtotime($row['CREATED_AT']))); ?></td>
                                                                <td><?php echo htmlspecialchars($row['CUSTOMER_NAME']); ?></td>
                                                                <td><?php echo $row['BALANCE_AMOUNT']; ?></td>
                                                                <td><?php echo $row['PAYMENT_TYPE']; ?></td>
                                                                <td><?php echo $row['PAID_AMOUNT']; ?></td>
                                                                <td><?php echo $row['NEW_BALANCE']; ?></td>
                                                                <td><?php echo htmlspecialchars($row['NOTES']); ?></td>
                                                            </tr>
                                                <?php
                                                        }
                                                    } else {
                                                        echo "<tr><td colspan='8' class='text-center'>No records found</td></tr>";
                                                    }

                                                    if (isset($stmt)) $stmt->close();
                                                    mysqli_close($conn);
                                                }
                                                ?>
                                            </tbody>


                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--**********************************
            Content body end
        ***********************************-->

        <?php include 'footer.php'; ?>

    </div>

    <!-- Select2 Fileter -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <!-- Table Filter -->
    <script src="./js/ddtf.js"></script>
    <!-- Prevent Number Scrolling -->
    <script src="./js/chits/numberInputPreventScroll.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            // Initialize table filter
            $("#data-table").ddTableFilter();
            $('select').addClass('w3-select').select2();

            // Handle branch modal show event
            $('#branchModal').on('show.bs.modal', function(event) {
                var button = $(event.relatedTarget);
                var modal = $(this);

                // Set values in the modal fields
                modal.find('#branchName').val(button.data('branchname'));
                modal.find('#branchMobile').val(button.data('mobile'));
                modal.find('#alternativeMobile').val(button.data('altmobile'));
                modal.find('#place').val(button.data('place'));
                modal.find('#username').val(button.data('username'));
                // modal.find('#password').val(button.data('password'));
                modal.find('#paidCommission').val(button.data('paidcommission'));
                modal.find('#toPaidCommission').val(button.data('topaidcommission'));
                modal.find('#address').val(button.data('address'));
                modal.find('#totalExpense').val(button.data('totalexpense'));
            });


        });



        // Helper function to get month name
        function getMonthName(month) {
            var months = ['January', 'February', 'March', 'April', 'May', 'June',
                'July', 'August', 'September', 'October', 'November', 'December'
            ];
            return months[parseInt(month) - 1] || '';
        }
    </script>
</body>

</html>