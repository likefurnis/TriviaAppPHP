<?php
session_start ();
require ('mysqli_connect.php');
include("includes/header.html");
include('includes/print_messages.php');
if (isset($_SESSION['id_user'])) {
  if (isset($_GET['qid']) && is_numeric($_GET['qid'])) {
    $qid = $_GET['qid'];
    $q = "SELECT title, description FROM quizzes WHERE id_quiz=$qid";
    $r = @mysqli_query ($dbc, $q);
    $num = mysqli_num_rows($r);
    if ($num == 1) {
      $row = mysqli_fetch_array($r, MYSQLI_ASSOC);
      $quiz_title = $row['title'];
      $quiz_desc = $row['description'];
?>
<div class="row text-center login-title">
  <div class="offset-2 col-sm-8 text-center">
    <h1 class="title"><?php echo $quiz_title;?></h1>
    <h4><?php echo $quiz_desc;?></h4>
  </div>
</div>
<hr>
<div class="row">
  <div class="col-8 offset-2 text-center">
    <form action="results.php?qid=<?php echo $qid;?>" method="POST">

      <div id="print-here"></div>
<script>
  <?php
    $q = "SELECT id_question, description FROM questions WHERE id_quiz=$qid";
    $r = @mysqli_query ($dbc, $q);
    $num = mysqli_num_rows($r);
    if ($num > 0) {
      echo 'const preguntas = [';
      for($j=1; $j<=$num; $j++) {
        $row = mysqli_fetch_array($r, MYSQLI_ASSOC);
        $id_question = $row['id_question'];
        $question = $row['description'];
        $question = str_replace("'", '"', $question);
        echo "['$question', ";
        $q1 = "SELECT description, value FROM answers WHERE id_question=$id_question";
        $r1 = @mysqli_query ($dbc, $q1);
        $n1 = mysqli_num_rows($r1);
        if ($n1 > 0) {
          for($i=1; $i<=$n1; $i++) {
            $row1 = mysqli_fetch_array($r1, MYSQLI_ASSOC);
            $answer = $row1['description'];
            echo "'$answer'";
            if ($i!=$n1) echo ",";
          }
          echo "]";
          if ($j!=$num)echo ",";
        }
      }
      echo '];';
    }
  ?>
  var actual = 0;
  var respuestas = [];
  window.onload = function () {
    generateQuestion();
  }

  function generateQuestion() {
    if (actual === preguntas.length - 1) {
      document.getElementById('print-here').innerHTML = '<div id="pregunta'+actual+'"><fieldset id="fieldset'+actual+'" class="form-group"></fieldset><div class="row"><button type="submit" class="btn btn-primary btn-lg btn-block" onclick="nextQuestion()">Finish</button></div></div></form></div>';
    } else {
      document.getElementById('print-here').innerHTML = '<div id="pregunta'+actual+'"><fieldset id="fieldset'+actual+'" class="form-group"></fieldset><div class="row"><button type="button" class="btn btn-primary btn-lg btn-block" onclick="nextQuestion()">Next</button></div></div></form></div>';
    }
    preguntas[actual].forEach((respuesta, j) => {
      if (j===0) document.getElementById('fieldset'+actual).innerHTML += "<legend>"+respuesta+"</legend>";
      else document.getElementById('fieldset'+actual).innerHTML += "<div class='form-check disabled text-left offset-4'><label class='custom-control custom-radio'><input value='"+respuesta+"' id='radio"+j+"' name='radio"+actual+"' type='radio' class='custom-control-input'><span class='custom-control-indicator'></span><span class='custom-control-description'>"+respuesta+"</span></label></div>";
    });
  }

  function nextQuestion () {
    for (var i=1; i<preguntas[actual].length; i++) {
      if (document.getElementById('radio'+i).checked) {
        respuestas.push(document.getElementById('radio'+i).value);
      }
    }
    if (typeof respuestas[actual] !== 'undefined') {
      actual++;
      if (actual < preguntas.length) {
        generateQuestion();
        document.getElementById('pregunta'+actual).style.clear = 'both';
        document.getElementById('pregunta'+actual).style.display = 'block';
        if (actual === preguntas.length - 1) {
          document.getElementById('fieldset'+actual).innerHTML += "<input type='hidden' value='"+respuestas.join('¬')+"' name='respuestas'/>";
        }
      }
    } else {
      alert('You must check one first.');
    }
  }
</script>
</div>
<?php
    } else echo print_message('danger', 'Quiz not found in our database.');
    mysqli_free_result ($r);
  } else echo print_message('danger', 'No quiz selected.');
} else echo print_message('danger', 'You are not logged in.');
include("includes/footer.html");
?>