package io.renren.modules.question.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 考试成绩信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:45:25
 */
@TableName("tb_question")
public class QuestionEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 序号
	 */
	@TableId
	private Integer id;
	/**
	 * 学院编号
	 */
	private String collegenum;
	private String collegename;

	/**
	 * 专业编号
	 */
	private String majornum;
	private String majorname;
	/**
	 * 课程编号
	 */
	private String coursenum;
	private String coursename;

	/**
	 * 班级编号
	 */
	private String gradenum;
	private String gradename;

	/**
	 * 题目编号
	 */
	private String questionnum;
	/**
	 * 题目类型编号
	 */
	private String questiontype;
	private String questiontypename;
	/**
	 * 题目内容
	 */
	private String questioncotent;
	/**
	 * 备注
	 */
	private String remark;

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
	 * 设置：题目编号
	 */
	public void setQuestionnum(String questionnum) {
		this.questionnum = questionnum;
	}
	/**
	 * 获取：题目编号
	 */
	public String getQuestionnum() {
		return questionnum;
	}
	/**
	 * 设置：题目类型编号
	 */
	public void setQuestiontype(String questiontype) {
		this.questiontype = questiontype;
	}
	/**
	 * 获取：题目类型编号
	 */
	public String getQuestiontype() {
		return questiontype;
	}
	/**
	 * 设置：题目内容
	 */
	public void setQuestioncotent(String questioncotent) {
		this.questioncotent = questioncotent;
	}
	/**
	 * 获取：题目内容
	 */
	public String getQuestioncotent() {
		return questioncotent;
	}
	/**
	 * 设置：备注
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 获取：备注
	 */
	public String getRemark() {
		return remark;
	}

	public String getCollegename() {
		return collegename;
	}

	public void setCollegename(String collegename) {
		this.collegename = collegename;
	}

	public String getMajorname() {
		return majorname;
	}

	public void setMajorname(String majorname) {
		this.majorname = majorname;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getGradename() {
		return gradename;
	}

	public void setGradename(String gradename) {
		this.gradename = gradename;
	}

	public String getQuestiontypename() {
		return questiontypename;
	}

	public void setQuestiontypename(String questiontypename) {
		this.questiontypename = questiontypename;
	}
}
