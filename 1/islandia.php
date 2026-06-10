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
            echo("<li>
              {$row['nazwa']}
            </li>");
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
            echo("<li>
              {$row['nazwa']}
            </li>");
          }
          ?>
        </ol>
      </li>
    </ul>
  </aside>

  <main>
    <h2>Galeria</h2>

    <section>
        <?php
        $result = $mysqli->query("SELECT idObiekt, plik, nazwa FROM `obiekty` WHERE panstwo = 'Islandia';");
        while($row = $result->fetch_assoc()) {
          echo("<a href='obiekty.php?idObiekt={$row['idObiekt']}'>
            <img src='{$row['plik']}' alt='{$row['nazwa']}' title='{$row['nazwa']}' class='miniatury'>
          </a>");
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
