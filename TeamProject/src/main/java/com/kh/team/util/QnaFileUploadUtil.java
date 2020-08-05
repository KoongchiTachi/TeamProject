package com.kh.team.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Calendar;
import java.util.UUID;
import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class QnaFileUploadUtil {

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		
		UUID uuid = UUID.randomUUID();
		String datePath = calcPath(uploadPath);
		String dirPath = datePath + File.separator + uuid + "_" + originalName;
		String filePath = uploadPath + File.separator + dirPath;
		File target = new File(filePath);
		FileCopyUtils.copy(fileData, target);
		boolean result = isImage(originalName);
		if (result == true) {
			makeThumbnail(filePath);
		}
		return dirPath;
	}
	
	public static boolean isImage(String filename) throws Exception {
		String extName = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();
		if (extName.equals("JPG") || extName.equals("GIF") || extName.equals("PNG")) {
			return true;
		}
		return false;
	}
	
	private static void makeThumbnail(String filePath)  throws Exception {
		int lastSlashIndex = filePath.lastIndexOf("\\");
		String front = filePath.substring(0, lastSlashIndex + 1);
		String rear = filePath.substring(lastSlashIndex + 1);
		String thumbnailName = front + "sm_" + rear;
		BufferedImage srcImage = ImageIO.read(new File(filePath));
		
		BufferedImage destImage = Scalr.resize(srcImage,
											   Scalr.Method.AUTOMATIC,
											   Scalr.Mode.FIT_TO_HEIGHT,
											   65);
		File thumbFile = new File(thumbnailName);
		ImageIO.write(destImage, getFormatName(thumbnailName), thumbFile);
	}
	
	private static String getFormatName(String fileName) {
		int dotIndex = fileName.lastIndexOf(".");
		String extName = fileName.substring(dotIndex + 1);
		return extName.toUpperCase();
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		int year =  cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		String dateString = year + File.separator 
					+ month + File.separator 
					+ date;
		
		String datePath = uploadPath + File.separator + dateString;
		System.out.println("datePath: " + datePath);
		File f = new File(datePath);
		if (!f.exists()) {
			f.mkdirs();
		}
		return dateString;
	}
}