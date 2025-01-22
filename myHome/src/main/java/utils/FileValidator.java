package utils;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import model.Imagebbs;

public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Imagebbs.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Imagebbs bbs = (Imagebbs)target;
		if(bbs.getImage().getOriginalFilename().equals("")) { //파일을 선택하지 않은 경우
			errors.rejectValue("image", "error.code");
		}
	}

}
