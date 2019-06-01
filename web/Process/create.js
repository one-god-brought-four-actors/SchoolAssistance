function deletediv(obj){
var div=obj.parentNode;
var cs=document.body.children;
var index=cs.length-1;
var j=0;
		for(var i=index;i>0;i--){
		j++;		 
		  document.body.removeChild(cs[i]);
		   if(j==3){
		  return;
		  }
		 }
}
function add(){
var name=document.getElementById("name").value;
var body=document.body;
var childs=body.children;
	if(childs.length!=1){
	
	var div2=document.createElement("div");
	div2.setAttribute("class", "center");
	body.appendChild(div2);
	
	var div3=document.createElement("div");
	div3.setAttribute("class", "to_right");
	body.appendChild(div3);
	}
	
	var div=document.createElement("div");
	var p=document.createElement("p");
	
	p.innerHTML =name;
	div.setAttribute("class", "roundedRectangle");
      p.setAttribute("onclick","deletediv(this);");	
	div.appendChild(p);
	body.appendChild(div);
}