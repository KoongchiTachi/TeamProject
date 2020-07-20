<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Hotel Template">
    <meta name="keywords" content="Hotel, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Luxtion</title> 

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat+Alternates:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  								
	<!-- Favicon -->  						
	<link rel="apple-touch-icon" sizes="57x57" href="/resources/img/favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="/resources/img/favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/resources/img/favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="/resources/img/favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/resources/img/favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="/resources/img/favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="/resources/img/favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="/resources/img/favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="/resources/img/favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192"  href="/resources/img/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/resources/img/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/resources/img/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/resources/img/favicon/favicon-16x16.png">
	<link rel="manifest" href="/resources/img/favicon/manifest.json"> 
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="/resources/img/favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
	 
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="container-fluid">
            <div class="inner-header"> 
                <div class="logo">
                    <a href="/"><img src="/resources/img/logo.png" alt=""></a>
                </div>
                <div class="nav-right">
                <c:choose>
                	<c:when test="${not empty sessionScope.m_id}">
	                	<a href="/kjy/member/myPage" class="primary-btn" id="#btnMyPage">My Page</a>
	                	<a href="/kjy/member/logout" class="primary-btn" style="background-color : #9b3d07;">Logout</a>
                	</c:when>
                	<c:otherwise>
                		<a href="/kjy/member/login" class="primary-btn">Login</a> 
                	</c:otherwise>
                </c:choose>
                </div>
                <nav class="main-menu mobile-menu">
                    <ul>
                        <li class="active"><a href="/">Home</a></li>
                        <li><a href="#">Auction</a>
                        	<ul class="drop-menu">
                                <li><a href="/kmk/auction/premium">프리미엄</a></li>
                                <li><a href="/kmk/auction/latest">일반</a></li> 
                                <li><a href="/kmk/auction/finished">지난경매 및 결과</a></li>
                                <li><a href="/kmk/auction/howBid">응찰방법</a></li>  
                            </ul>
                        </li>
                        <li><a href="#">Service</a>
                        	<ul class="drop-menu">
                                <li><a href="/resources/about-us.html">위탁안내</a></li>
                                <li><a href="/resources/rooms.html">위탁신청</a></li>
                            </ul>
                        </li>
                        <li><a href="#">About</a>
                            <ul class="drop-menu">
                                <li><a href="/sjw/about/info">회사 소개</a></li>
                                <li><a href="/sjw/about/noticeList">공지사항</a></li>
                                <li><a href="/sjw/about/map">오시는 길</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Contact</a>
                        	<ul class="drop-menu">
                                <li><a href="/sjw/contact/faqList">FAQ</a></li>
                                <li><a href="/sjw/contact/qnaForm">1:1 문의</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->
