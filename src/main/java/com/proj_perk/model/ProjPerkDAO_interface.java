package com.proj_perk.model;

import java.util.List;


public interface ProjPerkDAO_interface {
    public void insert(ProjPerkVO projPerkVO);
    public void update(ProjPerkVO projPerkVO);
    public void delete(Integer perk_id);
    public ProjPerkVO findByPrimaryKey(Integer perk_id);
    
    public List<ProjPerkVO> getAll(Integer proj_id); //�S�w�M�פU���Ҧ��^�X���
    
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<ProDairyVO> getAll(Map<String, String[]> map); 

}
