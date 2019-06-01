package com.tendu.model;

public class School {

    private Integer id;
    private String school_name;
    private String create_time;
    private int isGo;
    private int isNeed;
    private String history;
    private String info;

    public Integer getId() {
        return id;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    public String getSchool_name() {
        return school_name;
    }

    public void setSchool_name(String school_name) {
        this.school_name = school_name;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public int getIsGo() {
        return isGo;
    }

    public void setIsGo(int isGo) {
        this.isGo = isGo;
    }

    public int getIsNeed() {
        return isNeed;
    }

    public void setIsNeed(int isNeed) {
        this.isNeed = isNeed;
    }

    @Override
    public String toString() {
        return "School{" +
                "id=" + id +
                ", school_name='" + school_name + '\'' +
                ", create_time='" + create_time + '\'' +
                ", isGo=" + isGo +
                ", isNeed=" + isNeed +
                '}';
    }

    public School(){

    }

    public School(String school_name, Integer isNeed, Integer isGo) {
        this.school_name = school_name;
        this.isNeed = isNeed;
        this.isGo = isGo;
    }
}
