-- 创建用户表
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID，自动递增，主键', 
    uid VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名，非空且唯一',            
    u_password VARCHAR(50) NOT NULL DEFAULT 'user123456' COMMENT '用户密码',                        
    u_name VARCHAR(100) NOT NULL COMMENT '用户姓名',                           
    u_img VARCHAR(255) COMMENT '用户头像',                                    
    u_email VARCHAR(100) COMMENT '用户邮箱',                                  
    u_create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，默认当前时间', 
    u_update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间，默认当前时间，更新时自动更新',
    role_id INT COMMENT '角色ID，逻辑外键'                                   
) COMMENT='用户表，存储用户信息';


-- 创建角色表
CREATE TABLE role (
    role_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '角色ID，自动递增，主键', 
    r_name VARCHAR(50) NOT NULL COMMENT '角色名称',                          
    r_desc VARCHAR(255) COMMENT '角色描述',                                       
    r_create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，默认当前时间' 
) COMMENT='角色表，存储角色信息';


-- 创建产品表
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '产品ID，自动递增，主键', 
    p_img VARCHAR(255) COMMENT '产品图片',                                     
    p_name VARCHAR(100) NOT NULL COMMENT '产品名称',                           
    p_price DECIMAL(10, 2) NOT NULL COMMENT '产品价格',                         
    p_number INT COMMENT '产品数量',                                   
    category_id INT COMMENT '类别ID，逻辑外键'                                
) COMMENT='产品表，存储产品信息';


-- 创建类别表
CREATE TABLE category (
    category_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '类别ID，自动递增，主键',
    c_name VARCHAR(100) NOT NULL COMMENT '类别名称',                            
    c_number INT COMMENT '类别总数量'                                    
) COMMENT='类别表，存储类别信息';

