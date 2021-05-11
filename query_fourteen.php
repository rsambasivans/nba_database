<head><title>Amongst all teams in nba history that have made won above 60 percent of their games, show the teams that rank in the top 30% in both offensive and defensive rating</title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $query = "CALL query_fourteen();";
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
                echo "<tr><th> TEAM </th><th> SEASON </th><th> Offensive Rating </th><th> Defensive Rating </th></tr>";
                foreach($result as $row) {
                    array_push($dataPoints, array('x' => $row['ORtg'],
                                                  'y' => $row['DRtg']));
                    echo "<tr><td>".$row['TEAM']."</td>";
                    echo "<td>".$row['SEASON']."</td>";
                    echo "<td>".$row['ORtg']."</td>";
                    echo "<td>".$row['DRtg']."</td></tr>";
                }
                echo "</table>";
            }
        } else {
            echo "ERROR: Call to query_fourteen failed <br>";
        }
    } else {
        echo "ERROR: Prepare Failed <br>";
    }

    echo "<br>";
    $stmt->close();
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
         text: "Offensive and Defensive Ratings of Teams that have won 60% or more of their Games",
         fontFamily: 'tahoma'
      },
         axisY: {
            title: "Regular Season Offensive Rating"
         },
         axisX: {
            title: "Regular Season Offensive Rating"
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
