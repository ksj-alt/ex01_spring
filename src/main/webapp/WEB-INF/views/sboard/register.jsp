<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
	#dropBox img{
		width:200px;
		height:200px;
	}
</style>

<script>
	
	$(function() {

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
	})
</script>

<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">REGISTER</h3>
				</div>
				<form role="form" action="register" method="post" enctype="multipart/form-data">
					<div class="box-body">
						<div class="form-group">
							<label>Title</label>
							<input type="text" name="title" class="form-control" placeholder="Enter Title">
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea rows="5" cols="30" placeholder="Enter Content" name="content" class="form-control"></textarea>
						</div>
						<div class="form-group">
							<label>Writer</label>
							<input type="text" name="writer" class="form-control" placeholder="Enter Writer">
						</div>
						<div class="form-group">
							<label>Image Files</label>
							<input type="file" name="imageFiles" class="form-control" multiple="multiple" id=files>
						</div>
					</div>
					<div id="dropBox"></div>	       
					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>