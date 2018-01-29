package com.sinosoft.test;

import java.util.ArrayList;
import java.util.List;

import com.lowagie.text.Element;
import com.lowagie.text.Paragraph;
import com.sinosoft.app.common.BaseTestCase;
import com.sinosoft.app.util.ItextPdfUtil;
import com.sinosoft.app.util.ItextPdfUtil.ItextPdf;

/**
 * 测试
 * 
 * <br>
 * @author cmh
 * @version 2014-4-29 下午8:50:58
 */
public class TestSomething extends BaseTestCase{

	public static void main(String[] args) throws Exception {
//		testpdf2();
		
		
		
	}
	
	
	
	
	
	
	public static void testQrcode() throws Exception {
//		String content = "https://www.apple.com/cn/";
//		String logoUrl = "http://www.demlution.com/site_media/media/photos/2014/11/06/3JmYoueyyxS4q4FcxcavgJ.jpg";
//		new SimpleQrcodeGenerator().setRemoteLogo(logoUrl).generate(content).toFile("D:\\temp\\Apple_remote_logo.png");
	}
	
	
	
	public static void testpdf2() throws Exception {
		ItextPdf p = new ItextPdf();

		List<Element> hl = new ArrayList<Element>();
		Paragraph e = new Paragraph("你好",p.getFont());

		hl.add(e);


		p.setHeadList(hl);
		p.setOutName("I:/epassport/temp/testpdf2.pdf");
		ItextPdfUtil.make(p);
	}
	
	public static void testpdf1() throws Exception {
		ItextPdf p = new ItextPdf();
		p.setIsAbsolutePath(true);
		p.setOutName("I:/epassport/temp/testpdf1.pdf");
		p = ItextPdfUtil.create(p);

		p.getDocument().add(new Paragraph("测试1",p.getFont()));
		Paragraph para = new Paragraph("测试1",p.getFont());
		para.setLeading(10f);
		p.getDocument().add(para);

		ItextPdfUtil.close(p);
		System.out.println(p.getOutName());
	}
	
}
