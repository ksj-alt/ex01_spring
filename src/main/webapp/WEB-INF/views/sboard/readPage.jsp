<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script>
	$(function(){
		$("#goList").click(function(){
			location.href="${pageContext.request.contextPath }/sboard/listPage?page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		})
		
		$("#remove").click(function(){
			var no = $(this).attr("data-bno");
			location.href="${pageContext.request.contextPath }/sboard/removePage?bno="+no+"&page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		})
		
		$("#modify").click(function(){
			var no = $(this).attr("data-bno");
			location.href="${pageContext.request.contextPath }/sboard/modifyPage?bno="+no+"&page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		})
	})
</script>

<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ</h3>
				</div>
				<div class="box-body">
					<div class="form-group">
						<label>Bno</label>
						<input type="text" class="form-control" value="${board.bno }" readonly>
					</div>
					<div class="form-group">
						<label>Title</label>
						<input type="text" class="form-control" value="${board.title }" readonly>
					</div>
					<div class="form-group">
						<label>Content</label>
						<textarea rows="5" cols="30" class="form-control" readonly>${board.content }</textarea>
					</div>
					<div class="form-group">
						<label>Writer</label>
						<input type="text" class="form-control" value="${board.writer }" readonly>
					</div>
					<div class="form-group">
						<c:forEach var="file" items="${board.files }">
							<img src="displayFile?filename=${file }">
						</c:forEach>
					</div>
				</div>
				<div class="box-footer">
					<button class="btn btn-warning" id="modify" data-bno=${board.bno }>Modify</button>
					<button class="btn btn-danger" id="remove" data-bno=${board.bno }>Remove</button>
					<button class="btn btn-primary" id="goList">Go List</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-xs-12">
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">Add NEW REPLY</h3>
			</div>
			<div class="box-body">
				<label>Writer</label>
				<input type="text" class="form-control" placeholder="User Id" id="newReplyWriter">
				<label>Reply Text</label>
				<input type="text" class="form-control" placeholder="text" id="newReplyText">
			</div>
			<div class="box-footer">
				<button class="btn btn-primary" id="btnReplyAdd">REPLY</button>
			</div>
		</div>
		<ul class="timeline">
			<li class="time-label" id="repliesDiv">
				<span class="bg-green">Replies list</span>
			</li>  
		</ul>
		<div class="text-center">
			<ul id="pagination" class="pagination pagination-sm no-margin"></ul>
		</div>
	</div>
</div>

<div id="modifyModal" class="modal modal-primary fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">22</h4>
			</div>
			<div class="modal-body">
				<p>
					<input type="text" id="replytext" class="form-control">
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" id="btnModSave">Modify</button>
			</div>
		</div>
	</div>
</div>

<script id="template" type="text/x-handlebars-template">
{{#each list}}
<li class="replyLi" data-rno="{{rno}}">
	<i class="fa fa-comments bg-blue"></i>
	<div class="timeline-item">
		<span class="time">
			<i class="fa fa-clock-o"></i>{{dateHelper regdate}}
		</span>
		<h3 class="timeline-header"><strong>{{rno}}</strong> - {{replyer}}</h3>
		<div class="timeline-body">{{replytext}}</div>
		<div class="timeline-footer">
			<a class="btn btn-primary btn-xs" id="modify" data-toggle="modal" data-target="#modifyModal">Modify</a>
			<a class="btn btn-danger btn-xs" id="delete">Delete</a>
		</div>
	</div>
</li>
{{/each}}
</script>

<script>
	Handlebars.registerHelper("dateHelper", function(value){
		var date = new Date(value);
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		return year + "/" + month + "/" + day;
	})

	var currentPage = 1;
	function getPageList(page){
		var bno = ${board.bno};
		
		$.ajax({
			url:"${pageContext.request.contextPath}/replies/"+bno+"/"+page,    
			type:"get",
			dataType:"json",
			success:function(res){
				console.log(res);
				
				//아래보다 더 간단
				/* $("#list").empty(); */
				$(".replyLi").remove();
				var source = $("#template").html();
				var func = Handlebars.compile(source);
				$(".timeline").append(func(res));
				
				$("#pagination").empty();
				for(var i= res.pageMaker.startPage; i<=res.pageMaker.endPage; i++){
					var $li = $("<li>");
					if(i == currentPage){
						$li.addClass("active");
					}
					var $a = $("<a id='aTag'>").html(i);
					$li.append($a);
					$("#pagination").append($li);
				}
				
			}
		})
	}
	$("#repliesDiv").click(function(){
		getPageList(1);
	})
	$(document).on("click", "#pagination a", function(){
		currentPage = $(this).text();
		getPageList(currentPage);
	})
	$(document).on("click", "#delete", function(){
		var rno = $(this).attr("data-rno");
		$.ajax({
			url:"replies/" + rno,
			type:"delete",
			dataType:"text",
			success:function(res){
				console.log(res);
				
				if(res == "SUCCESS"){
					alert("삭제하였습니다.");
					getPageList(currentPage);
				}
			}
		})
	})
	
	$(document).on("click", "#modify", function(){
		var rno = $(this).attr("data-rno");
		var text = $(this).attr("data-text");
		
	})
</script>

<%@ include file="../include/footer.jsp" %>