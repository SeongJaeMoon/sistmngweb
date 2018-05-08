
var getBookImg = function(isbnCode){
	var apikey = "48C0FDD868AFA5A3DD58893358C806EFC358FE5FAA15113CC4EEBA2C5125C9C8";
	var url = "http://book.interpark.com/api/search.api?key="+apikey+"&inputEncoding=utf-8&query="+isbnCode+"&queryType=isbn";
	var imageUrl = "";
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("GET", url, true);
	xmlhttp.setRequestHeader("Access-Control-Allow-Origin", "*");
	xmlhttp.setRequestHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    xmlhttp.send(); 
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var xmlDoc = this.responseXML;
            console.log(xmlDoc);
            imageUrl = xmlDoc.getElementsByTagName("coverSmallUrl")[0].textContent;
            console.log(imageUrl);
        }
    }
	return imageUrl;
}
