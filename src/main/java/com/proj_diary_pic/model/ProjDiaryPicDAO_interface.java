package com.proj_diary_pic.model;

import java.sql.Date;
import java.util.List;

public interface ProjDiaryPicDAO_interface {
    public void insert(ProjDiaryPicVO projDiaryPicVO);
    public void update(ProjDiaryPicVO projDiaryPicVO);
    public void delete(Integer dir_pic_id);
    
    //public ProjDiaryPicVO findByPrimaryKey(Integer dir_pic_id);
    
    //public List<ProjDiaryPicVO> getAll();
    
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<ProDairyVO> getAll(Map<String, String[]> map); 

}
