<head><title>Show the average regular season points per game for above 0.500 teams during in each of the last 20 seasons</title><head>
<body>
<?php
    include 'open.php';
    echo "<br>";
    $query = "CALL query_eleven();";
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
                echo "<tr><th> Season </th><th> Avg PPG </th></tr>";
                foreach($result as $row) {
                    $temp =  array("x" => strtotime(substr($row["SEASON"], 0, 4).'-1-01') * 1000, 
                                   "y" => $row["avg_pts"]);
                    array_push($dataPoints, $temp);
                    echo "<tr><td>".$row['SEASON']."</td>";
                    echo "<td>".$row['avg_pts']."</td></tr>";
                }
                echo "</table>";
            }
        } else {
        echo "ERROR: Call to query_eleven failed <br>";
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
         text: "Average PPG for above 0.500 teams",
         fontFamily: 'tahoma'
      },
         axisY: {
            title: "Regular Season Points Per Game"
         },
         axisX: {
            title: "Year"
         },
         data: [{
            type: "line",
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
