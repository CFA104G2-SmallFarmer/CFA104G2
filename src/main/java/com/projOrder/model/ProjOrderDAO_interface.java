package com.projOrder.model;

import java.util.*;

public interface ProjOrderDAO_interface {
	public void insert(ProjOrderVO projOrderVO);
    public void update(ProjOrderVO projOrderVO);
    public void delete(Integer order_id);
    public ProjOrderVO findByPrimaryKey(Integer order_id);
    public List<ProjOrderVO> getAll();

//  public List<ProjOrderVO> getAll(Map<String, String[]> map); 
}
