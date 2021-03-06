// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(document).on('turbolinks:load', function(){
	$('.menu-trigger').on('click', function(){
		$(this).toggleClass('active');
		$('#sp-menu').fadeToggle();
		$('#container').fadeToggle();
		return false;
	});
});

$(document).on('turbolinks:load', function(){
	$('.slide').css('background-size','100% 370px');});

$(document).on('turbolinks:load', function(){
	$("#theTarget").skippr({
		transition: 'slide',
		speed: 1000,
		easing: 'easeQuart',
		navType: 'block',
		childrenElementType: 'div',
		arrows: true,
		autoPlay: true,
		autoPlayDuration: 3000,
		keyboardOnAlways: true,
		hidePrevious: false
	});
});

$(document).on('turbolinks:load', function(){
	$('#back a').on('click', function(){
		$('body, html').animate({
			scrollTop:0
		}, 800);
		return false;
	});
});