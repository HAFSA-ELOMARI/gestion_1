<?php 

error_reporting(E_ALL);
ini_set('display_errors', 1);

include '../Includes/dbcon.php';
include '../Includes/session.php';

if (!isset($_SESSION['userId'])) {
    echo "❌ Vous devez être connecté pour accéder à cette page.";
    exit();
}

$query = "SELECT tblclass.className, tblclassarms.classArmName 
          FROM tblclassteacher
          INNER JOIN tblclass ON tblclass.Id = tblclassteacher.classId
          INNER JOIN tblclassarms ON tblclassarms.Id = tblclassteacher.classArmId
          WHERE tblclassteacher.Id = ?";

$stmt = $conn->prepare($query);
$stmt->bind_param("i", $_SESSION['userId']);
$stmt->execute();
$result = $stmt->get_result();
$rrw = $result->fetch_assoc();
$stmt->close();


$queryTeacher = "SELECT tblclassteacher.Id, 
                            tblclass.className, 
                            tblclassarms.classArmName, 
                            tblclassteacher.firstName, 
                            tblclassteacher.lastName
                     FROM tblclassteacher
                     INNER JOIN tblclass ON tblclass.Id = tblclassteacher.classId
                     INNER JOIN tblclassarms ON tblclassarms.Id = tblclassteacher.classArmId
                     INNER JOIN tblstudents ON tblstudents.classId = tblclassteacher.classId
                     WHERE tblstudents.Id = ?";

$queryStmtTeacher = $conn->prepare($queryTeacher);
$queryStmtTeacher->bind_param("i", $_SESSION['userId']);
$queryStmtTeacher->execute();
$resultTeacher = $queryStmtTeacher->get_result();

?>

<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Tableau de bord</title>
  <link href="img/logo/attnlg.jpg" rel="icon">
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/ruang-admin.min.css" rel="stylesheet">

  <script>
    function classArmDropdown(str) {
      if (str == "") {
          document.getElementById("txtHint").innerHTML = "";
          return;
      }
      let xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
              document.getElementById("txtHint").innerHTML = this.responseText;
          }
      };
      xmlhttp.open("GET", "ajaxClassArms2.php?cid=" + str, true);
      xmlhttp.send();
    }
  </script>
</head>

<body id="page-top">
  <div id="wrapper">
   
    <?php include "Includes/sidebar.php"; ?>

    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
    
        <?php include "Includes/topbar.php"; ?>

        
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Professeurs de la classe (<?php echo htmlspecialchars($rrw['className'] . ' - ' . $rrw['classArmName']); ?>)</h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Accueil</a></li>
              <li class="breadcrumb-item active" aria-current="page">Tous les professeurs</li>
            </ol>
          </div>

          

       
          <div class="row">
            <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Professeurs de cette classe</h6>
                </div>
                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover">
                    <thead class="thead-light">
                      <tr>
                        <th>#</th>
                        <th>Prénom</th>
                        <th>Nom de famille</th>
                        <th>Classe</th>
                        <th>Classe / Section</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      if ($resultTeacher->num_rows > 0) {
                        $sn = 0;
                        while ($teacher = $resultTeacher->fetch_assoc()) {
                          $sn++;
                          echo "<tr>
                                  <td>{$sn}</td>
                                  <td>" . htmlspecialchars($teacher['firstName']) . "</td>
                                  <td>" . htmlspecialchars($teacher['lastName']) . "</td>
                                  <td>" . htmlspecialchars($teacher['className']) . "</td>
                                  <td>" . htmlspecialchars($teacher['classArmName']) . "</td>
                                </tr>";
                        }
                      } else {
                        echo "<tr><td colspan='5'>❌ Aucun professeur trouvé pour cette classe.</td></tr>";
                      }
                      ?>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>

  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/ruang-admin.min.js"></script>
</body>

</html>
