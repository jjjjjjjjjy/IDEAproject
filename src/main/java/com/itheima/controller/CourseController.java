package com.itheima.controller;

import com.itheima.pojo.Course;
import com.itheima.service.CourseService;
import com.itheima.service.CourseServiceimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

import com.itheima.pojo.Path;

import static com.itheima.pojo.Path.IMG_PATH;

@Controller
@RequestMapping("/course")
public class CourseController {
    //controller调用service层
    @Autowired
    @Qualifier("CourseServiceimpl")
    private CourseService courseService = new CourseServiceimpl();

    //查询全部课程并且返回到一个课程展示页面
    @RequestMapping("/allCourse")
    public String list(Model model){
        List<Course> list = courseService.queryAllCourse();
        model.addAttribute("list",list);
        return "allCourse";
    }
    @RequestMapping("/toAddCourse")
    public String toAddPaper(){
        return "addCourse";
    }


    @RequestMapping("/addCourse")
    public String addCourse(@RequestParam("name") String name,@RequestParam("hours") int hours,@RequestParam("schools") int schools,@RequestParam("file") MultipartFile file)throws IOException {
        Course course = new Course();
        course.setName(name);
        course.setHours(hours);
        course.setSchools(schools);
        course.setFile(file);
        Map<String,Object> result=new HashMap<>();
        if (courseService.isCourseExit(course.getName()))
        {
            result.put("success",false);
            result.put("message","课程名已存在");
            System.out.println(result);
            return "addCourse";
        }else {
            if (!file.isEmpty()) {
                //原始文件名称
                String fileName = file.getOriginalFilename();
                String filePath = IMG_PATH +fileName;
                try {
                    // 保存文件
                    file.transferTo(new File(filePath));
                    course.setCoverImage(fileName);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else {
                course.setCoverImage("default.png");
            }
            System.out.println("addCourse--->"+course);
            courseService.addCourse(course);
            result.put("success",true);
            result.put("message","新增课程成功");
            System.out.println(result);
            return "redirect:/course/allCourse";//重定向
        }
    }
    @RequestMapping("/toUpdate")
    public String toUpdatePaper(int id,Model model){
        Course course = courseService.queryCourseById(id);
        model.addAttribute("QCourse",course);
        System.out.println("update--->"+course);
        return "updateCourse";
    }
    @RequestMapping("/updateCourse")
    public String updateCourse(Course course) throws IOException {
            MultipartFile file= course.getFile();
            if(file!=null){
                String fileName= file.getOriginalFilename();
                if(null!=fileName && fileName.equalsIgnoreCase("")){
                    courseService.updateCourseBasicInfo(course);
                    return "redirect:/course/allCourse";
                }
                String filePath=IMG_PATH+fileName;
                File saveFile=new File(filePath);
                try{
                    course.setCoverImage(fileName);
                    file.transferTo(saveFile);

                }catch (IOException e){
                    e.printStackTrace();
                }
            }
            System.out.println("updateCourse=>"+course);
            courseService.updateCourse(course);
            return "redirect:/course/allCourse";
        }

    //删除书籍
    @RequestMapping("/deleteCourse/{id}")
    public String deleteCourse(@PathVariable("id") int id){
        courseService.deleteCourseById(id);
        return "redirect:/course/allCourse";
    }
    //查询
    @RequestMapping("/queryCourse")
    public String queryCourse(String queryCourseName,Model model){
        Course course = courseService.queryCourseByName(queryCourseName);
        List<Course> list=new ArrayList<Course>();
        list.add(course);
        if(course==null){
            list=courseService.queryAllCourse();
            model.addAttribute("error","未查到");
        }
        model.addAttribute("list",list);
        return "allCourse";
    }
    @RequestMapping("/isCourseExist")
    public void isCourseExit(String name,HttpServletResponse response) throws IOException {
        System.out.println("para-->"+name);
        response.setCharacterEncoding("utf-8");
        if (courseService.isCourseExit(name)){
            response.getWriter().print("该课程名已存在，请修改");
        }else{
            response.getWriter().close();
        }
    }
}

