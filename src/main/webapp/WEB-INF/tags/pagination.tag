<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@attribute name="totalPages" type="java.lang.Integer" required="true"%>
<%@attribute name="currentPage" type="java.lang.Integer" required="true"%>
<%@attribute name="delta" type="java.lang.Integer" required="true"%>
<%@attribute name="url" type="java.lang.String" required="true"%>
<%@attribute name="type" type="java.lang.String" required="false"%>
<%@attribute name="targetId" type="java.lang.String" required="false"%>
<%@attribute name="order" type="java.lang.String" required="false"%>


<ul class="pager">
	<c:if test="${currentPage > delta + 1 }">
		<li class="page-item ${(currentPage == 1) ? 'current' : ''}">
			<c:choose>
				<c:when test="${not empty order}">
					<a rel="nofollow" href="${url}?order=${order}&p=1" data-type="${type}" data-target-id="${targetId}">1</a>
				</c:when>
				<c:otherwise>			
					<a rel="nofollow" href="${url}?p=1" data-type="${type}" data-target-id="${targetId}">1</a>
				</c:otherwise>
			</c:choose>
		</li>
		...
	</c:if>

	<c:forEach begin="${currentPage >= delta ? currentPage - delta : currentPage}" end="${currentPage + delta > totalPages ? totalPages : currentPage+delta}" var="p">
		<c:if test="${p > 0}">
			<li class="page-item ${(p == currentPage) ? 'current' : ''}">
				<c:choose>
					<c:when test="${not empty order}">
						<a rel="nofollow" href="${url}?order=${order}&p=${p}" data-type="${type}" data-target-id="${targetId}">${p}</a>
					</c:when>
					<c:otherwise>
						<a rel="nofollow" href="${url}?p=${p}" data-type="${type}" data-target-id="${targetId}">${p}</a>
					</c:otherwise>
				</c:choose>
			</li>
		</c:if>
	</c:forEach>
	
	<c:if test="${currentPage + delta < totalPages}">
		...
		<li class="page-item ${(currentPage == totalPages) ? 'current' : ''}">
			<c:choose>
				<c:when test="${not empty order}">
					<a rel="nofollow" href="${url}?order=${order}&p=${totalPages}" data-type="${type}" data-target-id="${targetId}">${totalPages}</a>
				</c:when>
				<c:otherwise>
					<a rel="nofollow" href="${url}?p=${totalPages}" data-type="${type}" data-target-id="${targetId}">${totalPages}</a>
				</c:otherwise>
			</c:choose>
		</li>
	</c:if>
</ul>