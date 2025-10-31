package com.ict.project.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource({
	"classpath:kakao.properties"
	
})
public class ApiKey
{
		@Value("${kakao.JavaScriptKey}")
		private String kakaokey;
		
		public String getKakaoApiKey()
		{
			return kakaokey;
		}
}
