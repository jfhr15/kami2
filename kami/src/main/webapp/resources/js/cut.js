$(function(){
	$(document).mouseup(function(e) {
		if ($(e.target).parents('.menu').length == 0) {
			$('.menu li').removeClass('expand');
			$('.menu ul').hide();
		}
	});
	$(".menu>li:has(ul)>a").each( function() {
		$(this).html( $(this).html()+' &or;' );
	});
	$(".menu ul li:has(ul)")
		.find("a:first")
		.append("<p style='float:right;margin:-3px'>&#9656;</p>");

	$(".menu li>a").click(function(){
		var li = $(this).parent();
		var ul = li.parent()
		ul.find('li').removeClass('expand');
		ul.find('ul').not(li.find('ul')).hide();
		li.children('ul').toggle();
		if( li.children('ul').is(':visible') || li.has('ul')) {
			li.addClass('expand');
		}
	});
});


$(function () {

	  function openMenu() {
	    $("#overLay").show();
	    $('#side_menu').animate({
	      'right': '0'
	    }, 300, 'linear', function () {
	      $("#btn").text("▶");
	    });
	  }

	  function closeMenu() {
	    $('#side_menu').animate({
	      'right': '-150px'
	    }, 300, 'linear', function () {
	      $("#btn").text("◀");
	      $("#overLay").hide();
	    });
	  }

	  $("#btn").on("click", function () {
	    return (this.tog ^= 1) ? openMenu() : closeMenu();
	  });

	  $("#overLay").on("click", function () {
	    closeMenu();
	    $("#btn")[0].tog = 0;
	  });
	  
	  $("#ba1").click(function() {
		var color = $(this).css("background-color");
		if(color=="rgb(255, 255, 255)"){
			$("#ba1").css("background-color","rgb(181, 65, 244)");
			$("#baW").css("color","white");
			$("#ba2").css("background-color","white");
			$("#baM").css("color","black");
		}else if(color=="rgb(181, 65, 244)"){
			$("#ba1").css("background-color","white");
			$("#baW").css("color","black");
		}
	  });
	  $("#ba2").click(function() {
		  var color = $(this).css("background-color");
			if(color=="rgb(255, 255, 255)"){
				$("#ba2").css("background-color","rgb(181, 65, 244)");
				$("#baM").css("color","white");
				$("#ba1").css("background-color","white");
				$("#baW").css("color","black");
			}else if(color=="rgb(181, 65, 244)"){
				$("#ba2").css("background-color","white");
				$("#baM").css("color","black");
			}
	  });
	  $("#cc1").on('click',function(){
		 alert("1"); 
	  });
	});