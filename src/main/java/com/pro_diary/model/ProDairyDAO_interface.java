package com.pro_diary.model;

import java.sql.Date;
import java.util.*;

public interface ProDairyDAO_interface {
    public void insert(ProDairyVO proDairyVO);
    public void update(ProDairyVO proDairyVO);
    public void delete(Integer dir_id);
    public ProDairyVO findByPrimaryKey(Integer dir_id);
    
    public List<ProDairyVO> getAllSameDay(Date dir_upload_date);// �C�X�P�@�Ѫ��Ҧ���x
    public List<ProDairyVO> getAll(Integer proj_id); //�C�X�o�ӱM�ת��Ҧ���x
    
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<ProDairyVO> getAll(Map<String, String[]> map); 

}
