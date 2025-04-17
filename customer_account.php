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
                                                <h2 class="m-t-p5 mb-0 mb-5">CUSTOMER ACCOUNT</h2>
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
                                                    <th>Edit</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                $userName = $_SESSION['userName'] ?? null;
                                                $branchName = $_SESSION['admin'] ?? null;
                                                $branchId = null;

                                                // Get branch ID if not admin
                                                if (strtolower($userName) !== 'admin' && $branchName) {
                                                    $stmt = $conn->prepare("SELECT BRANCH_OFFICE_ID FROM branch_details WHERE BRANCH_NAME = ?");
                                                    $stmt->bind_param("s", $branchName);
                                                    $stmt->execute();
                                                    $result = $stmt->get_result();

                                                    if ($row = $result->fetch_assoc()) {
                                                        $branchId = $row['BRANCH_OFFICE_ID'];
                                                    } else {
                                                        echo "<tr><td colspan='7' class='text-center'>Branch not found.</td></tr>";
                                                    }

                                                    $stmt->close();
                                                }

                                                // Fetch customer accounts
                                                if ($userName === 'admin') {
                                                    $query = "SELECT * FROM customer_account";
                                                    $stmt = $conn->prepare($query);
                                                } elseif ($branchId) {
                                                    $query = "SELECT * FROM customer_account WHERE BRANCH_ID = ?";
                                                    $stmt = $conn->prepare($query);
                                                    $stmt->bind_param("i", $branchId);
                                                } else {
                                                    echo "<tr><td colspan='7' class='text-center'>Branch name not set or branch ID missing.</td></tr>";
                                                    exit;
                                                }

                                                $stmt->execute();
                                                $result = $stmt->get_result();
                                                $sno = 1;

                                                if ($result && $result->num_rows > 0) {
                                                    while ($row = $result->fetch_assoc()) {
                                                        $createdAt = !empty($row['CREATED_AT']) ? strtolower(date('d-M-Y', strtotime($row['CREATED_AT']))) : 'N/A';
                                                        $customerName = htmlspecialchars($row['CUSTOMER_NAME'] ?? 'N/A');
                                                        $outstanding = isset($row['OUTSTANDING_AMOUNT'], $row['PAID_AMOUNT']) ?
                                                            ($row['OUTSTANDING_AMOUNT'] - $row['PAID_AMOUNT']) : 'N/A';
                                                        $customerId = htmlspecialchars($row['CUSTOMER_ID']);

                                                        echo "<tr class='text-center'>";
                                                        echo "<td>{$sno}</td>";
                                                        echo "<td>{$createdAt}</td>";
                                                        echo "<td>{$customerName}</td>";
                                                        echo "<td>{$outstanding}</td>";
                                                        echo "<td>
                <a class='a-edit-icon' href='editCustomerAccount.php?id={$customerId}'>
                    <i class='fa fa-pencil font-x-large' aria-hidden='true'></i>
                </a>
              </td>";
                                                        echo "</tr>";
                                                        $sno++;
                                                    }
                                                } else {
                                                    echo "<tr><td colspan='7' class='text-center'>No records found</td></tr>";
                                                }

                                                $stmt->close();
                                                $conn->close();
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

    <script>
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