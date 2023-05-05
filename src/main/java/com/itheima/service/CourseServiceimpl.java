package com.itheima.service;

import com.itheima.dao.CourseMapper;
import com.itheima.pojo.Course;
import com.itheima.pojo.User;

import java.util.List;

public class CourseServiceimpl implements CourseService{
    //service调dao层：组合Dao

    private CourseMapper courseMapper;

    public CourseMapper getCourseMapper() {
        return courseMapper;
    }

    public void setCourseMapper(CourseMapper courseMapper) {
        this.courseMapper = courseMapper;
    }

    @Override
    public int addCourse(Course course) {
        return courseMapper.addCourse(course);
    }

    @Override
    public int deleteCourseById(int id) {
        return courseMapper.deleteCourseById(id);
    }

    @Override
    public int updateCourse(Course course) {
        return courseMapper.updateCourse(course);
    }

    @Override
    public int updateCourseBasicInfo(Course course) {
        return courseMapper.updateCourseBasicInfo(course);
    }

    @Override
    public Course queryCourseById(int id) {
        return courseMapper.queryCourseById(id);
    }

    @Override
    public List<Course> queryAllCourse() {
        return courseMapper.queryAllCourse();
    }

    @Override
    public Course queryCourseByName(String courseName) {
        return courseMapper.queryCourseByName(courseName);
    }

    @Override
    public Boolean isCourseExit(String name) {
        Course course = courseMapper.queryCourseByName(name);
        return course!=null;
    }

    @Override
    public Boolean isUserExist(String username, String password) {
        User user = courseMapper.queryUser(username,password);
        return user!=null;
    }

    @Override
    public int register(User user) {
        return courseMapper.addUser(user);
    }
}
