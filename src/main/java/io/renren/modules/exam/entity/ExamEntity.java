package io.renren.modules.exam.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 考试成绩信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:43:58
 */
@TableName("tb_exam")
public class ExamEntity implements Serializable {
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
	/**
	 * 专业编号
	 */
	private String majornum;
	/**
	 * 课程编号
	 */
	private String coursenum;
	/**
	 * 班级编号
	 */
	private String gradenum;
	/**
	 * 学生学号
	 */
	private String studentnum;
	/**
	 * 考试成绩
	 */
	private String score;
	/**
	 * 录入时间
	 */
	private Date createtime;
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
	 * 设置：学生学号
	 */
	public void setStudentnum(String studentnum) {
		this.studentnum = studentnum;
	}
	/**
	 * 获取：学生学号
	 */
	public String getStudentnum() {
		return studentnum;
	}
	/**
	 * 设置：考试成绩
	 */
	public void setScore(String score) {
		this.score = score;
	}
	/**
	 * 获取：考试成绩
	 */
	public String getScore() {
		return score;
	}
	/**
	 * 设置：录入时间
	 */
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	/**
	 * 获取：录入时间
	 */
	public Date getCreatetime() {
		return createtime;
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
}
