<!DOCTYPE html>
<?php
include 'dbConn.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    // Use prepared statements for safety
    $stmt = $conn->prepare("SELECT * FROM customer_account WHERE CUSTOMER_ID = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
}
?>

<html lang="en">

<link rel="stylesheet" href="./css/table-filter.css">

<body>
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
                                                <h2 class="m-t-p5 mb-0">PAYMENT</h2>
                                            </div>
                                        </div>
                                    </div>

                                    <input type="hidden" id="customer-id" value="<?php echo $row['CUSTOMER_ID']; ?>">

                                    <div class="form-group">
                                        <label for="customer-name">Customer Name:</label>
                                        <input type="text" class="form-control" id="customer-name" name="customer-name" value="<?php echo $row['CUSTOMER_NAME']; ?>" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label for="balance-amount">Balance Amount:</label>
                                        <input type="number" class="form-control" value="<?php echo $row['OUTSTANDING_AMOUNT']-$row['PAID_AMOUNT']; ?>" id="balance-amount" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label for="payment-type">Payment Type: <span class="mandatory-astrick">*</span></label>
                                        <select class="form-control" name="payment-type" id="payment-type">
                                            <option value="">Select Payment Type</option>
                                            <option value="Cash">Cash</option>
                                            <option value="Online">Online</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label for="notes">Notes:</label>
                                        <textarea class="form-control" name="notes" id="notes" placeholder="Enter Notes" rows="3"></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="paid-amount">Paid Amount: <span class="mandatory-astrick">*</span></label>
                                        <input type="number" class="form-control" id="paid-amount" placeholder="Enter Paid Amount">
                                    </div>

                                    <div class="form-group">
                                        <label for="new-balance">New Balance:</label>
                                        <input type="number" class="form-control" id="new-balance" readonly>
                                    </div>

                                    <div class="form-group text-center">
                                        <button type="button" class="btn btn-success" onclick="validateAndSavePayment()">
                                            <i class="fa fa-floppy-o font-medium" aria-hidden="true"></i>
                                            Update
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <?php include 'footer.php'; ?>

</body>

<!-- Select2 & jQuery -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    document.getElementById('paid-amount').addEventListener('input', function () {
        const balanceAmount = parseFloat(document.getElementById('balance-amount').value) || 0;
        const paidAmount = parseFloat(this.value) || 0;
        const newBalance = balanceAmount - paidAmount;
        document.getElementById('new-balance').value = newBalance.toFixed(2);
    });

    function validateAndSavePayment() {
        const customerId = document.getElementById('customer-id').value;
        const balanceamt = document.getElementById('balance-amount').value;
        const paidAmount = document.getElementById('paid-amount').value;
        const paymentType = document.getElementById('payment-type').value;
        const notes = document.getElementById('notes').value;
        const newbalance = document.getElementById('new-balance').value;

        if (!paidAmount || !paymentType) {
            alert('Please fill required fields.');
            return;
        }

        $.ajax({
            type: 'POST',
            url: 'bookingDataOperations.php',
            data: {
                UpdatePayment: 1,
                customerId: customerId,
                balanceamt: balanceamt,
                paidAmount: paidAmount,
                paymentType: paymentType,
                notes: notes,
                newbalance:newbalance
            },
            success: function(response) {
                console.log('server response:',response)
                if (response.toString().startsWith("Update Successful")) {

                    alert("✔️ Payment Update Successfully!");
                    window.location.href = 'customer_account.php';
                
                } else {
                    alert("🚨 Some error had occured. \nPlease try again");
                    return false;
                }
            }
           
        });
    }
</script>

</html>
