<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        #updatePaymentPlanFormDiv{
           display:none;
        }
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
                    font-size: 1rem;
                    text-align: center;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.3s ease, transform 0.3s ease;
                    margin:10px 10px 10px 10px;
                }

                .tabLink:hover, .tabLink.active {
                    background-color: #388e3c;
                    transform: scale(1.05);
                }

                /* Tab Content Styling */
                .tabContent {
                    display: none;
                    padding: 10px;
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
                    padding: 10px;
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
                    padding: 15px;
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
                    color: red;
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Dashboard</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="<c:url value="/resources/css/common.css" />" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
   <div class="topnav">
     <span class="active">
       <h5 style="text-align:center">Welcome to Earn with Fun!</h5>
       <h5 style="text-align:center;color:black;">Refer more earn more...</h5>
     </span>
   </div>
    <div id="body" class="header">
        <div class="row">
               <div id="tabs">
                   <div class="buttons">
                       <button class="tabLink" onclick="openPage('Profile', this, 'gray');resetErrorDashboardWithdraw();resetErrorDashboardCheckBalance();" id="profileBtn">Profile</button>
                       <button class="tabLink" onclick="openPage('CheckBalance', this, 'gray');resetErrorDashboardWithdraw();resetErrorDashboardProfile();" id="checkBalanceBtn">Balance</button>
                       <button class="tabLink" onclick="openPage('WithDraw', this, 'gray');resetErrorDashboardProfile();resetErrorDashboardCheckBalance();" id="withdrawBtn">Withdraw</button>
                       <c:if test="${isAdmin}">
                        <button class="tabLink" onclick="loadJsp('AdminLogin', this);resetErrorOnForgot();" id="adminLoginBtn">Admin</button>
                       </c:if>
                       <button class="tabLink" data-toggle="modal" data-target="#instructions">Instructions</button>
                       <button class="tabLink" onclick="logOut();">Logout</button>
                   </div>
               </div>
        </div>
    </div>
    <div class="vertical-line"></div>
    <div id="tabContentDiv">
                <div id="AdminLogin" class="tabContent">
                </div>
                <div id="WithDraw" class="tabContent">
                    <c:if test="${not empty successMessage}">
                           <div id="errorMessageDashboardWithdraw" class="errorMessageDashboard" style="color: yellow; text-align:center">
                               <c:out value="${successMessage}"/>
                           </div>
                       </c:if>
                       <c:if test="${not empty errorMessage}">
                           <div id="errorMessageDashboardWithdraw" class="errorMessageDashboard"  style="color: yellow; text-align:center" class="show">
                               <c:out value="${errorMessage}"/>
                           </div>
                       </c:if>
                       <br>
                     <div class="container">
                             <form class="form-login" method="post" action="withdraw" modalAttribute="user">
                                 <h2 class="mb-3" style="text-align:center;text-decoration: underline;">Withdraw Amount</h2>
                                 <input type="hidden" id="username" name="username" value="<c:out value="${user.username}"/>" class="form-control" autocomplete="off">

                                 <div class="mb-3">
                                     <label for="amount" class="form-label">Enter Amount.</label>
                                     <input type="number" id="amount" name="amount" class="form-control" autocomplete="off" required>
                                 </div>

                                 <div class="mb-3">
                                     <label for="accountNo" class="form-label">Account No.</label>
                                     <input type="text" id="accountNo" name="accountNo" class="form-control" autocomplete="off" required>
                                 </div>

                                 <div class="mb-3">
                                     <label for="ifscCode" class="form-label">IFSC Code</label>
                                     <input type="text" id="ifscCode" name="ifscCode" class="form-control" autocomplete="off" required>
                                 </div>

                                 <div class="mb-3">
                                     <label for="upiId" class="form-label">Phone Number</label>
                                     <input type="tel" id="upiId" name="upiId" class="form-control" autocomplete="off" required>
                                 </div>

                                 <button class="btn btn-primary" type="submit">Withdraw</button>
                             </form>
                       </div>
                </div>

                <div id="CheckBalance" class="tabContent">
                        <c:if test="${not empty successMessage}">
                           <div id="errorMessageDashboardCheckBalance" class="errorMessageDashboard" style="color: yellow; text-align:center">
                               <c:out value="${successMessage}"/>
                           </div>
                       </c:if>
                       <c:if test="${not empty errorMessage}">
                           <div id="errorMessageDashboardCheckBalance" class="errorMessageDashboard"  style="color: yellow; text-align:center" class="show">
                               <c:out value="${errorMessage}"/>
                           </div>
                       </c:if>
                       <br>
                       <div class="mb-3" style="colour:green">
                                                     <h2 class="mb-3" style="text-align:center;text-decoration: underline;">Your Balance</h2>

                        <div class="form-row">
                             <div class="form-group col-md-6">
                                <h5>Balance : <c:out value="${user.amount}"/></h5>
                             </div>
                             <div class="form-group col-md-6">
                                <h5>Referral Count : <c:out value="${user.referralCount}"/></h5>
                             </div>
                        </div>
                        <form id="claimRewardPoints" action="claimRewardPoints" method = "post" modalAttribute="user">
                             <div class="form-row">
                               <div class="form-group col-md-6">
                                   <h5>Reward Points : <c:out value="${user.rewardsPoint}"/></h5>
                               </div>
                               <div class="form-group col-md-6">
                                   <input type="hidden" id="username" name="id" value="<c:out value="${user.id}"/>" class="form-control" autocomplete="off">
                                   <button onclick="claimRewardPoints(<c:out value="${user.id}"/>);">Claim Reward Points</button>
                               </div>
                             </div>
                        </form>
                    </div>
                    <div class="verticalLine"></div>
                    <div class="mb-3 table-responsive">
                        <h5 style="text-align:center">Payment History</h5>
                        <table class="table table-dark table-hover table-bordered border-primary">
                          <thead>
                            <tr>
                              <th scope="col">#</th>
                              <th scope="col">Action</th>
                              <th scope="col">Amount</th>
                            </tr>
                          </thead>
                          <tbody>
                              <c:choose>
                                  <c:when test="${empty paymentDetails}">
                                   <tr>
                                       <td colspan='100%' class="txt-c_imp">
                                           <h5 style="text-align:center">Payment Detail not found.</h5>
                                       </td>
                                   </tr>
                                  </c:when>
                                  <c:otherwise>
                                    <c:forEach var="payment" items="${paymentDetails}" varStatus="i">
                                        <tr>
                                          <th scope="row"><c:out value="${i.index+1}"/></th>
                                          <td><c:out value="${payment.referralFullName}"/></td>
                                          <td><c:out value="${payment.amount}"/></td>
                                        </tr>
                                    </c:forEach>
                                  </c:otherwise>
                              </c:choose>
                          </tbody>
                        </table>

                    </div>
                </div>

                <div id="Profile" class="tabContent">
                    <c:if test="${not empty successMessage}">
                           <div id="errorMessageDashboardProfile" class="errorMessageDashboard" style="color: yellow; text-align:center">
                               <c:out value="${successMessage}"/>
                           </div>
                       </c:if>
                       <c:if test="${not empty errorMessage}">
                           <div id="errorMessageDashboardProfile" class="errorMessageDashboard" style="color: yellow; text-align:center" class="show">
                               <c:out value="${errorMessage}"/>
                           </div>
                       </c:if>
                       <br>
                                               <h2 class="mb-3" style="text-align:center;text-decoration: underline;">Your Profile</h2>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <h5>Username : <c:out value="${user.username}"/></h5>
                        </div>
                        <div class="form-group col-md-6">
                            <h5>Name : <c:out value="${user.fullName}"/></h5>
                        </div>
                        <div class="form-group col-md-6">
                            <h5>Email : <c:out value="${user.email}"/></h5>
                        </div>
                        <div class="form-group col-md-6">
                            <h5>Phone Number : <c:out value="${user.phoneNumber}"/></h5>
                        </div>
                        <div class="form-group col-md-6">
                            <h5>Your Payment Plan : <c:out value="${user.paymentPlan}"/></h5>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="changePaymentPlan">
                                <h5 style="color:black">You want to change Payment Plan? <input type="checkbox" id="changePaymentPlan"></h5>
                            </label>
                            <div id="updatePaymentPlanFormDiv" class="hide">
                                <form id="updatePaymentPlanRequest" action="updatePaymentPlanRequest" method = "post" modalAttribute="user">
                                  <input type="hidden" id="username" name="id" value="<c:out value="${user.id}"/>" class="form-control" autocomplete="off">
                                  <div class="form-row">
                                      <div class="form-group col-md-3">
                                          <select id="paymentPlan" class="form-select form-select-sm" name="newPaymentPlan" aria-label=".form-select-sm example">
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
                                      <div class="form-group col-md-6">
                                        <button onclick="updatePaymentPlan(<c:out value="${user.id}"/>);">Update Payment Plan</button>
                                      </div>
                                  </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="verticalLine"></div>
                    <c:choose>
                    <c:when test="${isPaymentDone}">
                    <h5 style="text-align:center; color:yellow">Referral Code : <c:out value="${user.referralCode}"/></h5>
                    </c:when>
                    <c:otherwise>
                        <h5 style="text-align:center; color:yellow"> Do <c:out value="${user.paymentPlan}"/> payment then you will get Referral Code to share with your friends. Same will be visible here after payment done. For payment Contact on +91 9797317200 OR scan below QR.</h5>
                        <h5 style="text-align:center;">
                            <span><img src="<c:url value="/resources/images/paymentBarCode.jpeg"/>"/></span>
                        </h5>
                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
    <div class="modal fade" id="instructions" tabindex="-1" role="dialog" aria-labelledby="Instructions" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Instructions</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <%@include file="instruction.jsp" %>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script type="text/javascript">
    var activeTab = <c:out value="${activeTab}"/>;

    document.getElementById('changePaymentPlan').addEventListener('change', function() {
            var div = document.getElementById('updatePaymentPlanFormDiv');

            if (this.checked) {
                div.style.display = 'block';
            } else {
                div.style.display = 'none';
            }
        });

    function logOut(){
        $.ajax({
            url: '../main/',
            type: 'GET',
            success: function(response) {
                $('body').html(response);
            },
            error: function(xhr, status, error) {
                console.log("Error: " + error);
            }
        });
    }
    function resetErrorDashboardWithdraw(){
        $("#errorMessageDashboardWithdraw").html('');
        $("#errorMessageDashboardWithdraw").hide();
    }
    function resetErrorDashboardProfile(){
        $("#errorMessageDashboardProfile").html('');
        $("#errorMessageDashboardProfile").hide();
    }
    function resetErrorDashboardCheckBalance(){
        $("#errorMessageDashboardCheckBalance").html('');
        $("#errorMessageDashboardCheckBalance").hide();
    }
</script>
<script src="<c:url value="/resources/js/common.js" />"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
