<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="d-flex justify-content-between border-bottom">
<a class="navbar-brand font-weight-bold font-italic text-dark m-2 ml-4" href="/main_view"><h1>Logo</h1></a>
<nav class="navbar navbar-expand-sm font-weight-bold navbar-light col-8">
  <div class="container-fluid">
  
  &nbsp;
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse nav-fill" id="navbarHeader">
      <ul class="navbar-nav w-100 ">
      	<li class="nav-item dropdown">
      		<a class="nav-link dropdown-toggle" data-toggle="dropdown" id="navbarDropdown" role="button">Store</a>
      			<ul class="dropdown-menu"  aria-labelledby="navbarDropdown">
      				 <li><a class="dropdown-item" href="/store/product_list_view">New arrivals</a></li>
      				 <li><a class="dropdown-item" href="/store/product_list_view?category=1">Outwear</a></li>  <!-- 카테고리 숫자로 넘김 -->
		            <li><a class="dropdown-item" href="/store/product_list_view?category=2">Tops</a></li>
		            <li><a class="dropdown-item" href="/store/product_list_view?category=3">Bottoms</a></li>
		            <li><a class="dropdown-item" href="/store/product_list_view?category=4">Accessories</a></li>
      			</ul> 
      	</li>
      	      	<li class="nav-item dropdown">
      		<a class="nav-link dropdown-toggle" data-toggle="dropdown" id="navbarDropdown" role="button">Community</a>
      			<ul class="dropdown-menu"  aria-labelledby="navbarDropdown">
      				 <li><a class="dropdown-item" href="#">Q&A</a></li>
		            <li><a class="dropdown-item" href="#">Review</a></li>
      			</ul> 
      	</li>
        <c:choose>
			<c:when test="${empty userId}">
	        	<li class="nav-item"><a class="nav-link" href="/user/sign_in_view"> Account</a> </li>
			</c:when>
			<c:otherwise>
	        	<li class="nav-item"><a class="nav-link" href="/account/mypage_view"> Account</a> </li>
	        </c:otherwise>
        </c:choose>
        <li class="nav-item"> <a class="nav-link" href="#"> Cart</a> </li>
      </ul>
    </div>
  </div>
</nav>

</div>
