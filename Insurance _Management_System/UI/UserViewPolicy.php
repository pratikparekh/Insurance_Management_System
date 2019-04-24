<!DOCTYPE html>
<html>
<head>
    <title>Display Policies</title>

</head>
<body>

<?php
$servername = "fall2018databaseparekh.cbskcsxbgaol.us-east-2.rds.amazonaws.com";
$username = "pratikparekh217";
$password = "g2k1a0p7s9p6";
$dbname = "Insurance_Management";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
if (isset($_POST['View_policies'])) {
    $policies = mysqli_query($conn, "SELECT * FROM Policy");
?>
    <table align="center" border="1px" style="width:600px; line-height:40px;">
        <tr>
            <th colspan="8"><h2>Policies details</h2></th>
        </tr>
        <t>
            <th>Policy ID</th>
            <th>Policy name</th>
            <th>Policy Description</th>
            <th>Premium</th>
            <th>Coverage</th>
            <th>Policy period</th>
            <th>Policy Type</th>
        </t>
        </tr>

<?php
        while ($row = mysqli_fetch_array($policies)) {
        if ($row['Policy_id'] != null) {

            echo "<tr><td>" . $row["Policy_id"] . "</td><td>" . $row["Policy_name"] . "</td>
                           <td>" . $row["Description"] . "</td>
                           <td>" . $row["Premium"] . "</td>
                           <td>" . $row["Coverage"] . "</td>
                           <td>" . $row["Years"] . "</td>
                           <td>" . $row["Policy_type"] . "</td></tr>";
        }
    }
        echo "</table>";

}
?>
    </table>
<?php
if (isset($_POST['View_agents'])) {
    $agents = mysqli_query($conn, "select e.Username as Agents,em.Username as Managers
from Employee e, Employee em where e.Manager_id=em.Employee_id; ");
    ?>
    <table align="center" border="1px" style="width:600px; line-height:40px;">
<tr>
    <th colspan="8"><h2>Agents under each Managers</h2></th>
</tr>
    <t>
 <th>Agent's Username</th>
 <th>Manager username</th>

    </t>
 </tr>

    <?php
    while ($row = mysqli_fetch_array($agents)) {
        if ($row['Agents'] != null) {

            echo "<tr><td>" . $row["Agents"] . "</td> <td>" . $row["Managers"] . "</td></tr>";


        }
    }
    echo "</table>";

}
?>
</table>
<?php
if (isset($_POST['View_customers_under_agents'])) {
    $customers = mysqli_query($conn, "Select c.Customer_username, e.Username as Agent_Username from CustomerAgent c inner join Employee e
where c.Agent_employee_id=e.Employee_id; ");
    ?>
        <table align="center" border="1px" style="width:600px; line-height:40px;">
            <tr>
                <th colspan="8"><h2>Customers under each Agent</h2></th>
            </tr>
            <t>
                <th>Customer's Username</th>
                <th>Agent username</th>

            </t>
            </tr>

            <?php
            while ($row = mysqli_fetch_array($customers)) {
                if ($row['Customer_username'] != null) {

                    echo "<tr><td>" . $row["Customer_username"] . "</td> <td>" . $row["Agent_Username"] . "</td></tr>";


                }
            }
            echo "</table>";


            }
            ?>
        </table>
<?php

            if (isset($_POST['View_Claims'])) {
            $claims = mysqli_query($conn, "Select c.Claim_id,c.Policy_Number,c.Status,c.Description,c.Amount,e.Username
from Claims c inner join Employee e where c.Approved_by=e.Employee_id; ;");
            ?>
            <table align="center" border="1px" style="width:600px; line-height:40px;">
                <tr>
                    <th colspan="8"><h2>Claim details</h2></th>
                </tr>
                <t>
                    <th>Claim ID</th>
                    <th>Policy Number</th>
                    <th>Status</th>
                    <th>Description</th>
                    <th>Amount</th>
                    <th>Approved by</th>
                </t>
                </tr>

                <?php
                while ($row = mysqli_fetch_array($claims)) {
                    if ($row['Claim_id'] != null) {

                        echo "<tr><td>" . $row["Claim_id"] . "</td><td>" . $row["Policy_Number"] . "</td>
                           <td>" . $row["Status"] . "</td>
                           <td>" . $row["Description"] . "</td>
                           <td>" . $row["Amount"] . "</td>
                           <td>" . $row["Username"] . "</td>
                          </tr>";
                    }
                }
                echo "</table>";

                }
                ?>
            </table>
<?php

if (isset($_POST['View_Claims_customer'])) {
$Customer_username = $_POST['Customer_username'];
$claims_cus= mysqli_query($conn, "Select cp.Customer_username, c.Claim_id,c.Policy_Number,c.Status,c.Description,c.Amount,e.Username 
from Claims c inner join Employee e inner join CustomerPolicy cp 
where c.Approved_by=e.Employee_id and c.Policy_Number=cp.Policy_Number and Customer_username='$Customer_username' ;");
?>
<table align="center" border="1px" style="width:600px; line-height:40px;">
    <tr>
        <th colspan="8"><h2>Claim details</h2></th>
    </tr>
    <t>
        <th>Customer name</th>
        <th>Claim ID</th>
        <th>Policy Number</th>
        <th>Status</th>
        <th>Description</th>
        <th>Amount</th>
        <th>Approved by</th>
    </t>
    </tr>

    <?php
                while ($row = mysqli_fetch_array($claims_cus)) {
                    if ($row['Claim_id'] != null) {

                        echo "<tr><td>" . $row["Customer_username"] . "</td><td>" . $row["Claim_id"] . "</td><td>" . $row["Policy_Number"] . "</td>
                           <td>" . $row["Status"] . "</td>
                           <td>" . $row["Description"] . "</td>
                           <td>" . $row["Amount"] . "</td>
                           <td>" . $row["Username"] . "</td>
                          </tr>";
                    }
                }
                echo "</table>";

                }
                ?>
</table>
<?php

if (isset($_POST['View_Transactions'])) {
$transaction = mysqli_query($conn, "Select * from Transactions;");
?>
<table align="center" border="1px" style="width:600px; line-height:40px;">
    <tr>
        <th colspan="8"><h2>Transaction details</h2></th>
    </tr>
    <t>
        <th>Transaction ID</th>
        <th>Policy Number</th>
        <th>Description</th>
        <th>Amount</th>
        <th>Date</th>
    </t>
    </tr>

    <?php
    while ($row = mysqli_fetch_array($transaction)) {
        if ($row['Transaction_id'] != null) {

            echo "<tr><td>" . $row["Transaction_id"] . "</td><td>" . $row["Policy_Number"] . "</td>                         
                           <td>" . $row["Description"] . "</td>
                           <td>" . $row["Amount"] . "</td>
                           <td>" . $row["Date"] . "</td>
                          </tr>";
        }
    }
    echo "</table>";

    }
    ?>
</table>

    <?php

if (isset($_POST['Claim_status'])) {
    $claim_id = $_POST['claim_id'];
    $manager_id = $_POST['mid'];
    $change_status = $_POST['change_status'];
    $query2 = "UPDATE Claims set Status='$change_status' , Approved_by='$manager_id' where Claim_id=$claim_id";
    if(mysqli_query($conn,$query2)){
        echo "CLAIM STATUS UPDATED SUCCESFULLY";


    }
        }
    ?>
</table>
<?php
if (isset($_POST['View_Customer_Policies'])) {
    $Customer_name = $_POST['Customer_name'];
    $Customer_claims= mysqli_query($conn, "SELECT c.Policy_Number, c.Policy_id, cp.Purchase_date ,cp.Start_date,cp.End_date from
CustomerPolicy c inner join CustomerPolicyDetails cp using (Policy_Number)
where c.Customer_username='$Customer_name'");
if (!$Customer_claims) {
    printf("Error: %s\n", mysqli_error($conn));
    exit();
}
    ?>
<table align="center" border="1px" style="width:600px; line-height:40px;">
    <tr>
        <th colspan="8"><h2>My policy details</h2></th>
    </tr>
    <t>
        <th>Policy Number</th>
        <th>Policy ID</th>
        <th>Purchase date</th>
        <th>Start Date</th>
        <th>End Date</th>
    </t>
    </tr>

    <?php
    while ($row = mysqli_fetch_array($Customer_claims)) {
        if ($row['Policy_Number'] != null) {

            echo "<tr><td>" . $row["Policy_Number"] . "</td><td>" . $row["Policy_id"] . "</td>                         
                           <td>" . $row["Purchase_date"] . "</td>
                           <td>" . $row["Start_date"] . "</td>
                           <td>" . $row["End_date"] . "</td>
                          </tr>";
        }
    }
    echo "</table>";


    }
    ?>
</table>
<?php
if (isset($_POST['GetAgentCommission'])) {
    $Agent_name = $_POST['Agent_name'];
    $Agent_Commission= mysqli_query($conn, "Call Commission_details('$Agent_name')");

if (!$Agent_Commission) {
    printf("Error: %s\n", mysqli_error($conn));
    exit();

}
    ?>
    <table align="center" border="1px" style="width:600px; line-height:40px;">
        <tr>
            <th colspan="8"><h2>My Commission details</h2></th>
        </tr>
        <t>
            <th>Customer Fullname</th>
            <th>Policy Number</th>
            <th>Commission Amount</th>
            <th>Date</th>

        </t>
        </tr>

        <?php
        while ($row = mysqli_fetch_array($Agent_Commission)) {
            if ($row['Customer_fullname'] != null) {

                echo "<tr><td>" . $row["Customer_fullname"] . "</td>                       
                           <td>" . $row["Policy_Number"] . "</td>
                           <td>" . $row["Commission_amount"] . "</td>
                           <td>" . $row["Commission_date"] . "</td>
                          </tr>";
            }
            elseif($row = mysqli_fetch_array($Agent_Commission) == null)
            {
                echo "Employee has no commission details yet";
            }

        }
        echo "</table>";
        }
        ?>
    </table>
<?php
if (isset($_POST['GetMyTransactions'])) {
$Customer_name = $_POST['Customer_name'];
$Customer_Transaction= mysqli_query($conn, "Call GetMyTransactions('$Customer_name')");

if (!$Customer_Transaction) {
    printf("Error: %s\n", mysqli_error($conn));
    exit();

}
?>
<table align="center" border="1px" style="width:600px; line-height:40px;">
    <tr>
        <th colspan="8"><h2>My Transaction History</h2></th>
    </tr>
    <t>
        <th>Policy Number</th>
        <th>Policy ID</th>
        <th>Policy Name</th>
        <th>Transaction Amount</th>
        <th>Transaction Date</th>

    </t>
    </tr>

    <?php
    while ($row = mysqli_fetch_array($Customer_Transaction)) {
        if ($row['Policy_Number'] != null) {

            echo "<tr><td>" . $row["Policy_Number"] . "</td>                       
                           <td>" . $row["Policy_id"] . "</td>
                           <td>" . $row["Policy_name"] . "</td>
                           <td>" . $row["Transaction_amount"] . "</td>
                           <td>" . $row["Transaction_date"] . "</td>
                          </tr>";
        }


    }
    echo "</table>";
    }
    ?>
</table>
<?php
if (isset($_POST['GetMybill'])) {
$Customer_name = $_POST['Customer_name'];
$Customer_Bill= mysqli_query($conn, "SELECT * FROM Insurance_Management.Bill 
where Customer_name='$Customer_name'");

if (!$Customer_Bill) {
    printf("Error: %s\n", mysqli_error($conn));
    exit();

}
?>
<table align="center" border="1px" style="width:600px; line-height:40px;">
    <tr>
        <th colspan="8"><h2>My Bill Statement</h2></th>
    </tr>
    <t>
        <th>Policy Number</th>
        <th>Policy Name</th>
        <th>Due Date</th>
        <th>Premium</th>
        <th>Outstanding Balance</th>
        <th>Penalty</th>
        <th>Total Amount</th>

    </t>
    </tr>

    <?php
    while ($row = mysqli_fetch_array($Customer_Bill)) {
        if ($row['Policy_Number'] != null) {
            $premium= $row["premium"];
            $total=$row["total"] ;
            if($total !=0) {
                $a = $total / $premium;
                if ($total > $premium) {
                    $penalty = $total - ($premium * $a);
                } else {
                    $penalty = 0;

                }
                $Outstanding_Balance = $total - $premium - $penalty;
            }
            elseif($total==0)
            {
                $penalty = 0;
                $Outstanding_Balance =0;

            }

            echo "<tr><td>" . $row["Policy_Number"] . "</td>                       
                           <td>" . $row["Policy_name"] . "</td>
                           <td>" . $row["due_date"] . "</td>
                           <td>" . $row["premium"] . "</td>
                           <td>" . $Outstanding_Balance . "</td>
                           <td>" . $penalty . "</td>                           
                           <td>" . $row["total"] . "</td>
                          </tr>";
        }


    }
    echo "</table>";
    }
    mysqli_close($conn);
    ?>



</table>


</table>
</body>
</html>
