<?php
session_start();

// Periksa apakah admin sudah login
if (!isset($_SESSION['admin'])) {
    // Jika belum, redirect ke halaman login
    header("Location: login_admin.php");
    exit();
}

// Koneksi ke database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "sertifikat_online";

$conn = new mysqli($servername, $username, $password, $dbname);

// Periksa koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query untuk mendapatkan jumlah sertifikat
$sql_certificates_count = "SELECT COUNT(*) as total FROM certificates";
$result_certificates_count = $conn->query($sql_certificates_count);

// Periksa kesalahan pada query
if (!$result_certificates_count) {
    die("Error in query: " . $conn->error);
}

$row_certificates_count = $result_certificates_count->fetch_assoc();
$total_certificates = $row_certificates_count['total'];

// Query untuk mendapatkan jumlah pengguna
$sql_users_count = "SELECT COUNT(*) as total FROM users";
$result_users_count = $conn->query($sql_users_count);

// Periksa kesalahan pada query
if (!$result_users_count) {
    die("Error in query: " . $conn->error);
}

$row_users_count = $result_users_count->fetch_assoc();
$total_users = $row_users_count['total'];

// Query untuk mendapatkan jumlah acara
$sql_events_count = "SELECT COUNT(*) as total FROM events";
$result_events_count = $conn->query($sql_events_count);

// Periksa kesalahan pada query
if (!$result_events_count) {
    die("Error in query: " . $conn->error);
}

$row_events_count = $result_events_count->fetch_assoc();
$total_events = $row_events_count['total'];

// Query untuk mendapatkan jumlah penugasan sertifikat
$sql_assignments_count = "SELECT COUNT(*) as total FROM certificate_assignments";
$result_assignments_count = $conn->query($sql_assignments_count);

// Periksa kesalahan pada query
if (!$result_assignments_count) {
    die("Error in query: " . $conn->error);
}

$row_assignments_count = $result_assignments_count->fetch_assoc();
$total_assignments = $row_assignments_count['total'];

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sertifikat App</title>
    <link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
    <div class="sidebar">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>

<div class="sidenav">
  <li><a href="admin_dashboard.php">Dashboard</a></li>
  <li><a href="create_event.php">Create Event</a></li>
  <li><a href="view_event.php">View Events</a></li>
  <li><a href="generate_certificates.php">Generate Certificates</a></li>
  <li><a href="manage_users.php">Manage Users</a></li>
  <li><a href="view_certificates.php">View Certificates</a></li>
  <li><a href="../pages/logout.php">Logout</a></li>
</div>

<div class="main">
        <h2>_________________Admin Farhan_____________________</h2>
        <nav>
            <ul>
                
            </ul>
        </nav>
    </div>

    <div class="content">
        <div class="container">
            <h1>_________________________________Welcome, Admin!___________________________</h1>
            <div class="summary">
                <div class="summary-item">
                    <h2>Certificates</h2>
                    <p><?php echo $total_certificates; ?></p>
                </div>
                <div class="summary-item">
                    <h2>Total Users</h2>
                    <p><?php echo $total_users; ?></p>
                </div>
                <div class="summary-item">
                    <h2>Total Events</h2>
                    <p><?php echo $total_events; ?></p>
                </div>
                <div class="summary-item">
                    <h2>Assignments</h2>
                    <p><?php echo $total_assignments; ?></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

