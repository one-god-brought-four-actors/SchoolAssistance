package com.tendu.model;

public class Need {

    private int id;
    private String title;
    private int risk_level;
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

    public int getRisk_level() {
        return risk_level;
    }

    public void setRisk_level(int risk_level) {
        this.risk_level = risk_level;
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
                ", risk_level=" + risk_level +
                ", school_id=" + school_id +
                ", info='" + info + '\'' +
                ", hits=" + hits +
                ", create_time='" + create_time + '\'' +
                ", create_user=" + create_user +
                '}';
    }
}
