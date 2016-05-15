package com.smartcar.utils;
import org.apache.log4j.Logger;


/**
 * Created by ZJDX on 2016/4/11.
 */
public class Log {

    private final static Boolean DEBUG = Boolean.FALSE;
    private static Logger log = Logger.getLogger(Log.class);

    public static <T> void println(T msg) {
        if (DEBUG) {
            log.info(msg);
        }
    }

    public static <T> void errorPrinln(T msg) {
        if (DEBUG) {
            log.error(msg);
        }
    }

    public static <T> void nullPointerError(T msg, Object target) {
        if (DEBUG) {
            log.error(msg + " Null Pointer Error " + target.getClass().getSimpleName());
        }
    }
}
