<head><title> Show the player with the highest number of rebounds per game on the team with the best win percentage in a given season </title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $season = $_POST['season'];
    $query = "CALL query_nine('".$season."');";
    if ($result = $conn->query($query)) {
        if (mysqli_num_rows($result) == 0) {
            echo "No Results";
        } else {
            echo "<h2> Results: </h2>";
            echo "<table border = \"5px solid black\">";
            echo "<tr><th> Player Name </th><th> Rebounds Per Game </th></tr>";
            foreach($result as $row) {
                echo "<tr><td>".$row['PLAYER']."</td>";
                echo "<td>".$row['TRB']."</td></tr>";
            }
            echo "</table>";
        }
    } else {
        echo "ERROR: Call to query_nine failed <br>";
    }

    echo "<br>";
    $conn->close();
?>
</body>
