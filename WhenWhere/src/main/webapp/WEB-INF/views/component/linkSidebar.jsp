<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar" style="background-color: rgba(255, 255, 255, 0.3)">

	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">

		<!-- search form (Optional) -->
		<!-- <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      	</form> -->
		<!-- /.search form -->

		<!-- Sidebar Menu -->
		<ul class="sidebar-menu">
			<!-- Optionally, you can add icons to the links -->
			<li><a href="../home/searchForm"> <i
					class="fa fa-search" aria-hidden="true"></i> <span>Search</span>
			</a></li>
			<li><a href="../board/notice?category=1"> <i
					class="fa fa-bullhorn" aria-hidden="true"></i> <span>Notice</span></a>
			</li>
			<li><a href="../board/event?category=4"> <i class="fa fa-gift"
					aria-hidden="true"></i><span>Event</span>
			</a></li>
			<li class="treeview"><a href="#"> <i class="fa fa-users"
					aria-hidden="true"></i><span>Communitiy</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="../board/commuity?category=2"> <i
							class="fa fa-book" aria-hidden="true"></i>Board
					</a></li>
					<li><a href="../home/chat"> <i class="fa fa-comments"
							aria-hidden="true"></i>Chat
					</a></li>
					<li><a href="../board/review?category=3"> <i
							class="fa fa-pencil-square-o" aria-hidden="true"></i>Review
					</a></li>
				</ul></li>
			<c:if test="${sessionScope.member.getAuthority() != 'admin' }">
				<li><a href="../home/admin"> <i class="fa fa-database"
						aria-hidden="true"></i><span>Admin</span>
				</a></li>
			</c:if>
		</ul>
	</section>
</aside>