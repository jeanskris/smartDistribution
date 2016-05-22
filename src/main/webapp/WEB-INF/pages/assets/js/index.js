/**
 * Created by ZJDX on 2016/4/17.
 */

    /*-----show map----*/
var map = new AMap.Map('mapContainer', {
    resizeEnable: true,
    zoom:11,
    center: [120.12979,30.25949],

});

function showInMap(carInfo){
    var GPSData;
    GPSData=[carInfo.gpsLongitude,carInfo.gpsLattude];
    var marker = new AMap.Marker({
        icon: "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
        position:GPSData
    });
    marker.setMap(map);
    // 设置label标签
    marker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
        offset: new AMap.Pixel(0, -20),//修改label相对于maker的位置
        content: $("#searchPlaceID").val()+"号车"
    });
}

/*hide chart */
document.getElementById("chart").style.display="none";


var interval;
$("#searchCarDiv").keydown(function(){
    if(event.keyCode==13) {
       /* $('#searchPlace').submit();*/

        //first time,show data immediately, then read data every 10s
        setTimeout( updateInfo(),10000);
        interval=setInterval(function() {
                updateInfo();
            },
            10000);


    }
});

//get data from server and show
function updateInfo(){
    $.ajax("searchCar", {
        type: "GET",
        dataType: "json",
        data: {searchPlace: $("#searchPlaceID").val()},
        success: function (data) {
            var carInfo = eval(data);//parse json to object  ==val 解析json==
            var json = JSON.stringify(data);
            console.log(json);
            $('#speedNow').html(carInfo.speedCurrent);
            $('#battery').html(carInfo.power + '<b>/V</b>');
            $('#chargeTimes').text(carInfo.chargeTimes);
            showInMap(carInfo);
        },
        error: function () {
            clearInterval(interval);//cannot get data, stop read
            alert("error1");
            console.log("error2");
            /*  marker.center=[${carInfo.gpsLongitude},${carInfo.gpsLattude}];*/
        }

    });
}