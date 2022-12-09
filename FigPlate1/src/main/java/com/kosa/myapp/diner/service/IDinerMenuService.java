package com.kosa.myapp.diner.service;

import java.util.List;

import com.kosa.myapp.diner.model.MenuVO;

public interface IDinerMenuService {
	List<MenuVO> selectAllMenu(); //menu리스트 가져옴
	
	void insertNewMenu(MenuVO menu);
	void updateMenu(MenuVO menu);
	void deleteMenu(int menuId);
	
	String selectMenuNameByMenuId(int menuId);
}
