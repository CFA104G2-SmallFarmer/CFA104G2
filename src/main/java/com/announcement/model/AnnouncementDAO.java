package com.announcement.model;

import java.util.List;

public interface AnnouncementDAO {
	
	public void insert(AnnouncementVO announcementVO);
    public void update(AnnouncementVO announcementVO);
    public void delete(Integer announce_id);
    public AnnouncementVO findByPrimaryKey(Integer announce_id);
    public List<AnnouncementVO> getAll();

}
