package com.ict.project.common;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;

import com.ict.project.vo.MakeupAPIVO;
import com.ict.project.vo.TboardVO;

/**
 * MakeupAPIVO → TboardVO 매핑 유틸리티
 * 
 * 사용법:
 * List<MakeupAPIVO> list = ...
 * List<TboardVO> result = MapperUtil.convertToTboardList(list);
 * 
 * pom.xml 추가 필요 
		<dependency>
		  <groupId>org.modelmapper</groupId>
		  <artifactId>modelmapper</artifactId>
		  <version>3.2.0</version>
		</dependency>
 
 */
public class MapperUtil {

    private static final ModelMapper mapper = new ModelMapper();

    static {
        // 매핑 규칙 정의
        mapper.addMappings(new PropertyMap<MakeupAPIVO, TboardVO>() {
            @Override
            protected void configure() {
                // MakeupAPIVO → TboardVO
                map().setB_title(source.getBrand());          // brand → b_title
                map().setB_content(source.getName());         // name → b_content
                map().setB_img(source.getImage_link());       // image_link → b_img
                map().setB_url(source.getWebsite_link());     // website_link → b_url
                map().setB_theme(source.getCategory());       // category → b_theme
                map().setB_lat(source.getCreated_at());       // created_at → b_lat
                map().setB_lon(source.getUpdated_at());       // updated_at → b_lon
                map().setB_time(source.getUpdated_at());      // updated_at → b_time

                // rating → b_like, b_hits (int 변환)
                using(ctx -> parseIntSafe((String) ctx.getSource()))
                    .map(source.getRating(), destination.getB_like());
                using(ctx -> parseIntSafe((String) ctx.getSource()))
                    .map(source.getRating(), destination.getB_hits());
            }
        });
    }

    // rating 문자열을 안전하게 int로 변환
    private static int parseIntSafe(String val) {
        try {
            return (val == null || val.isEmpty()) ? 0 : (int) Double.parseDouble(val);
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * MakeupAPIVO 리스트를 TboardVO 리스트로 변환
     */
    public static List<TboardVO> convertToTboardList(List<MakeupAPIVO> apiList) {
        return Optional.ofNullable(apiList)
                .orElse(List.of())
                .stream()
                .map(vo -> mapper.map(vo, TboardVO.class))
                .collect(Collectors.toList());
    }
    
    public static TboardVO convertToTboard(MakeupAPIVO apiVO) {
        if (apiVO == null) return null;
        return mapper.map(apiVO, TboardVO.class);
    }    
}