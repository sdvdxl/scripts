CREATE DATABASE dashboard
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
USE dashboard;
SET NAMES utf8;

DROP TABLE IF EXISTS `dashboard_graph`;
CREATE TABLE `dashboard_graph` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(128) NOT NULL,
  `hosts` varchar(10240) NOT NULL DEFAULT '',
  `counters` varchar(1024) NOT NULL DEFAULT '',
  `screen_id` int(11) unsigned NOT NULL,
  `timespan` int(11) unsigned NOT NULL DEFAULT '3600',
  `graph_type` char(2) NOT NULL DEFAULT 'h',
  `method` char(8) DEFAULT '',
  `position` int(11) unsigned NOT NULL DEFAULT '0',
  `falcon_tags` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_sid` (`screen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `dashboard_screen`;
CREATE TABLE `dashboard_screen` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` char(128) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `tmp_graph`;
CREATE TABLE `tmp_graph` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `endpoints` varchar(10240) NOT NULL DEFAULT '',
  `counters` varchar(10240) NOT NULL DEFAULT '',
  `ck` varchar(32) NOT NULL,
  `time_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ck` (`ck`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `endpoint_alias`;
create table endpoint_alias (
	id int primary key auto_increment,
	endpoint varchar(255) not null unique,
	alias varchar(255)
) ENGINE=InnoDB AUTO_INCREMENT=1;;
