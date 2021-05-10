<head><title>Show the average regular season points per game for above 0.500 teams during in each of the last 20 seasons</title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $query = "CALL query_eleven();";
    if ($result = $conn->query($query)) {
        if (mysqli_num_rows($result) == 0) {
            echo "No Results";
        } else {
            echo "<h2> Results: </h2>";
            echo "<table border = \"5px solid black\">";
            echo "<tr><th> Season </th><th> Avg PPG </th></tr>";
            foreach($result as $row) {
                echo "<tr><td>".$row['SEASON']."</td>";
                echo "<td>".$row['avg_pts']."</td></tr>";
            }
            echo "</table>";
        }
    } else {
        echo "ERROR: Call to query_eleven failed <br>";
    }

    echo "<br>";
    $conn->close();
?>
</body>
