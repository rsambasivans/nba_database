<head><title> Show the player with the highest number of rebounds per game on the team with the best win percentage in a given season </title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $season = $_POST['season'];
    $query = "CALL query_nine(?);";
    if (empty($season)) {
        echo "ERROR: Please enter season <br>";
    } else {
        if ($stmt = $conn->prepare($query)) {
            $stmt->bind_param("s", $season);
            if ($stmt->execute()) {
                $result = $stmt->get_result();
                $result->fetch_assoc();
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
        } else {
            echo "ERROR: Prepare Failed <br>";
        }

        echo "<br>";
        $stmt->close();
    }
    $conn->close();
?>
</body>
