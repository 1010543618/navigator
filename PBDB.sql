/*********************************************************************************
 * PBDB数据库
 *-------------------------------------------------------------------------------
 * 版权所有: 中地数码
***********************************************************************************/

/*
1. 引擎：InnoDB
2. 字符集：utf8
3. 经纬度：decimal(10,7)
4. 时间：datetime
5. 字符串：varchar(255)
*/

SET NAMES utf8;
DROP DATABASE IF EXISTS PBDB;
CREATE DATABASE PBDB CHARSET utf8;
GRANT ALL ON PBDB.* to 'PBDB'@'%' IDENTIFIED BY '123456';
GRANT ALL ON PBDB.* to 'PBDB'@'localhost' IDENTIFIED BY '123456';
FLUSH PRIVILEGES;
SET NAMES utf8;
USE PBDB;

/*-----------------创 建 表-----------------*/
#古生物化石基础表
CREATE TABLE Paleo (
 PaleoGUID int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '古生物化石GUID',
 PaleoName varchar(255) COMMENT '古生物化石名称',
 PaleoClass varchar(255) COMMENT '古生物化石分类',
 JIE varchar(255) COMMENT '生物分类-界',
 MEN varchar(255) COMMENT '生物分类-门',
 GANG varchar(255) COMMENT '生物分类-纲',
 MU varchar(255) COMMENT '生物分类-目',
 KE varchar(255) COMMENT '生物分类-科',
 SHU varchar(255) COMMENT '生物分类-属',
 ZHONG varchar(255) COMMENT '生物分类-种',
 NamedPerson varchar(255) COMMENT '命名人',
 NamedTime datetime COMMENT '命名时间',
 Etymology varchar(2048) COMMENT '词源',
 FindedLayer varchar(255) COMMENT '发现地层',
 GeoAge varchar(255) COMMENT '地质时代',
 FindedPlace varchar(2048) COMMENT '发现地',
 -- LONG decimal(10,7) COMMENT '经度', 无法作为字段名
 LNG decimal(10,7) COMMENT '经度',
 LAT decimal(10,7) COMMENT '纬度',
 PaleoLocate varchar(255) COMMENT '古地理分布',
 Feature text COMMENT '特征（JSON）',
 Addition text COMMENT '附加属性（JSON）',
 PRIMARY KEY (PaleoGUID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '古生物化石基础表';

#古生物化石标本收藏表
CREATE TABLE Sample (
 SampleGUID int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '古生物化石标本GUID',
 PaleoGUID int UNSIGNED NOT NULL COMMENT '古生物化石GUID',
 SampleNo varchar(255) COMMENT '标本号',
 SampleSize varchar(255) COMMENT '标本大小',
 CollectionPlace varchar(2048) COMMENT '馆藏地',
 SavedType varchar(255) COMMENT '保存类型',
 FindedPlace varchar(2048) COMMENT '标本产地',
 PRIMARY KEY (SampleGUID),
 FOREIGN KEY (PaleoGUID) REFERENCES Paleo(PaleoGUID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '古生物化石标本收藏表';

#古生物化石文献表
CREATE TABLE Literature (
 LiteratureGUID int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '古生物化石文献GUID',
 PaleoGUID int UNSIGNED NOT NULL COMMENT '古生物化石GUID',
 LiteratureName varchar(255) COMMENT '文献名称',
 LiteratureType varchar(255) COMMENT '数据类型',
 LiteratureURL varchar(255) COMMENT '文献存储地址',
 PRIMARY KEY (LiteratureGUID),
 FOREIGN KEY (PaleoGUID) REFERENCES Paleo(PaleoGUID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '古生物化石文献表';

#古生物化石图片表
CREATE TABLE Picture (
 PictureGUID int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '古生物化石图片GUID',
 PaleoGUID int UNSIGNED NOT NULL COMMENT '古生物化石GUID',
 PictureName varchar(255) COMMENT '图片名称',
 PictureType varchar(255) COMMENT '图片类型',
 PictureURL varchar(255) COMMENT '图片地址',
 PRIMARY KEY (PictureGUID),
 FOREIGN KEY (PaleoGUID) REFERENCES Paleo(PaleoGUID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '古生物化石图片表';

#古生物化石科普表
CREATE TABLE KP (
 KPGUID int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '古生物化石科普GUID',
 PaleoGUID int UNSIGNED NOT NULL COMMENT '古生物化石GUID',
 KPName varchar(255) COMMENT '科普文章名称',
 KPType varchar(255) COMMENT '科普类型',
 KPContent text COMMENT '科普内容',
 KPEditer varchar(255) COMMENT '科普作者',
 KPPublisher varchar(255) COMMENT '科普发布单位',
 KPPublishTime datetime COMMENT '科普内容发布时间',
 PRIMARY KEY (KPGUID),
 FOREIGN KEY (PaleoGUID) REFERENCES Paleo(PaleoGUID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '古生物化石科普表';

#标准化石数据库数据字典
CREATE TABLE DIC (
 DICNO int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '数据字典编号',
 NODENO varchar(255) COMMENT '数据节点编号',
 NODENAME varchar(255) COMMENT '数据节点名称',
 NODEVAL varchar(255) COMMENT '数据节点值',
 PARENTNO varchar(255) COMMENT '父节点编号',
 ORDERNO varchar(255) COMMENT '顺序号',
 HOLDWORD varchar(255) COMMENT '保留字',
 PRIMARY KEY (DICNO)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '标准化石数据库数据字典';

#Paleobiology DataBase
CREATE TABLE PBTABLE (
 Matched_name varchar(255) NOT NULL COMMENT '古生物名称',
 Matched_rank varchar(255) COMMENT '古生物分类-种',
 Early_interval varchar(255) COMMENT '早期地质年代',
 Late_interval varchar(255) COMMENT '晚期地质年代',
 Paleolng varchar(255) COMMENT '古地理分布-经度',
 Paleolat varchar(255) COMMENT '古地理分布-纬度',
 Geoplate varchar(255) COMMENT '',
 Genus varchar(255) COMMENT '古生物分类-属',
 Family varchar(255) COMMENT '古生物分类-科',
 -- Order varchar(255) COMMENT '古生物分类-目', 无法作为字段名
 PBOrder varchar(255) COMMENT '古生物分类-目',
 PRIMARY KEY (Matched_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT 'Paleobiology DataBase';


/*-----------------视    图-----------------*/
CREATE VIEW `v_paleo`AS SELECT
  paleo.PaleoGUID,
  paleo.PaleoName,
  paleo.PaleoClass,
  paleo.JIE,
  paleo.MEN,
  paleo.GANG,
  paleo.MU,
  paleo.KE,
  paleo.SHU,
  paleo.ZHONG,
  paleo.NamedPerson,
  paleo.NamedTime,
  paleo.Etymology,
  paleo.FindedLayer,
  paleo.GeoAge,
  paleo.FindedPlace as PaleoFindedPlace,
  paleo.LNG,
  paleo.LAT,
  paleo.PaleoLocate,
  paleo.Feature,
  paleo.Addition,
  sample.SampleGUID,
  sample.SampleNo,
  sample.SampleSize,
  sample.CollectionPlace,
  sample.SavedType,
  sample.FindedPlace as SampleFindedPlace,
  literature.LiteratureGUID,
  literature.LiteratureName,
  literature.LiteratureType,
  literature.LiteratureURL,
  picture.PictureGUID,
  picture.PictureName,
  picture.PictureType,
  picture.PictureURL,
  kp.KPGUID,
  kp.KPName,
  kp.KPType,
  kp.KPContent,
  kp.KPEditer,
  kp.KPPublisher,
  kp.KPPublishTime
FROM paleo
INNER JOIN literature ON literature.PaleoGUID = paleo.PaleoGUID
LEFT JOIN kp ON kp.PaleoGUID = paleo.PaleoGUID
LEFT JOIN picture ON picture.PaleoGUID = paleo.PaleoGUID
LEFT JOIN sample ON sample.PaleoGUID = paleo.PaleoGUID;


/*-----------------插入数据-----------------*/
