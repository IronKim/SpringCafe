package board.bean;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class BoardPaging {
	private int currentPage; // 현재 페이지
	private int pageBlock; //[이전][1][2][3][다음]
	private int pageSize; //1페이지당 5개씩
	private int totalA; // 총 글 갯수
	private StringBuffer pagingHTML; // String : StringBuffer 차이 ?? String은 편집이 안댐
	
	public void makePagingHTML() {
	    pagingHTML = new StringBuffer();

	    int totalP = (totalA + pageSize - 1) / pageSize; // 총 페이지 수

	    int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
	    int endPage = startPage + pageBlock - 1;
	    if (endPage > totalP) endPage = totalP;

	    pagingHTML.append("<ul class='pagination justify-content-center'>"); // 페이징 컨테이너 (가운데 정렬)

	    if (startPage != 1) {
	        pagingHTML.append("<li class='page-item'><a class='page-link custom-link' style='color:black' href='javascript:userPaging(" + (startPage - 1) + ")' aria-label='Previous'>&laquo;</a></li>");
	    }

	    for (int i = startPage; i <= endPage; i++) {
	        if (i == currentPage) {
	            pagingHTML.append("<li class='page-item active'><span style='background-color:#265B3D; border-color:black;' class='page-link custom-link'>" + i + "<span class='sr-only'>(current)</span></span></li>");
	        } else {
	            pagingHTML.append("<li class='page-item'><a class='page-link custom-link' style='color:black' href='javascript:userPaging(" + i + ")'>" + i + "</a></li>");
	        }
	    }

	    if (endPage < totalP) {
	        pagingHTML.append("<li class='page-item'><a class='page-link custom-link' style='color:black' href='javascript:userPaging(" + (endPage + 1) + ")' aria-label='Next'>&raquo;</a></li>");
	    }

	    pagingHTML.append("</ul>"); // 페이징 컨테이너 닫기
	}
}