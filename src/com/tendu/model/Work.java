package com.tendu.model;

public class Work {
    private int id;
    private String title;
    private int school_id;
    private String info;
    private int hits;
    private String create_time;
    private int create_user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getSchool_id() {
        return school_id;
    }

    public void setSchool_id(int school_id) {
        this.school_id = school_id;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int getHits() {
        return hits;
    }

    public void setHits(int hits) {
        this.hits = hits;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public int getCreate_user() {
        return create_user;
    }

    public void setCreate_user(int create_user) {
        this.create_user = create_user;
    }

    @Override
    public String toString() {
        return "Need{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", school_id=" + school_id +
                ", info='" + info + '\'' +
                ", hits=" + hits +
                ", create_time='" + create_time + '\'' +
                ", create_user=" + create_user +
                '}';
    }

    public Work() {}

    public Work(String title,String info,Integer id) {
        this.title = title;
        this.info = info;
        this.id = id;
    }

    public Work(String title,String info,Integer school_id ,String create_time){
        this.title = title;
        this.info = info;
        this.school_id = school_id;
        this.id = id;
        this.create_time = create_time;
    }
}