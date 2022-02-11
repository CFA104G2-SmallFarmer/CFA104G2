package com.message.model;

import java.util.List;


public interface MessageDAO_Interface {
	
	public void insert(MessageVO messageVO);

	public void update(MessageVO messageVO);

	public void delete(Integer msg_no);

	public MessageVO findByPrimaryKey(Integer msg_no);

	public List<MessageVO> getAll();

}
