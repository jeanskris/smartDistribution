package com.smartcar.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;

/**
 * Created by ZJDX on 2016/5/3.
 */
@Entity
public class Battery {
    private int baterryId;
    private String supplier;
    private String parameters;
    private Date cratedate;
    private String status;
    private Integer ampere;
    private Integer volt;

    @Id
    @Column(name = "baterry_id")
    public int getBaterryId() {
        return baterryId;
    }

    public void setBaterryId(int baterryId) {
        this.baterryId = baterryId;
    }

    @Basic
    @Column(name = "supplier")
    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    @Basic
    @Column(name = "parameters")
    public String getParameters() {
        return parameters;
    }

    public void setParameters(String parameters) {
        this.parameters = parameters;
    }

    @Basic
    @Column(name = "cratedate")
    public Date getCratedate() {
        return cratedate;
    }

    public void setCratedate(Date cratedate) {
        this.cratedate = cratedate;
    }

    @Basic
    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "ampere")
    public Integer getAmpere() {
        return ampere;
    }

    public void setAmpere(Integer ampere) {
        this.ampere = ampere;
    }

    @Basic
    @Column(name = "volt")
    public Integer getVolt() {
        return volt;
    }

    public void setVolt(Integer volt) {
        this.volt = volt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Battery battery = (Battery) o;

        if (baterryId != battery.baterryId) return false;
        if (supplier != null ? !supplier.equals(battery.supplier) : battery.supplier != null) return false;
        if (parameters != null ? !parameters.equals(battery.parameters) : battery.parameters != null) return false;
        if (cratedate != null ? !cratedate.equals(battery.cratedate) : battery.cratedate != null) return false;
        if (status != null ? !status.equals(battery.status) : battery.status != null) return false;
        if (ampere != null ? !ampere.equals(battery.ampere) : battery.ampere != null) return false;
        if (volt != null ? !volt.equals(battery.volt) : battery.volt != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = baterryId;
        result = 31 * result + (supplier != null ? supplier.hashCode() : 0);
        result = 31 * result + (parameters != null ? parameters.hashCode() : 0);
        result = 31 * result + (cratedate != null ? cratedate.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (ampere != null ? ampere.hashCode() : 0);
        result = 31 * result + (volt != null ? volt.hashCode() : 0);
        return result;
    }
}
