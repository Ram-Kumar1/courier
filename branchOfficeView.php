<?php
include 'dbConn.php';
date_default_timezone_set('Asia/Kolkata');

$sql = "SELECT * FROM branch_details WHERE PLACE != '' AND LOWER(BRANCH_NAME) != 'admin' ORDER BY BRANCH_NAME";
?>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="./css/table-filter.css">

<body>
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>

    <div id="main-wrapper">
        <?php include 'header.php'; ?>

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
                                                <h2 class="m-t-p5 mb-0">VIEW BRANCH OFFICE</h2>
                                            </div>
                                            <button type="button" class="btn btn-info btn-sm pull-right mb-3" style="margin-top: 0.75em;" onclick="goToAddBranchDetails()">
                                                <i class="material-icons">add</i>
                                            </button>
                                        </div>
                                    </div>

                                    <br>

                                    <?php
                                    if (isset($conn) && $result = mysqli_query($conn, $sql)) {
                                        if (mysqli_num_rows($result) > 0) {
                                    ?>
                                            <div id="table-data" class="table-responsive filterable max-30">
                                                <table id="data-table" class="table table-striped tableFixHead">
                                                    <thead>
                                                        <tr class="filters" style="color:#0c1211;">
                                                            <th rowspan="2">S. No</th>
                                                            <th rowspan="2">Branch Name</th>
                                                            <th rowspan="2">Mobile</th>
                                                            <th rowspan="2">Alternative Mobile</th>
                                                            <th rowspan="2">Place</th>
                                                            <th rowspan="2">Address</th>
                                                            <th rowspan="2">User Name</th>
                                                            <th rowspan="2">Password</th>
                                                     
                                                            <th rowspan="2">Paid Commission</th>
                                                            <th rowspan="2">ToPaid Commission</th>
                                                            <th colspan="2" style="text-align: center;">Expense</th>
                                                            <th rowspan="2">Total Expense Amt</th>
                                                            <th rowspan="2" style="text-align: center;">Edit</th>
                                                            <th rowspan="2" style="text-align: center;">Delete</th>
                                                        </tr>
                                                     
                                                    </thead>
                                                    <tbody>
                                                        <?php
                                                        $i = 1;
                                                        while ($row = mysqli_fetch_assoc($result)) {
                                                            $expenses = json_decode($row['EXPENSE'], true);
                                                            $descriptions = [];
                                                            $amounts = [];

                                                            if (!empty($expenses)) {
                                                                foreach ($expenses as $expense) {
                                                                    $descriptions[] = $expense['description'] ?? '';
                                                                    $amounts[] = $expense['amount'] ?? '';
                                                                }
                                                            }
                                                        ?>
                                                            <tr>
                                                                <td><?php echo $i++; ?></td>
                                                                <td><?php echo $row['BRANCH_NAME']; ?></td>
                                                                <td><?php echo $row['BRANCH_MOBILE']; ?></td>
                                                                <td><?php echo $row['ALTERNATIVE_MOBILE']; ?></td>
                                                                <td><?php echo $row['PLACE']; ?></td>
                                                                <td><?php echo $row['ADDRESS']; ?></td>
                                                                <td><?php echo $row['USER_NAME']; ?></td>
                                                                <td><?php echo $row['PASSWORD']; ?></td>
                                                    
                                                                <td><?php echo $row['PAID_COMMISSION'] ?? '-'; ?></td>
                                                                <td><?php echo $row['TOPAID_COMMISSION'] ?? '-'; ?></td>
                                                                <td><?php echo !empty($descriptions) ? implode('<br>', $descriptions) : '-'; ?></td>
                                                                <td><?php echo !empty($amounts) ? implode('<br>', $amounts) : '-'; ?></td>
                                                                <td><?php echo $row['TOTAL_EXPENSE_AMOUNT'] ?? '-'; ?></td>
                                                                <td style="text-align: center;">
                                                                    <a class="a-edit-icon" data-id="<?php echo $row['BRANCH_OFFICE_ID']; ?>" onclick="editDetails(this)">
                                                                        <i class="fa fa-pencil font-x-large" aria-hidden="true"></i>
                                                                    </a>
                                                                </td>
                                                                <td style="text-align: center;">
                                                                    <a class="a-delete-icon" data-id="<?php echo $row['BRANCH_OFFICE_ID']; ?>" onclick="deleteBranch(this)">
                                                                        <i class="fa fa-trash-o font-x-large" aria-hidden="true"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        <?php } ?>
                                                    </tbody>
                                                </table>
                                            </div>
                                    <?php
                                            mysqli_free_result($result);
                                        } else {
                                            echo "No records found.";
                                        }
                                    }
                                    ?>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php include 'footer.php'; ?>

    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="./js/ddtf.js"></script>
    <script src="./js/chits/numberInputPreventScroll.js"></script>
    <script>
        $(document).ready(function () {
            $("#data-table").ddTableFilter();
            $('select').addClass('w3-select');
            $('select').select2();
        });

        function goToAddBranchDetails() {
            window.location.href = "branchOffice.php";
        }

        function editDetails(branchOfficeId) {
            branchOfficeId = $(branchOfficeId).attr('data-id');
            window.location.href = 'updateBranchDetails.php?branchOfficeId=' + branchOfficeId;
        }

        function deleteBranch(deleteButton) {
            let cnf = confirm("⚠️ Sure to delete?");
            if (cnf) {
                let BranchId = $(deleteButton).attr('data-id');
                $.ajax({
                    type: 'POST',
                    url: 'dataOperations.php',
                    data: {
                        deleteBranch: 1,
                        BranchId: BranchId
                    },
                    success: function (response) {
                        console.log("Response from server:", response);
                        if (response.toString().startsWith("Delete Successful")) {
                            alert('✔️ Branch Deleted Successfully!');
                            window.location.reload();
                        } else {
                            alert('❌ Error deleting Branch: ' + response);
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("🚨 AJAX error: " + error);
                    }
                });
            }
        }
    </script>
</body>
</html>
