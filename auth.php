<?php
    require_once("var_conn.php");
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Headers: *");
    if(isset($_POST['username']))
    {
        $username = $_POST['username'];
        if(isset($_POST['password']))
        {
            $password = $_POST['password'];
            $sql = "SELECT idUtente, userName FROM tutente WHERE userName = '$username' AND passWord = '$password'";
            $res = mysqli_query($con, $sql);
            if(mysqli_num_rows($res) == 1)
            {
                $row = mysqli_fetch_assoc($res);
                $_SESSION['idUtente'] = $row['idUtente'];
                $_SESSION['userName'] = $row['userName']; 
                $response = array("err" => false);
            }
            else
                $response = array("err" => true);
        }
        else
            $response = array("err" => true);
    }
    else
        $response = array("err" => true);
    echo json_encode($response);
?>