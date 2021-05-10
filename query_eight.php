<head><title>Show the top 40 percentile of teams in nba history that led the league in offensive rating </title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $query = "CALL query_eight();";
    if ($result = $conn->query($query)) {
        if (mysqli_num_rows($result) == 0) {
            echo "No Results";
        } else {
            echo "<h2> Results: </h2>";
            echo "<table border = \"5px solid black\">";
            echo "<tr><th> Team Name </th><th> Season </th><th> Offensive Rating </th><th> 3 Point % </th></tr>";
            foreach($result as $row) {
                $three_pct = $row['three_p_pct'] * 100;
                echo "<tr><td>".$row['TEAM']."</td>";
                echo "<td>".$row['SEASON']."</td>";
                echo "<td>".$row['ORtg']."</td>";
                echo "<td>".$three_pct."%</td></tr>";
            }
            echo "</table>";
        }
    } else {
        echo "ERROR: Call to query_eight failed <br>";
    }

    echo "<br>";
    $conn->close();
?>
</body>
