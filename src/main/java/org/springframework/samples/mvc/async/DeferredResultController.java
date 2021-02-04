package org.springframework.samples.mvc.async;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.async.DeferredResult;
import org.springframework.web.servlet.ModelAndView;

/**
 * DeferredResult异步处理实例
 * DeferredResult添加到队列后，当{@link DeferredResult}的setResult方法被调用后，自动响应请求
 */
@Controller
@RequestMapping("/async")
public class DeferredResultController {

	private final Queue<DeferredResult<String>> responseBodyQueue = new ConcurrentLinkedQueue<>();

	private final Queue<DeferredResult<ModelAndView>> mavQueue = new ConcurrentLinkedQueue<>();

	private final Queue<DeferredResult<String>> exceptionQueue = new ConcurrentLinkedQueue<>();


	/**
	 * 返回简单数据测试，responseBodyQueue队列中的DeferredResult会定时得到处理
	 * @return
	 */
	@GetMapping("/deferred-result/response-body")
	public @ResponseBody DeferredResult<String> deferredResult() {
		DeferredResult<String> result = new DeferredResult<>();
		this.responseBodyQueue.add(result);
		return result;
	}

	/**
	 * 返回视图数据测试
	 * @return
	 */
	@GetMapping("/deferred-result/model-and-view")
	public DeferredResult<ModelAndView> deferredResultWithView() {
		DeferredResult<ModelAndView> result = new DeferredResult<>();
		this.mavQueue.add(result);
		return result;
	}

	/**
	 * 异常测试
	 * @return
	 */
	@GetMapping("/deferred-result/exception")
	public @ResponseBody DeferredResult<String> deferredResultWithException() {
		DeferredResult<String> result = new DeferredResult<>();
		this.exceptionQueue.add(result);
		return result;
	}

	/**
	 * 超时测试
	 * @return
	 */
	@GetMapping("/deferred-result/timeout-value")
	public @ResponseBody DeferredResult<String> deferredResultWithTimeoutValue() {

		// Provide a default result in case of timeout and override the timeout value
		// set in src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml

		return new DeferredResult<>(1000L, "Deferred result after timeout");
	}

	/**
	 * 定时处理
	 * @return
	 */
	@Scheduled(fixedRate=2000)
	public void processQueues() {
		for (DeferredResult<String> result : this.responseBodyQueue) {
			result.setResult("Deferred result");
			this.responseBodyQueue.remove(result);
		}
		for (DeferredResult<String> result : this.exceptionQueue) {
			result.setErrorResult(new IllegalStateException("DeferredResult error"));
			this.exceptionQueue.remove(result);
		}
		for (DeferredResult<ModelAndView> result : this.mavQueue) {
			result.setResult(new ModelAndView("views/html", "javaBean", new JavaBean("bar", "apple")));
			this.mavQueue.remove(result);
		}
	}

	/**
	 * 异常捕获处理
	 * @return
	 */
	@ExceptionHandler
	@ResponseBody
	public String handleException(IllegalStateException ex) {
		return "Handled exception: " + ex.getMessage();
	}

}
