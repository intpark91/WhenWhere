<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

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
			<li class="active">
				<a href="../main/searchForm">
					<i class="fa fa-search"	aria-hidden="true"></i> 
					<span>Search</span>
				</a>
			</li>
			<li>
				<a href="../board/notice">
					<i class="fa fa-bullhorn" aria-hidden="true"></i>
					<span>Notice</span></a>
			</li>
			<li>
				<a href="../board/event">
					<i class="fa fa-gift" aria-hidden="true"></i><span>Event</span>
				</a>
			</li>
			<li class="treeview">
				<a href="#">
					<i class="fa fa-users" aria-hidden="true"></i><span>Communitiy</span> 
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					<li>
						<a href="../board/notice">
							<i class="fa fa-book" aria-hidden="true"></i>Board
						</a>
					</li>
					<li>
						<a href="../home/chat">
							<i class="fa fa-comments" aria-hidden="true"></i>Chat</a>
					</li>
					<li>
						<a href="../board/review">
							<i class="fa fa-pencil-square-o" aria-hidden="true"></i>Review
						</a>
					</li>
				</ul>
			</li>
		</ul>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>