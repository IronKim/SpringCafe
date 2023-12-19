package chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chat.bean.ChatDTO;
import chat.service.ChatService;

@Component
@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@GetMapping(value="chat/chat")
	public String chat() {
		return "jsp/chat/chat";
	}
	
	@PostMapping(value="chat/reload")
	@ResponseBody
	public List<ChatDTO> reload(@RequestParam String seq) {
		return chatService.reload(seq);
	}
	
	@PostMapping(value="chat/send")
	@ResponseBody
	public void send(@ModelAttribute ChatDTO chatDTO) {
		chatService.send(chatDTO);
	}
}
