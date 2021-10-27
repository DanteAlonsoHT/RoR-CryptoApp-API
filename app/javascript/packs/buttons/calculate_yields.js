window.onload = function() {
    const buttonCalculateBTCYields = document.getElementById("calculate-btc-yields");
const buttonCalculateETHYields = document.getElementById("calculate-eth-yields");
const buttonCalculateADAYields = document.getElementById("calculate-ada-yields");

const inputBitcoinAmount = document.getElementById("bitcoin-amount");
const inputEthereumAmount = document.getElementById("ethereum-amount");
const inputCardanoAmount = document.getElementById("cardano-amount");

const outputBitcoinYield = document.getElementById("bitcoin-yield");
const outputEthereumYield = document.getElementById("ethereum-yield");
const outputCardanoYield = document.getElementById("cardano-yield");

const outputTotalBTCYield = document.getElementById("btc-total-yield");
const outputTotalETHYield = document.getElementById("eth-total-yield");
const outputTotalADAYield = document.getElementById("ada-total-yield");

let bitcoinYield = 0;
let ethereumYield = 0;
let cardanoYield = 0;
//export const calculateBTCYields = 
buttonCalculateBTCYields.addEventListener('click', () => {
    bitcoinCurrentPrice = parseInt(document.getElementById("bitcoin-price").textContent, 10);
    bitcoinYield = parseInt(inputBitcoinAmount.value, 10) * 0.05;

    outputBitcoinYield.value = bitcoinYield;
    outputTotalBTCYield.value = bitcoinCurrentPrice + bitcoinYield;
});

//export const calculateETHYields = 
buttonCalculateETHYields.addEventListener('click', () => {
    ethereumCurrentPrice = parseInt(document.getElementById("ethereum-price").textContent, 10);
    ethereumYield = parseInt(inputEthereumAmount.value, 10) * 0.042;
    outputEthereumYield.value = ethereumYield;
    outputTotalETHYield.value = ethereumCurrentPrice + ethereumYield;
});

//export const calculateADAYields = 
buttonCalculateADAYields.addEventListener('click', () => {
    cardanoCurrentPrice = parseInt(document.getElementById("cardano-price").textContent, 10);
    cardanoYield = parseInt(inputCardanoAmount.value, 10) * 0.01;
    outputCardanoYield.value = cardanoYield;
    outputTotalADAYield.value = cardanoCurrentPrice + cardanoYield;
});
};
