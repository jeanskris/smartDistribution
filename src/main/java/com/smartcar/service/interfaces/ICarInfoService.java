package com.smartcar.service.interfaces;

import com.smartcar.model.CarInfo;

import java.util.List;

/**
 * Created by ZJDX on 2016/4/18.
 */
public interface ICarInfoService {
    void add(CarInfo... carInfos);
    CarInfo findById(int id);
    List<CarInfo> findAll();
    List<CarInfo> findByProperty(String property,Object value);
}
