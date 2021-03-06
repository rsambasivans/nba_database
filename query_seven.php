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
		    $temp =  array("x" => strtotime($row["END_SEASON"].'-1-01') * 1000, "y" => $row["ThreeAttemptRatio"]);
		    array_push($dataPoints, $temp);
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
<html>
<head>
<script type="text/javascript">

window.onload = function () {
   var chart = new CanvasJS.Chart("chartContainer",
   {
      title: {
         text: "Percentage of total shots taken from the three point line for defensive leaders",
         fontFamily: 'tahoma'
      },
         axisY: {
            title: "Ratio of three point shot attempts to total shots"
         },
         axisX: {
            title: "End Season"
         },
         data: [{
            type: "scatter",
            color: "#369EAD",
            xValueType: "dateTime",
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
