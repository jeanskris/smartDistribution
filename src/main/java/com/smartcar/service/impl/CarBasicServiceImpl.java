package com.smartcar.service.impl;

import com.smartcar.dao.GeneralDAOImpl;
import com.smartcar.model.CarBasic;
import com.smartcar.service.interfaces.ICarBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by ZJDX on 2016/4/11.
 */

@Service("carBasicService")
public class CarBasicServiceImpl implements ICarBasicService {


    @Autowired() @Qualifier("generalDao")
    GeneralDAOImpl generalDao;
    private Class clazz=CarBasic.class;

    public CarBasic findById(int id) {
        CarBasic carBasic=(CarBasic)generalDao.findById(clazz,id);
        return carBasic;
    }

    public List<CarBasic> findByProperty(String property,Object value){
        List<CarBasic> listCarBasic = (List<CarBasic>)generalDao.findByProperty(clazz, property, value);
        return listCarBasic;
    }
    public List<CarBasic> findAll(){
        List<CarBasic> allCarBasic = (List<CarBasic>)generalDao.findAll(clazz);
        return allCarBasic;
    }


    public void add(CarBasic... carBasics)  {
            generalDao.save(carBasics);
    }

    public void update(CarBasic... carBasics){
        generalDao.update(carBasics);
    }

}
