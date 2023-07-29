package com.damples.damdam.models;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PostDto {

    private int seq;
    private String nickname;
    private String password;
    private String category;
    private String title;
    private String content;
    private String filePath;
    private LocalDateTime createdAt;
    private int views;
}
