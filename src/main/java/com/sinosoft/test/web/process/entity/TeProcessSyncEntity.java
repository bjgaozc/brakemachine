package com.sinosoft.test.web.process.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.jeecgframework.core.common.entity.IdEntity;
import org.jeecgframework.poi.excel.annotation.Excel;

/**   
 * @Title: Entity
 * @Description: 流程同步
 * @author cmh
 * @date 2017-11-22 10:36:08
 * @version V1.0   
 *
 */
@Entity
@Table(name = "te_process_sync")
public class TeProcessSyncEntity extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = -706853091170976330L;
	/**创建人名称*/
	private java.lang.String createName;
	/**创建人登录名称*/
	private java.lang.String createBy;
	/**创建日期*/
	private java.util.Date createDate;
	/**更新人名称*/
	private java.lang.String updateName;
	/**更新人登录名称*/
	private java.lang.String updateBy;
	/**更新日期*/
	private java.util.Date updateDate;
	/**类型*/
	@Excel(name="类型")
	private java.lang.String syType;
	/**状态*/
	@Excel(name="状态")
	private java.lang.String syStatus;
	/**备注*/
	@Excel(name="备注")
	private java.lang.String syNote;
	/**排序*/
	@Excel(name="排序")
	private java.lang.Integer sySort;
	/**版本*/
	private java.lang.String syVersion;
	/**申请号*/
	@Excel(name="申请号")
	private java.lang.String syApplyid;
	/**申请类型*/
	@Excel(name="申请类型")
	private java.lang.String syApplytype;
	/**级别*/
	@Excel(name="级别")
	private java.lang.String syLevel;
	/**节点编码*/
	@Excel(name="节点编码")
	private java.lang.String syNodecode;
	/**节点中文名*/
	@Excel(name="节点中文名")
	private java.lang.String syNodename;
	/**用户名*/
	@Excel(name="用户名")
	private java.lang.String syUsername;
	/**姓名*/
	@Excel(name="姓名")
	private java.lang.String syRealname;
	/**最新流程进度*/
	@Excel(name="最新流程进度")
	private java.lang.String syCurrentpro;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建人名称
	 */
	@Column(name ="CREATE_NAME",nullable=true,length=50)
	public java.lang.String getCreateName(){
		return this.createName;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建人名称
	 */
	public void setCreateName(java.lang.String createName){
		this.createName = createName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  创建人登录名称
	 */
	@Column(name ="CREATE_BY",nullable=true,length=50)
	public java.lang.String getCreateBy(){
		return this.createBy;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  创建人登录名称
	 */
	public void setCreateBy(java.lang.String createBy){
		this.createBy = createBy;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  创建日期
	 */
	@Column(name ="CREATE_DATE",nullable=true,length=20)
	public java.util.Date getCreateDate(){
		return this.createDate;
	}
	
	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  创建日期
	 */
	public void setCreateDate(java.util.Date createDate){
		this.createDate = createDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  更新人名称
	 */
	@Column(name ="UPDATE_NAME",nullable=true,length=50)
	public java.lang.String getUpdateName(){
		return this.updateName;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  更新人名称
	 */
	public void setUpdateName(java.lang.String updateName){
		this.updateName = updateName;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  更新人登录名称
	 */
	@Column(name ="UPDATE_BY",nullable=true,length=50)
	public java.lang.String getUpdateBy(){
		return this.updateBy;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  更新人登录名称
	 */
	public void setUpdateBy(java.lang.String updateBy){
		this.updateBy = updateBy;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  更新日期
	 */
	@Column(name ="UPDATE_DATE",nullable=true,length=20)
	public java.util.Date getUpdateDate(){
		return this.updateDate;
	}
	
	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  更新日期
	 */
	public void setUpdateDate(java.util.Date updateDate){
		this.updateDate = updateDate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  类型
	 */
	@Column(name ="SY_TYPE",nullable=true,length=50)
	public java.lang.String getSyType(){
		return this.syType;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  类型
	 */
	public void setSyType(java.lang.String syType){
		this.syType = syType;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态
	 */
	@Column(name ="SY_STATUS",nullable=true,length=50)
	public java.lang.String getSyStatus(){
		return this.syStatus;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态
	 */
	public void setSyStatus(java.lang.String syStatus){
		this.syStatus = syStatus;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */
	@Column(name ="SY_NOTE",nullable=true,length=200)
	public java.lang.String getSyNote(){
		return this.syNote;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  备注
	 */
	public void setSyNote(java.lang.String syNote){
		this.syNote = syNote;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  排序
	 */
	@Column(name ="SY_SORT",nullable=true)
	public java.lang.Integer getSySort(){
		return this.sySort;
	}
	
	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  排序
	 */
	public void setSySort(java.lang.Integer sySort){
		this.sySort = sySort;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  版本
	 */
	@Column(name ="SY_VERSION",nullable=true,length=50)
	public java.lang.String getSyVersion(){
		return this.syVersion;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  版本
	 */
	public void setSyVersion(java.lang.String syVersion){
		this.syVersion = syVersion;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  申请号
	 */
	@Column(name ="SY_APPLYID",nullable=true,length=50)
	public java.lang.String getSyApplyid(){
		return this.syApplyid;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  申请号
	 */
	public void setSyApplyid(java.lang.String syApplyid){
		this.syApplyid = syApplyid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  申请类型
	 */
	@Column(name ="SY_APPLYTYPE",nullable=true,length=50)
	public java.lang.String getSyApplytype(){
		return this.syApplytype;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  申请类型
	 */
	public void setSyApplytype(java.lang.String syApplytype){
		this.syApplytype = syApplytype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  级别
	 */
	@Column(name ="SY_LEVEL",nullable=true,length=50)
	public java.lang.String getSyLevel(){
		return this.syLevel;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  级别
	 */
	public void setSyLevel(java.lang.String syLevel){
		this.syLevel = syLevel;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  节点编码
	 */
	@Column(name ="SY_NODECODE",nullable=true,length=50)
	public java.lang.String getSyNodecode(){
		return this.syNodecode;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  节点编码
	 */
	public void setSyNodecode(java.lang.String syNodecode){
		this.syNodecode = syNodecode;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  节点中文名
	 */
	@Column(name ="SY_NODENAME",nullable=true,length=50)
	public java.lang.String getSyNodename(){
		return this.syNodename;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  节点中文名
	 */
	public void setSyNodename(java.lang.String syNodename){
		this.syNodename = syNodename;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  用户名
	 */
	@Column(name ="SY_USERNAME",nullable=true,length=100)
	public java.lang.String getSyUsername(){
		return this.syUsername;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  用户名
	 */
	public void setSyUsername(java.lang.String syUsername){
		this.syUsername = syUsername;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  姓名
	 */
	@Column(name ="SY_REALNAME",nullable=true,length=100)
	public java.lang.String getSyRealname(){
		return this.syRealname;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  姓名
	 */
	public void setSyRealname(java.lang.String syRealname){
		this.syRealname = syRealname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  最新流程进度
	 */
	@Column(name ="SY_CURRENTPRO",nullable=true,length=36)
	public java.lang.String getSyCurrentpro(){
		return this.syCurrentpro;
	}
	
	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  最新流程进度
	 */
	public void setSyCurrentpro(java.lang.String syCurrentpro){
		this.syCurrentpro = syCurrentpro;
	}
}
