<?php 
error_reporting(0);
include '../Includes/dbcon.php';
include '../Includes/session.php';

$dateTaken = date("Y-m-d");

// Récupérer la session académique active
$query = mysqli_query($conn, "SELECT * FROM tblsessionterm WHERE isActive = '1'");
$activeSession = mysqli_fetch_array($query);
$sessionTermId = $activeSession['Id'];

// Vérifier si la présence a déjà été enregistrée pour aujourd'hui
$qurty = mysqli_query($conn, "SELECT * FROM tblteacherattendance WHERE dateTimeTaken='$dateTaken'");
$count = mysqli_num_rows($qurty);

if($count == 0){
    // Insérer tous les enseignants comme "absents" (status = 0)
    $query = mysqli_query($conn, "SELECT * FROM tblclassteacher");
    while ($row = mysqli_fetch_assoc($query)) {
        $insertQuery = mysqli_query($conn, "INSERT INTO tblteacherattendance (teacherId, classId, classArmId, sessionTermId, status, dateTimeTaken) 
                                            VALUES ('{$row['Id']}', '{$row['classId']}', '{$row['classArmId']}', '$sessionTermId', '0', '$dateTaken')");
    }
}

// Traitement du formulaire d'enregistrement de présence
if(isset($_POST['save'])){
    $teacherIds = $_POST['teacherIds'];  // Tous les identifiants des enseignants
    $presentTeachers = $_POST['check'];  // Enseignants marqués comme présents

    foreach($teacherIds as $teacherId){
        $status = in_array($teacherId, $presentTeachers) ? 1 : 0;
        $updateQuery = mysqli_query($conn, "UPDATE tblteacherattendance SET status='$status' WHERE teacherId='$teacherId' AND dateTimeTaken='$dateTaken'");
    }
    $statusMsg = "<div class='alert alert-success'>Présence enregistrée avec succès !</div>";
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="img/logo/attnlg.jpg" rel="icon">
  <title>Tableau de bord - Enregistrement de présence des enseignants</title>
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/ruang-admin.min.css" rel="stylesheet">
</head>
<body id="page-top">
  <div id="wrapper">
    <?php include "Includes/sidebar.php";?>
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <?php include "Includes/topbar.php";?>
        <div class="container-fluid">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Enregistrement de présence des enseignants (<?php echo date("d-m-Y"); ?>)</h1>
          </div>

          <div class="row">
            <div class="col-lg-12">
              <form method="post">
                <div class="card mb-4">
                  <div class="card-header">
                    <h6 class="m-0 font-weight-bold text-primary">Tous les enseignants</h6>
                    <h6 class="m-0 font-weight-bold text-danger">Remarque : <i>Cochez les cases à côté des enseignants présents !</i></h6>
                  </div>
                  <div class="table-responsive p-3">
                    <?php echo isset($statusMsg) ? $statusMsg : ''; ?>
                    <table class="table table-hover">
                      <thead class="thead-light">
                        <tr>
                          <th>#</th>
                          <th>Prénom</th>
                          <th>Nom</th>
                          <th>Classe</th>
                          <th>Groupe</th>
                          <th>Présent</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                          $query = "SELECT t.Id, t.firstName, t.lastName, c.className, ca.classArmName 
                                    FROM tblclassteacher AS t
                                    INNER JOIN tblclass AS c ON c.Id = t.classId
                                    INNER JOIN tblclassarms AS ca ON ca.Id = t.classArmId";
                          $rs = $conn->query($query);
                          $sn = 0;
                          while ($row = $rs->fetch_assoc()) {
                              $sn++;
                              $checked = "";
                              $attendanceQuery = mysqli_query($conn, "SELECT status FROM tblteacherattendance WHERE teacherId='{$row['Id']}' AND dateTimeTaken='$dateTaken'");
                              $attendance = mysqli_fetch_assoc($attendanceQuery);
                              if ($attendance['status'] == 1) {
                                  $checked = "checked";
                              }
                              echo "<tr>
                                      <td>$sn</td>
                                      <td>{$row['firstName']}</td>
                                      <td>{$row['lastName']}</td>
                                      <td>{$row['className']}</td>
                                      <td>{$row['classArmName']}</td>
                                      <td><input name='check[]' type='checkbox' value='{$row['Id']}' class='form-control' $checked></td>
                                    </tr>";
                              echo "<input name='teacherIds[]' value='{$row['Id']}' type='hidden'>";
                          }
                        ?>
                      </tbody>
                    </table>
                    <br>
                    <button type="submit" name="save" class="btn btn-primary">Enregistrer la présence</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <?php include "Includes/footer.php";?>
    </div>
  </div>

  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="js/ruang-admin.min.js"></script>
</body>
</html>