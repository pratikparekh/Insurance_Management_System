<?php

$servername = "fall2018databaseparekh.cbskcsxbgaol.us-east-2.rds.amazonaws.com";
$username = "pratikparekh217";
$password = "g2k1a0p7s9p6";
$dbname = "Insurance_Management";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

if(isset($_POST['reg_user']))
{
    //signup();

    if(!empty($_POST['username']))
    {
        $query = "SELECT * FROM Account WHERE Username = '$_POST[username]'";
        $result = $conn -> query($query);
        if($result->num_rows == 0)
        {
            //Newuser();
            //echo "hello";
            $username = $_POST['username'];
            $firstname = $_POST['fname'];
            $lastname = $_POST['lname'];
            $dob= $_POST['dateofbirth'];

            $al1 = $_POST['addressline_1'];
            $al2 = $_POST['addressline_2'];
            if ($al2 == "")
            {
                $al2 = null;
            }
            $city = $_POST['City'];
            $state = $_POST['State'];
            $zip_code = $_POST['zipcode'];
            $phone1 = $_POST['PhoneNumber1'];
            $phone2 = $_POST['PhoneNumber2'];
            if ($phone2 == "")
            {
                $phone2 = null;
            }
            $email = $_POST['email'];
            $password = $_POST['password'];

            $query2 = "INSERT INTO Account(Username,Password,Account_type) VALUES ('$username','$password','Customer')";
            $query1 = "INSERT INTO Customer(Username,First_name,Last_name,Email_id,Date_of_birth,Phone_no1,Phone_no2,Address_line1,Address_line2,City,State,Zip_code) VALUES('$username','$firstname','$lastname','$email','$dob','$phone1','$phone2','$al1','$al2','$city','$state','$zip_code')";

            if(mysqli_query($conn,$query2) and mysqli_query($conn,$query1))
            {
                //echo "YOUR REGISTRATION IS COMPLETED...";
                $_SESSION['username'] = $username;
                $_SESSION['success'] = "You are now logged in";
                header('location: http://localhost:63342/Insurance_Company/DisplayPolicies.html');

            }
            else
            {
                echo mysqli_error($conn);
            }

        }
        else
        {
            echo "SORRY...YOU ARE ALREADY REGISTERED USER...";
        }
    }

}

if (isset($_POST['login_user']))
{
    $username = $_POST['username'];
    $password = $_POST['password'];

    if (empty($username))
    {
        echo "Username required";
    }
    if (empty($password))
    {
        echo "Password required";
    }

    if (!empty($username) && !empty($password))
    {
        $query = "SELECT * FROM Account WHERE Username='$username' AND password='$password'";
        $results = mysqli_query($conn, $query);

        if (mysqli_num_rows($results) == 1)
        {
            $_SESSION['username'] = $username;
            $_SESSION['success'] = "You are now logged in";

            header('location:http://localhost:63342/Insurance_Company/DisplayPolicies.html?userId='.$user_id);
        }
        else
        {
            echo  "Wrong username/password combination";
        }
    }
}



?>