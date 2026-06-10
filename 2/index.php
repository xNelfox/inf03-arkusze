<?php
// $mysqli = new mysqli("localhost", "root", "", "wodospady");
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
      <!--1-->
    </aside>

    <section>
      <table>
        <tr>
          <th>Identyfikator</th>
          <td>Państwo</td>
          <td>Nazwa wodospadu</td>
          <td>Wysokość</td>
        </tr>

        <!--2-->
      </table>

      <h4>Wpisz osiągnięcie do bazy</h4>
      <form action="index.php" method="post">
        <label for="id">Identyfikator wodospadu</label>
        <input type="number" id="id" name="id">

        <label for="turist">Turysta</label>
        <select id="turist" name="turist">
          <!--3-->
        </select>

        <button>Wpisz</button>
      </form>
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
// $mysqli->close();
?>
