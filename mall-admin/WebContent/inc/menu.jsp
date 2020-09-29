<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<nav class="navbar navbar-expand-sm bg-secondary navbar-light">
<ul class="navbar-nav nav-tabs ">
	<li class="nav-item active">
		<a class="nav-link text-dark active" data-toggle="tab" role="button" href="/mall-admin/index.jsp">[홈으로]</a>
	</li>
	<li class="nav-item">
		<a class="nav-link text-light" data-toggle="tab" role="button" href="/mall-admin/category/categoryList.jsp">[상품카테고리 관리]</a>
	</li>
	<li class="nav-item">
		<a class="nav-link text-light" data-toggle="tab" role="button" href="/mall-admin/product/productList.jsp">[상품 관리]</a>
	</li>
	<li class="nav-item">
		<a class="nav-link text-light" data-toggle="tab" role="button" href="/mall-admin/orders/ordersList.jsp">[주문관리]</a>
	</li>
	
	<li class="nav-item">
		<a class="nav-link text-light" data-toggle="tab" role="button" href="/mall-admin/member/memberList.jsp">[회원정보]</a>
	</li>
	
	<li class="nav-item">
		<a class="nav-link text-light" data-toggle="tab" role="button" href="/mall-admin/notice/noticeList.jsp">[공지사항 수정]</a>
	</li>
	
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" role="button" href="/mall-admin/logoutAction.jsp"><kbd class = "text-danger">[로그아웃]</kbd></a>
	</li>
</ul>

</nav>