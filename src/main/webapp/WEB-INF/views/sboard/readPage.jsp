<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

<%@ include file="../include/footer.jsp" %>