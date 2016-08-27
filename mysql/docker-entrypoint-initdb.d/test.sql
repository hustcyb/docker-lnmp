USE `test`;

CREATE TABLE IF NOT EXISTS `student` (
	`id` INT NOT NULL AUTO_INCREMENT COMMENT '编号',
	`name` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '姓名',
	`age` INT NOT NULL COMMENT '年龄',
	PRIMARY KEY (`id`)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

REPLACE INTO `student`
(`id`, `name`, `age`)
VALUES
(1, 'Jim', 10),
(2, 'Tom', 11),
(3, 'Lucy', 12),
(4, 'Lily', 13);