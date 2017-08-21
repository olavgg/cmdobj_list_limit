
<div class="form-btns link-collection">
	<div class="w50 inb pad05-right">

		<h3 class="mb1"><g:message code="creating.tag.for.model"/></h3>

		<label for="name">
			<g:message code="name"/>
		</label>
		<g:textField name="name"
					 autofocus=""
					 class="${hasErrors(bean:form,field:'name','error')}"
					 value="${fieldValue(bean: form, field:'name')}"
					 tabindex="10" />


	</div>
	<div class="w50 inb pad05-left">
		<div class="table-heading-nav">
			<h2>
				<g:message code="template.keys"/>
			</h2>
		</div>
		<table id="template-keys-table" class="listing objects w100">
			<thead>
			<tr>
				<th>
					<label>
						<g:checkBox name="delete-all-template-keys" checked="false"/>
						<span></span>
					</label>
				</th>
				<th><g:message code="text"/></th>
			</tr>
			</thead>
			<tbody>
			<g:each in="${form.templateKeys}" var="key" status="i">
				<tr>
					<td>
						<label>
							<input type="checkbox" name="templateKeys[${i}].id" value="${key.id}"/>
							<span></span>
						</label>
					</td>
					<td>
						<input type="hidden" name="templateKeys[${i}].id" value="${key.id}"/>
						<input type="text" name="templateKeys[${i}].text" value="${key.text}"/>
					</td>
				</tr>
			</g:each>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="2">
					<button id="add-template-key" type="button" class="blue w150px small fleft">
						<i class="demo-icon icon-plus"></i>
						<g:message code="add"/>
					</button>
					<button id="delete-template-key" type="button" class="red w150px small fright">
						<i class="demo-icon icon-trash-empty"></i>
						<g:message code="delete"/>
					</button>
				</td>
			</tr>
			</tfoot>
		</table>
	</div>
</div>

<div class="form-btns mt1">

	<button id="save-button"
			class="submit_button green w25"
			tabIndex="200"
			type="submit">
		<span class="text"><g:message code="save" /></span>
		<i class="demo-icon icon-spin5 btn-spinner"></i>
	</button>

</div>

<script type="application/javascript" async>

	function createCheckBoxLabel(id, idx) {
		var labelEle = document.createElement('LABEL');
		var inputEle = document.createElement('INPUT');
		inputEle.type = "checkbox";
		inputEle.name = "templateKeys["+idx+"].id";
		inputEle.value = id;
		inputEle.tabIndex = 2000 + idx;

		var spanEle = document.createElement('SPAN');
		labelEle.appendChild(inputEle);
		labelEle.appendChild(spanEle);
		return labelEle;
	}

	function textKeyListener(e){
		if (e.ctrlKey && e.keyCode === 13) {
			e.preventDefault();
			addNewTemplateKey(e);
		}
	}

	function addNewTemplateKey(e){
		var tbody = e.target.closest('table').querySelector('tbody');
		var newRow = tbody.insertRow();
		var cell1 = newRow.insertCell(-1);
		var cell2 = newRow.insertCell(-1);

		var labelEle = createCheckBoxLabel('', newRow.rowIndex -1);
		cell1.appendChild(labelEle);

		var textEle = document.createElement('INPUT');
		textEle.type = 'text';
		textEle.name = "templateKeys["+(newRow.rowIndex -1)+"].text";
		textEle.addEventListener('keydown', textKeyListener);
		cell2.appendChild(textEle);
		textEle.focus();
	}

	function updateTemplateKeyOrder() {
		var elements = [
			document.querySelectorAll("#template-keys-table tbody tr")
		];
		for (var i = 0; i < elements.length; i++) {
			var counter = 0;
			for (var y = 0; y < elements[i].length; y++) {
				var inputEles =
					elements[i][y].querySelectorAll("input[name^='templateKeys']");
				for (var x = 0; x < inputEles.length; x++) {
					// replace number in string
					inputEles[x].name =
						inputEles[x]
							.name
							.replace(/(\d+)/g, counter);
				}
				counter++;
			}
		}
	}

	var allTemplateKeyTextFields = document.querySelectorAll(
		'#template-keys-table tbody tr td:nth-child(2) input[name$="text"]'
	);
	for(var i = 0; i < allTemplateKeyTextFields.length; i++){
		allTemplateKeyTextFields[i].addEventListener('keydown', textKeyListener);
	}

	document.getElementById('add-template-key')
		.addEventListener('click', addNewTemplateKey);

	document.getElementById('delete-template-key')
		.addEventListener('click', function(e){
			var table = e.target.closest('table');
			var checkboxEles = table.querySelectorAll('tbody tr td:first-child input[name$="id"]');
			for(var i = 0; i < checkboxEles.length; i++){
				if(checkboxEles[i].checked){
					table.querySelector('tbody').removeChild(checkboxEles[i].closest('tr'));
				}
			}
			updateTemplateKeyOrder();
		});

	document.getElementById('delete-all-template-keys')
		.addEventListener('change', function(e){
			var formEl = e.target.closest('table');
			var isChecked = false;
			if(e.target.checked){
				isChecked = true;
			}
			var checkboxEles = formEl.querySelectorAll('tbody tr td:first-child input[name$="id"]');
			for(var i = 0; i < checkboxEles.length; i++){
				checkboxEles[i].checked = isChecked;
			}
		});
</script>