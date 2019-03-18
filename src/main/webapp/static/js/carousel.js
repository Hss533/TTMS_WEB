window.onload = function() 
{
    var timer1,timer2;

    function play() {
        timer1 = setInterval(function() 
        {          
            next.onclick()
        }, 5000)
    }

    play();

    var container = document.getElementById('container');
    function stop()
    {
        clearInterval(timer1);
    }
    container.onmouseover = stop;
    container.onmouseout = play;


    var list = document.getElementById('list');
    var prev = document.getElementById('prev');
    var next = document.getElementById('next');

    var moveloaction = parseInt(list.style.left);

    function animate(offset) 
    {
        var currentlocation = parseInt(list.style.left);
        while(currentlocation!=moveloaction)
        {
            return false;
        }
        clearInterval(timer2);
        moveloaction = currentlocation+offset;

        var speed;

        if(offset>0)
        {
            speed = 20;       
        }
        else
        {
            speed = -20;     
        }
        if(moveloaction<-5680)
        {
            moveloaction = -1420;
            speed = 80;
        }
        if(moveloaction>-1420)
        {
            moveloaction = -5680;
            speed = -80;
        }
        currentlocation = parseInt(list.style.left);
        timer2 = setInterval(function()
        {
            list.style.left = currentlocation + speed +"px";
            currentlocation = parseInt(list.style.left);
            var result = moveloaction - currentlocation;
            if(Math.abs(result)<=20)
            {
                clearInterval(timer2);
                list.style.left = moveloaction +"px";
            }
        },1)
        return true;
    }

    prev.onclick = function()
    {
        if(animate(1420))
        {
            index -= 1;
            if (index < 1) 
            {
                index = 4;
            }            
            buttonsShow();
        }
    }
    next.onclick = function()
    {
        if(animate(-1420))
        {
            index += 1;
            if (index > 4) 
            {
                index = 1;
            } 
            buttonsShow();
        }
    }

    var buttons = document.getElementById('buttons').getElementsByTagName('span');
    var index = 1;

    function buttonsShow() 
    {
        for (var i = 0; i < buttons.length; i++)
        {
            if (buttons[i].className == 'on') {
                buttons[i].className = '';
            }
        }
        buttons[index - 1].className = 'on';
    }
    
    var headnavigation = $(".head-navigation a");
	headnavigation[0].setAttribute("class","active");
	
	$(".userIcon,.toDialog").hover(function()
	{
		$(".dropDownUnLogin").css("border-left","1px solid #CCCCCC");
		$(".dropDownUnLogin").css("border-right","1px solid #CCCCCC");
		$(".toDialog").css("display","block");
	},
	function()
	{
		$(".dropDownUnLogin").css("border-left","1px solid white");
		$(".dropDownUnLogin").css("border-right","1px solid white");
		$(".toDialog").css("display","none");
	});

}