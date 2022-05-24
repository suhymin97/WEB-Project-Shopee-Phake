//slide_show
var index = 1;
function changeImg() {
    var imgs = ["./assets/img/slider1.png", "./assets/img/slider2.png" , "./assets/img/slider3.png" , "./assets/img/slider4.png" , "./assets/img/slider5.png" , "./assets/img/slider6.png" , "./assets/img/slider7.png" , "./assets/img/slider8.png" , "./assets/img/slider9.png" , "./assets/img/slider10.png" , "./assets/img/slider11.png" , "./assets/img/slider12.png" , "./assets/img/slider13.png"]
    var left_slider = document.querySelector('.left_slider');
    
    if(left_slider.classList[1] === 'fade') {
    left_slider.classList.remove('fade')
    } else {
        left_slider.classList.add('fade')
        left_slider.src = imgs[index]
        index++
        if(index == imgs.length) {
            index = 0;
        }
    }
    
}
setInterval(changeImg, 5000); 

//count_down

    const startingMinutes = 90;
    let time = startingMinutes*60;

    const box0 = document.querySelector('.box_hours');
    const box1 = document.querySelector('.box_mins');
    const box2 = document.querySelector('.box_secs');

    var setTime = setInterval(doCountdown, 1000);

function doCountdown() {
        const hour = Math.floor(time/3600);
        const minute = Math.floor((time/60))%60;
        let second = time % 60;

        box0.innerText = `${('0' + hour).slice(-2)}`;
        box1.innerText = `${('0' + minute).slice(-2)}`;
        box2.innerText = `${('0' + second).slice(-2)}`;
        

        time--;

        if(second == 0 && minute == 0 && hour ==0) {
            clearInterval(setTime);
            time = startingMinutes*60;
            setInterval(doCountdown, 1000);

        }

    }

//carousel 

var cat = document.querySelectorAll('.cat');
var nextBtn = document.querySelector('.nextBtn')
function next() {
    cat.forEach(function(catt) {
        catt.style.transform = "translateX(-300%)";
    }) 
}
function prev() {
    cat.forEach(function(catt) {
        catt.style.transform = "translateX(0%)";
    }) 
}

//form-handle

var update = localStorage.getItem('myvalue')
localStorage.clear()
function register() {
    location.href = "./form.html"
}

window.onload = function loadPage() {
    const resg = document.querySelector('.signup');
    const log = document.querySelector('.signin');
    if(update != null) {
        resg.style.display = 'none'
        log.innerText = `Xin chào ${update}` ;
    }
}


//filter 

var topProd = document.querySelector('.top_products').children;
var type = document.querySelector('.type').children;

for(let i = 0; i<type.length; i++) {
    type[i].onclick = function() {
        for(let x=0; x<type.length; x++) {
            type[x].classList.remove('active');
        }
        this.classList.add('active');
        const displayItems = this.getAttribute('category');
        for(let z=0; z<topProd.length; z++) {
            topProd[z].style.transform = 'scale(0)';
            setTimeout(() => {
                topProd[z].style.display = 'none';
            },200);

            if((topProd[z].getAttribute('category') == displayItems) || displayItems == 'all') {
                    topProd[z].style.transform = 'scale(1)';
                    setTimeout(()=>{
                        topProd[z].style.display = 'flex';
                    },200)
                }

        }
    }
}

//footer
const more = document.querySelector('.more')
const subFooter = document.querySelector('.sub_footer')
more.addEventListener('click', function() {
    subFooter.style.display = 'block'
    more.style.display ='none'
})

