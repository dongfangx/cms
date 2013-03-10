		$(document).ready(function(){
			var arryImgs = ["images/13.jpg","images/02.jpg","images/03.jpg","images/04.jpg","images/05.jpg"];
			$(".clickButton a").attr("href","javascript:return false;"); 
			var times = 1;
			function changeImage(){
				if (times == 6) {
					times = 1;
				}
				$(".clickButton a").removeClass("active");
				$(".clickButton a:nth-child(" + times + ")").addClass("active");
				$(".imgs img").attr("src",arryImgs[times-1]);
				times++;
			}
			var interval = window.setInterval(function(){
				changeImage();
			}, 1500);
			$(".clickButton a").each(function(index){
				$(this).hover(
					function(){
						$(".clickButton a").removeClass("active");
						$(this).addClass("active");
						clearInterval(interval);
						$(".imgs img").attr("src",arryImgs[index]);
						times = index+1;	
					},
					function(){
						interval = window.setInterval(function(){
							changeImage();
						}, 1500);	
					}); 
			});
		})