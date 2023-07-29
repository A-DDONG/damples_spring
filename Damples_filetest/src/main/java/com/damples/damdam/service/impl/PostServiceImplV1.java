package com.damples.damdam.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.damples.damdam.dao.PostDao;
import com.damples.damdam.models.PostDto;
import com.damples.damdam.service.PostService;

@Service
public class PostServiceImplV1 implements PostService {

    private final PostDao postDao;

    public PostServiceImplV1(PostDao postDao) {
        this.postDao = postDao;
    }

    @Transactional
    @Override
    public void createPost(PostDto postDto) {
        postDao.insert(postDto);
    }

    @Override
    public PostDto getPost(int seq) {
        PostDto postDto = postDao.selectBySeq(seq);
        postDao.increaseViews(seq);
        return postDto;
    }

	@Override
	public List<PostDto> selectAll() {

		return postDao.selectAll();
	}



}
