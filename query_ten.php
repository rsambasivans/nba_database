<head><title> Show the average opposing FG% for the team that had the highest FG% in a given season </title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $season = $_POST['season'];
    $query = "CALL query_ten('".$season."');";
    if ($stmt = $conn->prepare($query)) {
        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $result->fetch_assoc();
            if (mysqli_num_rows($result) == 0) {
                echo "No Results";
            } else {
                echo "<h2> Results: </h2>";
                echo "<table border = \"5px solid black\">";
                echo "<tr><th> TEAM </th><th> FG% </th><th> Avg Opponent FG% </th></tr>";
                foreach($result as $row) {
                    echo "<tr><td>".$row['TEAM']."</td>";
                    echo "<td>".$row['FG_pct']."</td>";
                    echo "<td>".$row['OPP_FG_pct']."</td></tr>";
                }
                echo "</table>";
            }
        } else {
            echo "ERROR: Call to query_ten failed <br>";
        }
    } else {
        echo "ERROR: Prepare Failed <br>";
    }

    echo "<br>";
    $stmt->close();
    $conn->close();
?>
</body>
