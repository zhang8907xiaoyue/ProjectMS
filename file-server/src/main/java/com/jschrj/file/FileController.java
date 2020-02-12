package com.jschrj.file;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

@Controller
@RequestMapping("/file")
public class FileController {

    private static String token="";
    private static String url="";

    @ResponseBody
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public Map<String,Object> upload(HttpServletRequest req) throws IOException {
        Map<String,Object> retMap = new HashMap<String,Object>();

        String pageToken=req.getParameter("token");
        String path=req.getParameter("path");//存储相对路径，如/201902/201902120001.png

        //获取文件保存配置项
        // 构造Properties对象
        Properties properties = new Properties();

        // 定义配置文件输入流
        InputStream is = null;
        try {
            // 获取配置文件输入流
            is = FileController.class.getResourceAsStream("/setting.properties");
            // 加载配置文件
            properties.load(is);
            // 读取配置文件
            token=(String) properties.get("token");// token密钥
            url=(String) properties.get("url");// 文件保存路径
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 判断输入流是否为空
            if (null != is) {
                try {
                    // 关闭输入流
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        if(!token.equals(pageToken)){
            retMap.put("result","0");
            retMap.put("msg","token身份验证错误!");
        }else{
            CommonsMultipartResolver resolver = new CommonsMultipartResolver(
                    req.getServletContext());
            if (resolver.isMultipart(req)) {
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
                // 取得request中的所有文件名
                Iterator<String> iter = multiRequest.getFileNames();
                while (iter.hasNext()) {
                    String fileName = iter.next();
                    // 取得上传文件
                    List<MultipartFile> mfs = multiRequest.getFiles(fileName);
                    for(MultipartFile file:mfs){

                        File tempFile = new File(url+path);
                        File fileParent = tempFile.getParentFile();
                        if(!fileParent.exists()){
                            //如果存储文件的父文件夹不存在就创建
                            fileParent.mkdirs();
                        }

                        InputStream inputStream=file.getInputStream();
                        FileOutputStream fos=new FileOutputStream(tempFile);
                        byte[]buffer=new byte[1024];
                        int len=0;
                        while ((len=inputStream.read(buffer))!=-1) {
                            fos.write(buffer,0, len);
                        }
                        inputStream.close();
                        fos.close();
                    }
                }
                retMap.put("result","1");
                retMap.put("msg","上传成功");
            }
        }

        return retMap;
    }


    /**
     * 附件下载
     * @param request
     * @param response
     * @param path
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/download", produces = "text/html;charset=UTF-8")
    public void download(HttpServletRequest request, HttpServletResponse response, String path) throws Exception {

        //获取文件保存配置项
        // 构造Properties对象
        Properties properties = new Properties();

        // 定义配置文件输入流
        InputStream is = null;
        try {
            // 获取配置文件输入流
            is = FileController.class.getResourceAsStream("/setting.properties");
            // 加载配置文件
            properties.load(is);
            // 读取配置文件
            url=(String) properties.get("url");// 文件保存路径
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // 判断输入流是否为空
            if (null != is) {
                try {
                    // 关闭输入流
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        InputStream inputStream=new BufferedInputStream(new FileInputStream(url+path));;
        ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
        byte[] buff = new byte[100];
        int rc = 0;
        while ((rc = inputStream.read(buff, 0, 100)) > 0) {
            swapStream.write(buff, 0, rc);
        }
        byte[] in2b = swapStream.toByteArray();
        response.getOutputStream().write(in2b);

    }

}
