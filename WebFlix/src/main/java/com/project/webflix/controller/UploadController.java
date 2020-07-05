package com.project.webflix.controller;

import org.springframework.http.MediaType;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.webflix.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class UploadController {
	private static final String uploadFolder = "c:\\upload";

	// 파일생성
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

	@GetMapping("/uploadAjax")
	public String openAjaxUpload() {
		return "uploadAjax";
	}
	
/*
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxAction(MultipartFile[] uploadFile) {

		// 폴더 생성
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload path: " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdir();
		}

		log.info("update ajax post.....");

		// 폴더 날짜 생성	 yyyy/MM//dd folder		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("----------------");
			log.info("upload file name : " + multipartFile.getOriginalFilename());
			log.info("upload file size : " + multipartFile.getSize());
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name : " + uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
						
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				
				multipartFile.transferTo(saveFile);
			}catch (Exception e) {
				e.printStackTrace();
			}// end catch
		} // end for
	}
	*/
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile){
		
		List<AttachFileDTO> list = new ArrayList<>();
		//String uploadFolder = "C:\\upload";
		
		String uploadFolderPath = getFolder();
		// make folder-=------
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		// make yyyy/MM/dd folder
		
		for(MultipartFile multipartFile : uploadFile) {
			AttachFileDTO attachDTO = new AttachFileDTO();
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name : " + uploadFileName);
			attachDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				
				list.add(attachDTO);				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}// end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	/**
	 * 
	 * @param userAgent
	 * @param fileName
	 * @Date 20-06-25 
	 * @author lsh
	 *  DOWNLOADfILE 메소드는 @RequestHeader를 이용해서 필요해서 필요한 HTTP 헤더 메시지의 내용을 수집할 수 있다,
	 *  이를 이용해서 "User-Agent"의 정보를 파악하고, 값이 'MSIE" 혹은 "Trident("IE)인 경우에는 다른 방식으로 처리하도록 함
	 * 
	 */
	@GetMapping(value ="/download",
				produces = {
						MediaType.APPLICATION_OCTET_STREAM_VALUE, 
						MediaType.APPLICATION_JSON_UTF8_VALUE
				})
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestParam("fileName") String fileName){
		
		log.info("download file : " + fileName);
		Resource resource = new FileSystemResource("c:\\upload\\" + fileName);
		log.info("resource : " + resource);
		

		String resourceName =resource.getFilename();
		HttpHeaders headers = new HttpHeaders();
		
		try {
						headers.add("Content-Disposition", 
					"attachment; filename=" + new String(resourceName.getBytes("UTF-8"),"ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
		
	}
	
}
