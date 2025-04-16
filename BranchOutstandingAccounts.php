<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zenith</title>
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
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
                                                <h2 class="m-t-p5 mb-0 mb-5">OUTSTANDING ACCOUNT</h2>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="table-data" class="table-responsive filterable max-30">
                                        <table id="data-table" class="table table-striped tableFixHead">
                                            <thead>
                                                <tr>
                                                    <th>Sno</th>
                                                    <th>Month</th>
                                                    <th>Branch Name</th>
                                                    <th>Booking Amount</th>
                                                    <th>Received Amount</th>
                                                    <th>Commission Amount</th>
                                                    <th>Collection Amount</th>
                                                    <th>Admin Outstanding Amount</th>
                                                    <th>Paid Amount</th>
                                                    <th>Balance Amount</th>
                                                    <th>Edit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                include 'dbConn.php';

                                                $query = "SELECT * FROM v_branch_accounts WHERE BALANCE < 0 ORDER BY MONTH DESC";
                                                $result = mysqli_query($conn, $query);

                                                // Initialize sum variables
                                                $totalOutstanding = 0;
                                                $totalPaid = 0;
                                                $totalBalance = 0;

                                                if (!$result) {
                                                    die("Query failed: " . mysqli_error($conn));
                                                }

                                                if (mysqli_num_rows($result) > 0) {
                                                    $sno = 0;
                                                    while ($row = mysqli_fetch_assoc($result)) {
                                                        $sno++;

                                                        // Add to totals
                                                        $totalOutstanding += $row['ADMIN_OUTSTANDING_AMOUNT'] ?? 0;
                                                        $totalPaid += $row['PAID_AMOUNT'] ?? 0;
                                                        $totalBalance += $row['BALANCE'] ?? 0;

                                                        $month = $row['MONTH'] ?? null;
                                                        $year = $row['YEAR'] ?? null;
                                                        $branchId = $row['BRANCH_ID'] ?? null;

                                                        echo "<tr>";
                                                        echo "<td>$sno</td>";

                                                        echo "<td>";
                                                        if ($month && $year && $branchId) {
                                                            $date = DateTime::createFromFormat('!m', $month);
                                                            echo '
                    <a href="#" data-toggle="modal" data-target="#branchModal" 
                        data-month="' . htmlspecialchars($month) . '" 
                        data-year="' . htmlspecialchars($year) . '" 
                        data-branch="' . htmlspecialchars($branchId) . '"
                        data-branchname="' . htmlspecialchars($row['BRANCH_NAME'] ?? '') . '"
                        data-mobile="' . htmlspecialchars($row['BRANCH_MOBILE'] ?? '') . '"
                        data-altmobile="' . htmlspecialchars($row['ALTERNATIVE_MOBILE'] ?? '') . '"
                        data-place="' . htmlspecialchars($row['PLACE'] ?? '') . '"
                        data-username="' . htmlspecialchars($row['USER_NAME'] ?? '') . '"
                        data-password="' . htmlspecialchars($row['PASSWORD'] ?? '') . '"
                        data-paidcommission="' . htmlspecialchars($row['PAID_COMMISSION'] ?? '') . '"
                        data-topaidcommission="' . htmlspecialchars($row['TOPAID_COMMISSION'] ?? '') . '"
                        data-address="' . htmlspecialchars($row['ADDRESS'] ?? '') . '"
                        data-totalexpense="' . htmlspecialchars($row['TOTAL_EXPENSE_AMOUNT'] ?? '') . '">';
                                                            echo htmlspecialchars($date->format('M') . '-' . $year);
                                                            echo '</a>';
                                                        }
                                                        echo "</td>";

                                                        echo "<td>" . htmlspecialchars($row['BRANCH_NAME'] ?? '') . "</td>";
                                                        echo "<td>" . htmlspecialchars($row['BOOKING_AMOUNT'] ?? '') . "</td>";
                                                        echo "<td>" . htmlspecialchars($row['RECEIVED_AMOUNT'] ?? '') . "</td>";
                                                        echo "<td>" . htmlspecialchars($row['COMMISSION_AMOUNT'] ?? '') . "</td>";
                                                        echo "<td>" . htmlspecialchars($row['COLLECTION_AMOUNT'] ?? '') . "</td>";
                                                        echo "<td>" . htmlspecialchars($row['ADMIN_OUTSTANDING_AMOUNT'] ?? '') . "</td>";
                                                        echo "<td>" . htmlspecialchars($row['PAID_AMOUNT'] ?? '') . "</td>";
                                                        echo "<td>" . htmlspecialchars($row['BALANCE'] ?? '') . "</td>";

                                                        echo "<td><a href='branchAccountEdit.php?id=" . $row['BRANCH_ACCOUNT_ID'] . "'><i class='fa fa-edit'></i></a></td>";
                                                        echo "</tr>";
                                                    }

                                                    // Add summary row
                                                    echo '<tr class="total-row" style="font-weight:bold; background-color:#f5f5f5;">';
                                                    echo '<td colspan="7" class="text-right">Total:</td>';
                                                    echo '<td>' . number_format($totalOutstanding, 2) . '</td>';
                                                    echo '<td>' . number_format($totalPaid, 2) . '</td>';
                                                    echo '<td>' . number_format($totalBalance, 2) . '</td>';
                                                    echo '<td></td>'; // Empty cell for the Edit column
                                                    echo '</tr>';
                                                } else {
                                                    echo '<tr><td colspan="11" class="text-center">No records found</td></tr>';
                                                }

                                                mysqli_close($conn);
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

        <!-- View Details Modal -->
        <div class="modal fade" id="branchModal" tabindex="-1" role="dialog" aria-labelledby="branchModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="branchModalLabel">Branch Details</h5>
                        <button type="button" class="close text-danger" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="branchDetailsForm">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="branchName">Branch Name</label>
                                        <input type="text" class="form-control" id="branchName" name="branchName" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="branchMobile">Branch Mobile</label>
                                        <input type="text" class="form-control" id="branchMobile" name="branchMobile" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="alternativeMobile">Alternative Mobile</label>
                                        <input type="text" class="form-control" id="alternativeMobile" name="alternativeMobile" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="place">Place</label>
                                        <input type="text" class="form-control" id="place" name="place" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input type="text" class="form-control" id="username" name="username" readonly>
                                    </div>
                                </div>
                                <!-- <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" readonly>
                                    </div>
                                </div> -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="totalExpense">Total Expense Amount</label>
                                        <input type="number" class="form-control" id="totalExpense" name="totalExpense" step="0.01" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="paidCommission">Paid Commission</label>
                                        <input type="number" class="form-control" id="paidCommission" name="paidCommission" step="0.01" readonly>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="toPaidCommission">To Paid Commission</label>
                                        <input type="number" class="form-control" id="toPaidCommission" name="toPaidCommission" step="0.01" readonly>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="address">Address</label>
                                        <textarea class="form-control" id="address" name="address" rows="3" readonly></textarea>
                                    </div>
                                </div>

                            </div>
                        </form>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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

    <!-- Required JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Select2 Filter -->
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