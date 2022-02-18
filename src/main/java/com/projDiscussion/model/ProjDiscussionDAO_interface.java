package com.projDiscussion.model;

import java.util.*;

public interface ProjDiscussionDAO_interface {
	public void insert(ProjDiscussionVO projDiscussionVO);
    public void update(ProjDiscussionVO projDiscussionVO);
    public void delete(Integer comments_id);
//  取出某專案下的所有留言
    public List<ProjDiscussionVO> getAll(Integer proj_id);

//  public ProjDiscussionVO findByPrimaryKey(Integer comments_id);
//  public List<projDiscussionVO> getAll(Map<String, String[]> map); 
    
    public List<ProjDiscussionVO> getFirstLayerByID(Integer proj_id);
    public void updateFirstLayer(ProjDiscussionVO projDiscussionVO);
}
