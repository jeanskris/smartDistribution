package com.smartcar.service.interfaces;


import com.smartcar.model.Battery;

import java.util.List;

/**
 * Created by ZJDX on 2016/4/11.
 */
public interface IBatteryService {
    public  void add(Battery...batteries);
    public  Battery findById(int id);
    public  List<Battery> findAll();
    public void update(Battery...batteries);
}
