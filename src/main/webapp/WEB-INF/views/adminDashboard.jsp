<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Admin Dashboard</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link href="<c:url value="/resources/css/common.css" />" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</head>
<body>
   <div class="topnav">
     <span class="active">
       <h5 style="text-align:center">Welcome to Earn with Fun!</h5>
       <h5 style="text-align:center;color:black;">Refer more earn more...</h5>
     </span>
   </div>
        <div id="body">
            <div class="row header">
                   <div id="tabs">
                       <div class="buttons">
                           <button class="tabLink" onclick="openPage('ReferralApprove', this, 'gray');resetErrorAdminWithdraw();resetErrorAdminPayment();" id="referralApproveBtn" >Referral Approve</button>
                           <button class="tabLink" onclick="openPage('WithdrawApprove', this, 'gray');resetErrorAdminReferral();resetErrorAdminPayment();" id="withdrawApproveBtn" >Withdraw Approve</button>
                           <button class="tabLink" onclick="openPage('ChangePaymentPlanApprove', this, 'gray');resetErrorAdminReferral();resetErrorAdminWithdraw();" id="changePaymentPlanApproveBtn" >Payment Plan Approve</button>
                           <button class="tabLink" onclick="logOut();">Logout</button>
                       </div>
                   </div>
            </div>
        </div>
        <div class="vertical-line"></div>
        <div id="ReferralApprove" class="tabContent">
            <c:if test="${not empty successMessage}">
                <div id="errorMessageAdminDashboardReferral" style="color: yellow; text-align:center">
                    <c:out value="${successMessage}"/>
                </div>
            </c:if>
            <h2 class="mb-3" style="text-align:center;text-decoration: underline;">Referral Approve</h2>
            <div class="verticalLine"></div>
            <div class="mb-3 table-responsive">
                <table class="table table-dark table-hover table-bordered border-primary">
                  <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">Username</th>
                      <th scope="col">Phone</th>
                      <th scope="col">Payment Code</th>
                      <th scope="col">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:choose>
                    <c:when test="${empty referredUsers}">
                     <tr>
                         <td colspan='100%' class="txt-c_imp">
                             <h4 style="text-align:center">No Referral request found.</h4>
                         </td>
                     </tr>
                    </c:when>
                    <c:otherwise>
                    <c:forEach var="user" items="${referredUsers}" varStatus="i">
                        <tr>
                          <th scope="row"><c:out value="${i.index+1}"/></th>
                          <td><c:out value="${user.username}"/></td>
                          <td><c:out value="${user.phoneNumber}"/></td>
                           <td><c:out value="${user.paymentCode}"/></td>
                          <td>
                            <form id="approveReferralRequest" action="approveReferralRequest" method = "post" modalAttribute="user">
                              <input type="hidden" id="username" name="id" value="<c:out value="${user.id}"/>" class="form-control" autocomplete="off">
                              <button onclick="approveReferral(<c:out value="${user.id}"/>);">Approve</button>
                            </form>
                            <form id="rejectReferralRequest" action="rejectReferralRequest" method = "post" modalAttribute="user">
                              <input type="hidden" id="username" name="id" value="<c:out value="${user.id}"/>" class="form-control" autocomplete="off">
                              <button onclick="rejectReferral(<c:out value="${user.id}"/>);">Reject</button>
                            </form>
                          </td>
                        </tr>
                    </c:forEach>
                    </c:otherwise>
                    </c:choose>
                  </tbody>
                </table>

            </div>
        </div>
                <div id="ChangePaymentPlanApprove" class="tabContent">
                    <c:if test="${not empty successMessage}">
                        <div id="errorMessageAdminDashboardPayment" style="color: yellow; text-align:center">
                            <c:out value="${successMessage}"/>
                        </div>
                    </c:if>
                    <h2 class="mb-3" style="text-align:center;text-decoration: underline;">Payment Plan Approve</h2>
                    <div class="verticalLine"></div>
                    <div class="mb-3 table-responsive">
                        <table class="table table-dark table-hover table-bordered border-primary">
                          <thead>
                            <tr>
                              <th scope="col">#</th>
                              <th scope="col">Username</th>
                              <th scope="col">Payment Plan</th>
                              <th scope="col">Updated Payment Plan</th>
                              <th scope="col">Action</th>
                            </tr>
                          </thead>
                          <tbody>
                          <c:choose>
                            <c:when test="${empty paymentPlanChangeUsers}">
                             <tr>
                                 <td colspan='100%' class="txt-c_imp">
                                     <h4 style="text-align:center">No Change Payment Plan request found.</h4>
                                 </td>
                             </tr>
                            </c:when>
                            <c:otherwise>
                            <c:forEach var="user" items="${paymentPlanChangeUsers}" varStatus="i">
                                <tr>
                                  <th scope="row"><c:out value="${i.index+1}"/></th>
                                  <td><c:out value="${user.username}"/></td>
                                  <td><c:out value="${user.paymentPlan}"/></td>
                                   <td><c:out value="${user.newPaymentPlan}"/></td>
                                  <td>
                                    <form id="approveChangePaymentPlanRequest" action="approveChangePaymentPlanRequest" method = "post" modalAttribute="user">
                                      <input type="hidden" id="username" name="id" value="<c:out value="${user.id}"/>" class="form-control" autocomplete="off">
                                      <button onclick="approveChangePaymentPlan(<c:out value="${user.id}"/>);">Approve</button>
                                    </form>
                                  </td>
                                </tr>
                            </c:forEach>
                            </c:otherwise>
                            </c:choose>
                          </tbody>
                        </table>

                    </div>
                </div>
        <div id="WithdrawApprove" class="tabContent">
            <c:if test="${not empty successMessage}">
                <div id="errorMessageAdminDashboardWithdraw" style="color: yellow; text-align:center" class"show">
                    <c:out value="${successMessage}"/>
                </div>
            </c:if>
            <h2 class="mb-3" style="text-align:center;text-decoration: underline;">Withdraw Approve</h2>
            <div class="verticalLine"></div>
            <div class="mb-3 table-responsive">
                <table class="table table-dark table-hover table-bordered border-primary">
                  <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">Username</th>
                      <th scope="col">Phone</th>
                      <th scope="col">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:choose>
                       <c:when test="${empty withdrawRequestedUsers}">
                        <tr>
                            <td colspan='100%' class="txt-c_imp">
                                <h4 style="text-align:center">No Withdraw request found.</h4>
                            </td>
                        </tr>
                       </c:when>
                       <c:otherwise>
                            <c:forEach var="user" items="${withdrawRequestedUsers}" varStatus="i">
                                <tr>
                                  <th scope="row"><c:out value="${i.index+1}"/></th>
                                  <td><c:out value="${user.username}"/></td>
                                  <td><c:out value="${user.phoneNumber}"/></td>
                                  <td>
                                  <form id="approveWithdrawRequest" method="post" action="approveWithdrawRequest" modalAttribute="user">
                                    <input type="hidden" id="username" name="id" value="<c:out value="${user.id}"/>" class="form-control" autocomplete="off">
                                    <button onclick="approveWithdraw(<c:out value="${user.id}"/>);">Approve</button>
                                  </form>
                                  </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                  </tbody>
                </table>

            </div>
        </div>
</body>
</html>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script type="text/javascript">
    var activeTab = <c:out value="${activeTab}"/>;
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
    function resetErrorAdminReferral(){
        $("#errorMessageAdminDashboardReferral").html('');
        $("#errorMessageAdminDashboardReferral").hide();
    }
    function resetErrorAdminWithdraw(){
        $("#errorMessageAdminDashboardWithdraw").html('');
        $("#errorMessageAdminDashboardWithdraw").hide();
    }
    function resetErrorAdminPayment(){
        $("#errorMessageAdminDashboardPayment").html('');
        $("#errorMessageAdminDashboardPayment").hide();
    }
</script>
<script src="<c:url value="/resources/js/common.js" />"></script>
