/*****************
***ajax 异步 url：访问地址，func：调用成功执行的函数
*******************/

/**
* type:post
* return:html
**/
function ajaxhtml(url,func){
	$.ajax({url: url,
			type: 'POST',
			dataType: 'html',
			timeout: 10000,
			error: function(){alert('ajax调用错误');},
			success:func
		});				
}

/**
* type:post
* return:xml
**/
function ajaxxml(url,func){
	$.ajax({url: url,
			type: 'POST',
			dataType: 'xml',
			timeout: 10000,
			error: function(){alert('error');},
			success:func
	});
}


function ajaxjson(url,func){
	$.ajax({url: url,
			type: 'POST',
			dataType: 'json',
			timeout: 10000,
			error: function(){},
			success:func
	});
}



function ajaxhtml2(url, params, rtnfunc) {
	$.ajax({
		url : url,
		type : 'POST',
		dataType : 'html',
		data : params,// data: "name=John&location=Boston",
		timeout : 9000,
		error: function () {
			alert('error');
		} ,
		success : rtnfunc
	});

}

function ajaxxml2(url, params, rtnfunc) {
	$.ajax({
		url : url,
		type : 'POST',
		dataType : 'xml',
		data : params,// data: "name=John&location=Boston",
		timeout : 9000,
		error : function() {
			alert('error');
		},
		success : rtnfunc
	});
}


