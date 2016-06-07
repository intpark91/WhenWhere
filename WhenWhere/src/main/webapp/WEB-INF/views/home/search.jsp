<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <jsp:include page="../component/core_head.jsp" />
   <title>searchTest</title>
   <link rel="stylesheet" href="../css/search.css">
   <!-- <link rel="stylesheet" href="../css/lightslider.css" /> -->
   <link rel="stylesheet" href="../css/locationTab.css" />
   <link rel="stylesheet" href="../css/eventSlider.css" />
   
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">

   <div class="wrapper">
      <!-- include -->
      <jsp:include page="../component/header.jsp" />
      <jsp:include page="../component/linkSidebar.jsp" />

      <section class="bg-primary section1">
         <div class="container" align="center">
            <div class="row center">
               <div class="hero-unit">
                  <div class="input-daterange" id="datepicker">
                     <div class="col-sm-offset-3 col-sm-2">
                        <h1>
                           <span class="label label-info">시작일</span>
                        </h1>
                        <input type="text" class="input-small" name="start" id="start"/>
                     </div>

                     <div class="col-sm-offset-2 col-sm-2">
                        <h1>
                           <span class="label label-info">종료일</span>
                        </h1>
                        <input type="text" class="input-small" name="end" id="end"/>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </section>


      <section class="section2">
         <div class="container" align="center">
            <div class="row center locationSearchDiv">
               <div
                  class="tabs col-sm-offset-1 col-sm-10 col-xs-offset-1 col-xs-10">
                  <div class="cd-tabs">

                     <nav>
                        <ul class="cd-tabs-navigation">
                           <li><a data-content="서울" class="selected" href="#0">서울</a></li>
                           <li><a data-content="경기" href="#0">경기</a></li>
                           <li><a data-content="영서" href="#0">영서</a></li>
                           <li><a data-content="영동" href="#0">영동</a></li>
                           <li><a data-content="충복" href="#0">충복</a></li>
                           <li><a data-content="충남" href="#0">충남</a></li>
                           <li><a data-content="경북" href="#0">경북</a></li>
                           <li><a data-content="경남" href="#0">경남</a></li>
                           <li><a data-content="전북" href="#0">전북</a></li>
                           <li><a data-content="전남" href="#0">전남</a></li>
                           <li><a data-content="제주" href="#0">제주</a></li>

                        </ul>
                        <!-- cd-tabs-navigation -->
                     </nav>
                     
                     <ul class="cd-tabs-content">
                        <li data-content="서울" class="selected">
                           <ul class="locationUL">
                              <c:forEach items="${locationList.get(0) }" var="i">
                                 <li><input type="checkbox" id="${i }" class="checkbox" /> <label for="${i }">${i }</label></li>
                              </c:forEach>
                           </ul>
                        </li>
                        <li data-content="경기">
                           <ul class="locationUL">
                              <c:forEach items="${locationList.get(1) }" var="i">
                                 <li><input type="checkbox" id="${i }" class="checkbox" /> <label for="${i }">${i }</label></li>
                              </c:forEach>
                           </ul>
                        </li>
                        <li data-content="영서">
                           <ul class="locationUL">
                              <c:forEach items="${locationList.get(2) }" var="i">
                                 <li><input type="checkbox" id="${i }" class="checkbox" /> <label for="${i }">${i }</label></li>
                              </c:forEach>
                           </ul>
                        </li>
                        <li data-content="영동">
                           <ul class="locationUL">
                              <c:forEach items="${locationList.get(3) }" var="i">
                                 <li><input type="checkbox" id="${i }" class="checkbox" /> <label for="${i }">${i }</label></li>
                              </c:forEach>
                           </ul>
                        </li>
                        <li data-content="충복">
                           <ul class="locationUL">
                              <c:forEach items="${locationList.get(4) }" var="i">
                                 <li><input type="checkbox" id="${i }" class="checkbox" /> <label for="${i }">${i }</label></li>
                              </c:forEach>
                           </ul>
                        </li>
                        <li data-content="충남">
                           <ul class="locationUL">
                              <c:forEach items="${locationList.get(5) }" var="i">
                                 <li><input type="checkbox" id="${i }" class="checkbox" /> <label for="${i }">${i }</label></li>
                              </c:forEach>
                           </ul>
                        </li>
                        <li data-content="경북">
                           <ul class="locationUL">
                              <c:forEach items="${locationList.get(6) }" var="i">
                                 <li><input type="checkbox" id="${i }" class="checkbox" /> <label for="${i }">${i }</label></li>
                              </c:forEach>
                           </ul>
                        </li>
                        <li data-content="경남">
                           <ul class="locationUL">
                              <c:forEach items="${locationList.get(7) }" var="i">
                                 <li><input type="checkbox" id="${i }" class="checkbox" /> <label for="${i }">${i }</label></li>
                              </c:forEach>
                           </ul>
                        </li>
                        <li data-content="전북">
                           <ul class="locationUL">
                              <c:forEach items="${locationList.get(8) }" var="i">
                                 <li><input type="checkbox" id="${i }" class="checkbox" /> <label for="${i }">${i }</label></li>
                              </c:forEach>
                           </ul>
                        </li>
                        <li data-content="전남">
                           <ul class="locationUL">
                              <c:forEach items="${locationList.get(9) }" var="i">
                                 <li><input type="checkbox" id="${i }" class="checkbox" /> <label for="${i }">${i }</label></li>
                              </c:forEach>
                           </ul>
                        </li>
                        <li data-content="제주">
                           <ul class="locationUL">
                              <c:forEach items="${locationList.get(10) }" var="i">
                                 <li><input type="checkbox" id="${i }" class="checkbox" /> <label for="${i }">${i }</label></li>
                              </c:forEach>
                           </ul>
                        </li>
                     </ul>
                     <!-- cd-tabs-content -->
                  </div>
                  <!-- cd-tabs -->


               </div>
               <div class="row">
                  <div class="col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6">
                     <button type="button" class="locationSearchBtn btn">상세검색∨</button>
                  </div>
               </div>
            </div>
         </div>
      </section>

      <section class="section3">
         <div class="container" align="center">
            <div class="row">
               <div class="col-sm-offset-3 col-sm-6">
                  <button class="searchBtn btn btn-orange">SEARCH</button>
               </div>
            </div>
         </div>
      </section>



      <div id="scrollDiv demo" class="scrollDiv">
         <div class="container scrollDown">
            <div class="carousel slide" id="myCarousel">
               <h1 class="slideLabel">
                  <span class="label label-info">행사지</span>
               </h1>
               <div class="carousel-inner">
                  <div class="item active">
                     <ul class="thumbnails">
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="../resources/img/item-1.jpg" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="../resources/img/bg_img.jpg" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="../resources/img/test.JPG" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </div>
                  <!-- /Slide1 -->

                  <div class="item">
                     <ul class="thumbnails">
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </div>
                  <!-- /Slide2 -->
               </div>
               <nav>
                  <ul class="control-box pager">
                     <li><a data-slide="prev" href="#myCarousel" class=""><i
                           class="glyphicon glyphicon-chevron-left"></i></a></li>
                     <li><a data-slide="next" href="#myCarousel" class=""><i
                           class="glyphicon glyphicon-chevron-right"></i></li>
                  </ul>
               </nav>
               <!-- /.control-box -->
            </div>
            <!-- /#myCarousel -->
            
            <!-- #myCarousel2 -->
            <div class="carousel slide" id="myCarousel2">
               <h1 class="slideLabel">
                  <span class="label label-info">먹거리</span>
               </h1>
               <div class="carousel-inner">
                  <div class="item active">
                     <ul class="thumbnails">
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </div>
                  <!-- /Slide1 -->

                  <div class="item">
                     <ul class="thumbnails">
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </div>
                  <!-- /Slide2 -->
               </div>
               <nav>
                  <ul class="control-box pager">
                     <li><a data-slide="prev" href="#myCarousel2" class=""><i
                           class="glyphicon glyphicon-chevron-left"></i></a></li>
                     <li><a data-slide="next" href="#myCarousel2" class=""><i
                           class="glyphicon glyphicon-chevron-right"></i></li>
                  </ul>
               </nav>
               <!-- /.control-box -->
            </div>
            <!-- /#myCarousel2 -->
            
            <!-- #myCarousel3 -->
            <div class="carousel slide" id="myCarousel2">
               <h1 class="slideLabel">
                  <span class="label label-info">숙박</span>
               </h1>
               <div class="carousel-inner">
                  <div class="item active">
                     <ul class="thumbnails">
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </div>
                  <!-- /Slide1 -->

                  <div class="item">
                     <ul class="thumbnails">
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                        <li class="col-sm-3">
                           <div class="fff">
                              <div class="thumbnail">
                                 <a href="#"><img src="http://placehold.it/360x240" alt=""></a>
                              </div>
                              <div class="caption">
                                 <h4>Praesent commodo</h4>
                                 <p>Nullam Condimentum Nibh Etiam Sem</p>
                                 <a class="btn btn-mini" href="#">» Read More</a>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </div>
                  <!-- /Slide2 -->
               </div>
               <nav>
                  <ul class="control-box pager">
                     <li><a data-slide="prev" href="#myCarousel3" class=""><i
                           class="glyphicon glyphicon-chevron-left"></i></a></li>
                     <li><a data-slide="next" href="#myCarousel3" class=""><i
                           class="glyphicon glyphicon-chevron-right"></i></li>
                  </ul>
               </nav>
               <!-- /.control-box -->
            </div>
            <!-- /#myCarousel3 -->

         </div>
      </div>
      <!-- /.content-wrapper -->



      <!-- include -->
      <jsp:include page="../component/footer.jsp" />
      <jsp:include page="../component/controlSidebar.jsp" />
   </div>
   <!-- scripts -->
   <jsp:include page="../component/core_js.jsp" />
   
   <script src="../js/bootstrap-datepicker.js"></script>
   <script src="../js/search.js"></script>
   <script src="../js/locationTab.js"></script>
   
   <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('.input-daterange').datepicker({
                    todayBtn: "linked"
                });
                
            });
    </script>
</body>
</html>