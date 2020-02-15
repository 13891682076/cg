# Host: localhost  (Version: 5.5.53)
# Date: 2018-11-11 10:14:24
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "admin_groups"
#

DROP TABLE IF EXISTS `admin_groups`;
CREATE TABLE `admin_groups` (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `title` varchar(20) NOT NULL COMMENT '角色名称',
  `rights` text NOT NULL COMMENT '角色权限，json',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "admin_groups"
#

/*!40000 ALTER TABLE `admin_groups` DISABLE KEYS */;
INSERT INTO `admin_groups` VALUES (1,'系统管理员','[1,4,7,5,6,2,8,9,10,11,12,3,13,14,24,29,30,31,34,35,44,36,37,59,38,39,40,41,42,43,45,46,47,48,49,50,54,55,56,60,61,57,58]'),(2,'开发人员','[1,4,7,5,6,2,8,9,10,11,12,3]'),(3,'维护人员','[4,5,6]'),(4,'文章管理员','[24,25,26,27]'),(5,'员工管理','[29,30,55,56]'),(6,'行政办','[29,30,40,41]');
/*!40000 ALTER TABLE `admin_groups` ENABLE KEYS */;

#
# Structure for table "admin_menus"
#

DROP TABLE IF EXISTS `admin_menus`;
CREATE TABLE `admin_menus` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '上级菜单',
  `ord` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(20) NOT NULL,
  `controller` varchar(30) NOT NULL COMMENT '控制器名称',
  `method` varchar(30) NOT NULL COMMENT '菜单名称',
  `ishidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0正常显示，1隐藏',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

#
# Data for table "admin_menus"
#

/*!40000 ALTER TABLE `admin_menus` DISABLE KEYS */;
INSERT INTO `admin_menus` VALUES (1,0,0,'管理员管理','','',0,0),(2,0,0,'权限管理','','',0,0),(3,0,0,'系统设置','','',0,0),(4,1,0,'管理员列表','Admin','index',0,0),(5,1,0,'管理员添加','Admin','add',1,0),(6,1,0,'管理员保存','Admin','save',1,0),(7,4,0,'角色测试','Admin','tests',0,0),(8,2,0,'菜单管理','Menu','index',0,0),(9,2,0,'菜单添加','Menu','add',1,0),(10,2,0,'菜单保存','Menu','save',1,0),(11,2,0,'角色管理','Roles','index',0,0),(12,2,0,'角色保存','Roles','save',1,0),(13,3,0,'网站设置','Site','index',0,0),(14,3,0,'保存设置','Site','save',1,0),(15,0,0,'标签管理','','',0,0),(16,15,0,'频道标签','Labels','channel',0,0),(17,15,0,'资费标签','Labels','charge',0,0),(18,15,0,'地区标签','Labels','area',0,0),(19,0,0,'影片管理','','',0,0),(20,19,0,'影片列表','Video','index',0,0),(21,19,0,'添加影片','Video','add',1,0),(22,19,0,'保存影片','Video','save',1,0),(23,19,0,'图片上传','Video','upload_img',1,0),(24,0,0,'文章管理','','',0,0),(25,24,0,'文章列表','Article','index',0,1),(26,24,0,'文章添加','Article','add',0,0),(28,24,0,'文章删除','Article','delete',0,0),(29,0,0,'员工管理','','',0,0),(30,29,0,'员工列表','Gsyg','index',0,0),(31,29,0,'员工添加','Gsyg','add',0,0),(33,29,0,'员工删除','Gsyg','del',0,0),(34,0,0,'班次管理','','',0,0),(35,34,0,'班次列表','Banci','index',0,0),(36,0,0,'部门管理','','',0,0),(37,36,0,'部门列表','Bumen','index',0,0),(38,0,0,'栏目管理','','',0,0),(39,38,0,'栏目列表','Cate','index',0,0),(40,0,0,'车辆管理','','',0,0),(41,40,0,'车辆列表','bus','index',0,0),(42,40,0,'车辆添加','bus','add',0,0),(43,40,0,'车辆删除','bus','del',0,0),(44,34,0,'动态班次','Banci','dtbc',0,0),(45,0,0,'文件管理','','',0,0),(46,45,0,'文件列表','File','index',0,0),(47,0,0,'网站配置','','',0,0),(48,47,0,'配置信息','Config','index',0,0),(49,47,0,'微信','Config','weixin',0,0),(50,0,0,'上传下载','','',0,0),(51,50,0,'文件上传','Fileup','up',1,0),(52,50,0,'文件下载','Fileup','download',1,0),(53,50,0,'文件删除','Fileup','del',1,0),(54,50,0,'列表','Fileup','index',0,0),(55,0,0,'驾驶员管理','','',0,0),(56,55,0,'驾驶员列表','Jsy','index',0,0),(57,0,0,'售票员管理','','',0,0),(58,57,0,'售票员列表','Spy','index',0,0),(59,36,0,'部门删除','Bumen','del',0,0),(60,55,0,'驾驶员添加','Jsy','add',0,0),(61,55,0,'驾驶员删除','Jsy','del',0,0);
/*!40000 ALTER TABLE `admin_menus` ENABLE KEYS */;

#
# Structure for table "admins"
#

DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `truename` varchar(20) NOT NULL COMMENT '真实姓名',
  `gid` int(10) NOT NULL COMMENT '角色id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "admins"
#

/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','a66abb5684c45962d887564f08346e8d','城固县运司',1,0,1515650649),(2,'test','47ec2dd791e31e2ef2076caf64ed9b3d','tests',1,1,0),(4,'高祯慧','2a3f3fe679448e79c0e90cb4b7a46da3','高先生',1,0,1524871504),(6,'郑勇','0bc483ca65b6d2c72c03efe9e91e4e29','郑勇',2,1,1525153245),(7,'刘会哲','2e8e257bd8fe0e36b65026345b882b5b','刘会哲',4,0,1525184871),(8,'梁力军','3e7d0e133d9ef458e6a0e49813c067ce','梁力军',4,0,1526992981),(9,'王志强','f6611291eb6d0352970773a75c4d6c10','王志强',5,0,1539872481),(10,'王主任','214ef44a32f9c3cc171c4576f2da67b7','王体武',6,0,1541768012);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

#
# Structure for table "article"
#

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `cid` tinyint(3) DEFAULT NULL COMMENT '部门id',
  `keyword` varchar(150) DEFAULT NULL COMMENT '关键字',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `views` int(11) DEFAULT '0' COMMENT '浏览次数',
  `addtime` int(10) DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否置顶 1：置顶 0：不置顶',
  `content` text COMMENT '内容',
  `toptime` int(10) DEFAULT '0' COMMENT '置顶时间戳',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 CHECKSUM=1 ROW_FORMAT=DYNAMIC COMMENT='内容表';

#
# Data for table "article"
#

/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'陕西',0,'等地','等地','城固县汽车运输公司',0,1531315464,0,'<p>对对对是是</p>',1531317441),(2,'啊啊',0,'是是','是是','城固县汽车运输公司',0,1531315506,0,'<p>是是</p>',1531401963),(11,'我的文章',6,'的','的','城固县汽车运输公司',0,1531664964,1,'<p>444</p>',1531664977),(21,'汉中',3,'就','好','城固县汽车运输公司',0,1531665913,NULL,'<p>顶顶顶顶</p>',1540733676),(23,'洋县',2,'1','2','城固县汽车运输公司',0,1538753113,0,'<p>11111</p><p style=\"text-align: center;\"><img width=\"530\" height=\"340\" src=\"http://api.map.baidu.com/staticimage?center=107.029427,33.0738&zoom=13&width=530&height=340&markers=107.029427,33.0738\"/></p><p></p>',0),(24,'西安',3,'是','是','城固县汽车运输公司',0,1540904139,0,'<p>是是</p>',1535203495),(25,'票据',1,'调度','调度','城固县汽车运输公司',0,1536880596,NULL,'<p>111111111</p>',1538056784),(26,'陕西',7,'是是','是是','城固县汽车运输公司',0,1537366488,NULL,'<p>111111</p>',1538056812),(28,'城固县汽车运输公司合同',2,'订单','订单','城固县汽车运输公司',0,1537366806,NULL,'<h1 style=\"margin: 0px 0px 10px; color: rgb(64, 64, 64); text-transform: none; line-height: 40px; text-indent: 0px; letter-spacing: 1px; font-family:;\">从警24年 从基层民警一路走来的警花落马</h1><p class=\"article-info\" style=\"margin: 0px; color: rgb(153, 153, 153); text-transform: none; line-height: 26px; text-indent: 0px; letter-spacing: normal; font-family:;\"><span class=\"source\" style=\"color: rgb(51, 51, 51); margin-right: 6px; vertical-align: -2px;\">法制晚报</span>&nbsp;今天17:35</p><p style=\"margin: 0px 0px 26px;\"><strong>法制晚报·看法新闻</strong>（记者 庞岚）昨天，西宁市纪委监委发布消息：西宁市公安局出入境管理处处长汪玉芳涉嫌严重违纪违法，目前正接受纪律审查和监察调查。</p><p style=\"margin: 0px 0px 26px;\"><strong>体工队运动员</strong><strong>出身&nbsp;已从警24年</strong></p><p style=\"margin: 0px 0px 26px;\">简历显示，汪玉芳，女，汉族，1973年4月出生，青海省大通县人，大学本科学历，2004年2月加入中国共产党，1988年6月参加工作。</p><p style=\"margin: 0px 0px 26px;\">1988年6月—1994年11月 青海省省体工队运动员；</p><p style=\"margin: 0px 0px 26px;\">1994年11月—2000年11月 西宁市大通县公安局办事员；</p><p style=\"margin: 0px 0px 26px;\">2000年11月—2012年1月&nbsp;西宁市公安局城东分局东关大街派出所办事员、科员、教导员；</p><p style=\"margin: 0px 0px 26px;\">2012年1月—2014年2月&nbsp;西宁市公安局城中公安分局人民街派出所所长；</p><p style=\"margin: 0px 0px 26px;\">2014年2月—2015年3月&nbsp;西宁市公安局城中分局仓门街派出所所长；</p><p style=\"margin: 0px 0px 26px;\">2015年3月至今 西宁市公安局出入境管理处处长。<strong>&nbsp;</strong></p><p>&nbsp;</p>',1538525904),(32,'城固',2,'11','11','城固县汽车运输公司',0,1537972099,NULL,'<p>11111111111</p>',1537972117),(34,'陕西的方向',1,'啊啊','啊啊','城固县汽车运输公司',0,1538752395,0,'<p><span style=\"color: rgb(51, 51, 51); text-transform: none; text-indent: 0px; letter-spacing: 0.5px; font-family:;\">小刘顺利的怀了孕，可是作为高龄产妇面临着种种问题，妊娠反应更是严峻的很，但是最终还是克服了各种困难，熬到了预产期。小刘被推进产房，本来医生还担心，高龄产妇生产的时候会不会有危险，结果，小刘途中俄然喊叫要梳子，医生很疑惑，一看小刘的头，瞬间懵了。只见小刘头上青筋暴起，原来她现已疼得受不了了，要梳子是为了咬住。</span></p><p><img title=\"1538664682.gif\" src=\"/ueditor/php/upload/image/20181004/1538664682.gif\"/><img width=\"127\" height=\"100\" title=\"1538664683.jpg\" alt=\"1538664683.jpg\" src=\"/ueditor/php/upload/image/20181004/1538664683.jpg\"/></p><p style=\"text-align: center;\"><br/></p><p>&nbsp;</p>',0),(35,'我们的网站',10,'简介','调度','城固县汽车运输公司',0,1540904121,0,'<p>顶顶顶顶调度多多多</p><p style=\"text-align: center;\"><img width=\"267\" height=\"200\" title=\"1538752043.jpg\" alt=\"1538752043.jpg\" src=\"/ueditor/php/upload/image/20181005/1538752043.jpg\"/></p><p>&nbsp;</p>',0),(36,'城固是我家',1,'11111','11','城固县汽车运输公司',0,1539042059,0,'<p>555555555555555555555555</p><p style=\"text-align: center;\"><img width=\"364\" height=\"237\" title=\"1539042113.gif\" alt=\"002.gif\" src=\"/ueditor/php/upload/image/20181009/1539042113.gif\"/></p><p></p>',0),(37,'习近平的8个“治党妙喻”',10,'111111','111111111','城固县汽车运输公司',0,1539260788,0,'<p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">2014年10月8日，党的群众路线教育实践活动总结大会召开，习近平总书记对加强党的作风建设、全面推进从严治党作出重要部署。一直以来，习近平总书记对全面从严治党有自己的深刻理解，但又善于运用比喻来说明，一起来学习~</p><p><img src=\"/ueditor/php/upload/image/20181011/1539261085.jpg\" alt=\"\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p><img src=\"/ueditor/php/upload/image/20181011/1539261086.jpg\" alt=\"\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p><img src=\"/ueditor/php/upload/image/20181011/1539261086.jpg\" alt=\"\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p><img src=\"/ueditor/php/upload/image/20181011/1539261087.jpg\" alt=\"\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p><img src=\"/ueditor/php/upload/image/20181011/1539261087.jpg\" alt=\"\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p><img src=\"/ueditor/php/upload/image/20181011/1539261087.jpg\" alt=\"\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p><img src=\"/ueditor/php/upload/image/20181011/1539261088.jpg\" alt=\"\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p><img src=\"/ueditor/php/upload/image/20181011/1539261088.jpg\" alt=\"\"/><span class=\"img_descr\" style=\"margin: 5px auto; padding: 6px 0px; line-height: 20px; font-size: 16px; display: inline-block; zoom: 1; text-align: left; font-weight: 700;\"></span></p><p><img src=\"/ueditor/php/upload/image/20181011/1539261088.jpg\" alt=\"\"/></p><p><br/></p>',0),(38,'教育部公布，这三大证书早已取消，考了也没多大用',3,'啊','大大','城固县汽车运输公司',0,1539353528,1,'<p style=\"margin-top: 0px; margin-bottom: 26px; color: rgb(51, 51, 51); font-family: \">如今大学生早已不像以前一样含金量那么高，所以考证反而则成了当代大学生的核心竞争力。所谓“证多不压身”，抱着不考白不考的心思，许多人在大学中考了许许多多的证书，不管有用还是无用，对于毕业就迷茫的大学生来说，这也是一个保障。</p><p style=\"margin-top: 0px; margin-bottom: 26px; color: rgb(51, 51, 51); font-family: \">由于教育多方改革，据官方宣称的，有许多证书已经取消了，如果要考证的同学，可要注意了。不要去盲目的考取证书哦。</p><p style=\"margin-top: 0px; margin-bottom: 26px; color: rgb(51, 51, 51); font-family: \"><strong>一、会计从业资格证</strong></p><p><img src=\"https://p0.ssl.qhimgs4.com/t0158136abdbfc16408.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 26px; color: rgb(51, 51, 51); font-family: \">会计从业证是会计行业的入门许可证，有了这个证书才能够一步一步地初级、中级、高级、以及CPA往上考。但是会计法修正，取消了从业资格考试，也就是说能够直接报考初级会计资格证。提高了进入管帐和财政职业的门槛，难度的提高也是必须的。</p><p style=\"margin-top: 0px; margin-bottom: 26px; color: rgb(51, 51, 51); font-family: \"><strong>二、心理咨询师证</strong></p><p><img src=\"https://p0.ssl.qhimgs4.com/t01670fa9a8577a63e9.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 26px; color: rgb(51, 51, 51); font-family: \">心理咨询师证也是大学中报考的证书中比较多的一种，但是2017年11月是最后的一次考试，目前关于证书的取消一事，还只是取消，关于心理行业的合法性如何判断，未从业人员如何入行，之前考过的证书是否还有效，还需要重新建立一套体系化、专业化的培养与认证方案来确立和解决。</p><p style=\"margin-top: 0px; margin-bottom: 26px; color: rgb(51, 51, 51); font-family: \"><strong>三、房地产经纪人</strong></p><p><img src=\"https://p0.ssl.qhimgs4.com/t01dc855b0b1d1225b6.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 26px; color: rgb(51, 51, 51); font-family: \">首先说的是一个房地产经纪人，房地产经纪人，是指通过全国房地产经纪人资格考试或者资格互认，依法取得房地产经纪人资格，并经过注册，从事房地产经纪活动的专业人员。根据国家相关规定，于2014年暂停考试，并从准入类资格中取消，此后房地产经纪人相关资格证调整为水平评价类，并且于2015年恢复考试</p><p style=\"margin-top: 0px; margin-bottom: 26px; color: rgb(51, 51, 51); font-family: \">虽然这些证件的取消对于大部分同学来说打击还是很大，但是有没有想过，只要愿意做，你还会担心毕业没有证件缺乏优势么？</p><p><br/></p>',0),(39,'缩水',3,'','缩水','城固县汽车运输公司',0,1539353413,0,'<p>少时诵诗书所</p>',0),(40,'二里',5,'是是是是是是所所所所所','111','城固县汽车运输公司',0,1539520270,1,'<p>坎坎坷坷扩扩扩扩扩</p>',0),(41,'大盘',2,'','','城固县汽车运输公司',0,1539520358,0,'',0),(42,'小盘',7,'缩水','缩水','城固县汽车运输公司',0,1539520528,0,'<p>是是是是是是所所</p>',0),(43,'堵山',7,'5555','111','城固县汽车运输公司',0,1539520616,0,'<p>44444</p>',0),(44,'票价',5,'啊啊','啊啊啊','城固县汽车运输公司',0,1540904094,1,'',0),(45,'2018国产旗舰手机花样多，苹果三星感到压力了',7,'AA','DD','城固县汽车运输公司',0,1539783243,NULL,'<p style=\"margin-top: 0px; margin-bottom: 26px;\">伴随着国产智能手机行业的不断崛起，三星，苹果等国际大厂在中国的市场份额不断的受到了影响。消费不断升级的大环境下，国内手机品牌对于产品的创新也是越发的用心，不管是千元机还是高端旗舰都有着非常出色的产品竞争力表现。各家的旗舰机型展示了自家在科研技术与创新的成果。</p><p><img src=\"/ueditor/php/upload/image/20181017/1539783343.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 26px;\">OPPO Find X：颜值与性能兼备</p><p style=\"margin-top: 0px; margin-bottom: 26px;\">OPPO Find系列再很多人当中应该并不陌生，“小李子”出演的OPPO Find系列宣传片，那充满力量的眼神与那句不断循环的“Find me” 遍布线上线下，被消费者所熟知。如今具有探索精神的OPPO Find系列再一次给了人们惊喜，OPPO Find X的设计受到国内外媒体以及消费者的好评，可以说是一款不折不扣的完美旗舰机型。</p><p><img src=\"/ueditor/php/upload/image/20181017/1539783343.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 26px;\">当刘海屏充斥着国内手机市场，OPPO Find X率先开辟了手机全面屏 新时代，通过巧妙的3D双轨潜望设计，将手机前后摄像头，3D结构光技术，完美隐藏，解决了众多手机屏幕的刘海屏问题。同时更窄的边框和下巴，让手机屏幕的屏占比提升到了93.8%,带来了很好的视觉体验,更安全的3D结构光技术让面部解锁更加的安全。</p><p><img src=\"/ueditor/php/upload/image/20181017/1539783344.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 26px;\">对于追求时尚设计的OPPO来说，玩“色”一直是OPPO追求的完美时尚外观设计。OPPO Find X采用了曲面玻璃机身，“3D叠层流光点彩”工艺，提供波尔多红和冰珀蓝双色选择。让机身随光线反射角度会产生不同的渐变色彩，曲面与光影相结合，同时手机中框采用了与机身同样的配色，让机身浑然一体，将颜色又玩到了新的高度。</p><p><img src=\"/ueditor/php/upload/image/20181017/1539783344.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 26px;\">作为OPPO的旗舰机型，OPPO Find X搭载了最强的高通骁龙845处理器，配备了8GB RAM+256GB ROM的大内存组合，让手机使用流畅无烦恼；OPPO Find X依旧延续了OPPO一贯的拍照水准。前置摄像头采用2500万像素的索尼IMX576传感器，最大光圈f/2.0。由于光圈较大，前置摄像头在暗光拍摄和控噪方面表现极佳。后置采用了1600万像素+2000万像素的AI智能双摄，得益于索尼IMX519传感器/OIS光学防抖的加持，拍照更稳定，夜拍能力也得到了很大的提升。</p><p><img src=\"/ueditor/php/upload/image/20181017/1539783344.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 26px;\">作为拥有3400毫安的大电池的OPPO Find X闪充版，配备了50W的超级快充，让大电池充电时间长的烦恼一扫而光。OPPO创新性的使用了专用的charge-pump高效降压电路，可以将双电芯串联的电压降为一颗电芯的电压，整个通路的电流都不超过5A，大家不需要担心充电安全问题。</p><p><img src=\"/ueditor/php/upload/image/20181017/1539783344.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 26px;\">华为2018旗舰----华为Mate20强势登场</p><p style=\"margin-top: 0px; margin-bottom: 26px;\">作为华为2018年旗舰华为Mate20来势汹汹，其独特的外观设计引发众多网友热议。华为Mate 20系列全部采用全面屏设计，实现超大屏占比，并且通过紧凑的设计，无论是6.39英寸华为Mate 20 Pro，还是7.2英寸华为Mate 20 X都能实现舒适的单手握持感。</p><p><img src=\"/ueditor/php/upload/image/20181017/1539783345.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 26px;\">在机身背部融入了流体美学元素，借鉴了流水、风沙、飞鸟动感，以精致而优美的流线美学设计工艺，雕琢出流线机身，其八曲面整体机身与手掌高度贴合，手感出色。创新的四摄摄像头设计也让容下了1颗4000万广角镜头、1颗2000万超广角镜头、1颗800万长焦镜头和1颗闪光灯，让手机也能一机拍天下。带来了很好的拍照体验。</p><p><img src=\"/ueditor/php/upload/image/20181017/1539783345.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 26px;\">vivo NEX：科技至美的最佳诠释</p><p style=\"margin-top: 0px; margin-bottom: 26px;\">作为最早面世的vivo全面屏旗舰机vivo NEX，也通过不同的方式实现了全面屏设计。升降式摄像头设计完美的将手机刘海屏取消，前置摄像头采用了升降式的方案，隐藏在手机上方，只有在自拍模式、视像通话等情景下，前置摄像头才会升起，时间仅需0.8秒。</p><p><img src=\"/ueditor/php/upload/image/20181017/1539783345.jpg\"/></p><p><br/></p>',0);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

#
# Structure for table "banci"
#

DROP TABLE IF EXISTS `banci`;
CREATE TABLE `banci` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `xlmc` varchar(20) DEFAULT NULL COMMENT '线路名称',
  `qd` varchar(10) DEFAULT NULL COMMENT '起点站',
  `zd` varchar(10) DEFAULT NULL COMMENT '终点站',
  `tjd` varchar(40) DEFAULT NULL COMMENT '途径地',
  `gls` varchar(10) DEFAULT NULL COMMENT '公里数',
  `bxlx` varchar(20) DEFAULT NULL COMMENT '班线类型',
  `state` int(2) DEFAULT '1' COMMENT '状态1正常，0锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

#
# Data for table "banci"
#

/*!40000 ALTER TABLE `banci` DISABLE KEYS */;
INSERT INTO `banci` VALUES (1,'桔园--汉中','桔园','汉中','沙河营、柳林、铺镇','300','班线',1),(2,'廷水--汉中','廷水','汉中','天明、上元观镇、大河坎','15','班线',1),(3,'天明--汉中','天明','汉中','董家营、沙河营、柳林、铺镇','12','班线',1),(4,'城固--草庙','城固','草庙','五堵','24','班线',1),(5,'城固--廷水','城固','廷水','五堵','10','班线',1),(6,'城固--垣山','城固','垣山','原公','18','班线',1),(7,'城固--彤辉','城固','彤辉','文川','510','班线',1),(8,'城固--二里','城固','二里','董家营','65','班线',1),(9,'城固--二里','城固','二里','上元观','40','班线',1),(11,'城固--盐井','城固','盐井','三合','30','班线',1),(12,'城固--盘龙','城固','盘龙','桔园、双溪、小河','32','班线',1),(13,'城固--许彤','城固','彤辉','桔园','150','班线',1),(14,'城固--桃园','城固','桃园','桔园、双溪、小河','15','班线',1),(15,'城固--毕家河','城固','毕家河','龙头、文川、老庄','8','班线',1),(16,'城固--汪坝','城固','汪坝','董家营、天明','15','班线',1),(17,'城固--张桥','城固','张桥','桔园','8','班线',1),(18,'城固--长龙','城固','长龙','三合','30','班线',1),(19,'城固--高坝','城固','高坝','董家营、天明','32','班线',1),(20,'城固--小河','城固','小河','桔园、双溪、小河','60','班线',1),(21,'城固--卢家坡','城固','卢家坡','宝山','22','班线',1),(22,'城固--许庙','城固','许庙','五郎庙','500','班线',1),(23,'城固--杨滩','城固','杨滩','原公','34','班线',1),(24,'城固--滥坝','城固','滥坝','桔园、双溪、小河','51','班线',1),(25,'城固--崔家山','城固','崔家山','沙河营、柳林','400','班线（公交化运行）',1),(26,'城固--南乐','城固','南乐','沙河营','500','班线（公交化运行）',1),(27,'城固--西坝村','城固','西坝村','原公','80','班线',1),(28,'城固--东庙村','城固','东庙村','宝山','60','班线',1),(29,'城固--五渠寺村','城固','五渠寺村','柳树','60','班线',1),(30,'城固--元绣邱','城固','元绣邱','三合','50','班线',1),(31,'城固--阳光村','城固','阳光村','三合','40','班线',1),(32,'城固--毛岭村','城固','毛岭村','柳林','30','班线',1),(33,'高北--盐井','高北','盐井','二里','18','班线',1),(34,'城固--青龙寺','城固','青龙寺','原公','20','班线',1),(35,'城固--石马','城固','石马','小河','34','班线',1),(36,'城固--天明','城固','天明','董家营','130','班线',1),(37,'城固--板凳','城固','桔园','板凳','8','班线',1),(38,'城固--水磨','城固','水磨','桔园','10','班线',1),(39,'城固--鲁庄','城固','桔园','鲁庄','12','班线',1),(40,'城固--潘张付','城固','潘张付','桔园','20','班线',1),(41,'城固--砖溪','城固','砖溪','桔园、双溪、小河','30','班线',1),(42,'城固--山花','城固','山花','董家营、天明','8','班线',1),(43,'城固--桔园','城固','桔园','桔园','45','班线',1),(44,'城固--董家营','城固','董家营','董家营','20','班线',1),(45,'城固--大盘','城固','大盘','二里','30','班线',1),(46,'城固--潘彤','城固','彤辉','龙头','34','班线',1),(47,'城固--孙坪','城固','孙坪','五堵','115','班线',1),(48,'城固--三官','城固','三官','原公','36','班线',1),(49,'城固--东窑','城固','东窑','原公','20','班线',0),(50,'城固--鲜家庙','城固','鲜家庙','上元观','22','班线',1),(51,'城固--古路坝','城固','古路坝','董家营','10','班线',1),(52,'城固--郑家营','城固','郑家营','沙河营','10','班线',1),(53,'城固--景家山村','城固','景家山村','龙头、文川','15','班线',1),(54,'城固--柳树沟','城固','柳树沟','龙头','12','班线',1),(55,'城固--韩家坝村','城固','韩家坝村','桔园、双溪','10','班线',1),(56,'城固--金牛村','城固','五堵','金牛村','22','班线',1),(57,'二里--大盘','二里','大盘','二里','8','班线',1),(58,'城固--外北街村','城固','外北街村','沙河营','20','班线',1),(59,'城固--军张坝村','城固','军张坝村','龙头','10','班线',1),(60,'城固--斗山村','城固','斗山村','五郎庙','16','班线',1),(61,'城固--原公','城固','原公','五郎庙、原公','500','公交',1),(62,'城固--南沙河','城固','南沙河','董家营','420','公交',1),(63,'城固--宝山','城固','宝山','宝山','120','公交',1),(64,'城固--龙头','城固','龙头','沙河营','200','公交',1),(65,'纪念馆--江滨公园','纪念馆','张骞纪念馆','江滨公园','120','公交',1),(66,'城固--高铁','城固','高铁','一中','8','公交',0),(67,'城固--桃园','城固','桃园','桔园、双溪、小河','15','班线',0),(70,'城固--西安','城固','西安','西汉高速','240','长途',1),(71,'城固--宝鸡','城固','宝鸡','试试','260','长途',0),(72,'城固--桃园','城固','桃园','桔园、双溪、小河','15','班线',1),(73,'城固--桃园','城固','桃园','桔园、双溪、小河','15','班线',1),(74,'城固--桃园','城固','桃园','桔园、双溪、小河','15','班线',1),(75,'城固--桃园','城固','桃园','桔园、双溪、小河','15','班线',0),(80,'城固--桃园','城固','桃园','桔园、双溪、小河','15','班线',0),(82,'桔园--汉中','桔园','汉中','沙河营、柳林、铺镇','300','班线',0),(84,'城固--廷水','城固','廷水','五堵','10','班线',0),(85,'廷水--汉中','廷水','汉中','天明、上元观镇、大河坎','15','班线',0),(86,'城固--桃园','城固','桃园','桔园、双溪、小河','15','班线',1),(87,'廷水--汉中','廷水','汉中','天明、上元观镇、大河坎','15','班线',1),(88,'城固--砖溪','城固','砖溪','桔园、双溪、小河','30','班线',0),(89,'城固--砖溪','城固','砖溪','桔园、双溪、小河','30','班线',0),(90,'桔园--汉中','桔园','汉中','沙河营、柳林、铺镇','300','班线',0),(91,'城固--许彤','城固','彤辉','桔园','150','班线',0),(93,'天明--汉中','天明','汉中','董家营、沙河营、柳林、铺镇','20','班线',1),(94,'城固--堵山','城固','堵山','二里','30','循环',1),(95,'城固--堵山','城固','堵山','二里','30','循环',1),(96,'城固--新龙','城固','新龙','二里','60','循环',1),(97,'城固--新龙','城固','西北','二里','60','循环',1),(98,'城固--东西','城固','东西','上元观','22','班线',1);
/*!40000 ALTER TABLE `banci` ENABLE KEYS */;

#
# Structure for table "bm"
#

DROP TABLE IF EXISTS `bm`;
CREATE TABLE `bm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sort` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Data for table "bm"
#

/*!40000 ALTER TABLE `bm` DISABLE KEYS */;
INSERT INTO `bm` VALUES (1,'客运队',0,1),(2,'安技科',0,5),(3,'调度',1,10),(4,'站务',5,11),(5,'安检',1,12),(7,'公交公司',0,10),(8,'公交调度',7,65),(9,'财务科',0,20),(10,'行政办',0,15);
/*!40000 ALTER TABLE `bm` ENABLE KEYS */;

#
# Structure for table "bus"
#

DROP TABLE IF EXISTS `bus`;
CREATE TABLE `bus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ch` varchar(10) DEFAULT NULL COMMENT '车号',
  `type` varchar(50) DEFAULT NULL COMMENT '车型',
  `bus` varchar(10) DEFAULT NULL COMMENT '备注',
  `xsz` varchar(60) DEFAULT NULL COMMENT '缩略图',
  `yyz` varchar(60) DEFAULT NULL COMMENT '营运证',
  `pic` varchar(60) DEFAULT NULL COMMENT '车辆图片',
  `zw` double DEFAULT NULL COMMENT '座位',
  `rq` varchar(255) DEFAULT NULL COMMENT '车辆登记日期',
  `lj` varchar(12) DEFAULT NULL COMMENT '类型登记',
  `jsdj` double DEFAULT NULL COMMENT '技术等级',
  `dlzh` double DEFAULT '0' COMMENT '道路运输证号',
  `kyxl` varchar(255) DEFAULT NULL COMMENT '客运线路',
  `isjps` varchar(1) NOT NULL DEFAULT '1' COMMENT '是否安全jps,视频1，是，0，否',
  `syrq` varchar(12) NOT NULL DEFAULT '' COMMENT '审验日期',
  `record` text COMMENT '承包变更记录',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

#
# Data for table "bus"
#

/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (1,'陕F18852','福田 BJ56536B1DWA-S','01.18报废','uploads/20181014/170.jpg','uploads/20181004/012.jpg',NULL,14,'2010.01.19','小型中级',1,610722002345,'城固—元绣邱','','2018.01.18','<p>DDDDDDDDDDDDDDDDDD</p>'),(2,'陕F18896','福田 BJ56536B1DWA-S3','01.18报废','uploads/20181014/006.jpg','uploads/20181014/013.jpg',NULL,14,'2010.01.19','小型中级',1,610722002344,'城固—元绣邱','','2018.01.18',''),(3,'陕F18926','福田 BJ56536B1DWA-S','01.18报废','uploads/高祯慧.jpg','uploads/赵振华.jpg',NULL,14,'2010.01.19','小型中级',1,610722002342,'城固—金牛村','','2018.01.18','<p>JJJJJJJJJJJJDDDDDDDDD</p>'),(4,'陕F18913','福田 BJ56536B1DWA-S3','02.10报废',NULL,NULL,NULL,14,'2010.02.11','小型中级',1,610722002343,'城固—元绣邱','是','2018.02.10',NULL),(5,'陕F19022','福田 BJ56536B1DWA-S3','02.10报废',NULL,NULL,NULL,14,'2010.02.11','小型中级',1,610722002341,'城固—元绣邱','是','2018.02.10',NULL),(6,'陕F20331','东风EQ6606PT6','10.08报废',NULL,NULL,NULL,19,'2010.10.09','小型中级',1,610722002322,'城固—景家山','是','2018.04.08',NULL),(7,'陕F19268','金杯 SY6543US3BH','09.25报废',NULL,NULL,NULL,14,'2010.09.26','小型中级',1,610722002329,'城固—斗山','是',' 2018.03.25',NULL),(8,'陕F19261','金杯 SY6543US3BH','09.25报废',NULL,NULL,NULL,14,'2010.09.26','小型中级',2,610722002333,'城固—斗山','是',' 2018.03.25',NULL),(9,'陕F19265','金杯 SY6543US3BH','09.25报废',NULL,NULL,NULL,14,'2010.09.26','小型中级',2,610722002330,'城固—斗山','是',' 2018.03.25',NULL),(10,'陕F19281','金杯 SY6543US3BH','09.25报废','uploads/20181004/008.jpg','uploads/20181004/021.jpg',NULL,14,'2010.09.26','小型中级',1,610722002328,'城固—斗山','',' 2018.03.25',''),(13,'陕F22989','东风EQ6606P3G',NULL,NULL,NULL,NULL,19,'2011.09.09','小型中级',1,610722002320,'城固—三官','是',' 2018.03.08',NULL),(14,'陕F22998','东风EQ6606P3G',NULL,NULL,NULL,NULL,19,'2011.09.09','小型中级',1,610722002318,'城固—三官','是',' 2018.03.08',NULL),(15,'陕F22996','东风EQ6606P3G',NULL,NULL,NULL,NULL,19,'2011.09.09','小型中级',1,610722002319,'城固—三官','是',' 2018.03.08',NULL),(16,'陕F23086','中通LCK6601D3E',NULL,NULL,NULL,NULL,19,'2011.09.29','小型中级',1,610722002316,'城固—滥坝','是','2018.03.28',NULL),(17,'陕F23092','中通LCK6601D3E',NULL,NULL,NULL,NULL,19,'2011.09.29','小型中级',1,610722002314,'城固—滥坝','是','2018.03.28',NULL),(18,'陕F23082','中通LCK6601D3E',NULL,NULL,NULL,NULL,19,'2011.09.29','小型中级',1,610722002317,'城固—滥坝','是','2018.03.28',NULL),(19,'陕F23088','中通LCK6601D3E',NULL,NULL,NULL,NULL,19,'2011.09.29','小型中级',1,610722002315,'城固—滥坝','是','2018.03.28',NULL),(20,'陕F23133','东风EQ6606PT6',NULL,NULL,NULL,NULL,19,'2011.10.14','小型中级',1,610722002312,'城固—潘张付','是','2018.04.13',NULL),(21,'陕F23166','东风EQ6606PT6',NULL,NULL,NULL,NULL,19,'2011.10.14','小型中级',1,610722002310,'城固—潘张付','是','2018.04.13',NULL),(22,'陕F23156','东风EQ6606PT6',NULL,'xsz/刘晓丽.jpg','yyz/刘晓丽.jpg','pic/宇通.jpg',19,'2011.10.14','小型中级',1,610722002311,'城固—潘张付','','2018.04.13','<p>44444444444444444444hjjjjjjj</p>'),(23,'陕F23132','中通LCK6759D3',NULL,'','','pic/宇航员.jpg',30,'2011.10.20','中型中级',2,610722002313,'城固—毛岭','',' 2018.04.19',''),(24,'陕F23250','东风DFA6600K3CD',NULL,NULL,NULL,NULL,19,'2011.12.07','小型中级',1,610722002309,'城固—东庙村','是','2018.06.06',NULL),(25,'陕F23520','东风DFA6600K3CD',NULL,NULL,NULL,NULL,19,'2011.12.07','小型中级',1,610722002308,'城固—东庙村','是','2018.06.06',NULL),(26,'陕F23908','合客HK6758K',NULL,NULL,NULL,NULL,30,'2011.12.28','中型中级',1,NULL,'桔园—汉中','是','2018.06.27',NULL),(27,'陕F23918','合客HK6758K',NULL,NULL,NULL,NULL,30,'2011.12.28','中型中级',1,NULL,'桔园—汉中','是','2018.06.27',NULL),(28,'陕F23919','合客HK6758K',NULL,NULL,NULL,NULL,30,'2011.12.28','中型中级',1,NULL,'桔园—汉中','是','2018.06.27',NULL),(29,'陕F23851','合客HK6700K3',NULL,NULL,NULL,NULL,22,'2012.01.13','中型中级',1,610722002307,'城固—高坝村','是','2018.01.12 ',NULL),(30,'陕F28813','中通LCK6899H','','uploads/20181004/012.jpg','uploads/20181004/008.jpg',NULL,35,'2013.01.25','中型高一级',1,610722002306,'城固--杨西营村','',' 2018.01.24',''),(31,'陕F28980','骊山LS6603',NULL,NULL,NULL,NULL,19,'2013.01.29','小型中级',1,610722002304,'城固--外北街村','是','2018.01.28',NULL),(32,'陕F28966','骊山LS6603',NULL,NULL,NULL,NULL,19,'2013.01.29','小型中级',2,610722002305,'城固--外北街村','是','2018.01.28',NULL),(33,'陕F28988','骊山LS6603',NULL,NULL,NULL,NULL,19,'2013.01.29','小型中级',1,610722002303,'城固--外北街村','是','2018.01.28',NULL),(34,'陕F31182','东风EQ6760PCN40','CNG',NULL,NULL,NULL,30,'2013.07.18','中型中级',1,610701005265,'桔园—汉中','是','2018.07.14',NULL),(35,'陕F31116','东风EQ6760PCN40','CNG',NULL,NULL,NULL,30,'2013.07.18','中型中级',1,610701005263,'桔园—汉中','是','2018.07.14',NULL),(36,'陕F31161','东风EQ6760PCN40','CNG',NULL,NULL,NULL,30,'2013.07.18','中型中级',1,610701005264,'桔园—汉中','是','2018.07.14',NULL),(37,'陕F31861','东风EQ6800LHJ1',NULL,NULL,NULL,NULL,33,'2013.09.23','中型高一级',1,610722002301,'县内循环','是','2018.09.22',NULL),(38,'陕F31832','东风EQ6800LHJ1',NULL,NULL,NULL,NULL,33,'2013.09.23','中型高一级',1,610722002302,'县内循环','是','2018.09.22',NULL),(39,'陕F35238','中通LCK6601W4H','CNG',NULL,NULL,NULL,19,'2014.05.06','小型中级',2,610722002300,'县内循环','是',' 2018.05.05',NULL),(40,'陕F35628','东风EQ6760PCN40','CNG',NULL,NULL,NULL,NULL,'2014.05.28','中型中级',1,610722002299,'县内循环','是','2018.05.27 ',NULL),(41,'陕F35861','少林SLG6751T4E','CNG',NULL,NULL,NULL,NULL,'2014.06.19','中型中级',2,610722002298,'县内循环','是',' 2018.06.18',NULL),(42,'陕F35931','东风EQ6600PCN40','CNG',NULL,NULL,NULL,NULL,'2014.06.19','小型中级',1,610722002296,'城固--外北街村','是',' 2018.06.18',NULL),(43,'陕F35933','东风EQ6600PCN40','CNG',NULL,NULL,NULL,NULL,'2014.06.19','小型中级',1,610722002295,'城固--外北街村','是',' 2018.06.18',NULL),(44,'陕F35928','东风EQ6600PCN40','CNG',NULL,NULL,NULL,NULL,'2014.06.19','小型中级',1,610722002297,'城固--外北街村','是',' 2018.06.18',NULL),(45,'陕F36935','少林SLG6600T5F','CNG',NULL,NULL,NULL,NULL,'2014.11.05','小型中级',1,610722002294,'县内循环','是','2018.11.04',NULL),(46,'陕F36985','少林SLG6600T5F','CNG',NULL,NULL,NULL,NULL,'2014.11.05','小型中级',1,610722002293,'县内循环','是','2018.11.04',NULL),(47,'陕F39856','少林SLG6601C4Z',NULL,NULL,NULL,NULL,NULL,'2015.09.01','小型中级',2,610722002387,'县内循环','是',' 2018.08.31',NULL),(48,'陕F39602','少林SLG6601C4Z',NULL,NULL,NULL,NULL,NULL,'2015.09.01','小型中级',1,610722002386,'县内循环','是',' 2018.08.31',NULL),(49,'陕F51115','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.01.19','小型中级',1,610722002485,'城固—西坝村','是',' 2018.01.18',NULL),(50,'陕F51818','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.01.19','小型中级',1,610722002482,'城固—西坝村','是',' 2018.01.18',NULL),(51,'陕F51866','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.01.19','小型中级',1,610722002483,'城固—鲜家庙','是',' 2018.01.18',NULL),(52,'陕F51899','少林SLG6602C5E',NULL,NULL,NULL,NULL,NULL,'2016.01.19','小型中级',1,610722002486,'城固—西坝村','是',' 2018.01.18',NULL),(53,'陕F51869','中通LCK6601D4E',NULL,NULL,NULL,NULL,NULL,'2016.01.19','小型中级',1,610722002484,'城固—龙头村','是',' 2018.01.18',NULL),(54,'陕F51158','中通LCK6601D4E',NULL,NULL,NULL,NULL,NULL,'2016.01.27','小型中级',1,610722002496,'城固—东庙村','是','2018.01.26',NULL),(55,'陕F51856','中通LCK6601D4E',NULL,NULL,NULL,NULL,NULL,'2016.01.27','小型中级',1,610722002497,'城固—东庙村','是','2018.01.26',NULL),(56,'陕F51826','中通LCK6601D4E',NULL,NULL,NULL,NULL,NULL,'2016.01.29','小型中级',1,610722002500,'城固—东庙村','是','2018.01.28',NULL),(57,'陕F51828','中通LCK6601D4E',NULL,NULL,NULL,NULL,NULL,'2016.01.29','小型中级',1,610722002501,'城固—东庙村','是','2018.01.28',NULL),(58,'陕F51352','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.04.13','小型中级',1,610722002557,'循环','是','2018.04.12',NULL),(59,'陕F51382','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.04.13','小型中级',1,610722002558,'循环','是','2018.04.12',NULL),(60,'陕F51952','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.04.13','小型中级',1,610722002559,'循环','是','2018.04.12',NULL),(61,'陕F51953','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.04.13','小型中级',1,610722002560,'循环','是','2018.04.12',NULL),(62,'陕F51152','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.04.19','小型中级',1,610722002567,'城固—乐丰村','是','2018.04.18',NULL),(63,'陕F51693','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.04.19','小型中级',1,610722002568,'城固—乐丰村','是','2018.04.18',NULL),(64,'陕F51831','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.04.19','小型中级',1,610722002566,'城固—乐丰村','是','2018.04.18',NULL),(65,'陕F51291','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.04.21','小型中级',1,610722002584,'循环','是','2018.04.20',NULL),(66,'陕F51302','少林SLG6602C4E',NULL,'','','pic/cd0aabc54e07b011.jpg',0,'2016.04.21','小型中级',1,610722002583,'循环','','2018.04.20',''),(67,'陕F51593','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.04.21','小型中级',1,610722002582,'循环','是','2018.04.20',NULL),(68,'陕F51613','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.04.21','小型中级',1,610722002581,'循环','是','2018.04.20',NULL),(69,'陕F51623','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.04.21','小型中级',1,610722002580,'循环','是','2018.04.20',NULL),(70,'陕F51923','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.04.21','小型中级',1,610722002579,'循环','是','2018.04.20',NULL),(71,'陕F51325','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.04.27','小型中级',1,610722002598,'城固—乐丰村','是','2018.04.26',NULL),(72,'陕F51925','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.04.27','小型中级',1,610722002599,'城固—乐丰村','是','2018.04.26',NULL),(73,'陕F52096','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.04.27','小型中级',1,610722002597,'城固—乐丰村','是','2018.04.26',NULL),(74,'陕F52108','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.04.27','小型中级',2,610722002596,'城固—乐丰村','是','2018.04.26',NULL),(75,'陕F52205','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.04.27','小型中级',1,610722002595,'城固—乐丰村','是','2018.04.26',NULL),(76,'陕F52135','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.05.25','小型中级',1,610722002638,'城固—乐丰村','是','2018.04.24',NULL),(77,'陕F52163','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.05.25','小型中级',2,610722002637,'城固—乐丰村','是','2018.04.24',NULL),(78,'陕F52518','骊山LS6603C4',NULL,NULL,NULL,NULL,NULL,'2016.06.15','小型中级',1,610722002661,'循环','是','2018.06.14',NULL),(80,'陕F52585','骊山LS6603C4',NULL,NULL,NULL,NULL,NULL,'2016.06.15','小型中级',1,610722002664,'循环','是','2018.06.14',NULL),(81,'陕F52600','骊山LS6603C4',NULL,NULL,NULL,NULL,NULL,'2016.06.15','小型中级',1,610722002663,'循环','是','2018.06.14',NULL),(82,'陕F52618','骊山LS6603C4',NULL,NULL,NULL,NULL,NULL,'2016.06.15','小型中级',1,610722002659,'循环','是','2018.06.14',NULL),(83,'陕F52596','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.06.21','小型中级',1,610722002665,'循环','是','2018.06.20',NULL),(84,'陕F52689','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.06.21','小型中级',1,610722002666,'循环','是','2018.06.20',NULL),(85,'陕F52598','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.06.21','小型中级',1,610722002669,'循环','是','2018.06.20',NULL),(86,'陕F52526','少林SLG6602C4E',NULL,NULL,NULL,NULL,NULL,'2016.06.27','小型中级',1,610722002672,'循环','是','2018.06.26',NULL),(87,'陕F52659','中通LCK6601D4E',NULL,'','','pic/车辆.jpg',0,'2016.06.27','小型中级',1,610722002671,'循环','','2018.06.26',''),(88,'陕F53100','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.09.05','小型中级',1,610722002737,'城固—乐丰村','是','2018.09.04',NULL),(89,'陕F53186','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.09.05','小型中级',1,610722002738,'城固—乐丰村','是','2018.09.04',NULL),(90,'陕F53089','东风EQ6608LT3',NULL,NULL,NULL,NULL,NULL,'2016.09.05','小型中级',1,610722002739,'城固—乐丰村','是','2018.09.04',NULL),(91,'陕F53326','骊山LS6603C4',NULL,NULL,NULL,NULL,NULL,'2016.10.19','小型中级',1,610722002790,'城固—外北街','是','2018.10.18',NULL),(92,'陕F53285','骊山LS6603C4',NULL,NULL,NULL,NULL,NULL,'2016.10.19','小型中级',1,610722002791,'城固—外北街','是','2018.10.18',NULL),(93,'陕F53390','骊山LS6603C4',NULL,NULL,NULL,NULL,NULL,'2016.10.19','小型中级',1,610722002792,'城固—外北街','是','2018.10.18',NULL),(94,'陕F59038','少林SLG6602C5E',NULL,NULL,NULL,NULL,19,'2017.9.15','小型中级',1,610722003141,' 城固—西坝村','是','2018.9.14',NULL),(95,'陕F58632','少林SLG6602C5E',NULL,NULL,NULL,NULL,19,'2017.9.15','小型中级',1,610722003144,' 城固—西坝村','是','2018.9.14',NULL),(96,'陕F58901','少林SLG6602C5E',NULL,NULL,NULL,NULL,19,'2017.9.15','小型中级',1,610722003142,' 城固—西坝村','是','2018.9.14',NULL),(97,'陕F58921','少林SLG6602C5E',NULL,NULL,NULL,NULL,19,'2017.9.15','小型中级',1,610722003140,' 城固—西坝村','是','2018.9.14',NULL),(98,'陕F59050','少林SLG6602C5E',NULL,NULL,NULL,NULL,19,'2017.9.15','小型中级',1,610722003149,' 城固—西坝村','是','2018.9.14',NULL),(99,'陕F58602','少林SLG6602C5E',NULL,NULL,NULL,NULL,19,'2017.9.15','小型中级',1,610722003145,' 城固—西坝村','是','2018.9.14',NULL),(100,'陕F58651','少林SLG6602C5E',NULL,NULL,NULL,NULL,19,'2017.9.15','小型中级',1,610722003146,' 城固—西坝村','是','2018.9.14',NULL),(101,'陕F58935','少林SLG6602C5E',NULL,NULL,NULL,NULL,19,'2017.9.15','小型中级',1,610722003148,' 城固—西坝村','是','2018.9.14',NULL),(102,'陕F58903','少林SLG6602C5E',NULL,NULL,NULL,NULL,19,'2017.9.15','小型中级',1,610722003147,' 城固—西坝村','是','2018.9.14',NULL),(103,'陕F59062','少林SLG6602C5E',NULL,NULL,NULL,NULL,19,'2017.9.15','小型中级',1,610722003143,' 城固—西坝村','是','2018.9.14',NULL),(108,'陕F16666','少林62123333','2019年报废','',NULL,NULL,19,'2018-07-28 11:02:10','小型中级',1,612322196300,'城固--板凳','','2019-08-28 0','<p>1.王**2016年8月11日与公司签订合同，</p>'),(114,'21355','少林','呃呃呃呃呃呃呃呃呃','uploads\\20180728\\21341ece1fdc2ef457004dea2606628c.jpg',NULL,NULL,15,'2018-07-28 00:00:00','小型中级',1,4563212,'城固--天明','','2019-07-28 0','<p>45啊啊啊啊啊</p>'),(115,'啊啊啊啊啊','对对对调度多','调度','uploads\\20180728\\30f074837da5354876006ebecd070ec5.jpg',NULL,NULL,12,'2018-07-28 12:38:48','小型中级',2,0,'城固--孙平','','2018-07-28 1','<p>是是是是是是所</p>'),(116,'123','123','123','uploads\\20180728\\46d4e88ff74b6010cd4b21b846789597.jpg',NULL,NULL,123,'2018-07-28 16:45:05','123',123,123,'123','1','2018-07-28 0','<p>123</p>'),(117,'','','','',NULL,NULL,0,'','',0,0,'','1','',''),(118,'12345','少林','111111','uploads\\20180728\\493008a0e767728e9d1d355c243f4f0c.jpg',NULL,NULL,14,'2018-07-28 17:22:48','小型中级',1,12345,'城固--二里','','2018-07-28 0','<p>1111111111</p>'),(119,'','','','',NULL,NULL,0,'','',0,0,'','1','',''),(120,'121','少林','121','uploads\\20180728\\4da5bb46d8a6432223a8accfae906760.jpg',NULL,NULL,14,'2018-07-28 21:56:29','小型中级',1,121,'城固--西安','','2019-07-28 0','<p>1111111111111</p>'),(121,'61626','少林','121','uploads\\20180729/c847abf953c5a80418beedf7bce05ef8.gif',NULL,NULL,15,'2018-07-25 00:00:00','小型中级',1,123,'城固--汉中','','2019-07-28 0','<p>1111</p>'),(122,'121','少林','111','uploads/20181014/002.gif','uploads/20181004/012.jpg',NULL,0,'','',0,121,'','','2018-10-15 1','<p>1.承包体重</p>'),(123,'1','少林','小型','uploads/20181015/008.jpg','uploads/20181015/008.jpg',NULL,12,'2018-08-08 00:00:00','小型中级',1,6123220740,'城固--小河','','2019-08-02 0','<p>11111111</p>'),(124,'2','少林','3','uploads/20180805/img0.jpg',NULL,NULL,12,'2018-08-05 14:37:56','小型中级',1,3,'城固--二里','','2019-08-05 0','<p>11111111</p>'),(126,'1','少林','44','uploads/20180806/100.JPG','uploads/20181015/赵振华.jpg',NULL,12,'2018-08-06 07:09:16','小型中级',1,2,'城固--二里','','2019-08-06 0','<p>11111111</p>'),(127,'111','少林','','uploads/20181014/012.jpg','uploads/20181014/016.jpg',NULL,12,'2018-08-06 22:53:54','小型中级',1,1111,'城固--小河','','2019-08-06 0','<p>111111111</p>'),(129,'66666','宇通','','uploads/陈娆廷.jpg','uploads/杜素兰.jpg','uploads/宇通.jpg',60,'2018-10-20 22:40:10','小型中级',1,12345678,'城固--二里','','2019-11-20 0','<h1 style=\"margin: 0px 0px 9px; word-wrap: break-word; font-size: 28px; color: rgb(64, 64, 64); line-height: 44px; letter-spacing: 1px; font-family: \">老人捡到一叠5元纸币，拿去银行换总钱时，工作人员顿时脸色大变</h1><p class=\"info\" style=\"margin-top: 0px; margin-bottom: 0px; color: gray; font-size: 14px; line-height: 26px; font-family: \"><span class=\"source\">淘乐没</span>&nbsp;2018-10-18 12:09</p><p style=\"margin-top: 0px; margin-bottom: 26px;\"><br/></p><p>随着手机支付的越来越发达，很多人都在使用手机支付，从而使得现金的使用频率大幅下降了，导致现金发行的版本也越来越少，以前经常看到的纸币，或许现在已经变成了收藏品。</p><p><img src=\"/ueditor/php/upload/image/20181020/1540046533.jpg\"/></p><p><br/></p>'),(130,'123','','','xsz/陈璐.jpg','yyz/高侠.jpg','pic/宇通.jpg',0,'','',0,0,'','','','<p>44444444444444444444444444444444444444444444444444444444444444444444</p>');
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;

#
# Structure for table "cate"
#

DROP TABLE IF EXISTS `cate`;
CREATE TABLE `cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏目标识',
  `name` varchar(32) DEFAULT NULL COMMENT '栏目名称',
  `pid` int(11) DEFAULT NULL COMMENT '上级栏目标识',
  `type` tinyint(1) DEFAULT '1' COMMENT '1：列表 2：图片 3：单页',
  `sort` int(11) DEFAULT '100' COMMENT '排序',
  `pic` tinytext COMMENT '栏目图片',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键字',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述信息',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='栏目表';

#
# Data for table "cate"
#

/*!40000 ALTER TABLE `cate` DISABLE KEYS */;
INSERT INTO `cate` VALUES (1,'首页',0,1,10,'uploads\\20180712\\fcce97ccd5b4e962319e8e7c9125fabd.jpg,uploads\\20180712\\81ce746211a6d06ae756a58609a7089d.jpg,uploads/20180913/赵振华.jpg','首页','对对对','<p>首页是很重要的</p>'),(2,'安全生产',0,1,20,'uploads\\20180712\\6b6a0724c2c28ac7c93c18647edf07a8.jpg,uploads\\20180712\\4e26022dfa1ea8d0b29979d41609ac81.jpg','','',''),(3,'客运服务',0,7,20,'','','',''),(4,'客运班次',3,1,40,'','','',''),(5,'客运站',0,7,40,'','','',''),(6,'客运信息',0,1,0,'','','',''),(7,'联系我们',0,1,0,'uploads/20180913/安康.jpg,uploads/20180913/002.gif','','',''),(8,'陕西省',0,2,0,'uploads/20180919/banner.jpg','','',''),(9,'汉中市',8,3,0,'','','',''),(10,'四川省',0,1,0,'','','',''),(11,'绵阳市',10,2,0,'','','',''),(12,'甘肃省',0,1,0,'','','','');
/*!40000 ALTER TABLE `cate` ENABLE KEYS */;

#
# Structure for table "ch"
#

DROP TABLE IF EXISTS `ch`;
CREATE TABLE `ch` (
  `id` tinyint(4) NOT NULL,
  `ch` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ch"
#

/*!40000 ALTER TABLE `ch` DISABLE KEYS */;
INSERT INTO `ch` VALUES (1,'13231,13650,13528,13589,13590,13586,13556,13566,13618,13636,15138,39602,39856,23520,18823,51158,51856,13153,22996,22998,22989,20331,23250,23086,23092,23088,23133,23156,23166,51899,51869,51826,13208,13239,13298,13260,13261,13262,13285,13290,18300,18336,18285,35238,36985,36935');
/*!40000 ALTER TABLE `ch` ENABLE KEYS */;

#
# Structure for table "config"
#

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config` text COMMENT '配置信息',
  `weixin` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置信息';

#
# Data for table "config"
#

/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (2,'{\"title\":\"易风课堂-ThinkPHP入门实战课堂！PHP交流群：4948268650\",\"logo\":\"logo\\/logo.JPG\",\"keyword\":\"易风课堂,php入门,php实战,PHP交流群4948268650\",\"desc\":\"易风课堂-ThinkPHP入门实战课堂！PHP交流群：4948268650\",\"phone\":\"400-XXX-XXXX\",\"online\":\"4948268650\",\"address\":\"易风课堂-百度传课\",\"email\":\"576617109@qq.com\",\"author\":\"易风课堂\",\"state\":\"1\",\"closeinfo\":\"网站维护中，请稍后重试！\"}','{\"appid\":\"\",\"appSecret\":\"\",\"token\":\"yifengketang\",\"encodingaeskey\":\"\",\"welcome\":\"欢迎关注微信公众号\"}');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;

#
# Structure for table "fileup"
#

DROP TABLE IF EXISTS `fileup`;
CREATE TABLE `fileup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wj` varchar(40) DEFAULT NULL,
  `filename` varchar(60) DEFAULT NULL COMMENT '文件名',
  `sort` int(4) DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "fileup"
#

/*!40000 ALTER TABLE `fileup` DISABLE KEYS */;
INSERT INTO `fileup` VALUES (11,'网页滚动文字代码.txt','up/20181011\\网页滚动文字代码.txt',50),(13,'高祯慧.jpg','up/20181011\\高祯慧.jpg',50),(15,'235.gif','up/20181014/235.gif',50),(21,'创建员工基本信息表.xls','up/创建员工基本信息表.xls',50),(26,'cgkyz.sql','up/cgkyz.sql',50),(27,'a.zip','up/a.zip',50),(28,'002.gif','up/002.gif',50),(29,'何亚莉.jpg','up/何亚莉.jpg',50),(30,'赵振华.jpg','up/赵振华.jpg',50);
/*!40000 ALTER TABLE `fileup` ENABLE KEYS */;

#
# Structure for table "gsyg"
#

DROP TABLE IF EXISTS `gsyg`;
CREATE TABLE `gsyg` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL COMMENT '姓名',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别',
  `sfz` varchar(19) NOT NULL DEFAULT '' COMMENT '身份证',
  `pic` varchar(60) DEFAULT NULL COMMENT '身份证图片',
  `zp` varchar(60) DEFAULT NULL COMMENT '照片',
  `gzsj` text COMMENT '参加工作时间',
  `gw` varchar(10) DEFAULT NULL COMMENT '岗位',
  `desc` text COMMENT '人员简介',
  `zw` char(10) DEFAULT NULL COMMENT '职务',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，1在岗，0离岗',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

#
# Data for table "gsyg"
#

/*!40000 ALTER TABLE `gsyg` DISABLE KEYS */;
INSERT INTO `gsyg` VALUES (8,'高鹏',1,'61232219850214','sfz/041.jpg','zp/061.jpg','1997-10-14 20:18:17','怪怪的','<p>反反复复付付付sssssssssssssssssssssskdkwoeriroeoriri&nbsp;</p>','军长',1),(12,'高飞',1,'61232219890214','sfz/089.jpg','zp/041.jpg','2018-10-17 21:43:27','客运队','<p><a href=\"http://sh.qihoo.com/pc/home\" style=\"color: rgb(68, 68, 68); text-decoration-line: none; font-size: 14px; display: inline-block; padding-right: 8px;\">首页</a>&nbsp;<a href=\"http://sh.qihoo.com/pc/home?ch=car\" style=\"color: rgb(68, 68, 68); text-decoration-line: none; font-size: 14px; display: inline-block; padding-right: 8px;\">汽车</a>&nbsp;<span style=\"color: rgb(153, 153, 153); font-size: 14px; display: inline-block; padding-right: 8px;\">正文</span><br/></p><p><span style=\"color: rgb(64, 64, 64); font-size: 28px; letter-spacing: 1px;\">奔驰GLC L正式上市!轴距增100mm，售价上调3.5万!宝马X3压力</span><br/></p><article><p class=\"info\" style=\"margin-top: 0px; margin-bottom: 0px; color: gray; font-size: 14px; line-height: 26px;\"><span class=\"source\">东方网</span>&nbsp;今天18:43</p><p style=\"margin-top: 0px; margin-bottom: 26px; font-family: \">许多车友们对于汽车轴距的加长一直都是褒贬不一，许多喜欢车辆操控感的车友们觉得车身加长了会使得车辆驾驶起来缺少一点灵活性，而且轴距的加长目前好像也就只有在中国才推出，本来很高大的一款车却成了一款“中国特供车”，档次瞬间掉了好几级。</p><p style=\"margin-top: 0px; margin-bottom: 26px; font-family: \"><br/></p><p><img src=\"/ueditor/php/upload/image/20181018/1539874856.jpg\"/></p><p style=\"margin-top: 0px; margin-bottom: 26px; font-family: \"><br/></p><p style=\"margin-top: 0px; margin-bottom: 26px; font-family: \">不过，国内许多消费者却很吃这一套，加长版的车型在空间上得到了很大的保障，这为乘坐者提供了非常舒适的乘坐空间，今天小编要说的这款奔驰GLC在昨天终于迎来了长轴距版的正式上市，长轴距版车型为奔驰GLC L，官方公布的正式售价为42.98-57.60万元，与奔驰GLC目前的官方售价39.48-57.60万，只是在起步价上上调了3.5万，宝马X3压力大!</p><p style=\"margin-top: 0px; margin-bottom: 26px; font-family: \"><br/></p></article><p><br/></p><p><br/></p><p><a href=\"http://sh.qihoo.com/pc/home\" style=\"color: rgb(68, 68, 68); text-decoration-line: none; font-size: 14px; display: inline-block; padding-right: 8px;\"></a></p><p><br/></p><section></section><p><br/></p><p><a href=\"http://sh.qihoo.com/pc/home\" style=\"color: rgb(68, 68, 68); text-decoration-line: none; font-size: 14px; display: inline-block; padding-right: 8px;\">首页</a>&nbsp;&lt;a href</p>','队长',1),(13,'高祯慧',1,'612322197210180217','sfz/205.jpg','zp/140.jpg','1997-01-22 00:00:00','客运队','<p>1是否看见发电机房数据库</p>','队长',1),(14,'王超',1,'612322198902145263','sfz/008.jpg','zp/021.jpg','2018-10-22 22:03:01','','<p>11111111111111111</p>','',1),(15,'郑勇',1,'612322198021304152','sfz/018.jpg','zp/012.jpg','','','','',1),(16,'李伟',1,'61232218940214','sfz/009.jpg','zp/021.jpg','2018-10-24 22:24:32','','','',1),(20,'王涛',1,'612322197502143542','sfz/云冬梅.jpg','zp/高红英.jpg','2018-10-28 16:30:28','11','<p>44444444444444444444444</p>','22',1),(23,'啊啊',0,'61232219890214','sfz/何雅荣.jpg','zp/何成侠.jpg','2018-10-30 21:19:35','站务','<p>哈哈哈哈或或或或或或或或或或或或</p>','班长',0);
/*!40000 ALTER TABLE `gsyg` ENABLE KEYS */;

#
# Structure for table "jsy"
#

DROP TABLE IF EXISTS `jsy`;
CREATE TABLE `jsy` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '驾驶员id',
  `name` varchar(10) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` int(1) NOT NULL DEFAULT '1' COMMENT '性别，1代表男，0代表女',
  `type` varchar(6) DEFAULT NULL COMMENT '准驾车型',
  `jszh` varchar(20) DEFAULT NULL COMMENT '驾驶证号',
  `zgzh` varchar(20) DEFAULT NULL COMMENT '资格证号',
  `sgzh` varchar(10) DEFAULT NULL COMMENT '上岗证号',
  `jsz_pic` varchar(60) DEFAULT '' COMMENT '驾驶证图片',
  `zgz_pic` varchar(60) DEFAULT NULL COMMENT '资格证图片',
  `sgz_pic` varchar(60) DEFAULT NULL COMMENT '上岗证图片',
  `jianli` text COMMENT '驾驶员简历',
  `status` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  `bus` varchar(9) DEFAULT NULL COMMENT '车号',
  `tel` char(11) DEFAULT NULL COMMENT '手机',
  `beizu` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

#
# Data for table "jsy"
#

/*!40000 ALTER TABLE `jsy` DISABLE KEYS */;
INSERT INTO `jsy` VALUES (7,'刘舍军',1,'A2','612322197910232655','612322197910232655','','','','','',0,'陕F51382','18729673790',NULL),(8,'庞坤智',1,'B1 B2','612323196604244537','612323196604244537','','','','','',0,'陕F51923','13992685846',NULL),(9,'王  涛',1,'A2 E','612322197511200015','612322197511200015','','','','','',0,'陕F51953','13891606207',NULL),(10,'崔建森',1,'A1 A2','612322197308272216','612322197308272216','11111111','jsz/001.JPG','zgz/007.jpg','sgz/006.jpg','<p>fggggghc jkhhhhhhhhhhhhhhhhhhhhhh<img src=\"/ueditor/php/upload/image/20181026/1540564640.jpg\" title=\"1540564640.jpg\" alt=\"012.jpg\"/></p>',1,'陕F51302','13335451864',''),(11,'孙俊文',1,'A2','612322197010051912','612322197010051912','','jsz/陈璐.jpg','zgz/冯柳.jpg','sgz/高玉红.jpg','<p>ddddddddddddddddddddddddddddddslkdddddddddddddddddd</p>',1,'陕F51613','13571679006',''),(12,'湛  龙',1,'A2','612322198803021013','612322198803021013','','/jsy/,jsz/李莹.jpg','/jsy/,zgz/方小会.jpg','/jsy/,sgz/何莎.jpg','',1,'陕F51593','13992680016',''),(13,'王  刚',1,'A2','612322197609270011','612322197609270011','','','','','',1,'陕F51291','13630201750',NULL),(14,'王振东',1,'A2','612322196502282819','612322196502282819','','','','','',1,'陕F51623','15029493279',NULL),(15,'邵  峰',1,'A2','612322197802202715','612322197802202715','','','','','',1,'陕F51952','13892649112',NULL),(16,'李新春',1,'A2','612322197804100034','612322197804100034','','','','','',1,'陕F52618','15291611672',NULL),(17,'周亚辉',1,'B1 B2','612322197707012710','612322197707012710','','','','','',1,'陕F52596','15029493068',NULL),(18,'席永强',1,'A2','612322196209020211','612322196209020211','','','','','',1,'陕F52526','15191613178',NULL),(19,'王纪国',1,'A2','612322197606042718','612322197606042718','','','','','',1,'陕F52528','15191607233',NULL),(20,'李建珠',1,'A1 A2','612322196304292717','612322196304292717','','','','','',1,'陕F52689','15877307024',NULL),(21,'余永刚',1,'A2','61232219801019001X','61232219801019001X','','','','','',1,'陕F52518','13630262975',NULL),(22,'李小强',1,'A2','612322196907110716','612322196907110716','','','','','',1,'陕F52598','18791160997',NULL),(23,'张永东',1,'A2','612322197312100919','612322197312100919','','','','','',1,'陕F52585','13891689468',NULL),(24,'薛敢峰',1,'A2','612322197602231714','612322197602231714','','','','','',1,'陕F52659','13892676234',NULL),(25,'广紫万',1,'A2','612322196804150037','612322196804150037','','','','','',1,'陕F52600','13992678766',NULL),(26,'罗  玮',1,'A2','612322197505084011','612322197505084011','','','','','',1,'陕F18823','18628639560',NULL),(27,'罗  林',1,'A2','612322197002120017','612322197002120017','','','','','',1,'陕F18285','13991616839',NULL),(28,'代普红',1,'A2','61232219790415411X','61232219790415411X','','','','','',1,'陕F20331','13186356088',NULL),(29,'李  峰',1,'A2','612322197805271038','612322197805271038','','','','','',1,'陕F22998','15191628126',NULL),(30,'王景刚',1,'A2','612322196808201719','612322196808201719','','','','','',1,'陕F22996','13992635447',NULL),(31,'孟  超',1,'B1 B2','612322197404133013','612322197404133013','','','','','',1,'陕F22989','13992647530',NULL),(32,'龚旭斌',1,'A2','612322197412290211','612322197412290211','','','','','',1,'陕F23086 ','15891678501',NULL),(33,'寇振国',1,'B1 B2','61232219760715261X','61232219760715261X','','','','','',1,'陕F23088 ','13992685280',NULL),(34,'李  谦',1,'A2 E','612322198402100255','612322198402100255','','','','','',1,'陕F23092 ','15529168300',NULL),(35,'高国虎',1,'A1 A2','612322197403080618','612322197403080618','','','','','',1,'陕F23132 ','15191614651',NULL),(36,'胡小阳',1,'A2','612322196706200918','612322196706200918','','','','','',1,'陕F23133 ','13891606248',NULL),(37,'赖光军',1,'A2','612322197111130214','612322197111130214','','','','','',1,'陕F23156 ','13991607628',NULL),(38,'黄红兴',1,'A2','612322198201301317','612322198201301317','','','','','',1,'陕F23166','13649169728',NULL),(39,'余志强',1,'A2','612322196606222255','612322196606222255','','','','','',1,'陕F23250 ','15029543340',NULL),(40,'张昌和',1,'A2','612322196409260017','612322196409260017','','','','','',1,'陕F23520 ','13571678882',NULL),(41,'高纪国',1,'A2 D','612322197112021319','612322197112021319','','','','','',1,'陕F35238','13571689500',NULL),(42,'秦红安',1,'B1 B2','612322196801052511','612322196801052511','','','','','',1,'陕F36935','15029166071',NULL),(43,'李新华',1,'A2','61232219640508161X','61232219640508161X','','','','','',1,'陕F36985','15029463499',NULL),(44,'方余璘',1,'A2','612322198402242712','612322198402242712','','','','','',1,'陕F39602 ','13772834628',NULL),(45,'  姚  超  ',1,'A2','612322197507090714','612322197507090714','','','','','',1,'陕F39856 ','13571651321',NULL),(46,'李小红',1,'B1 B2 ','612322196810131115','612322196810131115','','','','','',1,'陕F18300 ','15029565339',NULL),(47,'王小军',1,'A2','612322197306232536','612322197306232536','','','','','',1,'陕F18336 ','13325363086',NULL),(48,'肖  飞',1,'A1 A2','612322198204052512','612322198204052512','','','','','',1,'陕F23851','13700267427',NULL),(49,'刘国运',1,'A1 A2','612322198205105436','612322198205105436','','','','','',1,'陕F28813','13630278663',NULL),(50,'袁友荣',1,'A1 A2','612322196507294819','612322196507294819','','','','','',1,'陕F35861','13571661490',NULL),(51,'李东升',1,'A1 A2','612322197206070816','612322197206070816','','','','','',1,'陕F31861','13892649567',NULL),(52,'梁义平',1,'A1 ','612322196910081514','612322196910081514','','','','','',1,'陕F35628 ','13892653348',NULL),(53,'李彦红',1,'A1 A2','612322197006182215','612322197006182215','','','','','',1,'陕F31832 ','13891693407',NULL),(54,'李  江',1,'A1 D ','612322198305292718','612322198305292718','','','','','',NULL,'陕F31116','13809167126',NULL),(55,'王建军',1,'A1 A2','132437197011010018','132437197011010018','','','','','',NULL,'陕F31182','13759806605',NULL),(56,'苏  恒',1,'A1 A2','612322198209191634','612322198209191634','','','','','',1,'陕F31161 ','13335449406',NULL),(57,'张崇伟',1,'A1 A2','610125197805061811','610125197805061811','','','','','',1,'陕F23908 ','15191668289',NULL),(58,'闫纪林',1,'A1 A2','612322196304251819','612322196304251819','','','','','',NULL,'陕F23918 ','13891676845',NULL),(59,'李宗斌',1,'A1 ','612326197505234775','612326197505234775','','','','','',NULL,'陕F23919 ','13571642040',NULL),(60,'黎星光',1,'A2','61232219671220005X','61232219671220005X','','','','','',1,'陕F16502 ','15891666102',NULL),(61,'王明祥',1,'A2','612322196212271513','612322196212271513','','','','','',NULL,'陕F16520 ','13571696468',NULL),(62,'代继忠',1,'A2','612322196802210016','612322196802210016','','','','','',1,'陕F16558 ','18146865293',NULL),(63,'彭  亮',1,'A2','612322198112050018','612322198112050018','','','','','',1,'陕F16561 ','18291627011',NULL),(64,'姜  波',1,'A2','612322197111180713','612322197111180713','','','','','',1,'陕F16562','17742466185',NULL),(65,'李俊存',1,'A1 A2','612322198404260711','612322198404260711','','','','','',1,'陕F16566 ','15291602243',NULL),(66,'卢  飞',1,' A2','61232219800922071X','61232219800922071X','','','','','',1,'陕F16583','13892680067',NULL),(67,'刘  哲',1,' A2','612322197403302735','612322197403302735','','','','','',NULL,'陕F16585 ','15891666967',NULL),(68,'张贵荣',1,'A2','612322196207230215','612322196207230215','','','','','',1,'陕F16595 ','15091730948',NULL),(69,'杨  乐',1,'A2','612322198010202711','612322198010202711','','','','','',1,'陕F16596 ','13571473130',NULL),(70,'韩  超',1,'A2','61232219750610263X','61232219750610263X','','','','','',NULL,'陕F51866','15991061536',NULL),(71,'方  锐',1,'A2','612322198804152752','612322198804152752','','','','','',1,'陕F51818','13892675806',NULL),(72,'蒋彦刚',1,'A2','612322197912010079','612322197912010079','','','','','',1,'陕F51115','18292644618',NULL),(73,'马明强',1,'A1 A2','612322196409115717','612322196409115717','','','','','',NULL,'陕F18808 ','13110397083',NULL),(74,'张利伟',1,'A2','612322198008010016','612322198008010016','','','','','',1,'陕F18815 ','13572620867',NULL),(75,'郭荣林',1,'B1 B2','612322197301153417','612322197301153417','','','','','',1,'陕F18816 ','18992640583',NULL),(76,'王彦军',1,'A2','612322197308150219','612322197308150219','','','','','',1,'陕F23082 ','13892623844',NULL),(77,'潘建邦',1,'A2','612322197206090817','612322197206090817','','','','','',1,'陕F19262 ','15009161528',NULL),(78,'王新春',1,'A2','612330196812280114','612330196812280114','','','','','',1,'陕F35928','13992626062',NULL),(79,'朱  丽',0,'A2','612322197206285446','612322197206285446','','','','','',NULL,'陕F35931','15991067590',NULL),(80,'陈寿鹏',1,'A2','612322196604120212','612322196604120212','','','','','',1,'陕F35933','13772209978',NULL),(81,'毕  刚',1,'A2','612322198201153836','612322198201153836','','','','','',1,'陕F19260','18291613203',NULL),(82,'徐庆龙',1,'A2','612322197609283314','612322197609283314','','','','','',1,'陕F20310','15091460431',NULL),(83,'李  平',1,'A2','612322196804272413','612322196804272413','','','','','',NULL,'陕F28988','13759814967',NULL),(84,'陈忠勇',1,'A2','612322197810065415','612322197810065415','','','','','',NULL,'陕F28966','15029566835',NULL),(85,'宁  超',1,'A2 E','612322198201191111','612322198201191111','','','','','',1,'陕F28980','13335451640',NULL),(86,'何  军',1,'A2 D','61232219680318071X','61232219680318071X','','','','','',1,'陕F51828','13992642171',NULL),(87,'乔清泉',1,'A2','612322198004143815','612322198004143815','','','','','',NULL,'陕F53186','15336212850',NULL),(88,'刘亚飞',1,'A2 D','612322197701163315','612322197701163315','','','','','',NULL,'陕F53089','13991616522',NULL),(89,'刘  斌',1,'A2','612328198106221712','612328198106221712','','','','','',NULL,'陕F53100','13992635616',NULL),(90,'文建忠',1,'A2','612322197211251232','612322197211251232','','','','','',NULL,'陕F52205','13992656054',NULL),(91,'李明忠',1,'A2','612322197003053717','612322197003053717','','','','','',1,'陕F51925','15191623904',NULL),(92,'陈小林',1,'A2','612322197104113512','612322197104113512','','','','','',NULL,'陕F51152','18740562309',NULL),(93,'刘小珠',1,'A2','612322197712113719','612322197712113719','','','','','',NULL,'陕F51831','13992680363',NULL),(94,'张  冲',1,'A2','612322198312113415','612322198312113415','','','','','',0,'陕F52096','13992685177',NULL),(95,'梁  田',1,'A2','612322198303152711','612322198303152711','','','','','',1,'陕F52163','13892616362',NULL),(96,'王明全',1,'A2','612322196509273413','612322196509273413','','','','','',1,'陕F51693','13571480916',NULL),(97,'吕  琳',1,'A2','612322198110031315','612322198110031315','','','','','',1,'陕F52135','13689169965',NULL),(98,'徐春宏',1,'A2','612322197606183334','612322197606183334','','','','','',NULL,'陕F51325','13310966968',NULL),(99,'刘  涛',1,'A2 D','612322198503213515','612322198503213515','','','','','',NULL,'陕F52108','15109163872',NULL),(101,'司勇东',1,'A2','612322196607180210','612322196607180210','','','','','',NULL,'陕F18896','13891689056',NULL),(102,'闫  东',1,'A2','612322198012080914','612322198012080914','','','','','',1,'陕F18913','13891689056',NULL),(103,'王天龙',1,'A2','612322196405083519','612322196405083519','','','','','',NULL,'陕F19022','13259253308',NULL),(104,'赵  敏',0,'A2','612322198106234523','612322198106234523','','','','','',1,'陕F19261','13484453008',NULL),(105,'张亚明',1,'A2','612325196702201074','612325196702201074','','','','','',NULL,'陕F19263','13992638941',NULL),(106,'葛维章',1,'A2','220403196804032315','220403196804032315','','','','','',NULL,'陕F19265','15291643252',NULL),(107,'张  燕',0,'A2','420321197909033524','420321197909033524','','','','','',1,'陕F19268','15667467509',NULL),(108,'曹树荣',1,'A2','612322196501213811','612322196501213811','','','','','',NULL,'陕F19281','13892660573',NULL),(109,'赵树成',1,'A2','612322195803261611','612322195803261611','','','','','',NULL,'陕F20153','13992642279',NULL),(110,'张长顺',1,'A2','612322196309231219','612322196309231219','','','','','',NULL,'陕F20356','13110360528',NULL),(111,'徐世康',1,'A2','612322196310041914','612322196310041914','','','','','',NULL,'陕F18926','13259281129',NULL),(112,'秦  超',1,'A2','612322198108204512','612322198108204512','','','','','',NULL,'陕F18665','13359160153',NULL),(113,'左小虎',1,'A2','612322197412240011','612322197412240011','','','','','',1,'陕F30665','18291650018',NULL),(114,'蔡金全',1,'A2','612322196602070055','612322196602070055','','','','','',NULL,'陕F30683','13571685637',NULL),(115,'袁小成',1,'A2','612322197211083216','612322197211083216','','','','','',NULL,'陕F30630','15891672814',NULL),(116,'何存华',1,'A1 A2 ','612322195805092639','612322195805092639','','','','','',NULL,'陕F33031','18791651389',NULL),(117,'吴克俭',1,'A1 A2 ','612322195708234113','612322195708234113','','','','','',NULL,'陕F33220','13992680212',NULL),(118,'李全明',1,'A1 A2 ','612322196310161211','612322196310161211','','','','','',NULL,'陕F33252','13689164653',NULL),(119,'王海蓉',0,'A2','142132197302162920','142132197302162920','','','','','',1,'陕F38521','18292620856',NULL),(120,'孙文东',1,'A2','612322197002220050','612322197002220050','','','','','',NULL,'陕F38519','18700630181',NULL),(121,'白怀宁',1,'A2','612301196401273110','612301196401273110','','','','','',1,'陕F38638','13572601262',NULL),(122,'魏润杰',1,'A1 A2','61232219570816301X','61232219570816301X','','','','','',0,'','18292601943',NULL),(123,'李长福',1,'A1 A2','612322196810061137','612322196810061137','','','','','',1,'','13279160188',NULL),(124,'刘  军',1,'A1 A2','612322198204275433','612322198204275433','','','','','',NULL,'','13630278663',NULL),(125,'孟  勇',1,'A1 A2','612322197805251715','612322197805251715','','','','','',1,'','13772806132',NULL),(126,'彭卫民',1,'A2','612322197311170093','612322197311170093','','','','','',1,'','13992622026',NULL),(127,'淡林华',1,'A2 E','612322196002150211','612322196002150211','','','','','',NULL,'','13571625770',NULL),(128,'徐松柏',1,'A2','612322196304131913','612322196304131913','','','','','',NULL,'','15769261287',NULL),(129,'刘  登',1,'A1 A2','612322198211280716','612322198211280716','','','','','',NULL,'','13992617998',NULL),(130,'许金元',1,'A2','612322196204220214','612322196204220214','','','','','',NULL,'','15319345125',NULL),(131,'魏  朋',1,'A2','612322198309103013','612322198309103013','','','','','',NULL,'','13259287991',NULL),(132,'郭玉强',1,'A2','612322196409070010','612322196409070010','','','','','',NULL,'','18291683917',NULL),(133,'杨宝生',1,'A2','612322198202251710','612322198202251710','','','','','',NULL,'','13289608107',NULL),(134,'任红飞',1,' A2','612322197107300073','612322197107300073','','','','','',NULL,'','13335367727',NULL),(135,'郑  虎',1,'A2','612322197802155015','612322197802155015','','','','','',NULL,'','13772836960',NULL),(136,'张海强',1,'A2','612322197708010610','612322197708010610','','','','','',NULL,'','18729673338',NULL),(137,'徐小红',1,'A2','612322197305060218','612322197305060218','','','','','',NULL,'','15591626300',NULL),(138,'苗  壮',1,'A1 A2','612322198209280012','612322198209280012','','','','','',NULL,'','13259281825',NULL),(139,'杨晓华',1,'A2','612322197410050214','612322197410050214','','','','','',NULL,'','13619168156',NULL),(140,'李  军',1,'A2','612322197504250719','612322197504250719','','','','','',NULL,'','13659169350',NULL),(141,'张宝发',1,'A2','612322197711071916','612322197711071916','','','','','',1,'','13700260840',NULL),(142,'张  军',1,'A2 D','612322198012210918','612322198012210918','','','','','',NULL,'','13630201220',NULL),(143,'张  聪',1,'A2','612330196811080014','612330196811080014','','','','','',NULL,'','13571480556',NULL),(144,'李双贵',1,'B1 B2 ','612322197405063037','612322197405063037','','','','','',NULL,'','15619811588',NULL),(145,'广学军',1,'A2','612322197404161719','612322197404161719','','','','','',NULL,'','15929595736',NULL),(146,'李万林',1,'B1 ','612322197910291057','612322197910291057','','','','','',1,'','13098217636',NULL),(147,'王小春',1,'A1 E','612322196505110211','612322196505110211','','','','','',1,'','13892612952',NULL),(148,'陈  飞',1,'A2','612322198002192410','612322198002192410','','','','','',1,'','15191675970',NULL),(149,'王  亮',1,'A2','612322197901200010','612322197901200010','','','','','',1,'','13892698082',NULL),(151,'张三',1,'A1','612322198902145689','612322198902145689','c0214','jsz/赵振华.jpg','zgz/021.jpg','sgz/015.jpg','<p>对对对调度多多多多多多多多多多多多多多多多</p>',NULL,'陕F23132','13891640214','');
/*!40000 ALTER TABLE `jsy` ENABLE KEYS */;

#
# Structure for table "pho"
#

DROP TABLE IF EXISTS `pho`;
CREATE TABLE `pho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL COMMENT '内容id',
  `pic` varchar(100) DEFAULT NULL COMMENT '图片地址',
  `sort` int(11) DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='内容图片';

#
# Data for table "pho"
#

/*!40000 ALTER TABLE `pho` DISABLE KEYS */;
INSERT INTO `pho` VALUES (31,14,'',10),(32,14,'',10),(33,15,'uploads\\20180714\\6553a2a4f9bc54137800bca5688dfc5f.jpg',10),(34,15,'uploads\\20180714\\cd9198c80533fbc4e213e902fe33c38a.jpg',10),(35,16,'uploads\\20180715\\515da301cedcde8b86daa65870b90324.png',10),(50,11,'uploads\\20180715\\48f8a29edd5669734451918d5ca03a78.jpg',10),(52,21,'uploads\\20180715\\87fd910f78cf929e296d09047f6a7e92.jpg',10),(54,23,'uploads\\20180715\\d9f1d39c00e5d7b115831a77630b490d.jpg',10),(55,24,'uploads\\20180715\\31f6c933813ec0606768d37675bf99d8.jpg',10),(56,21,'uploads\\20180715\\61a9e9c8dc309e68672bf7d6da641607.gif',10),(57,0,'',10),(58,0,'',10),(59,0,'',10),(60,0,'',10),(61,0,'',10),(62,104,'uploads\\20180725\\30d8d428153fbd6bbda63213408b48d3.jpg',10),(63,105,'',10),(64,106,'',10),(65,107,'',10),(66,108,'uploads\\20180728\\c8f6cb85e7829776eb94c80c456a3949.jpg',10),(67,109,'',10),(68,110,'uploads\\20180728\\e27f3e6b6be221e14bf8192aa0050335.jpg',10),(69,111,'uploads\\20180728\\b5e4a21e04942c3664bb0ac174a73e2a.jpg',10),(70,112,'',10),(71,113,'',10),(72,114,'',10),(73,115,'',10),(74,116,'',10),(75,117,'',10),(76,25,'uploads/20180914/支付凭证.jpg',10),(77,26,'uploads/20180919/安康.jpg',10),(79,28,'uploads/20180919/65120002972935464.jpg',10),(88,32,'uploads/20180926/习近平.jpg',10),(89,32,'uploads/20180926/b0882533e6f6fd8b.gif',10),(91,32,'uploads/20180926/广告.png',10),(93,34,'uploads/20181004/008.jpg',10),(94,34,'uploads/20181004/012.jpg',10),(95,35,'uploads/20181005/059.jpg',10),(96,36,'uploads/20181009\\赵振华.jpg',10),(97,37,'uploads/20181011\\021.jpg',10),(98,38,'uploads/20181012/012.jpg',10),(99,39,'uploads/20181012/012.jpg',10),(100,38,'uploads/20181012/021.jpg',10),(101,40,'uploads/20181014/009.jpg',10),(102,41,'uploads/20181014/018.jpg',10),(103,42,'uploads/20181014/152.jpg',10),(104,43,'uploads/20181014/014.jpg',10),(105,44,'uploads/20181014/009.jpg',10),(106,35,'uploads/20181014/002.gif',10),(107,45,'uploads/赵振华.jpg',10);
/*!40000 ALTER TABLE `pho` ENABLE KEYS */;

#
# Structure for table "pics"
#

DROP TABLE IF EXISTS `pics`;
CREATE TABLE `pics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL COMMENT '内容id',
  `pic` varchar(100) DEFAULT NULL COMMENT '图片地址',
  `sort` int(11) DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='内容图片';

#
# Data for table "pics"
#

/*!40000 ALTER TABLE `pics` DISABLE KEYS */;
INSERT INTO `pics` VALUES (1,4,'uploads\\20171106\\95f9bda45f921c211e45dd46efa8bc02.png',10),(2,4,'uploads\\20171106\\b49a4b6efdedff256cd9846789ab50bc.png',10),(10,12,'uploads\\20171111\\7e1b01b47ed0242892b5d744966c5f48.jpg',10),(11,12,'uploads\\20171111\\d594f1908dcdcc01d37e3dcfca510bfb.jpg',10),(31,29,'uploads\\20171226\\b3321637fa7bbc2d0aecfce9e77a8a11.jpg',10),(32,30,'uploads\\20171226\\c417b5251a72b67d9b4e72f764dad246.jpg',10),(33,31,'uploads\\20171226\\c089d60b8b802621ba0a08eddbc15dcd.jpg',10),(34,32,'uploads\\20171226\\bf8f4cf7c19a394cd8b0e5bc1cc16ebd.jpg',10),(35,33,'uploads\\20171226\\e003ea23931651b6ffbf3e0429ab7fb3.jpg',10),(36,34,'uploads\\20171226\\d6dfc7a6b10ab9ea741ba1de6cc24cce.jpg',10),(39,37,'uploads\\20171226\\62ec62526c5d52c5adc1879b7b36c404.jpg',10),(40,38,'uploads\\20171226\\bf63c8177ed9ed9f477fd5a36f2cd3af.jpg',10),(41,39,'uploads\\20171226\\fa419c6fa7da2613cf007edccd884cda.jpg',10),(42,40,'uploads\\20171226\\55c646020059bd68bd9803ca9c964d45.jpg',10),(43,41,'uploads\\20171226\\1b8be621ff3be09d89d0dc358b7ca0ef.jpg',10),(44,42,'uploads\\20171226\\64a01972cf535c95a256be5760b7e86a.jpg',10),(45,43,'uploads\\20171226\\fd49a044b814ea930ca02f2feddc254b.jpg',10),(48,44,'uploads\\20171226\\1e7c80bb54092de8885ca0593af07aa7.jpg',10),(49,45,'uploads\\20171226\\b0f83513daad833cd3e956cb5f3a4950.jpg',10),(50,46,'uploads\\20171226\\3dfa7ac315c4818e68d1793a4e998878.jpg',10),(51,47,'uploads\\20171226\\3c7a7aa1fdc7765c7d599a965e32ad7b.jpg',10),(52,48,'uploads\\20171227\\2e6c4b9eed93963f21af0be41f604a39.jpg',10),(53,49,'uploads\\20171227\\0d5d434873d07caa5b4ba39517ad2501.jpg',10),(54,50,'uploads\\20180102\\db3e59c73172cf991ac665854e8d4de0.jpg',10),(55,51,'uploads\\20180102\\1fbe5f7344efdf5c48bc89997d190b90.jpg',10),(56,52,'uploads\\20180102\\f4d48dfbc9069558eba98b1aca94b15d.jpg',10),(57,53,'uploads\\20180102\\dc8c5ffce43dc84bd75416af7164f9af.jpg',10),(58,54,'uploads\\20180102\\14e64e0e697c1a5980c1f41d3fe46104.jpg',10),(59,55,'uploads\\20180102\\30c20cb182ee1b8b5a2cf536644e13c7.jpg',10),(60,56,'uploads\\20180102\\c805edb63f4b71805774a59f6d7a0125.jpg',10),(61,57,'uploads\\20180102\\359e3fa63ac24bea2d0916681c4f02cd.jpg',10),(62,58,'uploads\\20180102\\6d193707e81247fbe8675a1b2f613f92.jpg',10),(63,59,'uploads\\20180102\\5e9efd83cd1db91ad75260211dd6c7c3.png',10),(64,60,'uploads\\20180102\\44ae605b536ab38cdb9ae63ef8760d75.jpg',10),(65,55,'uploads\\20180526\\9cbfe625d0e16a14d706cf23452936dc.gif',10);
/*!40000 ALTER TABLE `pics` ENABLE KEYS */;

#
# Structure for table "sfz"
#

DROP TABLE IF EXISTS `sfz`;
CREATE TABLE `sfz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) DEFAULT NULL COMMENT '内容id',
  `pic` varchar(100) DEFAULT NULL COMMENT '图片地址',
  `sort` int(11) DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='内容图片';

#
# Data for table "sfz"
#

/*!40000 ALTER TABLE `sfz` DISABLE KEYS */;
INSERT INTO `sfz` VALUES (78,120,'uploads\\20180728\\2232a5cbbababe5d702deb0adacf9ee1.jpg',10),(79,120,'uploads\\20180728\\df5c9eb2d62c9c8bd0bc9db5a8c04f84.jpg',10),(80,120,'uploads\\20180728\\d6e34279565ede1ffac151c013b225de.jpg',10),(84,122,'uploads\\20180729\\81c627d7981b110f69419c9110d35b4b.gif',10),(85,122,'uploads\\20180729\\40c90bf996b9f76985420f55a3fad1ef.jpg',10),(86,122,'uploads\\20180729\\245dd1dde5630094383e522f846ba2fd.jpg',10),(87,121,'uploads/20180729/dab0128ad65046335f91639deff4bae3.jpg',10),(88,121,'uploads/20180729/1f3b99030e3af166963b5c5f6ce5d162.jpg',10),(90,121,'uploads/20180729/c425b879f4aed986038c63b847994d0b.jpg',10),(91,2,'uploads/20180729/4789827bd474963d9377ee0357b9f8d2.jpg',10),(92,2,'uploads/20180729/5fc3785cec613d1fb2e88dfd7f5bb9e9.jpg',10),(93,123,'uploads/20180802/63b2ce86f1ac65656f33de33638cdfb9.png',10),(94,123,'uploads/20180802/74feb4cef241f59f2d32290efe8ed81a.jpg',10),(95,123,'uploads/2018080/7e221c43ac66a5cf0af298e79d8b7709.jpg',10),(96,124,'uploads/20180805/5801d098c5020c594a839511f3830934.jpg',10),(97,124,'uploads/20180805/c04aac983c5ea0911586c4d41d50bc03.jpg',10),(98,124,'uploads/20180805/b6b8ea5862954041f6e67d9e304fd6e9.gif',10),(102,125,'uploads/20180805/012.JPG',10),(103,125,'uploads/20180805/018.JPG',10),(104,125,'uploads/20180805/018.JPG',10),(106,126,'uploads/20180806/037.JPG',10),(107,126,'uploads/20180806/042.JPG',10),(109,127,'uploads/20180806/3249867e83c1fdba.jpg',10),(110,127,'uploads/20180806/187dfd159ee42908.jpg',10),(111,127,'uploads/20180927/205.jpg',10),(127,1,'uploads/20181014/高祯慧.jpg',10),(128,1,'uploads/20181014/赵振华.jpg',10),(129,1,'uploads/20181014/234.jpg',10),(130,128,'uploads/20181014/012.jpg',10),(131,128,'uploads/20181014/014.jpg',10),(132,3,'uploads/205.jpg',10),(133,129,'uploads/何成侠.jpg',10),(134,129,'uploads/何亚莉.jpg',10),(135,130,'sfz/何成侠.jpg',10),(136,130,'sfz/高玉红.jpg',10),(137,22,'sfz/梁丽军.jpg',10),(138,22,'sfz/何永侠.jpg',10);
/*!40000 ALTER TABLE `sfz` ENABLE KEYS */;

#
# Structure for table "sites"
#

DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `names` varchar(50) NOT NULL,
  `values` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "sites"
#

/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES ('site','\"\\u57ce\\u56fa\\u53bf\\u6c7d\\u8f66\\u8fd0\\u8f93\\u516c\\u53f8\\u7f51\\u7ad9\"');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;

#
# Structure for table "spy"
#

DROP TABLE IF EXISTS `spy`;
CREATE TABLE `spy` (
  `id` int(3) NOT NULL AUTO_INCREMENT COMMENT '售票员id',
  `name` varchar(10) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` int(1) DEFAULT '1' COMMENT '性别，0代表女，1代表男',
  `sfz` varchar(20) DEFAULT NULL COMMENT '身份证',
  `sgzh` varchar(10) DEFAULT NULL COMMENT '上岗证号',
  `sfz_pic` varchar(60) DEFAULT '' COMMENT '身份证图片',
  `zp` varchar(60) DEFAULT NULL COMMENT '照片',
  `jianli` text COMMENT '驾驶员简历',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否有效',
  `bus` varchar(9) DEFAULT NULL COMMENT '车号',
  `tel` char(11) DEFAULT NULL COMMENT '手机',
  `beizu` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "spy"
#

/*!40000 ALTER TABLE `spy` DISABLE KEYS */;
INSERT INTO `spy` VALUES (7,'刘舍军',1,'612322197910232655','','','','',NULL,'陕F51382','18729673790',NULL),(8,'庞坤智',1,'612323196604244537','','','','',NULL,'陕F51923','13992685846',NULL),(9,'王  涛',1,'612322197511200015','','','','',NULL,'陕F51953','13891606207',NULL),(10,'崔建森',1,'612322197308272216','','','','',NULL,'陕F51302','13335451864',NULL),(11,'孙俊文',1,'612322197010051912','','','','',NULL,'陕F51613','13571679006',NULL),(12,'湛  龙',1,'612322198803021013','','','','',NULL,'陕F51593','13992680016',NULL),(13,'王  刚',1,'612322197609270011','','','','',NULL,'陕F51291','13630201750',NULL),(14,'王振东',1,'612322196502282819','','','','',NULL,'陕F51623','15029493279',NULL),(15,'邵  峰',1,'612322197802202715','','','','',NULL,'陕F51952','13892649112',NULL),(16,'李新春',1,'612322197804100034','','','','',NULL,'陕F52618','15291611672',NULL),(17,'周亚辉',1,'612322197707012710','','','','',NULL,'陕F52596','15029493068',NULL),(18,'席永强',1,'612322196209020211','','','','',NULL,'陕F52526','15191613178',NULL),(19,'王纪国',1,'612322197606042718','','','','',NULL,'陕F52528','15191607233',NULL),(20,'李建珠',1,'612322196304292717','','','','',NULL,'陕F52689','15877307024',NULL),(21,'余永刚',1,'61232219801019001X','','','','',NULL,'陕F52518','13630262975',NULL),(22,'李小强',1,'612322196907110716','','','','',NULL,'陕F52598','18791160997',NULL),(23,'张永东',1,'612322197312100919','','','','',NULL,'陕F52585','13891689468',NULL),(24,'薛敢峰',1,'612322197602231714','','','','',NULL,'陕F52659','13892676234',NULL),(25,'广紫万',1,'612322196804150037','','','','',NULL,'陕F52600','13992678766',NULL),(26,'罗  玮',1,'612322197505084011','','','','',NULL,'陕F18823','18628639560',NULL),(27,'罗  林',1,'612322197002120017','','','','',NULL,'陕F18285','13991616839',NULL),(28,'代普红',1,'61232219790415411X','','','','',NULL,'陕F20331','13186356088',NULL),(29,'李  峰',1,'612322197805271038','','','','',NULL,'陕F22998','15191628126',NULL),(30,'王景刚',1,'612322196808201719','','','','',NULL,'陕F22996','13992635447',NULL),(31,'孟  超',1,'612322197404133013','','','','',NULL,'陕F22989','13992647530',NULL),(32,'龚旭斌',1,'612322197412290211','','','','',NULL,'陕F23086 ','15891678501',NULL),(33,'寇振国',1,'61232219760715261X','','','','',NULL,'陕F23088 ','13992685280',NULL),(34,'李  谦',1,'612322198402100255','','','','',NULL,'陕F23092 ','15529168300',NULL),(35,'高国虎',1,'612322197403080618','','','','',NULL,'陕F23132 ','15191614651',NULL),(36,'胡小阳',1,'612322196706200918','','','','',NULL,'陕F23133 ','13891606248',NULL),(37,'赖光军',1,'612322197111130214','','','','',NULL,'陕F23156 ','13991607628',NULL),(38,'黄红兴',1,'612322198201301317','','','','',NULL,'陕F23166','13649169728',NULL),(39,'余志强',1,'612322196606222255','','','','',NULL,'陕F23250 ','15029543340',NULL),(40,'张昌和',1,'612322196409260017','','','','',NULL,'陕F23520 ','13571678882',NULL),(41,'高纪国',1,'612322197112021319','','','','',NULL,'陕F35238','13571689500',NULL),(42,'秦红安',1,'612322196801052511','','','','',NULL,'陕F36935','15029166071',NULL),(43,'李新华',1,'61232219640508161X','','','','',NULL,'陕F36985','15029463499',NULL),(44,'方余璘',1,'612322198402242712','','','','',NULL,'陕F39602 ','13772834628',NULL),(45,'  姚  超  ',1,'612322197507090714','','','','',NULL,'陕F39856 ','13571651321',NULL),(46,'李小红',1,'612322196810131115','','','','',NULL,'陕F18300 ','15029565339',NULL),(47,'王小军',1,'612322197306232536','','','','',NULL,'陕F18336 ','13325363086',NULL),(48,'肖  飞',1,'612322198204052512','','','','',NULL,'陕F23851','13700267427',NULL),(49,'刘国运',1,'612322198205105436','','','','',NULL,'陕F28813','13630278663',NULL),(50,'袁友荣',1,'612322196507294819','','','','',NULL,'陕F35861','13571661490',NULL),(51,'李东升',1,'612322197206070816','','','','',NULL,'陕F31861','13892649567',NULL),(52,'梁义平',1,'612322196910081514','','','','',NULL,'陕F35628 ','13892653348',NULL),(53,'李彦红',1,'612322197006182215','','','','',NULL,'陕F31832 ','13891693407',NULL),(54,'李  江',1,'612322198305292718','','','','',NULL,'陕F31116','13809167126',NULL),(55,'王建军',1,'132437197011010018','','','','',NULL,'陕F31182','13759806605',NULL),(56,'苏  恒',1,'612322198209191634','','','','',NULL,'陕F31161 ','13335449406',NULL),(57,'张崇伟',1,'610125197805061811','','','','',NULL,'陕F23908 ','15191668289',NULL),(58,'闫纪林',1,'612322196304251819','','','','',NULL,'陕F23918 ','13891676845',NULL),(59,'李宗斌',1,'612326197505234775','','','','',NULL,'陕F23919 ','13571642040',NULL),(60,'黎星光',1,'61232219671220005X','','','','',NULL,'陕F16502 ','15891666102',NULL),(61,'王明祥',1,'612322196212271513','','','','',NULL,'陕F16520 ','13571696468',NULL),(62,'代继忠',1,'612322196802210016','','','','',NULL,'陕F16558 ','18146865293',NULL),(63,'彭  亮',1,'612322198112050018','','','','',NULL,'陕F16561 ','18291627011',NULL),(64,'姜  波',1,'612322197111180713','','','','',NULL,'陕F16562','17742466185',NULL),(65,'李俊存',1,'612322198404260711','','','','',NULL,'陕F16566 ','15291602243',NULL),(66,'卢  飞',1,'61232219800922071X','','','','',NULL,'陕F16583','13892680067',NULL),(67,'刘  哲',1,'612322197403302735','','','','',NULL,'陕F16585 ','15891666967',NULL),(68,'张贵荣',1,'612322196207230215','','','','',NULL,'陕F16595 ','15091730948',NULL),(69,'杨  乐',1,'612322198010202711','','','','',NULL,'陕F16596 ','13571473130',NULL),(70,'韩  超',1,'61232219750610263X','','','','',NULL,'陕F51866','15991061536',NULL),(71,'方  锐',1,'612322198804152752','','','','',NULL,'陕F51818','13892675806',NULL),(72,'蒋彦刚',1,'612322197912010079','','','','',NULL,'陕F51115','18292644618',NULL),(73,'马明强',1,'612322196409115717','','','','',NULL,'陕F18808 ','13110397083',NULL),(74,'张利伟',1,'612322198008010016','','','','',NULL,'陕F18815 ','13572620867',NULL),(75,'郭荣林',1,'612322197301153417','','','','',NULL,'陕F18816 ','18992640583',NULL),(76,'王彦军',1,'612322197308150219','','','','',NULL,'陕F23082 ','13892623844',NULL),(77,'潘建邦',1,'612322197206090817','','','','',NULL,'陕F19262 ','15009161528',NULL),(78,'王新春',1,'612330196812280114','','','','',NULL,'陕F35928','13992626062',NULL),(79,'朱  丽',NULL,'612322197206285446','','','','',NULL,'陕F35931','15991067590',NULL),(80,'陈寿鹏',1,'612322196604120212','','','','',NULL,'陕F35933','13772209978',NULL),(81,'毕  刚',1,'612322198201153836','','','','',NULL,'陕F19260','18291613203',NULL),(82,'徐庆龙',1,'612322197609283314','','','','',NULL,'陕F20310','15091460431',NULL),(83,'李  平',1,'612322196804272413','','','','',NULL,'陕F28988','13759814967',NULL),(84,'陈忠勇',1,'612322197810065415','','','','',NULL,'陕F28966','15029566835',NULL),(85,'宁  超',1,'612322198201191111','','','','',NULL,'陕F28980','13335451640',NULL),(86,'何  军',1,'61232219680318071X','','','','',NULL,'陕F51828','13992642171',NULL),(87,'乔清泉',1,'612322198004143815','','','','',NULL,'陕F53186','15336212850',NULL),(88,'刘亚飞',1,'612322197701163315','','','','',NULL,'陕F53089','13991616522',NULL),(89,'刘  斌',1,'612328198106221712','','','','',NULL,'陕F53100','13992635616',NULL),(90,'文建忠',1,'612322197211251232','','','','',NULL,'陕F52205','13992656054',NULL),(91,'李明忠',1,'612322197003053717','','','','',NULL,'陕F51925','15191623904',NULL),(92,'陈小林',1,'612322197104113512','','','','',NULL,'陕F51152','18740562309',NULL),(93,'刘小珠',1,'612322197712113719','','','','',NULL,'陕F51831','13992680363',NULL),(94,'张  冲',1,'612322198312113415','','','','',NULL,'陕F52096','13992685177',NULL),(95,'梁  田',1,'612322198303152711','','','','',NULL,'陕F52163','13892616362',NULL),(96,'王明全',1,'612322196509273413','','','','',NULL,'陕F51693','13571480916',NULL),(97,'吕  琳',1,'612322198110031315','','','','',NULL,'陕F52135','13689169965',NULL),(98,'徐春宏',1,'612322197606183334','','','','',NULL,'陕F51325','13310966968',NULL),(99,'刘  涛',1,'612322198503213515','','','','',NULL,'陕F52108','15109163872',NULL),(100,'',NULL,'','','','','',NULL,'陕F18852','',NULL),(101,'司勇东',1,'612322196607180210','','','','',NULL,'陕F18896','13891689056',NULL),(102,'闫  东',1,'612322198012080914','','','','',NULL,'陕F18913','13891689056',NULL),(103,'王天龙',1,'612322196405083519','','','','',NULL,'陕F19022','13259253308',NULL),(104,'赵  敏',NULL,'612322198106234523','','','','',NULL,'陕F19261','13484453008',NULL),(105,'张亚明',1,'612325196702201074','','','','',NULL,'陕F19263','13992638941',NULL),(106,'葛维章',1,'220403196804032315','','','','',NULL,'陕F19265','15291643252',NULL),(107,'张  燕',NULL,'420321197909033524','','','','',NULL,'陕F19268','15667467509',NULL),(108,'曹树荣',1,'612322196501213811','','','','',NULL,'陕F19281','13892660573',NULL),(109,'赵树成',1,'612322195803261611','','','','',NULL,'陕F20153','13992642279',NULL),(110,'张长顺',1,'612322196309231219','','','','',NULL,'陕F20356','13110360528',NULL),(111,'徐世康',1,'612322196310041914','','','','',NULL,'陕F18926','13259281129',NULL),(112,'秦  超',1,'612322198108204512','','','','',NULL,'陕F18665','13359160153',NULL),(113,'左小虎',1,'612322197412240011','','','','',NULL,'陕F30665','18291650018',NULL),(114,'蔡金全',1,'612322196602070055','','','','',NULL,'陕F30683','13571685637',NULL),(115,'袁小成',1,'612322197211083216','','','','',NULL,'陕F30630','15891672814',NULL),(116,'何存华',1,'612322195805092639','','','','',NULL,'陕F33031','18791651389',NULL),(117,'吴克俭',1,'612322195708234113','','','','',NULL,'陕F33220','13992680212',NULL),(118,'李全明',1,'612322196310161211','','','','',NULL,'陕F33252','13689164653',NULL),(119,'王海蓉',0,'142132197302162920','','','','',NULL,'陕F38521','18292620856',NULL),(120,'孙文东',1,'612322197002220050','','','','',NULL,'陕F38519','18700630181',NULL),(121,'白怀宁',1,'612301196401273110','','','','',NULL,'陕F38638','13572601262',NULL),(122,'魏润杰',1,'61232219570816301X','','','','',NULL,'','18292601943',NULL),(123,'李长福',1,'612322196810061137','','','','',NULL,'','13279160188',NULL),(124,'刘  军',1,'612322198204275433','','','','',NULL,'','13630278663',NULL),(125,'孟  勇',1,'612322197805251715','','','','',NULL,'','13772806132',NULL),(126,'彭卫民',1,'612322197311170093','','','','',NULL,'','13992622026',NULL),(127,'淡林华',1,'612322196002150211','','','','',NULL,'','13571625770',NULL),(128,'徐松柏',1,'612322196304131913','','','','',NULL,'','15769261287',NULL),(129,'刘  登',1,'612322198211280716','','','','',NULL,'','13992617998',NULL),(130,'许金元',1,'612322196204220214','','','','',NULL,'陕F23132','15319345125',''),(131,'魏  朋',1,'612322198309103013','','','','',NULL,'','13259287991',NULL),(132,'郭玉强',1,'612322196409070010','','','','',NULL,'','18291683917',NULL),(133,'杨宝生',1,'612322198202251710','','','','',NULL,'','13289608107',NULL),(134,'任红飞',1,'612322197107300073','','','','',NULL,'','13335367727',NULL),(135,'郑  虎',1,'612322197802155015','','','','',NULL,'','13772836960',NULL),(136,'张海强',1,'612322197708010610','','','','',NULL,'','18729673338',NULL),(137,'徐小红',1,'612322197305060218','','','','',NULL,'','15591626300',NULL),(138,'苗  壮',1,'612322198209280012','','','','',NULL,'','13259281825',NULL),(139,'杨晓华',1,'612322197410050214','','','','',NULL,'','13619168156',NULL),(140,'李  军',1,'612322197504250719','','','','',NULL,'','13659169350',NULL),(141,'张宝发',1,'612322197711071916','','','','',NULL,'','13700260840',NULL),(142,'张  军',1,'612322198012210918','','','','',NULL,'','13630201220',NULL),(143,'张  聪',1,'612330196811080014','','','','',NULL,'','13571480556',NULL),(144,'李双贵',1,'612322197405063037','','','','',NULL,'','15619811588',NULL),(145,'广学军',1,'612322197404161719','','','','',NULL,'','15929595736',NULL),(146,'李万林',1,'612322197910291057','','','','',NULL,'','13098217636',NULL),(147,'王小春',1,'612322196505110211','','','','',NULL,'','13892612952',NULL),(148,'陈  飞',0,'612322198002192410','','','','',NULL,'','15191675970',NULL),(149,'王  亮',1,'612322197901200010','','sfz/冯柳.jpg','zp/高玉红.jpg','',1,'','13892698082',''),(152,'小刘',1,'612322198902164578','0249','sfz/冯柳.jpg','zp/f07a874e3ada6273383eb68b5cb90cae.jpg','',1,'','',''),(153,'高霞',0,'612322198902142504','039','sfz/高侠.jpg','zp/陈洪英.jpg','<article><h1 style=\"margin: 0px 0px 9px; word-wrap: break-word; font-size: 28px; color: rgb(64, 64, 64); line-height: 44px; letter-spacing: 1px;\">习近平：坚决维护党中央权威和集中统一领导 全力推动党中央决策部署贯彻落实</h1><p class=\"info\" style=\"margin-top: 0px; margin-bottom: 0px; color: gray; font-size: 14px; line-height: 26px;\"><span class=\"source\">新华网</span>&nbsp;今天14:35</p><p style=\"margin-top: 0px; margin-bottom: 26px;\">习近平对全国党委秘书长会议作出重要指示强调</p><p style=\"margin-top: 0px; margin-bottom: 26px;\">坚决维护党中央权威和集中统一领导</p><p style=\"margin-top: 0px; margin-bottom: 26px;\">全力推动党中央决策部署贯彻落实</p><p style=\"margin-top: 0px; margin-bottom: 26px;\">　　新华社北京10月20日电　全国党委秘书长会议19日至20日在京召开。会前，中共中央总书记、国家主席、中央军委主席习近平作出重要指示。他指出，党委办公厅（室）作为党委的综合部门，是党委履行领导职责的参谋助手。党的十八大以来，各级党委办公厅（室）服务大局、勇于担当、辛勤工作，为推动党和国家事业发展作出了重要贡献。面向新时代，要进一步增强“四个意识”，加强理论武装，提高队伍素质，弘扬优良传统，坚持改革创新，坚决维护党中央权威和集中统一领导，全力推动党中央决策部署贯彻落实，全面提高“三服务”工作水平，建设让党放心、让人民满意的模范机关。</p><p style=\"margin-top: 0px; margin-bottom: 26px;\">　　中共中央政治局委员、中央书记处书记、中央办公厅主任丁薛祥在会上讲话强调，各级党委办公厅（室）要旗帜鲜明讲政治，以正确的认识和行动坚决维护习近平总书记核心地位、坚决维护党中央权威和集中统一领导。要适应新形势新任务新挑战，进一步抓好理论武装、机构职能优化、工作机制创新、干部队伍建设，不断推动“三服务”事业创新发展。</p><p style=\"margin-top: 0px; margin-bottom: 26px;\">　　会议总结交流了党的十八大以来党委办公厅（室）工作的成效和经验，研究了提高“三服务”工作水平的任务和措施，就党委办公厅（室）近期重点工作进行了具体部署。</p></article><p><a class=\"article_tag\" href=\"http://sh.qihoo.com/pc/topic?q=%E4%B9%A0%E8%BF%91%E5%B9%B3&rawurl=http%3A%2F%2Ffawen.news.so.com%2Feff435b20c054b3a5c64847337bc3756&entryfrom=tag_detail&sign=360_46b9a0ef\" target=\"_blank\" style=\"color: rgb(212, 61, 61); text-decoration-line: none; display: inline-block; line-height: 12px; vertical-align: middle; padding: 6px; border-radius: 2px; background: rgb(252, 246, 246); margin-right: 12px;\"></a><a class=\"article_tag\" href=\"http://sh.qihoo.com/pc/topic?q=%E6%97%B6%E6%94%BF%E8%A6%81%E9%97%BB&rawurl=http%3A%2F%2Ffawen.news.so.com%2Feff435b20c054b3a5c64847337bc3756&entryfrom=tag_detail&sign=360_46b9a0ef\" target=\"_blank\" style=\"color: rgb(212, 61, 61); text-decoration-line: none; display: inline-block; line-height: 12px; vertical-align: middle; padding: 6px; border-radius: 2px; background: rgb(252, 246, 246); margin-right: 12px;\"></a></p><p><span style=\"color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\"></span></p><p><br/></p>',1,'','',''),(155,'王梅',0,'612322198902140542','c029','sfz/155.jpg','zp/163.jpg','<p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">新华社北京10月27日电 综合新华社驻外记者报道：中共中央总书记、国家主席、中央军委主席习近平日前在广东考察时强调，进入新时代，改革发展面临着新形势新任务新挑战，我们要抓住机遇、迎接挑战。越是环境复杂，我们越是要以更坚定的信心、更有力的措施把改革开放不断推向深入。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　海外舆论认为，习近平所作的继续全面深化改革和扩大开放的重要宣示，彰显了中国进一步扩大对外开放、积极推进经济全球化的决心，世界期待中国继续全面深化改革、全面扩大开放，为世界经济均衡发展注入动力、提振信心。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　俄罗斯科学院远东研究所副所长安德烈·奥斯特洛夫斯基说，中国的改革开放也体现在“一带一路”建设中。“一带一路”将给欧亚地区乃至世界经济均衡发展注入新动力，使世界各地更加紧密地相互依存。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; color: rgb(77, 79, 83); font-family: &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, &quot;STHeiti Light&quot;, &quot;\\\\534E文细黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial, sans-serif; font-size: 18px; letter-spacing: 1px; white-space: normal; background-color: rgb(255, 255, 255);\">　　英国四十八家集团俱乐部主席斯蒂芬·佩里表示，中国取得今天的成就，在于能够在极其复杂的国际环境中始终坚持自己的发展道路，不畏艰险并不断开拓创新。中国坚持继续全面深化改革、扩大开放，支持贸易自由化和经济全球化并致力于建设开放型世界经济，不仅将积极推动中国发展，也助力全球经济提振信心。</p><p><br/></p>',1,'陕F23188','13891682078',''),(156,'张梅',1,'61232219890214','029','sfz/方小会.jpg','zp/高玉红.jpg','<p>dlllllllllllllllllllllleeeeeeeeeeeeeeeeeeeeeeeeeeeee他是横好的一个人</p>',0,'2','13862450219','');
/*!40000 ALTER TABLE `spy` ENABLE KEYS */;

#
# Structure for table "video"
#

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) NOT NULL COMMENT '频道',
  `charge_id` int(10) NOT NULL COMMENT '资费',
  `area_id` int(10) NOT NULL COMMENT '地区',
  `title` varchar(50) NOT NULL COMMENT '影片名称',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `desc` varchar(255) NOT NULL COMMENT '描述',
  `img` varchar(255) NOT NULL COMMENT '封面图url',
  `url` varchar(255) NOT NULL COMMENT '影片url',
  `pv` int(10) NOT NULL DEFAULT '0' COMMENT '点击量',
  `score` int(3) NOT NULL DEFAULT '0' COMMENT '影片评分',
  `is_vip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否vip才能看：0否，1是',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1下线',
  `add_time` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "video"
#

/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,2,11,13,'测试影片','没阿斯蒂芬','枯模压茜枯厅','/uploads/20180413\\f14d13f942c8cce24ca8c04bfb35b820.jpg','http://adfdfjdskfsad.mp4',0,0,0,1,1523603960),(2,2,11,15,'测试影片二','sdfasfasdfasd','fasdfasdfadsfadfadsfadsfasdf','','http://asfasdfas.mp4',0,0,0,1,1523604076);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;

#
# Structure for table "video_label"
#

DROP TABLE IF EXISTS `video_label`;
CREATE TABLE `video_label` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ord` int(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(50) NOT NULL COMMENT '标签标题',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0正常，1禁用',
  `flag` varchar(50) NOT NULL COMMENT '标签分类标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Data for table "video_label"
#

/*!40000 ALTER TABLE `video_label` DISABLE KEYS */;
INSERT INTO `video_label` VALUES (1,0,'电视剧',0,'channel'),(2,0,'电影',0,'channel'),(3,0,'综艺',0,'channel'),(4,0,'动漫',0,'channel'),(5,0,'记录片',0,'channel'),(6,0,'游戏',0,'channel'),(7,0,'资讯',0,'channel'),(8,0,'娱乐',0,'channel'),(9,0,'财经',0,'channel'),(10,0,'网络电影',0,'channel'),(11,0,'免费',0,'charge'),(12,0,'付费',0,'charge'),(13,0,'华语',0,'area'),(14,0,'香港',0,'area'),(15,0,'美国',0,'area'),(16,0,'欧洲',0,'area'),(17,0,'韩国',0,'area'),(18,0,'日本',0,'area'),(19,0,'泰国',0,'area'),(20,0,'其他',0,'area');
/*!40000 ALTER TABLE `video_label` ENABLE KEYS */;

#
# Structure for table "xhbc"
#

DROP TABLE IF EXISTS `xhbc`;
CREATE TABLE `xhbc` (
  `id` double NOT NULL DEFAULT '0' COMMENT '动态时间编号',
  `bc` varchar(80) NOT NULL DEFAULT '' COMMENT '动态时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "xhbc"
#

/*!40000 ALTER TABLE `xhbc` DISABLE KEYS */;
INSERT INTO `xhbc` VALUES (1,'7:20鲜家庙&许庙---'),(2,'8:25许庙10:10许彤 15:30砖溪'),(3,'12:00龙彤 15:50许潘'),(4,'8:15崔山10:15许庙14:00龙彤17:20二黄'),(5,'9:00龙彤13:30天明16:20许彤'),(6,'8:20龙彤12:10潘彤15;45毛岭'),(7,'7:40龙彤11:00天明15:00许庙17:00长龙'),(8,'8:50许庙11:00小河16:00龙彤'),(9,'7:00龙彤 10:00滥坝'),(10,'崔家山（1）'),(11,'7:50鲁庄 9:50---'),(12,'8:20高坝11:50柳树沟15:45许庙17:30龙彤'),(13,'8:10潘彤11:20二里15:20龙彤'),(14,'7:30景家山12:00天明16:00盘龙'),(15,'9:40龙彤 15:20孙坪'),(16,'7:10许毕10:40许庙12:30孙坪17:20天明'),(17,'8:30小河 16:50龙彤'),(18,'7:20龙彤11:00孙坪15:10许毕'),(19,'8:00龙彤11:00龙彤14:50二黄'),(20,'8:30孙坪12:20龙彤15:40板凳'),(21,'机 动'),(22,'6:30潘彤9:30孙坪14:30滥坝'),(23,'10;50许庙13:50许彤17:10龙彤'),(24,'7:10柳树沟9:30 11:40 14:40崔家山16:40柳树沟'),(24,'8:15柳崔11:00小河16:15景家山'),(25,'6:20龙彤9:20天明 14:20龙彤 17:20孙坪'),(26,'8:40龙彤 13:00许庙 15:00龙彤'),(28,'崔家山循环2'),(29,'7:10孙坪 11:40龙彤 15:50二里'),(30,'8:30许彤 12:30 小河'),(32,'7:30滥坝 13:40龙彤 16:40鲜家庙'),(33,'7:40盐井 11:10许彤15:00石马'),(34,'12:50许彤15:40龙彤'),(35,'10:20崔家山13:00龙彤16:10大盘'),(36,'10:00龙彤 14:40高坝'),(37,'8:00二黄12:20 15:15崔家山17:00水磨'),(38,'9:20许庙11:30长龙15:50天明'),(39,'7:40毛岭10:40龙彤 13:30小河'),(39,'6:40龙彤9:30许庙12:20龙彤15:40粄凳'),(40,'11:20龙彤14:15许庙16:45崔家山'),(41,'许庙6:15 8:00----17:20许彤'),(41,'许庙6:15 8:00----17:20许彤'),(42,'7:00大盘12:40龙彤16:30桃园'),(43,'10:20龙彤14:00孙坪16:45鲁庄'),(44,'7:40许潘11；15许庙16:30汪坝'),(46,'9:20龙彤13:15许庙16:15景家山');
/*!40000 ALTER TABLE `xhbc` ENABLE KEYS */;

#
# Structure for table "xhch"
#

DROP TABLE IF EXISTS `xhch`;
CREATE TABLE `xhch` (
  `id` double NOT NULL DEFAULT '0' COMMENT '车号id',
  `ch` varchar(5) DEFAULT NULL COMMENT '车号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "xhch"
#

/*!40000 ALTER TABLE `xhch` DISABLE KEYS */;
INSERT INTO `xhch` VALUES (1,'13231'),(2,'13650'),(3,'13528'),(4,'13589'),(5,'13590'),(6,'13586'),(7,'13556'),(8,'13566'),(9,'13618'),(10,'13636'),(11,'15138'),(12,'39602'),(13,'39856'),(14,'23520'),(15,'18823'),(16,'51158'),(17,'51856'),(18,'13153'),(19,'22996'),(20,'22998'),(21,'22989'),(22,'20331'),(23,'23250'),(24,'23086'),(25,'23092'),(26,'23088'),(27,'23133'),(28,'23156'),(29,'23166'),(30,'51899'),(31,'51869'),(32,'51826'),(33,'13208'),(34,'13239'),(35,'13298'),(36,'13260'),(37,'13261'),(38,'13262'),(39,'13285'),(40,'13290'),(41,'18300'),(42,'18336'),(43,'18285'),(44,'35238'),(45,'36985'),(46,'36935');
/*!40000 ALTER TABLE `xhch` ENABLE KEYS */;
