
var dropdown = document.querySelector('.dropdown');
var dropdownList = document.querySelector('.dropdown-list');

dropdown.onclick = function openList(){
dropdown.classList.toggle('active');
dropdownList.classList.toggle('opened');
}


var people = document.querySelector('.people');
var peoplelist = document.querySelector('.peoplelist');

people.onclick = function openList(){
people.classList.toggle('active');
peoplelist.classList.toggle('opened');
}

var where = document.querySelector('.where');
var wherein = document.querySelector('.whereinput');

where.onclick = function openList(){
where.classList.toggle('active');
wherein.classList.toggle('opened');
}
