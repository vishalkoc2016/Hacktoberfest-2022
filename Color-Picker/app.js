const colors = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "A", "B", "C", "D", "E", "F"]; //an array with all possible chars for hexcode
const btn = document.getElementById("btn"); //select all elements having id=btn
const color = document.querySelector(".color"); //select the first code line with color class
const copyBtn = document.getElementById("copyBtn");
let hexCode = "#FFFFFF"; //by default, we have white color 

btn.addEventListener('click', function () //on clicking generate btn
{
    hexCode = '#'; //cos hexcode starts with a #
    for (let i = 0; i < 6; i++) // and has 6 chars
    {
        hexCode += colors[Math.floor(Math.random() * colors.length)];
    }
    /* Math.floor basically converts decimal number to a non-decimal number like 5.98 -> 5
   Math.random creates random numbers b/w 0-1 ( 1 not included)
   * colors.length sets the limit, so now the numbers will be generated within our colors array 
    */

    document.body.style.backgroundColor = hexCode; //change bg color to hexcode
    color.textContent = hexCode; //and display that hexcode (we had our "color name" within color class in html, so color.textContent)
    color.style.color = hexCode; // the font color of "hexcode" will also change
    copyBtn.innerHTML = "copy code"; //so that when we click generate, "copied!" is replaced with copy code again 
    copyBtn.style.textDecoration="underline"; //the underline returns on "copy code"
}
)

//copying the hexcode 
copyBtn.addEventListener('click', function () {
    copyBtn.addEventListener('click', copyText())
    function copyText() {
        navigator.clipboard.writeText(hexCode); //copy to clipboard 
        copyBtn.innerHTML = "copied!"; //confirmation
        copyBtn.style.textDecoration="none"; //so that "copied!" doesn't have an underline 
    }
}
)