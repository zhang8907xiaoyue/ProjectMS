package com.jschrj.system;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jschrj.api.base.BaseService;
import com.jschrj.common.ResultHelper;
import com.jschrj.pojo.system.Files;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jschrj.common.Constant;

/**
 * 文件控制器
 * @author PC
 *
 */
@Controller
@RequestMapping(value="/files")
public class FilesController {
	
	@Resource
	BaseService service;
	
	@ResponseBody
	@RequestMapping(value = "/kinEditorUpload", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public void kinEditorUpload(@RequestParam(value = "imgFile", required = false) MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws Exception {

		JSONObject succMap = new JSONObject();
		if(file.getSize()==0){
			succMap.put("error", 1);
			succMap.put("msg", "附件内容为空！");
		}
		if (file!=null&&!file.isEmpty()) {
			String suffix=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			Boolean isLegal=Arrays.asList(Constant.FILEEXTENSION).contains(suffix.toLowerCase());
			if(file.getSize()>1024*1024*30){
				succMap.put("error", 1);
				succMap.put("msg", "文件大于30M！");
			}else if(file.getOriginalFilename().getBytes("utf-8").length>200){

				succMap.put("error", 1);
				succMap.put("msg", "文件名超过200个字符！");
			}else if (!isLegal) {
				succMap.put("error", 1);
				succMap.put("msg", "文件格式错误！");
			}else{
				Date date=new Date();
				SimpleDateFormat datePathFormat = new SimpleDateFormat("yyyyMM");
				String path=datePathFormat.format(date);
				String storeName=service.tx_getFilesId()+suffix;

				String url="/"+path+"/"+storeName;

				String furl = UUID.randomUUID().toString() + suffix;

				//因为transferTo只能将文件存储至硬盘位置，无法存储至服务器，而httpPost可以
				//所以先将文件临时存放至项目路径
				String tempPath = request.getRealPath("/temp/"+storeName);
				File tempFile = new File(tempPath);
				file.transferTo(tempFile);

				//将临时存放的文件存入远程nginx文件路径（httpPost方法需要file文件，这个file变量不可以是文件流，只能是有路径的文件，所以上面需要先存放临时文件）
				int res_code =  PostFileToRemote(furl, tempFile,url); //调用PostFileToRemote方法

				//删除临时文件
				tempFile.delete();
				succMap.put("error", 0);
				succMap.put("url", Constant.FILE_VIEW_URL+url);//文件查看预览的远程服务器地址写成动态的，jsp页面处理变量值
			}
		}
		PrintWriter out = response.getWriter();
		out.print(succMap.toJSONString());
		out.close();
	}

	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String upload(@RequestParam(value = "file", required = false) MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws Exception {

		ResultHelper resultHelper=new ResultHelper();
		if(file.getSize()==0){
			resultHelper.setSuccess(false);
			resultHelper.setMsg("附件内容为空！");
		}
		if (file!=null&&!file.isEmpty()) {
			String suffix=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			Boolean isLegal=Arrays.asList(Constant.FILEEXTENSION).contains(suffix.toLowerCase());
			if(file.getSize()>1024*1024*30){
				resultHelper.setSuccess(false);
				resultHelper.setMsg("文件大于30M!");
			}else if(file.getOriginalFilename().getBytes("utf-8").length>200){

				resultHelper.setSuccess(false);
				resultHelper.setMsg("文件名超过200个字符!");
			}else if (!isLegal) {
				resultHelper.setSuccess(false);
				resultHelper.setMsg("文件格式错误!");
			}else{
				Date date=new Date();
				SimpleDateFormat datePathFormat = new SimpleDateFormat("yyyyMM");
				String path=datePathFormat.format(date);
				String storeName=service.tx_getFilesId()+suffix;

				String url="/"+path+"/"+storeName;

				String furl = UUID.randomUUID().toString() + suffix;

				//因为transferTo只能将文件存储至硬盘位置，无法存储至服务器，而httpPost可以
				//所以先将文件临时存放至项目路径
				String tempPath = request.getRealPath("/temp/"+storeName);
				File tempFile = new File(tempPath);
				file.transferTo(tempFile);

				//将临时存放的文件存入远程nginx文件路径（httpPost方法需要file文件，这个file变量不可以是文件流，只能是有路径的文件，所以上面需要先存放临时文件）
				int res_code =  PostFileToRemote(furl, tempFile,url); //调用PostFileToRemote方法

				//删除临时文件
				tempFile.delete();
				Files files=new Files();
				files.setName(file.getOriginalFilename());
				files.setUrl(Constant.FILE_VIEW_URL+url);
				return JSON.toJSONString(files);
			}
		}
		return JSON.toJSONString(resultHelper);
	}

	/**
	 * 上传文件至远程服务器
	*/
	public int PostFileToRemote(String uuidName, File file,String path) throws Exception{
		int code =500;
		CloseableHttpClient httpclient = HttpClients.createDefault(); //创建一个httpclient

        try {
			HttpPost httppost = new HttpPost(Constant.FILE_SERVER_URL);
			//REMOTE_FILESERVER_UPLOAD_URL此路径写在Constant类里面
			HttpEntity reqEntity = MultipartEntityBuilder.create()
					.addPart("token", new StringBody(Constant.FILE_SERVER_TOKEN,ContentType.TEXT_PLAIN))//token验证
					.addPart("path", new StringBody(path,ContentType.TEXT_PLAIN))
					.addPart("bin", new FileBody(file, ContentType.APPLICATION_OCTET_STREAM,file.getName()))
					.build();
			httppost.setEntity(reqEntity);

			CloseableHttpResponse response = httpclient.execute(httppost);
			try {
				EntityUtils.consume(response.getEntity());
				code = response.getStatusLine().getStatusCode();
			} finally {
				response.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return code;
	}

}
