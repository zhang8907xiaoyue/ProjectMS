package com.jschrj.report;

import com.alibaba.fastjson.JSONArray;
import com.jschrj.activemq.MqProduce;
import com.jschrj.api.account.AccountService;
import com.jschrj.api.report.ReportService;
import com.jschrj.common.*;
import com.jschrj.pojo.base.KeyAndValue;
import com.jschrj.pojo.report.Report;
import com.jschrj.pojo.system.Application;
import com.jschrj.pojo.system.User;
import com.jschrj.pojo.system.UserSession;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value="/report")
public class ReportController {

	@Autowired
	ReportService reportService;

	/*********************************运维部报表start*********************************/
	@RequestMapping(value="/storyreport")
	public String toStoryreport(HttpServletRequest request){

		Calendar calendar = Calendar.getInstance();//日历对象
		calendar.setTime(new Date());
		DateHelper dateHelper=new DateHelper();
		calendar.setTime(dateHelper.getThisWeekMonday(new Date()));//获取本周一日期

		calendar.add(Calendar.DATE, -7);
		Date date = calendar.getTime();
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
		String starttime = format0.format(date);;
		request.setAttribute("starttime", starttime);
		return "/WEB-INF/report/storyreport.jsp";
	}

	@ResponseBody
	@RequestMapping(value = "/getStoryreportPage",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getStoryreportPage(HttpServletRequest request, PageHelper<Report> pageHelper) throws Exception {

		HttpSession checkLoginSession = request.getSession();
		User user = (User)checkLoginSession.getAttribute("user");
		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String starttime=request.getParameter("starttime");
		String endtime=request.getParameter("endtime");
		String userid=user.getId().toString();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("starttime", starttime);
		param.put("endtime", endtime);
		int records=reportService.getStoryreportCounts(param);
		pageHelper.setRecords(records);
		pageHelper=reportService.getStoryreportPage(pageHelper, param);
		String jsonResult= JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}

	/**
	 * 下载：运维部报表
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/d_storyreport", produces = "text/html;charset=UTF-8")
	public String d_storyreport(HttpServletRequest request,
						  HttpServletResponse response) throws Exception {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyyMMddHHmmss"); //为了转时间
		//加载excel模板
		InputStream in = ReportController.class.getClassLoader().getResourceAsStream("/excel/storyreport.xlsx");
		XSSFWorkbook work = new XSSFWorkbook(in);
		// 得到excel的第0张表
		XSSFSheet sheet = work.getSheetAt(0);
		String starttime=request.getParameter("starttime");
		String endtime=request.getParameter("endtime");
		List<Report> listTemp=new ArrayList<Report>();
		Map<String,Object> param=new HashMap<String, Object>();
		param.put("starttime", starttime);
		param.put("endtime", endtime);
		listTemp=reportService.getStoryreportList(param);
		// 这里面的行和列的数法与计算机里的一样，从0开始是第一
		for(int i=0;i<listTemp.size();i++){
			// 得到Excel工作表的行
			XSSFRow row = sheet.createRow(2+i);
			// 得到Excel工作表指定行的单元格
			row.createCell(0).setCellValue(listTemp.get(i).getV1());
			row.createCell(1).setCellValue(listTemp.get(i).getV2());
			row.createCell(2).setCellValue(listTemp.get(i).getV3());
			row.createCell(3).setCellValue(listTemp.get(i).getV4());
			row.createCell(4).setCellValue(listTemp.get(i).getV5());
			row.createCell(5).setCellValue(listTemp.get(i).getV6());
			row.createCell(6).setCellValue(listTemp.get(i).getV7());
			row.createCell(7).setCellValue(listTemp.get(i).getV8());
			row.createCell(8).setCellValue(listTemp.get(i).getV9());


			//赋予单元格样式
			CellStyle style = work.createCellStyle();
			style.setBorderBottom(CellStyle.BORDER_THIN);  // 下边框
			style.setBorderLeft(CellStyle.BORDER_THIN);	   // 左边框
			style.setBorderRight(CellStyle.BORDER_THIN);	// 上边框
			style.setBorderTop(CellStyle.BORDER_THIN);	  // 右边框
			for (int j = 0; j < row.getLastCellNum(); j++) {
				row.getCell(j).setCellStyle(style);
			}

		}

		/****************************输出流*****************************************/
		String address = simpleFormat.format(new Date());
		OutputStream os = response.getOutputStream();// 取得输出流
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-disposition", "attachment;filename=\"storyreport_"+address+".xlsx\"");
		work.write(os);
		os.close();
		in.close();
		return null;
	}

	/*********************************运维部报表end*********************************/

	/*********************************研发部报告start*********************************/
	@RequestMapping(value="/weekly1")
	public String toWeekly1(HttpServletRequest request) throws Exception{

		//获取待分拣清单
		List<Report> toBeSortedList=reportService.getToBeSortedList();

		//获取待开发清单
		List<Report> toBeDevelopedList=reportService.getToDevelopedList();

		//获取待发布清单
		List<Report> bugList=reportService.getBugList();

		request.setAttribute("toBeSortedList",toBeSortedList);
		request.setAttribute("toBeDevelopedList",toBeDevelopedList);
		request.setAttribute("bugList",bugList);
		return "/WEB-INF/report/weekly1.jsp";
	}
	/*********************************研发部报告end*********************************/

	/*********************************研发部周报start*********************************/
	@RequestMapping(value="/weekly2")
	public String toWeekly2(HttpServletRequest request){

		Calendar calendar = Calendar.getInstance();//日历对象
		calendar.setTime(new Date());
		DateHelper dateHelper=new DateHelper();
		calendar.setTime(dateHelper.getThisWeekMonday(new Date()));//获取本周一日期

		calendar.add(Calendar.DATE, -7);
		Date date = calendar.getTime();
		SimpleDateFormat format0 = new SimpleDateFormat("yyyy-MM-dd");
		String starttime = format0.format(date);;
		request.setAttribute("starttime", starttime);
		return "/WEB-INF/report/weekly2.jsp";
	}

	@ResponseBody
	@RequestMapping(value = "/getWeekly2Page",method= RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public String getWeekly2Page(HttpServletRequest request, PageHelper<Report> pageHelper) throws Exception {

		HttpSession checkLoginSession = request.getSession();
		User user = (User)checkLoginSession.getAttribute("user");
		//注：jqgrid每页数量使用的是rows，与返回分页数据的list实体同名
		int rows=Integer.parseInt(request.getParameter("rows"));
		pageHelper.setRowNum(rows);
		String starttime=request.getParameter("starttime");
		String endtime=request.getParameter("endtime");
		String userid=user.getId().toString();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("starttime", starttime);
		param.put("endtime", endtime);
		int records=reportService.getWeekly2Counts(param);
		pageHelper.setRecords(records);
		pageHelper=reportService.getWeekly2Page(pageHelper, param);
		String jsonResult= JSONArray.toJSONString(pageHelper);
		return jsonResult;
	}

	/**
	 * 下载：周报(秘书)
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/d_weekly2", produces = "text/html;charset=UTF-8")
	public String d_weekly2(HttpServletRequest request,
								HttpServletResponse response) throws Exception {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyyMMddHHmmss"); //为了转时间
		//加载excel模板
		InputStream in = ReportController.class.getClassLoader().getResourceAsStream("/excel/weekly2.xlsx");
		XSSFWorkbook work = new XSSFWorkbook(in);
		// 得到excel的第0张表
		XSSFSheet sheet = work.getSheetAt(0);
		String starttime=request.getParameter("starttime");
		String endtime=request.getParameter("endtime");
		List<Report> listTemp=new ArrayList<Report>();
		Map<String,Object> param=new HashMap<String, Object>();
		param.put("starttime", starttime);
		param.put("endtime", endtime);
		listTemp=reportService.getWeekly2List(param);
		// 这里面的行和列的数法与计算机里的一样，从0开始是第一
		for(int i=0;i<listTemp.size();i++){
			// 得到Excel工作表的行
			XSSFRow row = sheet.createRow(2+i);
			// 得到Excel工作表指定行的单元格
			row.createCell(0).setCellValue(i+1);
			row.createCell(1).setCellValue(listTemp.get(i).getV1());
			row.createCell(2).setCellValue(listTemp.get(i).getV2());
			row.createCell(3).setCellValue(listTemp.get(i).getV3());
			row.createCell(4).setCellValue(listTemp.get(i).getV4());
			row.createCell(5).setCellValue(listTemp.get(i).getV5());
			row.createCell(6).setCellValue(listTemp.get(i).getV6());
			row.createCell(7).setCellValue(listTemp.get(i).getV7());


			//赋予单元格样式
			CellStyle style = work.createCellStyle();
			style.setBorderBottom(CellStyle.BORDER_THIN);  // 下边框
			style.setBorderLeft(CellStyle.BORDER_THIN);	   // 左边框
			style.setBorderRight(CellStyle.BORDER_THIN);	// 上边框
			style.setBorderTop(CellStyle.BORDER_THIN);	  // 右边框
			for (int j = 0; j < row.getLastCellNum(); j++) {
				row.getCell(j).setCellStyle(style);
			}

		}

		/****************************输出流*****************************************/
		String address = simpleFormat.format(new Date());
		OutputStream os = response.getOutputStream();// 取得输出流
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-disposition", "attachment;filename=\"weekly2_"+address+".xlsx\"");
		work.write(os);
		os.close();
		in.close();
		return null;
	}

	/*********************************研发部周报end*********************************/
}
