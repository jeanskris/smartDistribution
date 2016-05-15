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
@Service
public class CarBasicServiceImpl implements ICarBasicService {


    @Autowired() @Qualifier("generalDao")
    private GeneralDAOImpl generalDao;
    private Class clazz=CarBasic.class;

    public CarBasic findById(int id) {
        CarBasic carBasic=(CarBasic)generalDao.findById(clazz,id);
        return carBasic;
    }

    public List<CarBasic> findByProperty(String property,Object value){
        List<CarBasic> listCarBasic = (List<CarBasic>)generalDao.findByProperty(clazz,property,value);
        return listCarBasic;
    }
    public List<CarBasic> findAll(){
        List<CarBasic> allCarBasic = (List<CarBasic>)generalDao.findAll(clazz);
        return allCarBasic;
    }
    /*
     * 这里要有事务注解，默认readOnly=true,不设置的话会报错。
     * insert和update操作都要。
     */
    @Transactional(readOnly=false)
    public void add(CarBasic... carBasics)  {
            generalDao.save(carBasics);
    }


}
