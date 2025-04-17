<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Accounts</title>
    <link rel="stylesheet" href="./css/table-filter.css">

    <!-- Your CSS and other header elements -->
</head>

<body>
    <!-- Preloader start -->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!-- Preloader end -->

    <!-- Main wrapper start -->
    <div id="main-wrapper">
        <?php include 'header.php'; ?>

        <!-- Content body start -->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
                                    <div class="row">
                                        <div class="col-12 d-flex justify-content-between align-items-center">
                                            <div class="flex-grow-1 text-center mb-5">
                                                <h2 class="m-t-p5 mb-0">ACCOUNTS MANAGEMENT</h2>
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
                                                    <th>Admin Outstanding Amount</th>
                                                    <th>Paid Amount</th>
                                                    <th>Approvel</th>
                                                    <th>Reject</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php


                                                $userName = $_SESSION['userName'] ?? null;
                                                $branchName = $_SESSION['admin'] ?? null;
                                                $result = null;

                                                if (strtolower($userName) === 'admin') {
                                                    $getAccountQuery = "SELECT * FROM branch_account WHERE IS_DELETE = 0 AND IS_REQUEST = 1";
                                                    $result = mysqli_query($conn, $getAccountQuery);
                                                } elseif ($branchName) {
                                                    $stmt = $conn->prepare("SELECT BRANCH_OFFICE_ID FROM branch_details WHERE BRANCH_NAME = ?");
                                                    $stmt->bind_param("s", $branchName);
                                                    $stmt->execute();
                                                    $branchResult = $stmt->get_result();

                                                    if ($branchRow = $branchResult->fetch_assoc()) {
                                                        $branchId = $branchRow['BRANCH_OFFICE_ID'];

                                                        $stmt2 = $conn->prepare("SELECT * FROM branch_account WHERE IS_DELETE = 0 AND IS_REQUEST = 1 AND BRANCH_ID = ?");
                                                        $stmt2->bind_param("i", $branchId);
                                                        $stmt2->execute();
                                                        $result = $stmt2->get_result();
                                                    } else {
                                                        echo "<tr><td colspan='10' class='text-center'>Branch not found.</td></tr>";
                                                    }

                                                    $stmt->close();
                                                } else {
                                                    echo "<tr><td colspan='10' class='text-center'>Branch name not set.</td></tr>";
                                                }

                                                if ($result && mysqli_num_rows($result) > 0) {
                                                    $sno = 0;
                                                    while ($row = mysqli_fetch_assoc($result)) {
                                                        $sno++;

                                                        $currentBranchId = $row['BRANCH_ID'];
                                                        $branchNameDisplay = '';
                                                        $branchData = [];

                                                        $branchDetailsQuery = $conn->prepare("SELECT * FROM branch_details WHERE BRANCH_OFFICE_ID = ?");
                                                        $branchDetailsQuery->bind_param("i", $currentBranchId);
                                                        $branchDetailsQuery->execute();
                                                        $branchDetailsResult = $branchDetailsQuery->get_result();

                                                        if ($branchDetailsResult && mysqli_num_rows($branchDetailsResult) > 0) {
                                                            $branchData = mysqli_fetch_assoc($branchDetailsResult);
                                                            $branchNameDisplay = $branchData['BRANCH_NAME'];
                                                        }

                                                        $branchDetailsQuery->close();

                                                ?>
                                                        <tr class="text-center">
                                                            <td><?php echo $sno; ?></td>
                                                            <td>
                                                                <?php
                                                                $month = $row['MONTH'] ?? null;
                                                                $year = $row['YEAR'] ?? null;

                                                                if ($month && $year && $currentBranchId) {
                                                                    $date = DateTime::createFromFormat('!m', $month);
                                                                    echo '<a href="#" data-toggle="modal" data-target="#branchModal" 
                        data-month="' . htmlspecialchars($month) . '" 
                        data-year="' . htmlspecialchars($year) . '" 
                        data-branch="' . htmlspecialchars($currentBranchId) . '"
                        data-branchname="' . htmlspecialchars($branchData['BRANCH_NAME'] ?? '') . '"
                        data-mobile="' . htmlspecialchars($branchData['BRANCH_MOBILE'] ?? '') . '"
                        data-altmobile="' . htmlspecialchars($branchData['ALTERNATIVE_MOBILE'] ?? '') . '"
                        data-place="' . htmlspecialchars($branchData['PLACE'] ?? '') . '"
                        data-username="' . htmlspecialchars($branchData['USER_NAME'] ?? '') . '"
                        data-password="' . htmlspecialchars($branchData['PASSWORD'] ?? '') . '"
                        data-paidcommission="' . htmlspecialchars($branchData['PAID_COMMISSION'] ?? '') . '"
                        data-topaidcommission="' . htmlspecialchars($branchData['TOPAID_COMMISSION'] ?? '') . '"
                        data-address="' . htmlspecialchars($branchData['ADDRESS'] ?? '') . '"
                        data-totalexpense="' . htmlspecialchars($branchData['TOTAL_EXPENSE_AMOUNT'] ?? '') . '">';
                                                                    echo htmlspecialchars($date->format('M') . '-' . $year);
                                                                    echo '</a>';
                                                                } else {
                                                                    echo '';
                                                                }
                                                                ?>
                                                            </td>
                                                            <td><?php echo htmlspecialchars($branchNameDisplay); ?></td>
                                                            <td><?php echo htmlspecialchars($row['BOOKING_AMOUNT'] ?? ''); ?></td>
                                                            <td><?php echo htmlspecialchars($row['RECEIVED_AMOUNT'] ?? ''); ?></td>
                                                            <td><?php echo htmlspecialchars($row['COMMISSION_AMOUNT'] ?? ''); ?></td>
                                                            <td><?php echo htmlspecialchars($row['ADMIN_OUTSTANDING_AMOUNT'] ?? ''); ?></td>
                                                            <td><?php echo htmlspecialchars($row['REQUESTED_AMOUNT'] ?? ''); ?></td>
                                                            <td>
                                                                <a href="javascript:void(0);" onclick="approvel(this)" data-id="<?php echo $row['BRANCH_ACCOUNT_ID']; ?>">
                                                                    <i class="fa fa-check text-success"></i>
                                                                </a>
                                                            </td>
                                                            <td>
                                                                <a href="javascript:void(0);" onclick="cancel(this)" data-id="<?php echo $row['BRANCH_ACCOUNT_ID']; ?>">
                                                                    <i class="fa fa-close text-danger"></i>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                <?php
                                                    }
                                                } elseif (!isset($result)) {
                                                    // Already handled above
                                                } else {
                                                    echo '<tr><td colspan="10" class="text-center">No records found</td></tr>';
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
                </div> <!-- #/ container -->

                <!-- Button -->



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



                <!-- Cancel Modal -->
                <div id="cancelModal">
                    <div class="modal-content">
                        <h3>❌ Cancel Request</h3>
                        <input type="text" id="cancelReason" placeholder="Enter reason..." />
                        <div class="modal-buttons">
                            <button class="btn-confirm" onclick="updateCancel()">Cancel Now</button>
                            <button class="btn-close" onclick="$('#cancelModal').hide();">Close</button>
                        </div>
                        <input type="hidden" id="cancelID" />
                    </div>
                </div>

                <!-- Modal Styling -->
                <style>
                    #cancelModal {
                        display: none;
                        position: fixed;
                        z-index: 9999;
                        left: 0;
                        top: 0;
                        width: 100%;
                        height: 100%;
                        background-color: rgba(0, 0, 0, 0.5);
                    }

                    .modal-content {
                        position: absolute;
                        top: 30%;
                        left: 50%;
                        transform: translate(-50%, -30%);
                        background: #fff;
                        padding: 25px;
                        border-radius: 10px;
                        width: 90%;
                        max-width: 400px;
                        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
                        text-align: center;
                    }

                    .modal-content h3 {
                        margin-bottom: 20px;
                        color: #c0392b;
                    }

                    .modal-content input[type="text"] {
                        width: 100%;
                        padding: 10px;
                        font-size: 16px;
                        border: 1px solid #ccc;
                        border-radius: 6px;
                        margin-bottom: 20px;
                    }

                    .modal-buttons {
                        display: flex;
                        justify-content: space-between;
                    }

                    .btn-confirm {
                        background-color: #e74c3c;
                        color: white;
                        padding: 10px 20px;
                        border: none;
                        border-radius: 6px;
                        cursor: pointer;
                    }

                    .btn-close {
                        background-color: #bdc3c7;
                        color: white;
                        padding: 10px 20px;
                        border: none;
                        border-radius: 6px;
                        cursor: pointer;
                    }

                    .btn-confirm:hover {
                        background-color: #c0392b;
                    }

                    .btn-close:hover {
                        background-color: #95a5a6;
                    }
                </style>




                <!-- Content body end -->
                <?php include 'footer.php'; ?>
            </div>
        </div>
    </div>
</body>

<!-- Select2 Fileter -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<!-- Table Filter -->
<script src="./js/ddtf.js"></script>
<!-- Prevent Number Scrolling -->
<script src="./js/chits/numberInputPreventScroll.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#data-table").ddTableFilter();
        $('select').addClass('w3-select');
        $('select').select2();
    });



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


    //Approved Status
    function approvel(el) {
        let cnf = confirm("⚠️ Sure to Approve?");
        if (cnf) {
            let branchAccountID = $(el).attr('data-id'); // get data-id from clicked element

            $.ajax({
                type: 'POST',
                url: 'dataOperations.php',
                data: {
                    approvel: 1,
                    branchAccountID: branchAccountID
                },
                success: function(response) {
                    console.log("Response from server:", response);
                    if (response.toString().startsWith("Update Successful")) {
                        alert('✔️ Amount updated Successfully!');
                        window.location.reload();
                    } else {
                        alert('❌ Approvel Error: ' + response);
                    }
                },
                error: function(xhr, status, error) {
                    alert("🚨 AJAX error: " + error);
                }
            });
        } else {
            alert("❌ Approval cancelled.");
        }
    }


    function cancel(el) {
        let id = $(el).attr('data-id');
        $('#cancelID').val(id); // store ID in hidden input
        $('#cancelReason').val(''); // clear previous reason
        $('#cancelModal').show(); // show modal
    }

    function updateCancel() {
        let id = $('#cancelID').val();
        let reason = $('#cancelReason').val().trim();

        if (!reason) {
            alert("⚠️ Please enter a cancellation reason.");
            return;
        }

        $.ajax({
            type: 'POST',
            url: 'dataOperations.php',
            data: {
                Calcel: 1,
                Id: id,
                Reason: reason
            },
            success: function(response) {
                console.log(response);
                if (response.toString().startsWith("Update Successful")) {
                    alert("✔️ Cancelled successfully!");
                    $('#cancelModal').hide();
                    window.location.reload();
                } else {
                    alert("❌ Error: " + response);
                }
            },
            error: function(xhr, status, error) {
                alert("🚨 AJAX error: " + error);
            }
        });
    }
</script>

</html>