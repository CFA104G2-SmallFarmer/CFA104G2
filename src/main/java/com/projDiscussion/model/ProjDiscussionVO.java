package com.projDiscussion.model;

import java.sql.Date;

public class ProjDiscussionVO {
		private Integer comment_ID;
		private Integer proj_ID;
	    private Integer discussion_ID;
	    private Integer mem_ID;
	    private Integer f_mem_ID;
	    private Date comment_date;
	    
	    
		public Integer getComment_ID() {
			return comment_ID;
		}
		public void setComment_ID(Integer comment_ID) {
			this.comment_ID = comment_ID;
		}
		public Integer getProj_ID() {
			return proj_ID;
		}
		public void setProj_ID(Integer proj_ID) {
			this.proj_ID = proj_ID;
		}
		public Integer getDiscussion_ID() {
			return discussion_ID;
		}
		public void setDiscussion_ID(Integer discussion_ID) {
			this.discussion_ID = discussion_ID;
		}
		public Integer getMem_ID() {
			return mem_ID;
		}
		public void setMem_ID(Integer mem_ID) {
			this.mem_ID = mem_ID;
		}
		public Integer getF_mem_ID() {
			return f_mem_ID;
		}
		public void setF_mem_ID(Integer f_mem_ID) {
			this.f_mem_ID = f_mem_ID;
		}
		public Date getComment_date() {
			return comment_date;
		}
		public void setComment_date(Date comment_date) {
			this.comment_date = comment_date;
		}
	    
	    
	    
}
