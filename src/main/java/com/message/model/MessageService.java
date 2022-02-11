package com.message.model;

import java.util.List;

public class MessageService {

	private MessageDAO_Interface dao;

	public MessageService() {
		dao = new MessageDAO();
	}

	public MessageVO addMsg(Integer mem_id, Integer mem_id_send, java.sql.Date msg_time, String msg, Integer read_state) {
		MessageVO messageVO = new MessageVO();
		messageVO.setMem_id(mem_id);
		messageVO.setMem_id_send(mem_id_send);
		messageVO.setMsg_time(msg_time);
		messageVO.setMsg(msg);
		messageVO.setRead_state(read_state);
		dao.insert(messageVO);

		return messageVO;
	}

	public MessageVO updateMsg(Integer msg_no, Integer mem_id, Integer mem_id_send, java.sql.Date msg_time, String msg,
			Integer read_state) {
		MessageVO messageVO = new MessageVO();
		messageVO.setMsg_no(msg_no);
		messageVO.setMem_id(mem_id);
		messageVO.setMem_id_send(mem_id_send);
		messageVO.setMsg_time(msg_time);
		messageVO.setMsg(msg);
		messageVO.setRead_state(read_state);
		dao.update(messageVO);

		return messageVO;
	}
	
	public void deleteMsg(Integer msg_no) {
		dao.delete(msg_no);
	}
	
	public MessageVO getOneMsg(Integer msg_no) {
		return dao.findByPrimaryKey(msg_no);
	}
	
	public List<MessageVO> getAll(){
		return dao.getAll();
	}

}
