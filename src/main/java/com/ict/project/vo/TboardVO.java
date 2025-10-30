package com.ict.project.vo;

public class TboardVO {
//	b_idx      BIGINT AUTO_INCREMENT PRIMARY KEY,
//	b_title    brand
//	b_content  name
//	b_loc      website_link
//	b_lat      created_at
//	b_lon      updated_at
//	b_img      image_link
//	b_theme    category
//	b_time     updated_at
//	b_tel      ?
//	b_url      website_link
//	b_like     rating
//	b_hits     rating
//	b_like_active    ? 	
	private int b_idx, b_like, b_hits, b_like_active;
<<<<<<< HEAD
<<<<<<< HEAD
	private String	b_title, b_content,	b_loc,	b_lat,	b_lon,	b_img,	b_theme, b_time, b_tel,	b_url;
	
=======
=======
>>>>>>> c7928282cd13b86c656f59ca0147341b6c71904d
	private String	b_title, b_content,	b_loc,	b_lat,	b_lon,	b_img,	b_theme, b_time, b_tel,	b_url, b_local, b_addr;
	
	
	public String getB_addr()
	{
		return b_addr;
	}
	public void setB_addr(String b_addr)
	{
		this.b_addr = b_addr;
	}
	public String getB_local()
	{
		return b_local;
	}
	public void setB_local(String b_local)
	{
		this.b_local = b_local;
	}
<<<<<<< HEAD
>>>>>>> cc4b71a9b973bf05af1c99f9f98eaedf5c1c4fff
=======
>>>>>>> c7928282cd13b86c656f59ca0147341b6c71904d
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public int getB_like() {
		return b_like;
	}
	public void setB_like(int b_like) {
		this.b_like = b_like;
	}
	public int getB_hits() {
		return b_hits;
	}
	public void setB_hits(int b_hits) {
		this.b_hits = b_hits;
	}
	public int getB_like_active() {
		return b_like_active;
	}
	public void setB_like_active(int b_like_active) {
		this.b_like_active = b_like_active;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_loc() {
		return b_loc;
	}
	public void setB_loc(String b_loc) {
		this.b_loc = b_loc;
	}
	public String getB_lat() {
		return b_lat;
	}
	public void setB_lat(String b_lat) {
		this.b_lat = b_lat;
	}
	public String getB_lon() {
		return b_lon;
	}
	public void setB_lon(String b_lon) {
		this.b_lon = b_lon;
	}
	public String getB_img() {
		return b_img;
	}
	public void setB_img(String b_img) {
		this.b_img = b_img;
	}
	public String getB_theme() {
		return b_theme;
	}
	public void setB_theme(String b_theme) {
		this.b_theme = b_theme;
	}
	public String getB_time() {
		return b_time;
	}
	public void setB_time(String b_time) {
		this.b_time = b_time;
	}
	public String getB_tel() {
		return b_tel;
	}
	public void setB_tel(String b_tel) {
		this.b_tel = b_tel;
	}
	public String getB_url() {
		return b_url;
	}
	public void setB_url(String b_url) {
		this.b_url = b_url;
	}
	
}
