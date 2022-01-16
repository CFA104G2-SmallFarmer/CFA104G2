package com.homeSlideShow.model;

import java.util.List;

public interface HomeSlideShowDAO {
	
	public void insert(HomeSlideShowVO announcementVO);
    public void update(HomeSlideShowVO announcementVO);
    public void delete(Integer hss_id);
    public HomeSlideShowVO findByPrimaryKey(Integer hss_id);
    public List<HomeSlideShowVO> getAll();
	
}
