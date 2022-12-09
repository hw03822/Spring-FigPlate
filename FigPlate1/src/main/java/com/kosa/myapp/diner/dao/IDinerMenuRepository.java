package com.kosa.myapp.diner.dao;

import java.util.List;

import com.kosa.myapp.diner.model.MenuVO;

public interface IDinerMenuRepository {
	int selectMaxManuId();
	List<MenuVO> selectAllMenu();
	void insertNewMenu(MenuVO menu);
	void updateMenu(MenuVO menu);
	void deleteMenu(int menuId);
	
	String selectMenuNameByMenuId(int menuId);
}
