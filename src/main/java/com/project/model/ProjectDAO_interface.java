package com.project.model;

import java.sql.Date;
import java.util.*;


public interface ProjectDAO_interface {
	public void insert(ProjectVO projectVO);
    public void update(ProjectVO projectVO);
    public void delete(Integer proj_id);
    public ProjectVO findByPrimaryKey(Integer proj_id);//列出某專案
    public List<ProjectVO> getAllSameFmem(Integer f_mem_id); //列出某小農的所有專案
    public List<ProjectVO> getAll();

}
