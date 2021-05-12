<head><title>Delete Entry in Player Database </title><head>
<body>
<?php
    include 'open.php';
    $player_name = $_POST['player'];
    $player_number = $_POST['number'];
    $position = $_POST['position'];
    $experience = $_POST['experience'];

    echo "<br>";
    $query = "CALL delete_player(?, ?, ?, ?);";
    if (empty($player_name) || empty($player_number) || empty($position) || empty($experience)) {
        echo "ERROR: Missing Parameters <br>";
    } else {
        if ($stmt = $conn->prepare($query)) {
            $stmt->bind_param("siss", $player_name, $player_number, $position, $experience);
            if ($stmt->execute()) {
                $result = $stmt->get_result();
                $first = $result->fetch_assoc();
                if ($first['player_name'] == 'ENTRY_DOESNT_EXIST_IN_DB') {
                    echo "ERROR: Player doesn't exist in DB";
                } else {
                    echo "<h2> Results for Player Name after deletion is sucessful: </h2>";
                    echo "<table border = \"5px solid black\">";
                    echo "<tr><th> Player </th><th> Number </th><th> Position </th><th> Height </th><th> Weight </th><th> Birthdate </th>
                        <th> Nationality </th><th> Experience </th><th> College </th></tr>";
                    foreach($result as $row) {
                        echo "<tr><td>".$row['PLAYER']."</td>";
                        echo "<td>".$row['NUMBER']."</td>";
                        echo "<td>".$row['POS']."</td>";
                        echo "<td>".$row['HEIGHT']."</td>";
                        echo "<td>".$row['WEIGHT']."</td>";
                        echo "<td>".$row['BIRTH_DATE']."</td>";
                        echo "<td>".$row['NATIONALITY']."</td>";
                        echo "<td>".$row['EXPERIENCE']."</td>";
                        echo "<td>".$row['COLLEGE']."</td></tr>";
                    }
                    echo "</table>";
                }
            } else {
                echo "ERROR: Call to delete_player failed <br>";
            }
        } else {
            echo "ERROR: Prepare Failed <br>";
        }
        $stmt->close();
    }
    echo "<br>";
    $conn->close();
?>
</body>
