### 校内实训-援助源码base ![team-icon](https://img.shields.io/badge/Java-团队开发-important.svg?style=flat&logo=java) ![study](https://img.shields.io/badge/Mybatis-学习过程-informational.svg) ![china](https://jaywcjlove.github.io/sb/lang/chinese.svg)
____


### 知识学习 :heart_eyes:
#### git基本命令
```
git pull        // 同步远程仓库的代码到本地

git branch      // 查看分支
git checkout [分支名]          // 切换到指定分支(分支必须存在)
git checkout -b [分支名]       // 创建一个新的分支并切换到新分支
git branch -d [分支名]         // 删除指定分支

git status                      // 查看文件/暂存区状态(当文件被操作时,可以看到哪些文件被操作了)
git add [文件]                // 添加文件到暂存区
git commit -m "xxx"         // 将暂存区的文件提交到本地版本库
git push -u origin [分支名]                   // 将本地数据推送到指定分支
```
#### 导入数据库
    + 创建数据库 `create database tendu;`
    + 导入 `mysql -uroot -p tendu < tendu.sql`
#### 导出数据库
    + 导出指定数据库表 `mysqldump -uroot -p [数据库] [数据库表明] > 名字.sql`

#### 需求设计 :relaxed:
![image](https://user-images.githubusercontent.com/19285429/58611014-3a112c80-82e0-11e9-9cca-6e1cc671542b.png)

    
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
    create_user int             // 发布者
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
    create_user int             // 发布者
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
    create_user int             // 发布者
```

### 项目合并 :scream: :underage: :100:
#### [2019-06-02] 合并
![image](https://user-images.githubusercontent.com/19285429/58760508-5f659b00-856b-11e9-8871-05536139ca3d.png)

![image](https://user-images.githubusercontent.com/19285429/58760510-62608b80-856b-11e9-8a1b-d193f35ab852.png)

![image](https://user-images.githubusercontent.com/19285429/58760511-64c2e580-856b-11e9-8070-64dacd5b7476.png)

![image](https://user-images.githubusercontent.com/19285429/58760512-67bdd600-856b-11e9-80b1-18ddfdc500e0.png)