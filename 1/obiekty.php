<?php
$mysqli = new mysqli("localhost", "root", "", "islandia");
?>

<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Islandia</title>
  <link rel="stylesheet" href="styl.css">
</head>
<body>
  <header>
    <h1>
      <a href="islandia.php">Zwiedzaj Islandię</a>
    </h1>
  </header>

  <aside>
    <h3>Do zwiedzania</h3>

    <ul>
      <li>
        Wodospady:

        <ol>
          <?php
          $result = $mysqli->query("SELECT nazwa FROM `obiekty` WHERE panstwo = 'Islandia' AND idRodzaj = 10;");
          while($row = $result->fetch_assoc()) {
            echo("<li>{$row['nazwa']}</li>");
          }
          ?>
        </ol>
      </li>

      <li>
        Siedlilska zwierząt:

        <ol>
         <?php
          $result = $mysqli->query("SELECT nazwa FROM `obiekty` WHERE panstwo = 'Islandia' AND idRodzaj = 14;");
          while($row = $result->fetch_assoc()) {
            echo("<li>{$row['nazwa']}</li>");
          }
          ?>
        </ol>
      </li>
    </ul>
  </aside>

  <main>
    <h2>Opis miejsca</h2>

    <section>
        <?php
        $statement = $mysqli->prepare("SELECT obiekty.plik, obiekty.nazwa, obiekty.nazwaCechy, obiekty.wartoscCechy, obiekty.opis, rodzaje.rodzaj FROM `obiekty` INNER JOIN `rodzaje` ON rodzaje.idRodzaj = obiekty.idRodzaj WHERE obiekty.idObiekt = ?;");
        $statement->bind_param("s", $_GET["idObiekt"]);
        $statement->execute();

        $result = $statement->get_result();
        while($row = $result->fetch_assoc()) {
          echo("<img src='{$row['plik']}' alt='{$row['nazwa']}'><h2>{$row['nazwa']}</h2><h3>{$row['rodzaj']}</h3><p>{$row['nazwaCechy']}: {$row['wartoscCechy']}</p><p>{$row['opis']}</p>");
        }
        ?>
    </section>
  </main>

  <footer>
    <hr>
    <p>Autor: 1234567890</p>
  </footer>
</body>
</html>

<?php
$mysqli->close();
?>
