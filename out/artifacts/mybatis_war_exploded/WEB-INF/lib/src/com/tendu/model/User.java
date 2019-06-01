package com.tendu.model;

import java.sql.Driver;

public class User {
    private Integer id;
    private String username;
    private String password;
    private Integer schoolId;
    private String phone;
    private String create_time;
    private Integer create_user;
    private Integer level;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public Integer getCreate_user() {
        return create_user;
    }

    public void setCreate_user(Integer create_user) {
        this.create_user = create_user;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", schoolid=" + schoolId +
                ", phone='" + phone + '\'' +
                ", create_time='" + create_time + '\'' +
                ", create_user=" + create_user +
                ", level=" + level +
                '}';
    }

    public User() {

    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, Integer schoolId, String phone, Integer level, String create_time){
        this.username = username;
        this.password = password;
        this.schoolId = schoolId;
        this.phone = phone;
        this.level = level;
        this.create_time = create_time;
    }

    public User(String username, String password, String phone, Integer level){
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.level = level;
    }
}
