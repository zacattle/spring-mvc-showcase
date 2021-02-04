package org.springframework.samples.mvc.async;

import java.util.concurrent.Callable;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.async.WebAsyncTask;

/**
 * 异步响应实例
 * 返回Callable
 * 返回WebAsyncTask（可以设置超时时间），具体查看api
 *
 */
@Controller
@RequestMapping("/async/callable")
public class CallableController {


	/**
	 * Callable 异步处理测试
	 * @return
	 */
	@GetMapping("/response-body")
	public @ResponseBody Callable<String> callable() {

		return new Callable<String>() {
			@Override
			public String call() throws Exception {
				Thread.sleep(2000);
				return "Callable result";
			}
		};
	}

	/**
	 * Callable异步处理添加属性测试
	 * @param model
	 * @return
	 */
	@GetMapping("/view")
	public Callable<String> callableWithView(final Model model) {
		return () -> {
			Thread.sleep(2000);
			model.addAttribute("foo", "bar");
			model.addAttribute("fruit", "apple");
			return "views/html";
		};
	}

	/**
	 * Callable异步处理异常处理测试
	 * @param handled
	 * @return
	 */
	@GetMapping("/exception")
	public @ResponseBody Callable<String> callableWithException(
			final @RequestParam(required=false, defaultValue="true") boolean handled) {

		return () -> {
			Thread.sleep(2000);
			if (handled) {
				// see handleException method further below
				throw new IllegalStateException("Callable error");
			}
			else {
				throw new IllegalArgumentException("Callable error");
			}
		};
	}

	/**
	 * WebAsyncTask异步处理超时测试
	 * @return
	 */
	@GetMapping("/custom-timeout-handling")
	public @ResponseBody WebAsyncTask<String> callableWithCustomTimeoutHandling() {
		System.out.println("当前线程："+Thread.currentThread().getName());
		Callable<String> callable = () -> {
			Thread.sleep(2000);
			return "Callable result";
		};
		return new WebAsyncTask<String>(1000, callable);
	}

	/**
	 * 当前controller拦截器
	 * 方法/custom-timeout-handling请求，会超时，进入{@link TimeoutCallableProcessingInterceptor}（异步请求拦截器）中处理，抛出IllegalStateException异常，然后进入该方法
	 * @param ex
	 * @return
	 */
	@ExceptionHandler
	@ResponseBody
	public String handleException(IllegalStateException ex) {
		return "Handled exception: " + ex.getMessage();
	}

}
