package com.smartcar.service.interfaces;


import com.smartcar.model.CarBasic;

import java.util.List;

/**
 * Created by ZJDX on 2016/4/11.
 */
public interface ICarBasicService {
    void add(CarBasic... carBasic);
    CarBasic findById(int id);
    List<CarBasic> findAll();
    List<CarBasic> findByProperty(String property,Object value);
}
