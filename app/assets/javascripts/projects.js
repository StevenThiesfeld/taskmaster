// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var navTabs = [];
var tabs = [];
var new_task_button,
veil;
window.onload = function(){
  var links = document.getElementsByClassName("tab_head");
  for (var i = 0; i < links.length; i ++ ) {
    var id = getHash( links[i].getAttribute ("href") );
    navTabs[id] = links[i];
    tabs[id] = document.getElementById(id);
  }
  var i = 0;
  for ( id in navTabs ){
    navTabs[id].addEventListener("click", swapTab);
    i ++;
  }
  veil = document.getElementById("veil")
  new_task_button = document.getElementById("new_task_button");
  new_task_button.addEventListener("click", showNewForm);
}


var swapTab = function(e){
  e.preventDefault()
  var selectedId = getHash( this.getAttribute('href') );
  
  for (var id in tabs){
    if ( id == selectedId ) {
      navTabs[id].className = 'tab_head active';
      tabs[id].className = 'tab_content';
    } else {
      navTabs[id].className = 'tab_head';
      tabs[id].className = 'tab_content hidden';
    }
  }
  return false
}

function getHash( url ) {
  var hashPos = url.lastIndexOf ( '#' );
  return url.substring( hashPos + 1 );
}
