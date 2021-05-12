<head><title> For a given player, show the players top 30 percentile seasons in terms of points per game </title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $player = $_POST['player'];
    $query = "CALL query_fifteen(?);";
    if (empty($player)) {
        echo "ERROR: Please enter player name <br>";
    } else {
        if ($stmt = $conn->prepare($query)) {
            $stmt->bind_param("s", $player);
            if ($stmt->execute()) {
                $result = $stmt->get_result();
                if (mysqli_num_rows($result) == 0) {
                    echo "No Results";
                } else {
                    echo "<h2> Results: </h2>";
                    echo "<table border = \"5px solid black\">";
                    echo "<tr><th> Season </th><th> Team </th><th> Pts </th><th> Age </th><th> FG% </th></tr>";
                    foreach($result as $row) {
                        echo "<tr><td>".$row['SEASON']."</td>";
                        echo "<td>".$row['TEAM']."</td>";
                        echo "<td>".$row['PTS']."</td>";
                        echo "<td>".$row['AGE']."</td>";
                        echo "<td>".($row['FG_pct'] * 100)."%</td></tr>";
                    }
                    echo "</table>";
                }
            } else {
                echo "ERROR: Call to query_fifteen failed <br>";
            }
        } else {
            echo "ERROR: Prepare Failed <br>";
        }
        echo "<br>";
        $stmt->close();
    }
    $conn->close();
?>
</body>
