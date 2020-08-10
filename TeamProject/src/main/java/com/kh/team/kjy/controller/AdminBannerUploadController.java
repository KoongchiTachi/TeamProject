package com.kh.team.kjy.controller;

import java.io.File;
import java.io.FileInputStream;
import javax.annotation.Resource;
import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.team.util.BannerFileUploadUtil;

@RestController
@RequestMapping("/uploadBanner")
public class AdminBannerUploadController {
	
	@Resource
	private String bannerUploadPath;
	
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST)
	public String uploadAjax(MultipartFile file) throws Exception {
		String originalName = file.getOriginalFilename();
		String dirPath = BannerFileUploadUtil.uploadFile(bannerUploadPath, originalName, file.getBytes());
		
		return dirPath.replace("\\", "/");
	}
	
	@RequestMapping(value = "/displayFile", method=RequestMethod.GET)
	public byte[] displayFile(@RequestParam("bn_img") String bn_img) throws Exception {
		String filePath = bannerUploadPath + File.separator + bn_img;
		String rFilePath = filePath.replace("/", "\\");
		FileInputStream fis = new FileInputStream(rFilePath);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}
	
	@RequestMapping(value = "/deleteFile", method=RequestMethod.GET)
	public String deleteFile(String filename) throws Exception {
		String serverPath = bannerUploadPath + File.separator + filename;
		String front = filename.substring(0, filename.lastIndexOf("/") + 1);
		String rear = filename.substring(filename.lastIndexOf("/") + 1);
		String smServerPath = bannerUploadPath + File.separator + front + "sm_" + rear;
		File f = new File(serverPath);
		f.delete();
		boolean result = BannerFileUploadUtil.isImage(filename);
		if (result == true) {
			File f2 = new File(smServerPath);
			f2.delete();
		}
		return "success";
	}

}