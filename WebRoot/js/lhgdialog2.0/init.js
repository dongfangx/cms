//初始话lhgdialog功能
(function()
{
	
	var setop = function(evt)
	{
	    if(!evt) evt = event || this.parentWindow.event;
		W.tool.ststyle( frameElement, {'zIndex':parseInt(W.config.bzi,10) + 1} );
		W.config.bzi = frameElement.style.zIndex; evt.cancelBubble = true;
	};
	
	var loadinnfrm = function()
	{
		if( A().link == 'hcode' ){ $('dinner').innerHTML = A().page; }
		else
		{
			var sy = A().link ? '' : 'style="visibility:hidden;" ';
			$('dinner').innerHTML = '<iframe id="frmain" src="' + A().page + '" name="frmain" frameborder="0" ' +
									'width="100%" height="100%" scrolling="auto" ' + sy + 'allowtransparency="true"><\/iframe>';
		}
	};
	
	window.loadinndlg = function()
	{
	    if( !frameElement.parentNode ) return null;
		var frmain = $('frmain'), innwin = frmain.contentWindow, inndoc = innwin.document;
		$('throbber').style.visibility = 'hidden'; frmain.style.visibility = '';
		if(W.binfo.ie) inndoc.onmousedown = setop; else innwin.onmousedown = setop;
		drag.reghdl(innwin); resize.reghdl(innwin); innwin.focus(); return W;
	};
	
	window.cancel = function(){ return closedlg(); };
	window.closedlg = function()
	{
	    if( $('frmain') ) $('frmain').src = W.tool.getvoid();
		$('throbber').style.visibility = 'hidden'; W.lhgdialog.closdlg( window, dlgcover );
	};
	
	var loadbtnevt = function()
	{
	    if(W.binfo.ie){ var img = new Image(); img.src="images/btn_bg.gif"; }; crebtn( 'cbtn', '取 消', cancel );
		$('txt').innerHTML = A().tit; $('xbtn').onmouseover = function(){ this.style.backgroundPosition = '0 0'; };
		$('xbtn').onmouseout = function(){ this.style.backgroundPosition = '-22px 0'; }; $('xbtn').onclick = cancel;
	};
	
	window.crebtn = function( i, t, f )
	{
	    if($(i)){ $(i).innerHTML = '<span>' + t + '</span>'; $(i).onclick = f; }
		else
		{
		    var li = document.createElement('li'), span = document.createElement('span');
			li.id = i; span.innerHTML = t; li.appendChild(span);
			li.onmouseover = function(){ this.style.backgroundPosition = '0 -42px'; };
			li.onmouseout = function(){ this.style.backgroundPosition = '0 -21px'; };
			li.onclick = f; $('btns').appendChild(li); li = span = null;
		}
	};
	
	window.rembtn = function(id){ if($(id)) $('btns').removeChild($(id)); };
})();