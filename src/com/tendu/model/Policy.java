package com.tendu.model;

public class Policy {
    private Integer id;
    private String title;
    private String filepath;
    private String create_time;
    private String create_user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getCreate_user() {
        return create_user;
    }

    public void setCreate_user(String create_user) {
        this.create_user = create_user;
    }

    public String getShortFileName(){
        return filepath.substring(filepath.lastIndexOf("/") + 1);
    }

    @Override
    public String toString() {
        return "Policy{" +
                "id=" + id +
                ", titile='" + title + '\'' +
                ", filepath='" + filepath + '\'' +
                ", create_time='" + create_time + '\'' +
                ", create_user='" + create_user + '\'' +
                '}';
    }
}
