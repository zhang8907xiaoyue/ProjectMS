package com.jschrj.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

/**
 * ftp文件处理
 * @author PC
 *
 */
public class FtpHelper {
    private FTPClient ftpClient;  
      
    private String serverName; // 服务器名称
    private String port; // 服务器端口  
    private String username; // 用户登录名  
    private String password; // 用户登录密码  
      
    private InputStream is; // 文件下载输入流  
      
    /** 
     * 私有构造方法 
     */  
    public FtpHelper() {  
        initConfig();  
        if (null == ftpClient) {  
            ftpClient = new FTPClient();  
        }  
    }  
      
    /** 
     * 初始化FTP服务器连接属性 
     */  
    public void initConfig () {  
        // 构造Properties对象  
        Properties properties = new Properties();  
          
        // 定义配置文件输入流  
        InputStream is = null;  
        try {  
            // 获取配置文件输入流  
            is = FtpHelper.class.getResourceAsStream("/ftp.properties");  
            // 加载配置文件  
            properties.load(is);  
            // 读取配置文件  
            serverName=(String) properties.get("serverName");
            port = (String) properties.get("port"); // 设置端口  
            username = (String) properties.get("username"); // 设置用户名  
            password = (String) properties.get("password"); // 设置密码  
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
    }  
      
    /** 
     * 连接（配置通用连接属性）至服务器 
     *  
     * @param serverName 
     *      服务器名称 
     * @param remotePath 
     *      当前访问目录 
     * @return 
     *      <b>true</b>：连接成功 
     *      <br/> 
     *      <b>false</b>：连接失败 
     */  
    public boolean connectToTheServer (String remotePath) throws Exception {  
        // 定义返回值  
        boolean result = false;  
        // 连接至服务器，端口默认为21时，可直接通过URL连接  
        ftpClient.connect(serverName, Integer.parseInt(port));  
        // 登录服务器  
        ftpClient.login(username, password);  
        // 判断返回码是否合法  
        if (!FTPReply.isPositiveCompletion(ftpClient.getReplyCode())) {  
            // 不合法时断开连接  
            ftpClient.disconnect();  
            // 结束程序  
            return result;  
        }  
        // 设置文件操作目录  
        result = ftpClient.changeWorkingDirectory(remotePath);  
        // 设置文件类型，二进制  
        result = ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);  
        // 设置缓冲区大小  
        ftpClient.setBufferSize(3072);  
        // 设置字符编码  
        ftpClient.setControlEncoding("UTF-8");  
        return result;  
    }  
      
    /** 
     * 上传文件至FTP服务器 
     *  
     * @param serverName 
     *      服务器名称 
     * @param storePath 
     *      上传文件存储路径 
     * @param fileName 
     *      上传文件存储名称 
     * @param is 
     *      上传文件输入流 
     * @return 
     *      <b>true</b>：上传成功 
     *      <br/> 
     *      <b>false</b>：上传失败 
     */  
    public boolean storeFile (String storePath, String fileName, InputStream is) throws Exception {  
        boolean result = false;  
     // 连接至服务器  
        result = connectToTheServer(storePath);  
        // 判断服务器是否连接成功  
        if (result) {  
        	ftpClient.makeDirectory(storePath);
			// 上传文件  
        	System.out.println('\\'+storePath+'\\'+fileName);
            result = ftpClient.storeFile('\\'+storePath+'\\'+fileName, is);
            System.out.println("不存在文件夹，创建后，上传成功！");
           
        }  
        // 关闭输入流  
        is.close();  
        return result;  
    }  
      
    /** 
     * 下载FTP服务器文件至本地<br/> 
     * 操作完成后需调用logout方法与服务器断开连接 
     *  
     * @param serverName 
     *      服务器名称 
     * @param remotePath 
     *      下载文件存储路径 
     * @param fileName 
     *      下载文件存储名称 
     * @return 
     *      <b>InputStream</b>：文件输入流 
     */  
    public InputStream retrieveFile (String remotePath, String fileName) throws Exception {  
    	boolean result = false;  
        // 连接至服务器  
        result = connectToTheServer(remotePath);  
        // 判断服务器是否连接成功  
        if (result) {  
            // 获取文件输入流  
            is = ftpClient.retrieveFileStream(fileName);  
        }  
        return is;  
    }  
      
    /** 
     * 删除FTP服务器文件 
     *  
     * @param serverName 
     *      服务器名称 
     * @param remotePath 
     *      当前访问目录 
     * @param fileName 
     *      文件存储名称 
     * @return 
     *      <b>true</b>：删除成功 
     *      <br/> 
     *      <b>false</b>：删除失败 
     */  
    public boolean deleteFile (String remotePath, String fileName) throws Exception {  
        boolean result = false;  
        // 连接至服务器  
        result = connectToTheServer(remotePath);  
        // 判断服务器是否连接成功  
        if (result) {  
        	// 删除文件  
            result = ftpClient.deleteFile(fileName);  
            // 登出服务器并断开连接  
            logout();  
        }  
        return result;  
    }  
      
    /** 
     * 检测FTP服务器文件是否存在 
     *  
     * @param serverName 
     *      服务器名称 
     * @param remotePath 
     *      检测文件存储路径 
     * @param fileName 
     *      检测文件存储名称 
     * @return 
     *      <b>true</b>：文件存在 
     *      <br/> 
     *      <b>false</b>：文件不存在 
     */  
    public boolean checkFile (String remotePath, String fileName) throws Exception {  
        boolean result = false;
        // 连接至服务器  
        result = connectToTheServer(remotePath);  
        // 判断服务器是否连接成功  
        if (result) {  
            // 默认文件不存在  
            result = false;  
            // 获取文件操作目录下所有文件名称  
            String[] remoteNames = ftpClient.listNames();  
            // 循环比对文件名称，判断是否含有当前要下载的文件名  
            for (String remoteName: remoteNames) {  
                if (fileName.equals(remoteName)) {  
                    result = true;  
                }  
            }  
        }  
        // 登出服务器并断开连接  
        logout();  
        return result;  
    }  
    
    /**
     * 判断文件夹是否存在
     * @param dirname
     */
	public boolean isDirExist(String dirname) {
		boolean isExist=false;
		try {
			//此方法无效
			ftpClient.cwd(dirname); // 想不到什么好办法来判断目录是否存在，只能用异常了(比较笨).请知道的告诉我一声`
			isExist=true;
		} catch (IOException e1) {
			isExist=false;
		}
		return isExist;
	}
    
    /**
     * 创建文件夹
     * @param dirname
     */
    public void createDir(String dirname) throws Exception{
    	System.out.println("开始创建！");
    	ftpClient.makeDirectory(dirname);
        System.out.println("在目标服务器上成功建立了文件夹: " + dirname);
        
    }
  
    /** 
     * 登出服务器并断开连接 
     *  
     * @param ftp 
     *      FTPClient对象实例 
      * @return 
     *      <b>true</b>：操作成功 
     *      <br/> 
     *      <b>false</b>：操作失败 
     */  
    public boolean logout () throws Exception {  
        boolean result = false;  
		// 关闭输入流
		is.close();
		// 登出服务器
		result = ftpClient.logout();
		// 断开连接
		ftpClient.disconnect();
		return result;
    }  
}
