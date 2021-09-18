const films = document.getElementsByClassName('review-block');
const slidesCount = films.length;
const slideWidthPx = 325;
const visibleFilmsCount = 4;
const animationDuration = 300;
const animationFunction = "ease-in-out";

function prevSlide() {
    let viewFilm
    let currTranslateX;
    let viewFilmsIndexes = collectViewFilmsIndexes(films);
    setLeftEdge(films);
    for (viewFilm of viewFilmsIndexes){
        currTranslateX = getTranslateX(films[viewFilm]);
        films[viewFilm].animate([
            {transform: `translateX(${currTranslateX}px)`},
            {transform: `translateX(${slideWidthPx + currTranslateX}px)`},
        ], {
            duration: animationDuration,
            easing: animationFunction,
        });
        films[viewFilm].style.transform = `translateX(${slideWidthPx + currTranslateX}px)`;
    }
}

function nextSlide() {
    let film;
    let viewFilmsIndexes = collectViewFilmsIndexes(films);
    setRightEdge(films);
    let currTranslateX;
    for (viewFilm of viewFilmsIndexes){
        currTranslateX = getTranslateX(films[viewFilm]);
        films[viewFilm].animate([
            {transform: `translateX(${currTranslateX}px)`},
            {transform: `translateX(${slideWidthPx + currTranslateX}px)`},
        ], {
            duration: animationDuration,
            easing: animationFunction,
        });
        films[viewFilm].style.transform = `translateX(${slideWidthPx + currTranslateX}px)`;
    }
    for (let i = 0; i < slidesCount; ++i) {
        if (viewFilmsIndexes.includes(i)) {
            currTranslateX = getTranslateX(films[i]);
            films[i].animate([
                    {transform: `translateX(${currTranslateX}px)`},
                    {transform: `translateX(${-slideWidthPx + currTranslateX}px)`},
                ], {
                duration: animationDuration,
                easing: animationFunction,
            });
            films[i].style.transform = `translateX(${-slideWidthPx + currTranslateX}px)`;
        }
    }
}

function collectViewFilmsIndexes(films) {
    let i;
    let viewFilms = [];
    let nextLast = getNextLastSlideIndex(films);
    let nextFirst = getNextFirstSlideIndex(films);
    if (nextFirst < nextLast) {
        for (i = nextFirst; i <= nextLast; ++i) {
            viewFilms.push(i);
        }
    } else {
        for (i = nextFirst; i < slidesCount; ++i) {
            viewFilms.push(i);
        }
        for (i = 0; i <= nextLast; ++i) {
            viewFilms.push(i);
        }
    }
    return viewFilms;
}

function setLeftEdge(films) {
    let nextFirst;
    nextFirst = getNextFirstSlideIndex(films);
    let delta = slideWidthPx * (-nextFirst - 1);
    films[nextFirst].style.transform = `translateX(${delta}px)`;
}

function setRightEdge(films) {
    let nextLast;
    nextLast = getNextLastSlideIndex(films);
    let delta = slideWidthPx * (visibleFilmsCount - nextLast);
    films[nextLast].style.transform = `translateX(${delta}px)`;
}

function getNextFirstSlideIndex(films) {
    let nextFirstSlide = (getFirstSlideIndex(films) - 1) % slidesCount;
    if (nextFirstSlide < 0) {
        nextFirstSlide += slidesCount
    }
    return nextFirstSlide;
}

function getNextLastSlideIndex(films) {
    return (getLastSlideIndex(films) + 1) % slidesCount;
}

function getLastSlideIndex(films) {
    let firstSlide = getFirstSlideIndex(films);
    return (firstSlide + visibleFilmsCount - 1) % slidesCount;
}

function getFirstSlideIndex(films) {
    let translatesX = getFilmsTranslates(films);
    return translatesX.indexOf(0);
}

function getFilmsTranslates(films) {
    let film;
    let currFilmOffset = 0;
    let translates = [];
    for (film of films) {
        translates.push(currFilmOffset + getTranslateX(film));
        currFilmOffset += slideWidthPx;
    }
    return translates;
}

function getTranslateX(film) {
    let style = window.getComputedStyle(film);
    let matrix = new WebKitCSSMatrix(style.transform);
    return matrix.e;                                      // горизонтальный 3d/2d сдвиг. (е == m41) === Tx
}

// ╚(ಠ_ಠ)=┐

function run() {
    const nextBtn = document.getElementById('next-btn');
    const prevBtn = document.getElementById('prev-btn');

    nextBtn.addEventListener("click", () => nextSlide(films));
    prevBtn.addEventListener("click", () => prevSlide(films));
}

window.onload = run;