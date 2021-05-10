<head><title> Show the seasons that a given player averaged above 15 ppg while also having his free throws made account for 20% of his total points< </title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $player = $_POST['player'];
    $query = "CALL query_thirteen('".$player."');";
    if ($result = $conn->query($query)) {
        if (mysqli_num_rows($result) == 0) {
            echo "No Results";
        } else {
            echo "<h2> Results: </h2>";
            echo "<table border = \"5px solid black\">";
            echo "<tr><th> Team </th><th> Season </th><th> Pts </th><th> FTM </th></tr>";
            foreach($result as $row) {
                echo "<tr><td>".$row['TEAM']."</td>";
                echo "<td>".$row['SEASON']."</td>";
                echo "<td>".$row['PTS']."</td>";
                echo "<td>".$row['FT']."</td></tr>";
            }
            echo "</table>";
        }
    } else {
        echo "ERROR: Call to query_thirteen failed <br>";
    }

    echo "<br>";
    $conn->close();
?>
</body>
