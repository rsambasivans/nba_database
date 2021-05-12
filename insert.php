<head><title>Insert Entry into Player Database </title><head>
<body>
<?php
    include 'open.php';
    $player_name = $_POST['player'];
    $player_number = $_POST['number'];
    $position = $_POST['position'];
    $height = $_POST['height'];
    $weight = $_POST['weight'];
    $birth_date = $_POST['date'];
    $nationality = $_POST['nationality'];
    $experience = $_POST['experience'];
    $college = $_POST['college'];
    if (empty($player_name) || empty($player_number) || empty($position) || 
        empty($height) || empty($weight) || empty($birth_date) || 
        empty($nationality) || empty($experience) || empty($college)) {
        echo "ERROR: Missing Parameters <br>";
    } else {
        echo "<br>";
        $query = "CALL insert_player(?, ?, ?, ?, ?, ?, ?, ?, ?);";
        if ($stmt = $conn->prepare($query)) {
            $stmt->bind_param("sisssssss", $player_name, $player_number, $position, $height, $weight, $birth_date, $nationality, $experience, $college);
            if ($stmt->execute()) {
                $result = $stmt->get_result();
                $first = $result->fetch_assoc();
                if ($first['player_name'] == 'ENTRY_EXISTS_ALREADY') {
                    echo "ERROR: Player exists in DB already";
                } else {
                    echo "<h2> Results: </h2>";
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
                echo "ERROR: Call to insert_player failed <br>";
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
