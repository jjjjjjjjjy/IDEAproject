package com.itheima.service;

import com.itheima.pojo.Course;
import com.itheima.pojo.User;

import java.util.List;

public interface CourseService {
    //增加
    int addCourse(Course course);
    //删除
    int deleteCourseById(int id);
    //修改
    int updateCourse(Course course);

    //修改
    int updateCourseBasicInfo(Course course);

    //查询
    Course queryCourseById(int id);
    //查询全部的课程
    List<Course> queryAllCourse();

    Course queryCourseByName(String courseName);
    //判课程断名是否重复
    Boolean isCourseExit(String name);
    //判断是否有该用户
    Boolean isUserExist(String username,String password);

    int register(User user);
}
