<html>
<head>
    <title>Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
    <div id="errorMessageSignUp" style="color: yellow; text-align:center" class="hide"></div>
    <div class="container">
        <form id="signUpForm" modalAttribute="user">
            <h2 class="mb-3" style="text-align:center;text-decoration: underline;">Register</h2>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" id="username" name="username" class="form-control" autocomplete="off" autocomplete="off" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" id="email" name="email" class="form-control" autocomplete="off" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" id="fullName" name="fullName" class="form-control" autocomplete="off" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="phoneNumber" class="form-label">Phone Number
                    </label>
                    <input type="number" id="phoneNumberSignUp" name="phoneNumber" class="form-control" autocomplete="off" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" id="password" name="password" class="form-control" autocomplete="off" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="referralCode" class="form-label">Referral Code</label>
                    <input type="text" id="referralCode" name="referralCode" class="form-control" autocomplete="off" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="paymentPlan" class="form-label">Choose Payment Plan</label>
                    <select id="paymentPlan" class="form-select form-select-sm" name="paymentPlan" aria-label=".form-select-sm example">
                      <option value="50" selected>50</option>
                      <option value="100">100</option>
                      <option value="150">150</option>
                      <option value="200">200</option>
                      <option value="250">250</option>
                      <option value="300">300</option>
                      <option value="500">500</option>
                      <option value="1000">1000</option>
                      <option value="2000">2000</option>
                      <option value="5000">5000</option>
                    </select>
                </div>
            </div>
                    <button id="signUp" class="btn btn-primary" type="submit">Sign Up</button>
        </form>

    </div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
            $("#signUp").click(function (event) {
                    $("#errorMessageSignUp").hide();
                    event.preventDefault();
                    let form = $("#signUpForm");
                    let url = "signUp";
                    if($("#username").val().trim() === ''){
                        $("#errorMessageSignUp").show();
                        $("#errorMessageSignUp").html('');
                        $("#errorMessageSignUp").html('Username is mandatory.');
                        $("#username").focus();
                    }else if($("#username").val().trim().length<5){
                        $("#errorMessageSignUp").show();
                        $("#errorMessageSignUp").html('');
                        $("#errorMessageSignUp").html('Minimum Username length should be 5.');
                        $("#username").focus();
                    }
                    else if($("#password").val().trim() === ''){
                        $("#errorMessageSignUp").show();
                        $("#errorMessageSignUp").html('');
                        $("#errorMessageSignUp").html('Password is mandatory.');
                        $("#password").focus();
                    }else if($("#password").val().trim().length<5){
                        $("#errorMessageSignUp").show();
                        $("#errorMessageSignUp").html('');
                        $("#errorMessageSignUp").html('Minimum Password length should be 5.');
                        $("#password").focus();
                    }
                    else if($("#phoneNumberSignUp").val().trim() === ''){
                        $("#errorMessageSignUp").show();
                        $("#errorMessageSignUp").html('');
                        $("#errorMessageSignUp").html('Phone No. is mandatory.');
                        $("#phoneNumberSignUp").focus();
                    }
                    else if($("#phoneNumberSignUp").val().trim().length<10){
                        $("#errorMessageSignUp").show();
                        $("#errorMessageSignUp").html('');
                        $("#errorMessageSignUp").html('Phone No. should be 10 digit.');
                        $("#phoneNumberSignUp").focus();
                    }
                    else if($("#fullName").val().trim() === ''){
                        $("#errorMessageSignUp").show();
                        $("#errorMessageSignUp").html('');
                        $("#errorMessageSignUp").html('Full Name is mandatory.');
                        $("#fullName").focus();
                    }
                    else if($("#referralCode").val().trim() === ''){
                        $("#errorMessageSignUp").show();
                        $("#errorMessageSignUp").html('');
                        $("#errorMessageSignUp").html('ReferralCode is mandatory.');
                        $("#referralCode").focus();
                    }else if (confirm("Your Selected Payment Plan is : " + $("#paymentPlan").val() + ". You need to pay " + $("#paymentPlan").val() + " amount after registration to activate your account.") == false) {
                       $("#errorMessageSignUp").show();
                       $("#errorMessageSignUp").html('');
                       $("#errorMessageSignUp").html('Change Payment Plan.');
                       $("#paymentPlan").focus();
                     }else{
                        $.ajax({
                            type: "POST",
                            url: url,
                            data: form.serialize(),
                            contentType: "application/x-www-form-urlencoded",
                            dataType: "json",
                            success: function (data) {
                                if(data.errorMessage != null){
                                    $("#errorMessageSignUp").show();
                                    $("#errorMessageSignUp").html('');
                                    $("#errorMessageSignUp").html(data.errorMessage);
                                }else{
                                    $("#errorMessageSignUp").show();
                                    $("#errorMessageSignUp").html('');
                                    $("#errorMessageSignUp").html(data.successMessage);
                                    clearAllFields();
                                }
                            },
                            error: function (data) {
                                alert("Error occurred while submitting the form");
                            }
                        });
                    }
            });
        });

        function clearAllFields(){
           $("#username").val('');
           $("#email").val('');
           $("#fullName").val('');
           $("#phoneNumber").val('');
           $("#password").val('');
           $("#referralCode").val('');
        }
</script>
