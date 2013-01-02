// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree ./global
//= require jquery.ui.all

function changePhoto(numPhotos,hasOld) {
	var dropdown=document.getElementById("photo_dropdown");
	var photo_number=dropdown.options[dropdown.selectedIndex].text;
	for (i=1; i<=numPhotos; i++) {
    	var temp_id = "profile_picture_" + i;
    	document.getElementById(temp_id).style.display = "none";
	}
	if (hasOld) {
		document.getElementById("profile_picture_old").style.display = "none";
	}
	if (photo_number > numPhotos) {
		document.getElementById("profile_picture_old").style.display = "block";
	} else {
		var active_id = "profile_picture_" + photo_number;
		document.getElementById(active_id).style.display = "block";
	}
}