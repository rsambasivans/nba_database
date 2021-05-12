<head><title> List all players from "COUNTRY" that have played in the nba since 2000 and have played on at least 3 different teams with losing records? </title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $country = $_POST['country'];
    $query = "CALL query_five('".$country."');";
    if ($stmt = $conn->prepare($query)) {
        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $result->fetch_assoc();
            if (mysqli_num_rows($result) == 0) {
                echo "No Results";
            } else {
                echo "<h2> Results: </h2>";
                echo "<table border = \"5px solid black\">";
                echo "<tr><th> Nationality </th><th> Player </th><th> Number of Losing Teams </th></tr>";
                foreach($result as $row) {
                    echo "<tr><td>".$row['NATIONALITY']."</td>";
		    echo "<td>".$row['PLAYER']."</td>";
		    echo "<td>".$row['LosingTeams']."</td></tr>";
                }
                echo "</table>";
            }
        } else {
            echo "ERROR: Call to query_five failed <br>";
        }
    } else {
        echo "ERROR: Prepare Failed <br>";
    }

    echo "<br>";
    $stmt->close();
    $conn->close();
?>
</body>
