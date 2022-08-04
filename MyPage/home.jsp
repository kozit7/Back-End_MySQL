<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
            
    
    <!-- css -->
    <link rel="stylesheet" href="resources/main.css" />

    <!-- bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <!-- google APIs -->
    <script src="https://kit.fontawesome.com/f8ebc57e81.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">

    <!-- Bootstrap 관련 script -->
    <script defer src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>

<body>

    <nav class="navbar">

        <!-- 로고 입니다. -->
        <div class="navbar__logo">
            <a href="#"><i class="fa-brands fa-bilibili fa-3x"></i></a>
        </div>

        <!-- 검색창 입니다.-->
        <ul class="navbar__menu">
            <div>
                <li><a href="#">Home</a></li>
                <li><a href="#">취업 Tip</a></li>
                <li><a href="#">스터디</a></li>
                <li><a href="#">공유</a></li>
                <li><a href="#">Q&A</a></li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-auto-close="true" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown menu
                    </a>
                    <ul class="dropdown-menu dropdown-menu-light">
                        <li><a class="dropdown-item" href="#">menu 1</a></li>
                        <li><a class="dropdown-item" href="#">menu 2</a></li>
                        <li><a class="dropdown-item" href="#">menu 3</a></li>
                    </ul>
                </li>

            </div>
        </ul>

        <!-- 로그인 회원가입 입니다.-->
        <ul class="navbar_loginsignin">
            <li><a href="#">로그인</a></li>
            <li><a href="#">회원가입</a></li>
        </ul>

    </nav>

    <div class="p-5 mb-4 bg-success bg-opacity-25 rounded-3">
        <div class="container-fluid py-5 customCon">
            <div class="MP-1">
            <h1>My Page</h1>
            <p>
               	 환영합니다 [아무개]님 ! 
            </p>
            <button type="button" class="btn btn-outline-primary">프로필 수정 »</button>
            <div style="margin: 10px"></div>
            <p><a class="btn btn-outline-success" href="#" role="button">개인정보 수정 »</a></p>
            </div>
            <div class="box" style="background: #BDBDBD;" >
    
</div>
        </div>
    </div>

    <div class="container" align="center" style="overflow: hidden">
<div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-primary">작성한 게시물</button>
  <button type="button" class="btn btn-primary">좋아요한 게시물</button>
  <button type="button" class="btn btn-primary">댓글단 게시물</button>
</div>
        <div class="row">
            <div class="col-md-4">
                <h3>작성한 게시물</h3>
                <p>
                      직접 작성한 게시물 나열
                </p>
                <p>
                      직접 작성한 게시물 나열
                </p>
                <p><a class="btn btn-sm btn-outline-secondary" href="#" role="button">수정 »</a></p>
            </div>
            <div class="col-md-4">
                <h3>좋아요한 게시물</h3>
                <p>
                  	 좋아요 누른 게시물들 나열
                </p>
                <p>
                  	 좋아요 누른 게시물들 나열
                </p>
                <p><a class="btn btn-sm btn-outline-danger" href="#" role="button">수정 »</a></p>
            </div>
            <div class="col-md-4">
                <h4>댓글을 남긴 게시물</h4>
                <p>
                     댓글을 남긴 게시물들 나열
                </p>
                <p>
                     댓글을 남긴 게시물들 나열
                </p>
                <p><a class="btn btn-sm btn-outline-warning" href="#" role="button" onclick="getHide()">수정 »</a></p>
            </div>
        </div>

        <hr>

        <div class="row">

            
                <h3>하고있는 스터디 모임</h3>
                <p><a href="" >스터디 모임 나열</a><p>스터디 모임 나열</p><p>스터디 모임 나열</p>
                <p><a class="btn btn-sm btn-outline-info btn-sky" href="#" role="button">수정 »</a></p>
           
                
            
     	   
        </div>

        <hr>
        <p><a class="btn btn-sm btn-light" style="border: 1px solid" href="#" role="button">회원탈퇴 »</a></p>

        <footer>
            <p align="left">Coding community</p>
        </footer>
   
    </div> <!-- /container -->

</body></html>

