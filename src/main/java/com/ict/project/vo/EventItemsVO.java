package com.ict.project.vo;

import java.util.List;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class EventItemsVO {
    @XmlElement(name = "item")
	private List<EventItemVO> itemList;
	
	public List<EventItemVO> getItemList() {
	    return itemList;
	}
	
	public void setItemList(List<EventItemVO> itemList) {
	    this.itemList = itemList;
	}
}
