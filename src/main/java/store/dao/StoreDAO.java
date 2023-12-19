package store.dao;

import java.util.List;

import store.bean.StoreDTO;

public interface StoreDAO {

	public List<StoreDTO> getStoreList(String region);

	public List<StoreDTO> getStoreListByName(String name);

}
