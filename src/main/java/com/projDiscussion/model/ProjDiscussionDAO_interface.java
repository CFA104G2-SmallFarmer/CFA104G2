package com.projDiscussion.model;

import java.util.*;

public interface ProjDiscussionDAO_interface {
	public void insert(ProjDiscussionVO projDiscussionVO);
    public void update(ProjDiscussionVO projDiscussionVO);
    public void delete(Integer comments_id);
    public ProjDiscussionVO findByPrimaryKey(Integer comments_id);
    public List<ProjDiscussionVO> getAll();

//  public List<projDiscussionVO> getAll(Map<String, String[]> map); 
}
