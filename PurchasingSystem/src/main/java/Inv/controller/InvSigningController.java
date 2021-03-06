package Inv.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Account.model.Inv_ProductListBean;
import Account.model.Inv＿ProductCheckBean;
import Account.service.Inv_ProductListService;
import Account.service.Inv＿ProductCheckService;
import Apply.model.EmployeeBean;
import Apply.service.EmployeeService;
import Inv.model.Inv_SigningProcessBean;
import Inv.service.AdditemServie;
import Inv.service.Inv_SigningProcessService;
import Po.model.PO_MainBean;
import Po.service.PO_MainService;

@Controller
public class InvSigningController {
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
	AdditemServie additemServie;
	@RequestMapping(path="/Inv/LoginSucessSelectInvcSignList.do")
	@ResponseBody
public JSONArray LoginSucessSelectInvSignList(HttpSession session) {
		EmployeeBean beans=(EmployeeBean) session.getAttribute("user");
		String empid=beans.getEmp_id();
		List<Inv_SigningProcessBean> lists=null;
		List<Inv_SigningProcessBean> lists1=null;
		List<Inv_SigningProcessBean> lists2=null;
		List<Inv_SigningProcessBean> lists3=null;
		List<Inv＿ProductCheckBean> ShowCount = additemServie.selectSize();
		if(ShowCount !=null) {		
			Integer x =ShowCount.size();
			session.setAttribute("waitendsign4",x);
		}else {
			session.removeAttribute("waitendsign4");
		}
//		lists2=inv_SigningProcessService.selectempidsend(empid, "驗收成功");
//		if(lists2 !=null) {		
//			Integer x =lists2.size();
//			session.setAttribute("waitendsign4",x);
//		}else {
//			session.removeAttribute("waitendsign4");
//			}
		lists3=inv_SigningProcessService.selectempidsend(empid, "待分派");
		if(lists3 !=null) {		
			Integer x =lists3.size();
			session.setAttribute("waitendsign3",x);
		}else {
			session.removeAttribute("waitendsign3");
			}
		lists=inv_SigningProcessService.selectempidsend(empid, "驗收中");
		if(lists !=null) {		
			Integer x =lists.size();
			session.setAttribute("waitendsign",x);
		}else {
			session.removeAttribute("waitendsign");
			}
		lists1=inv_SigningProcessService.selectempidsend(empid, "驗收失敗");
		if(lists1 !=null ) {		
			Integer x1 =lists1.size();			
			session.setAttribute("waitendsign1",x1);
		}else {
			session.removeAttribute("waitendsign1");
			}
	
		return null;
	}
	
	
	@RequestMapping("/Inv/sendEmployee.controller") // 多少驗收單分派頁面
	public String sendEmployee(Model model, HttpSession session) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		List<Inv_SigningProcessBean> list = inv_SigningProcessService.selectempidsend(beans.getEmp_id(), "待分派");
		List<Inv_SigningProcessBean> lists = new LinkedList<Inv_SigningProcessBean>();
		if (list == null) {
			model.addAttribute("nosendlist", "無待分派驗收單");
			return "InvSendEmployee.do";
		} else {
			for (int i = 0; i < list.size(); i++) {
				Inv_SigningProcessBean x = list.get(i);
				String invid = x.getChk_Id();
				Inv_SigningProcessBean xs = inv_SigningProcessService.select("貨物狀態", invid);
				if (xs != null) {
					lists.add(x);
					lists.add(xs);
				}
			}
			model.addAttribute("sendlist", lists);
			return "InvSendEmployee.do";
		}

	}

	@RequestMapping("/Inv/InvsendEmployee.controller") // 分派驗收單頁面
	public String InvsendEmployee(Inv_SigningProcessBean bean, BindingResult bindingResult, Model model,
			HttpSession session, String send, String employeesend) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		Inv＿ProductCheckBean invmain = inv＿ProductCheckService.select(bean.getChk_Id());
		String invid = bean.getChk_Id();
		String invidonlynumber = "Po" + invid.substring(2);
		PO_MainBean pomain = po_MainService.select(invidonlynumber);
		List<EmployeeBean> empinvchkbeans = employeeService.selectPoEmployee(beans.getEmp_dep(), 1);
		model.addAttribute("pomain", pomain);
		model.addAttribute("empinvchkbeans", empinvchkbeans);
		model.addAttribute("invmain", invmain);
		model.addAttribute("SigningProcess", bean);
		return "InvList.show";
	}

	@RequestMapping("/Inv/Invsendlist.controller") // 分派畫面
	public String invsendlist(Inv_SigningProcessBean bean, BindingResult bindingResult, Model model,
			HttpSession session, String send, String employeesend, String SignSug) throws ParseException {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		Date date = new Date();
		java.sql.Date date1 = new java.sql.Date(date.getTime());
		SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String now = dateFormate.format(date1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date dates = sdf.parse(now);
		Inv＿ProductCheckBean invpromain = inv＿ProductCheckService.select(bean.getChk_Id());
		invpromain.setEmp_ID(employeesend);
		Inv_SigningProcessBean secondsigningrocess = inv_SigningProcessService.select(bean.getInv_Sta(),
				bean.getChk_Id());
		System.out.println(SignSug);
		secondsigningrocess.setSig_Sta("已分派");
		secondsigningrocess.setSig_Date(dates);
		secondsigningrocess.setSig_Sug(SignSug);
		Inv_SigningProcessBean secondsigningrocess1 = new Inv_SigningProcessBean(employeesend, "驗收", bean.getChk_Id(),
				null, "驗收中", null, 3);
		inv_SigningProcessService.insert(secondsigningrocess1);
		model.addAttribute("sendok", "分派完成");

//	 return "InvSendEmployee.do";		
		return "redirect:/Inv/sendEmployee.controller";
//		return "Invlogin.success";

	}

	@RequestMapping("/Inv/selectInvchk.controller")
	public String selectInvchk(Model model, HttpSession session) {// 待驗收驗收單畫面
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		String invpro = beans.getEmp_id();
		List<Inv_SigningProcessBean> selectlist = inv_SigningProcessService.selectempidsend(invpro, "驗收中");
		List<Inv_SigningProcessBean> selectlists = null;
		selectlists = new LinkedList<Inv_SigningProcessBean>();
		if (selectlist == null) {
			model.addAttribute("noselectlists", "無待驗收單");
			return "selectInvchk.list";
		} else {
			for (int i = 0; i < selectlist.size(); i++) {
				Inv_SigningProcessBean x = selectlist.get(i);
				Inv_SigningProcessBean xs = inv_SigningProcessService.select("驗收分派", x.getChk_Id());
				if (xs != null) {
					selectlists.add(x);
					selectlists.add(xs);
				}
				model.addAttribute("selsctlists", selectlists);
			}
			return "selectInvchk.list";
		}

	}

	@RequestMapping("/Inv/sendthisselectinvprolist.controller")
	public String invsendlistign(String inv_manger, String inv_sta, String chk_id, Model model, HttpSession session) {
		EmployeeBean beans = (EmployeeBean) session.getAttribute("user");
		System.out.println("dddd"+chk_id);
		Inv＿ProductCheckBean invmain = inv＿ProductCheckService.select(chk_id);
		Inv_SigningProcessBean bean2 = inv_SigningProcessService.select("驗收", chk_id);
		Inv_SigningProcessBean bean3 = inv_SigningProcessService.select("驗收分派", chk_id);
		List<Inv_ProductListBean> reschksta = inv_ProductListService.selectIdandSigsta(chk_id, "驗收失敗");
		if ("驗收失敗".equals(bean2.getSig_Sta()) || "再次驗收".equals(bean2.getSig_Sta())) {
			bean2.setSig_Sta("再次驗收");
			if(reschksta!=null) {
			for (int i = 0; i < reschksta.size(); i++) {
				Inv_ProductListBean sss = reschksta.get(i);
				sss.setChk_status(null);
			}
			}
			model.addAttribute("invmain", invmain);
			model.addAttribute("bean3", bean3);
			model.addAttribute("Inv_SigningProcessBean", bean2);
			return "Inv.restchk";
		}
		String invid = chk_id;
		String invidonlynumber = "Po" + invid.substring(2);
		PO_MainBean pomain = po_MainService.select(invidonlynumber);
		model.addAttribute("invmain", invmain);
		model.addAttribute("pomain", pomain);
		model.addAttribute("bean3", bean3);
		model.addAttribute("Inv_SigningProcessBean", bean2);
		return "Inv.sign";
	}

}
