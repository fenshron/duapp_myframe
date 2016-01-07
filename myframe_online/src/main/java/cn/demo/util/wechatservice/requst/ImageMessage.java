package cn.demo.util.wechatservice.requst;

/**
 * 图片消息
 * 
 */
public class ImageMessage extends BaseReqMessage {
	// 图片链接
	private String PicUrl;

	public String getPicUrl() {
		return PicUrl;
	}

	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
}
