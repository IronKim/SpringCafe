package store.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import menu.bean.MenuDTO;
import store.bean.StoreDTO;
import store.dao.StoreDAO;

@Service
public class StoreServiceImpl implements StoreService{
	
	@Autowired
	private StoreDAO storeDAO;
	
	@Override
	public List<StoreDTO> getStoreList(String region) {
		return storeDAO.getStoreList(region);
	}

	@Override
	public List<StoreDTO> getStoreListByName(String name) {
		
		if(name.equals("")) {
			System.out.println("들어옴");
			List<StoreDTO> randomStore = new ArrayList<StoreDTO>();
			List<StoreDTO> getStore = storeDAO.getStoreListByName(name);
			System.out.println(getStore.size());
			while(randomStore.size() < 5) { 
				StoreDTO storeDTO = getStore.get((int)(Math.random() * getStore.size()));
				
				randomStore.add(storeDTO);
//				if(!getStore.stream().anyMatch(storeDTO1 -> storeDTO1.equals(storeDTO))) {
//					System.out.println("들어옴2");
//					randomStore.add(storeDTO);
//				}
			}
			for (StoreDTO storeDTO : randomStore) {
				System.out.println(storeDTO.getName());
			}
			return randomStore;
		}
		
		return storeDAO.getStoreListByName(name);
	}
	
}
