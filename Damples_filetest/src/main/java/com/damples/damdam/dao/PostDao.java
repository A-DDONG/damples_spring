package com.damples.damdam.dao;

import java.util.List;

import com.damples.damdam.models.PostDto;

public interface PostDao {
    public List<PostDto> selectAll();
	public void insert(PostDto postDto);
    public PostDto selectBySeq(int seq);
    public void increaseViews(int seq);
}
