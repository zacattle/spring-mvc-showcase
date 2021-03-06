<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>spring-mvc-showcase</title>
	<link href="<c:url value="/resources/form.css" />" rel="stylesheet"  type="text/css" />		
	<link href="<c:url value="/resources/jqueryui/1.8/themes/base/jquery.ui.core.css" />" rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/resources/jqueryui/1.8/themes/base/jquery.ui.theme.css" />" rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/resources/jqueryui/1.8/themes/base/jquery.ui.tabs.css" />" rel="stylesheet" type="text/css"/>
	
	<!--
		Used for including CSRF token in JSON requests
		Also see bottom of this file for adding CSRF token to JQuery AJAX requests
	-->
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<body>
<h1><a href="<c:url value="/" />">spring-mvc-showcase</a></h1>
<p>建议F12 打开Debug模式 查看具体的请求过程</p>
<div id="tabs">
	<ul>
		<li><a href="#simple">简单实例</a></li>
		<li><a href="#mapping">请求地址映射</a></li>
		<li><a href="#data">请求数据</a></li>
		<li><a href="#responses">响应数据</a></li>
		<li><a href="#messageconverters">消息转换</a></li>
		<li><a href="#views">视图渲染</a></li>
		<li><a href="#convert">类型转换</a></li>
		<li><a href="#validation">数据校验</a></li>
		<li><a href="<c:url value="/form" />" title="forms">表单数据收集</a></li>
		<li><a href="<c:url value="/fileupload" />" title="fileupload">文件上传</a></li>
		<li><a href="#exceptions">异常处理</a></li>
		<li><a href="#redirect">重定向</a></li>
        <li><a href="#async">异步请求</a></li>
    </ul>
    <div id="simple">
		<h2>简单实例</h2>
		<p>
			查看 <strong><code>org.springframework.samples.mvc.simple</code></strong> 包中  @Controller
		</h3>
		<ul>
			<li>
				<a id="simpleLink" class="textLink" href="<c:url value="/simple" />">请求URL:/simple</a>
			</li>
			<li>
				<a id="simpleRevisited" class="textLink" href="<c:url value="/simple/revisited" />">请求/simple/revisited</a>
			</li>
		</ul>
	</div>
	<div id="mapping">
		<h2>请求映射</h2>
		<p>
			查看 <strong><code>org.springframework.samples.mvc.mapping</code></strong> 包中的 @Controller
		</p>
		<ul>
			<li>
				<a id="byPath" class="textLink" href="<c:url value="/mapping/path" />">通过url路径直接访问</a>
			</li>
			<li>
				<a id="byPathPattern" class="textLink" href="<c:url value="/mapping/path/wildcard" />">通过url中通配符</a>
			</li>
			<li>
				<a id="byMethod" class="textLink" href="<c:url value="/mapping/method" />">通过请求方法类型确定</a>
			</li>
			<li>
				<a id="byParameter" class="textLink" href="<c:url value="/mapping/parameter?foo=bar" />">通过请求路径，方法和携带指定参数确定</a>
			</li>
			<li>
				<a id="byNotParameter" class="textLink" href="<c:url value="/mapping/parameter" />">通过请求路径，方法和不携带指定参数确定</a>
			</li>
			<li>
				<a id="byHeader" href="<c:url value="/mapping/header" />">通过携带指定的header确定</a>
			</li>
			<li>
				<a id="byHeaderNegation" class="textLink" href="<c:url value="/mapping/header" />">通过不携带指定的header确定</a>
			</li>
			<li>
				<form id="byConsumes" class="readJsonForm" action="<c:url value="/mapping/consumes" />" method="post">
					<input id="byConsumesSubmit" type="submit" value="通过设置指定的consumes，即Content-Type" />
				</form>
			</li>
			<li>
				<a id="byProducesAcceptJson" class="writeJsonLink" href="<c:url value="/mapping/produces" />">通过设置 Accept=application/json</a>
			</li>
            <li>
                <a id="byProducesAcceptXml" class="writeXmlLink" href="<c:url value="/mapping/produces" />">通过设置 Accept=application/xml</a>
            </li>
            <li>
              <a id="byProducesJsonExt" class="writeJsonLink" href="<c:url value="/mapping/produces.json" />">通过 ".json"后缀访问</a>
            </li>
            <li>
                <a id="byProducesXmlExt" class="writeXmlLink" href="<c:url value="/mapping/produces.xml" />">通过 ".xml"后缀访问</a>
            </li>
		</ul>
	</div>
	<div id="data">
		<h2>请求数据处理</h2>
		<p>
			查看 <strong><code>org.springframework.samples.mvc.data</code></strong> 包中的 @Controller
		</p>
		<ul>
			<li>
				<a id="param" class="textLink" href="<c:url value="/data/param?foo=bar" />">查询参数处理</a>
			</li>
			<li>
				<a id="group" class="textLink" href="<c:url value="/data/group?param1=foo&param2=bar&param3=baz" />">多组查询参数</a>
			</li>
			<li>
				<a id="var" class="textLink" href="<c:url value="/data/path/foo" />">路径变量</a>
			</li>
			<li>
				<a id="matrixVar" class="textLink" href="<c:url value="/data/matrixvars;foo=bar/simple" />">矩阵变量</a>
			</li>
			<li>
				<a id="matrixVarMultiple" class="textLink" href="<c:url value="/data/matrixvars;foo=bar1/multiple;foo=bar2" />">多个矩阵变量</a>
			</li>
			<li>
				<a id="header" class="textLink" href="<c:url value="/data/header" />">Header</a>
			</li>
			<li>
				<form id="requestBody" class="textForm" action="<c:url value="/data/body" />" method="post">
					<input id="requestBodySubmit" type="submit" value="Body携带数据" />
				</form>
			</li>				
			<li>
				<form id="requestBodyAndHeaders" class="textForm" action="<c:url value="/data/entity" />" method="post">
					<input id="requestBodyAndHeadersSubmit" type="submit" value="Body 和 Headers携带数据" />
				</form>
			</li>
		</ul>	
		<div id="standardArgs">
			<h3>参数解析</h3>
			<p>
				查看 <strong><code>org.springframework.samples.mvc.data.standard</code></strong> 包中的 @Controller
			</p>
			<ul>
				<li>
					<a id="request" class="textLink" href="<c:url value="/data/standard/request" />">请求参数解析</a>
				</li>
				<li>
					<form id="requestReader" class="textForm" action="<c:url value="/data/standard/request/reader" />" method="post">
						<input id="requestReaderSubmit" type="submit" value="后端通过Reader读取数据" />
					</form>
				</li>			
				<li>
					<form id="requestIs" class="textForm" action="<c:url value="/data/standard/request/is" />" method="post">
						<input id="requestIsSubmit" type="submit" value="后端通过InputStream读取数据" />
					</form>
				</li>
				<li>
					<a id="response" class="textLink" href="<c:url value="/data/standard/response" />">Response响应</a>
				</li>			
				<li>
					<a id="writer" class="textLink" href="<c:url value="/data/standard/response/writer" />">后端通过 Writer回写响应数据</a>
				</li>
				<li>
					<a id="os" class="textLink" href="<c:url value="/data/standard/response/os" />">后端通过OutputStream回写响应数据</a>
				</li>
				<li>
					<a id="session" class="textLink" href="<c:url value="/data/standard/session" />">后端Session</a>
				</li>			
			</ul>
		</div>
		<div id="customArgs">
			<h3>后端添加自定义数据解析</h3>
			<p>
				查看 <strong><code>org.springframework.samples.mvc.data.custom</code></strong> 包中的 @Controller
			</p>
			<ul>
				<li>
					<a id="customArg" class="textLink" href="<c:url value="/data/custom" />">Custom</a>			
				</li>
			</ul>
		</div>
	</div>
	<div id="responses">
		<h2>响应数据回写</h2>
		<p>
			查看<strong><code>org.springframework.samples.mvc.response</code></strong> 包中的 @Controller
		</p>		
		<ul>
			<li>
				<a id="responseBody" class="textLink" href="<c:url value="/response/annotation" />">使用@ResponseBody</a>
			</li>
			<li>
				<a id="responseCharsetAccept" class="utf8TextLink" href="<c:url value="/response/charset/accept" />">@ResponseBody (UTF-8 请求头)</a>
			</li>
			<li>
				<a id="responseCharsetProduce" class="textLink" href="<c:url value="/response/charset/produce" />">@ResponseBody (UTF-8 请求produced)</a>
			</li>
			<li>
				<a id="responseEntityStatus" class="textLink" href="<c:url value="/response/entity/status" />">后端使用ResponseEntity (自定义status码)</a>
			</li>
			<li>
				<a id="responseEntityHeaders" class="textLink" href="<c:url value="/response/entity/headers" />">后端使用ResponseEntity (自定义响应headers)</a>
			</li>
		</ul>	
	</div>
	<div id="messageconverters">
		<h2>消息（请求内容）转换</h2>
		<p>
			查看 <strong><code>org.springframework.samples.mvc.messageconverters</code></strong> 包中的 @Controller
		</p>	
		<div id="stringMessageConverter">
			<h3>使用StringHttpMessageConverter转换器实例</h3>
			<ul>
				<li>
					<form id="readString" class="textForm" action="<c:url value="/messageconverters/string" />" method="post">
						<input id="readStringSubmit" type="submit" value="读取String" />
					</form>
				</li>
				<li>
					<a id="writeString" class="textLink" href="<c:url value="/messageconverters/string" />">回写String</a>
				</li>
			</ul>
			<h3>使用FormHttpMessageConverter转换器实例</h3>
			<ul>
				<li>
					<form id="readForm" action="<c:url value="/messageconverters/form" />" method="post">
						<input id="readFormSubmit" type="submit" value="读取表单数据" />
					</form>
				</li>
				<li>
					<a id="writeForm" href="<c:url value="/messageconverters/form" />">回写数据到表单</a>
				</li>
			</ul>
			<h3>使用Jaxb2RootElementHttpMessageConverter转换器实例</h3>
			<ul>
				<li>
					<form id="readXml" class="readXmlForm" action="<c:url value="/messageconverters/xml" />" method="post">
						<input id="readXmlSubmit" type="submit" value="读取XML" />
					</form>
				</li>
				<li>
					<a id="writeXmlAccept" class="writeXmlLink" href="<c:url value="/messageconverters/xml" />">回写 XML通过head:Accept=application/xml</a>
				</li>
                <li>
                    <a id="writeXmlExt" class="writeXmlLink" href="<c:url value="/messageconverters/xml.xml" />">通过后缀".xml"回写xml</a>
                </li>
			</ul>
			<h3>使用MappingJacksonHttpMessageConverter转换器实例</h3>
			<ul>
				<li>
					<form id="readJson" class="readJsonForm" action="<c:url value="/messageconverters/json" />" method="post">
						<input id="readJsonSubmit" type="submit" value="读取JSON" />
					</form>
				</li>
				<li>
					<form id="readJsonInvalid" class="readJsonForm invalid" action="<c:url value="/messageconverters/json" />" method="post">
						<input id="readInvalidJsonSubmit" type="submit" value="读取为通过校验JSON (400 response code)" />
					</form>
				</li>
				<li>
					<a id="writeJsonAccept" class="writeJsonLink" href="<c:url value="/messageconverters/json" />">回写Json通过head： Accept=application/json</a>
				</li>
                <li>
                    <a id="writeJsonExt" class="writeJsonLink" href="<c:url value="/messageconverters/json.json" />">通过后缀".json"回写json</a>
                </li>
			</ul>
			<h3>使用AtomFeedHttpMessageConverter转换器实例</h3>
			<ul>
				<li>
					<form id="readAtom" action="<c:url value="/messageconverters/atom" />" method="post">
						<input id="readAtomSubmit" type="submit" value="读取Atom" />
					</form>
				</li>
				<li>
					<a id="writeAtom" href="<c:url value="/messageconverters/atom" />">回写Atom</a>
				</li>
			</ul>
			<h3>使用RssChannelHttpMessageConverter转换器实例</h3>
			<ul>
				<li>
					<form id="readRss" action="<c:url value="/messageconverters/rss" />" method="post">
						<input id="readRssSubmit" type="submit" value="读取Rss" />
					</form>
				</li>
				<li>
					<a id="writeRss" href="<c:url value="/messageconverters/rss" />">回写Rss</a>
				</li>
			</ul>		
		</div>
	</div>
	<div id="views">
		<h2>视图渲染</h2>
		<p>
			查看 <strong><code>org.springframework.samples.mvc.views</code></strong> 包中的 @Controller
		</p>
		<ul>
			<li>
				<a href="<c:url value="/views/html" />">JSP模板回写html</a>
			</li>
		</ul>	
		<ul>
			<li>
				<a href="<c:url value="/views/viewName" />">DefaultRequestToViewNameTranslator视图转换器（默认）</a>
			</li>
		</ul>	
		<ul>
			<li>
				<a href="<c:url value="/views/pathVariables/bar/apple" />">模板中得到路径变量</a>
			</li>
		</ul>
		<ul>
			<li>
				<a href="<c:url value="/views/dataBinding/bar/apple" />">路径变量绑定到bean</a>
			</li>
		</ul>
	</div>
	<div id="convert">
		<h2>类型转换</h2>
		<p>
			查看 <strong><code>org.springframework.samples.mvc.convert</code></strong> 包中的 @Controller
		</p>
		<ul>
			<li>
				<a id="primitive" class="textLink" href="<c:url value="/convert/primitive?value=3" />">普通</a>
			</li>
			<li>
				<a id="date" class="textLink" href="<c:url value="/convert/date/2010-07-04" />">日期类型</a>
			</li>
			<li>
				<a id="collection" class="textLink" href="<c:url value="/convert/collection?values=1&values=2&values=3&values=4&values=5" />">集合类型 1 (multi-value parameter)</a>
			</li>
			<li>
				<a id="collection2" class="textLink" href="<c:url value="/convert/collection?values=1,2,3,4,5" />">集合类型 2 (single comma-delimited parameter value)</a>
			</li>
			<li>
				<a id="formattedCollection" class="textLink" href="<c:url value="/convert/formattedCollection?values=2010-07-04,2011-07-04" />">@Formatted注解Collection</a>
			</li>		
			<li>
				<a id="valueObject" class="textLink" href="<c:url value="/convert/value?value=123-45-6789" />">Custom Value Object</a>
			</li>
			<li>
				<a id="customConverter" class="textLink" href="<c:url value="/convert/custom?value=123-45-6789" />">自定义转换器</a>
			</li>		
		</ul>
		<div id="convert-bean">
			<h3>JavaBean属性绑定数据</h3>
			<ul>
				<li>
					<a id="primitiveProp" class="textLink" href="<c:url value="/convert/bean?primitive=3" />">简单</a>
				</li>	
				<li>
					<a id="dateProp" class="textLink" href="<c:url value="/convert/bean?date=2010-07-04" />">日期</a>
				</li>	
				<li>
					<a id="maskedProp" class="textLink" href="<c:url value="/convert/bean?masked=(205) 333-3333" />">自定义</a>
				</li>	
				<li>
					<a id="listProp" class="textLink" href="<c:url value="/convert/bean?list[0]=1&list[1]=2&list[2]=3" />">结合 Elements</a>
				</li>
				<li>
					<a id="formattedListProp" class="textLink" href="<c:url value="/convert/bean?formattedList[0]=2010-07-04&formattedList[1]=2011-07-04" />">注解用在集合属性</a>
				</li>
				<li>
					<a id="mapProp" class="textLink" href="<c:url value="/convert/bean?map[0]=apple&map[1]=pear" />">Map属性绑定数据</a>
				</li>
				<li>
					<a id="nestedProp" class="textLink" href="<c:url value="/convert/bean?nested.foo=bar&nested.list[0].foo=baz&nested.map[key].list[0].foo=bip" />">内嵌数据绑定</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="validation">
		<h2>数据校验</h2>
		<p>
			查看 <strong><code>org.springframework.samples.mvc.validation</code></strong> 包中的 @Controller
		</p>
		<ul>
			<li>
				<a id="validateNoErrors" class="textLink" href="<c:url value="/validate?number=3&date=2029-07-04" />">数据校验, 无错误时</a>
			</li>
			<li>
				<a id="validateErrors" class="textLink" href="<c:url value="/validate?number=3&date=2010-07-01" />">数据校验, 有错误时</a>
			</li>
		</ul>	
	</div>
	<div id="exceptions">
		<h2>异常处理</h2>
		<p>
			查看 <strong><code>org.springframework.samples.mvc.exceptions</code></strong> 包中的 @Controller
		</p>
		<ul>
			<li>
				<a id="exception" class="textLink" href="<c:url value="/exception" />">在当前controller中使用@ExceptionHandler</a>
			</li>
			<li>
				<a id="globalException" class="textLink" href="<c:url value="/global-exception" />">全局使用注解@ExceptionHandler</a>
			</li>
		</ul>
	</div>
	<div id="redirect">
		<h2>重定向</h2>
		<p>
			查看 <strong><code>org.springframework.samples.mvc.redirect</code></strong> package for the @Controller code
		</p>
		<ul>
			<li>
				<a href="<c:url value="/redirect/uriTemplate" />">URI字符串实现重定向</a>
			</li>
			<li>
				<a href="<c:url value="/redirect/uriComponentsBuilder" />">使用UriComponentsBuilder实现</a>
			</li>
		</ul>
	</div>
	<div id="async">
		<h2>异步请求</h2>
		<p>
			<em>Note: 连接会在2-3秒后完成.</em>
		</p>
		<p>
			查看 <strong><code>org.springframework.samples.mvc.async</code></strong>包中的 @Controller .
		</p>
		<ul>
		<li>
			<a id="callableResponseBodyLink" class="textLink"
				href="<c:url value="/async/callable/response-body" />">GET /async/callable/response-body</a>
		</li>
		<li>
			<a id="callableViewLink" class="textLink"
				href="<c:url value="/async/callable/view" />">GET /async/callable/view</a>
		</li>
		<li>
			<a id="callableExceptionLink" class="textLink"
				href="<c:url value="/async/callable/exception" />">GET /async/callable/exception</a>
		</li>
		<li>
			<a id="callableUnhandledExceptionLink" class="textLink"
				href="<c:url value="/async/callable/exception?handled=false" />">GET /async/callable/exception?handled=false</a>
				(500 Error expected)
		</li>
		<li>
			<a id="callableCustomTimeoutLink" class="textLink"
				href="<c:url value="/async/callable/custom-timeout-handling" />">GET /async/callable/custom-timeout-handling</a>
		</li>
		<li>
			<a id="deferredResultSuccessLink" class="textLink"
				href="<c:url value="/async/deferred-result/response-body" />">GET /async/deferred-result/response-body</a>
		</li>
		<li>
			<a id="deferredResultModelAndViewLink" class="textLink"
				href="<c:url value="/async/deferred-result/model-and-view" />">GET /async/deferred-result/model-and-view</a>
		</li>
		<li>
			<a id="deferredResultErrorLink" class="textLink"
				href="<c:url value="/async/deferred-result/exception" />">GET /async/deferred-result/exception</a>
		</li>
		<li>
			<a id="deferredResultTimeoutValueLink" class="textLink"
				href="<c:url value="/async/deferred-result/timeout-value" />">GET /async/deferred-result/timeout-value</a>
		</li>
		</ul>
	</div>
</div>
<script type="text/javascript" src="<c:url value="/resources/jquery/1.6/jquery.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/jqueryform/2.8/jquery.form.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/jqueryui/1.8/jquery.ui.core.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/jqueryui/1.8/jquery.ui.widget.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/jqueryui/1.8/jquery.ui.tabs.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/json2.js" />"></script>
<script>
	MvcUtil = {};
	MvcUtil.showSuccessResponse = function (text, element) {
		MvcUtil.showResponse("success", text, element);
	};
	MvcUtil.showErrorResponse = function showErrorResponse(text, element) {
		MvcUtil.showResponse("error", text, element);
	};
	MvcUtil.showResponse = function(type, text, element) {
		var responseElementId = element.attr("id") + "Response";
		var responseElement = $("#" + responseElementId);
		if (responseElement.length == 0) {
			responseElement = $('<span id="' + responseElementId + '" class="' + type + '" style="display:none">' + text + '</span>').insertAfter(element);
		} else {
			responseElement.replaceWith('<span id="' + responseElementId + '" class="' + type + '" style="display:none">' + text + '</span>');
			responseElement = $("#" + responseElementId);
		}
		responseElement.fadeIn("slow");
	};
	MvcUtil.xmlencode = function(xml) {
		//for IE 
		var text;
		if (window.ActiveXObject) {
		    text = xml.xml;
		 }
		// for Mozilla, Firefox, Opera, etc.
		else {
		   text = (new XMLSerializer()).serializeToString(xml);
		}			
		    return text.replace(/\&/g,'&'+'amp;').replace(/</g,'&'+'lt;')
	        .replace(/>/g,'&'+'gt;').replace(/\'/g,'&'+'apos;').replace(/\"/g,'&'+'quot;');
	};
</script>	
<script type="text/javascript">
$(document).ready(function() {
	$("#tabs").tabs();

	// Append '#' to the window location so "Back" returns to the selected tab
	// after a redirect or a full page refresh (e.g. Views tab).

	// However, note this general disclaimer about going back to previous tabs: 
	// https://docs.jquery.com/UI/API/1.8/Tabs#Back_button_and_bookmarking

	$("#tabs").bind("tabsselect", function(event, ui) { window.location.hash = ui.tab.hash; });


	$("a.textLink").click(function(){
		var link = $(this);
		$.ajax({ url: link.attr("href"), dataType: "text", success: function(text) { MvcUtil.showSuccessResponse(text, link); }, error: function(xhr) { MvcUtil.showErrorResponse(xhr.responseText, link); }});
		return false;
	});

	$("a.utf8TextLink").click(function(){
		var link = $(this);
		$.ajax({ url: link.attr("href"), dataType: "text", beforeSend: function(req) { req.setRequestHeader("Accept", "text/plain;charset=UTF-8"); }, success: function(text) { MvcUtil.showSuccessResponse(text, link); }, error: function(xhr) { MvcUtil.showErrorResponse(xhr.responseText, link); }});
		return false;
	});

	$("form.textForm").submit(function(event) {
		var form = $(this);
		var button = form.children(":first");
		$.ajax({ type: "POST", url: form.attr("action"), data: "foo", contentType: "text/plain", dataType: "text", success: function(text) { MvcUtil.showSuccessResponse(text, button); }, error: function(xhr) { MvcUtil.showErrorResponse(xhr.responseText, button); }});
		return false;
	});

	$("#readForm").submit(function() {
		var form = $(this);
		var button = form.children(":first");
		$.ajax({ type: "POST", url: form.attr("action"), data: "foo=bar&fruit=apple", contentType: "application/x-www-form-urlencoded", dataType: "text", success: function(text) { MvcUtil.showSuccessResponse(text, button); }, error: function(xhr) { MvcUtil.showErrorResponse(xhr.responseText, button); }});
		return false;
	});

	$("#writeForm").click(function() {
		var link = $(this);
		$.ajax({ url: this.href, dataType: "text", beforeSend: function(req) { req.setRequestHeader("Accept", "application/x-www-form-urlencoded"); }, success: function(form) { MvcUtil.showSuccessResponse(form, link); }, error: function(xhr) { MvcUtil.showErrorResponse(xhr.responseText, link); }});					
		return false;
	});

	$("form.readXmlForm").submit(function() {
		var form = $(this);
		var button = form.children(":first");
		$.ajax({ type: "POST", url: form.attr("action"), data: "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><javaBean><foo>bar</foo><fruit>apple</fruit></javaBean>", contentType: "application/xml", dataType: "text", success: function(text) { MvcUtil.showSuccessResponse(text, button); }, error: function(xhr) { MvcUtil.showErrorResponse(xhr.responseText, button); }});
		return false;
	});

	$("a.writeXmlLink").click(function() {
		var link = $(this);
		$.ajax({ url: link.attr("href"),
			beforeSend: function(req) { 
				if (!this.url.match(/\.xml$/)) {
					req.setRequestHeader("Accept", "application/xml");
				}
			},
			success: function(xml) {
				MvcUtil.showSuccessResponse(MvcUtil.xmlencode(xml), link);
			},
			error: function(xhr) { 
				MvcUtil.showErrorResponse(xhr.responseText, link);
			}
		});
		return false;
	});					

	$("form.readJsonForm").submit(function() {
		var form = $(this);
		var button = form.children(":first");
		var data = form.hasClass("invalid") ?
				"{ \"foo\": \"bar\" }" : 
				"{ \"foo\": \"bar\", \"fruit\": \"apple\" }";
		$.ajax({ type: "POST", url: form.attr("action"), data: data, contentType: "application/json", dataType: "text", success: function(text) { MvcUtil.showSuccessResponse(text, button); }, error: function(xhr) { MvcUtil.showErrorResponse(xhr.responseText, button); }});
		return false;
	});

	$("a.writeJsonLink").click(function() {
		var link = $(this);
		$.ajax({ url: this.href,
			beforeSend: function(req) {
				if (!this.url.match(/\.json$/)) {
					req.setRequestHeader("Accept", "application/json");
				}
			},
			success: function(json) {
				MvcUtil.showSuccessResponse(JSON.stringify(json), link);
			},
			error: function(xhr) {
				MvcUtil.showErrorResponse(xhr.responseText, link);
			}});
		return false;
	});

	$("#readAtom").submit(function() {
		var form = $(this);
		var button = form.children(":first");
		$.ajax({ type: "POST", url: form.attr("action"), data: '<?xml version="1.0" encoding="UTF-8"?> <feed xmlns="http://www.w3.org/2005/Atom"><title>My Atom feed</title></feed>', contentType: "application/atom+xml", dataType: "text", success: function(text) { MvcUtil.showSuccessResponse(text, button); }, error: function(xhr) { MvcUtil.showErrorResponse(xhr.responseText, button); }});
		return false;
	});

	$("#writeAtom").click(function() {
		var link = $(this);
		$.ajax({ url: link.attr("href"),
			beforeSend: function(req) { 
				req.setRequestHeader("Accept", "application/atom+xml");
			},
			success: function(feed) {
				MvcUtil.showSuccessResponse(MvcUtil.xmlencode(feed), link);
			},
			error: function(xhr) { 
				MvcUtil.showErrorResponse(xhr.responseText, link);
			}
		});
		return false;
	});
	
	$("#readRss").submit(function() {
		var form = $(this);
		var button = form.children(":first");
		$.ajax({ type: "POST", url: form.attr("action"), data: '<?xml version="1.0" encoding="UTF-8"?> <rss version="2.0"><channel><title>My RSS feed</title></channel></rss>', contentType: "application/rss+xml", dataType: "text", success: function(text) { MvcUtil.showSuccessResponse(text, button); }, error: function(xhr) { MvcUtil.showErrorResponse(xhr.responseText, button); }});
		return false;
	});

	$("#writeRss").click(function() {
		var link = $(this);	
		$.ajax({ url: link.attr("href"),
			beforeSend: function(req) { 
				req.setRequestHeader("Accept", "application/rss+xml");
			},
			success: function(feed) {
				MvcUtil.showSuccessResponse(MvcUtil.xmlencode(feed), link);
			},
			error: function(xhr) { 
				MvcUtil.showErrorResponse(xhr.responseText, link);
			}
		});
		return false;
	});

	$("#byHeader").click(function(){
		var link = $(this);
		$.ajax({ url: this.href, dataType: "text", beforeSend: function(req) { req.setRequestHeader("FooHeader", "foo"); }, success: function(form) { MvcUtil.showSuccessResponse(form, link); }, error: function(xhr) { MvcUtil.showErrorResponse(xhr.responseText, link); }});
		return false;
	});

	// Include CSRF token as header in JQuery AJAX requests
	// See https://docs.spring.io/spring-security/site/docs/3.2.x/reference/htmlsingle/#csrf-include-csrf-token-ajax
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});

});
</script>
</body>
</html>
