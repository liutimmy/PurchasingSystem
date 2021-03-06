package Inv.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Account.model.Inv_ProductListBean;
import Account.model.Inv＿ProductCheckBean;
import Account.service.Accout_PayableService;
import Account.service.Inv_ProductListService;
import Account.service.Inv＿ProductCheckService;
import Apply.model.App_SigningProcessBean;
import Apply.model.EmployeeBean;
import Apply.service.App_SigningProcessService;
import Apply.service.EmployeeService;
import Inv.model.Inv_SigningProcessBean;
import Inv.service.Inv_SigningProcessService;
import Po.model.PO_MainBean;
import Po.model.PO_SigningProcessBean;
import Po.service.PO_MainService;
import Po.service.PO_SigningProcessService;

@Controller
public class InvSeadController {

	@Autowired
	Inv_SigningProcessService inv_SigningProcessService;
	@Autowired
	Inv_ProductListService inv_ProductListService;
	@Autowired
	PO_MainService po_MainService;
	@Autowired
	EmployeeService employeeService;
	@Autowired
	Inv＿ProductCheckService inv＿ProductCheckService;
	@Autowired
	PO_SigningProcessService po_SigningProcessService;
	@Autowired
	Accout_PayableService accout_PayableService;
	@Autowired
	App_SigningProcessService app_SigningProcessService;

	@RequestMapping("/Inv/changeinvprosta")
	public String changeinvprosta(
			String sigSta,String send, Integer chk_Count, String chk_quality,
			Inv_ProductListBean prochkdatilbean, Inv＿ProductCheckBean prochkmain, Inv_SigningProcessBean bean,
			String chkstatus, Model model, HttpSession session, String chk_Id, String part_No) throws ParseException {
		Date date = new Date();
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String now = dateFormate.format(date1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date dates = sdf.parse(now);
		Inv＿ProductCheckBean invmain = inv＿ProductCheckService.select(chk_Id);
		Inv_SigningProcessBean secondsigningrocess1 = inv_SigningProcessService.select("驗收", chk_Id);
		Inv_ProductListBean secondsigningrocess = inv_ProductListService.select(chk_Id, part_No);
		String po_id = "Po" + chk_Id.substring(2);
		PO_MainBean pomain = po_MainService.select(po_id);
		model.addAttribute("pomain", pomain);
		System.out.println(secondsigningrocess.getChk_status());
		System.out.println(chkstatus);
		System.out.println("sss");
		model.addAttribute("secondsigningrocess", secondsigningrocess.getChk_status());
      
		if ("驗收成功".equals(chkstatus)) {
			secondsigningrocess.setChk_Count(chk_Count);
			secondsigningrocess.setChk_quality(chk_quality);
			secondsigningrocess.setChk_status("驗收成功");
			secondsigningrocess.setChk_Date(dates);
			model.addAttribute("Inv_SigningProcessBean", secondsigningrocess1);
			model.addAttribute("invmain", invmain);
			System.out.println("成功");
			return "Inv.sign";
		} else if ("驗收失敗".equals(chkstatus)) {
			secondsigningrocess1.setSig_Sta("驗收失敗");
			secondsigningrocess.setChk_Date(dates);
			secondsigningrocess.setChk_status("驗收失敗");
			secondsigningrocess.setChk_quality(chk_quality);
			secondsigningrocess.setChk_Count(chk_Count);
			model.addAttribute("Inv_SigningProcessBean", secondsigningrocess1);
			model.addAttribute("invmain", invmain);
			System.out.println("失敗");
			return "Inv.sign";
		} else {
//	    	secondsigningrocess.setChk_status(null);
			model.addAttribute("Inv_SigningProcessBean", secondsigningrocess1);
			model.addAttribute("invmain", invmain);
			System.out.println(chkstatus);
			System.out.println("沒值");
			return "Inv.sign";
		}
		

	}
@RequestMapping("/Inv/reschangeinvprosta")
public String reschangeinvprosta(String sigSta,String send, Integer chk_Count, String chk_quality,
		Inv_ProductListBean prochkdatilbean, Inv＿ProductCheckBean prochkmain, Inv_SigningProcessBean bean,
		String chkstatus, Model model, HttpSession session, String chk_Id, String part_No) throws ParseException {
	Date date = new Date();
	java.sql.Date date1 = new java.sql.Date(date.getTime());
	SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	String now = dateFormate.format(date1);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	Date dates = sdf.parse(now);
	Inv＿ProductCheckBean invmain = inv＿ProductCheckService.select(chk_Id);
	Inv_SigningProcessBean secondsigningrocess1 = inv_SigningProcessService.select("驗收", chk_Id);
	Inv_ProductListBean secondsigningrocess = inv_ProductListService.select(chk_Id, part_No);
	System.out.println(secondsigningrocess.getChk_status());
	System.out.println(chkstatus);
	System.out.println("sss");
	model.addAttribute("secondsigningrocess", secondsigningrocess.getChk_status());
	  
       	if ("驗收成功".equals(chkstatus)) {
			secondsigningrocess.setChk_Count(chk_Count);
			secondsigningrocess.setChk_quality(chk_quality);
			secondsigningrocess.setChk_status("驗收成功");
			secondsigningrocess.setChk_Date(dates);
			model.addAttribute("Inv_SigningProcessBean", secondsigningrocess1);
			model.addAttribute("invmain", invmain);
			System.out.println("成功");
			return "Inv.restchk";
		} else if ("驗收失敗".equals(chkstatus)) {
			secondsigningrocess1.setSig_Sta("驗收失敗");
			secondsigningrocess.setChk_Date(dates);
			secondsigningrocess.setChk_status("驗收失敗");
			secondsigningrocess.setChk_quality(chk_quality);
			secondsigningrocess.setChk_Count(chk_Count);
			model.addAttribute("Inv_SigningProcessBean", secondsigningrocess1);
			model.addAttribute("invmain", invmain);
			System.out.println("失敗");
			return "Inv.restchk";
		}
		else {
			model.addAttribute("Inv_SigningProcessBean", secondsigningrocess1);
			model.addAttribute("invmain", invmain);
			System.out.println(chkstatus);
			System.out.println("沒值");
			return "Inv.sign";
		}
	}
	@RequestMapping("/Inv/invfinish.conll")
	public String invfinisg(String SignSug,String chkId, String sigSta, Model model, HttpSession session) throws ParseException {
		Date date = new Date();
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");		
		String now = dateFormate.format(date1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date dates = sdf.parse(now);
		String ap_id = "Ap" + chkId.substring(2);
		
		Inv_SigningProcessBean secondsigningrocess1 = inv_SigningProcessService.select("驗收", chkId);
		String po_id = "Po" + chkId.substring(2);
		
		secondsigningrocess1.setSig_Sug(SignSug);
		System.out.println("驗收單:" + chkId);
		System.out.println("驗收狀態:" + sigSta);
	
		
		if ("驗收中".equals(sigSta)||"再次驗收".equals(sigSta)) {
			PO_SigningProcessBean posecondsigningrocess = po_SigningProcessService.select("驗收作業", po_id);
			App_SigningProcessBean secondsigningrocess2 = app_SigningProcessService.select("申請中", ap_id);
			secondsigningrocess1.setSig_Date(dates);
			secondsigningrocess1.setSig_Sta("驗收成功");
			secondsigningrocess2.setSig_sta("待結案");
			secondsigningrocess2.setSig_date(dates);
			posecondsigningrocess.setSig_sta("驗收完成未請款");
			posecondsigningrocess.setSig_date(date);
			accout_PayableService.createAccountPayable(chkId);
			return "redirect:/Inv/selectInvchk.controller";
		} else if ("驗收失敗".equals(sigSta)) {
			secondsigningrocess1.setSig_Date(dates);
			return "redirect:/Inv/selectInvchk.controller";
		}
		return "redirect:/Inv/selectInvchk.controller";
	}


	
	@RequestMapping("/Inv/chkprofail.controller")
	public String chkprofail(Model model, HttpSession session) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		String chkempid = beans.getEmp_id();
		List<Inv_SigningProcessBean> secondsigningrocess = inv_SigningProcessService.selectempidsend(chkempid,"驗收失敗");
		List<Inv_SigningProcessBean> secondsigningrocess3 = inv_SigningProcessService.selectempidsend(chkempid,"再次驗收");
		List<Inv_SigningProcessBean> selectlists = null;
		model.addAttribute("bean2", secondsigningrocess);
		selectlists = new LinkedList<Inv_SigningProcessBean>();	
		if (secondsigningrocess == null&&secondsigningrocess3==null) {
			model.addAttribute("noselectlists", "無失敗驗收單");
			return "chkpro.fail";
		} else {
			if(secondsigningrocess!=null) {
			for (int i = 0; i < secondsigningrocess.size(); i++) {
				Inv_SigningProcessBean x = secondsigningrocess.get(i);
				Inv_SigningProcessBean xs = inv_SigningProcessService.select("驗收分派", x.getChk_Id());
				if (xs != null) {
					selectlists.add(x);
					selectlists.add(xs);
				}
				
				model.addAttribute("selsctlists", selectlists);
			}}
			if(secondsigningrocess3!=null) {
				for(int i=0;i<secondsigningrocess3.size();i++) {
					Inv_SigningProcessBean x = secondsigningrocess3.get(i);
					Inv_SigningProcessBean xs = inv_SigningProcessService.select("驗收分派", x.getChk_Id());
					if(xs!=null) {
						selectlists.add(x);
						selectlists.add(xs);
					}
					model.addAttribute("selsctlists",selectlists);
				}}
			
		
				
			return "chkpro.fail";
		}
	
	}
//	@RequestMapping("/Inv/sendfailinvprolist.controller")
//	public String chkprosucces(String chk_id,Model model, HttpSession session) {
//		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
//		Inv＿ProductCheckBean invmain = inv＿ProductCheckService.select(chk_id);
//		Inv_SigningProcessBean bean2 = inv_SigningProcessService.select("驗收", chk_id);
//		bean2.setSig_Sta("再次驗收");
//		String invid = chk_id;
//		String invidonlynumber = "Po" + invid.substring(2);
//		PO_MainBean pomain = po_MainService.select(invidonlynumber);
//		model.addAttribute("invmain", invmain);
//		model.addAttribute("pomain", pomain);
//		model.addAttribute("Inv_SigningProcessBean", bean2);
//	return "Inv.sign";
//	}
//	@RequestMapping("/Inv/restchkpro")
//	public String restchkpro(String inv_manger, String inv_sta, String chk_id, Model model, HttpSession session) {
//		
//	}
}