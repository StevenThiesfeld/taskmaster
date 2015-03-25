// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var navTabs = [];
var tabs = [];
var new_task_button,
veil;
var taskHeads = [];
window.onload = function(){ 
  establishEvents();
 
}

var establishEvents = function(){
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
  // new_task_button.addEventListener("click", showNewForm);
  
  taskHeads = document.getElementsByClassName("task_head");
  for (var i = 0; i < taskHeads.length; i++){
    taskHeads[i].addEventListener("click", toggleTabBody);
  }
}

var toggleTabBody = function(e){
  e.preventDefault();
  var anchor = this.children[0].children[0];
  var body = document.getElementById( getHash(anchor.getAttribute('href') ) );
  body.classList.toggle("hidden");
  
  anchor.children[0].classList.toggle("open_img");
}


var swapTab = function(e){
  e.preventDefault()
  var selectedId = getHash( this.getAttribute('href') );
  
  for (var id in tabs){
    if ( id == selectedId ) {
      navTabs[id].classList.toggle('active');
      tabs[id].className = 'tab_content';
    } else {
      navTabs[id].classList.toggle('active');
      tabs[id].className = 'tab_content hidden';
    }
  }
  return false
}

function getHash( url ) {
  var hashPos = url.lastIndexOf ( '#' );
  return url.substring( hashPos + 1 );
}

var showNewForm = function(e){
  veil.classList.toggle("hidden");
}
