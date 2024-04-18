<?php
session_start();

// Check if admin is logged in
if (!isset($_SESSION['admin'])) {
    // If not, redirect to login page
    header("Location: login_admin.php");
    exit();
}

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sertifikat_online";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$message = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $event_name = $_POST['event_name'];
    $event_date = $_POST['event_date'];
    $location = $_POST['location'];
    $organizer = $_POST['organizer'];

    // Insert data into events table
    $sql = "INSERT INTO events (event_name, event_date, location, organizer)
            VALUES ('$event_name', '$event_date', '$location', '$organizer')";

    if ($conn->query($sql) === TRUE) {
        $message = "Event created successfully";
        // Redirect to admin dashboard after creating event
        header("Location: admin_dashboard.php");
        exit();
    } else {
        $message = "Error: " . $sql . "<br>" . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Input Form</title>
    <style>
        body {
            display: flex;
            justify-content: center;
           
            height: 100vh;
            margin: 0;
        }
        form {
            width: 100%;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="date"] {
            width: calc(100% - 12px);
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="sidebar">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sertifikat App</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
        <h2>Admin Farhan</h2>
        <nav>
            <ul>
                <li><a href="admin_dashboard.php">Dashboard</a></li>
                <li><a href="create_event.php">Create Event</a></li>
                <li><a href="view_event.php">View Events</a></li>
                <li><a href="generate_certificates.php">Generate Certificates</a></li>
                <li><a href="manage_users.php">Manage Users</a></li>
                <li><a href="view_certificates.php">View Certificates</a></li>
                <li><a href="../pages/logout.php">Logout</a></li>
            </ul>
        </nav>
    </div>

    <div class="content">
        <div class="container">
            <h2>Create Event</h2>
            <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
                <label for="event_name">Event Name:</label><br>
                <input type="text" id="event_name" name="event_name" required><br>
                <label for="event_date">Event Date:</label><br>
                <input type="date" id="event_date" name="event_date" required><br>
                <label for="location">Location:</label><br>
                <input type="text" id="location" name="location" required><br>
                <label for="organizer">Organizer:</label><br>
                <input type="text" id="organizer" name="organizer"><br><br>
                <input type="submit" value="Create Event">
            </form>
            <p><?php echo $message; ?></p>
        </div>
    </div>
</body>
</html>


