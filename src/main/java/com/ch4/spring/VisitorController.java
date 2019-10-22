package com.ch4.spring;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ch4.getData.VisitorData;

@Controller
@RequestMapping(value = "/visitor")
public class VisitorController {
   Logger logger = Logger.getLogger(VisitorController.class);
   @Autowired
   VisitorLogic vLogic = null;

   @RequestMapping(value = "applyRequest.ch4", produces = "text/plain;charset=UTF-8")
   public String applyRequest(@RequestParam Map<String, Object> pMap, HttpServletRequest req) {
      HttpSession session = req.getSession();
      session.setAttribute("pMap", pMap);
      return "visitor/Visit_Agreement";
   }

   @RequestMapping(value = "searchVisitor.ch4")
   public String searchVisitor() {
      return "visitor/Visit_SearchVisitor";
   }

   @RequestMapping(value = "searchVQRcode.ch4")
   public String searchVQRcode() {
      return "visitor/Visit_SearchVisitorQR";
   }

   @RequestMapping(value = "applyAgreement.ch4")
   public String applyAgreement() {
      return "visitor/Visit_Select";
   }

   @RequestMapping(value = "visitPurpose.ch4")
   public String visitPurpose(@RequestParam Map<String, Object> pMap, HttpServletRequest req) {
      String vPP = req.getParameter("pp");
      if (vPP.equals("visitor")) {
         return "visitor/Visit_ApplyVisitor";
      } else if (vPP.equals("goods")) {
         return "visitor/Visit_ApplyGoods";
      }
      return "Fail";
   }

   @RequestMapping(value = "add.ch4", produces = "text/plain;charset=UTF-8")
   public String add(@RequestParam Map<String, Object> pMap, @ModelAttribute VisitorData vData, Model mod) {
      int result = 0;
      result = vLogic.visitApplyAdd(pMap, vData);

      if (result == 1) {
         mod.addAttribute("visit_no", pMap.get("visit_no"));
         mod.addAttribute("vtAddList", pMap.get("vtAddList"));
         mod.addAttribute("tkAddList", pMap.get("tkAddList"));
         mod.addAttribute("pkAddList", pMap.get("pkAddList"));
         return "visitor/Visit_ResultVisitor";
      }
      return "Fail";
   }

   @RequestMapping(value = "cancle.ch4")
   public String cancle(@RequestParam Map<String, Object> pMap) {
      int result = 0;
      result = vLogic.visitorCancle(pMap);
      if (result == 1) {
         return "visitor/Visit_Main";
      }
      return "Fail";
   }

   @RequestMapping(value = "changeVisitor.ch4", produces = "text/plain;charset=UTF-8")
   public String changeVisitor(@RequestParam Map<String, Object> pMap, Model mod) {
      Map<String, Object> rMap = vLogic.applyDetail(pMap);
      mod.addAttribute("rMap", rMap);
      return "visitor/Visit_ChangeVisitor";
   }

   @RequestMapping(value = "update.ch4", produces = "text/plain;charset=UTF-8")
   public String update(@RequestParam Map<String, Object> pMap, @ModelAttribute VisitorData vData, Model mod) {
      int result = 0;
      result = vLogic.visitorUpdate(pMap, vData);
      if (result == 1) {
         mod.addAttribute("visit_no", pMap.get("visit_no"));
         mod.addAttribute("vtAddList", pMap.get("vtAddList"));
         mod.addAttribute("tkAddList", pMap.get("tkAddList"));
         mod.addAttribute("pkAddList", pMap.get("pkAddList"));
         return "visitor/Visit_ResultVisitor";
      }
      return "Fail";
   }

   @RequestMapping(value = "navigation.ch4", produces = "text/plain;charset=UTF-8")
   public String navigation(@RequestParam Map<String, Object> pMap, Model mod) {
      logger.info("네비게이션  ==>" + pMap);
      Map<String, Object> rMap = vLogic.navigation(pMap);
      mod.addAttribute("com_addr", rMap.get("COM_ADDR"));
      mod.addAttribute("com_name", rMap.get("COM_NAME"));
      mod.addAttribute("com_hp", rMap.get("COM_HP"));
      logger.info("맵 : " + rMap.get("COM_ADDR"));
      return "visitor/Visit_Navigation";
   }

}