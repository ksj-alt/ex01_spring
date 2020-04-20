<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

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