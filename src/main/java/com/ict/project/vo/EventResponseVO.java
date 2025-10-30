package com.ict.project.vo;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "response")
@XmlAccessorType(XmlAccessType.FIELD)
public class EventResponseVO {

    @XmlElement(name = "header")
    private EventHeaderVO header;

    @XmlElement(name = "body")
    private EventBodyVO body;

    public EventHeaderVO getHeader() {
        return header;
    }

    public void setHeader(EventHeaderVO header) {
        this.header = header;
    }

    public EventBodyVO getBody() {
        return body;
    }

    public void setBody(EventBodyVO body) {
        this.body = body;
    }
}
