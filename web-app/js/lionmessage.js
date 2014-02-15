/**
 * Esta fun��o coloca um conte�do HTML em algum elemento do DOM, recuperado atrav�s do seu ID.
 * @param target
 * @param content
 */
function placeContent(target, content) {
	$('#' + target).html(content);
}

/**
 * Esta fun��o cancela uma a��o do usu�rio e o redireciona para uma nova p�gina, a ser recebida como par�metro.
 * @param newLocation
 */
function goToPage(newLocation) {
	window.location.href = newLocation
}

/**
 * Fun��o para exibir mensagens no estilo Growl
 * @param message
 * @param type (pode ser 'info', 'danger', 'waring', 'success' ou null)
 */
function showMessage(message, type) {
	$.bootstrapGrowl(message, {
		  type: type,
		  offset: {from: 'top', amount: 70}, // 'top', or 'bottom'
		  width: 'auto', // (integer, or 'auto')
		  delay: 3000,
		  allow_dismiss: true,
		  stackup_spacing: 10 // spacing between consecutively stacked growls.
		});
}

/**
 * Fun��o que supervisiona o formul�rio, validando campos obrigat�rios.
 * @param formId
 */
function preValidateRequiredFields(formId) {
	var validator = $('#' + formId).validate({
		showErrors: function(errorMap, errorList) {
			$.each(errorMap, function(i, item) {
				markInput(i, 'error');
			})
			$.each(validator.successList, function(i, item) {
				markInput(item.id, 'success');
			});
		}
	});
}

/**
 * Func�o que retorna true ou false informando se o formul�rio � v�lido, quanto aos elementos obrigat�rios.
 * @param formId
 * @returns true ou false
 */
function validateRequiredFields(formId) {
	return $('#' + formId).valid();
}

function markInput(inputId, type) {
	if (type == 'success') {
		$('#' + inputId).parent().parent().removeClass('has-error');
		$('#' + inputId).siblings().first().removeClass('glyphicon-remove');
		$('#' + inputId).parent().parent().addClass('has-success');
		$('#' + inputId).siblings().first().addClass('glyphicon-ok');
		$('#' + inputId).siblings().first().removeClass('hidden');
	} else if (type == 'error') {
		$('#' + inputId).siblings().first().removeClass('glyphicon-ok');
		$('#' + inputId).parent().parent().removeClass('has-success');
		$('#' + inputId).parent().parent().addClass('has-error');
		$('#' + inputId).siblings().first().addClass('glyphicon-remove');
		$('#' + inputId).siblings().first().removeClass('hidden');
	}
}

function createPost(json) {
	$('#timelinePosts').prepend(json.author)
}


