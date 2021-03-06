<%--
 * action-1.jsp
 *
 * Copyright (C) 2019 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<display:table name="companys" id="row" requestURI="${requestURI}"
	pagesize="5" class="displaytag">

	<acme:column value="${row.title}" code="company.title"
		sortable="true" />

	<acme:column value="${row.establishedMoment}"
		code="company.establishedMoment" />

	<acme:column value="${row.email}" code="company.email" />

	<acme:column value="${row.photo}" image="true" alt="${row.photo}" />

	<acme:column value="${row.phone}" code="company.phone" />

	<acme:column value="${row.address}" code="company.address" />



	<spring:message code='company.listmembers' var="titleListMembers" />
	<acme:column value="member/list.do?companyId=${row.id}" url="true"
		alt="${titleListMembers}" />

	<security:authorize access="hasRole('MEMBER')">
		<spring:message code='company.listMyparades'
			var="titleListParades" />
		<acme:column
			value="parade/member/list.do?companyId=${row.id}"
			url="true" alt="${titleListParades}" />
	</security:authorize>

	<spring:message code='company.listfloats' var="titleListFloats" />
	<acme:column value="dfloat/list.do?companyId=${row.id}" url="true"
		alt="${titleListFloats}" />
</display:table>