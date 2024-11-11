<?php
$con = mysqli_connect("localhost", "root", "", "emp_db");
if (!$con) {
    die('Could not connect: ' . mysqli_connect_error());
} else {
    echo 'Connection Established Successfully....<br>';
}

// Check which button was clicked
if (isset($_POST['action']) && $_POST['action'] === "SUBMIT") {
    
    $sql = "INSERT INTO emp_dept (emp_dept, dept_type, emp_dept_no) 
            VALUES ('{$_POST['emp_dept']}', '{$_POST['dept_type']}', '{$_POST['emp_dept_no']}')";

    if (!mysqli_query($con, $sql)) {
        die('Error: ' . mysqli_error($con));
    } else {
        echo 'Your record was added successfully...<br>';
    }

} elseif (isset($_POST['action']) && $_POST['action'] === "SEARCH") {
    // Search for a record based on emp_dept_no
    $emp_dept_no = mysqli_real_escape_string($con, $_POST['emp_dept_no']);
    $sql = "SELECT * FROM emp_dept WHERE emp_dept_no = '$emp_dept_no'";

    $result = mysqli_query($con, $sql);
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<br> emp_dept: ". $row["EMP_DEPT"]. "<br>Type: ". $row["DEPT_TYPE"]. "<br>Emp_Dept_No" . $row["EMP_DEPT_NO"] . "<br>";
        }
    }
    else {
        echo 'No records found for the specified department.';
    }
}

mysqli_close($con);
?>
