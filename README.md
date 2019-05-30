### 校内实训-援助源码base
____
#### 需求设计
![image](https://user-images.githubusercontent.com/19285429/58611014-3a112c80-82e0-11e9-9cca-6e1cc671542b.png)

#### 数据库表段设计
### 数据库设计
___

* 需求管理(Need)
```
表名: needs
字段名:
    id int primary key auto_increment   // 编号
    title varchar(255)                  // 标题
    risk_level int default 1            // 紧急状态
    school_id int                       // 发布学校
    info text                           // 详细信息
    hits int default 0                  // 阅读量
    create_time varchar(64)             // 发布时间
    create_user varchar(64)             // 发布者
```

* 工作动态(Work)
```
表名: works
字段名:
    id int primary key auto_increment   // 编号
    title varchar(255)                  // 标题
    info text                           // 详细信息
    school_id int                       // 发布学校
    hits int default 0                  // 阅读量
    create_time varchar(64)             // 发布时间/更新时间
    create_user varchar(64)             // 发布者
```

* 人才引进(Advr)
```
表名: advrs
字段名:
    id int primary key auto_increment   // 编号
    title varchar(255)                  // 标题
    school_id int                       // 发布学校
    info text                           // 详细信息
    hits int default 0                  // 阅读量
    create_time varchar(64)             // 发布时间/更新时间
    create_user varchar(64)             // 发布者
```