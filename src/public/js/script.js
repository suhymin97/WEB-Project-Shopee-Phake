//slide_show
var index = 1;
function changeImg() {
    var imgs = ["image/slider1.png", "image/slider2.png", "image/slider3.png", "image/slider4.png", "image/slider5.png", "image/slider6.png", "image/slider7.png", "image/slider8.png", "image/slider9.png", "image/slider10.png", "image/slider11.png", "image/slider12.png", "image/slider13.png"]
    var left_slider = document.querySelector('.left_slider');

    if (left_slider.classList[1] === 'fade') {
        left_slider.classList.remove('fade')
    } else {
        left_slider.classList.add('fade')
        left_slider.src = imgs[index]
        index++
        if (index == imgs.length) {
            index = 0;
        }
    }

}
setInterval(changeImg, 5000);

//count_down

const startingMinutes = 90;
let time = startingMinutes * 60;

const box0 = document.querySelector('.box_hours');
const box1 = document.querySelector('.box_mins');
const box2 = document.querySelector('.box_secs');

var setTime = setInterval(doCountdown, 1000);

function doCountdown() {
    const hour = Math.floor(time / 3600);
    const minute = Math.floor((time / 60)) % 60;
    let second = time % 60;

    box0.innerText = `${('0' + hour).slice(-2)}`;
    box1.innerText = `${('0' + minute).slice(-2)}`;
    box2.innerText = `${('0' + second).slice(-2)}`;


    time--;

    if (second == 0 && minute == 0 && hour == 0) {
        clearInterval(setTime);
        time = startingMinutes * 60;
        setInterval(doCountdown, 1000);

    }

}

//carousel 

var cat = document.querySelectorAll('.cat');
var nextBtn = document.querySelector('.nextBtn')
function next() {
    cat.forEach(function (catt) {
        catt.style.transform = "translateX(-300%)";
    })
}
function prev() {
    cat.forEach(function (catt) {
        catt.style.transform = "translateX(0%)";
    })
}

//form-handles

// var update = localStorage.getItem('myvalue')
// localStorage.clear()
// function register() {
//     location.href = "./form.ejs"
// }

// window.onload = function loadPage() {
//     const resg = document.querySelector('.signup');
//     const log = document.querySelector('.signin');
//     if (update != null) {
//         resg.style.display = 'none'
//         log.innerText = `Xin chào ${update}`;
//     }
// }
