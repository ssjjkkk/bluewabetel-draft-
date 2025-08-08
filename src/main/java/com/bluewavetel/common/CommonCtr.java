package com.bluewavetel.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bluewavetel.dto.common.TypeDto;

@Controller
public class CommonCtr {
	
	@Autowired
	private CommonSvi commonSvi;
	
    /**
     * @Description 공통유형 리스트 조회
     * @Param 유형 조회 조건(유형코드, 유형명, 유형서열, 사용여부)
     */
	@PostMapping("/common/retrieveTypeList.do")
	@ResponseBody
	public List<TypeDto> retrieveTypeList(@ModelAttribute("typeDto") TypeDto typeDto, Model model) throws Exception {
		
		List<TypeDto> typeList = commonSvi.retrieveTypeList(typeDto);
		model.addAttribute("typeList", typeList);
		
        return typeList;
	}
	
    /**
     * @Description 부서 리스트 조회
     * @Param 부서 조회 조건(조직식별자, 조직명, 조직전화번호, 조직장식별자, 상위조직식별자, 조직Depth)
     */
	/*
	@PostMapping("/common/retrievePartList.do")
	@ResponseBody
	public List<PartDto> retrievePartList(@ModelAttribute("partDto") PartDto partDto, Model model) throws Exception {
		
		List<PartDto> partList = commonSvi.retrievePartList(partDto);
		model.addAttribute("partList", partList);
		
        return partList;
	}
	*/
	
    /**
     * @Description 상위부서 선택 시 하위부서 세팅
     * @Param 부서/직위/직책코드 기본정보 가지고 이동 
     */
	/*
	@PostMapping("/common/retrieveLowerPart.do")
	@ResponseBody
	public List<PartDto> retrieveLowerPart(@ModelAttribute("partDto") PartDto partDto) {
		
		List<PartDto> lowerPart = new ArrayList<>();
		
		//하위부서 선택
		partDto.setPartDepth(1);
		
		lowerPart = commonSvi.retrievePartList(partDto);
		
        return lowerPart;
	}
	*/
}
