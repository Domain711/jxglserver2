package io.renren.modules.tactics.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 组卷策略
 * 
 * @author 
 * @email 
 * @date 2018-04-04 21:11:37
 */
@TableName("tb_tactics")
public class TacticsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Long tacid;
	/**
	 * 试卷名称
	 */
	private String tacname;
	/**
	 * 学院编号
	 */
	private String collegenum;
	/**
	 * 学院
	 */
	private String collegename;
	/**
	 * 专业编号
	 */
	private String majornum;
	/**
	 * 专业名称
	 */
	private String majorname;
	/**
	 * 课程编号
	 */
	private String coursenum;
	/**
	 * 课程名称
	 */
	private String coursename;
	/**
	 * 试卷内容
	 */
	private String content;
	/**
	 * 创建人
	 */
	private Long createid;
	/**
	 * 创建时间
	 */
	private Date createtime;
	/**
	 * 题型
	 */
	private String qtype;
	/**
	 * 权重
	 */
	private String weight;

	/**
	 * 设置：
	 */
	public void setTacid(Long tacid) {
		this.tacid = tacid;
	}
	/**
	 * 获取：
	 */
	public Long getTacid() {
		return tacid;
	}
	/**
	 * 设置：试卷名称
	 */
	public void setTacname(String tacname) {
		this.tacname = tacname;
	}
	/**
	 * 获取：试卷名称
	 */
	public String getTacname() {
		return tacname;
	}
	/**
	 * 设置：学院编号
	 */
	public void setCollegenum(String collegenum) {
		this.collegenum = collegenum;
	}
	/**
	 * 获取：学院编号
	 */
	public String getCollegenum() {
		return collegenum;
	}
	/**
	 * 设置：学院
	 */
	public void setCollegename(String collegename) {
		this.collegename = collegename;
	}
	/**
	 * 获取：学院
	 */
	public String getCollegename() {
		return collegename;
	}
	/**
	 * 设置：专业编号
	 */
	public void setMajornum(String majornum) {
		this.majornum = majornum;
	}
	/**
	 * 获取：专业编号
	 */
	public String getMajornum() {
		return majornum;
	}
	/**
	 * 设置：专业名称
	 */
	public void setMajorname(String majorname) {
		this.majorname = majorname;
	}
	/**
	 * 获取：专业名称
	 */
	public String getMajorname() {
		return majorname;
	}
	/**
	 * 设置：课程编号
	 */
	public void setCoursenum(String coursenum) {
		this.coursenum = coursenum;
	}
	/**
	 * 获取：课程编号
	 */
	public String getCoursenum() {
		return coursenum;
	}
	/**
	 * 设置：课程名称
	 */
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	/**
	 * 获取：课程名称
	 */
	public String getCoursename() {
		return coursename;
	}
	/**
	 * 设置：试卷内容
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * 获取：试卷内容
	 */
	public String getContent() {
		return content;
	}
	/**
	 * 设置：创建人
	 */
	public void setCreateid(Long createid) {
		this.createid = createid;
	}
	/**
	 * 获取：创建人
	 */
	public Long getCreateid() {
		return createid;
	}
	/**
	 * 设置：创建时间
	 */
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	/**
	 * 获取：创建时间
	 */
	public Date getCreatetime() {
		return createtime;
	}
	/**
	 * 设置：题型
	 */
	public void setQtype(String qtype) {
		this.qtype = qtype;
	}
	/**
	 * 获取：题型
	 */
	public String getQtype() {
		return qtype;
	}
	/**
	 * 设置：权重
	 */
	public void setWeight(String weight) {
		this.weight = weight;
	}
	/**
	 * 获取：权重
	 */
	public String getWeight() {
		return weight;
	}
}
