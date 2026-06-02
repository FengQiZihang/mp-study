DROP DATABASE IF EXISTS `my-study`;
CREATE DATABASE `my-study`
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE `my-study`;

CREATE TABLE `address` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT DEFAULT NULL COMMENT 'User ID',
  `province` VARCHAR(10) DEFAULT NULL COMMENT 'Province',
  `city` VARCHAR(10) DEFAULT NULL COMMENT 'City',
  `town` VARCHAR(20) DEFAULT NULL COMMENT 'Town',
  `mobile` VARCHAR(20) DEFAULT NULL COMMENT 'Mobile',
  `street` VARCHAR(255) DEFAULT NULL COMMENT 'Street',
  `contact` VARCHAR(50) DEFAULT NULL COMMENT 'Contact',
  `is_default` BIT(1) DEFAULT b'0' COMMENT 'Default flag',
  `notes` VARCHAR(255) DEFAULT NULL COMMENT 'Notes',
  `deleted` BIT(1) DEFAULT b'0' COMMENT 'Deleted flag',
  PRIMARY KEY (`id`),
  KEY `idx_address_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `address` (`id`, `user_id`, `province`, `city`, `town`, `mobile`, `street`, `contact`, `is_default`, `notes`, `deleted`) VALUES
  (59, 2, 'Beijing', 'Beijing', 'Chaoyang', '13900112222', 'Jinyan Office', 'Rose', b'1', NULL, b'0'),
  (60, 1, 'Beijing', 'Beijing', 'Chaoyang', '13700221122', 'Xiuzheng Tower', 'Jack', b'0', NULL, b'0'),
  (61, 1, 'Shanghai', 'Shanghai', 'Pudong', '13301212233', 'Hangtou Road', 'Jack', b'1', NULL, b'0'),
  (63, 2, 'Guangdong', 'Foshan', 'Yongchun', '13301212233', 'Yongchun Hall', 'Rose', b'0', NULL, b'0'),
  (64, 3, 'Zhejiang', 'Hangzhou', 'Gongshu', '13567809102', 'Zhejiang University', 'Hope', b'1', NULL, b'0'),
  (65, 3, 'Zhejiang', 'Hangzhou', 'Gongshu', '13967589201', 'Zuoan Garden', 'Hope', b'0', NULL, b'0'),
  (66, 4, 'Hubei', 'Wuhan', 'Hankou', '13967519202', 'Tiantian Garden', 'Thomas', b'1', NULL, b'0');

CREATE TABLE `user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `username` VARCHAR(50) NOT NULL COMMENT 'Username',
  `password` VARCHAR(128) NOT NULL COMMENT 'Password',
  `phone` VARCHAR(20) DEFAULT NULL COMMENT 'Phone',
  `info` JSON NOT NULL COMMENT 'Profile info',
  `status` INT DEFAULT 1 COMMENT 'Status',
  `balance` INT DEFAULT NULL COMMENT 'Balance',
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created time',
  `update_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User table';

INSERT INTO `user` (`id`, `username`, `password`, `phone`, `info`, `status`, `balance`, `create_time`, `update_time`) VALUES
  (1, 'Jack', '123', '13900112224', JSON_OBJECT('age', 20, 'intro', 'easygoing youth', 'gender', 'male'), 1, 1600, '2023-05-19 20:50:21', '2023-06-19 20:50:21'),
  (2, 'Rose', '123', '13900112223', JSON_OBJECT('age', 19, 'intro', 'fresh student', 'gender', 'female'), 1, 600, '2023-05-19 21:00:23', '2023-06-19 21:00:23'),
  (3, 'Hope', '123', '13900112222', JSON_OBJECT('age', 25, 'intro', 'motivated youth', 'gender', 'male'), 1, 100000, '2023-06-19 22:37:44', '2023-06-19 22:37:44'),
  (4, 'Thomas', '123', '17701265258', JSON_OBJECT('age', 29, 'intro', 'grounded professional', 'gender', 'male'), 1, 800, '2023-06-19 23:44:45', '2023-06-19 23:44:45');
