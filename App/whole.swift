//
//  whole.swift
//  App
//
//  Created by 赵希帆 on 15/4/21.
//  Copyright (c) 2015年 赵希帆. All rights reserved.
//

import UIKit
var shenfen : Int!  //身份标识
var test0 : String? //账号
var test : String?  //密码
var test4 : String?  //电话
var test2 : String?  //姓名
var test3 : String?  //职位权限
var test5 : String?  //邮箱
var count1 : NSMutableArray? //派单员评估表个数
var count2 : NSMutableArray? //用户表单
var count3 : NSMutableArray?//业务员表单
var count4 : NSMutableArray?//评估员表单
var count5 : NSMutableArray?//财务员表单
var count6 : NSMutableArray?//文员表单
var count7 : NSMutableArray?//一级估价师
var count9 : NSMutableArray?//二级估价师
var pinggu : [String] = [] //派单表序号
var chuping : [String] = []//初评编号
var mostpinggu : Int = 0 //评估表最大的编号
var deliverwho : String?//评估单对应的派单员
var deliverwhoid : String?//评估单对应的派单id
var count11 : Int = 0
var count33 : Int = 0
var count44 : Int = 0
var count55 : Int = 0
var count66 : Int = 0
var count77 : Int = 0
var count99 : Int = 0
//评估表属性
var liebiao : [String] = ["派单员","业务员","初评编号","期间归属","联系人","联系电话","一级派单单位","二级派单单位","三级派单单位","评估员","属地","房产坐落地","备注（评估员）","小区名称","实际评估日期","外勤工作时间","评估总价","一级审核评估师","一级审核意见","二级审核评估师","二级审核意见","报告编号","报告日期","报告类型","备注（文员）","收费","备注（财务）"]
//数据库中评估表属性
var liebiao1 : [String] = ["deliver", "salesman", "firstnum", "yearmonth", "contact", "contactphone", "firstunit", "secondunit", "thirdunit", "appraiser", "belong", "local", "firstremark", "areaname", "realdate", "outtime", "total", "firstevaluate", "firstsuggestion", "secondevaluate", "secondsuggestion", "reportnum", "reportdate", "reportstype", "secondremark", "pay", "thirdremark"]
//业务员表属性
var salesman1 : [String] = ["初评编号", "期间归属", "联系人", "联系电话", "一级派单单位", "二级派单单位", "三级派单单位", "评估员", "属地", "房产坐落地", "备注（评估员）", "小区名称", "实际评估日期", "评估总价", "一级审核评估师", "一级审核意见" , "二级审核评估师", "二级审核意见", "报告编号","报告日期","报告类型","收费"]
var salesman2 : [String] = ["firstnum","yearmonth","contact","contactphone","firstunit","secondunit","thirdunit","appraiser","belong","local","firstremark","areaname","realdate","total","firstevaluate","firstsuggestion","secondevaluate","secondsuggestion","reportnum","reportdate","reportstype","pay"]
//评估员表属性
var appraiser1 : [String] = ["初评编号","期间归属","联系人","联系电话","一级派单单位","二级派单单位","三级派单单位","评估员","属地","房产坐落地","备注（评估员）","小区名称","实际评估日期","外勤工作时间","评估总价","一级审核评估师","一级审核意见","二级审核评估师","二级审核意见","报告编号","报告日期","报告类型"]
var appraiser2 : [String] = ["firstnum","yearmonth","contact","contactphone","firstunit","secondunit","thirdunit","appraiser","belong","local","firstremark","areaname","realdate","outtime","total","firstevaluate","firstsuggesstion","secondevaluate","secondsuggestion","reportnum","reportdate","reportstyle"]
//财务员表属性
var money1 : [String] = ["初评编号","期间归属","联系人","联系电话","一级派单单位","二级派单单位","三级派单单位","评估员","房产坐落地","实际评估日期","评估总价","一级审核评估师","一级审核意见","二级审核评估师","二级审核意见","报告编号","报告日期","报告类型","收费","备注（财务）"]
var money2 : [String] = ["firstnum","yearmonth","contact","contactphone","firstunit","secondunit","thirdunit","appraiser","local","realdate","total","firstevaluate","firstsuggestion","secondevaluate","secondsuggestion","reportnum","reportdate","reportstyle","pay","thirdremark"]
//文员表属性
var writing1 : [String] = ["初评编号","期间归属","联系人","联系电话","评估员","属地","房产坐落地","评估总价","一级审核评估师","一级审核意见","二级审核评估师","二级审核意见","报告编号","报告日期","报告类型","备注（文员）"]
var writing2 : [String] = ["firstnum","yearmonth","contact","contactphone","appraiser","belong","local","total","firstevaluate","firstsuggestion","secondevaluate","secondsuggestion","reportnum","reportdate","reportstyle","secondremark"]
//一级估价师
var evaluate1 : [String] = ["初评编号","期间归属","一级派单单位","二级派单单位","评估员","属地","房产坐落地","小区名称","实际评估日期","评估总价","一级审核意见","报告编号","报告日期","报告类型"]
var evaluate2 : [String] = ["firstnum","yearmonth","firstunit","secondunit","appraiser","belong","local","areaname","realdate","total","firstsuggestion","reportnum","reportdate","reportstyle"]
//二级估价师
var evaluate11 : [String] = ["初评编号","期间归属","联系人","联系电话","一级派单单位","二级派单单位","评估员","属地","房产坐落地","小区名称","实际评估日期","评估总价","一级审核评估师","一级审核意见","二级审核意见","报告编号","报告日期","报告类型"]
var evaluate22 : [String] = ["fiestnum","yearmonth","contact","contactphone","firstunit","secondunit","appraiser","belong","local","areaname","realdate","total","firstevaluate","firstsuggestion","secondsuggestion","reportnum","reportdate","reportstyle"]
//评估表内容
//var liebiao2 : [String] = [test2!,"","","","","","","","","","","","","","","","","","","","","","","","","",""]
var liebiao2 : NSDictionary!
var salesman : [String] = []
var appraiser : [String] = []
var firstevaluate : [String] = []
var secondvaluate : [String] = []
var reportstype : [String] = ["长类型","中类型","短类型"]

var index : Int!  //评估表id
var deliverid : String!
var isSave : Bool = false
var gmusername : [String] = [] //gm获取用户表名字
var gmuserpower : [String] = [] //gm获取用户表权限
var gmuserid : [String] = []//gm获取用户表的id
var gmuserphone : [String] = []//gm获取用户表的电话
var gmuseremail : [String] = []//gm获取用户表的权限
var gmuserpassword : [String] = []//gm获取用户表的密码