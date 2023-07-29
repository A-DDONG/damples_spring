package com.damples.damdam.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.damples.damdam.models.PostDto;
import com.damples.damdam.service.PostService;

@Controller
public class PostController {
    private final PostService postService;

    @Autowired
    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/posts")
    public String getPosts(Model model) {
        List<PostDto> posts = postService.selectAll();
        model.addAttribute("posts", posts);
        return "postList";  // this should match the name of your postList.jsp file
    }

    @PostMapping("/posts")
    public String createPost(@ModelAttribute PostDto postDto, @RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) throws IOException {
        String uploadDir = "C:/app/upload/";
        File dir = new File(uploadDir);
        if (!dir.exists()) dir.mkdirs();  // Create the directory if it does not exist

        String filePath = uploadDir + file.getOriginalFilename();
        Files.write(Paths.get(filePath), file.getBytes());  // Write the uploaded file to the specified path

        String imageUrl = "/upload/" + file.getOriginalFilename();  // Create the URL for accessing the uploaded file

        postDto.setFilePath(imageUrl);  // Set the URL as the filePath of the postDto
        postDto.setCreatedAt(LocalDateTime.now());
        postDto.setViews(0);
        postService.createPost(postDto);

        redirectAttributes.addFlashAttribute("message", "Post created successfully");
        return "redirect:/posts";  // Redirect to post list after creating a new post
    }

    @GetMapping("/posts/{seq}")
    public String getPost(@PathVariable int seq, Model model) {
        PostDto postDto = postService.getPost(seq);
        model.addAttribute("post", postDto);
        return "postDetail";  // this should match the name of your postDetail.jsp file
    }
    
    @RequestMapping(value="/posts/create", method=RequestMethod.GET)
    public String createPostForm() {
        return "createPost";  
    }
}

