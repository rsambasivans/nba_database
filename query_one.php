<head><title>Show the players who played the most average minutes while starting less than 25% of their team's games for that season and also shoot above 35% from 3</title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $query = "CALL query_one();";
    $dataPoints = array();
    if ($stmt = $conn->prepare($query)) {
        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $result->fetch_assoc();
            if (mysqli_num_rows($result) == 0) {
                echo "No Results";
            } else {
                echo "<h2> Results: </h2>";
                echo "<table border = \"5px solid black\">";
                echo "<tr><th> Player </th><th> Team </th><th> Season </th><th> Minutes Played </th><th> Game Starting % </th><th> Three Point % </th></tr>";
                foreach($result as $row) {
                    echo "<tr><td>".$row['PLAYER']."</td>";
                    echo "<td>".$row['TEAM']."</td>";
                    echo "<td>".$row['SEASON']."</td>";
		    echo "<td>".$row['MP']."</td>";
		    echo "<td>".($row['gameStartingPercent']*100)."</td>";
                    echo "<td>".($row['three_p_pct']*100)."</td></tr>";
                }
                echo "</table>";
            }
        } else {
            echo "ERROR: Call to query_one failed <br>";
        }
    } else {
        echo "ERROR: Prepare Failed <br>";
    }

    echo "<br>";
    $stmt->close();
    $conn->close();
?>
</body>
