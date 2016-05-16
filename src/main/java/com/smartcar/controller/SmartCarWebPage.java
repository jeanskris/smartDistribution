package com.smartcar.controller;
import com.smartcar.dao.GeneralDAOImpl;
import com.smartcar.model.Battery;
import com.smartcar.model.CarBasic;
import com.smartcar.model.CarInfo;
import com.smartcar.model.response.CarBasicInfoJson;
import com.smartcar.service.impl.BatteryServiceImpl;
import com.smartcar.service.impl.CarBasicServiceImpl;
import com.smartcar.service.impl.CarInfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ZJDX on 2016/3/22.
 */
@Controller
public class SmartCarWebPage {
    public static final Log log= LogFactory.getLog(SmartCarWebPage.class);

    @Autowired
    CarBasicServiceImpl carBasicService ;
    @Autowired
    CarInfoServiceImpl carInfoService;
    @Autowired
    BatteryServiceImpl batteryService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index1(HttpServletRequest request){
        System.out.println("/");
        return new ModelAndView("index");
    }
    @RequestMapping(value = "/index.html", method = RequestMethod.GET)
    public ModelAndView index(){
        System.out.println("/index");
        ModelAndView mv = new ModelAndView("index");
        return mv;
    }

    @RequestMapping(value = "/smartcar-car-basic-info.html")
    public ModelAndView getCarBasicInfoPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("smartcar-car-basic-info");
        List<CarBasic> allCarBasic=carBasicService.findAll();
        List<CarBasicInfoJson> listCarBasicInfoJson=new ArrayList<CarBasicInfoJson>();
        for(CarBasic car:allCarBasic){
            List<CarInfo> carInfoList=carInfoService.findByProperty("carId",car.getCarId());
            CarInfo carInfo=carInfoList.get(carInfoList.size()-1);//获取最新记录
            CarBasicInfoJson carBasicInfoJson = new CarBasicInfoJson();
            carBasicInfoJson.setBaterryId(car.getBaterryId());
            carBasicInfoJson.setVin(car.getVin());
            carBasicInfoJson.setReleaseDate(car.getReleaseDate());
            carBasicInfoJson.setLiscenceDate(car.getLiscenceDate());
            carBasicInfoJson.setTotalMiles(carInfo.getTotalMiles());
            carBasicInfoJson.setChargeTimes(carInfo.getChargeTimes());
            carBasicInfoJson.setCurrentLocation(carInfo.getGpsLattude() + "," + carInfo.getGpsLongitude());
            carBasicInfoJson.setPower(carInfo.getPower());
            carBasicInfoJson.setStatus(carInfo.getStatus());
            listCarBasicInfoJson.add(carBasicInfoJson);
            //
        }
        mv.addObject("listCarBasicInfo",listCarBasicInfoJson);
        return mv;
    }
    @RequestMapping(value = "/smartcar-battery-basic-info.html")
    public ModelAndView getBatteryBasicInfoPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("smartcar-battery-basic-info");
        List<Battery> allBattery=batteryService.findAll();
        mv.addObject("listBattery",allBattery);
        return mv;
    }
    @RequestMapping(value = "/smartcar-sensor-info.html")
    public ModelAndView getSensorInfoPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("smartcar-sensor-info");
        return mv;
    }
    @RequestMapping(value = "/smartcar-runstate-info.html")
    public ModelAndView getRunstateInfoPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("smartcar-runstate-info");
        return mv;
    }
    @RequestMapping(value = "/smartcar-car-control.html")
      public ModelAndView getCarControlPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("smartcar-car-control");
        return mv;
    }
    @RequestMapping(value = "/smartcar-car-maintaince.html")
    public ModelAndView getCarMaintaincePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("smartcar-car-maintaince");
        return mv;
    }
    @RequestMapping(value = "/smartcar-server--maintaince.html")
    public ModelAndView getServerMaintaincePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("smartcar-server--maintaince");
        return mv;
    }
}
