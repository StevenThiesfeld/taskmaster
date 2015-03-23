// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var new_task_button,
veil;
window.onload = function(){
  veil = document.getElementById("veil")
  new_task_button = document.getElementById("new_task_button");
  new_task_button.addEventListener("click", showNewForm);
}

var showNewForm = function(e){
  veil.classList.toggle("hidden");
}