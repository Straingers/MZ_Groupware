package com.spring.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QRController {

	@RequestMapping("/qr")
	public String qrCode(Model model) {
		String url = "tmp/qr";

		model.addAttribute("UUID", UUID.randomUUID().toString());

		return url;
	}

	@RequestMapping("/createCode.do")
	public ModelAndView createCode(@RequestParam String qrCode,
								   HttpServletRequest request) {

		String content = request.getScheme() + "://localhost" + request.getContextPath() + "/commute?qrCode=" + qrCode;
		// String content = "http://192.168.0.111" + request.getContextPath() + "/comm/commute?qrCode=" + qrCode;

		return new ModelAndView("qrcodeview", "content", content);
	}

}
