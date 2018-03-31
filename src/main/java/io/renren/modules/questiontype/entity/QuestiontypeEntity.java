package io.renren.modules.questiontype.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 题目类型表
 * 
 * @author 
 * @email 
 * @date 2018-03-25 18:47:24
 */
@TableName("tb_questiontype")
public class QuestiontypeEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 序号
	 */
	@TableId
	private Integer id;
	/**
	 * 题目类型编号
	 */
	private String questiontype;
	/**
	 * 题目类型名称
	 */
	private String questiontypename;
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

	public String getQuestiontypename() {
		return questiontypename;
	}

	public void setQuestiontypename(String questiontypename) {
		this.questiontypename = questiontypename;
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
