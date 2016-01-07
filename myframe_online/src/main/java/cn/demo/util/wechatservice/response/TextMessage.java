package cn.demo.util.wechatservice.response;

/**
 * 文本消息
 * 
 */
public class TextMessage extends BaseRespMessage {
	// 回复的消息内容
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}