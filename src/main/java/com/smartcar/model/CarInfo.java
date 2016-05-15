package com.smartcar.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by ZJDX on 2016/5/3.
 */
@Entity
@Table(name = "car_info", schema = "", catalog = "smartcar")
public class CarInfo {
    private int carInfoId;
    private int carId;
    private Double gpsLongitude;
    private Double gpsLattude;
    private Integer chargeTimes;
    private Float power;
    private Integer totalMiles;
    private Integer speedCurrent;
    private Byte status;
    private Timestamp updateTime;

    @Id
    @Column(name = "car_info_id")
    public int getCarInfoId() {
        return carInfoId;
    }

    public void setCarInfoId(int carInfoId) {
        this.carInfoId = carInfoId;
    }

    @Basic
    @Column(name = "car_id")
    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    @Basic
    @Column(name = "GPS_longitude")
    public Double getGpsLongitude() {
        return gpsLongitude;
    }

    public void setGpsLongitude(Double gpsLongitude) {
        this.gpsLongitude = gpsLongitude;
    }

    @Basic
    @Column(name = "GPS_lattude")
    public Double getGpsLattude() {
        return gpsLattude;
    }

    public void setGpsLattude(Double gpsLattude) {
        this.gpsLattude = gpsLattude;
    }

    @Basic
    @Column(name = "charge_times")
    public Integer getChargeTimes() {
        return chargeTimes;
    }

    public void setChargeTimes(Integer chargeTimes) {
        this.chargeTimes = chargeTimes;
    }

    @Basic
    @Column(name = "power")
    public Float getPower() {
        return power;
    }

    public void setPower(Float power) {
        this.power = power;
    }

    @Basic
    @Column(name = "total_miles")
    public Integer getTotalMiles() {
        return totalMiles;
    }

    public void setTotalMiles(Integer totalMiles) {
        this.totalMiles = totalMiles;
    }

    @Basic
    @Column(name = "speed_current")
    public Integer getSpeedCurrent() {
        return speedCurrent;
    }

    public void setSpeedCurrent(Integer speedCurrent) {
        this.speedCurrent = speedCurrent;
    }

    @Basic
    @Column(name = "status")
    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    @Basic
    @Column(name = "update_time")
    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CarInfo carInfo = (CarInfo) o;

        if (carInfoId != carInfo.carInfoId) return false;
        if (carId != carInfo.carId) return false;
        if (gpsLongitude != null ? !gpsLongitude.equals(carInfo.gpsLongitude) : carInfo.gpsLongitude != null)
            return false;
        if (gpsLattude != null ? !gpsLattude.equals(carInfo.gpsLattude) : carInfo.gpsLattude != null) return false;
        if (chargeTimes != null ? !chargeTimes.equals(carInfo.chargeTimes) : carInfo.chargeTimes != null) return false;
        if (power != null ? !power.equals(carInfo.power) : carInfo.power != null) return false;
        if (totalMiles != null ? !totalMiles.equals(carInfo.totalMiles) : carInfo.totalMiles != null) return false;
        if (speedCurrent != null ? !speedCurrent.equals(carInfo.speedCurrent) : carInfo.speedCurrent != null)
            return false;
        if (status != null ? !status.equals(carInfo.status) : carInfo.status != null) return false;
        if (updateTime != null ? !updateTime.equals(carInfo.updateTime) : carInfo.updateTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = carInfoId;
        result = 31 * result + carId;
        result = 31 * result + (gpsLongitude != null ? gpsLongitude.hashCode() : 0);
        result = 31 * result + (gpsLattude != null ? gpsLattude.hashCode() : 0);
        result = 31 * result + (chargeTimes != null ? chargeTimes.hashCode() : 0);
        result = 31 * result + (power != null ? power.hashCode() : 0);
        result = 31 * result + (totalMiles != null ? totalMiles.hashCode() : 0);
        result = 31 * result + (speedCurrent != null ? speedCurrent.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        return result;
    }
}
