package com.kosa.myapp.diner.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosa.myapp.diner.controller.DinerController;
import com.kosa.myapp.diner.dao.IDinerMenuRepository;
import com.kosa.myapp.diner.model.MenuVO;
import com.kosa.myapp.diner.service.IDinerMenuService;

@Service
public class DinerMenuService implements IDinerMenuService{
	static final Logger logger = LoggerFactory.getLogger(DinerController.class);
	
	@Autowired
	IDinerMenuRepository dinerMenuRepository;
	
	@Override
	public List<MenuVO> selectAllMenu() {
		logger.info("service/selectAllMenu :" + dinerMenuRepository.selectAllMenu());
		return dinerMenuRepository.selectAllMenu();
	}
	
	
	@Override
	public void insertNewMenu(MenuVO menu) {
		menu.setMenuId(dinerMenuRepository.selectMaxManuId());
		dinerMenuRepository.insertNewMenu(menu);
	}

	@Override
	public void updateMenu(MenuVO menu) {
		dinerMenuRepository.updateMenu(menu);
	}

	@Override
	public void deleteMenu(int menuId) {
		dinerMenuRepository.deleteMenu(menuId);
	}


	@Override
	public String selectMenuNameByMenuId(int menuId) {
		return dinerMenuRepository.selectMenuNameByMenuId(menuId);
	}
}
