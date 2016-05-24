/**
 * Created by ZJDX on 2016/4/17.
 *
 */
//本页面三种轮询显示：
// 1.所有车的marker位置实时更新
// 2.点击某辆车，车的基本数据实时更新
// 3.输入框输入车ID查询，数据实时更新
// 后面两种轮询互斥，同一时刻智能有23中的一种轮询。


    /*-----show map----*/
var map = new AMap.Map('mapContainer', {
    resizeEnable: true,
    zoom:11,
    center: [120.12979,30.25949],

});
var markerList=new Array();
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
        content: carInfo.carId+"号车"
    });

    AMap.event.addListener(marker,'click',function(){
        clearInterval(stopGetInfoByMarerClick);//先停止对之前marker车的轮询更新。
        clearInterval(interval);//停止对输入框事件触发的轮询
        getInfoByMarerClick(carInfo.carId);
    });
    markerList[carInfo.carId]=marker;
}

/*hide chart */
document.getElementById("chart").style.display="none";
//update Marker when index.html is showed
var intervalUpdateMarker;
updateMarkerInterval();//页面启动就开始轮询更新marker
function updateMarkerInterval(){
    setTimeout( updateMarkerFisrstTime(),10000);//第一次是添加marker
    intervalUpdateMarker=setInterval(function() {//后面每次更新marker gps数据
            updateMarker();
        },
        10000);
}
function updateMarker(){
    $.ajax("showAllOnMap", {
        type: "GET",
        dataType: "json",
        success: function (data) {
            var carInfoArray;
            carInfoArray = eval(data);//parse json to object  ==val 解析json==
            var json = JSON.stringify(data);
            console.log("carInfoArray:"+carInfoArray);
            for(var i= 0;i<carInfoArray.length;i++)
            {
                markerList[carInfoArray[i].carId].setPosition([carInfoArray[i].gpsLongitude,carInfoArray[i].gpsLattude]);
            }

        },
        error: function () {
            clearInterval(intervalUpdateMarker);//cannot get data, stop read
            alert("error1");
            console.log("error2");
            /*  marker.center=[${carInfo.gpsLongitude},${carInfo.gpsLattude}];*/
        }

    });
}
function updateMarkerFisrstTime(){
    $.ajax("showAllOnMap", {
        type: "GET",
        dataType: "json",
        success: function (data) {
            var carInfoArray;
            carInfoArray = eval(data);//parse json to object  ==val 解析json==
            var json = JSON.stringify(data);
            //console.log(json);

            for(var i= 0;i<carInfoArray.length;i++)
            {
                showInMap(carInfoArray[i]);
                console.log("i:"+i);
            }

        },
        error: function () {
            alert("error1");
            console.log("error2");
            /*  marker.center=[${carInfo.gpsLongitude},${carInfo.gpsLattude}];*/
        }

    });
}

var stopGetInfoByMarerClick;
function getInfoByMarerClick(e){
    //first time,show data immediately, then read data every 10s
    setTimeout( updateInfo(e),10000);
    stopGetInfoByMarerClick=setInterval(function() {
            updateInfo(e);
        },
        10000);
}
var interval;
$("#searchCarDiv").keydown(function(){
    if(event.keyCode==13) {
        /* $('#searchPlace').submit();*/
        clearInterval(interval);
        clearInterval(stopGetInfoByMarerClick);
        //first time,show data immediately, then read data every 10s
        setTimeout( updateInfo($("#searchPlaceID").val()),10000);
        interval=setInterval(function() {
                updateInfo($("#searchPlaceID").val());
            },
            10000);
    }
});
//get data from server and show
function updateInfo(e){
    $.ajax("searchCar", {
        type: "GET",
        dataType: "json",
        data: {searchPlace:e},
        success: function (data) {
            var carInfo = eval(data);//parse json to object  ==val 解析json==
            var json = JSON.stringify(data);
            console.log(json);
            $('#speedNow').html(carInfo.speedCurrent);
            $('#battery').html(carInfo.power + '<b>/V</b>');
            $('#chargeTimes').text(carInfo.chargeTimes);
            //markerList[carInfo.carId].setPosition([carInfo.gpsLongitude,carInfo.gpsLattude]);
            //showInMap(carInfo);
        },
        error: function () {
            clearInterval(interval);//cannot get data, stop read
            alert("error1");
            console.log("error2");
            /*  marker.center=[${carInfo.gpsLongitude},${carInfo.gpsLattude}];*/
        }

    });
}