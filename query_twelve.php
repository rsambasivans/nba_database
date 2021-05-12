<head><title> Show the win percentage, offensive rating, and defensive rating, for the top 30 percentile of the league in 3P% in a given season </title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $season = $_POST['season'];
    $query = "CALL query_twelve(?);";
    $dataPoints = array();
    if (empty($season)) {
        echo "ERROR: Please enter season <br>";
    } else {
        if ($stmt = $conn->prepare($query)) {
            $stmt->bind_param("s", $season);
            if ($stmt->execute()) {
                $result = $stmt->get_result();
                if (mysqli_num_rows($result) == 0) {
                    echo "No Results";
                } else {
                    echo "<h2> Results: </h2>";
                    echo "<table border = \"5px solid black\">";
                    echo "<tr><th> TEAM </th><th> SEASON </th><th> Win % </th><th> Offensive Rating </th><th> Defensive Rating </th><th> 3P% </th></tr>";
                    foreach($result as $row) {
                        $temp =  array("x" => ($row['win_pct'] * 100), 
                                   "y" => ($row['three_p_pct']*100));
                        array_push($dataPoints, $temp);
                        echo "<tr><td>".$row['TEAM']."</td>";
                        echo "<td>".$row['SEASON']."</td>";
                        echo "<td>".($row['win_pct'] * 100)."%</td>";
                        echo "<td>".$row['ORtg']."</td>";
                        echo "<td>".$row['DRtg']."</td>";
                        echo "<td>".($row['three_p_pct']*100)."%</td></tr>";
                    }
                    echo "</table>";
                }
            } else {
                echo "ERROR: Call to query_twelve failed <br>";
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

<html>
<head>
<script type="text/javascript">

window.onload = function () {
   var chart = new CanvasJS.Chart("chartContainer",
   {
      title: {
         text: "Win Percentage vs. 3P% for top 3P teams",
         fontFamily: 'tahoma'
      },
         axisY: {
            title: "3 Point Percentage"
         },
         axisX: {
            title: "Win Percentage"
         },
         data: [{
            type: "scatter",
            color: "#369EAD",
            xValueType: "number",
            dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
         }]
   });

	chart.render();
}

</script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>
<div id="chartContainer" style="height: 500; width: 100%;"></div>
</body>
</html>
