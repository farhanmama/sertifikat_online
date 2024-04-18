<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Koneksi ke database
    $servername = "localhost";
    $usernameDB = "root";
    $passwordDB = "";
    $dbname = "sertifikat_online";

    $conn = new mysqli($servername, $usernameDB, $passwordDB, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $username = $_POST['username'];
    $password = $_POST['password'];

    // Query untuk mencari admin berdasarkan username
    $sql = "SELECT * FROM admins WHERE username='$username'";
    $result = $conn->query($sql);

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        // Verifikasi password
        if (password_verify($password, $row['password'])) {
            // Jika berhasil, simpan sesi dan redirect ke dashboard admin
            $_SESSION['admin'] = $username;

            // Set cookie if "Remember Me" is checked
            if (!empty($_POST["remember"])) {
                setcookie("admin_username", $username, time() + (86400 * 30), "/"); // 30 days
            }

            header("Location: admin_dashboard.php");
            exit();
        } else {
            // Jika password salah, tampilkan pesan error
            echo "<script>alert('Password salah. Silakan coba lagi.');</script>";
        }
    } else {
        // Jika username tidak ditemukan, tampilkan pesan error
        echo "<script>alert('Username tidak ditemukan. Silakan coba lagi.');</script>";
    }

    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://www.phptutorial.net/app/css/style.css">
    <title>Login</title>
</head>
<body>
    <div class="container">
        <h2>Login Admin</h2>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>