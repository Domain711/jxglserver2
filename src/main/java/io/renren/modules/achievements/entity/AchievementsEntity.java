package io.renren.modules.achievements.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 科研成果表
 * 
 * @author 
 * @email 
 * @date 2018-03-28 06:11:14
 */
@TableName("tb_achievements")
public class AchievementsEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 序号
	 */
	@TableId
	private Integer id;
	/**
	 * 科研名称
	 */
	private String achievementsname;
	/**
	 * 科研简介
	 */
	private String achievementsdesc;
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
	 * 设置：科研名称
	 */
	public void setAchievementsname(String achievementsname) {
		this.achievementsname = achievementsname;
	}
	/**
	 * 获取：科研名称
	 */
	public String getAchievementsname() {
		return achievementsname;
	}
	/**
	 * 设置：科研简介
	 */
	public void setAchievementsdesc(String achievementsdesc) {
		this.achievementsdesc = achievementsdesc;
	}
	/**
	 * 获取：科研简介
	 */
	public String getAchievementsdesc() {
		return achievementsdesc;
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
