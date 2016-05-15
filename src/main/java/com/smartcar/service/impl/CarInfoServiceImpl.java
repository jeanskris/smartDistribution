package com.smartcar.service.impl;

import com.smartcar.dao.GeneralDAOImpl;
import com.smartcar.model.CarInfo;
import com.smartcar.service.interfaces.ICarInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.List;

/**
 * Created by ZJDX on 2016/4/18.
 */
public class CarInfoServiceImpl implements ICarInfoService{
    @Autowired() @Qualifier("generalDao")
    private GeneralDAOImpl generalDao;
    private Class clazz=CarInfo.class;


    public CarInfo findById(int id){
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
}
