package com.jeju.JejuBnB.question.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jeju.JejuBnB.question.model.dao.QuestionDao;
import com.jeju.JejuBnB.question.model.vo.Question;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService{
	@Autowired
	private QuestionDao questionDao;
	
	public ArrayList<Question> selectList(){
		return questionDao.selectList();
	}
	
	public int insertMyQuestion(Question question) {
		return questionDao.insertMyQuestion(question);
	}

}
