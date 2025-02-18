<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include '../Includes/dbcon.php';
include '../Includes/session.php';

// التأكد من أن المستخدم هو أستاذ
if (!isset($_SESSION['teacherId'])) {
    header("Location: ../login.php");
    exit();
}

$teacherId = $_SESSION['teacherId']; // معرف الأستاذ

// جلب معلومات الأستاذ
$teacherQuery = mysqli_query($conn, "SELECT firstName, lastName FROM tblclassteacher WHERE id = '$teacherId'");
$teacherData = mysqli_fetch_assoc($teacherQuery);

// جلب استعمال الزمن للأستاذ
$scheduleQuery = mysqli_query($conn, "
    SELECT s.day, t.termName, c.className, ca.classArmName, s.subject 
    FROM tblschedule s
    JOIN tblterm t ON s.termId = t.id
    JOIN tblclass c ON s.classId = c.id
    JOIN tblclassarms ca ON s.classArmId = ca.id
    WHERE s.teacherId = '$teacherId'
    ORDER BY s.day, s.classId, s.classArmId
");
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Emploi du Temps</title>
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>

<body>
    <div class="container mt-5">
        <h2 class="text-center">Emploi du Temps</h2>

        <!-- معلومات الأستاذ -->
        <div class="card mb-4">
            <div class="card-body">
                <h5 class="card-title">Informations de l'Enseignant</h5>
                <p><strong>Nom :</strong> <?php echo $teacherData['firstName'] . " " . $teacherData['lastName']; ?></p>
            </div>
        </div>

        <!-- جدول استعمال الزمن -->
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>Jour</th>
                    <th>Trimestre</th>
                    <th>Classe</th>
                    <th>Section</th>
                    <th>Matière</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($row = mysqli_fetch_assoc($scheduleQuery)) { ?>
                    <tr>
                        <td><?php echo $row['day']; ?></td>
                        <td><?php echo $row['termName']; ?></td>
                        <td><?php echo $row['className']; ?></td>
                        <td><?php echo $row['classArmName']; ?></td>
                        <td><?php echo $row['subject']; ?></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>

    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>