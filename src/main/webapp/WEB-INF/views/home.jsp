<%@ include file="taglibs.jsp" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Earn with Fun</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link href="<c:url value="/resources/css/common.css" />" rel="stylesheet">
    <style>
        /* General Body Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        /* Header Styling */
        .header {
            background-color: #00796b;
            color: white;
            padding: 20px 20px;
            text-align: center;
        }

        .header h3 {
            margin: 0;
            font-size: 3rem;
            font-weight: bold;
        }

        .header h4 {
            color: #b2dfdb;
            font-weight: 300;
            margin-top: 10px;
        }

        /* Navigation Styling */
        #tabs {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }

        .tabLink {
            background-color: #4caf50;
            color: white;
            font-size: 1.2rem;
            padding: 14px 24px;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin:0px 10px 0px 10px;
        }

        .tabLink:hover, .tabLink.active {
            background-color: #388e3c;
            transform: scale(1.05);
        }

        /* Tab Content Styling */
        .tabContent {
            display: none;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .tabContent:target {
            display: block;
        }

        /* Form Styling */
        .form-label {
            font-size: 1rem;
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
            border: 1px solid #ddd;
            padding: 14px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #00796b;
        }

        .btn-primary {
            background-color: #00796b;
            border: none;
            color: white;
            padding: 15px 30px;
            font-size: 1.2rem;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #004d40;
        }

        /* Error Message Styling */
        #errorMessageForgot {
            color: yellow;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
            display: none;
        }

        /* Modal Styling */
        .modal-content {
            border-radius: 10px;
            padding: 20px;
        }

        .modal-header {
            background-color: #00796b;
            color: white;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .modal-footer button {
            background-color: #00796b;
            color: white;
            border-radius: 5px;
        }

        .modal-footer button:hover {
            background-color: #004d40;
        }

        /* Responsive Design for Smaller Screens */
        @media screen and (max-width: 768px) {
            .header h3 {
                font-size: 2rem;
            }

            .tabLink {
                font-size: 1rem;
                padding: 12px 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <div class="header">
        <h4>Welcome to Earn with Fun!</h4>
        <h5>Refer more, Earn more...</h5>
    </div>

    <!-- Navigation Tabs -->
    <div id="tabs">
        <button class="tabLink" onclick="openPage('Home', this, 'gray'); resetErrorOnForgot();" id="homeBtn">Home</button>
        <button class="tabLink" onclick="loadJsp('Login', this); resetErrorOnForgot();" id="loginBtn">Login</button>
        <button class="tabLink" onclick="loadJsp('Signup', this); resetErrorOnForgot();" id="signUpBtn">Sign Up</button>
    </div>

    <!-- Tab Content Section -->
    <div id="tabContentDiv">
        <!-- Home Tab Content -->
        <div id="Home" class="tabContent">
            <%@ include file="instruction.jsp" %>
        </div>

        <!-- Login Tab Content -->
        <div id="Login" class="tabContent">
            <!-- Login form content goes here -->
        </div>

        <!-- Signup Tab Content -->
        <div id="Signup" class="tabContent">
            <!-- Signup form content goes here -->
        </div>

        <!-- Forgot Password Section -->
        <div id="Forgot" class="tabContent">
            <div id="errorMessageForgot"></div>
            <div class="container">
                <form id="forgotPasswordForm">
                    <h2 class="mb-3 text-center">Reset Password</h2>
                    <div class="mb-3">
                        <label for="username1" class="form-label">Username</label>
                        <input type="text" id="username1" name="username" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="password1" class="form-label">New Password</label>
                        <input type="password" id="password1" name="password" class="form-control" required>
                    </div>
                    <button id="forgotBtn" class="btn btn-primary" type="submit">Change Password</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal for Instructions -->
    <div class="modal fade" id="instructions" tabindex="-1" role="dialog" aria-labelledby="Instructions" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Instructions</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Instructions content goes here -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var activeTab = <c:out value="${activeTab}"/>;
        $(document).ready(function () {
            $("#forgotBtn").click(function (event) {
                $("#errorMessageForgot").hide();
                event.preventDefault();
                let form = $("#forgotPasswordForm");
                let url = "forgotPassword";
                $.ajax({
                    type: "POST",
                    url: url,
                    data: form.serialize(),
                    contentType: "application/x-www-form-urlencoded",
                    dataType: "json",
                    success: function (data) {
                        if (data.errorMessage != null) {
                            $("#errorMessageForgot").show();
                            $("#errorMessageForgot").html(data.errorMessage);
                        } else {
                            $("#errorMessageForgot").show();
                            $("#errorMessageForgot").html(data.successMessage);
                            $("#username1").val('');
                            $("#password1").val('');
                        }
                    },
                    error: function (data) {
                        alert("Error occurred while submitting the form");
                    }
                });
            });
        });

        function resetErrorOnForgot() {
            $("#errorMessageForgot").hide();
            $("#errorMessageForgot").html('');
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<c:url value="/resources/js/common.js" />"></script>
</body>
</html>
