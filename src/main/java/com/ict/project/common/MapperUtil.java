package com.ict.project.common;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;

/** 
 * pom.xml 추가 필요 
		<dependency>
		  <groupId>org.modelmapper</groupId>
		  <artifactId>modelmapper</artifactId>
		  <version>3.2.0</version>
		</dependency>
 
 */
public class MapperUtil {

    private static final ModelMapper mapper = new ModelMapper();

    // PropertyMap 등록
    public static <S, D> void addMapping(PropertyMap<S, D> propertyMap) {
        mapper.addMappings(propertyMap);
    }

    // 단일 객체 변환
    public static <S, D> D map(S source, Class<D> destinationClass) {
        if (source == null) return null;
        return mapper.map(source, destinationClass);
    }

    // 리스트 변환
    public static <S, D> List<D> mapList(List<S> sourceList, Class<D> destinationClass) {
        return Optional.ofNullable(sourceList)
                .orElse(List.of())
                .stream()
                .map(s -> mapper.map(s, destinationClass))
                .collect(Collectors.toList());
    }

    // 문자열 → int 안전 변환
    public static int parseIntSafe(String val) {
        try {
            return (val == null || val.isEmpty()) ? 0 : (int) Double.parseDouble(val);
        } catch (Exception e) {
            return 0;
        }
    }
}