package com.itheima.pojo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Course {
    private int id;
    private String name;
    private int hours;
    private int schools;
    private String coverImage;
    private MultipartFile file;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public int getHours() {
        return hours;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setSchools(int schools) {
        this.schools = schools;
    }

    public int getSchools() {
        return schools;
    }
    public void setCoverImage(String fileName) {
        this.coverImage=fileName;
    }
    public String getCoverImage(){
        return this.coverImage;
    }
}