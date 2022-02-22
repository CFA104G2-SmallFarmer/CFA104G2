package com.privateMessage.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import com.mem.model.MemVO;

public class PrivateMessageTest {

	public static void main(String[] args) {
		
		PrivateMessageJDBCDAO dao = new PrivateMessageJDBCDAO();
		
//		// 新增
//		PrivateMessageVO privateMessageVO1 = new PrivateMessageVO();
//		privateMessageVO1.setMem_id(77002);
//		privateMessageVO1.setF_mem_id(70002);
//		privateMessageVO1.setP_msg_direct(0);
//		privateMessageVO1.setP_msg_time(new Timestamp(System.currentTimeMillis()));
//		privateMessageVO1.setP_msg_context("哪些人適合喝你們賣場的滴雞精呢？");
//		byte[] pic;
//		try {
//			pic = getPictureByteArray("C:\\Users\\Tibame_T14\\OneDrive\\桌面\\S__25600013.jpg");
//			privateMessageVO1.setP_msg_img(pic);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		System.out.println("圖片新增成功");
//		
//		dao.insert(privateMessageVO1);
//		System.out.println("新增資料成功");
//		
//		// 修改
//		PrivateMessageVO privateMessageVO2 = new PrivateMessageVO();
//		privateMessageVO2.setP_msg_id(2);
//		privateMessageVO2.setMem_id(77003);
//		privateMessageVO2.setF_mem_id(70003);
//		privateMessageVO2.setP_msg_direct(1);
//		privateMessageVO2.setP_msg_time(new Timestamp(System.currentTimeMillis()));
//		privateMessageVO2.setP_msg_context("");
//		byte[] pic;
//		try {
//			pic = getPictureByteArray("C:\\Users\\Tibame_T14\\OneDrive\\桌面\\S__25600013.jpg");
//			privateMessageVO2.setP_msg_img(pic);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		System.out.println("圖片新增成功");
//		
//		dao.update(privateMessageVO2);
//		System.out.println("資料修改成功");
//		
//		// 刪除
//		dao.delete(2);
//		System.out.println("刪除資料成功");
//		
//		// 查詢
		PrivateMessageVO privateMessageVO3 = dao.findByPrimaryKey(5);
		System.out.print(privateMessageVO3.getP_msg_id() + ",");
		System.out.print(privateMessageVO3.getMem_id() + ",");	
		System.out.print(privateMessageVO3.getF_mem_id() + ",");	
		System.out.print(privateMessageVO3.getP_msg_direct() + ",");	
		System.out.print(privateMessageVO3.getP_msg_time() + ",");	
		System.out.print(privateMessageVO3.getP_msg_context() + ",");	
		System.out.print(privateMessageVO3.getP_msg_img() );
		
		// 查詢
		List<PrivateMessageVO> list = dao.getAll();
		for (PrivateMessageVO aPrivateMessage : list) {
			System.out.print(aPrivateMessage.getP_msg_id() + ",");
			System.out.print(aPrivateMessage.getMem_id() + ",");	
			System.out.print(aPrivateMessage.getF_mem_id() + ",");	
			System.out.print(aPrivateMessage.getP_msg_direct() + ",");	
			System.out.print(aPrivateMessage.getP_msg_time() + ",");	
			System.out.print(aPrivateMessage.getP_msg_context() + ",");	
			System.out.print(aPrivateMessage.getP_msg_img() );
			System.out.println();
		}

	}

	// 使用byte[]方式
	public static byte[] getPictureByteArray(String path) throws IOException {
		FileInputStream fis = new FileInputStream(path);
		byte[] buffer = new byte[fis.available()];		// available():資料流有多少bytes資料，算出有多少bytes
		fis.read(buffer);	// 讀取多少bytes資料存入buffer
		fis.close();
		return buffer;
	}

	
}
