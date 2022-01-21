package com.project.model;

import java.util.*;

public interface ProjectDAO_interface {
	public void insert(ProjectVO projectVO);
    public void update(ProjectVO projectVO);
    public void delete(Integer projectVO);
    public ProjectVO findByPrimaryKey(Integer projectVO);
    public List<ProjectVO> getAll();

//  public List<EmpVO> getAll(Map<String, String[]> map); 
}
