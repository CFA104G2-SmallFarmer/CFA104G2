package com.proj_collection.model;

import java.util.List;

public interface ProjCollectionDAO_interface {
	public void insert(ProjCollectionVO projCollectionVO);
	
//    public void update(ProjCollectionVO projCollectionVO); //���ݭn
	
    public void delete(Integer proj_id,Integer mem_id);
    
//    public ProjCollectionVO findByPrimaryKey(Integer proj_id,Integer mem_id);//���ݭn

    
    public List<ProjCollectionVO> getAll(Integer mem_id);//�e�{�Y�|�����Ҧ�����
    
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<ProDairyVO> getAll(Map<String, String[]> map); 

	

}
