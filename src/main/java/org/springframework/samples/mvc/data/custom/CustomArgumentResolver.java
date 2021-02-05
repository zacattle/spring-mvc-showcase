package org.springframework.samples.mvc.data.custom;

import org.springframework.core.MethodParameter;
import org.springframework.samples.mvc.config.WebMvcConfig;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

/**
 * 自定义方法参数解析器
 * 需要在配置信息中注册，查看{@link WebMvcConfig}中41行
 *
 */
public class CustomArgumentResolver implements HandlerMethodArgumentResolver {

	/**
	 * 解析指定参数的条件
	 * @param parameter
	 * @return
	 */
	public boolean supportsParameter(MethodParameter parameter) {
		return parameter.getParameterAnnotation(RequestAttribute.class) != null;
	}

	/**
	 * 解析方法参数，返回解析后的值
	 * @param parameter
	 * @param mavContainer
	 * @param webRequest
	 * @param binderFactory
	 * @return
	 * @throws Exception
	 */
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory)
			throws Exception {

		RequestAttribute attr = parameter.getParameterAnnotation(RequestAttribute.class);
		Object attri =  webRequest.getAttribute(attr.value(), WebRequest.SCOPE_REQUEST);
		//这行可能导致返回数据中文乱码，会根据请求中的header决定最中编码，默认使用的iso-8859-1
		//return attri+"自定义解析规则之后";
		return attri;
	}
	
}
