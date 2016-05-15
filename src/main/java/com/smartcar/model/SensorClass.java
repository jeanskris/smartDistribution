package com.smartcar.model;

import javax.persistence.*;

/**
 * Created by ZJDX on 2016/5/3.
 */
@Entity
@Table(name = "sensor_class", schema = "", catalog = "smartcar")
public class SensorClass {
    private int sensorId;
    private String sensorName;
    private String basicParameters;
    private String supplier;

    @Id
    @Column(name = "sensor_id")
    public int getSensorId() {
        return sensorId;
    }

    public void setSensorId(int sensorId) {
        this.sensorId = sensorId;
    }

    @Basic
    @Column(name = "sensor_name")
    public String getSensorName() {
        return sensorName;
    }

    public void setSensorName(String sensorName) {
        this.sensorName = sensorName;
    }

    @Basic
    @Column(name = "basic_parameters")
    public String getBasicParameters() {
        return basicParameters;
    }

    public void setBasicParameters(String basicParameters) {
        this.basicParameters = basicParameters;
    }

    @Basic
    @Column(name = "supplier")
    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SensorClass that = (SensorClass) o;

        if (sensorId != that.sensorId) return false;
        if (sensorName != null ? !sensorName.equals(that.sensorName) : that.sensorName != null) return false;
        if (basicParameters != null ? !basicParameters.equals(that.basicParameters) : that.basicParameters != null)
            return false;
        if (supplier != null ? !supplier.equals(that.supplier) : that.supplier != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sensorId;
        result = 31 * result + (sensorName != null ? sensorName.hashCode() : 0);
        result = 31 * result + (basicParameters != null ? basicParameters.hashCode() : 0);
        result = 31 * result + (supplier != null ? supplier.hashCode() : 0);
        return result;
    }
}
