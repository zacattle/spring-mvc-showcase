package org.springframework.samples.mvc.exceptions;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ExceptionController {

	@GetMapping("/exception")
	public String exception() {
		throw new IllegalStateException("Sorry!");
	}

	@GetMapping("/global-exception")
	public String businessException() throws BusinessException {
		throw new BusinessException();
	}

	/**
	 * 当前Controller异常拦截
	 * @param e 指定的异常
	 * @return
	 */
	@ExceptionHandler
	public String handle(IllegalStateException e) {
		return "IllegalStateException handled!";
	}

}
