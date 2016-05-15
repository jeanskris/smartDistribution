package com.smartcar.dao.interfaces;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ZJDX on 2016/3/25.
 */
public interface IGeneralDAO {
    public <T> T findById(Class<T> type, Serializable id);

    public <T> List<T> findAll(Class<T> type);
    public <T> List<T> findByProperty(Class<T> type,String property,Object value);

    public void save(Object... entities);

    public void update(Object... entities);

    public void saveOrUpdate(Object entity);

    public void delete(Object... entities);

    public void deleteById(Class<?> type, Serializable id);

    public void refresh(Object... entities);

    public void flush();
}
