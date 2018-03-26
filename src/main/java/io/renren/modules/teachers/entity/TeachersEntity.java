package io.renren.modules.teachers.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 教师信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 17:44:17
 */
@TableName("tb_teachers")
public class TeachersEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 序号
	 */
	@TableId
	private Integer id;
	/**
	 * 工号
	 */
	private String num;
	/**
	 * 学院编号
	 */
	private String collegenum;
	/**
	 * 专业编号
	 */
	private String majornum;
	/**
	 * 教课班级编号
	 */
	private String gradenum;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 教授课程编号
	 */
	private String coursenum;
	/**
	 * 类型
	 */
	private String type;
	/**
	 * 学时
	 */
	private String period;
	/**
	 * 学分
	 */
	private String credit;

	/**
	 * 设置：序号
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：序号
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：工号
	 */
	public void setNum(String num) {
		this.num = num;
	}
	/**
	 * 获取：工号
	 */
	public String getNum() {
		return num;
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
	 * 设置：教课班级编号
	 */
	public void setGradenum(String gradenum) {
		this.gradenum = gradenum;
	}
	/**
	 * 获取：教课班级编号
	 */
	public String getGradenum() {
		return gradenum;
	}
	/**
	 * 设置：姓名
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：姓名
	 */
	public String getName() {
		return name;
	}
	/**
	 * 设置：教授课程编号
	 */
	public void setCoursenum(String coursenum) {
		this.coursenum = coursenum;
	}
	/**
	 * 获取：教授课程编号
	 */
	public String getCoursenum() {
		return coursenum;
	}
	/**
	 * 设置：类型
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * 获取：类型
	 */
	public String getType() {
		return type;
	}
	/**
	 * 设置：学时
	 */
	public void setPeriod(String period) {
		this.period = period;
	}
	/**
	 * 获取：学时
	 */
	public String getPeriod() {
		return period;
	}
	/**
	 * 设置：学分
	 */
	public void setCredit(String credit) {
		this.credit = credit;
	}
	/**
	 * 获取：学分
	 */
	public String getCredit() {
		return credit;
	}
}
