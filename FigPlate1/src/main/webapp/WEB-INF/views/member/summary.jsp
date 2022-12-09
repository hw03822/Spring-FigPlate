<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/header" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무화과플레이트: 혜화동 맛집 검색</title>
<link rel="stylesheet" href="<c:url value='/css/default.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>">
<link rel="shortcut icon" href="<c:url value='/images/pagelogo.png'/>">
<link rel="stylesheet" href="<c:url value='/css/summary.css'/>">
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/percent.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
<script>
am5.ready(function() {

// Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
var root = am5.Root.new("chartdiv");

var arr = [];
arr = '${genderStatisticList}';
var count1 = 0;
var count2 = 0;
for(let i=0; i <arr.length; i++) {
   if(arr[i] == 1) {
      count1++;
   }else if(arr[i] == 2) {
      count2++;
   }
}

// Set themes
// https://www.amcharts.com/docs/v5/concepts/themes/
root.setThemes([
  am5themes_Animated.new(root)
]);

// Create chart
// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/
// Create series
// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Series
var chart = root.container.children.push(
  am5percent.PieChart.new(root, {
    endAngle: 270
  })
);

var series = chart.series.push(
  am5percent.PieSeries.new(root, {
    valueField: "value",
    categoryField: "category",
    endAngle: 270
  })
);

series.states.create("hidden", {
  endAngle: -90
});

// Set data
// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Setting_data
series.data.setAll([{
  category: "남성",
  value: count1
}, {
  category: "여성",
  value: count2
}]);


series.appear(1000, 100);

 // end am5.ready()


// 연령대

   // Create root element
   // https://www.amcharts.com/docs/v5/getting-started/#Root_element
   var root = am5.Root.new("chartdiv2");


   // Set themes
   // https://www.amcharts.com/docs/v5/concepts/themes/
   root.setThemes([
     am5themes_Animated.new(root)
   ]);


   // Create chart
   // https://www.amcharts.com/docs/v5/charts/xy-chart/
   var chart = root.container.children.push(am5xy.XYChart.new(root, {
     panX: true,
     panY: true,
     wheelX: "panX",
     wheelY: "zoomX",
     pinchZoomX:true
   }));

   // Add cursor
   // https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
   var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
   cursor.lineY.set("visible", false);


   // Create axes
   // https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
   var xRenderer = am5xy.AxisRendererX.new(root, { minGridDistance: 30 });
   xRenderer.labels.template.setAll({
     rotation: -90,
     centerY: am5.p50,
     centerX: am5.p100,
     paddingRight: 15
   });

   var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
     maxDeviation: 0.3,
     categoryField: "ageGroup",
     renderer: xRenderer,
     tooltip: am5.Tooltip.new(root, {})
   }));

   var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
     maxDeviation: 0.3,
     renderer: am5xy.AxisRendererY.new(root, {})
   }));

   // Create series
   // https://www.amcharts.com/docs/v5/charts/xy-chart/series/
   var series = chart.series.push(am5xy.ColumnSeries.new(root, {
     name: "Series 1",
     xAxis: xAxis,
     yAxis: yAxis,
     valueYField: "value",
     sequencedInterpolation: true,
     categoryXField: "ageGroup",
     tooltip: am5.Tooltip.new(root, {
       labelText:"{valueY}"
     })
   }));

   series.columns.template.setAll({ cornerRadiusTL: 5, cornerRadiusTR: 5 });
   series.columns.template.adapters.add("fill", function(fill, target) {
     return chart.get("colors").getIndex(series.columns.indexOf(target));
   });

   series.columns.template.adapters.add("stroke", function(stroke, target) {
     return chart.get("colors").getIndex(series.columns.indexOf(target));
   });

   var arr2 = [];
   arr2 = '${ageGroupList}';
   var age1 = 0;
   var age2 = 0;
   var age3 = 0;
   var age4 = 0;
   var age5 = 0;
   var age6 = 0;
   var age7 = 0;
   var age8 = 0;
   
   for(let i = 0; i<arr2.length; i++) {
      if(arr2[i] == 1) {
         age1++;
      } else if(arr2[i] == 2) {
         age2++;
      } else if(arr2[i] == 3) {
         age3++;
      } else if(arr2[i] == 4) {
         age4++;
      } else if(arr2[i] == 5) {
         age5++;
      } else if(arr2[i] == 6) {
         age6++;
      } else if(arr2[i] == 7) {
         age7++;
      } else if(arr2[i] >= 8) {
         age8++;
      }
   }
   

   // Set data
   var data = [{
     ageGroup: "10대",
     value: age1
   }, {
      ageGroup: "20대",
     value: age2
   }, {
      ageGroup: "30대",
     value: age3
   }, {
      ageGroup: "40대",
     value: age4
   }, {
      ageGroup: "50대",
     value: age5
   }, {
      ageGroup: "60대",
     value: age6
   }, {
      ageGroup: "70대",
     value: age7
   }, {
      ageGroup: "80대 +",
     value: age8
   }];

   xAxis.data.setAll(data);
   series.data.setAll(data);


   // Make stuff animate on load
   // https://www.amcharts.com/docs/v5/concepts/animations/
   series.appear(1000);
   chart.appear(1000, 100);

   }); // end am5.ready()


</script>

</head>
<body>
<div class="wrapper">
   <article class="main-padding">
        <div class="except-main">
        	<section class="main-section">
				<div class="content">
					<h1 class="title">회원님 가게의 좋아요를 누른 통계</h1>
					<div class="item">
						<div id="chartdiv"></div>
						<div id="chartdiv2"></div>
					</div>
				</div>
				<div class="summary">
					<h1>회원님의 가게는 <span class="summary-value">${getMostAgeGroup}, ${getMostGenderStatistic}</span> 회원이 좋아합니다.</h1>
				</div>
			</section>
		</div>
   </article>

   <jsp:include page="/WEB-INF/views/include/header.jsp"/>
   <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>

</body>
</html>