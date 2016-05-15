package com.smartcar.model;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by ZJDX on 2016/5/3.
 */
@Entity
@Table(name = "car_basic", schema = "", catalog = "smartcar")
public class CarBasic {
    private int carId;
    private int baterryId;
    private String vin;
    private Date releaseDate;
    private Date liscenceDate;

    @Id
    @Column(name = "car_id")
    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    @Basic
    @Column(name = "baterry_id")
    public int getBaterryId() {
        return baterryId;
    }

    public void setBaterryId(int baterryId) {
        this.baterryId = baterryId;
    }

    @Basic
    @Column(name = "Vin")
    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    @Basic
    @Column(name = "release_date")
    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    @Basic
    @Column(name = "liscence_date")
    public Date getLiscenceDate() {
        return liscenceDate;
    }

    public void setLiscenceDate(Date liscenceDate) {
        this.liscenceDate = liscenceDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CarBasic carBasic = (CarBasic) o;

        if (carId != carBasic.carId) return false;
        if (baterryId != carBasic.baterryId) return false;
        if (vin != null ? !vin.equals(carBasic.vin) : carBasic.vin != null) return false;
        if (releaseDate != null ? !releaseDate.equals(carBasic.releaseDate) : carBasic.releaseDate != null)
            return false;
        if (liscenceDate != null ? !liscenceDate.equals(carBasic.liscenceDate) : carBasic.liscenceDate != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = carId;
        result = 31 * result + baterryId;
        result = 31 * result + (vin != null ? vin.hashCode() : 0);
        result = 31 * result + (releaseDate != null ? releaseDate.hashCode() : 0);
        result = 31 * result + (liscenceDate != null ? liscenceDate.hashCode() : 0);
        return result;
    }
}
