package com.function.model;

import java.util.List;

public interface FunctionDAO {
	
	public void insert(FunctionVO functionVO);
    public void update(FunctionVO functionVO);
    public void delete(Integer func_id);
    public FunctionVO findByPrimaryKey(Integer func_id);
    public List<FunctionVO> getAll();

}
