package io.renren.modules.tactics.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 卷库
 * 
 * @author 
 * @email 
 * @date 2018-04-11 23:20:27
 */
@TableName("tb_paperq")
public class PaperqEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	private Integer id;
	/**
	 * 编号
	 */
	private Integer num;
	/**
	 * 试卷类型
	 */
	private String papertype;
	/**
	 * 试卷内容
	 */
	private String content;

	/**
	 * 设置：
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：编号
	 */
	public void setNum(Integer num) {
		this.num = num;
	}
	/**
	 * 获取：编号
	 */
	public Integer getNum() {
		return num;
	}
	/**
	 * 设置：试卷类型
	 */
	public void setPapertype(String papertype) {
		this.papertype = papertype;
	}
	/**
	 * 获取：试卷类型
	 */
	public String getPapertype() {
		return papertype;
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
}
