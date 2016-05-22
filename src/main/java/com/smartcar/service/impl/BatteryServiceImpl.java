package com.smartcar.service.impl;

import com.smartcar.dao.GeneralDAOImpl;
import com.smartcar.model.Battery;
import com.smartcar.service.interfaces.IBatteryService;
import com.smartcar.service.interfaces.IBatteryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ZJDX on 2016/4/18.
 */
@Service
public class BatteryServiceImpl implements IBatteryService{
    @Autowired() @Qualifier("generalDao")
    GeneralDAOImpl generalDao;
    private Class clazz=Battery.class;


    public Battery findById(int id){
        Battery battery=(Battery)generalDao.findById(clazz,id);
        return battery;
    }
    public void add(Battery... batteries){
        generalDao.save(batteries);
    }
    public List<Battery> findAll(){
        List<Battery> allBattery = (List<Battery>)generalDao.findAll(clazz);
        return allBattery;
    }
    public void update(Battery...batteries){
        generalDao.update(batteries);
    }
}
