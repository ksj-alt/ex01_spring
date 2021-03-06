<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
	#dropBox img{
		width:200px;
		height:200px;
	}
	div.delItem{
		float: left;
		position: relative;
	}
	
	div.delItem input.check{
		position: absolute;
		right:0;
		top:0; 
	}
	.checked{
		opacity: 0.5;
	}
</style>

<script>
	$(function(){
		$("#files").change(function() {
			//var file = $(this)[0].files[0]; // $(this)[0] : javascript 객체
			
			var files = $(this)[0].files;
			//var file = e.target.files;        https://greatps1215.tistory.com/5
			console.log(files);
			$("#dropBox").empty();
 			for(var i = 0; i<files.length;i++){
				var reader = new FileReader(); //javascript 객체
				reader.readAsDataURL(files[i]);
				reader.onload = function(e){
					var $img = $("<img>").attr("src", e.target.result);
					$("#dropBox").append($img);
				}
 			}
		})
		
		$(".check").on('click', function(){
			if($(this).prop('checked')){
				$(this).parent().addClass("checked");
			}else{
				$(this).parent().removeClass("checked");
			}
		});
	})
</script>

<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">modify</h3>
				</div>
				<form role="form" action="modifyPage" method="post">
					<input type="hidden" name="bno" value="${board.bno }">
					<input type="hidden" name="page" value="${cri.page}">
					<input type="hidden" name="searchType" value="${cri.searchType }">
					<input type="hidden" name="keyword" value="${cri.keyword }">
					<div class="box-body">
						<div class="form-group">
							<label>Bno</label>
							<input type="text" class="form-control" value="${board.bno }" name="bno" readonly>
						</div>
						<div class="form-group">
							<label>Title</label>
							<input type="text" class="form-control" value="${board.title }" name="title">
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea rows="5" cols="30" class="form-control" name="content">${board.content }</textarea>
						</div>
						<div class="form-group">
							<label>Writer</label>
							<input type="text" class="form-control" value="${board.writer }" name="writer">
						</div>						
						<div class="form-group">
						<c:forEach var="file" items="${board.files }">
							<div class="delItem">
								<img src="displayFile?filename=${file }">
								<input type="checkbox" class="check" name="imgFile" value="${file }">
							</div>
						</c:forEach>
					</div>
					</div>
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">OK</button>
						</div>
					</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>