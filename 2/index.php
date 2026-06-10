<?php
$mysqli = new mysqli("localhost", "root", "", "wodospady");
?>

<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Wodospady</title>
  <link rel="stylesheet" href="styl.css">
</head>
<body>
  <header>
    <h2>Łowcy wodospadów</h2>
  </header>

  <main>
    <aside>
      <?php
      $result = $mysqli->query("SELECT idKontynentu, nazwa FROM kontynenty;");
      while($row = $result->fetch_assoc()) {
        echo("<a href='index.php?id={$row['idKontynentu']}'>{$row['nazwa']}</a>");
      }
      ?>
    </aside>

    <section>
      <table>
        <tr>
          <th>Identyfikator</th>
          <td>Państwo</td>
          <td>Nazwa wodospadu</td>
          <td>Wysokość</td>
        </tr>

        <?php
        $id = 6;

        if(isset($_GET["id"])) {
          $id = $_GET["id"];
        }

        $statement = $mysqli->prepare("SELECT id, panstwo, nazwa, wysokosc FROM wodospady WHERE idKontynentu = ?");
        $statement->bind_param("s", $id);
        $statement->execute();

        $result = $statement->get_result();
        while($row = $result->fetch_assoc()) {
          echo("<tr>");
          echo("<td>{$row['id']}</td>");
          echo("<td>{$row['panstwo']}</td>");
          echo("<td>{$row['nazwa']}</td>");
          echo("<td>{$row['wysokosc']}</td>");
          echo("</tr>");
        }
        ?>
      </table>

      <h4>Wpisz osiągnięcie do bazy</h4>
      <form action="index.php" method="post">
        <label for="id">Identyfikator wodospadu</label>
        <input type="number" id="id" name="id">

        <label for="turist">Turysta</label>
        <select id="turist" name="turist">
          <?php
          $result = $mysqli->query("SELECT idTurysta, nick FROM turysci");
          while($row = $result->fetch_assoc()) {
            echo("<option value='{$row['idTurysta']}'>{$row['nick']}</option>");
          }
          ?>
        </select>

        <button name="submit">Wpisz</button>
      </form>

      <?php
      if(isset($_POST["submit"])) {
        $statement = $mysqli->prepare("INSERT INTO osiagniecia VALUES(NULL, ?, ?)");
        $statement->bind_param("ss", $_POST["id"], $_POST["turist"]);
        $statement->execute();
      }
      ?>
    </section>
  </main>

  <article>
    <h3>Wodospady w Polsce</h3>

    <img src="kamienczyk.jpg" alt="wodospad">
    <img src="kamienczyk.jpg" alt="wodospad">
    <img src="kamienczyk.jpg" alt="wodospad">
    <img src="kamienczyk.jpg" alt="wodospad">
  </article>

  <footer>
    <p>Autor: 1234567890</p>
  </footer>
</body>
</html>

<?php
$mysqli->close();
?>
