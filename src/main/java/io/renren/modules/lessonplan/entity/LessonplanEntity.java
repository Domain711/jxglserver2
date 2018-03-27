package io.renren.modules.lessonplan.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 教案信息表
 * 
 * @author 
 * @email 
 * @date 2018-03-28 06:06:43
 */
@TableName("tb_lessonplan")
public class LessonplanEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 序号
	 */
	@TableId
	private Integer id;
	/**
	 * 计划名称
	 */
	private String lessonplanname;
	/**
	 * 附件名称
	 */
	private String attachname;
	/**
	 * 创建人
	 */
	private Long createuser;
	/**
	 * 创建时间
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
	 * 设置：计划名称
	 */
	public void setLessonplanname(String lessonplanname) {
		this.lessonplanname = lessonplanname;
	}
	/**
	 * 获取：计划名称
	 */
	public String getLessonplanname() {
		return lessonplanname;
	}
	/**
	 * 设置：附件名称
	 */
	public void setAttachname(String attachname) {
		this.attachname = attachname;
	}
	/**
	 * 获取：附件名称
	 */
	public String getAttachname() {
		return attachname;
	}
	/**
	 * 设置：创建人
	 */
	public void setCreateuser(Long createuser) {
		this.createuser = createuser;
	}
	/**
	 * 获取：创建人
	 */
	public Long getCreateuser() {
		return createuser;
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
