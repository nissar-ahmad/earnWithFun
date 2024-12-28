document.getElementById(activeTab.id).click();
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
function loadJsp(id, element){
    $.ajax({
        type: "GET",
        url: "../main/loadJsp",
        data: {"formId":id},
        success: function (data) {
            $("#"+id).html(data);
            openPage(id, element, 'gray');
        },
        error: function (data) {
            alert("Error occurred while fetching the form");
        }
    });
}
