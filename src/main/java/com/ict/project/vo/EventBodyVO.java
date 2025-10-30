package com.ict.project.vo;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class EventBodyVO {
   @XmlElement(name = "items")
    private EventItemsVO items;

    public EventItemsVO getItems() {
        return items;
    }

    public void setItems(EventItemsVO items) {
        this.items = items;
    }
}
