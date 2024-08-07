## 首次运行步骤

1. 导入数据（直接运行simple_mall.sql文件）
2. 以管理员身份打开nginx.exe文件
3. 使用cmd进入simplemall-ui文件，输入npm install，待下载完成后输入npm run dev运行前端程序
4. 进入后端程序，修改properties.yml文件，改为自己的相关信息
5. 启动后端程序





## 项目框架

```
Simple-mall
 ├── simplemall-admin（后端程序）
 │    ├── src.main.java
 |    |   ├── com.simplemall
 │    │        ├── controller
 │    │        ├── pojo
 │    │        ├── service
 │    │        │   └── Impl
 │    │        ├── mapper
 │    │        ├── config
 │    │        ├── filter
 │    │        ├── interception
 │    │        └── utils
 |    |
 │    └── resource
 │    └── com.simplemall
 |    |   └── mapperxml
 |    └──application.yml
 |
 ├── Nginx
 │   ├── nginx.conf （Nginx 的配置文件）
 │   └── nginx.exe （Nginx 的可执行文件）
 |
 ├── documents （图片资源）
 |
 ├── simplemall-ui（前端程序）
 │   ├── api
 │   ├── assets （静态资源文件）
 │   ├── components （总体页面布局）
 │   ├── router （前端路由）
 │   ├── utils （前端工具类，存放异步请求工具）
 │   ├──views （视图层）
 │   │  ├── Login
 │   │  ├── Register
 │   │  ├── FirstPage
 │   │  ├── products
 │   │  │   ├──ProductList
 │   │  │   ├──ProductAdd
 │   │  │   ├──ProductEdit
 │   │  |   └──ProductCategory
 │   │  ├── order
 │   │  │   ├──OrderList
 │   │  |   └──OrderRecord
 │   │  ├── users
 │   │  │   ├──UserList
 │   │  │   ├──UserAdd
 │   │  │   ├──UserEdit
 │   │  |   └──UserRole
 │   │  └── 404Page
 │   └──App.vue
 |
 └──simple_mall.sql（数据库与数据表）
```





## 内容介绍

本次课程设计主题为商城管理后台系统，主要页面包含：登陆注册页面、404页面、首页展示、商品管理及增删改查操作、商品类别增删改查操作、订单管理发货取消订单操作、订单历史记录查询、用户管理及增删改查操作、用户职能管理操作、个人页面展示与修改等。



## 页面展示

输入错误的url，会显示页面不存在：

![img](![img](./documents/404page.png)



登录页面:
![img](./documents/login.png)



注册页面：
![img](./documents/register.png)



首页展示：
![img](./documents/firstpage.png)



点击右上角头像之后可以选择退出登录或者进入个人主页：

![img](./documents/personal.png)

主页内容目前是只读，若要进行修改，需要点击下方修改按钮进行修改操作，这里的修改操作会影响到用户表中的数据。



商品列表页面：

![img](./documents/productlist.png)

可以进行完整的增删改查操作与分页条件查询操作。



添加商品页面：

![img](./documents/productedit.png)



商品类别页面：

![img](./documents/category.png)

 在商品类别页面进行增删改操作都会影响前面的商品列表中的数据展示。



订单信息查询页面：

![img](./documents/orderlist.png)

 在用户下单后，订单信息会出现在订单列表中，由管理员进行发货或者取消订单操作，当管理员进行操作之后，订单信息会被记录在订单记录中。

![img](./documents/orderrecord.png)

 若是管理员将订单取消，仓库中的商品库存会相对应地进行增加。



用户信息列表：

![img](./documents/userlist.png)

可以进行增删改查操作

职能管理与商品类别实现思路基本一致：

![img](./documents/orderrecord.png)

以上就是页面基本情况



## 数据表设计

产品表product：

![img](./documents/producttable.png)



类别表category：

![img](./documents/categorytable.png)



订单信息表order：

![img](./documents/ordertable.png)



用户信息表user：

![img](./documents/usertable.png)



职能表role：

![img](./documents/roletable.png)



每张表的表名+下划线+id字段都设置唯一非空主键自增编号，用于定位每条数据。

product表中的category_id为逻辑外键，用于关联category表。

category表仅包含三个字段：编号、类别名称以及类别数量。其中类别数量为空值，由后端进行统计并显示在前端页面

order表中u_id与p_name均为空值，由后端根据user_id和product_id进行匹配并将所获取到的数据显示在前端页面。此外order_time和operate_time也为空值，order_time由用户进行下单操作时获取当前时间进行填入，operate_time由管理员进行订单操作时获取当前时间进行填入。status表示商品操作状态——0表示未处理，1表示已处理。未处理的数据显示在订单列表页面，已处理的数据显示在订单记录页面。finish字段可以为空，表示是否完成发货操作——0表示取消发货，1表示完成发货。当管理员进行相对应的处理时，后端会对数据表中的数据进行相对应的赋值。

用户表user中的u_role为逻辑外键，用于关联role表中的role_id字段





## 技术介绍

|    后端    |        说明         |    前端     |     说明     |
| :--------: | :-----------------: | :---------: | :----------: |
| SpringBoot |   Web应用开发框架   |    Vue3     |   前端框架   |
|  Mybatis   |   数据持久化框架    | Vue-Router  |   路由框架   |
|   Nginx    |   静态资源服务器    | ElementPlus |  前端UI框架  |
|    OSS     |      对象存储       |    Axios    | 前端HTTP框架 |
|    JWT     |     JWT登录支持     |             |              |
|   Lombok   |   Java语言增强库    |             |              |
| PageHelper | MyBatis物理分页插件 |             |              |
|   Apifox   |  接口文档生成工具   |             |              |

