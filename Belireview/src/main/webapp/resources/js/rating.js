$(function(){
			
			if(id==""||id==null){}
			else{
				/* initValue = $('.gZASBp > div').attr("class").split(" ")[1]; */

				var f = $('.gZASBp > a.r1');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r1');
				}, function() {
					$('.gZASBp > div' ).removeClass('r1').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r1'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}else{
						initValue = 'r1';
						r=0.5;
						$('.ccOSgS').html("최악이에요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r2');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r2');
				}, function() {
					$('.gZASBp > div' ).removeClass('r2').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r2'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}else{
						initValue = 'r2';
						r=1;
						$('.ccOSgS').html("싫어요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r3');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r3');
				}, function() {
					$('.gZASBp > div' ).removeClass('r3').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r3'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}else{
						initValue = 'r3';
						r=1.5;
						$('.ccOSgS').html("재미없어요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r4');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r4');
				}, function() {
					$('.gZASBp > div' ).removeClass('r4').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r4'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r4';
						r=2;
						$('.ccOSgS').html("별로에요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r5');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r5');
				}, function() {
					$('.gZASBp > div' ).removeClass('r5').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r5'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r5';
						r=2.5;
						$('.ccOSgS').html("부족해요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r6');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r6');
				}, function() {
					$('.gZASBp > div' ).removeClass('r6').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r6'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r6';
						r=3;
						$('.ccOSgS').html("보통이에요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r7');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r7');
				}, function() {
					$('.gZASBp > div' ).removeClass('r7').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r7'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r7';
						r=3.5;
						$('.ccOSgS').html("볼만해요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r8');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r8');
				}, function() {
					$('.gZASBp > div' ).removeClass('r8').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r8'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r8';
						r=4;
						$('.ccOSgS').html("재미있어요");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r9');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r9');
				}, function() {
					$('.gZASBp > div' ).removeClass('r9').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r9'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r9';
						r=4.5;
						$('.ccOSgS').html("훌륭해요!");
						rating(r);
					}
				});
				
				f = $('.gZASBp > a.r10');
				f.hover(function() {
					$('.gZASBp > div' ).removeClass(initValue).addClass('r10');
				}, function() {
					$('.gZASBp > div' ).removeClass('r10').addClass(initValue);
				});
				f.click(function(){
					if(initValue == 'r10'){
						initValue = 'r0';
						r=0;
						$('.ccOSgS').html("평가하기");
						rating(r);
					}
					else{
						initValue = 'r10';
						r=5;
						$('.ccOSgS').html("최고에요!");
						rating(r);
					}
				});
			}
		});