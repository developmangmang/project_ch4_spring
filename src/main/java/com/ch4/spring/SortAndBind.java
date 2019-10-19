package com.ch4.spring;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ch4.getData.GoodsData;
import com.ch4.getData.VisitorData;

public class SortAndBind {
	public static Map<String, Object> visitApplySort(VisitorData vData) {
		Map<String, Object> rMap = new HashMap<String, Object>();

		List<Map<String, Object>> vtAddList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> tkAddList = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> pkAddList = new ArrayList<Map<String, Object>>();

		////////////////// [방문자 list에 담기] //////////////////
		String[] vt_names = vData.getVisitor_names();
		String[] vt_hps = vData.getVisitor_hps();
		if (vt_names != null && vt_names.length > 0) {
			for (int i = 0; i < vt_names.length; i++) {
				Map<String, Object> addMap = new HashMap<String, Object>();
				addMap.put("visitor_name", vt_names[i]);
				addMap.put("visitor_hp", vt_hps[i]);
				vtAddList.add(addMap);
			}
		}

		///////////////// [반입기기 list에 담기] //////////////////
		String[] tk_models = vData.getTkin_models();
		String[] tk_brand = vData.getTkin_brands();
		String[] tk_kinds = vData.getTkin_kinds();
		if (tk_models != null && tk_models.length > 0) {
			for (int i = 0; i < tk_models.length; i++) {
				Map<String, Object> addMap = new HashMap<String, Object>();
				addMap.put("tkin_model", tk_models[i]);
				addMap.put("tkin_brand", tk_brand[i]);
				addMap.put("tkin_kind", tk_kinds[i]);
				tkAddList.add(addMap);
			}
		}
		///////////////// [방문차량 list에 담기] //////////////////
		String[] pk_kinds = vData.getParking_kinds();
		String[] pk_models = vData.getParking_models();
		String[] pk_nums = vData.getParking_nums();
		if (pk_kinds != null && pk_kinds.length > 0) {
			for (int i = 0; i < pk_kinds.length; i++) {
				Map<String, Object> addMap = new HashMap<String, Object>();
				addMap.put("parking_kind", pk_kinds[i]);
				addMap.put("parking_model", pk_models[i]);
				addMap.put("parking_num", pk_nums[i]);
				pkAddList.add(addMap);
			}
		}
		///////////////// [배열 제외한 신청정보] ///////////////

		/////// 4개의 정보들 하나의 Map에 담기
		rMap.put("vtAddList", vtAddList);
		rMap.put("tkAddList", tkAddList);
		rMap.put("pkAddList", pkAddList);

		return rMap;
	}

	public static Map<String, Object> goodsApplySort(GoodsData gData) {
		Map<String, Object> rMap = new HashMap<String, Object>();

		List<Map<String, Object>> gmAddList = new ArrayList<Map<String, Object>>();

		///////////////// [반입물품 list에 담기] ///////////////
		String[] gm_names = gData.getGmng_names();
		String[] gm_types = gData.getGmng_types();
		String[] gm_quans = gData.getGmng_quans();
		if (gm_names != null && gm_names.length > 0) {
			for (int i = 0; i < gm_names.length; i++) {
				Map<String, Object> addMap = new HashMap<String, Object>();
				addMap.put("gmng_name", gm_names[i]);
				addMap.put("gmng_type", gm_types[i]);
				addMap.put("gmng_quan", gm_quans[i]);
				gmAddList.add(addMap);
			}
		}
		///////////////// [배열 제외한 신청정보] ///////////////

		rMap.put("gmAddList", gmAddList);

		return rMap;
	}
}
