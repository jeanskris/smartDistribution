package com.smartcar.service.impl;

import com.smartcar.dao.GeneralDAOImpl;
import com.smartcar.mina.CarHandler;
import com.smartcar.model.CarInfo;
import com.smartcar.service.interfaces.ICarInfoService;
import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ZJDX on 2016/4/18.
 */

@Service("carInfoService")
public class CarInfoServiceImpl implements ICarInfoService{
    @Autowired() @Qualifier("generalDao")
    GeneralDAOImpl generalDao;
    private Class clazz=CarInfo.class;
    private final static Logger logger=   Logger.getLogger(CarInfoServiceImpl.class);

    public CarInfo findById(int id){
        System.out.println("generalDao " + generalDao);
        if(id<0) {
            logger.error("findById id is invalid");
            return null;
        }
        CarInfo carInfo=(CarInfo)generalDao.findById(clazz,id);
        return carInfo;
    }
    public List<CarInfo> findAll(){
        List<CarInfo> allCarInfo = (List<CarInfo>)generalDao.findAll(clazz);
        return allCarInfo;
    }
    public List<CarInfo> findByProperty(String property,Object value){
        List<CarInfo> listCarInfo = (List<CarInfo>)generalDao.findByProperty(clazz, property, value);
        return listCarInfo;
    }

    public void add(CarInfo... carInfos){
        generalDao.save(carInfos);
    }

    public void update(CarInfo... carInfos){
        generalDao.update(carInfos);
    }

    public void updatePower(byte[] buffer) {
        CarHandler carHandler = new CarHandler(buffer);

        int id = carHandler.getId();
        int data = carHandler.getData();

        try {
            CarInfo carInfo =generalDao.findById(CarInfo.class, id);

            if (carHandler.getCommandType() == 0x30) {
                System.out.println("updateCarInfo Come here!,carInfo:" + carInfo.getPower());
                carInfo.setPower((float) data);
                carInfo.setGpsLongitude(carInfo.getGpsLongitude() + (double) carHandler.getGpsLongitude());
                carInfo.setGpsLattude(carInfo.getGpsLattude()+(double) carHandler.getGpsLattude());
                generalDao.update(carInfo);
                System.out.println("power:" + generalDao.findById(CarInfo.class, id).getPower());
            }

        } catch (Exception e) {
            e.printStackTrace();
            logger.error("updatePower exception:",e);
        }
    }
}
