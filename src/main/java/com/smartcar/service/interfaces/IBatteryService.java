package com.smartcar.service.interfaces;


import com.smartcar.model.Battery;

import java.util.List;

/**
 * Created by ZJDX on 2016/4/11.
 */
public interface IBatteryService {
    void add(Battery...batteries);
    Battery findById(int id);
    List<Battery> findAll();
}
