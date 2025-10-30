package com.ict.project.vo;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "response")
@XmlAccessorType(XmlAccessType.FIELD)
public class ResponseVO {
	
	@XmlElement(name = "header")
    private HeaderVO header;
	
	@XmlElement(name = "body")
    private BodyVO body;

    public HeaderVO getHeader() {
        return header;
    }

    public void setHeader(HeaderVO header) {
        this.header = header;
    }

    public BodyVO getBody() {
        return body;
    }

    public void setBody(BodyVO body) {
        this.body = body;
    }
}