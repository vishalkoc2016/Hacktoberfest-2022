let turn = "x"
let pressSound = new Audio("./sound/ting.mp3")
let gameOver = false

const changeturn = () => {
    return turn === "x" ? "0" : "x"
}
const checkWin = () => {
    let boxText = document.getElementsByClassName("boxText")
    win = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    win.forEach(e => {
        if ((boxText[e[0]].innerText === boxText[e[1]].innerText) && (boxText[e[2]].innerText === boxText[e[1]].innerText) && (boxText[e[0]].innerText !== "")) {
            document.querySelector('.gameinfo').innerText = boxText[e[0]].innerText + " won ";
            gameOver = true
            document.querySelector('.imgbox').getElementsByTagName("img")[0].style.width = "200px"
        }
    })
}


let boxs = document.getElementsByClassName("box");
Array.from(boxs).forEach(element => {
    let boxText = element.querySelector(".boxText")
    element.addEventListener('click', () => {
        if (boxText.innerText === "") {
            boxText.innerText = turn
            pressSound.play()
            turn = changeturn()
            checkWin()
            if (!gameOver) {
                document.getElementsByClassName("gameinfo")[0].innerText = "Turn For " + turn
            }
        }
    })
})

let reset = document.getElementById('reset')
reset.addEventListener('click', () => {
    let boxTexts = document.querySelectorAll(".boxText")
    Array.from(boxTexts).forEach(element => {
        element.innerText = ""
        document.querySelector('.imgbox').getElementsByTagName("img")[0].style.width = "0px"
    })
    turn = "x"
    gameOver = false
    document.getElementsByClassName("gameinfo")[0].innerText = "Turn For " + turn
})