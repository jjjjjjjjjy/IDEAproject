package com.itheima.dao;
import com.itheima.pojo.Course;
import com.itheima.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;
import java.util.List;
public interface CourseMapper {
    //增加
    int addCourse(Course course);
    //删除
    int deleteCourseById(@Param("id") int id);
    //修改
    int updateCourse(Course course);
    //修改
    int updateCourseBasicInfo(Course course);
    //查询
    Course queryCourseById(@Param("id") int id);
    //查询全部的课程
    List<Course> queryAllCourse();

    Course queryCourseByName(@PathVariable("name") String courseName);

    User queryUser(@Param("username") String username,@Param("password") String password);

    int addUser(User user);
}
