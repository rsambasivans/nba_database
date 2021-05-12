<head><title>Show which NBA players have been part of the exclusive 50-40-90 club for more than five percent of their career seasons</title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $query = "CALL query_two();";
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
                echo "<tr><th> Player </th><th> Number of 50-40-90 Seasons </th><th> Total Seasons Played </th></tr>";
                foreach($result as $row) {
                    echo "<tr><td>".$row['PLAYER']."</td>";
                    echo "<td>".$row['num_50_40_90_Seasons']."</td>";
                    echo "<td>".$row['seasonsPlayed']."</td>";
                }
                echo "</table>";
            }
        } else {
            echo "ERROR: Call to query_two failed <br>";
        }
    } else {
        echo "ERROR: Prepare Failed <br>";
    }

    echo "<br>";
    $stmt->close();
    $conn->close();
?>
</body>
