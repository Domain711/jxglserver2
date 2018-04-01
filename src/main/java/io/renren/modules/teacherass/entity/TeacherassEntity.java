package io.renren.modules.teacherass.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 教师评价信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:32:04
 */
@TableName("tb_teacherass")
public class TeacherassEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 序号
	 */
	@TableId
	private Integer id;
	/**
	 * 被评价教师工号
	 */
	private String teachernum;
	/**
	 * 人员类型 学生、老师
	 */
	private String asstype;
	/**
	 * 评价等级 优秀、良好、可接受
	 */
	private String asslevel;
	/**
	 * 评价分值
	 */
	private Integer assvalue;
	/**
	 * 评价工号/学号
	 */
	private Long assnum;
	/**
	 * 评价时间
	 */
	private Date asstime;
	/**
	 * 学期
	 */
	private String term;
	/**
	 * 评价备注
	 */
	private String assremark;

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
	 * 设置：被评价教师工号
	 */
	public void setTeachernum(String teachernum) {
		this.teachernum = teachernum;
	}
	/**
	 * 获取：被评价教师工号
	 */
	public String getTeachernum() {
		return teachernum;
	}
	/**
	 * 设置：人员类型 学生、老师
	 */
	public void setAsstype(String asstype) {
		this.asstype = asstype;
	}
	/**
	 * 获取：人员类型 学生、老师
	 */
	public String getAsstype() {
		return asstype;
	}
	/**
	 * 设置：评价等级 优秀、良好、可接受
	 */
	public void setAsslevel(String asslevel) {
		this.asslevel = asslevel;
	}
	/**
	 * 获取：评价等级 优秀、良好、可接受
	 */
	public String getAsslevel() {
		return asslevel;
	}
	/**
	 * 设置：评价分值
	 */
	public void setAssvalue(Integer assvalue) {
		this.assvalue = assvalue;
	}
	/**
	 * 获取：评价分值
	 */
	public Integer getAssvalue() {
		return assvalue;
	}
	/**
	 * 设置：评价工号/学号
	 */
	public void setAssnum(Long assnum) {
		this.assnum = assnum;
	}
	/**
	 * 获取：评价工号/学号
	 */
	public Long getAssnum() {
		return assnum;
	}
	/**
	 * 设置：评价时间
	 */
	public void setAsstime(Date asstime) {
		this.asstime = asstime;
	}
	/**
	 * 获取：评价时间
	 */
	public Date getAsstime() {
		return asstime;
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
	/**
	 * 设置：评价备注
	 */
	public void setAssremark(String assremark) {
		this.assremark = assremark;
	}
	/**
	 * 获取：评价备注
	 */
	public String getAssremark() {
		return assremark;
	}
}
