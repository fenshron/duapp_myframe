package cn.demo.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
 
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

/**
 * 微信servlet
 * 
 * @author Administrator
 * 
 */
public class WechatServlet extends HttpServlet {
	private Logger log =Logger.getLogger(this.getClass().getName()); 

	private static final long serialVersionUID = 7534232612712558319L;

	public WechatServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 微信加密签名
			String signature = request.getParameter("signature");
			// 时间戳
			String timestamp = request.getParameter("timestamp");
			// 随机数
			String nonce = request.getParameter("nonce");
			// 随机字符串
			String echostr = request.getParameter("echostr");

			PrintWriter out = response.getWriter();
			// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
			if (WechatSignUtil.checkSignature(signature, timestamp, nonce)) {
				out.print(echostr);
			}
			out.close();
			out = null;

		} catch (Exception e) {
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//message(request,response);
		response.getWriter().write(WechatCoreService.processRequest(request));
	}
	
	 private void message(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{  
         
		 try {
	            InputStream is = request.getInputStream();
	            // 取HTTP请求流长度
	            int size = request.getContentLength();
	            // 用于缓存每次读取的数据
	            byte[] buffer = new byte[size];
	            // 用于存放结果的数组
	            byte[] xmldataByte = new byte[size];
	            int count = 0;
	            int rbyte = 0;
	            // 循环读取
	            while (count < size) { 
	                // 每次实际读取长度存于rbyte中
	                rbyte = is.read(buffer); 
	                for(int i=0;i<rbyte;i++) {
	                    xmldataByte[count + i] = buffer[i];
	                }
	                count += rbyte;
	            }
	            is.close();
	            String requestStr = new String(xmldataByte, "UTF-8");
	            Document doc = DocumentHelper.parseText(requestStr);
	            Element rootElt = doc.getRootElement();
	            String msgtype = rootElt.elementText("MsgType");
	            String content = rootElt.elementText("Content");
	            String toUserName = rootElt.elementText("ToUserName");
	            String fromUserName = rootElt.elementText("FromUserName");
	            //得到所有的有用数据
	            System.out.println("msgtype:"+msgtype+";content:"+content+ ";toUserName:" + toUserName + ";fromUserName:" + fromUserName);
	            //文本消息
	            if (StringUtil.isBlank(content) && "text".equals(msgtype)) {
	                String responseStr = "<xml>";
	                responseStr += "<ToUserName><![CDATA[" + fromUserName
	                        + "]]></ToUserName>";
	                responseStr += "<FromUserName><![CDATA[" + toUserName
	                        + "]]></FromUserName>";
	                responseStr += "<CreateTime>" + System.currentTimeMillis()
	                        + "</CreateTime>";
	                responseStr += "<MsgType><![CDATA[text]]></MsgType>";
	                responseStr += "<Content>你输入的是文本！</Content>";
	                responseStr += "<FuncFlag>0</FuncFlag>";
	                responseStr += "</xml>";
	                response.getWriter().write(responseStr);
	            }
	            //图片消息
	            else if (StringUtil.isBlank(content) && "image".equals(msgtype)) {
	                String responseStr = "<xml>";
	                responseStr += "<ToUserName><![CDATA[" + fromUserName
	                        + "]]></ToUserName>";
	                responseStr += "<FromUserName><![CDATA[" + toUserName
	                        + "]]></FromUserName>";
	                responseStr += "<CreateTime>" + System.currentTimeMillis()
	                        + "</CreateTime>";
	                responseStr += "<MsgType><![CDATA[news]]></MsgType>";
	                responseStr += "<Content><![CDATA[]]></Content>";
	 
	                responseStr += "<ArticleCount>2</ArticleCount>";
	 
	                responseStr += "<Articles>";
	                responseStr += "<item>";
	                responseStr += "<Title><![CDATA[图文消息]]></Title>";
	                responseStr += "<Discription><![CDATA[图文消息正文]]></Discription>";
	                responseStr += "<PicUrl><![CDATA[http://img1.wyss.net.cn/uploadfiles/cover/2015/09/29/20150929081026656.jpg]]></PicUrl>";
	                responseStr += "<Url><![CDATA[http://www.the6688.com/xiaoqingxin/baisediaoqunqingchunmeinv.html]]></Url>";
	                responseStr += "</item>";
	                responseStr += "</Articles>";
	                responseStr += "<FuncFlag>1</FuncFlag>";
	                responseStr += "</xml>";
	                response.getWriter().write(responseStr);
	            }
	            //不能识别
	            else {
	                String responseStr = "<xml>";
	                responseStr += "<ToUserName><![CDATA[" + fromUserName
	                        + "]]></ToUserName>";
	                responseStr += "<FromUserName><![CDATA[" + toUserName
	                        + "]]></FromUserName>";
	                responseStr += "<CreateTime>" + System.currentTimeMillis()
	                        + "</CreateTime>";
	                responseStr += "<MsgType><![CDATA[text]]></MsgType>";
	                responseStr += "<Content>输入text或者news返回相应类型的消息，另外推荐你关注 '红色石头'（完全采用Java完成），反馈和建议请到http://wzwahl36.net</Content>";
	                responseStr += "<FuncFlag>0</FuncFlag>";
	                responseStr += "</xml>";
	                response.getWriter().write(responseStr);
	            }
	             
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
           
     }  
	 
}

