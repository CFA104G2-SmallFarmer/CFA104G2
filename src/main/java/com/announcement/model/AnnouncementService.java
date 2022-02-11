package com.announcement.model;

import java.util.List;

public class AnnouncementService {

	private AnnouncementDAO_Interface dao;

	public AnnouncementService() {
		dao = new AnnouncementDAO();
	}

	public AnnouncementVO addAnnounce(Integer announce_type, Integer admin_id, java.sql.Date edit_time,
			String announce_title, String announce_content) {

		AnnouncementVO announcementVO = new AnnouncementVO();

		announcementVO.setAnnounce_type(announce_type);
		announcementVO.setAdmin_id(admin_id);
		announcementVO.setEdit_time(edit_time);
		announcementVO.setAnnounce_title(announce_title);
		announcementVO.setAnnounce_content(announce_content);
		dao.insert(announcementVO);

		return announcementVO;

	}

	public AnnouncementVO updateAnnounce(Integer announce_id, Integer announce_type, Integer admin_id,
			java.sql.Date edit_time, String announce_title, String announce_content) {

		AnnouncementVO announcementVO = new AnnouncementVO();

		announcementVO.setAnnounce_id(announce_id);
		announcementVO.setAnnounce_type(announce_type);
		announcementVO.setAdmin_id(admin_id);
		announcementVO.setEdit_time(edit_time);
		announcementVO.setAnnounce_title(announce_title);
		announcementVO.setAnnounce_content(announce_content);
		dao.update(announcementVO);

		return announcementVO;

	}

	public void deleteAnnounce(Integer announce_id) {
		dao.delete(announce_id);
	}

	public AnnouncementVO getOneAnnounce(Integer announce_id) {
		return dao.findByPrimaryKey(announce_id);
	}

	public List<AnnouncementVO> getAll() {
		return dao.getAll();
	}

}
