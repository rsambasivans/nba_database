<head><title>Amongst all teams in nba history that have made won above 60 percent of their games, show the teams that rank in the top 30% in both offensive and defensive rating</title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $query = "CALL query_fourteen();";
    if ($result = $conn->query($query)) {
        if (mysqli_num_rows($result) == 0) {
            echo "No Results";
        } else {
            echo "<h2> Results: </h2>";
            echo "<table border = \"5px solid black\">";
            echo "<tr><th> TEAM </th><th> SEASON </th><th> Offensive Rating </th><th> Defensive Rating </th></tr>";
            foreach($result as $row) {
                echo "<tr><td>".$row['TEAM']."</td>";
                echo "<td>".$row['SEASON']."</td>";
                echo "<td>".$row['ORtg']."</td>";
                echo "<td>".$row['DRtg']."</td></tr>";
            }
            echo "</table>";
        }
    } else {
        echo "ERROR: Call to query_fourteen failed <br>";
    }

    echo "<br>";
    $conn->close();
?>
</body>
