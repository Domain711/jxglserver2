package io.renren.modules.students.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 学生信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 19:42:53
 */
@TableName("tb_students")
public class StudentsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 序号
	 */
	@TableId
	private Integer id;
	/**
	 * 学号
	 */
	private String studentnum;
	/**
	 * 学院编号
	 */
	private String collegenum;
	/**
	 * 专业编号
	 */
	private String majornum;
	/**
	 * 班级编号
	 */
	private String gradenum;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 类型
	 */
	private String type;
	/**
	 * 学期
	 */
	private String term;

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
	 * 设置：学号
	 */
	public void setStudentnum(String studentnum) {
		this.studentnum = studentnum;
	}
	/**
	 * 获取：学号
	 */
	public String getStudentnum() {
		return studentnum;
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
	 * 设置：班级编号
	 */
	public void setGradenum(String gradenum) {
		this.gradenum = gradenum;
	}
	/**
	 * 获取：班级编号
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
	 * 设置：学期
	 */
	public void setTerm(String term) {
		this.term = term;
	}
	/**
	 * 获取：学期
	 */
	public String getTerm() {
		return term;
	}
}
