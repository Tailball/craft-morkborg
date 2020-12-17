const CLASS_ACTIVE = 'active';
const quotes = document.querySelectorAll('.section-main-reward');

let quoteIndex = 0;
let quoteInterval;

let mainQuote;
let quoteData = [];


export default function startSwitchQuotes() {
    readQuotes();
    displayQuote(0);
    quoteInterval = setInterval(onSwitchQuote, 3500);
}

function readQuotes() {
    quotes.forEach((quote, idx) => {
        const q = quote.querySelector('.section-main-reward--quote').innerHTML;
        const a = quote.querySelector('.section-main-reward--author').innerHTML;

        quoteData.push({ quote: q, author: a });
        
        if(idx > 0) quote.remove();
        else mainQuote = quote;
    });
}

function onSwitchQuote() {
    updateQuoteIndex();

    hideQuote()
        .then(displayQuote);
}

function updateQuoteIndex() {
    quoteIndex++;
    if(quoteIndex >= quotes.length) quoteIndex = 0;
}

function hideQuote() {
    return new Promise((res, _) => {
        mainQuote.classList.remove(CLASS_ACTIVE);
        setTimeout(res, 1000);
    });
}

function displayQuote() {
    mainQuote.querySelector('.section-main-reward--quote').innerHTML = quoteData[quoteIndex].quote;
    mainQuote.querySelector('.section-main-reward--author').innerHTML = quoteData[quoteIndex].author;
    mainQuote.classList.add(CLASS_ACTIVE);
}