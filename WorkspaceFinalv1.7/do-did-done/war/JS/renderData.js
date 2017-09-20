var composeButton = function(eventId, buttonText, actionItem) {
	var textInButton = document.createTextNode(buttonText);
	var varButton = document.createElement('button');
	varButton.setAttribute("id", eventId); 
	varButton.setAttribute("class", "w3-button w3-tiny w3-third w3-hover-purple");
	varButton.setAttribute("onclick", actionItem + "(this.id)");
	varButton.appendChild(textInButton);
	return varButton;
}

var createTable = function(tableId, tableAreaId) {
	var table = document.createElement('table');
	table.setAttribute("id", tableId);
	table.setAttribute("class", "w3-table-all");
	
	var tableArea = document.getElementById(tableAreaId);
	var element = document.getElementById(tableId);
	if(element !== null) {
		element.parentNode.replaceChild(table, element);
	} else {
		tableArea.appendChild(table);
	}
	return table;
}

var composeTable = function(myArr) {
	var table_TODO = createTable("table_TODO", "tableArea_TODO");
	var table_DOING = createTable("table_DOING", "tableArea_DOING");
	var table_DONE = createTable("table_DONE", "tableArea_DONE");
	var tr = [];

	for (var i = 0; i < myArr.length; i++){
		tr[i] = document.createElement('tr');
		tr[i].setAttribute("class", "w3-row");
		var eventNameHolder = document.createElement('p');
		eventNameHolder.setAttribute("id", myArr[i].eventId);
		eventNameHolder.setAttribute("onclick", "updateEventName(this.id, this.innerHTML)");
		var eventName = document.createTextNode(myArr[i].eventName);
		
		var b1 = composeButton(myArr[i].eventId, "<", "stateChangePrevious");
		var b2 = composeButton(myArr[i].eventId, ">", "stateChangeNext");
		var b3 = composeButton(myArr[i].eventId, "X", "deleteEvent");
		
		var td1 = document.createElement('td');
		td1.setAttribute("class", "w3-twothird");
		var td2 = document.createElement('td');
		td2.setAttribute("class", "w3-third w3-padding-16");
		
		eventNameHolder.appendChild(eventName);
		td1.appendChild(eventNameHolder);
		td2.appendChild(b1);
		td2.appendChild(b2);
		td2.appendChild(b3);
		tr[i].appendChild(td1);
		tr[i].appendChild(td2);
		
		if(myArr[i].eventStatus === "TODO")
			table_TODO.appendChild(tr[i]);
		if(myArr[i].eventStatus === "DOING")
			table_DOING.appendChild(tr[i]);
		if(myArr[i].eventStatus === "DONE") {
			table_DONE.appendChild(tr[i]);
		}
	}
};

var startLoad = function() {
	$("#isLoading").show();
	document.getElementById("search").disabled = true;
	document.getElementById("create").disabled = true;
}

var stopLoad = function() {
	$("#isLoading").hide();
	document.getElementById("search").disabled = false;
	document.getElementById("create").disabled = false;
}
