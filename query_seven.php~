<head><title>List which players since 2000 were the steals leader on their respective team while also averaging at least 25% of their shot attempts from 3</title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $query = "CALL query_six();";
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
                echo "<tr><th> Player </th><th> Season </th><th> Team </th><th> Steals </th><th> Three Point Attempt Ratio </th></tr>";
                foreach($result as $row) {
                    echo "<tr><td>".$row['PLAYER']."</td>";
		    echo "<td>".$row['SEASON']."</td>";
		    echo "<td>".$row['TEAM']."</td>";
		    echo "<td>".$row['STL']."</td>";
		    echo "<td>".$row['three_p_ratio']."</td></tr>";
                }
                echo "</table>";
            }
        } else {
            echo "ERROR: Call to query_six failed <br>";
        }
    } else {
        echo "ERROR: Prepare Failed <br>";
    }

    echo "<br>";
    $stmt->close();
    $conn->close();
?>
</body>
