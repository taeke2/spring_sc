package com.care.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

// 이거 쓰려면 버전 업데이트 해야함 -> pom.xml 에서 3.1.1 을 4.3.4 로 바꿈
@RestController // 이걸 쓰면 ResponseBody 이런거 안써도됨
// 페이지를 꾸미려면 Controller를 쓰고, 단순하게 하는거면 RestController를 쓰는게 효율적이고 좋다. responsebody 안써도되는 점 등
public class TestController {
	static int aaa = 0;

	@GetMapping("user/{name}")
	public String getUser(@PathVariable String name	) {
		System.out.println("넘겨받은 사용자 이름 : " + name);
		return "test";
	}
	
	@GetMapping(value = "ajax_result", produces = "application/json;charset=utf8")
	// @ResponseBody // 아약스 ajax 이용할때 리턴값을 사용하려면 이걸 써야한다.
	public String ajax_g() throws JsonProcessingException {	// return이 String형으로만 된다.
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		UserDTO dto01 = new UserDTO();
		UserDTO dto02 = new UserDTO();
		dto01.setName("홍길동");
		dto01.setAge("20");
		dto02.setName("김개똥");
		dto02.setAge("30");
		list.add(dto01);
		list.add(dto02);
		ObjectMapper mapper = new ObjectMapper();	// String형으로 반환하기위해 사용됨
		String strJson = mapper.writeValueAsString(list);
		return strJson;
	}
	
	@PostMapping(value = "ajax_result", produces = "application/text;charset=utf8")
	public String ajax_post() {
		return "post : 데이터 추가할 때";
	}

	@PutMapping(value = "ajax_result", produces = "application/text;charset=utf8")
	public String ajax_put() {
		return "put : 수정할 때";
	}

	@DeleteMapping(value = "ajax_result", produces = "application/text;charset=utf8")
	public String ajax_del() {
		return "del : 삭제할 때";
	}
}
