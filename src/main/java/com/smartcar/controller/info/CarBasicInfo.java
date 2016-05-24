package com.smartcar.controller.info;

import com.smartcar.model.CarBasic;
import com.smartcar.model.CarInfo;
import com.smartcar.model.response.CarBasicInfoJson;
import com.smartcar.service.impl.CarBasicServiceImpl;
import com.smartcar.service.impl.CarInfoServiceImpl;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**com
 * Created by ZJDX on 2016/4/13.
 */
@RestController
public class CarBasicInfo {
    public static final Log log= LogFactory.getLog(CarBasicInfo.class);
   //com.mchange.v2.c3p0.ComboPooledDataSource
   //ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");

    @Autowired
    CarBasicServiceImpl carBasicService ;
    @Autowired
    CarInfoServiceImpl carInfoService;
    @RequestMapping(value = "/searchCar")
    public CarInfo searchCar(@RequestParam(value="searchPlace", required=false) Integer id){
        System.out.println("searchCar id:"+id);
        Integer cid=id;
        CarBasic carBasic=carBasicService.findById(cid);

        List<CarInfo> carInfo=carInfoService.findByProperty("car_id", carBasic.getCarId());
        /*CarInfo carInfo1=carInfoService.findById(cid);
        System.out.println("searchCar:power"+carInfo1.getPower());*/
        return carInfo.get(carInfo.size()-1);//返回最后一条，也就是最新的数据
    }

    @RequestMapping(value = "/showAllOnMap", method = RequestMethod.GET)
    public  List<CarBasicInfoJson> showAllOnMap(){
        List<CarBasic> allCarBasic=carBasicService.findAll();
        List<CarBasicInfoJson> listCarBasicInfoJson=new ArrayList<CarBasicInfoJson>();
        for(CarBasic car:allCarBasic){
            List<CarInfo> carInfoList=carInfoService.findByProperty("carId",car.getCarId());
            CarInfo carInfo=carInfoList.get(carInfoList.size()-1);//获取最新记录
            CarBasicInfoJson carBasicInfoJson = new CarBasicInfoJson();
            carBasicInfoJson.setCarId(car.getCarId());
            carBasicInfoJson.setBaterryId(car.getBaterryId());
            carBasicInfoJson.setVin(car.getVin());
            carBasicInfoJson.setReleaseDate(car.getReleaseDate());
            carBasicInfoJson.setLiscenceDate(car.getLiscenceDate());
            carBasicInfoJson.setTotalMiles(carInfo.getTotalMiles());
            carBasicInfoJson.setChargeTimes(carInfo.getChargeTimes());
            carBasicInfoJson.setGpsLattude(carInfo.getGpsLattude());
            carBasicInfoJson.setGpsLongitude(carInfo.getGpsLongitude());
            carBasicInfoJson.setPower(carInfo.getPower());
            carBasicInfoJson.setStatus(carInfo.getStatus());
            listCarBasicInfoJson.add(carBasicInfoJson);
        }
        return listCarBasicInfoJson;//返回最后一条，也就是最新的数据
    }
    @RequestMapping(value = "/searchCarByMapmarker")
    public CarInfo searchCarByMapmarker(@RequestParam(value="searchPlace", required=false) Integer id){
        System.out.println("searchCar id:"+id);
        Integer cid=id;
        CarBasic carBasic=carBasicService.findById(cid);
        List<CarInfo> carInfo=carInfoService.findByProperty("car_id", carBasic.getCarId());
        return carInfo.get(carInfo.size()-1);//返回最后一条，也就是最新的数据
    }
    @RequestMapping(value = "/addCar")
    public void addCar(@RequestParam(value="addCar", required=false) CarBasic carBasic){
        System.out.println("addCar");

    }


}
