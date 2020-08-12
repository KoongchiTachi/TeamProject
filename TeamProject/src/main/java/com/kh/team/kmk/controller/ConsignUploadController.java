package com.kh.team.kmk.controller;

import java.io.File;
import java.io.FileInputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.team.util.QnaFileUploadUtil;

@RestController
@RequestMapping("/c_upload")
public class ConsignUploadController {

	@Resource
	private String p_imgUploadPath;
	
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST)
	public String uploadAjax(MultipartFile file) throws Exception {
		System.out.println("file: " + file);
		String originalName = file.getOriginalFilename();
		long size = file.getSize();
		System.out.println("originalName: " + originalName);
		System.out.println("size: " + size);
		System.out.println("uploadPath: " + p_imgUploadPath);
		String dirPath = QnaFileUploadUtil.uploadFile(p_imgUploadPath, originalName, file.getBytes());
		System.out.println("dirPath: " + dirPath);
		
		return dirPath.replace("\\", "/");
	}
	
	@RequestMapping(value = "/displayFile", method=RequestMethod.GET)
	public byte[] displayFile(@RequestParam("fileName") String fileName) throws Exception {
		System.out.println("fileName: " + fileName);
		String filePath = p_imgUploadPath + File.separator + fileName;
		String rFilePath = filePath.replace("/", "\\");
		FileInputStream fis = new FileInputStream(rFilePath);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}
	
	@RequestMapping(value = "/deleteFile", method=RequestMethod.GET)
	public String deleteFile(String filename) throws Exception {
		String serverPath = p_imgUploadPath + File.separator + filename;
		String front = filename.substring(0, filename.lastIndexOf("/") + 1);
		String rear = filename.substring(filename.lastIndexOf("/") + 1);
		String smServerPath = p_imgUploadPath + File.separator + front + "sm_" + rear;
		File f = new File(serverPath);
		f.delete();
		boolean result = QnaFileUploadUtil.isImage(filename);
		if (result == true) {
			File f2 = new File(smServerPath);
			f2.delete();
		}
		return "success";
	}

}