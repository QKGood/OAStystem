/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : ht_oa

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-01-17 20:36:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_authority
-- ----------------------------
DROP TABLE IF EXISTS `t_authority`;
CREATE TABLE `t_authority` (
  `autid` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(500) NOT NULL,
  `des` varchar(500) NOT NULL,
  PRIMARY KEY (`autid`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_authority
-- ----------------------------
INSERT INTO `t_authority` VALUES ('1', 'com.oa.action.CourseAction.courseByPage   ', '分页查询全部课程');
INSERT INTO `t_authority` VALUES ('2', 'com.oa.action.CourseAction.courseDisable   ', '禁用某个课程');
INSERT INTO `t_authority` VALUES ('3', 'com.oa.action.CourseAction.courseEnabled  ', '启用某个课程');
INSERT INTO `t_authority` VALUES ('4', 'com.oa.action.CourseAction.courseUpdate', '更新课程     ');
INSERT INTO `t_authority` VALUES ('5', 'com.oa.action.StudentAction.stuReserveSave', '添加预定学生');
INSERT INTO `t_authority` VALUES ('6', 'com.oa.action.StudentAction.stuReserveUpdate', '修改预定学生');
INSERT INTO `t_authority` VALUES ('7', 'com.oa.action.StudentAction.showOfficial', '转发到正式学生页面');
INSERT INTO `t_authority` VALUES ('8', 'com.oa.action.StudentAction.stuOfficialPager', '分页显示所有正式学生');
INSERT INTO `t_authority` VALUES ('9', 'com.oa.action.StudentAction.stuOfficialSave', '添加正式学生');
INSERT INTO `t_authority` VALUES ('10', 'com.oa.action.StudentAction.stuOfficialUpdate', '更新正式学生');
INSERT INTO `t_authority` VALUES ('11', 'com.oa.action.StudentAction.stuByIdPager', '学生详情');
INSERT INTO `t_authority` VALUES ('12', 'com.oa.action.StudentAction.stuGradeById', '分页显示在那个班的学生');
INSERT INTO `t_authority` VALUES ('13', 'com.oa.action.StudentAction.stuRoomNullById', '分页显示没有宿舍的学生');
INSERT INTO `t_authority` VALUES ('14', 'com.oa.action.StudentAction.stuRoomById', '分页显示在那个宿舍的学生');
INSERT INTO `t_authority` VALUES ('15', 'com.oa.action.StudentAction.stuGradeNullById', '分页显示没有班级的学生');
INSERT INTO `t_authority` VALUES ('16', 'com.oa.action.StudentAction.addStuOnGrade', '批量添加学生到班级');
INSERT INTO `t_authority` VALUES ('17', 'com.oa.action.StudentAction.addStuOnRoom', '批量添加学生到宿舍');
INSERT INTO `t_authority` VALUES ('18', 'com.oa.action.StudentAction.comitUpdatePay', '转为预定学生');
INSERT INTO `t_authority` VALUES ('19', 'com.oa.action.StudentAction.comitOfficialPay', '转为正式学生');
INSERT INTO `t_authority` VALUES ('20', 'com.oa.action.StudentAction.stuPurposeDisable', '禁用学生');
INSERT INTO `t_authority` VALUES ('21', 'com.oa.action.StudentAction.stuPurposeActivate', '启用学生');
INSERT INTO `t_authority` VALUES ('22', 'com.oa.action.StudentAction.pagerByStuName', '根据学生姓名模糊查询');
INSERT INTO `t_authority` VALUES ('23', 'com.oa.action.GradeAction.showGrade', '转发到班级页面');
INSERT INTO `t_authority` VALUES ('24', 'com.oa.action.GradeAction.gradePager', '分页显示所有班级');
INSERT INTO `t_authority` VALUES ('25', 'com.oa.action.GradeAction.pagerByName', '根据班级名称模糊查询');
INSERT INTO `t_authority` VALUES ('26', 'com.oa.action.GradeAction.gradeSave', '添加班级');
INSERT INTO `t_authority` VALUES ('27', 'com.oa.action.GradeAction.gradeUpdate', '更新班级');
INSERT INTO `t_authority` VALUES ('28', 'com.oa.action.RoomAction.showRoom', '转发到宿舍页面');
INSERT INTO `t_authority` VALUES ('29', 'com.oa.action.RoomAction.roomSave', '添加宿舍');
INSERT INTO `t_authority` VALUES ('30', 'com.oa.action.RoomAction.roomDisable', '禁用宿舍');
INSERT INTO `t_authority` VALUES ('31', 'com.oa.action.RoomAction.roomActivate', '启用宿舍');
INSERT INTO `t_authority` VALUES ('32', 'com.oa.action.RoomAction.roomUpdate', '更新宿舍');
INSERT INTO `t_authority` VALUES ('33', 'com.oa.action.RoomAction.roomPager', '分页显示所有宿舍');
INSERT INTO `t_authority` VALUES ('34', 'com.oa.action.RoomAction.pagerByName', '根据宿舍名称模糊查询');
INSERT INTO `t_authority` VALUES ('35', 'com.oa.action.ScoreAction.showScore', '转发到成绩页面');
INSERT INTO `t_authority` VALUES ('36', 'com.oa.action.ScoreAction.gradeByPager', '根据班级ID查询该班下的考试');
INSERT INTO `t_authority` VALUES ('37', 'com.oa.action.ScoreAction.pagerByCourse', '根据课程名称模糊查询');
INSERT INTO `t_authority` VALUES ('38', 'com.oa.action.StudentLeaveAction.showStuLeave', '转发到学生请假页面');
INSERT INTO `t_authority` VALUES ('39', 'com.oa.action.StudentLeaveAction.gradeByPager', '根据班级ID查询该班下的请假');
INSERT INTO `t_authority` VALUES ('40', 'com.oa.action.JobAction.showJob', '转发到学生就业页面');
INSERT INTO `t_authority` VALUES ('41', 'com.oa.action.JobAction.gradeByPager', '根据班级ID查询该班下的就业');
INSERT INTO `t_authority` VALUES ('42', 'com.oa.action.JobAction.jobDisable', '禁用就业');
INSERT INTO `t_authority` VALUES ('43', 'com.oa.action.JobAction.jobActivate', '启用就业');
INSERT INTO `t_authority` VALUES ('44', 'com.oa.action.StudentCheckingAction.showStuChecking', '转发到学生考勤页面');
INSERT INTO `t_authority` VALUES ('45', 'com.oa.action.StudentCheckingAction.gradeByPager', '根据班级id查询该班下的考勤');
INSERT INTO `t_authority` VALUES ('49', 'com.oa.action.DepartmentAction.delete', '删除部门');
INSERT INTO `t_authority` VALUES ('50', 'com.oa.action.DepartmentAction.update', '更新部门');
INSERT INTO `t_authority` VALUES ('51', 'com.oa.action.DepartmentAction.save', '新增部门');
INSERT INTO `t_authority` VALUES ('52', 'com.oa.action.DepartmentAction.updStatus', '更新状态');
INSERT INTO `t_authority` VALUES ('53', 'com.oa.action.DepartmentAction.pager', '分页显示部门');
INSERT INTO `t_authority` VALUES ('54', 'com.oa.action.DepartmentAction.showDepartment', '显示部门页面');
INSERT INTO `t_authority` VALUES ('55', 'com.oa.action.DutyAction.showDuty', '显示值班页面');
INSERT INTO `t_authority` VALUES ('56', 'com.oa.action.DutyAction.update', '更新值班');
INSERT INTO `t_authority` VALUES ('57', 'com.oa.action.DutyAction.allDuty', '所有值班分页');
INSERT INTO `t_authority` VALUES ('58', 'com.oa.action.DutyAction.saveAdd', '添加值班地址');
INSERT INTO `t_authority` VALUES ('59', 'com.oa.action.DutyAction.updAdd', '修改值班地址');
INSERT INTO `t_authority` VALUES ('60', 'com.oa.action.EmpAppealAction.doAppeal', '显示处理申诉页面');
INSERT INTO `t_authority` VALUES ('61', 'com.oa.action.EmpAppealAction.seeAppeal', '显示用户本身的申诉');
INSERT INTO `t_authority` VALUES ('62', 'com.oa.action.EmpAppealAction.pager', '查申诉');
INSERT INTO `t_authority` VALUES ('63', 'com.oa.action.EmpAppealAction.save', '提交申诉');
INSERT INTO `t_authority` VALUES ('64', 'com.oa.action.EmpAppealAction.update', '更新申诉状态');
INSERT INTO `t_authority` VALUES ('65', 'com.oa.action.EmpCheckAction.showCheck', '显示上司界面巡查');
INSERT INTO `t_authority` VALUES ('66', 'com.oa.action.EmpCheckAction.seeCheck', '显示自己界面巡查');
INSERT INTO `t_authority` VALUES ('67', 'com.oa.action.EmpCheckAction.pager', '分页查询巡查记录');
INSERT INTO `t_authority` VALUES ('68', 'com.oa.action.EmpCheckAction.save', '添加巡查记录');
INSERT INTO `t_authority` VALUES ('69', 'com.oa.action.EmpCheckAction.update', '修改巡查记录');
INSERT INTO `t_authority` VALUES ('70', 'com.oa.action.EmpCheckAction.delete', '冻结巡查记录');
INSERT INTO `t_authority` VALUES ('71', 'com.oa.action.ExcelPOIAction.showEmpCheckingInfo', '显示考勤详情页面');
INSERT INTO `t_authority` VALUES ('72', 'com.oa.action.EmpCheckingAction.showEmpChecking', '显示考勤总结页面');
INSERT INTO `t_authority` VALUES ('73', 'com.oa.actionEmpCheckingAction.seeEmpCheckingInfo', '显示自己考勤详情页面');
INSERT INTO `t_authority` VALUES ('74', 'com.oa.action.EmpCheckingAction.seeEmpChecking', '显示自己考勤总结页面');
INSERT INTO `t_authority` VALUES ('75', 'com.oa.action.EmpCheckingAction.pager', '分页查考勤总结');
INSERT INTO `t_authority` VALUES ('76', 'com.oa.action.EmpCheckingAction.showEmpCheckingInfo', '分页考勤详情页面');
INSERT INTO `t_authority` VALUES ('77', 'com.oa.action.ExcelPOIAction.excelIn', '导入excel,保存考勤记录');
INSERT INTO `t_authority` VALUES ('78', 'com.oa.action.ExcelPOIAction.excelOut', '导出excel');
INSERT INTO `t_authority` VALUES ('79', 'com.oa.action.EmpleaveAction.doEmpleave', '显示审核请假页面');
INSERT INTO `t_authority` VALUES ('80', 'com.oa.action.EmpleaveAction.seeEmpleave', '显示自己请假页面');
INSERT INTO `t_authority` VALUES ('81', 'com.oa.action.EmpleaveAction.save', '添加请假单');
INSERT INTO `t_authority` VALUES ('82', 'com.oa.action.EmpleaveAction.update', '审核请假单');
INSERT INTO `t_authority` VALUES ('83', 'com.oa.action.EmpleaveAction.pager', '请假单分页');
INSERT INTO `t_authority` VALUES ('84', 'com.oa.action.EmployeeAction.save', '添加员工');
INSERT INTO `t_authority` VALUES ('85', 'com.oa.action.EmployeeAction.delete', '冻结员工');
INSERT INTO `t_authority` VALUES ('86', 'com.oa.action.EmployeeAction.update', '更新员工信息');
INSERT INTO `t_authority` VALUES ('87', 'com.oa.action.EmployeeAction.pager', '分页员工');
INSERT INTO `t_authority` VALUES ('88', 'com.oa.action.EmployeeAction.updStatus', '更新员工状态');
INSERT INTO `t_authority` VALUES ('89', 'com.oa.action.EmployeeAction.showEmployee', '显示所有员工页面');
INSERT INTO `t_authority` VALUES ('90', 'com.oa.action.EmployeeAction.seeEmployee', '显示员工自身信息页面');
INSERT INTO `t_authority` VALUES ('91', 'com.oa.action.EmployeeAction.seeUpdPwd', '显示员工自身修改密码页面');
INSERT INTO `t_authority` VALUES ('92', 'com.oa.action.EmployeeAction.seeUpdInfo', '显示员工自身修改信息页面');
INSERT INTO `t_authority` VALUES ('93', 'com.oa.action.GoodsUseAction.seeGoodsUse', '显示用户本身的物品领用');
INSERT INTO `t_authority` VALUES ('94', 'com.oa.action.GoodsUseAction.showGoodsUse', '显示领用');
INSERT INTO `t_authority` VALUES ('95', 'com.oa.action.GoodsUseAction.save', '添加物品领用');
INSERT INTO `t_authority` VALUES ('96', 'com.oa.action.GoodsUseAction.update', '归还物品');
INSERT INTO `t_authority` VALUES ('97', 'com.oa.action.GoodsUseAction.pager', '分页物品领用记录');
INSERT INTO `t_authority` VALUES ('98', 'com.oa.action.GoodsUseAction.pagerById', '分页用户自身领用记录');
INSERT INTO `t_authority` VALUES ('116', 'com.oa.action.SalaryAction.salaryPager', '工资管理分页');
INSERT INTO `t_authority` VALUES ('117', 'com.oa.action.SalaryAction.addSalary', '添加工资');
INSERT INTO `t_authority` VALUES ('118', 'com.oa.action.SalaryAction.updataSalary', '更新工资');
INSERT INTO `t_authority` VALUES ('119', 'com.oa.action.IncomeTypeAction.incomeTypePager', '收入类型分页');
INSERT INTO `t_authority` VALUES ('120', 'com.oa.action.IncomeTypeAction.addIncomeType', '添加收入类型');
INSERT INTO `t_authority` VALUES ('121', 'com.oa.action.IncomeTypeAction.updataIncomeType', '更新收入类型');
INSERT INTO `t_authority` VALUES ('122', 'com.oa.action.IncomeAction.incomePager', '收入管理分页');
INSERT INTO `t_authority` VALUES ('124', 'com.oa.action.SystemAction.noticeTypePager', '公告类型分页');
INSERT INTO `t_authority` VALUES ('125', 'com.oa.action.SystemAction.addNoticeType', '公告类型添加');
INSERT INTO `t_authority` VALUES ('126', 'com.oa.action.SystemAction.updateNoticeType', '公告类型更新');
INSERT INTO `t_authority` VALUES ('127', 'com.oa.action.SystemAction.noticeTypeActivate', '公告类型状态激活');
INSERT INTO `t_authority` VALUES ('128', 'com.oa.action.SystemAction.noticeTypeDisable', '公告类型状态禁用');
INSERT INTO `t_authority` VALUES ('129', 'com.oa.action.SystemAction.type', '公告类型返回到公告表');
INSERT INTO `t_authority` VALUES ('130', 'com.oa.action.SystemAction.showNoticeType', '显示公告类型');
INSERT INTO `t_authority` VALUES ('131', 'com.oa.action.NoticeAction.noticePager', '公告分页');
INSERT INTO `t_authority` VALUES ('132', 'com.oa.action.NoticeAction.addNotice', '公告添加');
INSERT INTO `t_authority` VALUES ('133', 'com.oa.action.NoticeAction.updateNotice', '公告更新');
INSERT INTO `t_authority` VALUES ('134', 'com.oa.action.NoticeAction.noticeActivate', '公告状态激活');
INSERT INTO `t_authority` VALUES ('135', 'com.oa.action.NoticeAction.noticeDisable', '公告状态禁用');
INSERT INTO `t_authority` VALUES ('136', 'com.oa.action.NoticeAction.pagerByName', '模糊分页查询');
INSERT INTO `t_authority` VALUES ('137', 'com.oa.action.NoticeAction.showNotice', '显示公告表页面');
INSERT INTO `t_authority` VALUES ('138', 'com.oa.action.RoleAction.rolePager', '分页显示角色');
INSERT INTO `t_authority` VALUES ('139', 'com.oa.action.RoleAction.addRole', '角色添加');
INSERT INTO `t_authority` VALUES ('140', 'com.oa.action.RoleAction.updateRole', '角色更新');
INSERT INTO `t_authority` VALUES ('141', 'com.oa.action.RoleAction.roleActivate', '角色状态激活');
INSERT INTO `t_authority` VALUES ('142', 'com.oa.action.RoleAction.roleDisable', '角色禁用');
INSERT INTO `t_authority` VALUES ('143', 'com.oa.action.RoleAction.showRole', '显示角色页面');
INSERT INTO `t_authority` VALUES ('144', 'com.oa.action.CheckingAction.checkingPager', '打卡时间分页查询');
INSERT INTO `t_authority` VALUES ('145', 'com.oa.action.CheckingAction.addChecking', '打卡添加');
INSERT INTO `t_authority` VALUES ('146', 'com.oa.action.CheckingAction.updateChecking', '打卡时间更新');
INSERT INTO `t_authority` VALUES ('147', 'com.oa.action.TalkAction.showTalk', '显示打卡时间页面');
INSERT INTO `t_authority` VALUES ('148', 'com.oa.action.PayAction.query_page', '支出管理分页');
INSERT INTO `t_authority` VALUES ('149', 'com.oa.action.PayAction.save', '支出管理添加');
INSERT INTO `t_authority` VALUES ('150', 'com.oa.action.PayAction.update', '支出管理更新');
INSERT INTO `t_authority` VALUES ('151', 'com.oa.action.info.PayInfoAction.showPayInfo', '显示支出管理页面');
INSERT INTO `t_authority` VALUES ('152', 'com.oa.action.PayTypeAction.pager', '支出类型分页');
INSERT INTO `t_authority` VALUES ('153', 'com.oa.action.PayTypeAction.type', '支出类新下拉框提示');
INSERT INTO `t_authority` VALUES ('154', 'com.oa.action.PayTypeAction.addPayType', '支出类型添加');
INSERT INTO `t_authority` VALUES ('155', 'com.oa.action.PayTypeAction.updatePayType', '支出类型更新');
INSERT INTO `t_authority` VALUES ('156', 'com.oa.action.PayTypeAction.payTypeDisable', '支出类型禁用');
INSERT INTO `t_authority` VALUES ('157', 'com.oa.action.PayTypeAction.payTypeActivate', '支出类型启用');
INSERT INTO `t_authority` VALUES ('158', 'com.oa.action.PayTypeAction.showPayType', '显示支出类型页面');
INSERT INTO `t_authority` VALUES ('159', 'com.oa.action.TalkAction.pager', '谈心分页');
INSERT INTO `t_authority` VALUES ('160', 'com.oa.action.TalkAction.addTalk', '谈心添加');
INSERT INTO `t_authority` VALUES ('161', 'com.oa.action.TalkAction.updateTalk', '谈心更新');
INSERT INTO `t_authority` VALUES ('162', 'com.oa.action.TalkAction.talkDisable', '谈心禁用');
INSERT INTO `t_authority` VALUES ('163', 'com.oa.action.TalkAction.talkActivate', '谈心启用');
INSERT INTO `t_authority` VALUES ('164', 'com.oa.action.TalkAction.showTalk', '显示谈心页面');
INSERT INTO `t_authority` VALUES ('165', 'com.oa.action.CourseAction.pagerByName', '模糊查询');
INSERT INTO `t_authority` VALUES ('166', 'com.oa.action.EmpfeedbackAction.showEmpfeedbackPager', '转发页面');
INSERT INTO `t_authority` VALUES ('167', 'com.oa.action.EmpfeedbackAction.empfeedbackByPage', '分页查询反馈');
INSERT INTO `t_authority` VALUES ('168', 'com.oa.action.EmpfeedbackAction.empfeedbackSave', '添加反馈');
INSERT INTO `t_authority` VALUES ('169', 'com.oa.action.EmpfeedbackAction.empfeedbackUpdate', '更新反馈');
INSERT INTO `t_authority` VALUES ('170', 'com.oa.action.EmpfeedbackAction.empfeedbackDisable', '禁用反馈');
INSERT INTO `t_authority` VALUES ('171', 'com.oa.action.EmpfeedbackAction.empfeedbackEnabled', '启用反馈');
INSERT INTO `t_authority` VALUES ('172', 'com.oa.action.EmpfeedbackInfoAction.queryPager', '分页查询全部反馈');
INSERT INTO `t_authority` VALUES ('173', 'com.oa.action.EmpfeedbackInfoAction.pagerByName', '模糊查询');
INSERT INTO `t_authority` VALUES ('174', 'com.oa.actiom.MeettingAction.meettingByPage', '分页查询全部研讨会');
INSERT INTO `t_authority` VALUES ('175', 'com.oa.actiom.MeettingAction.meettingSave', '添加会议');
INSERT INTO `t_authority` VALUES ('176', 'com.oa.actiom.MeettingAction.meettingUpdate', '修改会议');
INSERT INTO `t_authority` VALUES ('177', 'com.oa.actiom.MeettingAction.meettingDisable', '禁用会议');
INSERT INTO `t_authority` VALUES ('178', 'com.oa.actiom.MeettingAction.meettingEnabled', '启用会议');
INSERT INTO `t_authority` VALUES ('179', 'com.oa.actiom.MeettingAction.showMeetting', '转发页面');
INSERT INTO `t_authority` VALUES ('180', 'com.oa.action.info.MeettingInfoAction.meettingPager', '分页查询全部研讨');
INSERT INTO `t_authority` VALUES ('181', 'com.oa.action.info.MeettingInfoAction.showMeettingInfo', '转发页面');
INSERT INTO `t_authority` VALUES ('182', 'com.oa.action.info.MeettingInfoAction.pagerByName', '模糊查询');
INSERT INTO `t_authority` VALUES ('183', 'com.oa.actiom.ProgressAction.showProgressPager', '转发页面');
INSERT INTO `t_authority` VALUES ('184', 'com.oa.actiom.ProgressAction.progressByPage', '分页查询全部课程进度');
INSERT INTO `t_authority` VALUES ('185', 'com.oa.actiom.ProgressAction.progressSave', '添加进度');
INSERT INTO `t_authority` VALUES ('186', 'com.oa.actiom.ProgressAction.progressUpdate', '修改进度');
INSERT INTO `t_authority` VALUES ('187', 'com.oa.actiom.ProgressAction.progressDisable', '禁用课程');
INSERT INTO `t_authority` VALUES ('188', 'com.oa.actiom.ProgressAction.progressEnabled', '启用课程');
INSERT INTO `t_authority` VALUES ('189', 'com.oa.actiom.ProgressAction.pagerByName', '模糊查询');
INSERT INTO `t_authority` VALUES ('190', 'com.oa.action.StudentFeedbackAction.stuSave', '添加学生反馈');
INSERT INTO `t_authority` VALUES ('191', 'com.oa.action.StudentFeedbackAction.feedbackDisable', '禁用学生反馈');
INSERT INTO `t_authority` VALUES ('192', 'com.oa.action.StudentFeedbackAction.feedbackActivate', '启用学生反馈');
INSERT INTO `t_authority` VALUES ('193', 'com.oa.action.StudentFeedbackAction.stuFeedbackPager', '分页显示学生反馈信息');
INSERT INTO `t_authority` VALUES ('194', 'com.oa.action.StudentFeedbackAction.showStuFeedback', '转发到显示学生反馈信息页面');
INSERT INTO `t_authority` VALUES ('195', 'com.oa.action.CourseAction.courseSave', '添加课程');
INSERT INTO `t_authority` VALUES ('196', 'com.oa.action.EmpCheckingAction.pagerById', '分页查自己考勤总结');
INSERT INTO `t_authority` VALUES ('197', 'com.oa.action.info.EmpCheckingInfoAction.pagerInfoById', '分页自己考勤详情页面');
INSERT INTO `t_authority` VALUES ('198', 'com.oa.action.EmpAppealAction.pagerById', '查自己申诉');
INSERT INTO `t_authority` VALUES ('199', 'com.oa.action.EmpCheckAction.pagerById', '分页查自己值班记录');
INSERT INTO `t_authority` VALUES ('200', 'com.oa.action.EmpleaveAction.pagerById', '自己请假单分页');
INSERT INTO `t_authority` VALUES ('201', 'com.oa.action.Employee.pagerById', '自己详细信息');
INSERT INTO `t_authority` VALUES ('202', 'com.oa.action.GoodsTypeAction.save', '添加用品类型');
INSERT INTO `t_authority` VALUES ('203', 'com.oa.action.GoodsTypeAction.update', '更新用品类型');
INSERT INTO `t_authority` VALUES ('204', 'com.oa.action.GoodsTypeAction.pager', '分页显示用品类型');
INSERT INTO `t_authority` VALUES ('205', 'com.oa.action.GoodsTypeAction.gtDisable', '禁用用品类型');
INSERT INTO `t_authority` VALUES ('206', 'com.oa.action.GoodsTypeAction.gtActivate', '启用用品类型');
INSERT INTO `t_authority` VALUES ('207', 'com.oa.action.GoodsTypeAction.comboBox', '用品页面添加用品下拉列表显示用品类型\r\n');
INSERT INTO `t_authority` VALUES ('208', 'com.oa.action.GoodsTypeAction.gtype', '跳转到用品类型页面\r\n');
INSERT INTO `t_authority` VALUES ('209', 'com.oa.action.GoodsAction.update', '更新用品');
INSERT INTO `t_authority` VALUES ('210', 'com.oa.action.GoodsAction.queryAll', '分页显示用品');
INSERT INTO `t_authority` VALUES ('211', 'com.oa.action.GoodsAction.queryNameByAll', '用品页面根据name模糊查询');
INSERT INTO `t_authority` VALUES ('212', 'com.oa.action.GoodsAction.gtDisable', '禁用用品');
INSERT INTO `t_authority` VALUES ('213', 'com.oa.action.GoodsAction.gtActivate', '启用用品');
INSERT INTO `t_authority` VALUES ('214', 'com.oa.action.GoodsAction.goodsPager', '跳转用品页面');
INSERT INTO `t_authority` VALUES ('215', 'com.oa.action.GoodsAppAction.saveGoodsApp', '添加用品申购');
INSERT INTO `t_authority` VALUES ('216', 'com.oa.action.GoodsAppAction.updateGoodsApp', '更新用品申购');
INSERT INTO `t_authority` VALUES ('217', 'com.oa.action.GoodsAppAction.queryAll', '分页显示用品申购');
INSERT INTO `t_authority` VALUES ('218', 'com.oa.action.GoodsAppAction.gtDisable', '禁用用品申购');
INSERT INTO `t_authority` VALUES ('219', 'com.oa.action.GoodsAppAction.gtActivate', '启用用品申购');
INSERT INTO `t_authority` VALUES ('220', 'com.oa.action.GoodsAppAction.goodsAppPager', '跳转用品申购页面');
INSERT INTO `t_authority` VALUES ('221', 'com.oa.action.GoodsAction.save', '添加用品');
INSERT INTO `t_authority` VALUES ('222', 'com.oa.action.StudentAction.showPurpose', '转发到意向学生页面');
INSERT INTO `t_authority` VALUES ('223', 'com.oa.action.StudentAction.stuPurposePager', '分页查询所有意向学生');
INSERT INTO `t_authority` VALUES ('224', 'com.oa.action.StudentAction.stuPurposeSave', '添加意向学生');
INSERT INTO `t_authority` VALUES ('225', 'com.oa.action.StudentAction.stuPurposeUpdate', '更新意向学生');
INSERT INTO `t_authority` VALUES ('228', 'com.oa.action.SalaryInfoAction.showSalaryInfoHome', '显示基本工资页面');
INSERT INTO `t_authority` VALUES ('229', 'com.oa.action.EmpfeedbackAction.showMyEmpfeedbackPager', '教务反馈，转发显示我的反馈页面');
INSERT INTO `t_authority` VALUES ('230', 'com.oa.action.StudentAction.showReserve', '转发到预定学生页面');
INSERT INTO `t_authority` VALUES ('231', 'com.oa.action.PayTypeAction.showPayType', '显示支出类别页面');
INSERT INTO `t_authority` VALUES ('232', 'com.oa.action.PayTypeAction.pager', '分页显示支出类别页面');
INSERT INTO `t_authority` VALUES ('233', 'com.oa.action.MeettingAction.meettingSave', '添加研讨会');
INSERT INTO `t_authority` VALUES ('234', 'com.oa.action.info.PayInfoAction.showPayInfo', '显示支出管理页面');
INSERT INTO `t_authority` VALUES ('235', 'com.oa.action.SalaryInfoAction.addSalary', '添加基本工资');
INSERT INTO `t_authority` VALUES ('236', 'com.oa.action.SalaryInfoAction.updataSalary', '更新基本工资');
INSERT INTO `t_authority` VALUES ('237', 'com.oa.action.SalaryInfoAction.doSearch()', '搜索基本工资');
INSERT INTO `t_authority` VALUES ('238', 'com.oa.action.ProgressAction.progressDisable', '禁用课程进度');
INSERT INTO `t_authority` VALUES ('239', 'com.oa.action.ProgressAction.progressEnabled', '启用课程进度');
INSERT INTO `t_authority` VALUES ('240', 'com.oa.action.ProgressAction.progressSave', '添加课程进度');
INSERT INTO `t_authority` VALUES ('241', 'com.oa.action.ProgressAction.progressUpdate', '修改课程进度');
INSERT INTO `t_authority` VALUES ('242', 'com.oa.action.MeettingAction.meettingUpdate', '修改研讨会');
INSERT INTO `t_authority` VALUES ('243', 'com.oa.action.MeettingAction.meettingDisable', '禁用研讨会');
INSERT INTO `t_authority` VALUES ('244', 'com.oa.action.MeettingAction.meettingEnabled', '启用研讨会');
INSERT INTO `t_authority` VALUES ('245', 'com.oa.action.CheckingAction.showChecking', '转发显示到打卡时间管理页面');
INSERT INTO `t_authority` VALUES ('246', 'com.oa.action.JobAction.addJob', '添加就业');
INSERT INTO `t_authority` VALUES ('247', 'com.oa.action.JobAction.updateJob', '更新就业');
INSERT INTO `t_authority` VALUES ('248', 'com.oa.action.ScoreAction.scoreInto', '学生成绩导入');
INSERT INTO `t_authority` VALUES ('249', 'com.oa.action.ScoreAction.scoreOutto', '学生成绩导出');
INSERT INTO `t_authority` VALUES ('250', 'com.oa.action.StudentCheckingAction.addChecking', '添加学生考勤');
INSERT INTO `t_authority` VALUES ('251', 'com.oa.action.StudentCheckingAction.updateChecking', '更新学生考勤');
INSERT INTO `t_authority` VALUES ('252', 'com.oa.action.StudentAction.stuReservePager', '查询预定学生');
INSERT INTO `t_authority` VALUES ('500', 'com.oa.action.EmpAppealAction.showEmpAppeal', '申诉页面');
INSERT INTO `t_authority` VALUES ('501', 'com.oa.action.info.EmpCheckingInfoAction.pagerInfo', '查看所有人的考勤详情');
INSERT INTO `t_authority` VALUES ('502', 'com.oa.action.ReportAction.showReport', '显示日志页面');
INSERT INTO `t_authority` VALUES ('503', 'com.oa.action.ReportAction.save', '添加日志');
INSERT INTO `t_authority` VALUES ('504', 'com.oa.action.ReportAction.update', '更新日志');
INSERT INTO `t_authority` VALUES ('505', 'com.oa.action.ReportAction.pager', '上司查日志');
INSERT INTO `t_authority` VALUES ('506', 'com.oa.action.ReportAction.pagerById', '自己查日志');
INSERT INTO `t_authority` VALUES ('507', 'com.oa.action.EmpleaveAction.showEmpleave', '请假记录页面');
INSERT INTO `t_authority` VALUES ('508', 'com.oa.action.GoodsAppAction.gaDisable', '申购审核拒绝');
INSERT INTO `t_authority` VALUES ('509', 'com.oa.action.GoodsAppAction.gaActivate', '申购审核同意');
INSERT INTO `t_authority` VALUES ('510', 'com.oa.action.IncomeTypeAction.disable', '禁用收入类别');
INSERT INTO `t_authority` VALUES ('511', 'com.oa.action.IncomeTypeAction.enable', '启用收入类别');

-- ----------------------------
-- Table structure for t_check
-- ----------------------------
DROP TABLE IF EXISTS `t_check`;
CREATE TABLE `t_check` (
  `checkid` varchar(32) NOT NULL COMMENT '巡查编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `checktime` datetime DEFAULT NULL COMMENT '巡查时间',
  `weekday` varchar(10) DEFAULT NULL COMMENT '周几',
  `gradeid` varchar(32) DEFAULT NULL COMMENT '班级编号',
  `roomid` varchar(32) DEFAULT NULL COMMENT '宿舍编号',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`checkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_check
-- ----------------------------
INSERT INTO `t_check` VALUES ('2028da1b592568aa015925803c1faaoi', '2028da1b592568aa015925803c1faa21', '2017-01-06 11:45:07', '周一', '4028da1b592568aa015925803c1f0002', null, '查看睡觉');
INSERT INTO `t_check` VALUES ('402880a059ab21700159ab4f8a1d0002', '402880a05997036501599706f9d00000', '2017-01-17 21:00:00', '2', null, '402880a05938a44b015938a5a3820000', '看看宿舍脏不脏，不脏最好了');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `courseid` varchar(32) NOT NULL COMMENT '课程编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `totalhour` int(11) DEFAULT NULL COMMENT '总课时数',
  `term` int(11) DEFAULT NULL COMMENT '学期',
  `courseorder` int(11) DEFAULT NULL COMMENT '课程顺序',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('402880a05943161f015943177c450000', 'HTML', 'HTML', '1', '2', '3', '1');
INSERT INTO `t_course` VALUES ('402880a05943161f0159431976190001', 'c语言', '编程', '2', '1', '1', '1');
INSERT INTO `t_course` VALUES ('402880a059ab21700159ab5bf29e0006', 'JAVA', '从入门到精通', '20', '2', '1', '1');
INSERT INTO `t_course` VALUES ('402880a059ab21700159ab5ca49d0007', 'Javascript', '强大的脚本语言', '20', '3', '2', '1');

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `depid` varchar(32) NOT NULL COMMENT '部门编号',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `empid` varchar(32) DEFAULT NULL COMMENT '负责人编号',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`depid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('402880a05971b07d015971bdb2430000', '总部', null, '管理层', '1');
INSERT INTO `t_dept` VALUES ('4028da1b592568aa015925803c1f3221', '教务部', '4028da1b592568aa015925803c1f3001', '教务', '1');
INSERT INTO `t_dept` VALUES ('4028da1b594ec23901594ec51d040000', '行政部', '4028da1b5976b929015976f78c3f000f', '不知道', '1');
INSERT INTO `t_dept` VALUES ('4028da1b5973050f0159739840250001', '后勤部', '402881e859838ae70159838c94df0000', '管理物品', '1');
INSERT INTO `t_dept` VALUES ('4028da1b5976b929015976e2c5d20000', '招生部', '402881e95992e256015992e573c40000', '招学生', '1');
INSERT INTO `t_dept` VALUES ('4028da1b5976b929015976e3ea4f0001', '财务部', '4028da1b5976b929015976f949ee0010', '管理钱', '1');

-- ----------------------------
-- Table structure for t_duty
-- ----------------------------
DROP TABLE IF EXISTS `t_duty`;
CREATE TABLE `t_duty` (
  `dutyid` varchar(32) NOT NULL COMMENT '值班编号',
  `weekday` varchar(10) DEFAULT NULL COMMENT '周几',
  `empid1` varchar(32) DEFAULT NULL COMMENT '员工1',
  `add1` varchar(20) DEFAULT NULL COMMENT '地点1',
  `empid2` varchar(32) DEFAULT NULL,
  `add2` varchar(32) DEFAULT NULL,
  `empid3` varchar(32) DEFAULT NULL,
  `add3` varchar(20) DEFAULT NULL,
  `empid4` varchar(32) DEFAULT NULL,
  `add4` varchar(20) DEFAULT NULL,
  `empid5` varchar(32) DEFAULT NULL,
  `add5` varchar(20) DEFAULT NULL,
  `empid6` varchar(32) DEFAULT NULL,
  `add6` varchar(20) DEFAULT NULL,
  `empid7` varchar(32) DEFAULT NULL,
  `add7` varchar(20) DEFAULT NULL,
  `empid8` varchar(32) DEFAULT NULL,
  `add8` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`dutyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_duty
-- ----------------------------
INSERT INTO `t_duty` VALUES ('1', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_duty` VALUES ('2', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_duty` VALUES ('3', '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_duty` VALUES ('4', '4', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_duty` VALUES ('4028da1b592568aa015925803c1fjkfj', '周一', '2028da1b592568aa015925803c1faa21', '三楼', '4028da1b592568aa015925803c1f3001', '三楼', '40246a1b592568aa0159258aaa1f3221', '四楼', '40246a1b592568aa0159258aaa1f3221', '四楼', null, null, null, null, null, null, null, null);
INSERT INTO `t_duty` VALUES ('5', '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_duty` VALUES ('6', '6', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `t_duty` VALUES ('7', '7', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_edu
-- ----------------------------
DROP TABLE IF EXISTS `t_edu`;
CREATE TABLE `t_edu` (
  `eduid` varchar(32) NOT NULL COMMENT '教育经历编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号，来源于员工表',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `startday` datetime DEFAULT NULL COMMENT '开始时间',
  `endday` datetime DEFAULT NULL COMMENT '结束时间',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`eduid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_edu
-- ----------------------------

-- ----------------------------
-- Table structure for t_emp
-- ----------------------------
DROP TABLE IF EXISTS `t_emp`;
CREATE TABLE `t_emp` (
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `depid` varchar(32) NOT NULL COMMENT '部门编号，来源于部门表',
  `roleid` varchar(32) NOT NULL COMMENT '角色编号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `idcard` varchar(18) NOT NULL COMMENT '身份证号',
  `nation` varchar(10) DEFAULT NULL COMMENT '籍贯',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `fingerno` varchar(10) NOT NULL COMMENT '指纹编号',
  `birthday` datetime NOT NULL COMMENT '出生日期',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `qq` varchar(15) DEFAULT NULL COMMENT 'qq号',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信号',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭地址',
  `married` varchar(4) DEFAULT NULL COMMENT '是否结婚',
  `contactname` varchar(20) DEFAULT NULL COMMENT '联系人姓名',
  `contactphone` varchar(11) DEFAULT NULL COMMENT '联系人手机号',
  `college` varchar(20) DEFAULT NULL COMMENT '毕业院校',
  `major` varchar(20) DEFAULT NULL COMMENT '专业',
  `eduback` varchar(5) DEFAULT NULL COMMENT '学历',
  `bankname` varchar(50) DEFAULT NULL COMMENT '开户行名称',
  `accountname` varchar(20) DEFAULT NULL COMMENT '银行卡姓名',
  `accountno` varchar(30) DEFAULT NULL COMMENT '银行账号',
  `alipay` varchar(100) DEFAULT NULL COMMENT '支付宝账号',
  `hireday` datetime NOT NULL COMMENT '入职时间',
  `resignday` datetime DEFAULT NULL COMMENT '离职时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_emp
-- ----------------------------
INSERT INTO `t_emp` VALUES ('2028da1b592568aa015925803c1faa21', '4028da1b592568aa015925803c1f3221', '4028da1b592568aa015925803c1faa21', '王根参', '4QrcOUm6Wau+VuBX8g+IPg==', '355678789856989999', '汉族', '男', '001', '2016-12-26 11:10:37', 'wang@qq.com', '12345678916', '702028359', null, '北京北京东城区', null, null, null, null, null, null, '未知', '王老师', '456566767676767676', null, '2016-12-26 11:10:50', null, '1');
INSERT INTO `t_emp` VALUES ('40246a1b592568aa0159258aaa1f3221', '4028da1b592568aa015925803c1f3221', '4028da1b592568aa015925803c1bac21', '朱吉祥', '4QrcOUm6Wau+VuBX8g+IPg==', '355678789898986999', '汉族', '男', '002', '2016-12-26 11:11:44', 'zhu@qq.com', '12345678917', '647548584', null, '北京北京东城区', null, null, null, null, null, null, '未知', '朱老师', null, null, '2016-12-26 11:12:18', null, '1');
INSERT INTO `t_emp` VALUES ('402880a05997036501599706f9d00000', '4028da1b594ec23901594ec51d040000', '4028da1b592568aa0159258aaa1f3221', '何庆', '4QrcOUm6Wau+VuBX8g+IPg==', '455678789898989999', '汉族', '男', '003', '2017-01-13 00:00:00', 'he@qq.com', '12345678915', '374364734', null, '北京北京东城区', null, null, null, null, null, null, '未知', '小何老师', '8748754857485748574', null, '2017-01-13 16:52:14', null, '1');
INSERT INTO `t_emp` VALUES ('402880a059ab21700159ab4b51ae0000', '4028da1b5976b929015976e2c5d20000', '4028da1b5976b929015976e9f58e0006', '周雨晴', '4QrcOUm6Wau+VuBX8g+IPg==', '360782347364744444', '汉族', '女', '009', '2016-08-16 00:00:00', 'zho@1.com', '12345678919', null, null, '江西南昌东湖区', null, null, null, null, null, null, '未知', '周雨晴', '2333546567676767777', null, '2017-01-17 15:19:17', null, '1');
INSERT INTO `t_emp` VALUES ('402881e859838ae70159838c94df0000', '4028da1b5973050f0159739840250001', '4028da1b5976b929015976e786590002', '肖铭丰', '4QrcOUm6Wau+VuBX8g+IPg==', '343545465656565657', '汉族', '男', '004', '2017-01-09 00:00:00', 'xiao@123.com', '12345678913', '847546574', null, '北京北京东城区', null, null, null, null, null, null, '未知', '李主任', '3454554545454545445', null, '2017-01-09 22:05:45', null, '1');
INSERT INTO `t_emp` VALUES ('402881e95992e256015992e573c40000', '4028da1b5976b929015976e2c5d20000', '4028da1b5976b929015976edf2770008', '郭玉清', '4QrcOUm6Wau+VuBX8g+IPg==', '746574564756747777', '汉族', '男', '005', '2017-01-12 00:00:00', 'guo@qq.com', '12345678914', '348376473', null, '湖北武汉黄陂区', null, null, null, null, null, null, '未知', '郭老师', '7874857454756474444', null, '2017-01-12 21:37:08', null, '1');
INSERT INTO `t_emp` VALUES ('4028da1b592568aa015925803c1f3001', '4028da1b592568aa015925803c1f3221', '4028da1b5976b929015976ea96bf0007', '赖国荣', '4QrcOUm6Wau+VuBX8g+IPg==', '360782199808127019', '汉族', '男', '005', '2016-12-26 11:09:19', 'lai@qq.com', '12345678918', '1232847762', null, '北京北京东城区', null, null, null, null, null, null, '未知', null, null, null, '2016-12-26 11:08:51', null, '1');
INSERT INTO `t_emp` VALUES ('4028da1b5976b929015976f1e4a40009', '402880a05971b07d015971bdb2430000', '4028da1b5976b929015976e992840005', '陈生武', '4QrcOUm6Wau+VuBX8g+IPg==', '455678789896755999', '汉族', '男', '007', '2001-02-06 00:00:00', 'chen@QQ.com', '12345678910', '828345454', null, '北京北京东城区', null, null, null, null, null, null, '未知', '陈老师', '3434554545454656767', null, '2017-01-07 11:21:21', null, '1');
INSERT INTO `t_emp` VALUES ('4028da1b5976b929015976f78c3f0008', '4028da1b594ec23901594ec51d040000', '4028da1b5976b929015976e8f3c70004', '廖文汉', '4QrcOUm6Wau+VuBX8g+IPg==', '237283728372837283', '汉族', '男', '008', '2017-01-07 00:00:00', 'liao@12.com', '12345678911', '823746374', null, '北京北京东城区', null, null, null, null, null, null, '未知', '廖校长', '2343432545343434343', null, '2017-01-07 11:27:32', null, '1');
INSERT INTO `t_emp` VALUES ('4028da1b5976b929015976f949ee0010', '4028da1b5976b929015976e3ea4f0001', '4028da1b5976b929015976e81bf90003', '赖太君', '4QrcOUm6Wau+VuBX8g+IPg==', '232322343432433333', '汉族', '男', '009', '2017-01-07 00:00:00', 'lai@12.com', '12345678912', '3487654757', null, '北京北京东城区', null, null, null, null, null, null, '未知', '赖老师', '1232324343434343336', null, '2017-01-07 11:29:26', null, '1');

-- ----------------------------
-- Table structure for t_empappeal
-- ----------------------------
DROP TABLE IF EXISTS `t_empappeal`;
CREATE TABLE `t_empappeal` (
  `appealid` varchar(32) NOT NULL COMMENT '请假编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `appealday` datetime DEFAULT NULL COMMENT '提交时间',
  `des` varchar(255) DEFAULT NULL COMMENT '请假描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  `firstlevel` int(11) DEFAULT '0' COMMENT '直属上司审核，默认为不通过',
  `secondlevel` int(11) DEFAULT '0' COMMENT '老板审核，默认为不通过',
  `pass` int(11) DEFAULT '0' COMMENT '通过状态，默认为不通过',
  PRIMARY KEY (`appealid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empappeal
-- ----------------------------
INSERT INTO `t_empappeal` VALUES ('402880a059a4adde0159a4ca64170006', '402880a05997036501599706f9d00000', '2017-01-16 09:00:44', '就好地方', '0', '0', '0', '0');
INSERT INTO `t_empappeal` VALUES ('402880a059aa1c0d0159aa21b8b50000', '4028da1b5976b929015976f1e4a40009', '2017-01-17 09:54:14', 'fcdsgvjb', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for t_empchecking
-- ----------------------------
DROP TABLE IF EXISTS `t_empchecking`;
CREATE TABLE `t_empchecking` (
  `checkingid` varchar(32) NOT NULL COMMENT '考勤编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `checkingday` date DEFAULT NULL COMMENT '打卡日期',
  `time1` time DEFAULT NULL COMMENT '时间点1',
  `time2` time DEFAULT NULL,
  `time3` time DEFAULT NULL,
  `time4` time DEFAULT NULL,
  `time5` time DEFAULT NULL,
  `time6` time DEFAULT NULL,
  `time7` time DEFAULT NULL,
  `time8` time DEFAULT NULL,
  PRIMARY KEY (`checkingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empchecking
-- ----------------------------
INSERT INTO `t_empchecking` VALUES ('1', '2028da1b592568aa015925803c1faa21', '2017-01-13', '20:10:57', '20:10:59', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for t_empcheckinginfo
-- ----------------------------
DROP TABLE IF EXISTS `t_empcheckinginfo`;
CREATE TABLE `t_empcheckinginfo` (
  `checkinginfoid` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `checkingtime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`checkinginfoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empcheckinginfo
-- ----------------------------
INSERT INTO `t_empcheckinginfo` VALUES ('402880a059ab21700159ab830f5b0014', '第二次打卡时间', '12:00');
INSERT INTO `t_empcheckinginfo` VALUES ('402880a059ab21700159ab834f9f0015', '第三次打卡时间', '');
INSERT INTO `t_empcheckinginfo` VALUES ('402880a3598b8e5701598c6381d80002', '第一次打卡时间', '08:00:00-10:00:00');

-- ----------------------------
-- Table structure for t_empfeedback
-- ----------------------------
DROP TABLE IF EXISTS `t_empfeedback`;
CREATE TABLE `t_empfeedback` (
  `feedbackid` varchar(32) NOT NULL COMMENT '反馈编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `feedbackday` datetime DEFAULT NULL COMMENT '反馈时间',
  `des` varchar(500) DEFAULT NULL COMMENT '反馈详情',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empfeedback
-- ----------------------------
INSERT INTO `t_empfeedback` VALUES ('402880a059ab21700159ab61f25c000b', '4028da1b5976b929015976f1e4a40009', '2017-01-17 15:43:45', '最近公司很多人迟到啊！', '1');
INSERT INTO `t_empfeedback` VALUES ('402880a059ab21700159ab6276d5000c', '4028da1b5976b929015976f1e4a40009', '2017-01-18 15:44:12', '最近公司里很多人早退啊', '1');
INSERT INTO `t_empfeedback` VALUES ('402880a059ab21700159ab62c6bb000d', '4028da1b5976b929015976f949ee0010', '2017-01-17 15:44:46', '我没有早退！', '1');
INSERT INTO `t_empfeedback` VALUES ('402880a059ab21700159ab62f91c000e', '4028da1b5976b929015976f949ee0010', '2017-01-16 15:44:57', '我也没有迟到', '1');
INSERT INTO `t_empfeedback` VALUES ('402880a059ab21700159ab63b8f8000f', '402881e859838ae70159838c94df0000', '2017-01-17 15:45:28', '有个人天天迟到', '1');
INSERT INTO `t_empfeedback` VALUES ('402880a059ab21700159ab6443140010', '402881e95992e256015992e573c40000', '2017-01-17 15:46:10', '招生部的人天天早退！', '1');
INSERT INTO `t_empfeedback` VALUES ('402880a059ab21700159ab6973a10011', '402881e95992e256015992e573c40000', '2017-01-17 15:52:01', '我才没有早退!', '1');
INSERT INTO `t_empfeedback` VALUES ('402880a059ab21700159ab71fe950012', '402880a059ab21700159ab4b51ae0000', '2017-01-17 16:01:18', '我不想我不想上班！', '1');

-- ----------------------------
-- Table structure for t_empleave
-- ----------------------------
DROP TABLE IF EXISTS `t_empleave`;
CREATE TABLE `t_empleave` (
  `leaveid` varchar(32) NOT NULL COMMENT '请假编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `leaveday` datetime DEFAULT NULL COMMENT '提交时间',
  `des` varchar(255) DEFAULT NULL COMMENT '请假描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  `firstlevel` int(11) DEFAULT '0' COMMENT '直属上司审核，默认为不通过',
  `secondlevel` int(11) DEFAULT '0' COMMENT '老板审核，默认为不通过',
  `pass` int(11) DEFAULT '0' COMMENT '通过状态，默认为不通过',
  PRIMARY KEY (`leaveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_empleave
-- ----------------------------
INSERT INTO `t_empleave` VALUES ('402880a059967cec01599680d83b0000', '4028da1b5976b929015976f949ee0010', '2017-01-13 14:25:35', '2017-01-13 14:25:39', '2017-01-13 14:25:43', '并不知道', '1', '1', '1', '2');
INSERT INTO `t_empleave` VALUES ('402880a05997110801599781a1790002', '402880a05997036501599706f9d00000', '2017-01-13 19:06:05', '2017-01-13 19:06:08', '2017-01-13 19:06:12', '不知道', '1', '1', '1', '1');
INSERT INTO `t_empleave` VALUES ('402880a059a4adde0159a4c058f30003', '402880a05997036501599706f9d00000', '2017-01-16 08:48:56', '2017-01-17 08:48:57', '2017-01-16 08:49:46', '回家做事', '0', '0', '0', '0');
INSERT INTO `t_empleave` VALUES ('402880a059a4adde0159a4c198b90004', '402880a05997036501599706f9d00000', '2017-01-16 08:50:19', '2017-01-16 08:50:24', '2017-01-16 08:51:08', '有事回家', '0', '0', '0', '0');
INSERT INTO `t_empleave` VALUES ('402880a059a4adde0159a4c387630005', '402880a05997036501599706f9d00000', '2017-01-16 08:53:03', '2017-01-31 08:53:05', '2017-01-16 08:53:15', '有事回家', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for t_exp
-- ----------------------------
DROP TABLE IF EXISTS `t_exp`;
CREATE TABLE `t_exp` (
  `expid` varchar(32) NOT NULL COMMENT '工作经历编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号，来源于员工表',
  `company` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `startday` datetime DEFAULT NULL COMMENT '入职时间',
  `endday` datetime DEFAULT NULL COMMENT '离职时间',
  `jobtitle` varchar(50) DEFAULT NULL COMMENT '职位',
  `des` varchar(500) DEFAULT NULL COMMENT '工作描述',
  PRIMARY KEY (`expid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exp
-- ----------------------------

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `goodsid` varchar(32) NOT NULL COMMENT '物品编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `quantity` int(11) NOT NULL COMMENT '总数',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `unitprice` double DEFAULT NULL COMMENT '单价',
  `buyday` datetime DEFAULT NULL COMMENT '购买时间',
  `goodstypeid` varchar(32) NOT NULL COMMENT '物品类型编号，来源于物品类型表',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('4028da1b5973050f0159739a6a590004', '篮球', '2', '没有', '199', '2017-01-13 14:06:02', '4028da1b5973050f0159739967fc0002', '1');
INSERT INTO `t_goods` VALUES ('4028da1b5973050f0159739b8f580005', '圆珠笔', '205', '写字用的', '2', '2017-01-13 14:06:00', '4028da1b5973050f01597399a9210003', '1');

-- ----------------------------
-- Table structure for t_goodsapp
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsapp`;
CREATE TABLE `t_goodsapp` (
  `goodsappid` varchar(32) NOT NULL COMMENT '物品申购编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `appday` datetime DEFAULT NULL COMMENT '申购时间',
  `goodsname` varchar(50) DEFAULT NULL COMMENT '申购的物品名称',
  `quantity` int(11) DEFAULT NULL COMMENT '申购物品的数量',
  `des` varchar(500) DEFAULT NULL COMMENT '申购原因',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认可用',
  `appstatus` int(11) DEFAULT NULL COMMENT '申购状态，成功则为1，失败则为0',
  PRIMARY KEY (`goodsappid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodsapp
-- ----------------------------
INSERT INTO `t_goodsapp` VALUES ('402880a059a4adde0159a4b75b410000', '402880a05997036501599706f9d00000', '2017-01-16 08:39:57', '羽毛球', '5', '不知道', '1', '0');
INSERT INTO `t_goodsapp` VALUES ('402880a3598849c80159884e57e30002', '2028da1b592568aa015925803c1faa21', null, '篮球', '6', '不清楚', '1', '0');
INSERT INTO `t_goodsapp` VALUES ('402881e859889dbb015988a16cc00000', '40246a1b592568aa0159258aaa1f3221', '2017-01-10 21:46:38', '圆珠笔', '4', '写字', '1', '0');

-- ----------------------------
-- Table structure for t_goodstype
-- ----------------------------
DROP TABLE IF EXISTS `t_goodstype`;
CREATE TABLE `t_goodstype` (
  `goodstypeid` varchar(32) NOT NULL COMMENT '物品类型编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`goodstypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodstype
-- ----------------------------
INSERT INTO `t_goodstype` VALUES ('402880a059ab21700159ab4cb37d0001', '其他类型', '其他', '1');
INSERT INTO `t_goodstype` VALUES ('4028da1b5973050f0159739967fc0002', '体育用品', '玩的', '1');
INSERT INTO `t_goodstype` VALUES ('4028da1b5973050f01597399a9210003', '学习用品', '学习用的', '1');

-- ----------------------------
-- Table structure for t_goodsuse
-- ----------------------------
DROP TABLE IF EXISTS `t_goodsuse`;
CREATE TABLE `t_goodsuse` (
  `useid` varchar(32) NOT NULL COMMENT '领用编号',
  `goodsid` varchar(32) NOT NULL COMMENT '物品编号，来源于物品表',
  `empid` varchar(32) NOT NULL COMMENT '员工编号，来源于员工表',
  `quantity` int(11) DEFAULT NULL COMMENT '领用的物品数量',
  `useday` datetime DEFAULT NULL COMMENT '信用时间',
  `ereturnday` datetime DEFAULT NULL COMMENT '预估归还时间',
  `returnday` datetime DEFAULT NULL COMMENT '归还时间',
  PRIMARY KEY (`useid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goodsuse
-- ----------------------------
INSERT INTO `t_goodsuse` VALUES ('402880a059a4adde0159a4b904180001', '4028da1b5973050f0159739a6a590004', '402880a05997036501599706f9d00000', '3', '2016-12-23 00:00:00', '2017-01-15 00:00:00', '2017-01-16 08:45:23');
INSERT INTO `t_goodsuse` VALUES ('402880a059a4adde0159a4bb57ea0002', '4028da1b5973050f0159739a6a590004', '402880a05997036501599706f9d00000', '2', '2017-01-16 00:00:00', '2017-01-16 00:00:00', '2017-01-16 08:45:24');
INSERT INTO `t_goodsuse` VALUES ('402880a3598b8e5701598c1fd55a0001', '4028da1b5973050f0159739b8f580005', '402881e859838ae70159838c94df0000', '5', '2017-01-11 00:00:00', '2017-01-11 00:00:00', '2017-01-16 08:38:07');

-- ----------------------------
-- Table structure for t_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `gradeid` varchar(32) NOT NULL COMMENT '班级编号',
  `name` varchar(20) DEFAULT NULL COMMENT '班级名称',
  `empid1` varchar(32) NOT NULL COMMENT '班主任',
  `empid2` varchar(32) NOT NULL COMMENT '任课老师',
  `empid3` varchar(32) NOT NULL COMMENT '辅导老师',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `quantity` int(11) NOT NULL COMMENT '班级最大人数',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES ('2028da1b592568aa015925803c1f3784', '15春2班', '2028da1b592568aa015925803c1faa21', '4028da1b592568aa015925803c1f3001', '2028da1b592568aa015925803c1faa21', '哎。。。。', '10', '1');
INSERT INTO `t_grade` VALUES ('4028da1b592568aa015925803c1f0002', '宏图15秋2班', '40246a1b592568aa0159258aaa1f3221', '4028da1b592568aa015925803c1f3001', '2028da1b592568aa015925803c1faa21', '这个班好听话', '5', '1');
INSERT INTO `t_grade` VALUES ('4028da1b594a913301594a95f8cf0001', '16秋', '4028da1b592568aa015925803c1f3001', '2028da1b592568aa015925803c1faa21', '40246a1b592568aa0159258aaa1f3221', '767', '30', '1');
INSERT INTO `t_grade` VALUES ('4028da1b59642ced0159645660880000', '17秋', '2028da1b592568aa015925803c1faa21', '4028da1b592568aa015925803c1f3001', '2028da1b592568aa015925803c1faa21', 'adf', '12', '1');

-- ----------------------------
-- Table structure for t_income
-- ----------------------------
DROP TABLE IF EXISTS `t_income`;
CREATE TABLE `t_income` (
  `incomeid` varchar(32) NOT NULL COMMENT '收入编号',
  `incometypeid` varchar(32) NOT NULL COMMENT '收入类型编号',
  `incomeday` datetime DEFAULT NULL COMMENT '收入时间',
  `des` varchar(255) DEFAULT NULL COMMENT '收入详情',
  `income` double DEFAULT NULL COMMENT '收入金额',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `stuid` varchar(32) DEFAULT NULL COMMENT '学生编号',
  PRIMARY KEY (`incomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_income
-- ----------------------------
INSERT INTO `t_income` VALUES ('402880a059ab21700159ab7e14260013', '4028da1b596c13a101596c140bd70000', '2017-01-17 16:14:44', '交了正式报名费为6000.0', '6000', '4028da1b5976b929015976f949ee0010', '402880a35986730301598674923e0001');

-- ----------------------------
-- Table structure for t_incometype
-- ----------------------------
DROP TABLE IF EXISTS `t_incometype`;
CREATE TABLE `t_incometype` (
  `incometypeid` varchar(32) NOT NULL COMMENT '收入类别编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`incometypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_incometype
-- ----------------------------
INSERT INTO `t_incometype` VALUES ('402880a059696b510159696cacc80000', '预定报名费', '9999', '1');
INSERT INTO `t_incometype` VALUES ('402880a059aa35ba0159aa3892500002', 'jhds', 'hdskhfadjfa', '0');
INSERT INTO `t_incometype` VALUES ('4028da1b596c13a101596c140bd70000', '正式报名费', '66666', '1');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `jobid` varchar(32) NOT NULL COMMENT '工作编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `company` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `jobtitle` varchar(50) DEFAULT NULL COMMENT '职位',
  `salary` double DEFAULT NULL COMMENT '月薪',
  `welfare` varchar(255) DEFAULT NULL COMMENT '福利待遇',
  `address` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `comphone` varchar(11) DEFAULT NULL COMMENT '公司联系方式',
  `hireday` datetime DEFAULT NULL COMMENT '入职时间',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用状态',
  PRIMARY KEY (`jobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES ('402880a0599263bb0159926712310001', '4028da1b592581fa015925839df90000', '2', '2', '2', '22', '2222', '2', '2017-01-12 19:19:00', '1');
INSERT INTO `t_job` VALUES ('4028da1b592568aa015925803c1f4541', '4028da1b592568aa015925803c1f0001', '华为', '程序员', '5000', '200', '深圳', '0021', '2016-12-30 00:00:00', '1');
INSERT INTO `t_job` VALUES ('4028da1b598cbba501598cbd9aff0000', '4028da1b593f73aa01593f761d600000', '1233334', '说', '3000', '1233', '贝多', '34545', '2017-01-11 00:00:00', '1');

-- ----------------------------
-- Table structure for t_meetting
-- ----------------------------
DROP TABLE IF EXISTS `t_meetting`;
CREATE TABLE `t_meetting` (
  `meettingid` varchar(32) NOT NULL COMMENT '研讨会编号',
  `empid` varchar(32) NOT NULL COMMENT '主持人编号（员工编号）',
  `meettingday` datetime DEFAULT NULL COMMENT '研讨会时间',
  `createdday` datetime DEFAULT NULL COMMENT '添加时间',
  `des` varchar(500) DEFAULT NULL COMMENT '研讨会详情',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`meettingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_meetting
-- ----------------------------
INSERT INTO `t_meetting` VALUES ('402880a05973a584015973aaa45d0000', '4028da1b592568aa015925803c1f3001', '2017-01-06 00:00:00', '2017-01-06 00:00:00', '学术研究', '1');
INSERT INTO `t_meetting` VALUES ('402880a05973a584015973ab9bb20001', '40246a1b592568aa0159258aaa1f3221', '2017-01-06 00:00:00', '2017-01-06 00:00:00', '上课自习问题', '1');
INSERT INTO `t_meetting` VALUES ('402880a05973a584015973ac9c540002', '2028da1b592568aa015925803c1faa21', '2017-01-16 00:00:00', '2017-01-11 00:00:00', '授课问题', '1');
INSERT INTO `t_meetting` VALUES ('402880a059ab21700159ab5d6c210008', '4028da1b5976b929015976f1e4a40009', '2017-01-17 15:38:27', '2017-01-18 15:38:29', '讨论关于加强上课纪律问题', '1');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeid` varchar(32) NOT NULL COMMENT '公告编号',
  `name` varchar(50) DEFAULT NULL COMMENT '公告标题',
  `des` varchar(500) DEFAULT NULL COMMENT '公告详情',
  `typeid` varchar(32) NOT NULL COMMENT '公告类型',
  `noticeday` datetime DEFAULT NULL COMMENT '发布时间',
  `empid` varchar(32) NOT NULL COMMENT '发布人',
  `status` int(11) DEFAULT NULL COMMENT '状态 默认为1',
  PRIMARY KEY (`noticeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('402880a3598849c80159884ae2200000', '寒假放假', '不知道', '4028da1b596d7e5101596d8292060000', '2017-01-10 20:12:04', '402881e859838ae70159838c94df0000', '1');
INSERT INTO `t_notice` VALUES ('402880a3598849c80159884dc7080001', '停水停电', '1月13停电', '402880a0596d585d01596d596ac30000', '2017-01-10 00:00:00', '402881e859838ae70159838c94df0000', '1');
INSERT INTO `t_notice` VALUES ('4028da1b596d7e5101596d850db90002', '元旦放假', '1号放假到3号', '4028da1b596d7e5101596d8292060000', '2017-01-05 15:24:08', '402881e859838ae70159838c94df0000', '1');

-- ----------------------------
-- Table structure for t_noticetype
-- ----------------------------
DROP TABLE IF EXISTS `t_noticetype`;
CREATE TABLE `t_noticetype` (
  `noticetypeid` varchar(32) NOT NULL COMMENT '公告类型编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`noticetypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_noticetype
-- ----------------------------
INSERT INTO `t_noticetype` VALUES ('402880a0596d585d01596d596ac30000', '停水通知', '停水停电', '1');
INSERT INTO `t_noticetype` VALUES ('4028da1b594ec23901594ed3be7a0001', '紧急通知', '各种情况', '1');
INSERT INTO `t_noticetype` VALUES ('4028da1b596d7e5101596d8292060000', '放假通知', '这是一个放假通知', '1');

-- ----------------------------
-- Table structure for t_pay
-- ----------------------------
DROP TABLE IF EXISTS `t_pay`;
CREATE TABLE `t_pay` (
  `payid` varchar(32) NOT NULL COMMENT '支出编号',
  `paytypeid` varchar(32) NOT NULL COMMENT '支出类别编号',
  `payday` datetime DEFAULT NULL COMMENT '支出时间',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `pay` double DEFAULT NULL COMMENT '支出金额',
  `empid` varchar(32) DEFAULT NULL COMMENT '员工编号',
  `toname` varchar(50) DEFAULT NULL COMMENT '收款人姓名',
  `tophone` varchar(11) DEFAULT NULL COMMENT '收款人联系方式',
  PRIMARY KEY (`payid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pay
-- ----------------------------
INSERT INTO `t_pay` VALUES ('402880a059ab21700159ab89dd140017', '402880a0595f017e01595f0ea1660002', '2017-01-17 16:26:19', '买了一个篮球', '150', '402880a05997036501599706f9d00000', '何庆', '12345678920');

-- ----------------------------
-- Table structure for t_paytype
-- ----------------------------
DROP TABLE IF EXISTS `t_paytype`;
CREATE TABLE `t_paytype` (
  `paytypeid` varchar(32) NOT NULL COMMENT '支出类别编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`paytypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_paytype
-- ----------------------------
INSERT INTO `t_paytype` VALUES ('402880a0595f017e01595f02a23d0000', '旅游支出', '去玩的费用', '1');
INSERT INTO `t_paytype` VALUES ('402880a0595f017e01595f0e7f220001', '活动支出', '买东西 ', '1');
INSERT INTO `t_paytype` VALUES ('402880a0595f017e01595f0ea1660002', '报销', '物品', '1');

-- ----------------------------
-- Table structure for t_progress
-- ----------------------------
DROP TABLE IF EXISTS `t_progress`;
CREATE TABLE `t_progress` (
  `progressid` varchar(32) NOT NULL COMMENT '课程进度编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `gradeid` varchar(32) NOT NULL COMMENT '班级编号',
  `des` varchar(500) DEFAULT NULL COMMENT '进度详情',
  `progressday` datetime DEFAULT NULL COMMENT '添加进度的时间',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`progressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_progress
-- ----------------------------
INSERT INTO `t_progress` VALUES ('402880a05967818a015967825e1a0000', '40246a1b592568aa0159258aaa1f3221', '4028da1b594a913301594a95f8cf0001', '上课进度很慢啊', '2017-01-04 00:00:00', '1');
INSERT INTO `t_progress` VALUES ('402880a059ab21700159ab6108170009', '2028da1b592568aa015925803c1faa21', '4028da1b592568aa015925803c1f0002', '进度很快，不行的', '2017-01-17 15:42:59', '1');
INSERT INTO `t_progress` VALUES ('402880a059ab21700159ab618d49000a', '4028da1b592568aa015925803c1f3001', '2028da1b592568aa015925803c1f3784', '进度稍快', '2017-01-13 15:43:32', '1');

-- ----------------------------
-- Table structure for t_report
-- ----------------------------
DROP TABLE IF EXISTS `t_report`;
CREATE TABLE `t_report` (
  `reportid` varchar(32) NOT NULL COMMENT '工作日志编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `reportday` datetime DEFAULT NULL COMMENT '日志时间',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_report
-- ----------------------------
INSERT INTO `t_report` VALUES ('402880a059ab21700159ab52656c0003', '4028da1b5976b929015976f1e4a40009', '2017-01-17 15:27:01', '今天举行了一个活动，活动。。。', '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `roleid` varchar(32) NOT NULL COMMENT '角色编号',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('402880a05980c08f015980ce4a200000', '学生', '学生描述', '1');
INSERT INTO `t_role` VALUES ('4028da1b592568aa015925803c1bac21', '辅导老师', '辅导', '1');
INSERT INTO `t_role` VALUES ('4028da1b592568aa015925803c1faa21', '任课老师', '专业', '1');
INSERT INTO `t_role` VALUES ('4028da1b592568aa0159258aaa1f3221', '班主任', '班主任', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e786590002', '后勤部主任', '管理东西', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e81bf90003', '财务部主任', '管理钱', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e8f3c70004', '行政部主任', '管理层', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e992840005', '总经理', '老大', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976e9f58e0006', '招生老师', '招生', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976ea96bf0007', '教务部主任', '教课', '1');
INSERT INTO `t_role` VALUES ('4028da1b5976b929015976edf2770008', '招生部主任', '招生', '1');

-- ----------------------------
-- Table structure for t_roleaut
-- ----------------------------
DROP TABLE IF EXISTS `t_roleaut`;
CREATE TABLE `t_roleaut` (
  `autrolid` int(11) NOT NULL AUTO_INCREMENT,
  `autid` int(11) DEFAULT NULL,
  `roleid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`autrolid`)
) ENGINE=InnoDB AUTO_INCREMENT=2205 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_roleaut
-- ----------------------------
INSERT INTO `t_roleaut` VALUES ('1', '131', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2', '132', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('3', '133', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('4', '134', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('5', '135', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('6', '136', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('7', '137', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('8', '84', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('9', '85', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('10', '86', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('11', '87', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('12', '88', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('13', '89', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('14', '202', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('15', '203', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('16', '204', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('17', '205', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('18', '206', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('19', '207', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('20', '208', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('21', '209', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('22', '210', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('23', '211', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('24', '212', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('25', '213', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('26', '214', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('27', '215', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('28', '216', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('29', '217', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('30', '218', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('31', '219', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('32', '220', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('33', '221', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('34', '93', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('35', '94', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('36', '95', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('37', '96', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('38', '97', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('39', '98', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('40', '79', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('41', '80', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('42', '81', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('43', '82', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('44', '83', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('45', '57', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('46', '66', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('47', '68', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('48', '69', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('49', '70', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('50', '74', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('51', '81', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('52', '80', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('53', '224', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('54', '33', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('55', '24', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('56', '41', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('57', '159', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('58', '7', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('59', '8', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('60', '9', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('61', '222', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('62', '35', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('63', '36', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('64', '1', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('65', '174', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('66', '181', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('67', '183', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('68', '184', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('69', '166', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('70', '167', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('71', '168', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('72', '169', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('73', '170', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('74', '171', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('75', '165', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('76', '173', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('77', '190', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('78', '191', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('79', '192', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('80', '131', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('81', '131', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('82', '93', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('83', '95', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('84', '96', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('85', '184', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('86', '189', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('87', '36', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('88', '35', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('89', '129', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('90', '130', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('91', '131', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('92', '136', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('93', '137', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('94', '215', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('95', '216', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('97', '218', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('98', '219', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('99', '220', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('100', '81', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('101', '80', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('102', '83', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('103', '57', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('104', '68', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('105', '69', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('106', '70', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('107', '66', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('108', '71', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('109', '72', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('110', '73', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('111', '74', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('112', '75', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('113', '76', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('114', '78', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('115', '63', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('117', '26', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('118', '23', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('119', '27', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('120', '32', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('121', '24', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('122', '25', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('123', '33', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('124', '30', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('125', '31', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('126', '40', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('127', '43', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('128', '9', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('129', '10', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('130', '16', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('131', '17', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('132', '11', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('133', '12', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('134', '13', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('135', '14', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('136', '15', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('137', '20', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('138', '21', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('139', '22', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('140', '38', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('141', '39', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('142', '44', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('143', '45', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('144', '168', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('145', '169', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('146', '167', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('147', '172', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('148', '173', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('149', '170', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('150', '171', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('151', '184', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('152', '183', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('153', '189', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('154', '179', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('155', '180', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('156', '181', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('157', '182', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('158', '1', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('159', '37', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('160', '45', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('161', '193', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('162', '194', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('163', '210', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('164', '211', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('165', '214', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('166', '93', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('167', '95', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('168', '96', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('169', '53', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('170', '98', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('171', '139', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('172', '145', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('173', '140', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('174', '146', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('175', '143', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('176', '141', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('177', '142', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('178', '144', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('179', '147', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('180', '132', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('181', '134', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('182', '135', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('183', '79', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('184', '65', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('185', '67', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('186', '124', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('187', '125', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('188', '126', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('189', '127', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('190', '128', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('191', '129', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('192', '130', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('193', '131', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('194', '136', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('195', '137', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('196', '84', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('197', '85', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('198', '86', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('199', '87', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('200', '88', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('201', '89', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('202', '90', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('203', '91', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('204', '92', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('205', '215', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('206', '216', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('207', '217', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('208', '220', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('209', '218', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('210', '219', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('211', '81', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('212', '80', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('213', '83', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('214', '82', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('215', '55', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('216', '68', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('217', '59', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('218', '56', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('219', '57', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('220', '58', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('221', '69', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('222', '70', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('223', '66', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('224', '71', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('225', '72', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('226', '73', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('227', '74', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('228', '75', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('229', '76', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('230', '78', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('231', '63', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('232', '62', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('233', '64', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('234', '26', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('235', '23', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('236', '29', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('237', '27', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('238', '32', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('239', '24', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('240', '25', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('241', '33', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('242', '34', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('243', '30', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('244', '31', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('245', '40', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('246', '41', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('247', '42', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('248', '43', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('249', '9', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('250', '10', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('251', '16', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('252', '17', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('253', '11', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('254', '12', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('255', '13', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('256', '14', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('257', '15', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('258', '22', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('259', '20', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('260', '21', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('261', '38', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('262', '39', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('263', '44', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('264', '45', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('265', '168', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('266', '169', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('267', '167', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('268', '172', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('269', '173', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('270', '170', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('271', '171', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('272', '184', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('273', '183', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('274', '189', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('275', '179', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('276', '180', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('277', '181', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('278', '182', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('279', '1', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('280', '37', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('281', '45', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('282', '193', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('283', '194', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('284', '210', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('285', '211', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('286', '214', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('287', '96', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('288', '98', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('289', '93', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('290', '95', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('291', '53', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('292', '54', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('293', '22', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('294', '36', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('295', '35', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('296', '1', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('297', '2', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('298', '3', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('299', '4', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('300', '5', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('301', '6', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('302', '7', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('303', '8', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('304', '9', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('305', '11', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('306', '12', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('307', '13', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('308', '14', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('309', '15', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('310', '22', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('311', '23', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('312', '24', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('313', '25', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('314', '28', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('315', '33', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('316', '34', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('317', '36', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('318', '37', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('319', '40', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('320', '41', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('321', '44', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('322', '45', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('323', '53', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('324', '54', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('325', '55', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('326', '57', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('327', '60', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('328', '61', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('329', '62', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('330', '63', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('331', '64', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('332', '65', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('333', '66', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('334', '67', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('335', '71', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('336', '72', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('337', '73', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('338', '74', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('339', '75', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('340', '76', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('341', '79', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('342', '80', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('343', '81', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('344', '82', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('345', '83', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('346', '84', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('347', '85', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('348', '86', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('349', '87', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('350', '88', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('351', '89', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('352', '90', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('353', '93', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('354', '94', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('355', '95', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('356', '97', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('357', '98', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('358', '112', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('359', '115', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('360', '116', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('361', '131', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('362', '132', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('363', '133', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('364', '134', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('365', '135', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('366', '136', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('367', '137', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('368', '159', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('369', '165', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('370', '166', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('371', '167', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('372', '168', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('373', '169', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('374', '170', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('375', '171', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('376', '172', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('377', '173', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('378', '174', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('379', '175', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('380', '176', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('381', '177', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('382', '178', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('383', '179', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('384', '180', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('385', '181', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('386', '182', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('387', '183', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('388', '184', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('389', '185', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('390', '186', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('391', '187', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('392', '188', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('393', '189', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('394', '193', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('395', '194', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('396', '196', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('397', '197', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('398', '198', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('399', '199', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('400', '200', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('401', '201', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('402', '210', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('403', '207', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('404', '211', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('405', '214', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('406', '215', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('407', '216', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('408', '217', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('409', '218', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('410', '219', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('411', '22', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('412', '224', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('413', '225', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('414', '226', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('415', '227', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('416', '1', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('420', '5', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('421', '6', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('422', '7', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('423', '8', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('424', '9', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('425', '10', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('426', '11', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('427', '12', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('428', '13', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('429', '14', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('430', '15', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('431', '22', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('432', '23', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('433', '24', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('434', '25', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('435', '28', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('436', '33', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('437', '34', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('438', '35', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('439', '36', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('440', '37', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('441', '38', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('442', '39', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('443', '40', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('444', '41', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('445', '44', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('446', '45', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('447', '53', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('448', '54', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('449', '55', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('450', '57', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('451', '61', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('453', '63', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('454', '64', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('455', '65', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('456', '66', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('457', '67', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('458', '71', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('459', '72', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('460', '73', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('461', '74', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('462', '75', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('463', '76', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('464', '80', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('465', '81', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('467', '90', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('468', '91', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('469', '92', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('470', '93', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('471', '94', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('472', '95', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('473', '96', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('474', '97', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('475', '98', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('476', '112', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('477', '116', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('478', '131', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('479', '136', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('480', '137', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('481', '164', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('482', '165', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('483', '166', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('484', '167', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('485', '168', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('486', '169', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('487', '170', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('488', '171', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('489', '172', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('490', '173', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('491', '174', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('492', '179', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('493', '180', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('494', '182', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('495', '183', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('496', '184', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('497', '185', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('498', '186', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('499', '187', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('500', '188', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('501', '189', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('502', '193', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('503', '194', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('504', '196', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('505', '197', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('506', '198', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('507', '199', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('508', '200', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('509', '201', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('510', '210', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('511', '211', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('512', '214', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('513', '215', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('514', '216', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('516', '218', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('517', '219', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('518', '220', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('519', '224', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('520', '225', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('521', '226', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('522', '227', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('523', '1', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('524', '5', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('525', '6', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('526', '8', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('527', '11', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('528', '12', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('529', '13', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('530', '14', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('531', '15', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('532', '22', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('533', '23', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('534', '24', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('535', '25', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('536', '28', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('537', '33', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('538', '34', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('539', '35', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('540', '36', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('541', '37', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('542', '38', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('543', '39', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('544', '40', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('545', '41', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('546', '44', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('547', '45', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('548', '53', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('549', '54', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('550', '55', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('551', '57', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('552', '61', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('554', '63', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('555', '64', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('556', '65', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('557', '66', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('558', '67', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('559', '71', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('560', '72', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('561', '73', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('562', '74', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('563', '75', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('564', '76', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('565', '80', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('566', '81', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('568', '90', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('569', '91', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('570', '92', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('571', '93', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('572', '94', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('573', '95', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('574', '96', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('575', '97', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('576', '98', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('577', '112', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('578', '115', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('579', '116', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('580', '131', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('581', '136', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('582', '137', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('583', '159', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('584', '164', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('585', '165', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('586', '166', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('587', '167', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('588', '168', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('589', '169', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('590', '170', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('591', '171', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('592', '172', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('593', '173', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('594', '174', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('595', '179', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('596', '180', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('597', '181', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('598', '182', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('599', '183', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('600', '184', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('601', '189', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('602', '193', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('603', '194', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('604', '196', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('605', '197', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('606', '198', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('607', '199', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('608', '200', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('609', '201', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('610', '210', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('611', '211', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('612', '214', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('613', '215', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('614', '216', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('616', '218', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('617', '219', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('618', '220', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('619', '224', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('620', '225', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('621', '226', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('622', '227', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('623', '132', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('624', '133', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('625', '131', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('626', '134', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('627', '135', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('628', '53', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('629', '84', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('630', '86', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('631', '87', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('632', '88', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('633', '210', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('634', '95', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('635', '96', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('636', '215', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('637', '216', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('639', '218', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('640', '219', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('641', '81', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('642', '86', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('643', '83', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('644', '82', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('645', '57', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('646', '76', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('647', '24', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('648', '23', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('649', '39', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('650', '159', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('651', '193', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('652', '9', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('653', '8', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('654', '36', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('655', '45', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('656', '1', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('657', '174', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('658', '184', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('659', '168', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('660', '169', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('661', '172', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('662', '170', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('663', '171', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('664', '112', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('665', '116', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('666', '224', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('667', '225', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('668', '5', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('669', '223', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('670', '18', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('671', '19', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('672', '114', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('673', '113', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('674', '117', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('675', '118', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('676', '116', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('677', '120', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('678', '121', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('679', '119', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('680', '122', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('681', '224', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('682', '115', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('683', '112', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('684', '224', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('685', '130', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('686', '131', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('687', '132', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('688', '133', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('689', '134', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('690', '135', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('691', '136', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('692', '137', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('693', '84', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('694', '85', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('695', '86', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('696', '87', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('697', '88', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('698', '89', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('699', '90', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('700', '91', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('701', '92', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('702', '210', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('703', '214', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('704', '215', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('705', '216', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('706', '217', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('707', '218', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('708', '219', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('709', '81', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('710', '83', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('711', '82', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('712', '80', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('713', '55', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('714', '57', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('715', '65', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('716', '66', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('717', '67', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('718', '55', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('719', '57', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('720', '60', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('721', '61', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('722', '62', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('723', '63', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('724', '64', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('725', '198', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('726', '159', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('727', '172', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('728', '7', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('729', '8', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('730', '44', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('731', '45', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('732', '1', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('733', '174', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('734', '184', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('735', '166', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('736', '172', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('737', '167', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('738', '148', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('739', '149', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('740', '150', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('741', '151', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('742', '152', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('743', '153', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('744', '154', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('745', '155', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('746', '156', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('747', '157', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('748', '158', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('749', '112', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('750', '113', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('751', '114', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('752', '115', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('753', '116', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('754', '117', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('755', '118', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('756', '224', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('757', '228', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('758', '228', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('759', '228', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('760', '228', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('761', '228', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('762', '228', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('763', '228', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('764', '228', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('765', '228', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('766', '230', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('767', '230', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('768', '230', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('769', '230', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('770', '230', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('771', '230', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('772', '230', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('773', '230', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('774', '230', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('775', '230', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('776', '158', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('777', '153', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('778', '154', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('779', '155', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('780', '156', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('781', '157', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('782', '230', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('783', '227', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('784', '222', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('785', '228', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('786', '181', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('787', '181', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('788', '181', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('789', '181', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('790', '234', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('791', '235', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('792', '236', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('793', '237', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('794', '235', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('795', '236', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('796', '237', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('797', '239', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('798', '240', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('799', '241', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('800', '242', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('801', '237', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('802', '239', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('803', '235', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('804', '236', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('805', '229', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('806', '229', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('807', '229', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('808', '229', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('809', '229', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('810', '229', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('811', '229', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('812', '229', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('813', '229', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('814', '240', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('815', '241', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('816', '238', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('817', '239', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('818', '133', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('819', '245', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('820', '160', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('821', '161', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('822', '162', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('823', '163', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('824', '159', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('825', '160', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('826', '161', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('827', '162', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('828', '163', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('829', '131', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('830', '53', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('831', '210', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('832', '95', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('833', '96', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('834', '215', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('836', '218', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('837', '81', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('838', '80', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('839', '200', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('840', '57', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('841', '68', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('842', '69', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('843', '66', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('844', '76', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('845', '224', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('846', '5', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('847', '6', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('848', '225', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('849', '18', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('850', '33', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('851', '159', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('852', '167', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('853', '9', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('854', '8', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('855', '184', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('856', '174', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('857', '1', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('858', '168', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('859', '167', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('860', '170', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('861', '115', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('862', '222', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('863', '232', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('864', '19', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('865', '246', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('866', '247', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('867', '246', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('868', '247', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('869', '246', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('870', '246', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('871', '246', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('872', '247', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('873', '247', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('874', '247', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('875', '1', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('876', '2', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('877', '3', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('878', '4', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('879', '5', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('880', '6', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('881', '7', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('882', '8', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('883', '9', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('884', '10', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('885', '11', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('886', '12', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('887', '13', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('888', '14', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('889', '15', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('890', '16', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('891', '17', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('892', '18', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('893', '19', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('894', '20', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('895', '21', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('896', '22', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('897', '23', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('898', '24', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('899', '25', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('900', '26', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('901', '27', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('902', '28', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('903', '29', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('904', '30', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('905', '31', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('906', '32', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('907', '33', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('908', '34', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('909', '35', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('910', '36', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('911', '37', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('912', '38', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('913', '39', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('914', '40', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('915', '41', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('916', '42', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('917', '43', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('918', '44', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('919', '45', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('920', '49', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('921', '50', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('922', '51', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('923', '52', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('924', '53', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('925', '54', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('926', '55', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('927', '56', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('928', '57', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('929', '58', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('930', '59', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('931', '60', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('932', '61', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('933', '62', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('934', '63', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('935', '64', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('936', '65', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('937', '66', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('938', '67', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('939', '68', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('940', '69', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('941', '70', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('942', '71', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('943', '72', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('944', '73', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('945', '74', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('946', '75', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('947', '76', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('948', '77', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('949', '78', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('950', '79', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('951', '80', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('952', '81', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('953', '82', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('954', '83', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('955', '84', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('956', '85', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('957', '86', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('958', '87', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('959', '88', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('960', '89', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('961', '90', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('962', '91', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('963', '92', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('964', '93', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('965', '94', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('966', '95', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('967', '96', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('968', '97', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('969', '98', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('970', '116', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('971', '117', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('972', '118', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('973', '119', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('974', '120', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('975', '121', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('976', '122', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('977', '124', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('978', '125', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('979', '126', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('980', '127', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('981', '128', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('982', '129', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('983', '130', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('984', '131', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('985', '132', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('986', '133', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('987', '134', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('988', '135', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('989', '136', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('990', '137', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('991', '138', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('992', '139', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('993', '140', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('994', '141', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('995', '142', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('996', '143', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('997', '144', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('998', '145', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('999', '146', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1000', '147', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1001', '148', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1002', '149', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1003', '150', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1004', '151', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1005', '152', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1006', '153', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1007', '154', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1008', '155', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1009', '156', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1010', '157', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1011', '158', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1012', '159', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1013', '160', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1014', '161', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1015', '162', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1016', '163', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1017', '164', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1018', '165', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1019', '166', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1020', '167', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1021', '168', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1022', '169', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1023', '170', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1024', '171', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1025', '172', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1026', '173', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1027', '174', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1028', '175', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1029', '176', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1030', '177', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1031', '178', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1032', '179', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1033', '180', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1034', '181', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1035', '182', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1036', '183', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1037', '184', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1038', '185', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1039', '186', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1040', '187', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1041', '188', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1042', '189', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1043', '190', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1044', '191', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1045', '192', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1046', '193', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1047', '194', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1048', '195', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1049', '196', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1050', '197', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1051', '198', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1052', '199', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1053', '200', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1054', '201', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1055', '202', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1056', '203', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1057', '204', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1058', '205', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1059', '206', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1060', '207', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1061', '208', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1062', '209', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1063', '210', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1064', '211', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1065', '212', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1066', '213', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1067', '214', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1068', '215', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1069', '216', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1070', '217', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1071', '218', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1072', '219', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1073', '220', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1074', '221', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1075', '222', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1076', '223', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1077', '224', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1078', '225', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1079', '228', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1080', '229', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1081', '230', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1082', '231', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1083', '232', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1084', '233', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1085', '234', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1086', '235', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1087', '236', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1088', '237', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1089', '238', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1090', '239', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1091', '240', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1092', '241', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1093', '242', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1094', '243', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1095', '244', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1096', '245', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1097', '246', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1098', '247', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1099', '248', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1100', '249', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1101', '250', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('1102', '251', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('1103', '250', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('1104', '251', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('1105', '250', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('1106', '251', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('1107', '250', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('1108', '251', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('1109', '250', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('1110', '251', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('1111', '250', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1112', '251', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1113', '250', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('1114', '251', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('1115', '250', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('1116', '251', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('1117', '252', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('1120', '252', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1121', '248', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('1122', '249', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('1123', '248', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('1124', '249', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('1125', '248', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('1126', '249', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('1127', '248', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1128', '249', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('1129', '29', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2000', '53', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2001', '53', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2002', '54', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2003', '54', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2004', '54', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2005', '54', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2006', '54', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2007', '57', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('2008', '55', '402880a05980c08f015980ce4a200000');
INSERT INTO `t_roleaut` VALUES ('2009', '55', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2010', '55', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2011', '55', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2012', '55', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2013', '198', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2014', '198', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2015', '198', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2016', '198', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2017', '198', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2018', '60', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2019', '60', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2020', '60', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2021', '61', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2022', '61', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2023', '61', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2024', '61', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2025', '61', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2026', '62', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2027', '62', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2028', '63', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2029', '63', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2030', '63', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2031', '64', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2032', '64', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2033', '500', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2034', '500', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('2035', '500', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('2036', '500', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2037', '500', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('2038', '500', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2039', '500', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2040', '500', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2041', '500', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2042', '500', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2043', '65', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2044', '65', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2045', '65', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2046', '65', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2047', '66', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2048', '67', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2049', '67', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2050', '68', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('2051', '68', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('2052', '68', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2053', '68', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2054', '68', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2056', '69', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('2057', '69', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2058', '69', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2059', '69', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2060', '69', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('2061', '70', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('2062', '70', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('2063', '70', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2064', '70', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2065', '70', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2066', '70', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2067', '72', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2068', '72', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2069', '72', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2070', '72', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2071', '73', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2072', '73', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2073', '73', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2074', '73', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2075', '74', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2076', '74', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2077', '74', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2078', '75', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2079', '75', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2080', '75', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2081', '75', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2082', '76', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2083', '76', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2084', '197', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2085', '197', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2086', '197', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2087', '197', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2088', '197', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2089', '197', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2091', '501', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2092', '501', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('2093', '501', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('2094', '501', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('2095', '501', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2096', '501', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2097', '501', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2098', '501', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2099', '501', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2100', '501', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2101', '77', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2102', '78', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('2103', '78', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('2104', '78', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2105', '78', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2106', '78', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2108', '78', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2109', '78', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2110', '79', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2111', '79', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2112', '80', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2113', '200', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2114', '200', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2115', '200', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2116', '200', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2117', '200', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2118', '85', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2119', '86', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('2120', '86', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('2121', '86', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2122', '86', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2123', '89', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2124', '90', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2125', '90', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2126', '90', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2127', '90', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2128', '91', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2129', '91', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2130', '91', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2131', '91', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2132', '91', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2133', '92', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2134', '92', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2135', '92', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2136', '92', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2137', '92', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2138', '502', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('2139', '502', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('2140', '502', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2141', '502', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2142', '502', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('2143', '502', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2144', '502', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2145', '502', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2146', '502', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2147', '502', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2148', '503', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('2149', '503', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('2150', '503', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2151', '503', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2152', '503', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2153', '503', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2154', '503', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('2155', '503', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2156', '503', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2157', '503', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2158', '504', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('2159', '504', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('2160', '504', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2161', '504', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2162', '504', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2163', '504', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2164', '504', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('2165', '504', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2166', '504', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2167', '504', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2168', '505', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2169', '505', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2170', '505', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2171', '505', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('2172', '505', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2173', '505', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2174', '506', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('2175', '506', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('2176', '506', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2177', '506', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2178', '506', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2179', '506', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2180', '506', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('2181', '506', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2182', '506', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2183', '506', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2184', '507', '4028da1b592568aa015925803c1bac21');
INSERT INTO `t_roleaut` VALUES ('2185', '507', '4028da1b592568aa015925803c1faa21');
INSERT INTO `t_roleaut` VALUES ('2186', '507', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2187', '507', '4028da1b5976b929015976e786590002');
INSERT INTO `t_roleaut` VALUES ('2188', '507', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2189', '507', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2190', '507', '4028da1b5976b929015976e992840005');
INSERT INTO `t_roleaut` VALUES ('2191', '507', '4028da1b5976b929015976e9f58e0006');
INSERT INTO `t_roleaut` VALUES ('2192', '507', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2193', '507', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2194', '195', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2195', '233', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2196', '243', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2197', '244', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2198', '238', '4028da1b5976b929015976ea96bf0007');
INSERT INTO `t_roleaut` VALUES ('2199', '240', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2200', '241', '4028da1b5976b929015976e81bf90003');
INSERT INTO `t_roleaut` VALUES ('2201', '166', '4028da1b5976b929015976edf2770008');
INSERT INTO `t_roleaut` VALUES ('2202', '166', '4028da1b5976b929015976e8f3c70004');
INSERT INTO `t_roleaut` VALUES ('2203', '166', '4028da1b592568aa0159258aaa1f3221');
INSERT INTO `t_roleaut` VALUES ('2204', '166', '4028da1b5976b929015976e9f58e0006');

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room` (
  `roomid` varchar(32) NOT NULL COMMENT '宿舍编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `stuid` varchar(32) DEFAULT NULL COMMENT '宿舍长编号',
  `quantity` int(11) NOT NULL COMMENT '宿舍最大人数',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES ('402880a05938a44b015938a5a3820000', '8栋301', '4028da1b5961dc0f015961de7c6f0000', '8', '1');
INSERT INTO `t_room` VALUES ('4028da1b592568aa015925803c1f0001', '8栋201', null, '8', '1');
INSERT INTO `t_room` VALUES ('4028da1b592581fa015925839df90001', '8栋202', null, '10', '1');
INSERT INTO `t_room` VALUES ('4028da1b596d472c01596d5739d90000', '303', null, '12', '1');

-- ----------------------------
-- Table structure for t_salary
-- ----------------------------
DROP TABLE IF EXISTS `t_salary`;
CREATE TABLE `t_salary` (
  `salaryid` varchar(32) NOT NULL COMMENT '工资发放编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `extrasalary` double DEFAULT NULL COMMENT '奖励',
  `subsalary` double DEFAULT NULL COMMENT '扣罚',
  `salaryday` datetime DEFAULT NULL COMMENT '发放时间',
  `totalsalary` double DEFAULT NULL COMMENT '总工资',
  PRIMARY KEY (`salaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_salary
-- ----------------------------
INSERT INTO `t_salary` VALUES ('402880a05976548e0159765936f40000', '40246a1b592568aa0159258aaa1f3221', '10000', '0', '2017-01-07 00:00:00', '11000');
INSERT INTO `t_salary` VALUES ('402880a059a4adde0159a4f476d7000c', '4028da1b5976b929015976f1e4a40009', '9000', '0', '2017-01-16 00:00:00', '0');

-- ----------------------------
-- Table structure for t_salaryinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_salaryinfo`;
CREATE TABLE `t_salaryinfo` (
  `salaryinfoid` varchar(32) NOT NULL COMMENT '工资情况编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `basicsalary` double NOT NULL COMMENT '基本工资',
  `jobsalary` double NOT NULL COMMENT '岗位工资',
  PRIMARY KEY (`salaryinfoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_salaryinfo
-- ----------------------------
INSERT INTO `t_salaryinfo` VALUES ('402880a0596c49b401596c90f3df0000', '2028da1b592568aa015925803c1faa21', '0', '0');
INSERT INTO `t_salaryinfo` VALUES ('402880a059a4adde0159a4f2c881000b', '4028da1b5976b929015976f1e4a40009', '10000', '10000');
INSERT INTO `t_salaryinfo` VALUES ('402880a059aa35ba0159aa372fa80000', '2028da1b592568aa015925803c1faa21', '1000', '1000');
INSERT INTO `t_salaryinfo` VALUES ('402880a059aa35ba0159aa3796910001', '40246a1b592568aa0159258aaa1f3221', '1000', '1000');

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `scoreid` varchar(32) NOT NULL COMMENT '成绩编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `courseid` varchar(32) NOT NULL COMMENT '课程编号',
  `score` varchar(32) DEFAULT NULL COMMENT '成绩',
  `testday` datetime DEFAULT NULL COMMENT '考试时间',
  PRIMARY KEY (`scoreid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES ('402880a05454545445454545123123sd', '402881e8596ef58701596ef7f3440000', '402880a059ab21700159ab5bf29e0006', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('402880a0583743847385454523232323', '402881e8596ef58701596ef7f3440000', '402880a05943161f0159431976190001', '77', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('402880a0583743847385748578457485', '402881e8596ef58701596ef7f3440000', '402880a05943161f015943177c450000', '67', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('402880a059ab21700187346374637463', '4028da1b592568aa015925803c1f0001', '402880a059ab21700159ab5bf29e0006', '70', '2017-01-17 20:05:20');
INSERT INTO `t_score` VALUES ('402880a059ab46567654234232112323', '4028da1b592568aa015925803c1f0001', '402880a059ab21700159ab5ca49d0007', '65', '2017-01-17 20:06:03');
INSERT INTO `t_score` VALUES ('402880a4123254544545454521323232', '402881e8596ef58701596ef7f3440000', '402880a059ab21700159ab5ca49d0007', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('402881e8596eefae01596ef3445b0000', '402881e8596eefae01596ef4747b0000', '402880a05943161f0159431976190001', '77', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('40288222296eefae01596ef3445b0000', '402880a35986730301598674923e0001', '402880a05943161f0159431976190001', '77', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('402882222as1232323rerere76767670', '4028da1b5961a403015961a60d880000', '402880a05943161f0159431976190001', '77', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('402882222asdxdde01596ef3445b0000', '402880a35986601f015986614be10001', '402880a05943161f0159431976190001', '77', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('402882222asdxdde01596ef376767670', '4028da1b592581fa015925839df90000', '402880a05943161f0159431976190001', '77', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('402882222asdxddewererere76767670', '4028da1b593f73aa01593f761d600000', '402880a05943161f0159431976190001', '77', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('402882222asqwew323rerere76767670', '4028da1b5961a403015961a6cdf90001', '402880a05943161f0159431976190001', '77', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('402882222asqwew323rererweweq7670', '4028da1b5961dc0f015961de7c6f0000', '402880a05943161f0159431976190001', '77', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('402882222asqwew323resdsdsdaas670', '4028da1b596c464701596c4712160000', '402880a05943161f0159431976190001', '77', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('4028da1b592568aa015925803c1f0qwe', '4028da1b592568aa015925803c1f0001', '402880a05943161f0159431976190001', '90', '2016-12-28 15:08:20');
INSERT INTO `t_score` VALUES ('4028da1b592568aa015925803c1fjkfj', '4028da1b592568aa015925803c1f0001', '402880a05943161f015943177c450000', '80', '2017-01-06 10:25:03');
INSERT INTO `t_score` VALUES ('403431e83333efae01596ef4747b0000', '402880a35986730301598674923e0001', '402880a059ab21700159ab5ca49d0007', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('403431e8444444ae03496ef4747b0000', '402880a35986730301598674923e0001', '402880a05943161f015943177c450000', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('403431e8444444ae03496ef4747beree', '402880a35986601f015986614be10001', '402880a05943161f015943177c450000', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('403431e8444444ae0349eerer47beree', '4028da1b593f73aa01593f761d600000', '402880a05943161f015943177c450000', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('403431e8444444ae0349eereweww12ee', '4028da1b5961a403015961a60d880000', '402880a05943161f015943177c450000', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('403431e844444asdsdsdsasdseww12ee', '4028da1b5961a403015961a6cdf90001', '402880a05943161f015943177c450000', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('403431e844444asdsdsdsaswewweq1ee', '4028da1b5961dc0f015961de7c6f0000', '402880a05943161f015943177c450000', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('403431e8596eefae01596ef4747b0000', '402881e8596eefae01596ef4747b0000', '402880a059ab21700159ab5ca49d0007', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('403431e8596eefae03496ef4747b0000', '402881e8596eefae01596ef4747b0000', '402880a05943161f015943177c450000', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('403431eere33efae01596ef472330000', '4028da1b592581fa015925839df90000', '402880a059ab21700159ab5ca49d0007', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('403431eere33efae01596ef4747b0000', '402880a35986601f015986614be10001', '402880a059ab21700159ab5ca49d0007', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('403431eewww44asdsdsdsaswewweq1ee', '4028da1b596c464701596c4712160000', '402880a05943161f015943177c450000', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('41233erere33efaqweweqwf47ereere0', '4028da1b596c464701596c4712160000', '402880a059ab21700159ab5ca49d0007', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('43458111116eefae01596ef4747b0000', '402880a35986730301598674923e0001', '402880a059ab21700159ab5bf29e0006', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('434581e8596eefae01596ef4747b0000', '402881e8596eefae01596ef4747b0000', '402880a059ab21700159ab5bf29e0006', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('4345qweed16e232232325645ererere0', '4028da1b5961a403015961a60d880000', '402880a059ab21700159ab5bf29e0006', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('4345qweed16eefae0154564565656500', '4028da1b592581fa015925839df90000', '402880a059ab21700159ab5bf29e0006', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('4345qweed16eefae01545645ererere0', '4028da1b593f73aa01593f761d600000', '402880a059ab21700159ab5bf29e0006', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('4345qweed16eefae01596ef4747b0000', '402880a35986601f015986614be10001', '402880a059ab21700159ab5bf29e0006', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('4345qweed16weweweqq25645ererere0', '4028da1b5961a403015961a6cdf90001', '402880a059ab21700159ab5bf29e0006', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('4345qweed16weweweqq25645ewewere0', '4028da1b5961dc0f015961de7c6f0000', '402880a059ab21700159ab5bf29e0006', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('43asdseed16weweweqq25645ewewere0', '4028da1b596c464701596c4712160000', '402880a059ab21700159ab5bf29e0006', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('4erererere33efaasdsd6ef47ereere0', '4028da1b5961a403015961a6cdf90001', '402880a059ab21700159ab5ca49d0007', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('4erererere33efae01596ef472330000', '4028da1b593f73aa01593f761d600000', '402880a059ab21700159ab5ca49d0007', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('4erererere33efae01596ef47ereere0', '4028da1b5961a403015961a60d880000', '402880a059ab21700159ab5ca49d0007', '87', '2017-01-17 20:10:04');
INSERT INTO `t_score` VALUES ('4erererere33efaqweweqwf47ereere0', '4028da1b5961dc0f015961de7c6f0000', '402880a059ab21700159ab5ca49d0007', '87', '2017-01-17 20:10:04');

-- ----------------------------
-- Table structure for t_stu
-- ----------------------------
DROP TABLE IF EXISTS `t_stu`;
CREATE TABLE `t_stu` (
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `stuno` varchar(20) DEFAULT NULL COMMENT '学号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `pwd` varchar(50) DEFAULT NULL COMMENT '密码',
  `idcard` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `qq` varchar(20) DEFAULT NULL COMMENT 'qq号',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信号',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `age` int(11) NOT NULL COMMENT '年龄',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `gender` varchar(5) NOT NULL COMMENT '性别',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭地址',
  `nation` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `residence` varchar(10) DEFAULT NULL COMMENT '户口性质',
  `gradeid` varchar(32) DEFAULT NULL COMMENT '班级编号',
  `roomid` varchar(32) DEFAULT NULL COMMENT '宿舍编号',
  `parentname` varchar(20) DEFAULT NULL COMMENT '家长姓名',
  `parentphone` varchar(11) DEFAULT NULL COMMENT '家长手机号',
  `startday` datetime DEFAULT NULL COMMENT '入学时间',
  `empid` varchar(32) DEFAULT '' COMMENT '招生老师',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  `stustatus` varchar(10) DEFAULT NULL COMMENT '学生状态，包括"意向","预定","正式"',
  `role` varchar(25) DEFAULT NULL COMMENT '班干部角色',
  PRIMARY KEY (`stuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stu
-- ----------------------------
INSERT INTO `t_stu` VALUES ('402880a0596dcc1f01596dce31390000', '3434', '张三', null, '123434545656555554', '12345678912', '1756691236', null, '潭口中学', '16', null, '女', '江西赣州南康', null, null, null, null, null, null, '2017-01-12 22:41:22', '2028da1b592568aa015925803c1faa21', null, '1', '预定', null);
INSERT INTO `t_stu` VALUES ('402880a059ab21700159ab56afcb0004', null, '张三丰', null, '345454521243348888', '14796708902', '2303247590', 'NSG', '野鸡中学', '18', null, '男', null, null, null, null, null, null, null, '2017-01-17 19:21:06', '2028da1b592568aa015925803c1faa21', null, '1', '预定', null);
INSERT INTO `t_stu` VALUES ('402880a35986431201598650bf810001', null, '李四', null, '235454521231448888', '12345678913', '175669123', null, '潭口中学', '12', null, '男', '江西赣州南康', null, null, null, null, null, null, null, '2028da1b592568aa015925803c1faa21', null, '1', '预定', null);
INSERT INTO `t_stu` VALUES ('402880a35986601f015986614be10001', '2016001', '王五', '4QrcOUm6Wau+VuBX8g+IPg==', '232312324343434344', '12345678914', '756691236', 'wed12345656', '上元中学', '19', null, '男', '江西赣州南康', null, null, '4028da1b594a913301594a95f8cf0001', '402880a05938a44b015938a5a3820000', '', '', '2017-01-16 00:00:00', '40246a1b592568aa0159258aaa1f3221', null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('402880a35986691e01598669d89f0000', null, '张三丰', null, '344343521231448888', '12345678915', '702028359', null, '赣州中学', '18', null, '男', '江西赣州', null, null, '4028da1b594a913301594a95f8cf0001', null, null, null, null, '40246a1b592568aa0159258aaa1f3221', null, '1', '预定', null);
INSERT INTO `t_stu` VALUES ('402880a359866f500159867021890000', null, '邱欣', null, '345454521231434588', '12345678916', '544224776', null, '赣州中学', '20', null, '男', '江西赣州', null, null, null, null, null, null, null, '40246a1b592568aa0159258aaa1f3221', null, '1', '预定', null);
INSERT INTO `t_stu` VALUES ('402880a35986730301598674923e0001', '2016001', '郭永瑞', null, '345454521231348888', '12345678917', '80245698', '', '赣州中学', '17', null, '男', '', null, null, '4028da1b59642ced0159645660880000', '402880a05938a44b015938a5a3820000', '', '', '2017-01-17 00:00:00', '40246a1b592568aa0159258aaa1f3221', null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('402881e8596eefae01596ef4747b0000', '23232', '赖太君', null, '323232343434455433', '12345678919', '246547786', '', '赣州中学', '13', null, '男', '', null, null, '4028da1b594a913301594a95f8cf0001', '402880a05938a44b015938a5a3820000', '', '', '2017-01-09 00:00:00', '402880a05997036501599706f9d00000', null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('402881e8596ef58701596ef7f3440000', '2016009', '李晓琳', null, '334344545456566888', '12345678920', '654689889', '', '赣州三中', '12', null, '男', '', null, null, '2028da1b592568aa015925803c1f3784', '402880a05938a44b015938a5a3820000', '', '', '2017-01-17 00:00:00', '402880a05997036501599706f9d00000', null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('402881e95992e256015992eac5590001', null, '王莉', null, null, '12345678921', '878787845', '6566', '赣州二中', '13', null, '女', null, null, null, null, null, null, null, null, '402880a05997036501599706f9d00000', null, '1', '意向', null);
INSERT INTO `t_stu` VALUES ('4028da1b592568aa015925803c1f0001', '2016010', '郭昶', null, '334344545456566788', '12345678922', '123343445', '', '赣州三中', '18', null, '男', '', null, null, '4028da1b594a913301594a95f8cf0001', '4028da1b596d472c01596d5739d90000', '', '', '2016-12-27 00:00:00', '402880a05997036501599706f9d00000', null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b592581fa015925839df90000', '12343', '陈凯', '4QrcOUm6Wau+VuBX8g+IPg==', '343545456565676777', '12345678923', '456667676', null, '赣州二中', '18', null, '女', '江西赣州', null, null, '4028da1b594a913301594a95f8cf0001', '402880a05938a44b015938a5a3820000', null, null, '2016-12-27 00:00:00', '402880a059ab21700159ab4b51ae0000', null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b593f73aa01593f761d600000', '56564', '陈坤', '4QrcOUm6Wau+VuBX8g+IPg==', '423445455123222333', '12345678924', '23456767', null, '赣州中学', '18', null, '男', '江西赣州', null, null, '4028da1b594a913301594a95f8cf0001', '402880a05938a44b015938a5a3820000', null, null, '2016-12-27 00:00:00', '402880a059ab21700159ab4b51ae0000', null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b5961a403015961a60d880000', '12323', '邱晓俊', '4QrcOUm6Wau+VuBX8g+IPg==', '394384934841232111', '12345678925', '2346565676', null, '赣州三中', '18', null, '男', '江西赣州', null, null, '4028da1b594a913301594a95f8cf0001', '402880a05938a44b015938a5a3820000', null, null, '2017-01-03 00:00:00', '402880a059ab21700159ab4b51ae0000', null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b5961a403015961a6cdf90001', '2016005', '徐家汇', null, '334344545456786888', '12345678926', '4565767878', '', '赣州中学', '20', null, '女', '', null, null, '4028da1b594a913301594a95f8cf0001', null, '', '', '2017-01-17 00:00:00', '402881e859838ae70159838c94df0000', null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b5961dc0f015961de7c6f0000', '2016000', '李小康', null, '334344545456566888', '12345678927', '3454656676', '', '于都中学', '23', null, '男', '', null, null, '2028da1b592568aa015925803c1f3784', '4028da1b592568aa015925803c1f0001', '', '', '2017-01-17 00:00:00', '402881e859838ae70159838c94df0000', null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028da1b596c464701596c4712160000', '123232', '刘凯', '4QrcOUm6Wau+VuBX8g+IPg==', '345454521231448888', '12345678928', '7889898996', null, '于都二中', '19', null, '男', '江西赣州', null, null, '2028da1b592568aa015925803c1f3784', '4028da1b592568aa015925803c1f0001', null, null, '2017-01-16 09:05:36', '402881e859838ae70159838c94df0000', null, '1', '正式', null);
INSERT INTO `t_stu` VALUES ('4028dac659a50f100159a52f726f0005', null, '刘俊', null, '345454521231448348', '12345678929', '567678989', null, '南康中学', '18', null, '男', '江西赣州', null, null, null, null, null, null, null, '402881e95992e256015992e573c40000', null, '1', '意向', null);
INSERT INTO `t_stu` VALUES ('4028dac659a538ba0159a5427d8c0003', null, '钟李伟', null, '345454521231448838', '12345678930', '565676653', null, '于都三中', '20', null, '男', '江西赣州', null, null, null, null, null, null, null, '402881e95992e256015992e573c40000', null, '1', '意向', null);
INSERT INTO `t_stu` VALUES ('4028dac659a538ba0159a54357a10004', null, '张立文', null, '345454521231548888', '12345678931', '223434343', null, '赣州中学', '20', null, '男', '江西赣州', null, null, null, null, null, null, null, '4028da1b5976b929015976f78c3f0008', null, '1', '预定', null);
INSERT INTO `t_stu` VALUES ('4028dac659a5440f0159a54e48220000', '201688', '魏坤琳', null, '334344545456788882', '12345678932', '23446852345', '', '赣州中学', '21', null, '男', '', null, null, '4028da1b59642ced0159645660880000', null, '', '', '2017-01-17 00:00:00', '4028da1b5976b929015976f78c3f0008', null, '1', '正式', null);

-- ----------------------------
-- Table structure for t_stuchecking
-- ----------------------------
DROP TABLE IF EXISTS `t_stuchecking`;
CREATE TABLE `t_stuchecking` (
  `checkingid` varchar(32) NOT NULL COMMENT '学生考勤编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `checkingday` datetime DEFAULT NULL COMMENT '考勤日期',
  `checking1` varchar(20) DEFAULT NULL COMMENT '上午',
  `checking2` varchar(20) DEFAULT NULL COMMENT '中午',
  `checking3` varchar(20) DEFAULT NULL COMMENT '下午',
  PRIMARY KEY (`checkingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stuchecking
-- ----------------------------
INSERT INTO `t_stuchecking` VALUES ('402880a0598d7fb401598d815e960000', '4028da1b592568aa015925803c1f0001', '2017-01-19 00:00:00', '正常', '正常', '请假');
INSERT INTO `t_stuchecking` VALUES ('402880a059ab21700159ab8a96300018', '402881e8596ef58701596ef7f3440000', '2017-01-17 16:28:22', '正常', '正常', '正常');
INSERT INTO `t_stuchecking` VALUES ('4028da1b593f73aa01593f761d600023', '4028da1b592581fa015925839df90000', '2016-12-29 00:00:00', '正常', '正常', '正常');

-- ----------------------------
-- Table structure for t_stufeedback
-- ----------------------------
DROP TABLE IF EXISTS `t_stufeedback`;
CREATE TABLE `t_stufeedback` (
  `feedbackid` varchar(32) NOT NULL COMMENT '反馈编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `feedbackday` datetime DEFAULT NULL COMMENT '反馈时间',
  `des` varchar(500) DEFAULT NULL COMMENT '反馈详情',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认可用',
  PRIMARY KEY (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stufeedback
-- ----------------------------
INSERT INTO `t_stufeedback` VALUES ('402880a059aa80030159ab0c6cc60000', '4028da1b592568aa015925803c1f0001', '2017-01-17 14:10:29', '000', '1');
INSERT INTO `t_stufeedback` VALUES ('4028da1b592581fa015925839df90044', '4028da1b592568aa015925803c1f0001', '2017-01-17 14:10:46', '。。。。', '0');
INSERT INTO `t_stufeedback` VALUES ('4028da1b592581fa015925839df94545', '4028da1b592581fa015925839df90000', '2016-12-27 22:46:14', '565656', '1');

-- ----------------------------
-- Table structure for t_stuleave
-- ----------------------------
DROP TABLE IF EXISTS `t_stuleave`;
CREATE TABLE `t_stuleave` (
  `leaveid` varchar(32) NOT NULL COMMENT '学生请假编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `starttime` datetime DEFAULT NULL COMMENT '开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `leaveday` datetime DEFAULT NULL COMMENT '提交时间',
  `des` varchar(255) DEFAULT NULL COMMENT '请假说明',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用',
  `firlevel` int(11) DEFAULT '0' COMMENT '任课老师审核，默认不通过',
  `secondlevel` int(11) DEFAULT '0' COMMENT '班主任审核，默认不通过',
  `pass` int(11) DEFAULT '0' COMMENT '通过状态，默认为不通过',
  PRIMARY KEY (`leaveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stuleave
-- ----------------------------
INSERT INTO `t_stuleave` VALUES ('402880a05996b3fa015996b936780000', '4028da1b592568aa015925803c1f0001', '2017-01-13 15:27:10', '2017-01-14 15:27:11', '2017-01-13 15:27:18', '不知道', '1', '1', '1', '1');
INSERT INTO `t_stuleave` VALUES ('402880a05997110801599711b9b60000', '4028da1b592568aa015925803c1f0001', '2017-01-13 17:03:49', '2017-01-13 17:03:51', '2017-01-13 17:03:58', '不知道', '1', '1', '1', '1');
INSERT INTO `t_stuleave` VALUES ('402880a0599711080159977ffd730001', '4028da1b593f73aa01593f761d600000', '2017-01-13 19:04:17', '2017-01-13 19:04:19', '2017-01-13 19:04:25', '还不是', '1', '1', '1', '1');
INSERT INTO `t_stuleave` VALUES ('402880a059a4adde0159a4e851d20007', '4028da1b592568aa015925803c1f0001', '2017-01-16 09:33:12', '2017-01-16 09:33:14', '2017-01-16 09:33:26', '回家回家', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for t_talk
-- ----------------------------
DROP TABLE IF EXISTS `t_talk`;
CREATE TABLE `t_talk` (
  `talkid` varchar(32) NOT NULL COMMENT '谈心编号',
  `empid` varchar(32) NOT NULL COMMENT '员工编号',
  `stuid` varchar(32) NOT NULL COMMENT '学生编号',
  `talkday` datetime DEFAULT NULL COMMENT '谈心时间',
  `des` varchar(500) DEFAULT NULL COMMENT '谈心详情',
  `status` int(11) DEFAULT '1' COMMENT '状态，默认为可用状态',
  PRIMARY KEY (`talkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_talk
-- ----------------------------
INSERT INTO `t_talk` VALUES ('402880a0599263bb0159926661c70000', '4028da1b5976b929015976f78c3f0008', '4028da1b592581fa015925839df90000', '2017-01-12 00:00:00', '的对待', '1');
INSERT INTO `t_talk` VALUES ('402880a3598c9e0601598ca2d4880000', '4028da1b5976b929015976f78c3f0008', '402881e8596eefae01596ef4747b0000', '2017-01-11 00:00:00', '顶顶顶顶个', '1');
INSERT INTO `t_talk` VALUES ('4028da1b592568aa015925803c1fdhfj', '4028da1b5976b929015976f78c3f0008', '4028da1b592568aa015925803c1f0001', '2016-12-30 00:00:00', '上体育课不和我打球', '1');
