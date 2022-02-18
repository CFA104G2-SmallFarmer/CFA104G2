package com.projDiscussion.model;

import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class ProjDiscussionService {
	private ProjDiscussionDAO_interface dao; // 為了將來與框架作結合

	public ProjDiscussionService() {
		dao = new ProjDiscussionJDBCDAO();
	}

	public List<ProjDiscussionVO> updateFirstLayerProjDiscussion(Integer proj_id) {

		List<ProjDiscussionVO> list = dao.getFirstLayerByID(proj_id);

		for (int i = 0; i < list.size(); i++) {
			ProjDiscussionVO projDiscussionVO = list.get(i);
			Integer comment_id = projDiscussionVO.getComment_id();
			projDiscussionVO.setDiscussion_id(comment_id);
			dao.updateFirstLayer(projDiscussionVO);
			System.out.println("comment_id："+comment_id);
		}

		List<ProjDiscussionVO> list2 = dao.getFirstLayerByID(proj_id);
		
		System.out.println("資料庫更新成功");
		return list2;
	}

	public ProjDiscussionVO addProjDiscussion(Integer proj_id, Integer discussion_id, Integer mem_id, Integer f_mem_id,
			String comment_content) {

		ProjDiscussionVO projDiscussionVO = new ProjDiscussionVO();

		projDiscussionVO.setProj_id(proj_id);
		projDiscussionVO.setDiscussion_id(discussion_id);
		projDiscussionVO.setMem_id(mem_id);
		projDiscussionVO.setF_mem_id(f_mem_id);
		projDiscussionVO.setComment_content(comment_content);

		dao.insert(projDiscussionVO);

		return projDiscussionVO;
	}

	public ProjDiscussionVO updateProjDiscussion(Integer comment_id, String comment_content) {

		ProjDiscussionVO projDiscussionVO = new ProjDiscussionVO();

		projDiscussionVO.setMem_id(comment_id);
		projDiscussionVO.setComment_content(comment_content);

		dao.update(projDiscussionVO);

		return projDiscussionVO;
	}

	public void deleteProjDiscussion(Integer comments_id) {
		dao.delete(comments_id);
	}

	public List<ProjDiscussionVO> getAllSameProjDiscussion(Integer proj_id) {
		return dao.getAll(proj_id);
	}

//	public LinkedList getAllSameProjDiscussionNestedList(Integer proj_id) {
////      [1[2,3],4[6],5]
////		建一個空的來裝全部的東西
//		LinkedList nestedList = new LinkedList();
//		LinkedList nestedListfinal = new LinkedList();
////		取出某專案的所有留言
//		List<ProjDiscussionVO> list = getAllSameProjDiscussion(proj_id);
//		nestedListfinal = getAllSameProjDiscussionInner(list, nestedList);
//		System.out.println("成功");
//
//		Iterator objs2 = nestedListfinal.iterator();
//		while (objs2.hasNext())
//			System.out.println(objs2.next());
//
//		return nestedListfinal;
//	}

//	public LinkedList getAllSameProjDiscussionInner(List<ProjDiscussionVO> list, LinkedList nestedList) {
//		String stop = "no";
//
////		看起來從最內層往外建比較合理
////      取出所有留言的discussion_id(依附的討論串號)
//		Set<Integer> set = new TreeSet<Integer>();
//		for (int i = 0; i < list.size(); i++) {
//			ProjDiscussionVO projDiscussionVO = list.get(i);
//			if (projDiscussionVO.getDiscussion_id() != projDiscussionVO.getComment_id()) {
//				set.add(projDiscussionVO.getDiscussion_id());
//			}
//		}
//		Object obj = Collections.max(set);
//		System.out.println(obj); // 成功取出最底層且最大的數"4"
//
////	取出最底層且最大的數"4"的留言
//		for (int i = 0; i < list.size(); i++) {
//			ProjDiscussionVO projDiscussionVO = list.get(i);
//			LinkedList inner = new LinkedList();
//			LinkedList outer = new LinkedList();
//			if (projDiscussionVO.getDiscussion_id() == obj) {
//				if (projDiscussionVO.getComment_id() != projDiscussionVO.getDiscussion_id()) {
//					inner.add(projDiscussionVO);
//					list.remove(projDiscussionVO);
//				}
//			}
//			if (projDiscussionVO.getComment_id() == obj) {
//				outer.add(projDiscussionVO);
//				list.remove(projDiscussionVO);
//			}
//			outer.add(inner);
//			outer.add(nestedList);
//			nestedList = outer;
//
//			if (projDiscussionVO.getComment_id() == projDiscussionVO.getDiscussion_id()) {
//				stop = "yes";
//			}
//		}
//		if (stop.equals("no")) {
//			return getAllSameProjDiscussionInner(list, nestedList);
//		} else  {
//			return nestedList;
//		}
//	}
}
