package com.fMem.model;

import java.util.*;

public interface FMemDAO_interface {
          public void insert(FMemVO fMemVO);
          public void update(FMemVO fMemVO);
          public void delete(Integer f_mem_id);
          public FMemVO findByPrimaryKey(Integer f_mem_id);
          public List<FMemVO> getAll();
//          //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
        public List<FMemVO> getAll(Map<String, String[]> map);
}