package io.renren.modules.major.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 专业信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:40:45
 */
@TableName("tb_major")
public class MajorEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 序号
	 */
	@TableId
	private Integer id;
	/**
	 * 专业编号
	 */
	private String majornum;
	/**
	 * 专业名称
	 */
	private String majorname;
	/**
	 * 学院编号
	 */
	private String collegenum;
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
