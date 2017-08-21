<html>
<head>
	<meta name="layout" content="main"/>
	<title><g:message code="edit.tag" /></title>
	<meta data-rightmenu="tagger" data-selected="tag-overview"/>
</head>

<body>

<section class="panel-body">

	<div class="table-heading-nav">
		<h2>
			<g:message code="edit.tag"/>
		</h2>
	</div>
	<div class="form-body pad1 mb1">

		<g:form class=""
				controller="tag"
				action="saveTag" name="save-tag" method="POST">

			<g:if test="${form}">
				<g:hiddenField name="tag" value="${form.id}"/>
			</g:if>
			<g:render template="tag_form"/>
		</g:form>

	</div>

</section>
</body>
</html>