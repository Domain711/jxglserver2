package io.renren.modules.grade.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 班级信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:42:16
 */
@TableName("tb_grade")
public class GradeEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 序号
	 */
	@TableId
	private Integer id;
	/**
	 * 班级编号
	 */
	private String gradenum;
	/**
	 * 班级名称
	 */
	private String gradename;
	/**
	 * 学院编号
	 */
	private String collegenum;
	/**
	 * 专业编号
	 */
	private String majornum;
	/**
	 * 创建时间
	 */
	private Date createtime;
	/**
	 * 创建人
	 */
	private String createuser;
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
	 * 设置：班级名称
	 */
	public void setGradename(String gradename) {
		this.gradename = gradename;
	}
	/**
	 * 获取：班级名称
	 */
	public String getGradename() {
		return gradename;
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
	 * 设置：创建人
	 */
	public void setCreateuser(String createuser) {
		this.createuser = createuser;
	}
	/**
	 * 获取：创建人
	 */
	public String getCreateuser() {
		return createuser;
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
