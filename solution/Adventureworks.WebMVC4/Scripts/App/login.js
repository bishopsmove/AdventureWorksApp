/* File Created: May 2, 2013 */
$(function () {
	var username = $("#txtUserName"),
		password = $("#txtPassword"),
		isPersistent;
	allFields = $([]).add(username).add(password),
		tips = $(".validateTips");

	function updateTips(t) {
		tips
			.text(t)
			.addClass("ui-state-highlight");
		setTimeout(function () {
			tips.removeClass("ui-state-highlight", 1500);
		}, 500);
	}

	function checkLength(o, n, min, max) {
		if (o.val().length > max || o.val().length < min) {
			o.addClass("ui-state-error");
			updateTips("Length of " + n + " must be between " +
				min + " and " + max + ".");
			return false;
		} else {
			return true;
		}
	}

	function checkRegexp(o, regexp, n) {
		if (!(regexp.test(o.val()))) {
			o.addClass("ui-state-error");
			updateTips(n);
			return false;
		} else {
			return true;
		}
	}

	$("#dialog-form").dialog({
		autoOpen: false,
		height: 300,
		width: 350,
		modal: true,
		buttons: {
			"Sign In": function () {
				var customInfo = null;
				var redirectUrl = null;

				var bValid = true;
				allFields.removeClass("ui-state-error");

				bValid = bValid && checkLength(username, "username", 3, 16);
				bValid = bValid && checkLength(password, "password", 5, 16);

				bValid = bValid && checkRegexp(username, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter.");
				bValid = bValid && checkRegexp(password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9");

				if (bValid) {
					isPersistent = $("#ckRememberMe").attr("checked");

					$.ajax({
						url: '@Url.Action( "LogOn", "Account" )',
						type: 'post',
						contentType: "application/json; charset=utf-8",
						dataType: 'json',
						data: "{ 'username': '" + username.val() + "', 'password':'" + password.val() + "', 'RememberMe': '" + isPersistent + "'}",
						success: onLoginComplete,
						error: onError
					});
				}
			},
			Cancel: function () {
				$(this).dialog("close");
				$("#master-wrapper-page").show();
			}
		},
		close: function () {
			allFields.val("").removeClass("ui-state-error");
		}
	});

	function onLoginComplete(result) {
		$("#header_logon").html('<br /><br />Welcome <b>supertigerzou</b>![ <a href="/Account/LogOff">Log Off</a> ]');
		$("#dialog-form").dialog("close");
		$("#master-wrapper-page").show();
	}

	function onError(result) {
		$('#loginFailed').show();
	}

	$("#signin").click(function () {
		$("#dialog-form").dialog("open");
		$("#master-wrapper-page").hide();
	});
});