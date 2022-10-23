let seconds=00;
let minutes=00;
let hr=00;
let interval;

//div
let getSec=document.querySelector(".seconds");
let getmin=document.querySelector(".minutes");
let gethr=document.querySelector(".hours");

//buttons
let btnstart=document.querySelector(".btn-start");
let btnstop=document.querySelector(".btn-stop");
let btnreset=document.querySelector(".btn-reset");


btnstart.addEventListener("click",()=>{
    interval=setInterval(start,1000);
}
)

btnstop.addEventListener("click",()=>{
   clearInterval(interval);
});

btnreset.addEventListener("click",()=>{
   seconds=00;
   minutes=00;
   hr=00;
   getSec.innerHTML= `0` + seconds;
   getmin.innerHTML= `0` + minutes;
   gethr.innerHTML= `0` + hr;

});

//functions
var start=()=>{
    seconds++

    if(seconds<=9){
    getSec.innerHTML= '0' + seconds;}
    
    if(seconds>9){
    getSec.innerHTML=  seconds;
    }

    if(seconds == 60){
        seconds = 0;
        minutes++;
        if(minutes<=9){
            getmin.innerHTML= '0' + minutes;}
            
            if(minutes>9){
            getmin.innerHTML=  minutes;
            }

        if(minutes == 60){
            minutes = 0;
            hr++;
            if(hr<=9){
                gethr.innerHTML= '0' + hr;}
                
                if(hr>9){
                gethr.innerHTML=  hr;
                }
        }
    } 
    }