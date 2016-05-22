package com.smartcar.controller.info;

import com.smartcar.model.CarBasic;
import com.smartcar.model.CarInfo;
import com.smartcar.service.impl.CarBasicServiceImpl;
import com.smartcar.service.impl.CarInfoServiceImpl;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
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
        System.out.println("searchCar");
        Integer cid=id;
        System.out.println("id:"+id);
        CarBasic carBasic=carBasicService.findById(cid);

        List<CarInfo> carInfo=carInfoService.findByProperty("car_id", carBasic.getCarId());
        /*CarInfo carInfo1=carInfoService.findById(cid);
        System.out.println("searchCar:power"+carInfo1.getPower());*/
        return carInfo.get(carInfo.size()-1);//返回最后一条，也就是最新的数据
    }
    @RequestMapping(value = "/addCar")
    public void addCar(@RequestParam(value="addCar", required=false) CarBasic carBasic){
        System.out.println("addCar");

    }


}
