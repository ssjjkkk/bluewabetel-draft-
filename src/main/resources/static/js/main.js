$(document).ready(function(){
    // active 클래스를 가진 tab-link가 없는 경우, 첫번쨰 tab-link를 active  
    var mainTab = document.querySelector('.main_product_category .tab-link.active');
    if (mainTab == null) {
        tablinks = document.getElementsByClassName('tab-link');
        //openTab1(tablinks[0].id);
    }
});

/* Tab Script */
function openTab1(tabName) {
    var i, tabcontent, tablinks;

    tabcontent = document.getElementsByClassName("tab-content1");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    tablinks = document.getElementsByClassName("tab-link");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    //console.log(tabName.replace('tab-',''));
    //console.log(document.getElementById(tabName).className);
    document.getElementById(tabName).className += " active";
    document.getElementById(tabName.replace('tab-','')).style.display = "block";

    var subTab = document.querySelector('#' + tabName.replace('tab-', '') + ' .sub_product_category .tab-link2.active');
    //console.log(subTab);
    if (subTab == null) {
        var firstSubTab = document.querySelector('#' + tabName.replace('tab-', '') + ' .sub_product_category .tab-link2');
        firstSubTab.className += " active";
        //console.log(tabName);
        openTab2(tabName.replace('tab-', ''), firstSubTab.id);
    }
}

/* Tab Script */
function openTab2(parentName , tabName) {
    var i, tabcontent, tablinks2;

    tabcontent = document.getElementsByClassName("product_group_area");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    tablinks2 = document.getElementsByClassName("tab-link2");
    for (i = 0; i < tablinks2.length; i++) {
        tablinks2[i].className = tablinks2[i].className.replace(" active", "");
    }

    //console.log(tabName);
    document.querySelector('#' + parentName + ' #' + tabName).className += " active";
    document.querySelector('#' + parentName + ' #' + tabName.replace('tab-', '')).style.display = "inline-flex";
}

// To the Top Scroll
window.onscroll = function() {
    scrollFunction()
};

function scrollFunction() {
    if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
      document.getElementById("scrollTopBtn").style.display = "flex";
      if(document.getElementById("logoutBtn") != null) {
        document.getElementById("logoutBtn").style.display = "flex";
      }
      // $('header').addClass('act');
    } else {
      document.getElementById("scrollTopBtn").style.display = "none";
      if(document.getElementById("logoutBtn") != null) {
        document.getElementById("logoutBtn").style.display = "none";
      }
      // $('header').removeClass('act');
    }
}
  
function scrollToTop() {
    document.body.scrollTop = 0; /* For Safari */
    document.documentElement.scrollTop = 0; /* For Chrome, Firefox, IE and Opera */
}