﻿$(function(){$(".tips_header a:first").addClass("set");$(".main_tips .content:first").show();$(".tips_header a").each(function(a){$(this).mouseover(function(){$(".main_tips .content").hide();$(".tips_header a").removeClass("set");$(this).addClass("set");$(".main_tips .content").each(function(b){b==a?$(this).show():null});$(this).blur()})})});