package com.privateMessage.model;

import java.util.List;
import java.util.Map;

import com.mem.model.MemVO;

public interface PrivateMessageDAO_interface {
	 public void insert(PrivateMessageVO privateMessageVO);
     public void update(PrivateMessageVO privateMessageVO);
     public void delete(Integer p_msg_id);
     public PrivateMessageVO findByPrimaryKey(Integer p_msg_id);
     public List<PrivateMessageVO> getAll();
     //萬用複合查詢(傳入參數型態Map)(回傳 List)
   public List<PrivateMessageVO> getAll(Map<String, String[]> map); 
}
