package com.jeju.JejuBnB.question.model.service;

import java.util.ArrayList;

import com.jeju.JejuBnB.question.model.vo.Question;

public interface QuestionService {
	ArrayList<Question>selectList();
	int insertMyQuestion(Question question);
}
