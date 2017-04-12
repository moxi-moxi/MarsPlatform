package ac.cetc15.proj.model;

import java.io.Serializable;
import java.util.Date;




/**
 * 项目基本信息
 * 
 * @author mox
 * @email moxi-moxi@hotmail.com
 * @date 2017-03-29 14:26:15
 */
public class XmjbxxEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//标识
	private Long id;
	//项目名称
	private String xmmc;
	//项目类型  0：研制  1：集成  2：论证  99：其它
	private Integer xmlx;
	//项目性质  0：明确任务  1：前期跟踪
	private Integer xmxz;
	//预计合同额
	private Integer yjhte;
	//负责人  ref@sys_user.user_id
	private Long fzrId;
	
	private String fzrName;
	//起始日期
	private String qsrq;
	//截止日期
	private String jzrq;
	
	private Integer xmzt;
	//项目描述
	private String xmms;

	/**
	 * 设置：标识
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：标识
	 */
	public Long getId() {
		return id;
	}
	/**
	 * 设置：项目名称
	 */
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	/**
	 * 获取：项目名称
	 */
	public String getXmmc() {
		return xmmc;
	}
	/**
	 * 设置：项目类型  0：研制  1：集成  2：论证  99：其它
	 */
	public void setXmlx(Integer xmlx) {
		this.xmlx = xmlx;
	}
	/**
	 * 获取：项目类型  0：研制  1：集成  2：论证  99：其它
	 */
	public Integer getXmlx() {
		return xmlx;
	}
	/**
	 * 设置：项目性质  0：明确任务  1：前期跟踪
	 */
	public void setXmxz(Integer xmxz) {
		this.xmxz = xmxz;
	}
	/**
	 * 获取：项目性质  0：明确任务  1：前期跟踪
	 */
	public Integer getXmxz() {
		return xmxz;
	}
	/**
	 * 设置：预计合同额
	 */
	public void setYjhte(Integer yjhte) {
		this.yjhte = yjhte;
	}
	/**
	 * 获取：预计合同额
	 */
	public Integer getYjhte() {
		return yjhte;
	}
	/**
	 * 设置：负责人  ref@sys_user.user_id
	 */
	public void setFzrId(Long fzrId) {
		this.fzrId = fzrId;
	}
	/**
	 * 获取：负责人  ref@sys_user.user_id
	 */
	public Long getFzrId() {
		return fzrId;
	}
	/**
	 * 设置：起始日期
	 */
	public void setQsrq(String qsrq) {
		this.qsrq = qsrq;
	}
	/**
	 * 获取：起始日期
	 */
	public String getQsrq() {
		return qsrq;
	}
	/**
	 * 设置：截止日期
	 */
	public void setJzrq(String jzrq) {
		this.jzrq = jzrq;
	}
	/**
	 * 获取：截止日期
	 */
	public String getJzrq() {
		return jzrq;
	}
	/**
	 * 设置：项目描述
	 */
	public void setXmms(String xmms) {
		this.xmms = xmms;
	}
	/**
	 * 获取：项目描述
	 */
	public String getXmms() {
		return xmms;
	}
	
	public String getFzrName() {
		return fzrName;
	}
	
	public void setFzrName(String fzrName) {
		this.fzrName = fzrName;
	}
	public Integer getXmzt() {
		return xmzt;
	}
	public void setXmzt(Integer xmzt) {
		this.xmzt = xmzt;
	}
}
