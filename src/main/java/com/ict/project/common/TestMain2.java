package com.ict.project.common;

import java.io.StringReader;
import java.util.List;
import java.util.Optional;

import org.modelmapper.PropertyMap;

import com.ict.project.vo.BodyVO;
import com.ict.project.vo.ItemVO;
import com.ict.project.vo.ResponseVO;
import com.ict.project.vo.TboardVO;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Unmarshaller;

public class TestMain2 {

    public static void main(String[] args) {
    	
        MapperUtil.addMapping(new PropertyMap<ItemVO, TboardVO>() {
            @Override
            protected void configure() {
                map().setB_title(source.getTitle());
                map().setB_content(source.getDescription());
                map().setB_img("");
                map().setB_url(source.getUrl());
                map().setB_theme(source.getCollectionDb());
                map().setB_time(source.getInsertDate());
                map().setB_lat("");
                map().setB_lon("");

                using(ctx -> MapperUtil.parseIntSafe(ctx.getSource() == null ? "0" : ctx.getSource().toString()))
                        .map(source.getViewCnt(), destination.getB_hits());

                using(ctx -> MapperUtil.parseIntSafe(ctx.getSource() == null ? "0" : ctx.getSource().toString()))
                        .map(source.getViewCnt(), destination.getB_like());
            }
        });

        
    	RestApiComm r = new RestApiComm();
        StringBuffer endPoint = new StringBuffer(
                "https://api.kcisa.kr/openapi/API_CNV_061/request?serviceKey=62f10a79-8a2f-439d-9977-9865b02e7d4e&numOfRows=8&pageNo=1"
        );
        String reslist = r.sendRecv(endPoint, "GET");

        System.out.println("reslist = " + reslist.substring(0, Math.min(200, reslist.length())));

        // XML → VO 변환
        ResponseVO response = null;
        try {
            JAXBContext context = JAXBContext.newInstance(ResponseVO.class);
            Unmarshaller unmarshaller = context.createUnmarshaller();
            response = (ResponseVO) unmarshaller.unmarshal(new StringReader(reslist));
        } catch (JAXBException e) {
            e.printStackTrace();
        }

        List<ItemVO> apiList = Optional.ofNullable(response)
                .map(ResponseVO::getBody)
                .map(BodyVO::getItems)
                .orElse(List.of());

        if (apiList.isEmpty()) {
            System.out.println("조회된 데이터가 없습니다.");
            return;
        }

        List<TboardVO> tboardList = MapperUtil.mapList(apiList, TboardVO.class);

        tboardList.forEach(vo ->
                System.out.println(vo.getB_title() + " / " + vo.getB_url() + " / hits:" + vo.getB_hits())
        );
    }
}
