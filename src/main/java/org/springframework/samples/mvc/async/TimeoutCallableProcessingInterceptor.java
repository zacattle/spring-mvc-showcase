package org.springframework.samples.mvc.async;

import java.util.concurrent.Callable;

import org.springframework.samples.mvc.config.WebMvcConfig;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.async.CallableProcessingInterceptorAdapter;

/**
 * 异步请求拦截器
 * 自定义拦截器需要在配置中{@link WebMvcConfig}进行注册(代码72行)
 */
public class TimeoutCallableProcessingInterceptor extends CallableProcessingInterceptorAdapter {

	/**
	 * 异步处理超时 调用
	 * @param request
	 * @param task
	 * @param <T>
	 * @return
	 */
	@Override
	public <T> Object handleTimeout(NativeWebRequest request, Callable<T> task) {
		throw new IllegalStateException("[" + task.getClass().getName() + "] timed out");
	}


	/**
	 * 执行异步处理之前 调用
	 * 该方法在主线程中执行，不同于preProcess方法，preProcess方法在子线程中执行
	 * @param request
	 * @param task
	 * @param <T>
	 * @throws Exception
	 */
	@Override
	public <T> void beforeConcurrentHandling(NativeWebRequest request, Callable<T> task) throws Exception {
		super.beforeConcurrentHandling(request, task);
		System.out.println("异步处理之前"+Thread.currentThread().getName());
	}

	/**
	 * 执行异步处理之前 调用
	 * 该方法在子线程中执行
	 * @param request
	 * @param task
	 * @param <T>
	 * @throws Exception
	 */
	@Override
	public <T> void preProcess(NativeWebRequest request, Callable<T> task) throws Exception {
		super.preProcess(request, task);
		System.out.println("preProcess"+Thread.currentThread().getName());
	}

	/**
	 * 异步处理完成之后 调用
	 * @param request
	 * @param task
	 * @param <T>
	 * @throws Exception
	 */
	@Override
	public <T> void postProcess(NativeWebRequest request, Callable<T> task, Object concurrentResult) throws Exception {
		super.postProcess(request, task, concurrentResult);
		System.out.println("postProcess");
	}

	/**
	 * 出现异常时 调用
	 * @param request
	 * @param task
	 * @param <T>
	 * @throws Exception
	 */
	@Override
	public <T> Object handleError(NativeWebRequest request, Callable<T> task, Throwable t) throws Exception {
		System.out.println("handleError");
		return super.handleError(request, task, t);
	}

	/**
	 * 任务完成后 调用 无论是否异常或超时
	 * @param request
	 * @param task
	 * @param <T>
	 * @throws Exception
	 */
	@Override
	public <T> void afterCompletion(NativeWebRequest request, Callable<T> task) throws Exception {
		super.afterCompletion(request, task);
		System.out.println("afterCompletion");
	}
}
