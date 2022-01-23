package com.projPic.model;

import java.util.*;

public interface ProjPicDAO_interface {
    public void insert(ProjPicVO projPicVO);
    public void update(ProjPicVO projPicVO);
    public void delete(Integer proj_pic_id, Integer proj_id);
    public ProjPicVO findByPrimaryKey(Integer proj_id );
//    public List<ProjPicVO> getAll(Integer proj_id);//呈現某專案的所有圖片
//    public List<ProjPicVO> getAll(Map<String, String[]> map); 

}
