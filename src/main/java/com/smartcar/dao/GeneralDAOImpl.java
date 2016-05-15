package com.smartcar.dao;

import com.smartcar.dao.interfaces.IGeneralDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * Created by ZJDX on 2016/3/25.
 */
/**
 * 这个类将dao成封装成了一个操作类。
 */
@Repository
public class GeneralDAOImpl implements IGeneralDAO {



    /**
     * 这个bean里面需要注入sessionFactory，所以把这个bean写在了配置中。
     */
    @Autowired
    private HibernateTemplate hibernateTemplate;

    public <T> T findById(Class<T> type, Serializable id) {
        return hibernateTemplate.get(type, id);
    }

    public <T> List<T> findAll(Class<T> type) {
        return hibernateTemplate.loadAll(type);
    }
    public <T> List<T> findByProperty(Class<T> type,String property,Object value){
        String hql="from "+type.getName()+" where "+property+"=?";
        List<T> list=(List<T>)hibernateTemplate.find(hql,value);
        return list;
    }
    public void save(Object... entities) {
        for (Object entity : entities) {
            hibernateTemplate.save(entity);
        }
    }

    public void saveOrUpdate(Object entity) {
        hibernateTemplate.saveOrUpdate(entity);
    }

    public void update(Object... entities) {
        for (Object entity : entities) {
            hibernateTemplate.update(entity);
        }
    }

    public void delete(Object... entities) {
        for (Object entity : entities) {
            if (entity != null) {
                hibernateTemplate.delete(entity);
            }
        }
    }

    public void deleteById(Class<?> type, Serializable id) {
        if (id == null) {
            return;
        }
        Object entity = findById(type, id);
        if (entity == null) {
            return;
        }
        delete(entity);
    }

    public void refresh(Object... entities) {
        for (Object entity : entities) {
            hibernateTemplate.refresh(entity);
        }
    }

    public void flush() {
        hibernateTemplate.flush();
    }
}

