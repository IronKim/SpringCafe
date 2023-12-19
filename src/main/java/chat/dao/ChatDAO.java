package chat.dao;

import java.util.List;

import chat.bean.ChatDTO;

public interface ChatDAO {

	List<ChatDTO> reload(String seq);

	void send(ChatDTO chatDTO);
}
