<head><title>Amongst players that lead their team in steals during the 2015 seasons, show which ones rank in the top 5% percentile in blocks</title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $query = "CALL query_three();";
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
                echo "<tr><th> Player </th><th> Team </th><th> Season </th><th> Steals </th><th> Blocks </th><th> Block Percentile </th></tr>";
                foreach($result as $row) {
                    echo "<tr><td>".$row['PLAYER']."</td>";
		    echo "<td>".$row['TEAM']."</td>";
		    echo "<td>".$row['SEASON']."</td>";
		    echo "<td>".$row['STL']."</td>";
		    echo "<td>".$row['BLK']."</td>";
		    echo "<td>".$row['pct_rank']."</td></tr>";
                }
                echo "</table>";
            }
        } else {
            echo "ERROR: Call to query_three failed <br>";
        }
    } else {
        echo "ERROR: Prepare Failed <br>";
    }

    echo "<br>";
    $stmt->close();
    $conn->close();
?>
</body>
