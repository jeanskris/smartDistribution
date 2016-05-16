import com.smartcar.model.CarBasic;
import com.smartcar.service.impl.CarBasicServiceImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by ZJDX on 2016/4/16.
 */
public class Test {
    public static void main(String[] args) {//test reading from db
        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        CarBasicServiceImpl service = context.getBean(CarBasicServiceImpl.class);
        CarBasic carBasic=service.findById(1);
        System.out.println(carBasic);
    }
}
