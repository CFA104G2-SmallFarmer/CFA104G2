package com.projPic.model;

import java.util.*;

public interface ProjPicDAO_interface {
    public void insert(ProjPicVO projPicVO);
//    update感覺用不到的樣子
    public void update(ProjPicVO projPicVO);
    public void delete(Integer proj_pic_id);
    public ProjPicVO findByPrimaryKey(Integer proj_pic_id );//呈現某圖
    public List<ProjPicVO> getAllSameProj(Integer proj_id);//呈現某專案的所有圖片
//    public List<ProjPicVO> getAll(Map<String, String[]> map); 
// test
}
