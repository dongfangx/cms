function xwzRollingImageTrans(imageName, thumbnailName, eventName, winName){
this.Index = 0;
this.ListItem = new Array(0);
this.Name = imageName;
this.Thumbnail = thumbnailName;
this.tmRotate = null;
this.nInterval = 4500;
this.eventName = eventName;
this.winTarget = winName;
//alert("imageName="+imageName,"thumbnailName="+thumbnailName,"eventName"+eventName,"winName"+winName);
if(window.xwzRollObject == null) window.xwzRollObject = new Array(0);
window.xwzRollObject[this.Name] = this;


this.addItem = function(Link, ImgSrc, Icon1, Icon2 ){
    var itmX = {Link : "", ImgSrc : "", DefIcon : "", OvrIcon : ""};
    itmX.Link = Link;
    itmX.ImgSrc = ImgSrc;
    itmX.DefIcon = Icon1;
    itmX.OvrIcon = Icon2;
    this.ListItem[this.ListItem.length] = itmX;
}

this.alterImage = function(thisObj,index){
	//alert(thisObj);
	if (thisObj.className == "choose")
		return;
	var tabObj = thisObj.parentNode.id;
	var tabList = document.getElementById(tabObj).getElementsByTagName("div");
	//alert(tabList.length);
	for (i = 0; i < tabList.length; i++) {
		if (i == index) {
			thisObj.className = "choose";
			//document.getElementById(tabObj + "_Content" + i).style.display = "block";
		} else {
		    tabList[i].className = "";
			//document.getElementById(tabObj + "_Content" + i).style.display = "none";
		}
	}
	//alert("alterImage="+index);
	//alert("this.Thumbnail="+this.Thumbnail);
    var icons = document.getElementsByName(this.Thumbnail); //�ĳɿ�ܺ�Ϊ�˷���Сͼ��ܣ���ô�Ӧͨ���ܷ��ʣ����Ӧ�ð�ԭ���ġ�document.getElementsByName(this.Thumbnail)��ǰ����ϡ�parent.document.frames(1).document.����
    if(this.Index == index) return;
    if(this.ListItem[this.Index].DefIcon !="") icons[this.Index].src = this.ListItem[this.Index].DefIcon;

    this.Index = index;
    this.imgTrans();
    clearTimeout(this.tmRotate);
    this.tmRotate = null;
    //this.tmRotate = setTimeout("window.xwzRollObject['" + this.Name + "'].rotateTrans()" , this.nInterval);

}


this.goLink = function(){
    var name = this.getAttribute('name');
    var xwzRoll = window.xwzRollObject[name];
    clearTimeout(xwzRoll.tmRotate);
    xwzRoll.tmRotate = null;
          xwzRoll.winTarget="_blank"; //�����Ƿ񵯳���ҳ��
    if(xwzRoll.winTarget == '' || xwzRoll.winTarget == null){
     window.location.href=xwzRoll.ListItem[xwzRoll.Index].Link;
    }else{
     window.open(xwzRoll.ListItem[xwzRoll.Index].Link, xwzRoll.winTarget);
    }
}


this.rotateTrans = function(){
    var icons = document.getElementsByName(this.Thumbnail);//�ĳɿ�ܺ�Ϊ�˷���Сͼ��ܣ���ô�Ӧͨ���ܷ��ʣ����Ӧ�ð�ԭ���ġ�document.getElementsByName(this.Thumbnail)��ǰ����ϡ�parent.document.frames(1).document.����
    var itmX = this.ListItem[this.Index];
    if(itmX.DefIcon !="") icons[this.Index].src = itmX.DefIcon;

    this.Index +=1;
    if(this.Index >= this.ListItem.length) this.Index = 0;

    this.imgTrans();
  
    clearTimeout(this.tmRotate);
    this.tmRotate = null;
  // this.tmRotate = setTimeout("window.xwzRollObject['" + this.Name + "'].rotateTrans()" , this.nInterval);
}


this.imgTrans = function(){
    var icons = document.getElementsByName(this.Thumbnail);//�ĳɿ�ܺ�Ϊ�˷���Сͼ��ܣ���ô�Ӧͨ���ܷ��ʣ����Ӧ�ð�ԭ���ġ�document.getElementsByName(this.Thumbnail)��ǰ����ϡ�parent.document.frames(1).document.����
    var itmX = this.ListItem[this.Index];
    if(itmX.OvrIcon !=null    && itmX.OvrIcon !="") icons[this.Index].src = itmX.OvrIcon;
    try{
     document.images[this.Name].filters[0].apply();
     document.images[this.Name].src = itmX.ImgSrc;
     document.images[this.Name].filters[0].play();
    }catch(e){
     document.images[this.Name].src = itmX.ImgSrc;
    }
}
}

