var random1=Math.floor(Math.random()*6 +1);
var random2=Math.floor(Math.random()*6 +1);

var randomDice1Image="dice"+ random1+".png";
var randomDice2Image="dice"+ random2+".png";

var leftImageSource="images/"+randomDice1Image;
var rightImageSource="images/"+randomDice2Image;

var image=document.querySelectorAll("img");
image[0].setAttribute("src",leftImageSource);
image[1].setAttribute("src",rightImageSource);

if(random1>random2){
    document.querySelector("h1").textContent="🚩Player1 Wins !!";
}
else if(random1<random2)
{
    document.querySelector("h1").textContent="Player2 Wins !!🚩";
}
else{
    document.querySelector("h1").textContent="DRAW !!!"
}