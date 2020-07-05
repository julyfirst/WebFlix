<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="../../../resources/css/chart/chart.css" type="text/css">
    <title>Document</title>
</head>
<body>
<div class="mv-container"></div>
    
    <!-- 메뉴바 -->
      <div class="mv-header">
        <h1><a href="../../" style="text-decoration: none;">웹플릭스</a></h1>
      </div>

      <div class="mv-content">
        <ul>
          <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">영화</a>
            <div class="dropdown-content">
              <a href="./action">액션</a>
              <a href="./dramas">멜로</a>
              <a href="./horror">공포</a>
              <a href="./animation">애니</a>
            </div>

      
          <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">이벤트</a>
            <div class="dropdown-content">
            </div>
          </li>

          <li class="dropdown">
            <a href="../../bb/list" class="dropbtn">자유게시판</a>
            <div class="dropdown-content">
            </div>  

          <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn">마이페이지</a>
            <div class="dropdown-content">
              <a href="#">구매목록</a>
            </div> 

          <li style="float:right"><a href="#">로그인</a></li>
          <li style="float:right"><a href="#">회원가입</a></li>
        </ul>
      </div>
         <!-- section -->
<div class="mv-section">
     
    <h3 class="mv-section1">장르별 차트</h3>

    
        <div class="mv-section2">
            <a href="./action" style="text-decoration: none; color: gray;">액션</a> |
            <a href="./dramas" style="text-decoration: none; color: gray;">멜로</a> |
            <a href="./horror" style="text-decoration: none; color: gray;">공포</a> |
            <a href="./animation" style="text-decoration: none; color: gray;">애니</a> 
        </div>

        <div class="contentbox2">
          <input type="text" placeholder="영화명 검색">
          
          <button class="kk1 contentbox2">
            <i class="xi-search"></i>
          </button>

        </div>
        
