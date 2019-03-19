var TimeOut         = 300;
var currentLayer    = null;
var currentitem     = null;
var currentLayerNum = 0;
var noClose         = 0;
var closeTimer      = null;
// Open Hidden Layer
function mopen(n)
{
	
    var l  = document.getElementById("submenu"+n);
    var mm = document.getElementById("menu"+n);
   
    if(l)
    {
        mcancelclosetime();
        $("#cat-nav").slideDown();
        l.style.display='';
        if(currentLayer && (currentLayerNum != n)){
        	currentLayer.style.display='none';
        	$("#cat-nav").slideUp();
        }
        currentLayer = l;
        currentitem = mm;
        currentLayerNum = n;           
    }
    else if(currentLayer)
    {
        currentLayer.style.display='none';
        $("#cat-nav").slideUp();
        currentLayerNum = 0;
        currentitem = null;
        currentLayer = null;
    }
}
// Turn On Close Timer
function mclosetime()
{
    closeTimer = window.setTimeout(mclose, TimeOut);
}
// Cancel Close Timer
function mcancelclosetime()
{
    if(closeTimer)
    {
        window.clearTimeout(closeTimer);
        closeTimer = null;
    }
}
// Close Showed Layer
function mclose()
{
    if(currentLayer && noClose!=1)
    {
        currentLayer.style.display='none';
        $("#cat-nav").slideUp();
        currentLayerNum = 0;
        currentLayer = null;
        currentitem = null;
    }
    else
    {
        noClose = 0;
    }
    currentLayer = null;
    currentitem = null;
}
// Close Layer Then Click-out
document.onclick = mclose;