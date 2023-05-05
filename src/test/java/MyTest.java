import com.itheima.pojo.Course;
import com.itheima.service.CourseService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MyTest {
    @Test
    public void test(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        CourseService courseServiceimpl = (CourseService) context.getBean("CourseServiceimpl");
        for (Course course : courseServiceimpl.queryAllCourse()) {
            System.out.println(course);
        }
    }
}
