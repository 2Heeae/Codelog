package com.spring.codelog.user;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.codelog.user.model.UserVO;
import com.spring.codelog.user.service.IUserService;

@RequestMapping("/image")
@RestController
public class ImgController {
	
	@Autowired
	IUserService service;

	//프로필 이미지 파일 보여주기 요청
	@GetMapping("/{userId}")
	public ResponseEntity<byte[]> getUserImgFile(@PathVariable("userId") String userId) {
		System.out.println("프로필이미지 "+userId);
		String fileName = service.getUserImg(userId);
		System.out.println("fileName: " + fileName);
		
		File file = new File("C:\\test\\upload\\" + fileName);
		System.out.println(file);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
		
	}
}
