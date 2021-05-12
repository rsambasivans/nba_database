<head><title>Show what percent of total shots have the leaders in defensive rating shot from the three point line? (list from lowest to highest)</title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $query = "CALL query_seven();";
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
                echo "<tr><th> Team </th><th> End Season </th><th> ThreeAttemptRatio </th></tr>";
                foreach($result as $row) {
                    echo "<tr><td>".$row['TEAM']."</td>";
		    echo "<td>".$row['END_SEASON']."</td>";
		    echo "<td>".$row['ThreeAttemptRatio']."</td></tr>";
                }
                echo "</table>";
            }
        } else {
            echo "ERROR: Call to query_seven failed <br>";
        }
    } else {
        echo "ERROR: Prepare Failed <br>";
    }

    echo "<br>";
    $stmt->close();
    $conn->close();
?>
</body>
