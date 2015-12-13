DROP TABLE IF EXISTS `jc_acquisition`;
CREATE TABLE `jc_acquisition` (
  `acquisition_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `acq_name` varchar(50) NOT NULL COMMENT '�ɼ�����',
  `start_time` datetime default NULL COMMENT '��ʼʱ��',
  `end_time` datetime default NULL COMMENT 'ֹͣʱ��',
  `status` int(11) NOT NULL default '0' COMMENT '��ǰ״̬(0:��ֹ;1:�ɼ�;2:��ͣ)',
  `curr_num` int(11) NOT NULL default '0' COMMENT '��ǰ����',
  `curr_item` int(11) NOT NULL default '0' COMMENT '��ǰ����',
  `total_item` int(11) NOT NULL default '0' COMMENT 'ÿҳ������',
  `pause_time` int(11) NOT NULL default '0' COMMENT '��ͣʱ��(����)',
  `page_encoding` varchar(20) NOT NULL default 'GBK' COMMENT 'ҳ�����',
  `plan_list` longtext COMMENT '�ɼ��б�',
  `dynamic_addr` varchar(255) default NULL COMMENT '��̬��ַ',
  `dynamic_start` int(11) default NULL COMMENT 'ҳ�뿪ʼ',
  `dynamic_end` int(11) default NULL COMMENT 'ҳ�����',
  `linkset_start` varchar(255) default NULL COMMENT '������������ʼ',
  `linkset_end` varchar(255) default NULL COMMENT '��������������',
  `link_start` varchar(255) default NULL COMMENT '�������ӿ�ʼ',
  `link_end` varchar(255) default NULL COMMENT '�������ӽ���',
  `title_start` varchar(255) default NULL COMMENT '���⿪ʼ',
  `title_end` varchar(255) default NULL COMMENT '�������',
  `keywords_start` varchar(255) default NULL COMMENT '�ؼ��ֿ�ʼ',
  `keywords_end` varchar(255) default NULL COMMENT '�ؼ��ֽ���',
  `description_start` varchar(255) default NULL COMMENT '������ʼ',
  `description_end` varchar(255) default NULL COMMENT '��������',
  `content_start` varchar(255) default NULL COMMENT '���ݿ�ʼ',
  `content_end` varchar(255) default NULL COMMENT '���ݽ���',
  `pagination_start` varchar(255) default NULL COMMENT '���ݷ�ҳ��ʼ',
  `pagination_end` varchar(255) default NULL COMMENT '���ݷ�ҳ����',
  `queue` int(11) NOT NULL default '0' COMMENT '����',
  `repeat_check_type` varchar(20) NOT NULL default 'NONE' COMMENT '�ظ�����',
  `img_acqu` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ɼ�ͼƬ',
  `content_prefix` varchar(255) default NULL COMMENT '���ݵ�ַ��ȫurl',
  `img_prefix` varchar(255) default NULL COMMENT 'ͼƬ��ַ��ȫurl',
  `view_start` varchar(255) default NULL COMMENT '�������ʼ',
  `view_end` varchar(255) default NULL COMMENT '���������',
  `view_id_start` varchar(255) default NULL COMMENT 'idǰ׺',
  `view_id_end` varchar(255) default NULL COMMENT 'id��׺',
  `view_link` varchar(255) default NULL COMMENT '�������̬���ʵ�ַ',
  `releaseTime_start` varchar(255) default NULL COMMENT '����ʱ�俪ʼ',
  `releaseTime_end` varchar(255) default NULL COMMENT '����ʱ�����',
  `author_start` varchar(255) default NULL COMMENT '���߿�ʼ',
  `author_end` varchar(255) default NULL COMMENT '���߽���',
  `origin_start` varchar(255) default NULL COMMENT '��Դ��ʼ',
  `origin_end` varchar(255) default NULL COMMENT '��Դ����',
  `releaseTime_format` varchar(255) default NULL COMMENT '����ʱ���ʽ',
  `videopath_start` varchar(50) default NULL COMMENT '��Ƶ·��',
  `videopath_end` varchar(50) default NULL COMMENT '��Ƶ·��',
  PRIMARY KEY  (`acquisition_id`),
  KEY `fk_jc_acquisition_channel` (`channel_id`),
  KEY `fk_jc_acquisition_contenttype` (`type_id`),
  KEY `fk_jc_acquisition_site` (`site_id`),
  KEY `fk_jc_acquisition_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS�ɼ���';

DROP TABLE IF EXISTS `jc_acquisition_history`;
CREATE TABLE `jc_acquisition_history` (
  `history_id` int(11) NOT NULL auto_increment,
  `channel_url` varchar(255) NOT NULL default '' COMMENT '��Ŀ��ַ',
  `content_url` varchar(255) NOT NULL default '' COMMENT '���ݵ�ַ',
  `title` varchar(255) default NULL COMMENT '����',
  `description` varchar(20) NOT NULL default '' COMMENT '����',
  `acquisition_id` int(11) default NULL COMMENT '�ɼ�Դ',
  `content_id` int(11) default NULL COMMENT '����',
  PRIMARY KEY  (`history_id`),
  KEY `fk_acquisition_history_acquisition` (`acquisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ɼ���ʷ��¼��';

DROP TABLE IF EXISTS `jc_acquisition_temp`;
CREATE TABLE `jc_acquisition_temp` (
  `temp_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) default NULL,
  `channel_url` varchar(255) NOT NULL default '' COMMENT '��Ŀ��ַ',
  `content_url` varchar(255) NOT NULL default '' COMMENT '���ݵ�ַ',
  `title` varchar(255) default NULL COMMENT '����',
  `finish_percent` int(3) NOT NULL default '0' COMMENT '�ٷֱ�',
  `description` varchar(20) NOT NULL default '' COMMENT '����',
  `seq` int(3) NOT NULL default '0' COMMENT '˳��',
  PRIMARY KEY  (`temp_id`),
  KEY `fk_jc_temp_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ɼ�������ʱ��';

DROP TABLE IF EXISTS `jc_advertising`;
CREATE TABLE `jc_advertising` (
  `advertising_id` int(11) NOT NULL auto_increment,
  `adspace_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '�������',
  `category` varchar(50) NOT NULL COMMENT '�������',
  `ad_code` longtext COMMENT '������',
  `ad_weight` int(11) NOT NULL default '1' COMMENT '���Ȩ��',
  `display_count` bigint(20) NOT NULL default '0' COMMENT 'չ�ִ���',
  `click_count` bigint(20) NOT NULL default '0' COMMENT '�������',
  `start_time` date default NULL COMMENT '��ʼʱ��',
  `end_time` date default NULL COMMENT '����ʱ��',
  `is_enabled` char(1) NOT NULL default '1' COMMENT '�Ƿ�����',
  PRIMARY KEY  (`advertising_id`),
  KEY `fk_jc_advertising_site` (`site_id`),
  KEY `fk_jc_space_advertising` (`adspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS����';


DROP TABLE IF EXISTS `jc_advertising_attr`;
CREATE TABLE `jc_advertising_attr` (
  `advertising_id` int(11) NOT NULL,
  `attr_name` varchar(50) NOT NULL COMMENT '����',
  `attr_value` varchar(255) default NULL COMMENT 'ֵ',
  KEY `fk_jc_params_advertising` (`advertising_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS������Ա�';


DROP TABLE IF EXISTS `jc_advertising_space`;
CREATE TABLE `jc_advertising_space` (
  `adspace_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '����',
  `description` varchar(255) default NULL COMMENT '����',
  `is_enabled` char(1) NOT NULL COMMENT '�Ƿ�����',
  PRIMARY KEY  (`adspace_id`),
  KEY `fk_jc_adspace_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='CMS����λ��';

DROP TABLE IF EXISTS `jc_channel`;
CREATE TABLE `jc_channel` (
  `channel_id` int(11) NOT NULL auto_increment,
  `model_id` int(11) NOT NULL COMMENT 'ģ��ID',
  `site_id` int(11) NOT NULL COMMENT 'վ��ID',
  `parent_id` int(11) default NULL COMMENT '����ĿID',
  `channel_path` varchar(30) default NULL COMMENT '����·��',
  `lft` int(11) NOT NULL default '1' COMMENT '�����',
  `rgt` int(11) NOT NULL default '2' COMMENT '���ұ�',
  `priority` int(11) NOT NULL default '10' COMMENT '����˳��',
  `has_content` tinyint(1) NOT NULL default '1' COMMENT '�Ƿ�������',
  `is_display` tinyint(1) NOT NULL default '1' COMMENT '�Ƿ���ʾ',
  PRIMARY KEY  (`channel_id`),
  KEY `fk_jc_channel_model` (`model_id`),
  KEY `fk_jc_channel_parent` (`parent_id`),
  KEY `fk_jc_channel_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='CMS��Ŀ��';


DROP TABLE IF EXISTS `jc_channel_attr`;
CREATE TABLE `jc_channel_attr` (
  `channel_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '����',
  `attr_value` varchar(255) default NULL COMMENT 'ֵ',
  KEY `fk_jc_attr_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS��Ŀ��չ���Ա�';

DROP TABLE IF EXISTS `jc_channel_count`;
CREATE TABLE `jc_channel_count` (
  `channel_id` int(11) NOT NULL,
  `views` int(11) NOT NULL default '0' COMMENT '�ܷ�����',
  `views_month` int(11) NOT NULL default '0' COMMENT '�·�����',
  `views_week` int(11) NOT NULL default '0' COMMENT '�ܷ�����',
  `views_day` int(11) NOT NULL default '0' COMMENT '�շ�����',
  PRIMARY KEY  (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS��Ŀ������������';


DROP TABLE IF EXISTS `jc_channel_ext`;
CREATE TABLE `jc_channel_ext` (
  `channel_id` int(11) NOT NULL,
  `channel_name` varchar(100) NOT NULL COMMENT '����',
  `final_step` tinyint(4) default '2' COMMENT '���󼶱�',
  `after_check` tinyint(4) default NULL COMMENT '��˺�(1:�����޸�ɾ��;2:�޸ĺ��˻�;3:�޸ĺ󲻱�)',
  `is_static_channel` char(1) NOT NULL default '0' COMMENT '�Ƿ���Ŀ��̬��',
  `is_static_content` char(1) NOT NULL default '0' COMMENT '�Ƿ����ݾ�̬��',
  `is_access_by_dir` char(1) NOT NULL default '1' COMMENT '�Ƿ�ʹ��Ŀ¼����',
  `is_list_child` char(1) NOT NULL default '0' COMMENT '�Ƿ�ʹ������Ŀ�б�',
  `page_size` int(11) NOT NULL default '20' COMMENT 'ÿҳ��������¼',
  `channel_rule` varchar(150) default NULL COMMENT '��Ŀҳ���ɹ���',
  `content_rule` varchar(150) default NULL COMMENT '����ҳ���ɹ���',
  `link` varchar(255) default NULL COMMENT '�ⲿ����',
  `tpl_channel` varchar(100) default NULL COMMENT '��Ŀҳģ��',
  `tpl_content` varchar(100) default NULL COMMENT '����ҳģ��',
  `title_img` varchar(100) default NULL COMMENT '����ͼ',
  `content_img` varchar(100) default NULL COMMENT '����ͼ',
  `has_title_img` tinyint(1) NOT NULL default '0' COMMENT '�����Ƿ�������ͼ',
  `has_content_img` tinyint(1) NOT NULL default '0' COMMENT '�����Ƿ�������ͼ',
  `title_img_width` int(11) NOT NULL default '139' COMMENT '���ݱ���ͼ���',
  `title_img_height` int(11) NOT NULL default '139' COMMENT '���ݱ���ͼ�߶�',
  `content_img_width` int(11) NOT NULL default '310' COMMENT '��������ͼ���',
  `content_img_height` int(11) NOT NULL default '310' COMMENT '��������ͼ�߶�',
  `comment_control` int(11) NOT NULL default '0' COMMENT '����(0:����;1:��Ա;2:�ر�)',
  `allow_updown` tinyint(1) NOT NULL default '1' COMMENT '����(true:����;false:�ر�)',
  `is_blank` tinyint(1) NOT NULL default '1' COMMENT '�Ƿ��´��ڴ�',
  `title` varchar(255) default NULL COMMENT 'TITLE',
  `keywords` varchar(255) default NULL COMMENT 'KEYWORDS',
  `description` varchar(255) default NULL COMMENT 'DESCRIPTION',
  `allow_share` tinyint(1) NOT NULL default '0' COMMENT '����(true:����;false:�ر�)',
  `allow_score` tinyint(1) NOT NULL default '0' COMMENT '����(true:����;false:�ر�)',
  PRIMARY KEY  (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS��Ŀ���ݱ�';

DROP TABLE IF EXISTS `jc_channel_model`;
CREATE TABLE `jc_channel_model` (
  `channel_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL COMMENT 'ģ��id',
  `tpl_content` varchar(100) default NULL COMMENT '����ģ��',
  `priority` int(11) NOT NULL default '10' COMMENT '����',
  PRIMARY KEY  (`channel_id`,`priority`),
  KEY `fk_jc_model_channel_m` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ŀ��ѡ����ģ�ͱ�';

DROP TABLE IF EXISTS `jc_channel_txt`;
CREATE TABLE `jc_channel_txt` (
  `channel_id` int(11) NOT NULL,
  `txt` longtext COMMENT '��Ŀ����',
  `txt1` longtext COMMENT '��չ����1',
  `txt2` longtext COMMENT '��չ����2',
  `txt3` longtext COMMENT '��չ����3',
  PRIMARY KEY  (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS��Ŀ�ı���';

DROP TABLE IF EXISTS `jc_channel_user`;
CREATE TABLE `jc_channel_user` (
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`channel_id`,`user_id`),
  KEY `fk_jc_channel_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS��Ŀ�û�������';

DROP TABLE IF EXISTS `jc_chnl_group_contri`;
CREATE TABLE `jc_chnl_group_contri` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_c` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS��ĿͶ���Ա�������';


DROP TABLE IF EXISTS `jc_chnl_group_view`;
CREATE TABLE `jc_chnl_group_view` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_v` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS��Ŀ�����Ա�������';


DROP TABLE IF EXISTS `jc_comment`;
CREATE TABLE `jc_comment` (
  `comment_id` int(11) NOT NULL auto_increment,
  `comment_user_id` int(11) default NULL COMMENT '�����û�ID',
  `reply_user_id` int(11) default NULL COMMENT '�ظ��û�ID',
  `content_id` int(11) NOT NULL COMMENT '����ID',
  `site_id` int(11) NOT NULL COMMENT 'վ��ID',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `reply_time` datetime default NULL COMMENT '�ظ�ʱ��',
  `ups` smallint(6) NOT NULL default '0' COMMENT '֧����',
  `downs` smallint(6) NOT NULL default '0' COMMENT '������',
  `is_recommend` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��Ƽ�',
  `is_checked` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����',
  `score` int(11) default NULL COMMENT '����',
  PRIMARY KEY  (`comment_id`),
  KEY `fk_jc_comment_content` (`content_id`),
  KEY `fk_jc_comment_reply` (`reply_user_id`),
  KEY `fk_jc_comment_site` (`site_id`),
  KEY `fk_jc_comment_user` (`comment_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='CMS���۱�';


DROP TABLE IF EXISTS `jc_comment_ext`;
CREATE TABLE `jc_comment_ext` (
  `comment_id` int(11) NOT NULL,
  `ip` varchar(50) default NULL COMMENT 'IP��ַ',
  `text` longtext COMMENT '��������',
  `reply` longtext COMMENT '�ظ�����',
  KEY `fk_jc_ext_comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS������չ��';

DROP TABLE IF EXISTS `jc_config`;
CREATE TABLE `jc_config` (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) default '/ndmxw' COMMENT '����·��',
  `servlet_point` varchar(20) default NULL COMMENT 'Servlet���ص�',
  `port` int(11) default NULL COMMENT '�˿�',
  `db_file_uri` varchar(50) NOT NULL default '/dbfile.svl?n=' COMMENT '���ݿ⸽�����ʵ�ַ',
  `is_upload_to_db` tinyint(1) NOT NULL default '0' COMMENT '�ϴ����������ݿ�',
  `def_img` varchar(255) NOT NULL default '/ndmxw/r/cms/www/default/no_picture.gif' COMMENT 'ͼƬ������ʱĬ��ͼƬ',
  `login_url` varchar(255) NOT NULL default '/login.jspx' COMMENT '��¼��ַ',
  `process_url` varchar(255) default NULL COMMENT '��¼�����ַ',
  `mark_on` tinyint(1) NOT NULL default '1' COMMENT '����ͼƬˮӡ',
  `mark_width` int(11) NOT NULL default '120' COMMENT 'ͼƬ��С���',
  `mark_height` int(11) NOT NULL default '120' COMMENT 'ͼƬ��С�߶�',
  `mark_image` varchar(100) default '/r/cms/www/watermark.png' COMMENT 'ͼƬˮӡ',
  `mark_content` varchar(100) NOT NULL default 'www.ndmxw.com' COMMENT '����ˮӡ����',
  `mark_size` int(11) NOT NULL default '20' COMMENT '����ˮӡ��С',
  `mark_color` varchar(10) NOT NULL default '#FF0000' COMMENT '����ˮӡ��ɫ',
  `mark_alpha` int(11) NOT NULL default '50' COMMENT 'ˮӡ͸���ȣ�0-100��',
  `mark_position` int(11) NOT NULL default '1' COMMENT 'ˮӡλ��(0-5)',
  `mark_offset_x` int(11) NOT NULL default '0' COMMENT 'x����ƫ����',
  `mark_offset_y` int(11) NOT NULL default '0' COMMENT 'y����ƫ����',
  `count_clear_time` date NOT NULL COMMENT '���������ʱ��',
  `count_copy_time` datetime NOT NULL COMMENT '����������ʱ��',
  `download_code` varchar(32) NOT NULL default 'ndmxw' COMMENT '���ط�����md5������',
  `download_time` int(11) NOT NULL default '12' COMMENT '������Чʱ�䣨Сʱ��',
  `email_host` varchar(50) default NULL COMMENT '�ʼ����ͷ�����',
  `email_encoding` varchar(20) default NULL COMMENT '�ʼ����ͱ���',
  `email_username` varchar(100) default NULL COMMENT '�����û���',
  `email_password` varchar(100) default NULL COMMENT '��������',
  `email_personal` varchar(100) default NULL COMMENT '���䷢����',
  `email_validate` tinyint(1) default '0' COMMENT '����������֤',
  `view_only_checked` tinyint(1) NOT NULL default '0' COMMENT 'ֻ����������������ҳ',
  PRIMARY KEY  (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS���ñ�';

DROP TABLE IF EXISTS `jc_config_attr`;
CREATE TABLE `jc_config_attr` (
  `config_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '����',
  `attr_value` varchar(255) default NULL COMMENT 'ֵ',
  KEY `fk_jc_attr_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS�������Ա�';


DROP TABLE IF EXISTS `jc_config_item`;
CREATE TABLE `jc_config_item` (
  `modelitem_id` int(11) NOT NULL auto_increment,
  `config_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '�ֶ�',
  `item_label` varchar(100) NOT NULL COMMENT '����',
  `priority` int(11) NOT NULL default '70' COMMENT '����˳��',
  `def_value` varchar(255) default NULL COMMENT 'Ĭ��ֵ',
  `opt_value` varchar(255) default NULL COMMENT '��ѡ��',
  `text_size` varchar(20) default NULL COMMENT '����',
  `area_rows` varchar(3) default NULL COMMENT '�ı�����',
  `area_cols` varchar(3) default NULL COMMENT '�ı�����',
  `help` varchar(255) default NULL COMMENT '������Ϣ',
  `help_position` varchar(1) default NULL COMMENT '����λ��',
  `data_type` int(11) NOT NULL default '1' COMMENT '�������� "1":"�ַ����ı�","2":"�����ı�","3":"�������ı�","4":"�ı���","5":"����","6":"�����б�","7":"��ѡ��","8":"��ѡ��"',
  `is_required` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����',
  `category` int(11) NOT NULL default '1' COMMENT 'ģ����Ŀ�������ࣨ1ע��ģ�ͣ�',
  PRIMARY KEY  (`modelitem_id`),
  KEY `fk_jc_item_config` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='CMS����ģ�����';


DROP TABLE IF EXISTS `jc_content`;
CREATE TABLE `jc_content` (
  `content_id` int(11) NOT NULL auto_increment,
  `channel_id` int(11) NOT NULL COMMENT '��ĿID',
  `user_id` int(11) NOT NULL COMMENT '�û�ID',
  `type_id` int(11) NOT NULL COMMENT '����ID',
  `model_id` int(11) NOT NULL COMMENT 'ģ��ID',
  `site_id` int(11) NOT NULL COMMENT 'վ��ID',
  `sort_date` datetime NOT NULL COMMENT '��������',
  `top_level` tinyint(4) NOT NULL default '0' COMMENT '�̶�����',
  `has_title_img` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��б���ͼ',
  `is_recommend` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��Ƽ�',
  `status` tinyint(4) NOT NULL default '2' COMMENT '״̬(0:�ݸ�;1:�����;2:���ͨ��;3:����վ��4:Ͷ��)',
  `views_day` int(11) NOT NULL default '0' COMMENT '�շ�����',
  `comments_day` smallint(6) NOT NULL default '0' COMMENT '��������',
  `downloads_day` smallint(6) NOT NULL default '0' COMMENT '��������',
  `ups_day` smallint(6) NOT NULL default '0' COMMENT '�ն���',
  `score` int(11) NOT NULL default '0' COMMENT '�÷�',
  PRIMARY KEY  (`content_id`),
  KEY `fk_jc_content_site` (`site_id`),
  KEY `fk_jc_content_type` (`type_id`),
  KEY `fk_jc_content_user` (`user_id`),
  KEY `fk_jc_contentchannel` (`channel_id`),
  KEY `fk_jc_content_model` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=565 DEFAULT CHARSET=utf8 COMMENT='CMS���ݱ�';


DROP TABLE IF EXISTS `jc_content_attachment`;
CREATE TABLE `jc_content_attachment` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '����˳��',
  `attachment_path` varchar(255) NOT NULL COMMENT '����·��',
  `attachment_name` varchar(100) NOT NULL COMMENT '��������',
  `filename` varchar(100) default NULL COMMENT '�ļ���',
  `download_count` int(11) NOT NULL default '0' COMMENT '���ش���',
  KEY `fk_jc_attachment_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS���ݸ�����';


DROP TABLE IF EXISTS `jc_content_attr`;
CREATE TABLE `jc_content_attr` (
  `content_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '����',
  `attr_value` varchar(255) default NULL COMMENT 'ֵ',
  KEY `fk_jc_attr_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS������չ���Ա�';


DROP TABLE IF EXISTS `jc_content_channel`;
CREATE TABLE `jc_content_channel` (
  `channel_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY  (`channel_id`,`content_id`),
  KEY `fk_jc_channel_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS������Ŀ������';


DROP TABLE IF EXISTS `jc_content_check`;
CREATE TABLE `jc_content_check` (
  `content_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL default '0' COMMENT '��˲���',
  `check_opinion` varchar(255) default NULL COMMENT '������',
  `is_rejected` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��˻�',
  `reviewer` int(11) default NULL COMMENT '������',
  `check_date` datetime default NULL COMMENT '����ʱ��',
  PRIMARY KEY  (`content_id`),
  KEY `fk_jc_content_check_user` (`reviewer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS���������Ϣ��';


DROP TABLE IF EXISTS `jc_content_count`;
CREATE TABLE `jc_content_count` (
  `content_id` int(11) NOT NULL,
  `views` int(11) NOT NULL default '0' COMMENT '�ܷ�����',
  `views_month` int(11) NOT NULL default '0' COMMENT '�·�����',
  `views_week` int(11) NOT NULL default '0' COMMENT '�ܷ�����',
  `views_day` int(11) NOT NULL default '0' COMMENT '�շ�����',
  `comments` int(11) NOT NULL default '0' COMMENT '��������',
  `comments_month` int(11) NOT NULL default '0' COMMENT '��������',
  `comments_week` smallint(6) NOT NULL default '0' COMMENT '��������',
  `comments_day` smallint(6) NOT NULL default '0' COMMENT '��������',
  `downloads` int(11) NOT NULL default '0' COMMENT '��������',
  `downloads_month` int(11) NOT NULL default '0' COMMENT '��������',
  `downloads_week` smallint(6) NOT NULL default '0' COMMENT '��������',
  `downloads_day` smallint(6) NOT NULL default '0' COMMENT '��������',
  `ups` int(11) NOT NULL default '0' COMMENT '�ܶ���',
  `ups_month` int(11) NOT NULL default '0' COMMENT '�¶���',
  `ups_week` smallint(6) NOT NULL default '0' COMMENT '�ܶ���',
  `ups_day` smallint(6) NOT NULL default '0' COMMENT '�ն���',
  `downs` int(11) NOT NULL default '0' COMMENT '�ܲ���',
  PRIMARY KEY  (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS���ݼ�����';


DROP TABLE IF EXISTS `jc_content_ext`;
CREATE TABLE `jc_content_ext` (
  `content_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL COMMENT '����',
  `short_title` varchar(150) default NULL COMMENT '��̱���',
  `author` varchar(100) default NULL COMMENT '����',
  `origin` varchar(100) default NULL COMMENT '��Դ',
  `origin_url` varchar(255) default NULL COMMENT '��Դ����',
  `description` varchar(255) default NULL COMMENT '����',
  `release_date` datetime NOT NULL COMMENT '��������',
  `media_path` varchar(255) default NULL COMMENT 'ý��·��',
  `media_type` varchar(20) default NULL COMMENT 'ý������',
  `title_color` varchar(10) default NULL COMMENT '������ɫ',
  `is_bold` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�Ӵ�',
  `title_img` varchar(100) default NULL COMMENT '����ͼƬ',
  `content_img` varchar(100) default NULL COMMENT '����ͼƬ',
  `type_img` varchar(100) default NULL COMMENT '����ͼƬ',
  `link` varchar(255) default NULL COMMENT '�ⲿ����',
  `tpl_content` varchar(100) default NULL COMMENT 'ָ��ģ��',
  `need_regenerate` tinyint(1) NOT NULL default '1' COMMENT '��Ҫ�������ɾ�̬ҳ',
  PRIMARY KEY  (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS������չ��';

DROP TABLE IF EXISTS `jc_content_group_view`;
CREATE TABLE `jc_content_group_view` (
  `content_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`content_id`,`group_id`),
  KEY `fk_jc_content_group_v` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS���������Ա�������';

DROP TABLE IF EXISTS `jc_content_picture`;
CREATE TABLE `jc_content_picture` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '����˳��',
  `img_path` varchar(100) NOT NULL COMMENT 'ͼƬ��ַ',
  `description` varchar(255) default NULL COMMENT '����',
  PRIMARY KEY  (`content_id`,`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS����ͼƬ��';


DROP TABLE IF EXISTS `jc_content_tag`;
CREATE TABLE `jc_content_tag` (
  `tag_id` int(11) NOT NULL auto_increment,
  `tag_name` varchar(50) NOT NULL COMMENT 'tag����',
  `ref_counter` int(11) NOT NULL default '1' COMMENT '�����õĴ���',
  PRIMARY KEY  (`tag_id`),
  UNIQUE KEY `ak_tag_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS����TAG��';

DROP TABLE IF EXISTS `jc_content_topic`;
CREATE TABLE `jc_content_topic` (
  `content_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY  (`content_id`,`topic_id`),
  KEY `fk_jc_content_topic` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMSר�����ݹ�����';

DROP TABLE IF EXISTS `jc_content_txt`;
CREATE TABLE `jc_content_txt` (
  `content_id` int(11) NOT NULL,
  `txt` longtext COMMENT '��������',
  `txt1` longtext COMMENT '��չ����1',
  `txt2` longtext COMMENT '��չ����2',
  `txt3` longtext COMMENT '��չ����3',
  PRIMARY KEY  (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS�����ı���';

INSERT INTO `jc_content_txt` VALUES (564,'<p style=\"margin: 15px 0px; padding: 0px; font-size: 14px; line-height: 23px; color: rgb(51, 51, 51); font-family: ����;\">�����������ҹ�����û���ĸ��������������&ldquo;����������&rdquo;�����˸е���˷���롢�������Ҳ������ˡ�֮������ˣ������������������漰�����������йأ�Ҳ�����Ƕ������������о�������ɲ�׼�йء���ʵ��ֻҪ��ϸ��һ��������������Ҫ��Ʒ�Ͳ��ѷ��֣�����̸�۵�����������ȷ�һ�����͵ľ���ѧ���룬Ҳ��һ��ȷ�еľ���ѧ���ɣ�����һ���������ۡ����˼�����������ŵ�&ldquo;�����&rdquo;�������ø�ͨ�׵Ļ�˵��һ��&ldquo;���ӻ�&rdquo;��</p>\r\n<p style=\"margin: 15px 0px; padding: 0px; font-size: 14px; line-height: 23px; color: rgb(51, 51, 51); font-family: ����;\">�������ȣ�����ͨ����̸�۵����������壬��һ�������������徭������Ϊ��Ҫ��������ں��ݽ���˼�뷶�롣����һ��������������Ҫ��������ر�������������������������Ү�ˡ�����������˵���Ҫ������ɷ��֣����ǲ����ںܴ�̶��Ͻ��ܺͼ̳��˹ŵ侭��ѧ���¹ŵ侭��ѧ�������ںܶ��������������µĽ��ͺ���ȷ���ӡ����磬��Ү�˹�����ҵѭ���ͻ��ҡ���������ЧӦ�ķ����Լ�����������ڻ������۵Ĳ����ȣ�����Ϊ�ִ��������۽�����ש���ߡ��ٽ����������о�������ã�����Ҳ����Ⱥ���ŵ��������ѧ����Ȼ�������ǵĺܶ����ۺ��������š��ر���&ldquo;ȥ����&rdquo;��ȴ�����˲����������󡣹������������ǵ�&ldquo;ȥ����&rdquo;����Ҫ���������������ݡ�һ��С������Ҫ�����ۡ���Ү��һֱ����������Ԥ���á�����Ϊ���κ���ʽ�����뼯Ȩ�������ɺ��к��ģ�׷��ƻ����ñ�Ȼ���¼�Ȩ���塣�����ŰѰ������ҷ���Ȩ���ڵ��г�Ȩ��ͳͳ�黹�������г�������˽�ˡ�������������Щ���۹۵����������ֱ��20����70���&ldquo;����&rdquo;���������ſ���˹��������ˣ��Ż�ù㷺���ӡ��ر�������1974����ŵ��������ѧ����������������������&ldquo;����ӵ�г������Ȩ&rdquo;�˶������䣻��Ӣ�������ص����ж�����Ҳ�Գ��ǹ�Ү�˵���ͽ�������������ִ��������۽Ƕȣ���֤�Ͳ����˹���������Ԥ���û��Ӿ羭�ò����Ĺ۵㣬���ݴ�����������ظ�Ԥ���õ��������š�����˽�в�Ȩ��Ч�ۡ��Կ�˹Ϊ����Ĳ�Ȩ��������������˲�Ȩ���ر���˽�в�Ȩ���ڽ��ױ߽��ȷ��������ڽ��ͽ��׳ɱ��������г�Ч�ʵ����塣���ǹ�����Ʒ�����г����ۡ�����������ѧ���������ṩ������Ʒ�������߼���ͬ����������������������Ͳ����˹�����Ʒ�ͷ���(����������������������ᱣ�յ�)�г��������۹۵���������š�</p>\r\n<p style=\"margin: 15px 0px; padding: 0px; font-size: 14px; line-height: 23px; color: rgb(51, 51, 51); font-family: ����;\">������Σ������������ֳ����Ծ����ض�������������˼����ʽ���ֳ���������������˼����һ����&ldquo;����˹�����ķ�����&rdquo;Ϊ��Ҫ�������Կ�����ʽ��ԭ������һ��ѧ����ֵ�ľ������������г����˵����˼��������������˼�����ж��ִ�����̬�����У���ߵ�������ĵ���ʢ��һʱ���г������ۡ���ͻ���ص�������͹Ĵ�&ldquo;�г�������Ч����Դ���û���&rdquo;��Ƭ�����г����������Ը��⹦�ܣ���������Ԥ�����ֲ��г�ȱ�ݡ��˷��г�ʧ��Ļ������ã�������Ϊ����ά�����ƺ��������������κ���ʽ��������Ԥ���������г�Ч�ʼ��г��Ľ������С���Ү����Ϊ����������˼���Ĵ����������19����40�������������˵���Ѽ�����������������Ϊ&ldquo;ͨ��ū��֮·&rdquo;��������������������&ldquo;��������ֻ��ע�������壬������ע��ν�ķ�����������ڸ�Ϊʢ�е�&lsquo;���&rsquo;����&rdquo;����������&ldquo;�ᶨ������������&hellip;&hellip;����ܳ��������&rdquo;��</p>\r\n<p style=\"margin: 15px 0px; padding: 0px; font-size: 14px; line-height: 23px; color: rgb(51, 51, 51); font-family: ����;\">����������������廹���Ծ����ض�Ŀ��ָ�������������ʽ���ںͷ�չ�ġ������������������ŵĵ��ͱ�����ʽ��&ldquo;��ʢ�ٹ�ʶ&rdquo;��1989�꣬���������ʾ����о���ǣͷ����������������֧���£��ڻ�ʢ���ٿ���һ��ּ�ڽ���������Ҿ���˥�˵Ĺ������ֻᡣ����������ʾ����о����߼��о�ԱԼ��&middot;����ķɭ������ȡ�õ��ջ�������ܽ�͸���������֮Ϊ&ldquo;��ʢ�ٹ�ʶ&rdquo;����ʢ�ٹ�ʶ��Ҫ��������������ɣ�һ��3��ĸ��ʩ����Ҫ������ǿ�ƾ����ɣ���������֧���ص�ת�򾭼�Ч��ߵ�����������ڸ������������Ľ������ͻ�����ʩ�������򣬿�չ�������ͱ߼�˰�ʺ�����˰���ĸĸ�ȣ�����4���г�����ԭ����Ҫ����ʵ���������ɻ��͸��߾����ԵĻ����ƶ��Լ�ó�����ɻ��ͷ������ֱ��Ͷ�����Ƶȣ�����3��&ldquo;ȥ����&rdquo;��ԤҪ����Ҫ����������ҵ˽�л������ɽ�����˳������������Լ���Ч����˽�˲Ʋ�Ȩ�ȡ���10�����������������Ȼ�����������أ���ì�ܺ�����ͬ��ʮ��ͻ�����ر������е�4���г�����ԭ���3��&ldquo;ȥ����&rdquo;��ԤҪ�󣬸��������������������ҵ�ʵ�ʣ���ʵ������Щ���ҵķ�չ��������һ����������Щ���ҵ�Σ������ʢ�ٹ�ʶ������������������������˼���Ļ���Ҫ�󣬶��Ҽ��з�ӳ���Թ�Ү�˺͸������Ϊ�����&ldquo;��������������&rdquo;���������š�</p>\r\n<p style=\"margin: 15px 0px; padding: 0px; font-size: 14px; line-height: 23px; color: rgb(51, 51, 51); font-family: ����;\">����һ����˵����������ͨ����ʵ�������﷢չ���̵�ϵͳ�۲졢�������о����������ض����۷�����г���͸����γɵ��ܹ���������������ϵ��ϵͳ��˼��͹۵㡣��˼��ͨ�����ض����Ⱥ����ض����۲���˼�빲����������ꡢ���(��ʱҲ�����)���γɵ�һ��Ӱ����ϴ󡢴����Ͽ��˼�볱����ʶ���������ض�˼�����γ��������ض����Ⱥ���������������Ҫ��������ء���ˣ���������ȣ�˼��������������������ʽ�ױ��ԡ�����ģ���ԡ�����Ѹ���Ժ�Ӱ��㷺�Ե��ص㡣�����������ţ������ָ����ȷ��Ҫ��������ǿ��ʵ�����ص㡣һ�����������������ض����������ض����ۺ�˼���ƶ��γɵ��ض�Ҫ�������������������Ϊ�������ۡ����˼�����������ŵĻ���壬���и����������ƭ�Ժ����Ӱ�����������������������������ľ��������ж��ٺ���ɷ֣����Ƕ�Ҫ�߶Ⱦ�������������˼�����ܴ��������Ӱ�죬����Ҫ�ر�ע���ֹ�����������������ſ�����ɵ����Σ������(�������й�����ѧԺ��Ӫ�����о��������Ρ��о�Ա����ʿ����ʦ)</p>\r\n',NULL,NULL,NULL);
DROP TABLE IF EXISTS `jc_content_type`;
CREATE TABLE `jc_content_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL COMMENT '����',
  `img_width` int(11) default NULL COMMENT 'ͼƬ��',
  `img_height` int(11) default NULL COMMENT 'ͼƬ��',
  `has_image` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���ͼƬ',
  `is_disabled` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����',
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS�������ͱ�';

INSERT INTO `jc_content_type` VALUES (1,'��ͨ',100,100,0,0);
INSERT INTO `jc_content_type` VALUES (2,'ͼ��',143,98,1,0);
INSERT INTO `jc_content_type` VALUES (3,'����',280,200,1,0);
INSERT INTO `jc_content_type` VALUES (4,'ͷ��',0,0,0,0);
DROP TABLE IF EXISTS `jc_contenttag`;
CREATE TABLE `jc_contenttag` (
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  KEY `fk_jc_content_tag` (`tag_id`),
  KEY `fk_jc_tag_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS���ݱ�ǩ������';

DROP TABLE IF EXISTS `jc_dictionary`;
CREATE TABLE `jc_dictionary` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL COMMENT 'name',
  `value` varchar(255) NOT NULL COMMENT 'value',
  `type` varchar(255) NOT NULL COMMENT 'type',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='�ֵ��';

DROP TABLE IF EXISTS `jc_directive_tpl`;
CREATE TABLE `jc_directive_tpl` (
  `tpl_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL COMMENT '��ǩ����',
  `description` varchar(1000) default NULL COMMENT '��ǩ����',
  `code` text COMMENT '��ǩ����',
  `user_id` int(11) NOT NULL COMMENT '��ǩ������',
  PRIMARY KEY  (`tpl_id`),
  KEY `fk_jc_directive_tpl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FComment';

DROP TABLE IF EXISTS `jc_file`;
CREATE TABLE `jc_file` (
  `file_path` varchar(255) NOT NULL default '' COMMENT '�ļ�·��',
  `file_name` varchar(255) default '' COMMENT '�ļ�����',
  `file_isvalid` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���Ч',
  `content_id` int(11) default NULL COMMENT '����id',
  PRIMARY KEY  (`file_path`),
  KEY `fk_jc_file_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `jc_file` VALUES ('/u/cms/www/09093304hc6x.jpg','09093304hc6x.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09093632txyy.jpg','09093632txyy.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/090938248x1c.jpg','090938248x1c.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/090940173zaj.jpg','090940173zaj.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094140f562.jpg','09094140f562.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094302sldg.jpg','09094302sldg.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094430w0xt.jpg','09094430w0xt.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09151507n6i1.jpg','09151507n6i1.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09152518pzoq.jpg','09152518pzoq.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09152931cgps.jpg','09152931cgps.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091552426die.jpg','091552426die.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/0915541140xt.jpg','0915541140xt.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09160120meel.jpg','09160120meel.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091602465aop.jpg','091602465aop.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09165026tk5e.jpg','09165026tk5e.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091655240woj.jpg','091655240woj.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09165821s06r.jpg','09165821s06r.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09170006n0hs.jpg','09170006n0hs.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09174523xkvt.jpg','09174523xkvt.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09174527lkok.jpg','09174527lkok.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10092229195q.jpg','10092229195q.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/100950366ij3.jpg','100950366ij3.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/100953460bvo.jpg','100953460bvo.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10103806oifr.jpg','10103806oifr.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10104531ukj5.jpg','10104531ukj5.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10144918u244.jpg','10144918u244.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165619lkm8.jpg','11165619lkm8.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165624319n.jpg','11165624319n.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111656292jx9.jpg','111656292jx9.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165633po01.jpg','11165633po01.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111656366w4b.jpg','111656366w4b.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165640djk4.jpg','11165640djk4.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165849ahx1.jpg','11165849ahx1.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170224nw94.jpg','11170224nw94.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170651qc2f.jpg','11170651qc2f.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170656zz9b.jpg','11170656zz9b.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111707001w2k.jpg','111707001w2k.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170703j2h2.jpg','11170703j2h2.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111707071tn0.jpg','111707071tn0.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170712hp37.jpg','11170712hp37.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111707541g63.jpg','111707541g63.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171054ja61.jpg','11171054ja61.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171058td8f.jpg','11171058td8f.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171102ae78.jpg','11171102ae78.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171106qaui.jpg','11171106qaui.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171109m2sr.jpg','11171109m2sr.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171211kmih.jpg','11171211kmih.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171546aux9.jpg','11171546aux9.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111715499z6t.jpg','111715499z6t.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171553t5kf.jpg','11171553t5kf.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171558kiit.jpg','11171558kiit.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171603em6o.jpg','11171603em6o.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171606wnmy.jpg','11171606wnmy.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1117164754x7.jpg','1117164754x7.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11172127ltqx.jpg','11172127ltqx.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111721308eyj.jpg','111721308eyj.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11172134wikw.jpg','11172134wikw.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11172137nwy5.jpg','11172137nwy5.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11172219hw2t.jpg','11172219hw2t.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173208w8ji.jpg','11173208w8ji.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173213qlec.jpg','11173213qlec.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111732181p5u.jpg','111732181p5u.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173222qknp.jpg','11173222qknp.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1117323496nx.jpg','1117323496nx.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173244ggfv.jpg','11173244ggfv.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173334yvdd.jpg','11173334yvdd.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111737053v9i.jpg','111737053v9i.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173708ffx2.jpg','11173708ffx2.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173711toqx.jpg','11173711toqx.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173718do4k.jpg','11173718do4k.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173719ykxk.jpg','11173719ykxk.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173724ul7o.jpg','11173724ul7o.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173804j6hj.jpg','11173804j6hj.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11174436pnoi.jpg','11174436pnoi.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11174439eb3l.jpg','11174439eb3l.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1117444317kg.jpg','1117444317kg.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111744466aux.jpg','111744466aux.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111745157ps9.jpg','111745157ps9.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105715powr.jpg','12105715powr.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105715u0i2.jpg','12105715u0i2.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105716avso.jpg','12105716avso.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105716f0ks.jpg','12105716f0ks.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105716u081.jpg','12105716u081.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105717rgdv.jpg','12105717rgdv.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105908yuqz.jpg','12105908yuqz.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121101457hlo.jpg','121101457hlo.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121101459s0t.jpg','121101459s0t.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110145r34m.jpg','12110145r34m.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110146fexh.jpg','12110146fexh.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110146v1cq.jpg','12110146v1cq.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110146ynj3.jpg','12110146ynj3.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110240hrzh.jpg','12110240hrzh.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121104013vts.jpg','121104013vts.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110726kcxc.jpg','12110726kcxc.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110726rqp4.jpg','12110726rqp4.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121107270owq.jpg','121107270owq.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1211072762wj.jpg','1211072762wj.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110728cz8z.jpg','12110728cz8z.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110728hvna.jpg','12110728hvna.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110817ejy1.jpg','12110817ejy1.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111106jy1l.jpg','12111106jy1l.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111106lobh.jpg','12111106lobh.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111106zad3.jpg','12111106zad3.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111106zedy.jpg','12111106zedy.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111107ctqg.jpg','12111107ctqg.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111107l4wg.jpg','12111107l4wg.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1211124392sy.jpg','1211124392sy.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111518igwr.jpg','12111518igwr.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111518kvd2.jpg','12111518kvd2.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111518l3p5.jpg','12111518l3p5.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111518vk7v.jpg','12111518vk7v.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121115195muw.jpg','121115195muw.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111519tyc2.jpg','12111519tyc2.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1211190051if.jpg','1211190051if.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12112124imh5.jpg','12112124imh5.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121121253f1z.jpg','121121253f1z.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121121265tk1.jpg','121121265tk1.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121121267h0z.jpg','121121267h0z.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12112127795n.jpg','12112127795n.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12112128ltfy.jpg','12112128ltfy.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12112247lfhe.jpg','12112247lfhe.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12120435rmvm.jpg','12120435rmvm.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12120436on4w.jpg','12120436on4w.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121204384v5d.jpg','121204384v5d.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121204408a3o.jpg','121204408a3o.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1212044200gm.jpg','1212044200gm.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121207389dlf.jpg','121207389dlf.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134158q84h.jpg','12134158q84h.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134158qzrx.jpg','12134158qzrx.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121341597c2x.jpg','121341597c2x.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134159kbxa.jpg','12134159kbxa.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134159robe.jpg','12134159robe.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134200cwyl.jpg','12134200cwyl.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134300ap1h.jpg','12134300ap1h.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134450lo6n.jpg','12134450lo6n.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134450mwvm.jpg','12134450mwvm.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134451j9p9.jpg','12134451j9p9.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134451k1zj.jpg','12134451k1zj.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134452b2g1.jpg','12134452b2g1.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134452bb5z.jpg','12134452bb5z.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134552bk69.jpg','12134552bk69.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121348103ux5.jpg','121348103ux5.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121348109k92.jpg','121348109k92.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121348110tfi.jpg','121348110tfi.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134811y9du.jpg','12134811y9du.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134812unit.jpg','12134812unit.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134933sxsx.jpg','12134933sxsx.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135148im9s.jpg','12135148im9s.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135149ar88.jpg','12135149ar88.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135149bhlg.jpg','12135149bhlg.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135149s2wm.jpg','12135149s2wm.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135243x57l.jpg','12135243x57l.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135606e58j.jpg','12135606e58j.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135607ftvv.jpg','12135607ftvv.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135607vqhp.jpg','12135607vqhp.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135608ad8p.jpg','12135608ad8p.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135608l3ai.jpg','12135608l3ai.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135609wexl.jpg','12135609wexl.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135827xy0y.jpg','12135827xy0y.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135944xk9f.jpg','12135944xk9f.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140033b5mx.jpg','12140033b5mx.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140434ixtu.jpg','12140434ixtu.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140434n4th.jpg','12140434n4th.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140435relm.jpg','12140435relm.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140436rua8.jpg','12140436rua8.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140436wwsc.jpg','12140436wwsc.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140851yp14.jpg','12140851yp14.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141311nuua.jpg','12141311nuua.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141311xxbj.jpg','12141311xxbj.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141312d3p6.jpg','12141312d3p6.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141312r6eb.jpg','12141312r6eb.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1214131399h0.jpg','1214131399h0.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141313ndlq.jpg','12141313ndlq.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121414505xah.jpg','121414505xah.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142118fe7p.jpg','12142118fe7p.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121421197sla.jpg','121421197sla.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142119m8y5.jpg','12142119m8y5.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142120loqu.jpg','12142120loqu.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142120u2tx.jpg','12142120u2tx.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1214212172bk.jpg','1214212172bk.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142322wa0z.jpg','12142322wa0z.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142734jwmh.jpg','12142734jwmh.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142735jqmu.jpg','12142735jqmu.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142735rhib.jpg','12142735rhib.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1214273617d5.jpg','1214273617d5.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142736ue6c.jpg','12142736ue6c.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142737cr9y.jpg','12142737cr9y.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142830poeb.jpg','12142830poeb.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1214325480ue.jpg','1214325480ue.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143254y1wh.jpg','12143254y1wh.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121432556ttu.jpg','121432556ttu.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143255ryzh.jpg','12143255ryzh.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143255ukxu.jpg','12143255ukxu.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143256g1bo.jpg','12143256g1bo.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143342sfmg.jpg','12143342sfmg.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121454345gdz.jpg','121454345gdz.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12145434959z.jpg','12145434959z.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12145434qkiz.jpg','12145434qkiz.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12145435lmi6.jpg','12145435lmi6.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12145435u9c1.jpg','12145435u9c1.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121456599tnd.jpg','121456599tnd.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150556da16.jpg','12150556da16.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150556inf7.jpg','12150556inf7.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150557dzrz.jpg','12150557dzrz.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150557etcp.jpg','12150557etcp.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150701tmkd.jpg','12150701tmkd.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150936264i.jpg','12150936264i.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121509368460.jpg','121509368460.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150936cnpa.jpg','12150936cnpa.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121509371kyv.jpg','121509371kyv.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150937xe3g.jpg','12150937xe3g.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12151139jrv6.jpg','12151139jrv6.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1215211539ic.jpg','1215211539ic.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152115dymp.jpg','12152115dymp.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152115n7ee.jpg','12152115n7ee.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152115oqbj.jpg','12152115oqbj.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152116am9n.jpg','12152116am9n.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152257va9g.jpg','12152257va9g.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153550461x.jpg','12153550461x.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153550ryso.jpg','12153550ryso.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153551fflz.jpg','12153551fflz.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153551igy5.jpg','12153551igy5.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153551r5kz.jpg','12153551r5kz.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121535526foq.jpg','121535526foq.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121536505s2h.jpg','121536505s2h.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121542148jkc.jpg','121542148jkc.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121542158t1n.jpg','121542158t1n.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121542159xil.jpg','121542159xil.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154215ryyk.jpg','12154215ryyk.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154215y02n.jpg','12154215y02n.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154216egtt.jpg','12154216egtt.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121543059cct.jpg','121543059cct.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154708kkn6.jpg','12154708kkn6.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154708nsye.jpg','12154708nsye.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154708we6w.jpg','12154708we6w.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154709iod3.jpg','12154709iod3.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154709ypkl.jpg','12154709ypkl.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121547582f5t.jpg','121547582f5t.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1311420498g8.jpg','1311420498g8.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131203117zrn.jpg','131203117zrn.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131257327chh.jpg','131257327chh.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13141220dfer.jpg','13141220dfer.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131423399l1z.jpg','131423399l1z.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13142927kzr3.jpg','13142927kzr3.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1316285322ks.jpg','1316285322ks.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13162904gqxm.jpg','13162904gqxm.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13162913da42.jpg','13162913da42.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131629222u39.jpg','131629222u39.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13162931ofsn.jpg','13162931ofsn.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13162941ipg2.jpg','13162941ipg2.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13163101ccd3.jpg','13163101ccd3.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13163113pd3s.jpg','13163113pd3s.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13163306pqvc.jpg','13163306pqvc.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165112t47d.jpg','13165112t47d.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165118lr7r.jpg','13165118lr7r.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165348xokj.jpg','13165348xokj.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131656557m43.jpg','131656557m43.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165702cchp.jpg','13165702cchp.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170123ywvv.jpg','13170123ywvv.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170129mx9q.jpg','13170129mx9q.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170427k084.jpg','13170427k084.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131706089h4w.jpg','131706089h4w.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170759d8ow.jpg','13170759d8ow.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170940lu1h.jpg','13170940lu1h.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19110822fin2.jpg','19110822fin2.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19112623820c.jpg','19112623820c.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19112700bypf.jpg','19112700bypf.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19114043tp85.jpg','19114043tp85.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19114201tdir.jpg','19114201tdir.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191201449moh.jpg','191201449moh.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191203538tdp.jpg','191203538tdp.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19131809acqm.jpg','19131809acqm.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19131949r2ge.jpg','19131949r2ge.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191342393mlg.jpg','191342393mlg.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19134448qvza.jpg','19134448qvza.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191351590e53.jpg','191351590e53.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19135642zjak.jpg','19135642zjak.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19135645ge7r.jpg','19135645ge7r.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19135821ij0m.jpg','19135821ij0m.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19140340fri2.jpg','19140340fri2.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19140601kgid.jpg','19140601kgid.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19140803w9fg.jpg','19140803w9fg.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191408471iyj.jpg','191408471iyj.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141200ip5c.jpg','19141200ip5c.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141318apz1.jpg','19141318apz1.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141700opui.jpg','19141700opui.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141756u9sa.jpg','19141756u9sa.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142041eu8x.jpg','19142041eu8x.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142206y73m.jpg','19142206y73m.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142430589t.jpg','19142430589t.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142451945q.jpg','19142451945q.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142818yvty.jpg','19142818yvty.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142840ycm6.jpg','19142840ycm6.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201139137vu6.jpg','201139137vu6.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114003od1n.jpg','20114003od1n.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201140399nrc.jpg','201140399nrc.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201143116bd3.jpg','201143116bd3.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114348t1z8.jpg','20114348t1z8.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114520rqti.jpg','20114520rqti.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114607jim6.jpg','20114607jim6.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114824s9bf.jpg','20114824s9bf.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20115532h8tv.jpg','20115532h8tv.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201159459afm.jpg','201159459afm.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20120531bbei.jpg','20120531bbei.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20120732ybv8.jpg','20120732ybv8.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201308','201308',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201309','201309',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201312/301119254w80.flv','/u/cms/www/201312/301119254w80.flv',0,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093458gynd.jpg','22093458gynd.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093502mmft.jpg','22093502mmft.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093506l8pv.jpg','22093506l8pv.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093509qm3l.jpg','22093509qm3l.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093513srmf.jpg','22093513srmf.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094752xoxd.jpg','22094752xoxd.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094906lrj8.jpg','22094906lrj8.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094911xe9x.jpg','22094911xe9x.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094915t8h1.jpg','22094915t8h1.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094918gnze.jpg','22094918gnze.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100555lytj.jpg','22100555lytj.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100558gfsb.jpg','22100558gfsb.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100601l1us.jpg','22100601l1us.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100606t8mw.jpg','22100606t8mw.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100611o2gl.jpg','22100611o2gl.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172935t4sb.jpg','23172935t4sb.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172936acob.jpg','23172936acob.jpg',1,NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172937bli1.jpg','23172937bli1.jpg',1,NULL);
DROP TABLE IF EXISTS `jc_friendlink`;
CREATE TABLE `jc_friendlink` (
  `friendlink_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_id` int(11) NOT NULL,
  `site_name` varchar(150) NOT NULL COMMENT '��վ����',
  `domain` varchar(255) NOT NULL COMMENT '��վ��ַ',
  `logo` varchar(150) default NULL COMMENT 'ͼ��',
  `email` varchar(100) default NULL COMMENT 'վ������',
  `description` varchar(255) default NULL COMMENT '����',
  `views` int(11) NOT NULL default '0' COMMENT '�������',
  `is_enabled` char(1) NOT NULL default '1' COMMENT '�Ƿ���ʾ',
  `priority` int(11) NOT NULL default '10' COMMENT '����˳��',
  PRIMARY KEY  (`friendlink_id`),
  KEY `fk_jc_ctg_friendlink` (`friendlinkctg_id`),
  KEY `fk_jc_friendlink_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='CMS��������';

INSERT INTO `jc_friendlink` VALUES (1,1,1,'ndmxw����','http://www.ndmxw.com',NULL,'ndmxw2015@163.com','ndmxw��JavaEE����վ����ϵͳ��Java Enterprise Edition Content Manage System���ļ�ơ�Javaƾ����ǿ���ȶ�����ȫ����Ч�ȶ෽������ƣ�һֱ����ҵ��Ӧ�õ���ѡ��',34,'1',1);
INSERT INTO `jc_friendlink` VALUES (3,1,2,'�����̳�','http://www.360buy.com/','/u/cms/www/201112/1910271036lr.gif','','',3,'1',10);
INSERT INTO `jc_friendlink` VALUES (4,1,2,'������','http://www.dangdang.com/','/u/cms/www/201112/191408344rwj.gif','','',1,'1',10);
INSERT INTO `jc_friendlink` VALUES (5,1,2,'����ѷ','http://www.amazon.cn/','/u/cms/www/201112/19141012lh2q.gif','','',1,'1',10);
INSERT INTO `jc_friendlink` VALUES (6,1,2,'ihush','http://www.ihush.com/','/u/cms/www/201112/19141255yrfb.gif','','',1,'1',10);
DROP TABLE IF EXISTS `jc_friendlink_ctg`;
CREATE TABLE `jc_friendlink_ctg` (
  `friendlinkctg_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_name` varchar(50) NOT NULL COMMENT '����',
  `priority` int(11) NOT NULL default '10' COMMENT '����˳��',
  PRIMARY KEY  (`friendlinkctg_id`),
  KEY `fk_jc_friendlinkctg_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS�����������';

INSERT INTO `jc_friendlink_ctg` VALUES (1,1,'��������',1);
INSERT INTO `jc_friendlink_ctg` VALUES (2,1,'Ʒ��ר����ͼƬ���ӣ�',2);
DROP TABLE IF EXISTS `jc_group`;
CREATE TABLE `jc_group` (
  `group_id` int(11) NOT NULL auto_increment,
  `group_name` varchar(100) NOT NULL COMMENT '����',
  `priority` int(11) NOT NULL default '10' COMMENT '����˳��',
  `need_captcha` tinyint(1) NOT NULL default '1' COMMENT '�Ƿ���Ҫ��֤��',
  `need_check` tinyint(1) NOT NULL default '1' COMMENT '�Ƿ���Ҫ���',
  `allow_per_day` int(11) NOT NULL default '4096' COMMENT 'ÿ�������ϴ�KB',
  `allow_max_file` int(11) NOT NULL default '1024' COMMENT 'ÿ���ļ����KB',
  `allow_suffix` varchar(255) default 'jpg,jpeg,gif,png,bmp' COMMENT '�����ϴ��ĺ�׺',
  `is_reg_def` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�Ĭ�ϻ�Ա��',
  PRIMARY KEY  (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS��Ա���';

INSERT INTO `jc_group` VALUES (1,'��ͨ��Ա',10,1,1,0,0,'',1);
INSERT INTO `jc_group` VALUES (2,'�߼���',10,1,1,0,0,'',0);
DROP TABLE IF EXISTS `jc_guestbook`;
CREATE TABLE `jc_guestbook` (
  `guestbook_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `guestbookctg_id` int(11) NOT NULL,
  `member_id` int(11) default NULL COMMENT '���Ի�Ա',
  `admin_id` int(11) default NULL COMMENT '�ظ�����Ա',
  `ip` varchar(50) NOT NULL COMMENT '����IP',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  `replay_time` datetime default NULL COMMENT '�ظ�ʱ��',
  `is_checked` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����',
  `is_recommend` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ��Ƽ�',
  PRIMARY KEY  (`guestbook_id`),
  KEY `fk_jc_ctg_guestbook` (`guestbookctg_id`),
  KEY `fk_jc_guestbook_admin` (`admin_id`),
  KEY `fk_jc_guestbook_member` (`member_id`),
  KEY `fk_jc_guestbook_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='CMS����';

INSERT INTO `jc_guestbook` VALUES (1,1,1,NULL,1,'127.0.0.1','2014-01-01 15:02:19',NULL,1,0);
INSERT INTO `jc_guestbook` VALUES (2,1,1,1,NULL,'127.0.0.1','2014-04-19 16:04:19',NULL,0,0);
INSERT INTO `jc_guestbook` VALUES (3,1,1,1,NULL,'127.0.0.1','2014-04-19 16:04:34',NULL,0,0);
INSERT INTO `jc_guestbook` VALUES (4,1,1,NULL,NULL,'127.0.0.1','2014-04-19 17:11:55',NULL,0,0);
INSERT INTO `jc_guestbook` VALUES (5,1,2,1,NULL,'127.0.0.1','2014-04-21 09:28:01',NULL,0,0);
INSERT INTO `jc_guestbook` VALUES (6,1,1,1,NULL,'127.0.0.1','2014-04-21 10:52:45',NULL,0,0);
INSERT INTO `jc_guestbook` VALUES (7,1,1,1,NULL,'127.0.0.1','2014-04-21 11:20:16',NULL,0,0);
INSERT INTO `jc_guestbook` VALUES (8,1,1,1,1,'127.0.0.1','2014-04-21 11:23:25','2014-05-07 17:33:05',0,1);
INSERT INTO `jc_guestbook` VALUES (9,1,1,1,NULL,'127.0.0.1','2014-05-04 16:06:02',NULL,0,1);
DROP TABLE IF EXISTS `jc_guestbook_ctg`;
CREATE TABLE `jc_guestbook_ctg` (
  `guestbookctg_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `ctg_name` varchar(100) NOT NULL COMMENT '����',
  `priority` int(11) NOT NULL default '10' COMMENT '����˳��',
  `description` varchar(255) default NULL COMMENT '����',
  PRIMARY KEY  (`guestbookctg_id`),
  KEY `fk_jc_guestbookctg_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS�������';

INSERT INTO `jc_guestbook_ctg` VALUES (1,1,'��ͨ',1,'��ͨ����');
INSERT INTO `jc_guestbook_ctg` VALUES (2,1,'Ͷ��',10,'Ͷ��');
DROP TABLE IF EXISTS `jc_guestbook_ext`;
CREATE TABLE `jc_guestbook_ext` (
  `guestbook_id` int(11) NOT NULL,
  `title` varchar(255) default NULL COMMENT '���Ա���',
  `content` longtext COMMENT '��������',
  `reply` longtext COMMENT '�ظ�����',
  `email` varchar(100) default NULL COMMENT '�����ʼ�',
  `phone` varchar(100) default NULL COMMENT '�绰',
  `qq` varchar(50) default NULL COMMENT 'QQ',
  KEY `fk_jc_ext_guestbook` (`guestbook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS��������';

INSERT INTO `jc_guestbook_ext` VALUES (1,'111111111111111','11','11111111111111111',NULL,NULL,NULL);
INSERT INTO `jc_guestbook_ext` VALUES (2,'aa','a',NULL,NULL,'aa',NULL);
INSERT INTO `jc_guestbook_ext` VALUES (3,'aa','a',NULL,NULL,'aa',NULL);
INSERT INTO `jc_guestbook_ext` VALUES (4,'asdfsadf','asdfasdfasdf',NULL,NULL,NULL,NULL);
INSERT INTO `jc_guestbook_ext` VALUES (5,'aaaa','aaaaa',NULL,NULL,'a',NULL);
INSERT INTO `jc_guestbook_ext` VALUES (6,NULL,'asdfasd',NULL,NULL,NULL,NULL);
INSERT INTO `jc_guestbook_ext` VALUES (7,NULL,'aaa',NULL,NULL,'a',NULL);
INSERT INTO `jc_guestbook_ext` VALUES (8,'asdf','asdf','asdf',NULL,NULL,NULL);
INSERT INTO `jc_guestbook_ext` VALUES (9,'<script>alert(\"dd\")</script> ','<script>alert(\"dd\")</script> ',NULL,NULL,NULL,NULL);
DROP TABLE IF EXISTS `jc_job_apply`;
CREATE TABLE `jc_job_apply` (
  `job_apply_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL COMMENT '�û�id',
  `content_id` int(11) NOT NULL COMMENT 'ְλid',
  `apply_time` datetime NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY  (`job_apply_id`),
  KEY `fk_jc_job_apply_user` (`user_id`),
  KEY `fk_jc_job_apply_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ְλ�����';

DROP TABLE IF EXISTS `jc_keyword`;
CREATE TABLE `jc_keyword` (
  `keyword_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) default NULL COMMENT 'վ��ID',
  `keyword_name` varchar(100) NOT NULL COMMENT '����',
  `url` varchar(255) NOT NULL COMMENT '����',
  `is_disabled` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����',
  PRIMARY KEY  (`keyword_id`),
  KEY `fk_jc_keyword_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS���ݹؼ��ʱ�';

INSERT INTO `jc_keyword` VALUES (1,NULL,'���ݹ���ϵͳ','<a href=\"http://www.ndmxw.com/\" target=\"_blank\">���ݹ���ϵͳ</a>',0);
DROP TABLE IF EXISTS `jc_log`;
CREATE TABLE `jc_log` (
  `log_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `site_id` int(11) default NULL,
  `category` int(11) NOT NULL COMMENT '��־����',
  `log_time` datetime NOT NULL COMMENT '��־ʱ��',
  `ip` varchar(50) default NULL COMMENT 'IP��ַ',
  `url` varchar(255) default NULL COMMENT 'URL��ַ',
  `title` varchar(255) default NULL COMMENT '��־����',
  `content` varchar(255) default NULL COMMENT '��־����',
  PRIMARY KEY  (`log_id`),
  KEY `fk_jc_log_site` (`site_id`),
  KEY `fk_jc_log_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS��־��';

DROP TABLE IF EXISTS `jc_message`;
CREATE TABLE `jc_message` (
  `msg_id` int(11) NOT NULL auto_increment COMMENT '��Ϣid',
  `msg_title` varchar(255) NOT NULL default '' COMMENT '����',
  `msg_content` longtext COMMENT 'վ����Ϣ����',
  `send_time` timestamp NULL default NULL COMMENT '����ʱ��',
  `msg_send_user` int(11) NOT NULL default '1' COMMENT '����Ϣ��',
  `msg_receiver_user` int(11) NOT NULL default '0' COMMENT '������',
  `site_id` int(11) NOT NULL default '1' COMMENT 'վ��',
  `msg_status` tinyint(1) NOT NULL default '0' COMMENT '��Ϣ״̬0δ����1�Ѷ�',
  `msg_box` int(2) NOT NULL default '1' COMMENT '��Ϣ���� 0�ռ��� 1������ 2�ݸ��� 3������',
  PRIMARY KEY  (`msg_id`),
  KEY `fk_jc_message_user_send` (`msg_send_user`),
  KEY `fk_jc_message_user_receiver` (`msg_receiver_user`),
  KEY `fk_jc_message_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='վ����';

DROP TABLE IF EXISTS `jc_model`;
CREATE TABLE `jc_model` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL COMMENT '����',
  `model_path` varchar(100) NOT NULL COMMENT '·��',
  `tpl_channel_prefix` varchar(20) default NULL COMMENT '��Ŀģ��ǰ׺',
  `tpl_content_prefix` varchar(20) default NULL COMMENT '����ģ��ǰ׺',
  `title_img_width` int(11) NOT NULL default '139' COMMENT '��Ŀ����ͼ���',
  `title_img_height` int(11) NOT NULL default '139' COMMENT '��Ŀ����ͼ�߶�',
  `content_img_width` int(11) NOT NULL default '310' COMMENT '��Ŀ����ͼ���',
  `content_img_height` int(11) NOT NULL default '310' COMMENT '��Ŀ����ͼ�߶�',
  `priority` int(11) NOT NULL default '10' COMMENT '����˳��',
  `has_content` tinyint(1) NOT NULL default '1' COMMENT '�Ƿ�������',
  `is_disabled` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����',
  `is_def` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�Ĭ��ģ��',
  PRIMARY KEY  (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMSģ�ͱ�';

DROP TABLE IF EXISTS `jc_model_item`;
CREATE TABLE `jc_model_item` (
  `modelitem_id` int(11) NOT NULL auto_increment,
  `model_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '�ֶ�',
  `item_label` varchar(100) NOT NULL COMMENT '����',
  `priority` int(11) NOT NULL default '70' COMMENT '����˳��',
  `def_value` varchar(255) default NULL COMMENT 'Ĭ��ֵ',
  `opt_value` varchar(255) default NULL COMMENT '��ѡ��',
  `text_size` varchar(20) default NULL COMMENT '����',
  `area_rows` varchar(3) default NULL COMMENT '�ı�����',
  `area_cols` varchar(3) default NULL COMMENT '�ı�����',
  `help` varchar(255) default NULL COMMENT '������Ϣ',
  `help_position` varchar(1) default NULL COMMENT '����λ��',
  `data_type` int(11) NOT NULL default '1' COMMENT '��������',
  `is_single` tinyint(1) NOT NULL default '1' COMMENT '�Ƿ��ռһ��',
  `is_channel` tinyint(1) NOT NULL default '1' COMMENT '�Ƿ���Ŀģ����',
  `is_custom` tinyint(1) NOT NULL default '1' COMMENT '�Ƿ��Զ���',
  `is_display` tinyint(1) NOT NULL default '1' COMMENT '�Ƿ���ʾ',
  PRIMARY KEY  (`modelitem_id`),
  KEY `fk_jc_item_model` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8 COMMENT='CMSģ�����';

INSERT INTO `jc_model_item` VALUES (1,1,'name','��Ŀ����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (2,1,'path','����·��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (3,1,'title','meta����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (4,1,'keywords','meta�ؼ���',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (5,1,'description','meta����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (6,1,'tplChannel','��Ŀģ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (7,1,'tplContent','ѡ��ģ��ģ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (8,1,'channelStatic','��Ŀ��̬��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (9,1,'contentStatic','���ݾ�̬��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (10,1,'priority','����˳��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (11,1,'display','��ʾ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (12,1,'docImg','�ĵ�ͼƬ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (14,1,'afterCheck','��˺�',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (15,1,'commentControl','����',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (16,1,'allowUpdown','����',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (17,1,'viewGroupIds','���Ȩ��',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (18,1,'contriGroupIds','Ͷ��Ȩ��',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (20,1,'link','�ⲿ����',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (21,1,'titleImg','����ͼ',12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (23,1,'title','����',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (24,1,'shortTitle','��̱���',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (25,1,'titleColor','������ɫ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (26,1,'tagStr','Tag��ǩ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (27,1,'description','ժҪ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (28,1,'author','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (29,1,'origin','��Դ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (30,1,'viewGroupIds','���Ȩ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (31,1,'topLevel','�̶�����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (32,1,'releaseDate','����ʱ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (33,1,'typeId','��������',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (34,1,'tplContent','ָ��ģ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (35,1,'typeImg','����ͼ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (36,1,'titleImg','����ͼ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (37,1,'contentImg','����ͼ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (38,1,'attachments','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (39,1,'media','��ý��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (40,1,'txt','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (42,2,'name','��Ŀ����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (43,2,'path','����·��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (44,2,'title','meta����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (45,2,'keywords','meta�ؼ���',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (46,2,'description','meta����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (47,2,'tplChannel','��Ŀģ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (48,2,'priority','����˳��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (49,2,'display','��ʾ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (50,2,'viewGroupIds','���Ȩ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (51,2,'link','�ⲿ����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (52,2,'contentImg','����ͼ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (53,2,'txt','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (93,4,'name','��Ŀ����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (94,4,'path','����·��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (95,4,'title','meta����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (96,4,'keywords','meta�ؼ���',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (97,4,'description','meta����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (98,4,'tplChannel','��Ŀģ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (99,4,'tplContent','ѡ��ģ��ģ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (100,4,'priority','����˳��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (101,4,'display','��ʾ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (102,4,'docImg','�ĵ�ͼƬ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (103,4,'commentControl','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (104,4,'allowUpdown','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (105,4,'viewGroupIds','���Ȩ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (107,4,'channelId','��Ŀ',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (108,4,'title','�������',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (109,4,'shortTitle','������',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (110,4,'titleColor','������ɫ',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (111,4,'description','ժҪ',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (112,4,'author','������',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (113,4,'viewGroupIds','���Ȩ��',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (114,4,'topLevel','�̶�����',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (115,4,'releaseDate','����ʱ��',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (116,4,'typeId','��������',21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (117,4,'tplContent','ָ��ģ��',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (118,4,'contentImg','����ͼ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (119,4,'attachments','��Դ�ϴ�',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (120,4,'txt','�������',20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (121,4,'softType','�������',12,'�������','�������,�������','100','3','30',NULL,NULL,6,0,0,1,1);
INSERT INTO `jc_model_item` VALUES (122,4,'warrant','�����Ȩ',13,'��Ѱ�','��Ѱ�,�����','','3','30','','',6,0,0,1,1);
INSERT INTO `jc_model_item` VALUES (123,4,'relatedLink','�������',14,'http://','','50','3','30','','',1,0,0,1,1);
INSERT INTO `jc_model_item` VALUES (124,4,'demoUrl','��ʾ��ַ',15,'http://',NULL,'60','3','30',NULL,NULL,1,0,0,1,1);
INSERT INTO `jc_model_item` VALUES (125,5,'name','��Ŀ����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (126,5,'path','����·��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (127,5,'title','meta����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (128,5,'keywords','meta�ؼ���',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (129,5,'description','meta����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (130,5,'tplChannel','��Ŀģ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (131,5,'tplContent','ѡ��ģ��ģ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (132,5,'channelStatic','��Ŀ��̬��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (133,5,'contentStatic','���ݾ�̬��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (134,5,'priority','����˳��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (135,5,'display','��ʾ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (136,5,'docImg','�ĵ�ͼƬ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (138,5,'afterCheck','��˺�',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (139,5,'commentControl','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (140,5,'allowUpdown','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (141,5,'viewGroupIds','���Ȩ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (142,5,'contriGroupIds','Ͷ��Ȩ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (144,5,'link','�ⲿ����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (145,5,'titleImg','����ͼ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (146,5,'contentImg','����ͼ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (147,5,'channelId','��Ŀ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (148,5,'title','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (149,5,'shortTitle','��̱���',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (150,5,'titleColor','������ɫ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (151,5,'tagStr','Tag��ǩ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (152,5,'description','ժҪ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (153,5,'author','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (154,5,'origin','��Դ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (155,5,'viewGroupIds','���Ȩ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (156,5,'topLevel','�̶�����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (157,5,'releaseDate','����ʱ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (158,5,'typeId','��������',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (159,5,'tplContent','ָ��ģ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (160,5,'typeImg','����ͼ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (161,5,'titleImg','����ͼ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (162,5,'contentImg','����ͼ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (163,5,'pictures','ͼƬ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (164,6,'name','��Ŀ����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (165,6,'path','����·��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (166,6,'title','meta����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (167,6,'keywords','meta�ؼ���',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (168,6,'description','meta����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (169,6,'tplChannel','��Ŀģ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (170,6,'tplContent','ѡ��ģ��ģ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (171,6,'channelStatic','��Ŀ��̬��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (172,6,'contentStatic','���ݾ�̬��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (173,6,'priority','����˳��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (174,6,'display','��ʾ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (175,6,'docImg','�ĵ�ͼƬ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (177,6,'afterCheck','��˺�',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (178,6,'commentControl','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (179,6,'allowUpdown','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,8,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (180,6,'viewGroupIds','���Ȩ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (181,6,'contriGroupIds','Ͷ��Ȩ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,0,1,0,1);
INSERT INTO `jc_model_item` VALUES (183,6,'link','�ⲿ����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (184,6,'titleImg','����ͼ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (185,6,'contentImg','����ͼ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,0,1);
INSERT INTO `jc_model_item` VALUES (186,6,'channelId','��Ŀ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (187,6,'title','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (188,6,'shortTitle','��̱���',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (189,6,'titleColor','������ɫ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,0,0,0,1);
INSERT INTO `jc_model_item` VALUES (190,6,'tagStr','Tag��ǩ',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (191,6,'description','���ݼ��',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,1,0,0,1);
INSERT INTO `jc_model_item` VALUES (192,6,'author','����',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,0,1);
DROP TABLE IF EXISTS `jc_origin`;
CREATE TABLE `jc_origin` (
  `origin_id` int(11) NOT NULL auto_increment,
  `origin_name` varchar(255) NOT NULL COMMENT '��Դ����',
  `ref_count` int(11) NOT NULL default '0' COMMENT '��Դ��������',
  PRIMARY KEY  (`origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='��Դ';

INSERT INTO `jc_origin` VALUES (1,'����΢��',0);
INSERT INTO `jc_origin` VALUES (2,'�ٶ�',0);
INSERT INTO `jc_origin` VALUES (3,'�ٶ���̳',0);
INSERT INTO `jc_origin` VALUES (4,'�ٶ�����',0);
INSERT INTO `jc_origin` VALUES (5,'��������',0);
INSERT INTO `jc_origin` VALUES (6,'��Ѷ����',0);
DROP TABLE IF EXISTS `jc_plug`;
CREATE TABLE `jc_plug` (
  `plug_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL COMMENT '�������',
  `path` varchar(255) NOT NULL default '' COMMENT '�ļ�·��',
  `description` varchar(2000) default NULL COMMENT '����',
  `author` varchar(255) default NULL COMMENT '����',
  `upload_time` datetime NOT NULL COMMENT '�ϴ�ʱ��',
  `install_time` datetime default NULL COMMENT '��װʱ��',
  `uninstall_time` datetime default NULL COMMENT 'ж��ʱ��',
  `file_conflict` tinyint(1) NOT NULL default '0' COMMENT '�����ļ��Ƿ��ͻ',
  `is_used` tinyint(1) NOT NULL default '0' COMMENT 'ʹ��״̬(0δʹ��,1ʹ����)',
  `plug_perms` varchar(255) default '' COMMENT '���Ȩ�ޣ�,�ָ�����Ȩ�����ã�',
  PRIMARY KEY  (`plug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='���';

INSERT INTO `jc_plug` VALUES (4,'����1','/WEB-INF/plug/test.zip','���Բ���','TOM','2014-01-04 16:49:47','2014-02-19 09:49:31','2014-02-19 09:49:15',0,0,'test:*');
DROP TABLE IF EXISTS `jc_receiver_message`;
CREATE TABLE `jc_receiver_message` (
  `msg_re_id` int(11) NOT NULL auto_increment COMMENT '��Ϣid',
  `msg_title` varchar(255) NOT NULL default '' COMMENT '����',
  `msg_content` longtext COMMENT 'վ����Ϣ����',
  `send_time` timestamp NULL default NULL COMMENT '����ʱ��',
  `msg_send_user` int(11) NOT NULL default '1' COMMENT '����Ϣ��',
  `msg_receiver_user` int(11) NOT NULL default '0' COMMENT '������',
  `site_id` int(11) NOT NULL default '1' COMMENT 'վ��',
  `msg_status` tinyint(1) NOT NULL default '0' COMMENT '��Ϣ״̬0δ����1�Ѷ�',
  `msg_box` int(2) NOT NULL default '1' COMMENT '��Ϣ���� 0�ռ��� 1������ 2�ݸ��� 3������',
  `msg_id` int(11) default NULL COMMENT '���ŵ��ż�id',
  PRIMARY KEY  (`msg_re_id`),
  KEY `jc_receiver_message_user_send` (`msg_send_user`),
  KEY `jc_receiver_message_user_receiver` (`msg_receiver_user`),
  KEY `jc_receiver_message_site` (`site_id`),
  KEY `jc_receiver_message_message` (`msg_re_id`),
  KEY `fk_jc_receiver_message_message` (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='վ�������ű�';

INSERT INTO `jc_receiver_message` VALUES (1,'aa','aaa','2014-01-22 09:44:32',1,1,1,1,0,NULL);
INSERT INTO `jc_receiver_message` VALUES (2,'aa','aaa','2014-01-22 09:44:32',1,1,1,0,3,NULL);
DROP TABLE IF EXISTS `jc_role`;
CREATE TABLE `jc_role` (
  `role_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) default NULL,
  `role_name` varchar(100) NOT NULL COMMENT '��ɫ����',
  `priority` int(11) NOT NULL default '10' COMMENT '����˳��',
  `is_super` char(1) NOT NULL default '0' COMMENT 'ӵ������Ȩ��',
  PRIMARY KEY  (`role_id`),
  KEY `fk_jc_role_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS��ɫ��';

INSERT INTO `jc_role` VALUES (1,NULL,'����Ա',10,'1');
DROP TABLE IF EXISTS `jc_role_permission`;
CREATE TABLE `jc_role_permission` (
  `role_id` int(11) NOT NULL,
  `uri` varchar(100) NOT NULL,
  KEY `fk_jc_permission_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS��ɫ��Ȩ��';

DROP TABLE IF EXISTS `jc_score_group`;
CREATE TABLE `jc_score_group` (
  `score_group_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL COMMENT '������',
  `description` varchar(1000) default NULL COMMENT '����',
  `enable` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����',
  `def` tinyint(3) NOT NULL default '0' COMMENT '�Ƿ�Ĭ��',
  `site_id` int(11) NOT NULL COMMENT 'վ��',
  PRIMARY KEY  (`score_group_id`),
  KEY `fk_jc_score_group_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='FComment';

DROP TABLE IF EXISTS `jc_score_item`;
CREATE TABLE `jc_score_item` (
  `score_item_id` int(11) NOT NULL auto_increment,
  `score_group_id` int(11) NOT NULL COMMENT '������',
  `name` varchar(255) NOT NULL COMMENT '������',
  `score` int(11) NOT NULL COMMENT '��ֵ',
  `image_path` varchar(255) default NULL COMMENT '����ͼ��·��',
  `priority` int(11) NOT NULL default '10' COMMENT '����',
  PRIMARY KEY  (`score_item_id`),
  KEY `fk_jc_score_item_group` (`score_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='������';

DROP TABLE IF EXISTS `jc_score_record`;
CREATE TABLE `jc_score_record` (
  `score_record_id` int(11) NOT NULL auto_increment,
  `score_item_id` int(11) NOT NULL COMMENT '������',
  `content_id` int(11) NOT NULL COMMENT '����',
  `score_count` int(11) NOT NULL COMMENT '���ִ���',
  PRIMARY KEY  (`score_record_id`),
  KEY `fk_jc_record_score_item` (`score_item_id`),
  KEY `index_score_record_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ּ�¼';

DROP TABLE IF EXISTS `jc_search_words`;
CREATE TABLE `jc_search_words` (
  `word_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL COMMENT '�����ʻ�',
  `hit_count` int(11) NOT NULL default '0' COMMENT '��������',
  `priority` int(11) NOT NULL default '10' COMMENT '���ȼ�',
  `name_initial` varchar(500) NOT NULL default '' COMMENT 'ƴ������ĸ',
  PRIMARY KEY  (`word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='�����ȴ�';

DROP TABLE IF EXISTS `jc_sensitivity`;
CREATE TABLE `jc_sensitivity` (
  `sensitivity_id` int(11) NOT NULL auto_increment,
  `search` varchar(255) NOT NULL COMMENT '���д�',
  `replacement` varchar(255) NOT NULL COMMENT '�滻��',
  PRIMARY KEY  (`sensitivity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS���дʱ�';

DROP TABLE IF EXISTS `jc_site`;
CREATE TABLE `jc_site` (
  `site_id` int(11) NOT NULL auto_increment,
  `config_id` int(11) NOT NULL COMMENT '����ID',
  `ftp_upload_id` int(11) default NULL COMMENT '�ϴ�ftp',
  `domain` varchar(50) NOT NULL COMMENT '����',
  `site_path` varchar(20) NOT NULL COMMENT '·��',
  `site_name` varchar(100) NOT NULL COMMENT '��վ����',
  `short_name` varchar(100) NOT NULL COMMENT '�������',
  `protocol` varchar(20) NOT NULL default 'http://' COMMENT 'Э��',
  `dynamic_suffix` varchar(10) NOT NULL default '.jhtml' COMMENT '��̬ҳ��׺',
  `static_suffix` varchar(10) NOT NULL default '.html' COMMENT '��̬ҳ��׺',
  `static_dir` varchar(50) default NULL COMMENT '��̬ҳ���Ŀ¼',
  `is_index_to_root` char(1) NOT NULL default '0' COMMENT '�Ƿ�ʹ�ý���ҳ���ڸ�Ŀ¼��',
  `is_static_index` char(1) NOT NULL default '0' COMMENT '�Ƿ�̬����ҳ',
  `locale_admin` varchar(10) NOT NULL default 'zh_CN' COMMENT '��̨���ػ�',
  `locale_front` varchar(10) NOT NULL default 'zh_CN' COMMENT 'ǰ̨���ػ�',
  `tpl_solution` varchar(50) NOT NULL default 'default' COMMENT 'ģ�巽��',
  `final_step` tinyint(4) NOT NULL default '2' COMMENT '���󼶱�',
  `after_check` tinyint(4) NOT NULL default '2' COMMENT '��˺�(1:�����޸�ɾ��;2:�޸ĺ��˻�;3:�޸ĺ󲻱�)',
  `is_relative_path` char(1) NOT NULL default '1' COMMENT '�Ƿ�ʹ�����·��',
  `is_recycle_on` char(1) NOT NULL default '1' COMMENT '�Ƿ�������վ',
  `domain_alias` varchar(255) default NULL COMMENT '��������',
  `domain_redirect` varchar(255) default NULL COMMENT '�����ض���',
  `tpl_index` varchar(255) default NULL COMMENT '��ҳģ��',
  `keywords` varchar(255) default NULL COMMENT 'վ��ؼ���',
  `description` varchar(255) default NULL COMMENT 'վ������',
  PRIMARY KEY  (`site_id`),
  UNIQUE KEY `ak_domain_path` (`domain`),
  KEY `fk_jc_site_config` (`config_id`),
  KEY `fk_jc_site_upload_ftp` (`ftp_upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMSվ���';

DROP TABLE IF EXISTS `jc_site_access`;
CREATE TABLE `jc_site_access` (
  `access_id` int(11) NOT NULL auto_increment,
  `session_id` varchar(32) NOT NULL default '',
  `site_id` int(11) NOT NULL COMMENT 'վ��id',
  `access_time` time NOT NULL COMMENT '����ʱ��',
  `access_date` date NOT NULL COMMENT '��������',
  `ip` varchar(50) NOT NULL default '',
  `area` varchar(50) default NULL COMMENT '���ʵ���',
  `access_source` varchar(255) default NULL COMMENT '������Դ',
  `external_link` varchar(255) default NULL COMMENT '�ⲿ������ַ',
  `engine` varchar(50) default NULL COMMENT '��������',
  `entry_page` varchar(255) default NULL COMMENT '���ҳ��',
  `last_stop_page` varchar(255) default NULL COMMENT '���ͣ��ҳ��',
  `visit_second` int(11) default NULL COMMENT '����ʱ��(��)',
  `visit_page_count` int(11) default NULL COMMENT '����ҳ����',
  `operating_system` varchar(50) default NULL COMMENT '����ϵͳ',
  `browser` varchar(50) default NULL COMMENT '�����',
  `keyword` varchar(255) default NULL COMMENT '���ùؼ���',
  PRIMARY KEY  (`access_id`),
  KEY `fk_jc_access_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='վ����ʱ�';

DROP TABLE IF EXISTS `jc_site_access_count`;
CREATE TABLE `jc_site_access_count` (
  `access_count` int(11) NOT NULL auto_increment,
  `page_count` int(11) NOT NULL default '1' COMMENT '����ҳ��',
  `visitors` int(11) NOT NULL default '0' COMMENT '�û���',
  `statistic_date` date NOT NULL COMMENT 'ͳ������',
  `site_id` int(11) NOT NULL COMMENT 'ͳ��վ��',
  PRIMARY KEY  (`access_count`),
  KEY `fk_jc_access_count_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ÿ��ͳ��ҳ���������';

DROP TABLE IF EXISTS `jc_site_access_pages`;
CREATE TABLE `jc_site_access_pages` (
  `access_pages_id` int(11) NOT NULL auto_increment,
  `access_page` varchar(255) NOT NULL COMMENT '����ҳ��',
  `session_id` varchar(32) NOT NULL,
  `access_date` date NOT NULL default '0000-00-00' COMMENT '��������',
  `access_time` time NOT NULL COMMENT '����ʱ��',
  `visit_second` int(11) NOT NULL default '0' COMMENT 'ͣ��ʱ�����룩',
  `page_index` int(11) NOT NULL default '0' COMMENT '�û�����ҳ�������',
  `site_id` int(11) NOT NULL default '1',
  PRIMARY KEY  (`access_pages_id`),
  KEY `fk_jc_access_pages_access` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������ϸҳ���';

DROP TABLE IF EXISTS `jc_site_access_statistic`;
CREATE TABLE `jc_site_access_statistic` (
  `access_statistic_id` int(11) NOT NULL auto_increment,
  `statistic_date` date NOT NULL COMMENT 'ͳ������',
  `pv` int(11) NOT NULL default '0' COMMENT 'pv��',
  `ip` int(11) NOT NULL default '0' COMMENT 'ip��',
  `visitors` int(11) NOT NULL default '0' COMMENT '�ÿ�����',
  `pages_aver` int(11) NOT NULL default '0' COMMENT '�˾��������',
  `visit_second_aver` int(11) NOT NULL default '0' COMMENT '�˾�����ʱ�����룩',
  `site_id` int(11) NOT NULL COMMENT 'վ��id',
  `statisitc_type` varchar(255) NOT NULL default 'all' COMMENT 'ͳ�Ʒ��ࣨall���������з�������ͳ�ƣ�',
  `statistic_column_value` varchar(255) default '' COMMENT 'ͳ����ֵ',
  PRIMARY KEY  (`access_statistic_id`),
  KEY `fk_jc_access_statistic_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����ͳ�Ʊ�';

DROP TABLE IF EXISTS `jc_site_attr`;
CREATE TABLE `jc_site_attr` (
  `site_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '����',
  `attr_value` varchar(255) default NULL COMMENT 'ֵ',
  KEY `fk_jc_attr_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMSվ�����Ա�';

DROP TABLE IF EXISTS `jc_site_cfg`;
CREATE TABLE `jc_site_cfg` (
  `site_id` int(11) NOT NULL,
  `cfg_name` varchar(30) NOT NULL COMMENT '����',
  `cfg_value` varchar(255) default NULL COMMENT 'ֵ',
  KEY `fk_jc_cfg_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMSվ�����ñ�';

DROP TABLE IF EXISTS `jc_site_company`;
CREATE TABLE `jc_site_company` (
  `site_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '��˾����',
  `scale` varchar(255) default NULL COMMENT '��˾��ģ',
  `nature` varchar(255) default NULL COMMENT '��˾����',
  `industry` varchar(1000) default NULL COMMENT '��˾��ҵ',
  `contact` varchar(500) default NULL COMMENT '��ϵ��ʽ',
  `description` text COMMENT '��˾���',
  `address` varchar(500) default NULL COMMENT '��˾��ַ',
  `longitude` float(5,2) default NULL COMMENT '����',
  `latitude` float(4,2) default NULL COMMENT 'γ��',
  PRIMARY KEY  (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��˾��Ϣ';

DROP TABLE IF EXISTS `jc_site_model`;
CREATE TABLE `jc_site_model` (
  `model_id` int(11) NOT NULL auto_increment,
  `field` varchar(50) NOT NULL COMMENT '�ֶ�',
  `model_label` varchar(100) NOT NULL COMMENT '����',
  `priority` int(11) NOT NULL default '10' COMMENT '����˳��',
  `upload_path` varchar(100) default NULL COMMENT '�ϴ�·��',
  `text_size` varchar(20) default NULL COMMENT '����',
  `area_rows` varchar(3) default NULL COMMENT '�ı�����',
  `area_cols` varchar(3) default NULL COMMENT '�ı�����',
  `help` varchar(255) default NULL COMMENT '������Ϣ',
  `help_position` varchar(1) default NULL COMMENT '����λ��',
  `data_type` int(11) default '1' COMMENT '0:�༭��;1:�ı���;2:�ı���;3:ͼƬ;4:����',
  `is_single` tinyint(1) default '1' COMMENT '�Ƿ��ռһ��',
  PRIMARY KEY  (`model_id`),
  UNIQUE KEY `ak_field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMSվ����Ϣģ�ͱ�';

DROP TABLE IF EXISTS `jc_site_txt`;
CREATE TABLE `jc_site_txt` (
  `site_id` int(11) NOT NULL,
  `txt_name` varchar(30) NOT NULL COMMENT '����',
  `txt_value` longtext COMMENT 'ֵ',
  KEY `fk_jc_txt_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMSվ���ı���';

DROP TABLE IF EXISTS `jc_task`;
CREATE TABLE `jc_task` (
  `task_id` int(11) NOT NULL auto_increment,
  `task_code` varchar(255) default NULL COMMENT '����ִ�д���',
  `task_type` tinyint(1) NOT NULL default '0' COMMENT '��������(1��ҳ��̬����2��Ŀҳ��̬����3����ҳ��̬����4�ɼ���5�ַ�)',
  `task_name` varchar(255) NOT NULL COMMENT '��������',
  `job_class` varchar(255) NOT NULL COMMENT '������',
  `execycle` tinyint(1) NOT NULL default '1' COMMENT 'ִ�����ڷ���(1�Ǳ��ʽ 2 cron���ʽ)',
  `day_of_month` int(11) default NULL COMMENT 'ÿ�µ�����',
  `day_of_week` tinyint(1) default NULL COMMENT '�ܼ�',
  `hour` int(11) default NULL COMMENT 'Сʱ',
  `minute` int(11) default NULL COMMENT '����',
  `interval_hour` int(11) default NULL COMMENT '���Сʱ',
  `interval_minute` int(11) default NULL COMMENT '�������',
  `task_interval_unit` tinyint(1) default NULL COMMENT '1���ӡ�2Сʱ��3�ա�4�ܡ�5��',
  `cron_expression` varchar(255) default NULL COMMENT '������ʽ',
  `is_enable` tinyint(1) NOT NULL default '1' COMMENT '�Ƿ�����',
  `task_remark` varchar(255) default NULL COMMENT '����˵��',
  `site_id` int(11) NOT NULL COMMENT 'վ��',
  `user_id` int(11) NOT NULL COMMENT '������',
  `create_time` datetime NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY  (`task_id`),
  KEY `fk_jc_task_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����';

DROP TABLE IF EXISTS `jc_task_attr`;
CREATE TABLE `jc_task_attr` (
  `task_id` int(11) NOT NULL,
  `param_name` varchar(30) NOT NULL COMMENT '��������',
  `param_value` varchar(255) default NULL COMMENT '����ֵ',
  KEY `fk_jc_attr_task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���������';

DROP TABLE IF EXISTS `jc_third_account`;
CREATE TABLE `jc_third_account` (
  `account_id` bigint(20) NOT NULL auto_increment,
  `account_key` varchar(255) NOT NULL default '' COMMENT '�������˺�key',
  `username` varchar(100) NOT NULL default '0' COMMENT '�����û���',
  `source` varchar(10) NOT NULL default '' COMMENT '�������˺�ƽ̨(QQ������΢����)',
  PRIMARY KEY  (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������¼ƽ̨�˺�';

DROP TABLE IF EXISTS `jc_topic`;
CREATE TABLE `jc_topic` (
  `topic_id` int(11) NOT NULL auto_increment,
  `channel_id` int(11) default NULL,
  `topic_name` varchar(150) NOT NULL COMMENT '����',
  `short_name` varchar(150) default NULL COMMENT '���',
  `keywords` varchar(255) default NULL COMMENT '�ؼ���',
  `description` varchar(255) default NULL COMMENT '����',
  `title_img` varchar(100) default NULL COMMENT '����ͼ',
  `content_img` varchar(100) default NULL COMMENT '����ͼ',
  `tpl_content` varchar(100) default NULL COMMENT 'ר��ģ��',
  `priority` int(11) NOT NULL default '10' COMMENT '����˳��',
  `is_recommend` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ���??',
  PRIMARY KEY  (`topic_id`),
  KEY `fk_jc_topic_channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='CMSר���';

DROP TABLE IF EXISTS `jc_user`;
CREATE TABLE `jc_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT '�û���',
  `email` varchar(100) default NULL COMMENT '����',
  `register_time` datetime NOT NULL COMMENT 'ע��ʱ��',
  `register_ip` varchar(50) NOT NULL default '127.0.0.1' COMMENT 'ע��IP',
  `last_login_time` datetime NOT NULL COMMENT '����¼ʱ��',
  `last_login_ip` varchar(50) NOT NULL default '127.0.0.1' COMMENT '����¼IP',
  `login_count` int(11) NOT NULL default '0' COMMENT '��¼����',
  `rank` int(11) NOT NULL default '0' COMMENT '����Ա����',
  `upload_total` bigint(20) NOT NULL default '0' COMMENT '�ϴ��ܴ�С',
  `upload_size` int(11) NOT NULL default '0' COMMENT '�ϴ���С',
  `upload_date` date default NULL COMMENT '�ϴ�����',
  `is_admin` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����Ա',
  `is_self_admin` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�ֻ�����Լ�������',
  `is_disabled` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `ak_username` (`username`),
  KEY `fk_jc_user_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS�û���';

DROP TABLE IF EXISTS `jc_user_attr`;
CREATE TABLE `jc_user_attr` (
  `user_id` int(11) NOT NULL,
  `attr_name` varchar(255) NOT NULL,
  `attr_value` varchar(255) default NULL,
  KEY `fk_jc_attr_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û����Ա�';

DROP TABLE IF EXISTS `jc_user_collection`;
CREATE TABLE `jc_user_collection` (
  `user_id` int(11) NOT NULL default '0' COMMENT '�û�id',
  `content_id` int(11) NOT NULL default '0' COMMENT '����id',
  PRIMARY KEY  (`user_id`,`content_id`),
  KEY `fk_jc_user_collection_con` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û��ղع�����';

DROP TABLE IF EXISTS `jc_user_ext`;
CREATE TABLE `jc_user_ext` (
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) default NULL COMMENT '��ʵ����',
  `gender` tinyint(1) default NULL COMMENT '�Ա�',
  `birthday` datetime default NULL COMMENT '��������',
  `intro` varchar(255) default NULL COMMENT '���˽���',
  `comefrom` varchar(150) default NULL COMMENT '����',
  `qq` varchar(100) default NULL COMMENT 'QQ',
  `msn` varchar(100) default NULL COMMENT 'MSN',
  `phone` varchar(50) default NULL COMMENT '�绰',
  `mobile` varchar(50) default NULL COMMENT '�ֻ�',
  `user_img` varchar(255) default NULL COMMENT '�û�ͷ��',
  `user_signature` varchar(255) default NULL COMMENT '�û�����ǩ��',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS�û���չ��Ϣ��';

DROP TABLE IF EXISTS `jc_user_menu`;
CREATE TABLE `jc_user_menu` (
  `menu_id` int(11) NOT NULL auto_increment,
  `menu_name` varchar(255) NOT NULL COMMENT '�˵�����',
  `menu_url` varchar(255) NOT NULL COMMENT '�˵���ַ',
  `priority` int(11) NOT NULL default '10',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`menu_id`),
  KEY `fk_jc_menu_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û����ò˵�';

DROP TABLE IF EXISTS `jc_user_resume`;
CREATE TABLE `jc_user_resume` (
  `user_id` int(11) NOT NULL,
  `resume_name` varchar(255) NOT NULL COMMENT '��������',
  `target_worknature` varchar(255) default NULL COMMENT '������������',
  `target_workplace` varchar(255) default NULL COMMENT '���������ص�',
  `target_category` varchar(255) default NULL COMMENT '����ְλ���',
  `target_salary` varchar(255) default NULL COMMENT '������н',
  `edu_school` varchar(255) default NULL COMMENT '��ҵѧУ',
  `edu_graduation` datetime default NULL COMMENT '��ҵʱ��',
  `edu_back` varchar(255) default NULL COMMENT 'ѧ��',
  `edu_discipline` varchar(255) default NULL COMMENT 'רҵ',
  `recent_company` varchar(500) default NULL COMMENT '���������˾����',
  `company_industry` varchar(255) default NULL COMMENT '�����˾������ҵ',
  `company_scale` varchar(255) default NULL COMMENT '��˾��ģ',
  `job_name` varchar(255) default NULL COMMENT 'ְλ����',
  `job_category` varchar(255) default NULL COMMENT 'ְλ���',
  `job_start` datetime default NULL COMMENT '������ʼʱ��',
  `subordinates` varchar(255) default NULL COMMENT '��������',
  `job_description` text COMMENT '��������',
  `self_evaluation` varchar(2000) default NULL COMMENT '��������',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�û�����';

DROP TABLE IF EXISTS `jc_user_role`;
CREATE TABLE `jc_user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`role_id`,`user_id`),
  KEY `fk_jc_role_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS�û���ɫ������';

DROP TABLE IF EXISTS `jc_user_site`;
CREATE TABLE `jc_user_site` (
  `usersite_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL default '1' COMMENT '��˼���',
  `is_all_channel` tinyint(1) NOT NULL default '1' COMMENT '�Ƿ�ӵ��������Ŀ��Ȩ��',
  PRIMARY KEY  (`usersite_id`),
  KEY `fk_jc_site_user` (`user_id`),
  KEY `fk_jc_user_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS����Ավ���';

DROP TABLE IF EXISTS `jc_vote_item`;
CREATE TABLE `jc_vote_item` (
  `voteitem_id` int(11) NOT NULL auto_increment,
  `votetopic_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '����',
  `vote_count` int(11) NOT NULL default '0' COMMENT 'ͶƱ����',
  `priority` int(11) NOT NULL default '10' COMMENT '����˳��',
  `subtopic_id` int(11) default NULL,
  PRIMARY KEY  (`voteitem_id`),
  KEY `fk_jc_vote_item_topic` (`votetopic_id`),
  KEY `FK_jc_vote_item_subtopic` (`subtopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='CMSͶƱ��';

INSERT INTO `jc_vote_item` VALUES (1,2,'��ϲ��',0,3,12);
INSERT INTO `jc_vote_item` VALUES (2,2,'ϲ��',0,2,12);
INSERT INTO `jc_vote_item` VALUES (3,2,'��ϲ��',1,1,12);
INSERT INTO `jc_vote_item` VALUES (4,2,'û�иĽ�',0,7,11);
INSERT INTO `jc_vote_item` VALUES (5,2,'�иĽ�',0,5,11);
INSERT INTO `jc_vote_item` VALUES (6,2,'�Ľ��ܴ�',1,4,11);
INSERT INTO `jc_vote_item` VALUES (7,2,'���',0,6,11);
INSERT INTO `jc_vote_item` VALUES (8,2,'����',1,11,9);
INSERT INTO `jc_vote_item` VALUES (9,2,'����',1,8,9);
INSERT INTO `jc_vote_item` VALUES (10,2,'ͼ��',1,9,9);
INSERT INTO `jc_vote_item` VALUES (11,2,'��Ƶ',1,10,9);
DROP TABLE IF EXISTS `jc_vote_record`;
CREATE TABLE `jc_vote_record` (
  `voterecored_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `votetopic_id` int(11) NOT NULL,
  `vote_time` datetime NOT NULL COMMENT 'ͶƱʱ��',
  `vote_ip` varchar(50) NOT NULL COMMENT 'ͶƱIP',
  `vote_cookie` varchar(32) NOT NULL COMMENT 'ͶƱCOOKIE',
  PRIMARY KEY  (`voterecored_id`),
  KEY `fk_jc_vote_record_topic` (`votetopic_id`),
  KEY `fk_jc_voterecord_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMSͶƱ��¼';

DROP TABLE IF EXISTS `jc_vote_reply`;
CREATE TABLE `jc_vote_reply` (
  `votereply_id` int(11) NOT NULL auto_increment,
  `reply` text COMMENT '�ظ�����',
  `subtopic_id` int(11) default NULL,
  PRIMARY KEY  (`votereply_id`),
  KEY `FK_jc_vote_reply_sub` (`subtopic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ͶƱ�ı���Ŀ�ظ���';

DROP TABLE IF EXISTS `jc_vote_subtopic`;
CREATE TABLE `jc_vote_subtopic` (
  `subtopic_id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '' COMMENT '����',
  `votetopic_id` int(11) NOT NULL default '0' COMMENT 'ͶƱ�����飩',
  `subtopic_type` int(2) NOT NULL default '1' COMMENT '���ͣ�1��ѡ��2��ѡ��3�ı���',
  `priority` int(11) default NULL,
  PRIMARY KEY  (`subtopic_id`),
  KEY `FK_jc_vote_subtopic_vote` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='ͶƱ����Ŀ';

INSERT INTO `jc_vote_subtopic` VALUES (9,'������V5��ʾվ��Щģ�����ıȽϺ�',2,2,4);
INSERT INTO `jc_vote_subtopic` VALUES (10,'�Ҿ�����������һ�£�',2,3,3);
INSERT INTO `jc_vote_subtopic` VALUES (11,'V5�汾��V2012sp1�����Ʒ���иĽ���',2,1,2);
INSERT INTO `jc_vote_subtopic` VALUES (12,'V5�汾��ʾվ��ҳ����Ʒ����ϲ����',2,1,1);
DROP TABLE IF EXISTS `jc_vote_topic`;
CREATE TABLE `jc_vote_topic` (
  `votetopic_id` int(11) NOT NULL auto_increment,
  `site_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '����',
  `description` varchar(255) default NULL COMMENT '����',
  `start_time` datetime default NULL COMMENT '��ʼʱ��',
  `end_time` datetime default NULL COMMENT '����ʱ��',
  `repeate_hour` int(11) default NULL COMMENT '�ظ�ͶƱ����ʱ�䣬��λСʱ��Ϊ�ղ������ظ�ͶƱ',
  `total_count` int(11) NOT NULL default '0' COMMENT '��ͶƱ��',
  `multi_select` int(11) NOT NULL default '1' COMMENT '������ѡ����',
  `is_restrict_member` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����ƻ�Ա',
  `is_restrict_ip` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����IP',
  `is_restrict_cookie` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�����COOKIE',
  `is_disabled` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ����',
  `is_def` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�Ĭ������',
  PRIMARY KEY  (`votetopic_id`),
  KEY `fk_jc_votetopic_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMSͶƱ����';

INSERT INTO `jc_vote_topic` VALUES (2,1,'ndmxw��ʾվ�İ��û��ʾ����','ndmxwv5����ʽ�����ˣ�������ϵͳ�����ƣ�ndmxw��ʾվ��ģ��Ҳһֱ�ڲ��ϵĸİ棬��Դ˴θİ棬ndmxw�����Ŷ����������롰ndmxw��ʾվ�İ��û��ʾ���顱��ϣ������������������������һ������Ľ���лл��ҵ�֧�֣�',NULL,NULL,NULL,1,1,0,0,0,0,1);
DROP TABLE IF EXISTS `jo_authentication`;
CREATE TABLE `jo_authentication` (
  `authentication_id` char(32) NOT NULL COMMENT '��֤ID',
  `userid` int(11) NOT NULL COMMENT '�û�ID',
  `username` varchar(100) NOT NULL COMMENT '�û���',
  `email` varchar(100) default NULL COMMENT '����',
  `login_time` datetime NOT NULL COMMENT '��¼ʱ��',
  `login_ip` varchar(50) NOT NULL COMMENT '��¼ip',
  `update_time` datetime NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY  (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��֤��Ϣ��';

DROP TABLE IF EXISTS `jo_config`;
CREATE TABLE `jo_config` (
  `cfg_key` varchar(50) NOT NULL COMMENT '����KEY',
  `cfg_value` varchar(255) default NULL COMMENT '����VALUE',
  PRIMARY KEY  (`cfg_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ñ�';

INSERT INTO `jo_config` VALUES ('email_encoding','');
INSERT INTO `jo_config` VALUES ('email_host','smtp.126.com');
INSERT INTO `jo_config` VALUES ('email_password','mingming_chen');
INSERT INTO `jo_config` VALUES ('email_personal','');
INSERT INTO `jo_config` VALUES ('email_port',NULL);
INSERT INTO `jo_config` VALUES ('email_username','ndmxwv5@126.com');
INSERT INTO `jo_config` VALUES ('login_error_interval','30');
INSERT INTO `jo_config` VALUES ('login_error_times','3');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_subject','�һ�ndmxw����');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_text','��л��ʹ��ndmxwϵͳ��Ա�����һع��ܣ����ס�����һ���Ϣ��\r\n�û�ID��${uid}\r\n�û�����${username}\r\n����������Ϊ��${resetPwd}\r\n������������������������Ч��\r\nhttp://demo.ndmxw.com/member/password_reset.jspx?uid=${uid}&key=${resetKey}');
INSERT INTO `jo_config` VALUES ('message_register_subject','��ӭ��ע��ndmxw�û�');
INSERT INTO `jo_config` VALUES ('message_register_text','${username}���ã�\r\n��ӭ��ע��ndmxwϵͳ��Ա\r\n�����������ӽ��м���\r\nhttp://demo.ndmxw.com/active.jspx?username=${username}&key=${activationCode}');
INSERT INTO `jo_config` VALUES ('message_subject','ndmxw��Ա�����һ���Ϣ');
INSERT INTO `jo_config` VALUES ('message_text','��л��ʹ��ndmxwϵͳ��Ա�����һع��ܣ����ס�����һ���Ϣ��\r\n�û�ID��${uid}\r\n�û�����${username}\r\n����������Ϊ��${resetPwd}\r\n������������������������Ч��\r\nhttp://localhost/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');
DROP TABLE IF EXISTS `jo_ftp`;
CREATE TABLE `jo_ftp` (
  `ftp_id` int(11) NOT NULL auto_increment,
  `ftp_name` varchar(100) NOT NULL COMMENT '����',
  `ip` varchar(50) NOT NULL COMMENT 'IP',
  `port` int(11) NOT NULL default '21' COMMENT '�˿ں�',
  `username` varchar(100) default NULL COMMENT '��¼��',
  `password` varchar(100) default NULL COMMENT '��½����',
  `encoding` varchar(20) NOT NULL default 'UTF-8' COMMENT '����',
  `timeout` int(11) default NULL COMMENT '��ʱʱ��',
  `ftp_path` varchar(255) default NULL COMMENT '·��',
  `url` varchar(255) NOT NULL COMMENT '����URL',
  PRIMARY KEY  (`ftp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FTP��';

DROP TABLE IF EXISTS `jo_template`;
CREATE TABLE `jo_template` (
  `tpl_name` varchar(150) NOT NULL COMMENT 'ģ������',
  `tpl_source` longtext COMMENT 'ģ������',
  `last_modified` bigint(20) NOT NULL COMMENT '����޸�ʱ��',
  `is_directory` tinyint(1) NOT NULL default '0' COMMENT '�Ƿ�Ŀ¼',
  PRIMARY KEY  (`tpl_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ģ���';

DROP TABLE IF EXISTS `jo_upload`;
CREATE TABLE `jo_upload` (
  `filename` varchar(150) NOT NULL COMMENT '�ļ���',
  `length` int(11) NOT NULL COMMENT '�ļ���С(�ֽ�)',
  `last_modified` bigint(20) NOT NULL COMMENT '����޸�ʱ��',
  `content` longblob NOT NULL COMMENT '����',
  PRIMARY KEY  (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ϴ�������';

DROP TABLE IF EXISTS `jo_user`;
CREATE TABLE `jo_user` (
  `user_id` int(11) NOT NULL auto_increment COMMENT '�û�ID',
  `username` varchar(100) NOT NULL COMMENT '�û���',
  `email` varchar(100) default NULL COMMENT '��������',
  `password` char(32) NOT NULL COMMENT '����',
  `register_time` datetime NOT NULL COMMENT 'ע��ʱ��',
  `register_ip` varchar(50) NOT NULL default '127.0.0.1' COMMENT 'ע��IP',
  `last_login_time` datetime NOT NULL COMMENT '����¼ʱ��',
  `last_login_ip` varchar(50) NOT NULL default '127.0.0.1' COMMENT '����¼IP',
  `login_count` int(11) NOT NULL default '0' COMMENT '��¼����',
  `reset_key` char(32) default NULL COMMENT '��������KEY',
  `reset_pwd` varchar(10) default NULL COMMENT '��������VALUE',
  `error_time` datetime default NULL COMMENT '��¼����ʱ��',
  `error_count` int(11) NOT NULL default '0' COMMENT '��¼�������',
  `error_ip` varchar(50) default NULL COMMENT '��¼����IP',
  `activation` tinyint(1) NOT NULL default '1' COMMENT '����״̬',
  `activation_code` char(32) default NULL COMMENT '������',
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `ak_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='�û���';

INSERT INTO `jo_user` VALUES (1,'admin',NULL,'5f4dcc3b5aa765d61d8327deb882cf99','2011-01-03','127.0.0.1','2013-11-06 15:09:12','127.0.0.1',131,NULL,NULL,'2013-12-24 17:01:46',1,'127.0.0.1',1,NULL);

CREATE TABLE `jc_test` (
  `test_id` int(11) NOT NULL auto_increment,
  `test_title` varchar(255) ,
  `test_description` varchar(255) ,
  `site_id` int(11) NOT NULL ,
  `user_id` int(11) ,
  PRIMARY KEY  (`test_id`),
  KEY `fk_jc_test_user` (`user_id`),
  KEY `fk_jc_test_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='���Ա�';

ALTER TABLE `jc_test`
ADD CONSTRAINT `fk_jc_test_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
ADD CONSTRAINT `fk_jc_test_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_acquisition`
ADD CONSTRAINT `fk_jc_acquisition_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
ADD CONSTRAINT `fk_jc_acquisition_contenttype` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
ADD CONSTRAINT `fk_jc_acquisition_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
ADD CONSTRAINT `fk_jc_acquisition_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_acquisition_history`
ADD CONSTRAINT `fk_jc_history_acquisition` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`);

ALTER TABLE `jc_acquisition_temp`
ADD CONSTRAINT `fk_jc_temp_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_advertising`
ADD CONSTRAINT `fk_jc_advertising_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
ADD CONSTRAINT `fk_jc_space_advertising` FOREIGN KEY (`adspace_id`) REFERENCES `jc_advertising_space` (`adspace_id`);

ALTER TABLE `jc_advertising_attr`
ADD CONSTRAINT `fk_jc_params_advertising` FOREIGN KEY (`advertising_id`) REFERENCES `jc_advertising` (`advertising_id`);

ALTER TABLE `jc_advertising_space`
ADD CONSTRAINT `fk_jc_adspace_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_channel`
ADD CONSTRAINT `fk_jc_channel_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
ADD CONSTRAINT `fk_jc_channel_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_channel` (`channel_id`),
ADD CONSTRAINT `fk_jc_channel_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_channel_attr`
ADD CONSTRAINT `fk_jc_attr_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`);

ALTER TABLE `jc_channel_count`
ADD CONSTRAINT `fk_jc_count_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`);

ALTER TABLE `jc_channel_ext`
ADD CONSTRAINT `fk_jc_ext_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`);

ALTER TABLE `jc_channel_model`
ADD CONSTRAINT `fk_jc_channel_model_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
ADD CONSTRAINT `fk_jc_model_channel_m` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`);

ALTER TABLE `jc_channel_txt`
ADD CONSTRAINT `fk_jc_txt_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`);

ALTER TABLE `jc_channel_user`
ADD CONSTRAINT `fk_jc_channel_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
ADD CONSTRAINT `fk_jc_user_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`);

ALTER TABLE `jc_chnl_group_contri`
ADD CONSTRAINT `fk_jc_channel_group_c` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
ADD CONSTRAINT `fk_jc_group_channel_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`);

ALTER TABLE `jc_chnl_group_view`
ADD CONSTRAINT `fk_jc_channel_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
ADD CONSTRAINT `fk_jc_group_channel_v` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`);

ALTER TABLE `jc_comment`
ADD CONSTRAINT `fk_jc_comment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
ADD CONSTRAINT `fk_jc_comment_reply` FOREIGN KEY (`reply_user_id`) REFERENCES `jc_user` (`user_id`),
ADD CONSTRAINT `fk_jc_comment_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
ADD CONSTRAINT `fk_jc_comment_user` FOREIGN KEY (`comment_user_id`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_comment_ext`
ADD CONSTRAINT `fk_jc_ext_comment` FOREIGN KEY (`comment_id`) REFERENCES `jc_comment` (`comment_id`);

ALTER TABLE `jc_config_attr`
ADD CONSTRAINT `fk_jc_attr_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`);

ALTER TABLE `jc_config_item`
ADD CONSTRAINT `fk_jc_item_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`);

ALTER TABLE `jc_content`
ADD CONSTRAINT `fk_jc_contentchannel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
ADD CONSTRAINT `fk_jc_content_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
ADD CONSTRAINT `fk_jc_content_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
ADD CONSTRAINT `fk_jc_content_type` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
ADD CONSTRAINT `fk_jc_content_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_content_attachment`
ADD CONSTRAINT `fk_jc_attachment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`);

ALTER TABLE `jc_content_attr`
ADD CONSTRAINT `fk_jc_attr_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`);

ALTER TABLE `jc_content_channel`
ADD CONSTRAINT `fk_jc_channel_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
ADD CONSTRAINT `fk_jc_content_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`);

ALTER TABLE `jc_content_check`
ADD CONSTRAINT `fk_jc_check_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
ADD CONSTRAINT `fk_jc_content_check_user` FOREIGN KEY (`reviewer`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_content_count`
ADD CONSTRAINT `fk_jc_count_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`);

ALTER TABLE `jc_content_ext`
ADD CONSTRAINT `fk_jc_ext_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`);

ALTER TABLE `jc_content_group_view`
ADD CONSTRAINT `fk_jc_content_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
ADD CONSTRAINT `fk_jc_group_content_v` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`);

ALTER TABLE `jc_content_picture`
ADD CONSTRAINT `fk_jc_picture_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`);

ALTER TABLE `jc_content_topic`
ADD CONSTRAINT `fk_jc_content_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`),
ADD CONSTRAINT `fk_jc_topic_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`);

ALTER TABLE `jc_content_txt`
ADD CONSTRAINT `fk_jc_txt_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`);

ALTER TABLE `jc_contenttag`
ADD CONSTRAINT `fk_jc_content_tag` FOREIGN KEY (`tag_id`) REFERENCES `jc_content_tag` (`tag_id`),
ADD CONSTRAINT `fk_jc_tag_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`);

ALTER TABLE `jc_friendlink`
ADD CONSTRAINT `fk_jc_ctg_friendlink` FOREIGN KEY (`friendlinkctg_id`) REFERENCES `jc_friendlink_ctg` (`friendlinkctg_id`),
ADD CONSTRAINT `fk_jc_friendlink_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_friendlink_ctg`
ADD CONSTRAINT `fk_jc_friendlinkctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_guestbook`
ADD CONSTRAINT `fk_jc_ctg_guestbook` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`),
ADD CONSTRAINT `fk_jc_guestbook_admin` FOREIGN KEY (`admin_id`) REFERENCES `jc_user` (`user_id`),
ADD CONSTRAINT `fk_jc_guestbook_member` FOREIGN KEY (`member_id`) REFERENCES `jc_user` (`user_id`),
ADD CONSTRAINT `fk_jc_guestbook_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_guestbook_ctg`
ADD CONSTRAINT `fk_jc_guestbookctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_guestbook_ext`
ADD CONSTRAINT `fk_jc_ext_guestbook` FOREIGN KEY (`guestbook_id`) REFERENCES `jc_guestbook` (`guestbook_id`);

ALTER TABLE `jc_job_apply`
ADD CONSTRAINT `fk_jc_job_apply_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
ADD CONSTRAINT `fk_jc_job_apply_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_keyword`
ADD CONSTRAINT `fk_jc_keyword_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_log`
ADD CONSTRAINT `fk_jc_log_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
ADD CONSTRAINT `fk_jc_log_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_message`
ADD CONSTRAINT `fk_jc_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
ADD CONSTRAINT `fk_jc_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
ADD CONSTRAINT `fk_jc_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_model_item`
ADD CONSTRAINT `fk_jc_item_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`);

ALTER TABLE `jc_receiver_message`
ADD CONSTRAINT `fk_jc_receiver_message_message` FOREIGN KEY (`msg_id`) REFERENCES `jc_message` (`msg_id`),
ADD CONSTRAINT `fk_jc_receiver_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
ADD CONSTRAINT `fk_jc_receiver_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
ADD CONSTRAINT `fk_jc_receiver_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_role`
ADD CONSTRAINT `fk_jc_role_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_role_permission`
ADD CONSTRAINT `fk_jc_permission_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`);

ALTER TABLE `jc_score_item`
ADD CONSTRAINT `fk_jc_score_item_group` FOREIGN KEY (`score_group_id`) REFERENCES `jc_score_group` (`score_group_id`);

ALTER TABLE `jc_score_record`
ADD CONSTRAINT `fk_jc_record_score_item` FOREIGN KEY (`score_item_id`) REFERENCES `jc_score_item` (`score_item_id`);

ALTER TABLE `jc_site`
ADD CONSTRAINT `fk_jc_site_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`),
ADD CONSTRAINT `fk_jc_site_upload_ftp` FOREIGN KEY (`ftp_upload_id`) REFERENCES `jo_ftp` (`ftp_id`);

ALTER TABLE `jc_site_access`
ADD CONSTRAINT `fk_jc_access_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_site_access_count`
ADD CONSTRAINT `fk_jc_access_count_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_site_access_statistic`
ADD CONSTRAINT `fk_jc_access_statistic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_site_attr`
ADD CONSTRAINT `fk_jc_attr_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_site_cfg`
ADD CONSTRAINT `fk_jc_cfg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_site_company`
ADD CONSTRAINT `fk_jc_company_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_site_txt`
ADD CONSTRAINT `fk_jc_txt_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_task`
ADD CONSTRAINT `fk_jc_task_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_task_attr`
ADD CONSTRAINT `fk_jc_attr_task` FOREIGN KEY (`task_id`) REFERENCES `jc_task` (`task_id`);

ALTER TABLE `jc_topic`
ADD CONSTRAINT `fk_jc_topic_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`);

ALTER TABLE `jc_user`
ADD CONSTRAINT `fk_jc_user_group` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`);

ALTER TABLE `jc_user_attr`
ADD CONSTRAINT `fk_jc_attr_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_user_collection`
ADD CONSTRAINT `fk_jc_user_collection_con` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
ADD CONSTRAINT `fk_jc_user_collection_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_user_ext`
ADD CONSTRAINT `fk_jc_ext_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_user_menu`
ADD CONSTRAINT `fk_jc_menu_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_user_resume`
ADD CONSTRAINT `fk_jc_resume_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`);

ALTER TABLE `jc_user_role`
ADD CONSTRAINT `fk_jc_role_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
ADD CONSTRAINT `fk_jc_user_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`);

ALTER TABLE `jc_user_site`
ADD CONSTRAINT `fk_jc_site_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
ADD CONSTRAINT `fk_jc_user_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

ALTER TABLE `jc_vote_item`
ADD CONSTRAINT `FK_jc_vote_item_subtopic` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`),
ADD CONSTRAINT `fk_jc_vote_item_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`);

ALTER TABLE `jc_vote_record`
ADD CONSTRAINT `fk_jc_voterecord_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
ADD CONSTRAINT `fk_jc_vote_record_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`);

ALTER TABLE `jc_vote_reply`
ADD CONSTRAINT `FK_jc_vote_reply_sub` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`);

ALTER TABLE `jc_vote_subtopic`
ADD CONSTRAINT `FK_jc_vote_subtopic_vote` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`);

ALTER TABLE `jc_vote_topic`
ADD CONSTRAINT `fk_jc_votetopic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`);

