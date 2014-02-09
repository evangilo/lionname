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
		  type: type, // (null, 'info', 'error', 'success')
		  offset: {from: 'top', amount: 70}, // 'top', or 'bottom'
		  width: 'auto', // (integer, or 'auto')
		  delay: 3000,
		  allow_dismiss: true,
		  stackup_spacing: 10 // spacing between consecutively stacked growls.
		});
}