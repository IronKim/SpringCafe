package store.service;

import java.util.List;

import store.bean.StoreDTO;

public interface StoreService {

	public List<StoreDTO> getStoreList(String region);

	public List<StoreDTO> getStoreListByName(String name);
	
}
