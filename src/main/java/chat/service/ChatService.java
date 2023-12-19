package chat.service;

import java.util.List;

import chat.bean.ChatDTO;

public interface ChatService {

	List<ChatDTO> reload(String seq);

	void send(ChatDTO chatDTO);

}
