<head><title> List the seasons where “TEAM” has won above 45 games during the regular season and had no players averaging above 23 ppg between 2000 and 2020 </title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $team = $_POST['team'];
    $query = "CALL query_four(?);";
    if (empty($team)) {
       echo "ERROR: Please enter team <br>";
    }
    else {
    if ($stmt = $conn->prepare($query)) {
        $stmt->bind_param("s", $team);
       	if ($stmt->execute()) {
            $result = $stmt->get_result();
            $result->fetch_assoc();
            if (mysqli_num_rows($result) == 0) {
                echo "No Results";
            } else {
                echo "<h2> Results: </h2>";
                echo "<table border = \"5px solid black\">";
                echo "<tr><th> Team </th><th> Season </th><th> Games Won </th></tr>";
                foreach($result as $row) {
                    echo "<tr><td>".$row['TEAM']."</td>";
		    echo "<td>".$row['SEASON']."</td>";
		    echo "<td>".$row['GamesWon']."</td></tr>";
                }
                echo "</table>";
            }
        } else {
            echo "ERROR: Call to query_four failed. Likely invalid team. <br>";
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
