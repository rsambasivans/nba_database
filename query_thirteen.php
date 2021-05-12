<head><title> Show the seasons that a given player averaged above 15 ppg while also having his free throws made account for 20% of his total points< </title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $player = $_POST['player'];
    $query = "CALL query_thirteen(?);";
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
        } else {
            echo "ERROR: Prepare Failed <br>";
        }
        echo "<br>";
        $stmt->close();
    }
    $conn->close();
?>
</body>
