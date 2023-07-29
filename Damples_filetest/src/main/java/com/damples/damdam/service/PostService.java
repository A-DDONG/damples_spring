package com.damples.damdam.service;

import java.util.List;

import com.damples.damdam.models.PostDto;

public interface PostService {
	public List<PostDto> selectAll();
    public void createPost(PostDto postDto);
    public PostDto getPost(int seq);
}
