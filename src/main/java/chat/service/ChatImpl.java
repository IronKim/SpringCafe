package chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chat.bean.ChatDTO;
import chat.dao.ChatDAO;

@Service
public class ChatImpl implements ChatService {

	@Autowired
	private ChatDAO chatDAO;
	
	@Override
	public List<ChatDTO> reload(String seq) {
		return chatDAO.reload(seq);
	}

	@Override
	public void send(ChatDTO chatDTO) {
		chatDAO.send(chatDTO);
	}

}
