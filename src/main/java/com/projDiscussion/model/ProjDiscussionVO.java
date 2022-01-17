package com.projDiscussion.model;

import java.sql.Date;

public class ProjDiscussionVO {
		private Integer comment_id;
		private Integer proj_id;
	    private Integer discussion_id;
	    private Integer mem_id;
	    private Integer f_mem_id;
	    private Date comment_date;
	    
	    
		public Integer getComment_id() {
			return comment_id;
		}
		public void setComment_id(Integer comment_id) {
			this.comment_id = comment_id;
		}
		public Integer getProj_id() {
			return proj_id;
		}
		public void setProj_id(Integer proj_id) {
			this.proj_id = proj_id;
		}
		public Integer getDiscussion_id() {
			return discussion_id;
		}
		public void setDiscussion_id(Integer discussion_id) {
			this.discussion_id = discussion_id;
		}
		public Integer getMem_id() {
			return mem_id;
		}
		public void setMem_id(Integer mem_id) {
			this.mem_id = mem_id;
		}
		public Integer getF_mem_id() {
			return f_mem_id;
		}
		public void setF_mem_id(Integer f_mem_id) {
			this.f_mem_id = f_mem_id;
		}
		public Date getComment_date() {
			return comment_date;
		}
		public void setComment_date(Date comment_date) {
			this.comment_date = comment_date;
		}
	    
	    
	    
}
