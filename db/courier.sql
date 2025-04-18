-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table jstar.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `ID` int(11) NOT NULL,
  `FROM_PLACE` varchar(1000) NOT NULL,
  `TO_PLACE` varchar(1000) NOT NULL,
  `DRIVER_NAME` varchar(1000) NOT NULL,
  `VEHICLE_NO` varchar(1000) NOT NULL,
  `OPENING_KM` int(100) NOT NULL,
  `CLOSING_KM` int(100) NOT NULL,
  `AMOUNT_RECEIVED` int(100) NOT NULL,
  `AMOUNT_SPENT` int(100) NOT NULL,
  `ADVANCE_AMOUNT` int(100) NOT NULL,
  `DIESEL` int(100) NOT NULL,
  `LINE_COLLECTION` int(100) NOT NULL,
  `TOLL` int(100) NOT NULL,
  `NOTE_1` varchar(5000) NOT NULL,
  `BETTA` int(100) NOT NULL,
  `NOTE_2` varchar(2000) NOT NULL,
  `EXPENSE_NOTE` varchar(2000) NOT NULL,
  `TOTAL_INCOME` int(10) NOT NULL,
  `TOTAL_EXPENSE` int(10) NOT NULL,
  `BALANCE` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table jstar.accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

-- Dumping structure for table jstar.billing_address
CREATE TABLE IF NOT EXISTS `billing_address` (
  `address_id` int(10) NOT NULL,
  `address` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table jstar.billing_address: ~2 rows (approximately)
/*!40000 ALTER TABLE `billing_address` DISABLE KEYS */;
INSERT INTO `billing_address` (`address_id`, `address`) VALUES
	(1, '42 Sarojini Street No:3,\r\nNew Sidhapudur,\r\nCoimbatore 44'),
	(1, '42 Sarojini Street No:3,\r\nNew Sidhapudur,\r\nCoimbatore 44');
/*!40000 ALTER TABLE `billing_address` ENABLE KEYS */;

-- Dumping structure for table jstar.booking_details
CREATE TABLE IF NOT EXISTS `booking_details` (
  `BOOKING_ID` int(10) NOT NULL AUTO_INCREMENT,
  `LR_NUMBER` varchar(111) DEFAULT NULL,
  `CUSTOMER_ID` varchar(111) DEFAULT NULL,
  `CUSTOMER` varchar(500) NOT NULL,
  `MOBILE` varchar(500) NOT NULL,
  `DELIVERY_TO` varchar(1000) NOT NULL,
  `DELIVERY_MOBILE` varchar(500) DEFAULT NULL,
  `FROM_PLACE` varchar(100) NOT NULL,
  `FROM_MOBILE` varchar(1000) DEFAULT NULL,
  `TO_PLACE` varchar(500) NOT NULL,
  `TO_MOBILE` varchar(1000) DEFAULT NULL,
  `FROM_PLACE_ID` varchar(22) DEFAULT NULL,
  `TO_PLACE_ID` varchar(22) DEFAULT NULL,
  `QUANTITY` int(20) NOT NULL,
  `QUANTITY_DETAILS` mediumtext NOT NULL,
  `QTY_DESCRIPTION` varchar(500) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(100) NOT NULL,
  `TOTAL_AMOUNT` int(50) DEFAULT NULL,
  `TRANSPORTATION_COST` int(50) NOT NULL,
  `LOADING_COST` int(50) DEFAULT NULL,
  `ADDITIONAL_COST` int(50) DEFAULT NULL,
  `GOODS_VALUE` int(50) NOT NULL,
  `DELIVERY_TYPE` varchar(10) DEFAULT '',
  `NOTES` varchar(500) DEFAULT NULL,
  `BOOKING_STAUTS` int(10) DEFAULT NULL,
  `BOOKING_DATE` date DEFAULT NULL,
  `LAST_UPDATE_DATE` date DEFAULT NULL,
  `SHIPMENT_VIA` varchar(50) DEFAULT NULL,
  `SHOW_IN_VIEW_SHIPOUTWARD` int(5) DEFAULT NULL,
  `IS_DELETE` varchar(11) NOT NULL DEFAULT '0',
  `DELETE_REASON` varchar(111) DEFAULT NULL,
  `REMARK` varchar(111) DEFAULT NULL,
  `STATUS` varchar(111) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  `UPDATED_AT` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`BOOKING_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table jstar.booking_details: ~5 rows (approximately)
/*!40000 ALTER TABLE `booking_details` DISABLE KEYS */;
INSERT INTO `booking_details` (`BOOKING_ID`, `LR_NUMBER`, `CUSTOMER_ID`, `CUSTOMER`, `MOBILE`, `DELIVERY_TO`, `DELIVERY_MOBILE`, `FROM_PLACE`, `FROM_MOBILE`, `TO_PLACE`, `TO_MOBILE`, `FROM_PLACE_ID`, `TO_PLACE_ID`, `QUANTITY`, `QUANTITY_DETAILS`, `QTY_DESCRIPTION`, `PAYMENT_TYPE`, `TOTAL_AMOUNT`, `TRANSPORTATION_COST`, `LOADING_COST`, `ADDITIONAL_COST`, `GOODS_VALUE`, `DELIVERY_TYPE`, `NOTES`, `BOOKING_STAUTS`, `BOOKING_DATE`, `LAST_UPDATE_DATE`, `SHIPMENT_VIA`, `SHOW_IN_VIEW_SHIPOUTWARD`, `IS_DELETE`, `DELETE_REASON`, `REMARK`, `STATUS`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(24, 'ZH-20250418-001', '16', 'Sangili', '9384438060', 'Sankar', '9874563211', 'Coimbatore Branch', '1234567895', 'Erode', '3214569870', '24', '25', 7, '{"Box":"2","Cover":"5"}', '', 'PAID', 1000, 1000, 0, 0, 0, 'Office', NULL, 0, '2025-04-18', '2025-04-18', NULL, NULL, '0', NULL, NULL, '0', '2025-04-18 10:21:40', '2025-04-18 10:21:40'),
	(25, 'ZH-20250418-002', '20', 'Kamalesh', '7894561230', 'Ravi', '4567889554', 'Coimbatore Branch', '1234567895', 'Salem', '4567893123', '24', '26', 5, '{"Roll":"5"}', '', 'ACCOUNT', 500, 500, 0, 0, 0, 'DD', NULL, 0, '2025-04-18', '2025-04-18', NULL, NULL, '0', NULL, NULL, '0', '2025-04-18 10:41:43', '2025-04-18 10:41:43'),
	(26, 'ZH-20250418-003', '21', 'Abi', '6547893210', 'Thillai', '4566778955', 'Coimbatore Branch', '1234567895', 'Erode', '3214569870', '24', '25', 2, '{"Box":"2"}', '', 'TO_PAY', 200, 200, 0, 0, 0, 'Line', NULL, 0, '2025-04-18', '2025-04-18', NULL, NULL, '0', NULL, NULL, '0', '2025-04-18 10:50:43', '2025-04-18 10:50:43'),
	(27, 'ZH-20250418-004', '20', 'Kamalesh', '7894561230', 'Recevier', '4654654653', 'Coimbatore Branch', '1234567895', 'Erode', '3214569870', '24', '25', 2, '{"Box":"2"}', '', 'ACCOUNT', 200, 200, 0, 0, 0, 'Office', NULL, 0, '2025-04-18', '2025-04-18', NULL, NULL, '0', NULL, NULL, '0', '2025-04-18 12:32:06', '2025-04-18 12:32:06'),
	(28, 'ZH-20250418-005', '20', 'Kamalesh', '7894561230', 'dfgh', '1321465464', 'Coimbatore Branch', '1234567895', 'Salem', '4567893123', '24', '26', 2, '{"Box":"2"}', '', 'ACCOUNT', 500, 500, 0, 0, 0, 'Office', NULL, 0, '2025-04-18', '2025-04-18', NULL, NULL, '0', NULL, NULL, '0', '2025-04-18 12:37:28', '2025-04-18 12:37:28');
/*!40000 ALTER TABLE `booking_details` ENABLE KEYS */;

-- Dumping structure for table jstar.branch_account
CREATE TABLE IF NOT EXISTS `branch_account` (
  `BRANCH_ACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MONTH` varchar(111) DEFAULT NULL,
  `YEAR` varchar(11) DEFAULT NULL,
  `BRANCH_ID` varchar(111) DEFAULT NULL,
  `BOOKING_AMOUNT` varchar(111) DEFAULT NULL,
  `RECEIVED_AMOUNT` varchar(111) DEFAULT NULL,
  `BOOKING_PERCENTAGE` varchar(111) DEFAULT NULL,
  `RECEIVED_PERCENTAGE` varchar(111) DEFAULT NULL,
  `COMMISSION_AMOUNT` varchar(111) DEFAULT NULL,
  `BRANCH_EXPENSES` varchar(111) DEFAULT NULL,
  `COLLECTION_AMOUNT` varchar(111) DEFAULT NULL,
  `ADMIN_OUTSTANDING_AMOUNT` varchar(111) DEFAULT NULL,
  `PAID_AMOUNT` varchar(111) DEFAULT '0',
  `PAYMENT_TYPE` varchar(111) DEFAULT NULL,
  `NOTES` varchar(111) DEFAULT NULL,
  `STATUS` varchar(11) DEFAULT NULL,
  `ACCOUNTS_CANCEL_NOTE` varchar(111) DEFAULT NULL,
  `REQUESTED_AMOUNT` varchar(111) DEFAULT '0',
  `IS_REQUEST` varchar(111) NOT NULL DEFAULT '0',
  `IS_DELETE` varchar(11) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  `UPDATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`BRANCH_ACCOUNT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table jstar.branch_account: ~3 rows (approximately)
/*!40000 ALTER TABLE `branch_account` DISABLE KEYS */;
INSERT INTO `branch_account` (`BRANCH_ACCOUNT_ID`, `MONTH`, `YEAR`, `BRANCH_ID`, `BOOKING_AMOUNT`, `RECEIVED_AMOUNT`, `BOOKING_PERCENTAGE`, `RECEIVED_PERCENTAGE`, `COMMISSION_AMOUNT`, `BRANCH_EXPENSES`, `COLLECTION_AMOUNT`, `ADMIN_OUTSTANDING_AMOUNT`, `PAID_AMOUNT`, `PAYMENT_TYPE`, `NOTES`, `STATUS`, `ACCOUNTS_CANCEL_NOTE`, `REQUESTED_AMOUNT`, `IS_REQUEST`, `IS_DELETE`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(22, '4', '2025', '24', '1700', '0', '0', '0', '1700', '200.00', '1500.00', '1300', '1300', 'CASH', 'Cash Payment', '0', NULL, '0', '0', '0', '2025-04-18 12:17:22', '2025-04-18 12:17:22'),
	(23, '4', '2025', '25', '0.00', '1200.00', '15.00', '5.00', '60.00', '0.00', '200.00', '140.00', '0', NULL, NULL, '0', NULL, '0', '0', '0', '2025-04-18 12:17:22', '2025-04-18 12:17:22'),
	(24, '4', '2025', '26', '0.00', '500.00', '0.00', '0.00', '500.00', '100.00', '0.00', '-100.00', '0', NULL, NULL, '0', NULL, '0', '0', '0', '2025-04-18 12:17:22', '2025-04-18 12:17:22');
/*!40000 ALTER TABLE `branch_account` ENABLE KEYS */;

-- Dumping structure for table jstar.branch_details
CREATE TABLE IF NOT EXISTS `branch_details` (
  `BRANCH_OFFICE_ID` int(100) NOT NULL AUTO_INCREMENT,
  `BRANCH_NAME` varchar(5000) NOT NULL,
  `BRANCH_MOBILE` varchar(25) DEFAULT NULL,
  `ALTERNATIVE_MOBILE` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(5000) DEFAULT NULL,
  `PLACE` varchar(100) NOT NULL,
  `USER_NAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  `PAID_COMMISSION` varchar(111) DEFAULT NULL,
  `TOPAID_COMMISSION` varchar(111) DEFAULT NULL,
  `EXPENSE` varchar(111) DEFAULT NULL,
  `TOTAL_EXPENSE_AMOUNT` varchar(111) DEFAULT NULL,
  `STATUS` varchar(11) DEFAULT NULL,
  `ISAGENT` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`BRANCH_OFFICE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table jstar.branch_details: ~4 rows (approximately)
/*!40000 ALTER TABLE `branch_details` DISABLE KEYS */;
INSERT INTO `branch_details` (`BRANCH_OFFICE_ID`, `BRANCH_NAME`, `BRANCH_MOBILE`, `ALTERNATIVE_MOBILE`, `ADDRESS`, `PLACE`, `USER_NAME`, `PASSWORD`, `PAID_COMMISSION`, `TOPAID_COMMISSION`, `EXPENSE`, `TOTAL_EXPENSE_AMOUNT`, `STATUS`, `ISAGENT`) VALUES
	(1, 'ADMIN', '1234567890', '8976895345', 'CBE', 'Coimbatore', 'admin', 'admin123', '15', '5', NULL, NULL, NULL, '1'),
	(24, 'Coimbatore Branch', '1234567895', '', 'Gandhipuram', 'Coimbatore', 'cbe', 'cbe123', '0', '0', '[{"description":"Salary","amount":100},{"description":"Other","amount":100}]', '200', '0', '0'),
	(25, 'Erode', '3214569870', '', 'Erode', 'Erode', 'erode', 'erode123', '15', '5', '', '', '0', '1'),
	(26, 'Salem', '4567893123', '', 'Salem', 'Salem', 'salem', 'salem123', '0', '0', '[{"description":"Common Expenses","amount":100}]', '100', '0', '0');
/*!40000 ALTER TABLE `branch_details` ENABLE KEYS */;

-- Dumping structure for table jstar.branch_expenses
CREATE TABLE IF NOT EXISTS `branch_expenses` (
  `BRANCH_NAME` varchar(100) NOT NULL,
  `INCOME_COMMENTS` varchar(100) NOT NULL,
  `INCOME_AMOUNT` int(100) NOT NULL,
  `EXPENSE_COMMENTS` varchar(100) NOT NULL,
  `EXPENSE_AMOUNT` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table jstar.branch_expenses: ~0 rows (approximately)
/*!40000 ALTER TABLE `branch_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_expenses` ENABLE KEYS */;

-- Dumping structure for procedure jstar.CalculateBranchAccounts
DELIMITER //
CREATE PROCEDURE `CalculateBranchAccounts`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_year INT;
    DECLARE v_month INT;
    DECLARE v_branch_id INT;
    DECLARE v_booking_amount DECIMAL(10,2);
    DECLARE v_received_amount DECIMAL(10,2);
    DECLARE v_paid_percentage DECIMAL(5,2);
    DECLARE v_topaid_percentage DECIMAL(5,2);
    DECLARE v_commission_amount DECIMAL(10,2);
    DECLARE v_admin_outstanding_amount DECIMAL(10,2);
    DECLARE v_is_agent INT;
    DECLARE v_total_expense DECIMAL(10,2);
    DECLARE v_paid_and_account_amount DECIMAL(10,2);
    DECLARE v_topay_amount DECIMAL(10,2);
    DECLARE v_collection_amount DECIMAL(10,2);

    -- Cursor with YEAR + MONTH + BRANCH_ID from both FROM and TO place
    DECLARE cur CURSOR FOR 
        SELECT DISTINCT 
            EXTRACT(YEAR FROM BOOKING_DATE) AS year,
            EXTRACT(MONTH FROM BOOKING_DATE) AS month,
            branch_id
        FROM (
            SELECT FROM_PLACE_ID AS branch_id, BOOKING_DATE FROM booking_details
            UNION ALL
            SELECT TO_PLACE_ID AS branch_id, BOOKING_DATE FROM booking_details
        ) AS combined;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_year, v_month, v_branch_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Booking amount (FROM branch)
        SELECT IFNULL(SUM(TOTAL_AMOUNT), 0) INTO v_booking_amount
        FROM booking_details
        WHERE FROM_PLACE_ID = v_branch_id
        AND EXTRACT(MONTH FROM BOOKING_DATE) = v_month
        AND EXTRACT(YEAR FROM BOOKING_DATE) = v_year;

        -- Received amount (TO branch)
        SELECT IFNULL(SUM(TOTAL_AMOUNT), 0) INTO v_received_amount
        FROM booking_details
        WHERE TO_PLACE_ID = v_branch_id
        AND EXTRACT(MONTH FROM BOOKING_DATE) = v_month
        AND EXTRACT(YEAR FROM BOOKING_DATE) = v_year;

        -- Get branch details
        SELECT ISAGENT, PAID_COMMISSION, TOPAID_COMMISSION, IFNULL(TOTAL_EXPENSE_AMOUNT, 0)
        INTO v_is_agent, v_paid_percentage, v_topaid_percentage, v_total_expense
        FROM branch_details
        WHERE BRANCH_OFFICE_ID = v_branch_id;

        -- Calculate commission
        IF v_is_agent = 1 THEN
            SET v_commission_amount = 
                (v_booking_amount * v_paid_percentage / 100) +
                (v_received_amount * v_topaid_percentage / 100);
        ELSE
            SET v_paid_percentage = 0;
            SET v_topaid_percentage = 0;
            SET v_commission_amount = v_booking_amount + v_received_amount;
        END IF;

        -- Admin outstanding calculation
        SELECT IFNULL(SUM(TOTAL_AMOUNT), 0) INTO v_paid_and_account_amount
        FROM booking_details
        WHERE FROM_PLACE_ID = v_branch_id
        AND EXTRACT(MONTH FROM BOOKING_DATE) = v_month
        AND EXTRACT(YEAR FROM BOOKING_DATE) = v_year
        AND PAYMENT_TYPE IN ('PAID', 'ACCOUNT');

        SELECT IFNULL(SUM(TOTAL_AMOUNT), 0) INTO v_topay_amount
        FROM booking_details
        WHERE TO_PLACE_ID = v_branch_id
        AND EXTRACT(MONTH FROM BOOKING_DATE) = v_month
        AND EXTRACT(YEAR FROM BOOKING_DATE) = v_year
        AND PAYMENT_TYPE = 'TO_PAY';

        SET v_collection_amount = v_paid_and_account_amount + v_topay_amount;

        SET v_admin_outstanding_amount = v_collection_amount - v_commission_amount;

        IF v_is_agent = 0 THEN
            SET v_admin_outstanding_amount = v_collection_amount - v_total_expense;
        END IF;

        -- Insert or update branch_account with YEAR column
        INSERT INTO branch_account (
            YEAR,
            MONTH,
            BRANCH_ID,
            BOOKING_AMOUNT,
            RECEIVED_AMOUNT,
            BOOKING_PERCENTAGE,
            RECEIVED_PERCENTAGE,
            COMMISSION_AMOUNT,
            COLLECTION_AMOUNT,
            BRANCH_EXPENSES,
            ADMIN_OUTSTANDING_AMOUNT,
            STATUS,
            IS_DELETE,
            CREATED_AT
        ) VALUES (
            v_year,
            v_month,
            v_branch_id,
            v_booking_amount,
            v_received_amount,
            v_paid_percentage,
            v_topaid_percentage,
            v_commission_amount,
            v_collection_amount,
            v_total_expense,
            v_admin_outstanding_amount,
            0,
            0,
            NOW()
        )
        ON DUPLICATE KEY UPDATE
            BOOKING_AMOUNT = VALUES(BOOKING_AMOUNT),
            RECEIVED_AMOUNT = VALUES(RECEIVED_AMOUNT),
            BOOKING_PERCENTAGE = VALUES(BOOKING_PERCENTAGE),
            RECEIVED_PERCENTAGE = VALUES(RECEIVED_PERCENTAGE),
            COMMISSION_AMOUNT = VALUES(COMMISSION_AMOUNT),
            COLLECTION_AMOUNT = VALUES(COLLECTION_AMOUNT),
            BRANCH_EXPENSES = VALUES(BRANCH_EXPENSES),
            ADMIN_OUTSTANDING_AMOUNT = VALUES(ADMIN_OUTSTANDING_AMOUNT),
            STATUS = 0,
            IS_DELETE = 0,
            UPDATED_AT = NOW();
    END LOOP;

    CLOSE cur;
END//
DELIMITER ;

-- Dumping structure for table jstar.city
CREATE TABLE IF NOT EXISTS `city` (
  `CITY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`CITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table jstar.city: ~6 rows (approximately)
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`CITY_ID`, `CITY_NAME`) VALUES
	(1, 'Coimbatore'),
	(6, 'Chennai'),
	(7, 'Erode'),
	(12, 'Salem'),
	(21, 'Dindigul'),
	(23, 'Theni');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- Dumping structure for table jstar.customer_account
CREATE TABLE IF NOT EXISTS `customer_account` (
  `CUSTOMER_ACCOUNT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BRANCH_ID` varchar(11) DEFAULT NULL,
  `CUSTOMER_ID` varchar(11) DEFAULT NULL,
  `CUSTOMER_NAME` varchar(111) DEFAULT NULL,
  `OUTSTANDING_AMOUNT` bigint(20) DEFAULT NULL,
  `PAID_AMOUNT` bigint(20) DEFAULT 0,
  `PAYMENT_TYPE` varchar(111) DEFAULT NULL,
  `NOTES` varchar(111) DEFAULT NULL,
  `STATUS` varchar(11) DEFAULT NULL,
  `IS_DELETE` varchar(11) DEFAULT '0',
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  `UPDATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CUSTOMER_ACCOUNT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table jstar.customer_account: ~1 rows (approximately)
/*!40000 ALTER TABLE `customer_account` DISABLE KEYS */;
INSERT INTO `customer_account` (`CUSTOMER_ACCOUNT_ID`, `BRANCH_ID`, `CUSTOMER_ID`, `CUSTOMER_NAME`, `OUTSTANDING_AMOUNT`, `PAID_AMOUNT`, `PAYMENT_TYPE`, `NOTES`, `STATUS`, `IS_DELETE`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(4, NULL, '20', NULL, 500, 100, NULL, NULL, NULL, '0', '2025-04-18 12:37:28', '2025-04-18 12:37:28');
/*!40000 ALTER TABLE `customer_account` ENABLE KEYS */;

-- Dumping structure for table jstar.customer_details
CREATE TABLE IF NOT EXISTS `customer_details` (
  `CUSTOMER_ID` int(100) NOT NULL AUTO_INCREMENT,
  `BRANCH_ID` varchar(11) DEFAULT NULL,
  `CUSTOMER_NAME` varchar(500) NOT NULL,
  `MOBILE` varchar(50) DEFAULT NULL,
  `IS_ACCOUNT` varchar(11) DEFAULT '0',
  `STATUS` varchar(11) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  `UPDATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table jstar.customer_details: ~3 rows (approximately)
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
INSERT INTO `customer_details` (`CUSTOMER_ID`, `BRANCH_ID`, `CUSTOMER_NAME`, `MOBILE`, `IS_ACCOUNT`, `STATUS`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(18, '24', 'Sangili', '9384438060', '0', '0', '2025-04-18 10:21:40', '2025-04-18 10:21:40'),
	(20, '24', 'Kamalesh', '7894561230', '1', NULL, '2025-04-18 10:41:43', '2025-04-18 10:41:43'),
	(21, '24', 'Abi', '6547893210', '0', NULL, '2025-04-18 10:50:43', '2025-04-18 10:50:43');
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;

-- Dumping structure for table jstar.customer_transaction
CREATE TABLE IF NOT EXISTS `customer_transaction` (
  `TRANSACTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BRANCH_ID` varchar(11) DEFAULT NULL,
  `CUSTOMER_ID` varchar(11) DEFAULT NULL,
  `BALANCE_AMOUNT` varchar(111) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(111) DEFAULT NULL,
  `PAID_AMOUNT` varchar(111) DEFAULT NULL,
  `NEW_BALANCE` varchar(111) DEFAULT NULL,
  `NOTES` varchar(111) DEFAULT NULL,
  `STATUS` varchar(11) DEFAULT NULL,
  `IS_DELETE` varchar(11) NOT NULL DEFAULT '0',
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  `UPDATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TRANSACTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table jstar.customer_transaction: ~2 rows (approximately)
/*!40000 ALTER TABLE `customer_transaction` DISABLE KEYS */;
INSERT INTO `customer_transaction` (`TRANSACTION_ID`, `BRANCH_ID`, `CUSTOMER_ID`, `BALANCE_AMOUNT`, `PAYMENT_TYPE`, `PAID_AMOUNT`, `NEW_BALANCE`, `NOTES`, `STATUS`, `IS_DELETE`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(1, '3', '9', '199', 'Cash', '20', '179.00', 'cash to Direct', '0', '0', '2025-04-17 09:14:24', '2025-04-17 09:14:24'),
	(2, '3', '9', '179', 'Online', '30', '149.00', 'Gapy', '0', '0', '2025-04-17 09:14:48', '2025-04-17 09:14:48'),
	(3, NULL, '20', '500', 'Cash', '100', '400.00', 'asdsad', '0', '0', '2025-04-18 13:08:02', '2025-04-18 13:08:02');
/*!40000 ALTER TABLE `customer_transaction` ENABLE KEYS */;

-- Dumping structure for table jstar.delivery_customer_details
CREATE TABLE IF NOT EXISTS `delivery_customer_details` (
  `DELIVERY_CUSTOMER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CUSTOMER_NAME` varchar(500) DEFAULT NULL,
  `MOBILE` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`DELIVERY_CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table jstar.delivery_customer_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `delivery_customer_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_customer_details` ENABLE KEYS */;

-- Dumping structure for table jstar.driver_details
CREATE TABLE IF NOT EXISTS `driver_details` (
  `DRIVER_ID` int(100) NOT NULL AUTO_INCREMENT,
  `DRIVER_NAME` varchar(500) NOT NULL,
  `MOBILE` varchar(50) DEFAULT NULL,
  `LICENSE` varchar(100) DEFAULT NULL,
  `DRIVER_IMAGE` longblob DEFAULT NULL,
  `DOCUMENT` varchar(111) DEFAULT NULL,
  `VEHICLE_NUMBER` varchar(111) DEFAULT NULL,
  `VEHICLE_DESCRIPTION` varchar(111) DEFAULT NULL,
  `ADVANCE_AMOUNT` varchar(111) DEFAULT NULL,
  PRIMARY KEY (`DRIVER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table jstar.driver_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `driver_details` DISABLE KEYS */;
INSERT INTO `driver_details` (`DRIVER_ID`, `DRIVER_NAME`, `MOBILE`, `LICENSE`, `DRIVER_IMAGE`, `DOCUMENT`, `VEHICLE_NUMBER`, `VEHICLE_DESCRIPTION`, `ADVANCE_AMOUNT`) VALUES
	(13, 'Diwager', '4656544646', 'TN66SD454545', NULL, NULL, 'TB66AS4545', 'Tata Ace', '100');
/*!40000 ALTER TABLE `driver_details` ENABLE KEYS */;

-- Dumping structure for table jstar.hub
CREATE TABLE IF NOT EXISTS `hub` (
  `HUB_ID` int(11) NOT NULL AUTO_INCREMENT,
  `HUB_NAME` varchar(111) DEFAULT NULL,
  `HUB_MOBILE` varchar(111) DEFAULT NULL,
  `HUB_ADDRESS` varchar(111) DEFAULT NULL,
  `STATUS` varchar(11) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  `UPDATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`HUB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table jstar.hub: ~2 rows (approximately)
/*!40000 ALTER TABLE `hub` DISABLE KEYS */;
INSERT INTO `hub` (`HUB_ID`, `HUB_NAME`, `HUB_MOBILE`, `HUB_ADDRESS`, `STATUS`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(1, 'Coimbatore', '5675666666', 'test', NULL, '2025-04-11 00:53:49', '2025-04-11 00:53:49'),
	(3, 'Erode', '984598749', 'test2', '0', '2025-04-13 22:13:37', '2025-04-13 22:13:37');
/*!40000 ALTER TABLE `hub` ENABLE KEYS */;

-- Dumping structure for table jstar.items
CREATE TABLE IF NOT EXISTS `items` (
  `ITEM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEM_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table jstar.items: ~3 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`ITEM_ID`, `ITEM_NAME`) VALUES
	(11, 'Box'),
	(12, 'Cover'),
	(13, 'Roll');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table jstar.lr_number
CREATE TABLE IF NOT EXISTS `lr_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `BOOKING_ID` varchar(111) DEFAULT NULL,
  `DATE` varchar(111) DEFAULT NULL,
  `LR_NUMBER` varchar(111) DEFAULT NULL,
  `STATUS` varchar(11) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  `UPDATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table jstar.lr_number: ~7 rows (approximately)
/*!40000 ALTER TABLE `lr_number` DISABLE KEYS */;
INSERT INTO `lr_number` (`id`, `BOOKING_ID`, `DATE`, `LR_NUMBER`, `STATUS`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(2, NULL, '2025-04-10', '005', '0', '2025-04-10 06:09:29', '2025-04-10 06:09:29'),
	(3, NULL, '2025-04-11', '002', '0', '2025-04-11 05:54:28', '2025-04-11 05:54:28'),
	(4, NULL, '2025-04-12', '001', '0', '2025-04-12 05:34:38', '2025-04-12 05:34:38'),
	(5, NULL, '2025-04-14', '006', '0', '2025-04-13 23:14:02', '2025-04-13 23:14:02'),
	(6, NULL, '2025-04-15', '007', '0', '2025-04-15 05:55:15', '2025-04-15 05:55:15'),
	(7, NULL, '2025-04-17', '008', '0', '2025-04-17 05:25:24', '2025-04-17 05:25:24'),
	(8, NULL, '2025-04-18', '005', '0', '2025-04-18 10:21:40', '2025-04-18 10:21:40');
/*!40000 ALTER TABLE `lr_number` ENABLE KEYS */;

-- Dumping structure for table jstar.shipment_details
CREATE TABLE IF NOT EXISTS `shipment_details` (
  `SHIPMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BOOKING_ID` int(100) NOT NULL,
  `SHIPMENT_1_DATE` date DEFAULT NULL COMMENT 'To CBE Hub',
  `SHIPMENT_1_DATE_TIME` datetime DEFAULT NULL,
  `DRIVER_1_DETAILS` mediumtext DEFAULT NULL,
  `SHIPMENT_2_DATE` date DEFAULT NULL COMMENT 'CBE Hub To Destination',
  `SHIPMENT_2_DATE_TIME` datetime DEFAULT NULL,
  `DRIVER_2_DETAILS` mediumtext DEFAULT NULL,
  PRIMARY KEY (`SHIPMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Track the Shipement flow for every booking \r\nreference table - booking_details (booking_id)';

-- Dumping data for table jstar.shipment_details: ~10 rows (approximately)
/*!40000 ALTER TABLE `shipment_details` DISABLE KEYS */;
INSERT INTO `shipment_details` (`SHIPMENT_ID`, `BOOKING_ID`, `SHIPMENT_1_DATE`, `SHIPMENT_1_DATE_TIME`, `DRIVER_1_DETAILS`, `SHIPMENT_2_DATE`, `SHIPMENT_2_DATE_TIME`, `DRIVER_2_DETAILS`) VALUES
	(3, 4, '2023-12-31', '2023-12-31 13:35:00', '{"DRIVER_NAME":"Srini","DRIVER_MOBILE":"456789912","VECHILE":"TATA ACE"}', NULL, NULL, NULL),
	(4, 2, '2025-04-05', '2025-04-05 16:49:00', '{"DRIVER_NAME":"Srini","DRIVER_MOBILE":"456789912","VECHILE":"drftgyhujk"}', '2025-04-05', '2025-04-05 16:50:00', '{"DRIVER_NAME":"Srini","DRIVER_MOBILE":"456789912","VECHILE":"sdxfcgvhbnjm"}'),
	(5, 9, '2025-04-11', '2025-04-11 12:20:00', '{"DRIVER_NAME":"Srini","DRIVER_MOBILE":"4567899123","VECHILE":"876678"}', NULL, NULL, NULL),
	(7, 18, '2025-04-11', '2025-04-11 18:09:00', '{"DRIVER_NAME":"Srini","DRIVER_MOBILE":"4567899123","VECHILE":"876678ww"}', NULL, NULL, NULL),
	(8, 8, '2025-04-11', '2025-04-11 18:43:00', '{"DRIVER_NAME":"Srini","DRIVER_MOBILE":"4567899123","VECHILE":"fwer"}', NULL, NULL, NULL),
	(9, 4, '2025-04-12', '2025-04-12 11:50:00', '{"DRIVER_NAME":"Test","DRIVER_MOBILE":"8765434567","VECHILE":"dfvdv33"}', NULL, NULL, NULL),
	(10, 5, '2025-04-12', '2025-04-12 15:41:00', '{"DRIVER_NAME":"Srini","DRIVER_MOBILE":"4567899123","VECHILE":"poiujjh"}', NULL, NULL, NULL),
	(11, 2, '2025-04-15', '2025-04-15 10:56:00', '{"DRIVER_NAME":"Srini","DRIVER_MOBILE":"4567899124","VECHILE":"876678"}', NULL, NULL, NULL),
	(12, 14, '2025-04-15', '2025-04-15 18:24:00', '{"DRIVER_NAME":"Diwager","DRIVER_MOBILE":"4656544646","VECHILE":"Tata Ace"}', NULL, NULL, NULL),
	(13, 12, '2025-04-15', '2025-04-15 18:24:00', '{"DRIVER_NAME":"Diwager","DRIVER_MOBILE":"4656544646","VECHILE":"Tata Ace"}', NULL, NULL, NULL);
/*!40000 ALTER TABLE `shipment_details` ENABLE KEYS */;

-- Dumping structure for table jstar.shipoutward_details
CREATE TABLE IF NOT EXISTS `shipoutward_details` (
  `BOOKING_ID` int(10) NOT NULL,
  `DRIVER_NAME` varchar(100) NOT NULL,
  `DRIVER_MOBILE` varchar(100) NOT NULL,
  `VECHILE` varchar(100) NOT NULL,
  `OUTWARD_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table jstar.shipoutward_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `shipoutward_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipoutward_details` ENABLE KEYS */;

-- Dumping structure for table jstar.term_condition
CREATE TABLE IF NOT EXISTS `term_condition` (
  `term_id` int(11) NOT NULL,
  `term` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table jstar.term_condition: ~0 rows (approximately)
/*!40000 ALTER TABLE `term_condition` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_condition` ENABLE KEYS */;

-- Dumping structure for table jstar.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `TRANSACTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BRANCH_ACCOUNT_ID` varchar(11) DEFAULT NULL,
  `REQUEST_AMOUNT` varchar(11) DEFAULT NULL,
  `PAYMENT_TYPE` varchar(11) DEFAULT NULL,
  `NOTES` varchar(111) DEFAULT NULL,
  `STATUS` varchar(11) DEFAULT NULL,
  `IS_DELETE` varchar(11) NOT NULL DEFAULT '0',
  `CREATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  `UPDATED_AT` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`TRANSACTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table jstar.transactions: ~10 rows (approximately)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` (`TRANSACTION_ID`, `BRANCH_ACCOUNT_ID`, `REQUEST_AMOUNT`, `PAYMENT_TYPE`, `NOTES`, `STATUS`, `IS_DELETE`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(1, '18', '222', 'CASH', 'test', '0', '0', '2025-04-15 04:13:40', '2025-04-15 04:13:40'),
	(2, '18', '100', 'ONLINE', 'test', '0', '0', '2025-04-15 04:16:22', '2025-04-15 04:16:22'),
	(3, '18', '100', 'CASH', 'test', '0', '0', '2025-04-15 04:16:36', '2025-04-15 04:16:36'),
	(4, '18', '100', 'ONLINE', 'test', '0', '0', '2025-04-15 04:17:15', '2025-04-15 04:17:15'),
	(5, '19', '80', 'ONLINE', 'GPay Tran No 1234', '0', '0', '2025-04-15 13:35:35', '2025-04-15 13:35:35'),
	(6, '20', '10', 'CASH', '', '0', '0', '2025-04-15 14:17:04', '2025-04-15 14:17:04'),
	(7, '20', '10', 'CASH', '', '0', '0', '2025-04-15 14:23:37', '2025-04-15 14:23:37'),
	(8, '19', '85', 'ONLINE', 'GPay Tran No 1234', '0', '0', '2025-04-17 03:54:12', '2025-04-17 03:54:12'),
	(9, '22', '300', 'ONLINE', 'Gpay Trans #GTR12344', '0', '0', '2025-04-18 12:24:53', '2025-04-18 12:24:53'),
	(10, '22', '1000', 'CASH', 'Cash Payment', '0', '0', '2025-04-18 12:26:07', '2025-04-18 12:26:07');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for table jstar.vehicle_maintenance
CREATE TABLE IF NOT EXISTS `vehicle_maintenance` (
  `VEHICLE_NUMEBER` varchar(100) NOT NULL,
  `DRIVER_NAME` varchar(100) NOT NULL,
  `COMMENTS` varchar(5000) DEFAULT NULL,
  `AMOUNT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table jstar.vehicle_maintenance: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_maintenance` ENABLE KEYS */;

-- Dumping structure for view jstar.v_account
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_account` (
	`FROM_PLACE` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`ACCOUNT` INT(50) NULL,
	`BOOKING_DATE` DATE NULL
) ENGINE=MyISAM;

-- Dumping structure for view jstar.v_branch_accounts
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_branch_accounts` (
	`BRANCH_ACCOUNT_ID` INT(11) NOT NULL,
	`MONTH` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`YEAR` VARCHAR(11) NULL COLLATE 'utf8mb4_general_ci',
	`BRANCH_ID` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`BOOKING_AMOUNT` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`RECEIVED_AMOUNT` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`BOOKING_PERCENTAGE` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`RECEIVED_PERCENTAGE` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`COMMISSION_AMOUNT` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`BRANCH_EXPENSES` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`COLLECTION_AMOUNT` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`ADMIN_OUTSTANDING_AMOUNT` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`PAID_AMOUNT` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`STATUS` VARCHAR(11) NULL COLLATE 'utf8mb4_general_ci',
	`PAYMENT_TYPE` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`NOTES` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`ACCOUNTS_CANCEL_NOTE` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`REQUESTED_AMOUNT` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`IS_REQUEST` VARCHAR(111) NOT NULL COLLATE 'utf8mb4_general_ci',
	`IS_DELETE` VARCHAR(11) NULL COLLATE 'utf8mb4_general_ci',
	`CREATED_AT` TIMESTAMP NOT NULL,
	`UPDATED_AT` TIMESTAMP NOT NULL,
	`BALANCE` DOUBLE NULL,
	`BRANCH_NAME` VARCHAR(5000) NULL COLLATE 'utf8mb4_general_ci',
	`BRANCH_MOBILE` VARCHAR(25) NULL COLLATE 'utf8mb4_general_ci',
	`ALTERNATIVE_MOBILE` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`PLACE` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`USER_NAME` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`PASSWORD` VARCHAR(100) NULL COLLATE 'utf8mb4_general_ci',
	`PAID_COMMISSION` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`TOPAID_COMMISSION` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci',
	`ADDRESS` VARCHAR(5000) NULL COLLATE 'utf8mb4_general_ci',
	`TOTAL_EXPENSE_AMOUNT` VARCHAR(111) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for view jstar.v_customer_account
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_customer_account` (
	`CUSTOMER_ACCOUNT_ID` INT(11) NOT NULL,
	`CUSTOMER_ID` VARCHAR(11) NULL COLLATE 'utf8mb4_general_ci',
	`CUSTOMER_NAME` VARCHAR(500) NOT NULL COLLATE 'utf8mb4_general_ci',
	`MOBILE` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`BRANCH_NAME` VARCHAR(5000) NOT NULL COLLATE 'utf8mb4_general_ci',
	`OUTSTANDING_AMOUNT` BIGINT(20) NULL,
	`PAID_AMOUNT` BIGINT(20) NULL,
	`BALANCE` BIGINT(21) NULL
) ENGINE=MyISAM;

-- Dumping structure for view jstar.v_paid
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_paid` (
	`FROM_PLACE` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`PAID` INT(50) NULL,
	`BOOKING_DATE` DATE NULL
) ENGINE=MyISAM;

-- Dumping structure for view jstar.v_to_pay
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_to_pay` (
	`FROM_PLACE` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`TO_PAY` INT(50) NULL,
	`BOOKING_DATE` DATE NULL
) ENGINE=MyISAM;

-- Dumping structure for table jstar.workflow_details
CREATE TABLE IF NOT EXISTS `workflow_details` (
  `STATUS_CODE` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table jstar.workflow_details: ~4 rows (approximately)
/*!40000 ALTER TABLE `workflow_details` DISABLE KEYS */;
INSERT INTO `workflow_details` (`STATUS_CODE`, `DESCRIPTION`) VALUES
	('0', 'BOOKED/READY TO SHIP'),
	('1', 'SHIPPED TO CBE HUB'),
	('2', 'REACHED TO DESTINATION'),
	('3', 'OUT FOR DELIVERY');
/*!40000 ALTER TABLE `workflow_details` ENABLE KEYS */;

-- Dumping structure for view jstar.v_account
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_account`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_account` AS SELECT `booking_details`.`FROM_PLACE` AS `FROM_PLACE`, `booking_details`.`TOTAL_AMOUNT` AS `ACCOUNT`, `booking_details`.`BOOKING_DATE` AS `BOOKING_DATE` FROM `booking_details` WHERE `booking_details`.`PAYMENT_TYPE` = 'ACCOUNT' ;

-- Dumping structure for view jstar.v_branch_accounts
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_branch_accounts`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_branch_accounts` AS SELECT `ba`.`BRANCH_ACCOUNT_ID` AS `BRANCH_ACCOUNT_ID`, `ba`.`MONTH` AS `MONTH`, `ba`.`YEAR` AS `YEAR`, `ba`.`BRANCH_ID` AS `BRANCH_ID`, `ba`.`BOOKING_AMOUNT` AS `BOOKING_AMOUNT`, `ba`.`RECEIVED_AMOUNT` AS `RECEIVED_AMOUNT`, `ba`.`BOOKING_PERCENTAGE` AS `BOOKING_PERCENTAGE`, `ba`.`RECEIVED_PERCENTAGE` AS `RECEIVED_PERCENTAGE`, `ba`.`COMMISSION_AMOUNT` AS `COMMISSION_AMOUNT`, `ba`.`BRANCH_EXPENSES` AS `BRANCH_EXPENSES`, `ba`.`COLLECTION_AMOUNT` AS `COLLECTION_AMOUNT`, `ba`.`ADMIN_OUTSTANDING_AMOUNT` AS `ADMIN_OUTSTANDING_AMOUNT`, `ba`.`PAID_AMOUNT` AS `PAID_AMOUNT`, `ba`.`STATUS` AS `STATUS`, `ba`.`PAYMENT_TYPE` AS `PAYMENT_TYPE`, `ba`.`NOTES` AS `NOTES`, `ba`.`ACCOUNTS_CANCEL_NOTE` AS `ACCOUNTS_CANCEL_NOTE`, `ba`.`REQUESTED_AMOUNT` AS `REQUESTED_AMOUNT`, `ba`.`IS_REQUEST` AS `IS_REQUEST`, `ba`.`IS_DELETE` AS `IS_DELETE`, `ba`.`CREATED_AT` AS `CREATED_AT`, `ba`.`UPDATED_AT` AS `UPDATED_AT`, CASE WHEN `ba`.`ADMIN_OUTSTANDING_AMOUNT` < 0 THEN `ba`.`ADMIN_OUTSTANDING_AMOUNT`+ `ba`.`PAID_AMOUNT` WHEN `ba`.`ADMIN_OUTSTANDING_AMOUNT` > 0 THEN `ba`.`ADMIN_OUTSTANDING_AMOUNT`- `ba`.`PAID_AMOUNT` ELSE 0 END AS `BALANCE`, `bd`.`BRANCH_NAME` AS `BRANCH_NAME`, `bd`.`BRANCH_MOBILE` AS `BRANCH_MOBILE`, `bd`.`ALTERNATIVE_MOBILE` AS `ALTERNATIVE_MOBILE`, `bd`.`PLACE` AS `PLACE`, `bd`.`USER_NAME` AS `USER_NAME`, `bd`.`PASSWORD` AS `PASSWORD`, `bd`.`PAID_COMMISSION` AS `PAID_COMMISSION`, `bd`.`TOPAID_COMMISSION` AS `TOPAID_COMMISSION`, `bd`.`ADDRESS` AS `ADDRESS`, `bd`.`TOTAL_EXPENSE_AMOUNT` AS `TOTAL_EXPENSE_AMOUNT` FROM (`branch_account` `ba` left join `branch_details` `bd` on(`ba`.`BRANCH_ID` = `bd`.`BRANCH_OFFICE_ID`)) WHERE `ba`.`IS_DELETE` = 0 ;

-- Dumping structure for view jstar.v_customer_account
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_customer_account`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_customer_account` AS SELECT 
    ca.CUSTOMER_ACCOUNT_ID,
    ca.CUSTOMER_ID,
    cd.CUSTOMER_NAME,
    cd.MOBILE,
    bd.BRANCH_NAME,
    ca.OUTSTANDING_AMOUNT,
    ca.PAID_AMOUNT,
    (ca.OUTSTANDING_AMOUNT - ca.PAID_AMOUNT) AS BALANCE
FROM 
    customer_account ca
JOIN 
    customer_details cd ON ca.CUSTOMER_ID = cd.CUSTOMER_ID
JOIN 
    branch_details bd ON cd.BRANCH_ID = bd.BRANCH_OFFICE_ID
WHERE 
    cd.IS_ACCOUNT = 1 ;

-- Dumping structure for view jstar.v_paid
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_paid`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_paid` AS SELECT `booking_details`.`FROM_PLACE` AS `FROM_PLACE`, `booking_details`.`TOTAL_AMOUNT` AS `PAID`, `booking_details`.`BOOKING_DATE` AS `BOOKING_DATE` FROM `booking_details` WHERE `booking_details`.`PAYMENT_TYPE` = 'PAID' ;

-- Dumping structure for view jstar.v_to_pay
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_to_pay`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_to_pay` AS SELECT `booking_details`.`FROM_PLACE` AS `FROM_PLACE`, `booking_details`.`TOTAL_AMOUNT` AS `TO_PAY`, `booking_details`.`BOOKING_DATE` AS `BOOKING_DATE` FROM `booking_details` WHERE `booking_details`.`PAYMENT_TYPE` = 'TO_PAY' ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
