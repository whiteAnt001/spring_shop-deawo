package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name="imagebbs_tbl")
public class ImagebbsORM {
	@Id
	private Integer w_id;
	private Integer group_id;
	private Integer parent_id;
	private Integer order_no;
	private String title;
	private String content;
	
	@ManyToOne
	@JoinColumn(name="writer")
	private UserORM user;
	
	@Temporal(TemporalType.DATE)
	private Date w_date;
	private String Imagename;
	private String password;
	
	public Integer getW_id() {
		return w_id;
	}
	public void setW_id(Integer w_id) {
		this.w_id = w_id;
	}
	public Integer getGroup_id() {
		return group_id;
	}
	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public Integer getOrder_no() {
		return order_no;
	}
	public void setOrder_no(Integer order_no) {
		this.order_no = order_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public UserORM getUser() {
		return user;
	}
	public void setUser(UserORM user) {
		this.user = user;
	}
	public Date getW_date() {
		return w_date;
	}
	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}
	public String getImagename() {
		return Imagename;
	}
	public void setImagename(String imagename) {
		Imagename = imagename;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
