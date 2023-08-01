package com.damples.damdam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.damples.damdam.models.FileDto;

public interface FileDao {
	
	public int insertfile(@Param("list") List<FileDto> files, @Param("b_seq") long b_seq);

	// 게시판과 연결할때 사용할 method
	@Select("SELECT * FROM tbl_file WHERE i_bseq = #{b_seq}")
	public List<FileDto> findByBSeq(long b_seq);

	@Select("SELECT * FROM tbl_file WHERE i_seq = #{id}")
	public FileDto findByid(long id);
	
	@Select("select i_uploadName from tbl_file  where i_bseq = #{bseq} limit 1 ")
	public FileDto findByBseq(long bseq);

	@Delete("DELETE FROM tbl_file WHERE i_bseq = #{seqNum}")
	public int deletefile(long seqNum);
	
	public int updatefile(@Param("list") List<FileDto> files, @Param("b_seq") long b_seq);
}
