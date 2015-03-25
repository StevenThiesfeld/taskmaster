// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var taskDivs;

$(document).ready(function(){
  makeSortable();
});

var makeSortable = function(){
  taskDivs = document.getElementById("open_tasks");
  Sortable.create(taskDivs);
  for (var i = 0; i < taskDivs.children.length; i ++){
    taskDivs.children[i].addEventListener("drop", updatePosition);
  }
}

var updatePosition = function(ev){
  var taskId = parseInt(this.id);
  var newPositions = {};
  $.each(taskDivs.children, function(index, value){
    newPositions[parseInt(value.id)] = index; 
  });
  $.ajax({
    type: 'PUT',
    url: '/update_list',
    dataType: 'json',
    data: newPositions,  // or whatever your new position is
  });
}