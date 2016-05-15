package com.smartcar.model.response;

import com.smartcar.dao.GeneralDAOImpl;
import com.smartcar.model.CarBasic;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * Created by ZJDX on 2016/4/13.
 */
public class CarBasicInfoJson {
    //basic
    private int carId;
    private int baterryId;
    private String vin;
    private Date releaseDate;
    private Date liscenceDate;
    //car_info
    private Integer totalMiles;
    private String currentLocation;
    private Integer chargeTimes;
    private Float power;
    private Byte status;


    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }


    public int getBaterryId() {
        return baterryId;
    }

    public void setBaterryId(int baterryId) {
        this.baterryId = baterryId;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public Date getLiscenceDate() {
        return liscenceDate;
    }

    public void setLiscenceDate(Date liscenceDate) {
        this.liscenceDate = liscenceDate;
    }

    public Integer getTotalMiles() {
        return totalMiles;
    }

    public void setTotalMiles(Integer totalMiles) {
        this.totalMiles = totalMiles;
    }

    public String getCurrentLocation() {
        return currentLocation;
    }

    public void setCurrentLocation(String currentLocation) {
        this.currentLocation = currentLocation;
    }

    public Integer getChargeTimes() {
        return chargeTimes;
    }

    public void setChargeTimes(Integer chargeTimes) {
        this.chargeTimes = chargeTimes;
    }

    public Float getPower() {
        return power;
    }

    public void setPower(Float power) {
        this.power = power;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

}
