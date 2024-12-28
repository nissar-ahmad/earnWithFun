<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
    <div id="errorMessageLogIn" style="color: yellow; text-align:center" class="hide"></div>
    <c:if test="${not empty successMessage}">
        <div style="color: green; text-align:center">
            <strong><c:out value="${successMessage}"/></strong>
        </div>
    </c:if>
    <div class="container">
        <form id="loginForm" modalAttribute="user">
            <h2 class="mb-3" style="text-align:center;text-decoration: underline;">Login</h2>
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" id="usernameLogin" name="username" class="form-control" autocomplete="off" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" id="passwordLogin" name="password" class="form-control" autocomplete="off" required>
                </div>
            <button id="logIn" class="btn btn-primary" type="submit">Sign in</button>
        </form>
        <br>
        <div class="form-row">
                        <div id="forgotPassword" class="form-group col-md-6">
                            <button onclick="openPage('Forgot', this, 'gray');resetError();" class="btn btn-primary">Forgot Password?</button>
                        </div>
        </div>
    </div>

</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
$(document).ready(function () {
        $("#logIn").click(function (event) {
            $("#errorMessageLogIn").hide();
            event.preventDefault();
            let form = $("#loginForm");
            let url = "login";
            if($("#usernameLogin").val().trim() === ''){
                $("#errorMessageLogIn").show();
                $("#errorMessageLogIn").html('');
                $("#errorMessageLogIn").html('Username is mandatory.');
                $("#usernameLogin").focus();
            }else if($("#passwordLogin").val().trim() === ''){
                $("#errorMessageLogIn").show();
                $("#errorMessageLogIn").html('');
                $("#errorMessageLogIn").html('Password is mandatory.');
                $("#passwordLogin").focus();
            }else{
                $.ajax({
                    type: "POST",
                    url: url,
                    data: form.serialize(),
                    contentType: "application/x-www-form-urlencoded",
                    dataType: "json",
                    success: function (data) {
                        if(data.errorMessage != null){
                            $("#errorMessageLogIn").show();
                            $("#errorMessageLogIn").html('');
                            $("#errorMessageLogIn").html(data.errorMessage);
                        }else{
                            loadDashboardScreen(form);
                        }
                    },
                    error: function (data) {
                        alert("Error occurred while submitting the form");
                    }
                });
            }
        });
    });

    function resetError(){
        $("#errorMessageForgot").html('');
        $("#errorMessageForgot").hide();
        $("#username1").val('');
        $("#password1").val('');
    }
    function openPage(pageName, element, color) {
          var i, tabContent, tabLinks;
          tabContent = document.getElementsByClassName("tabContent");
          for (i = 0; i < tabContent.length; i++) {
            tabContent[i].style.display = "none";
          }
          tabLinks = document.getElementsByClassName("tabLink");
          for (i = 0; i < tabLinks.length; i++) {
            tabLinks[i].style.backgroundColor = "";
          }
          document.getElementById(pageName).style.display = "block";
          document.getElementById(pageName).style.backgroundColor = color;
          element.style.backgroundColor = 'blue';
    }

    function loadDashboardScreen(form){
        $.ajax({
                url: '../main/dashboard',
                type: 'GET',
                data: form.serialize(),
                success: function(response) {
                    $('body').html(response);
                },
                error: function(xhr, status, error) {
                    console.log("Error: " + error);
                }
            });
    }
</script>
