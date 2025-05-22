const onPriceInput = (event, feeDisplay, profitDisplay) => {
  let inputValue = '';
  if (event.target && typeof event.target.value === 'string') {
    inputValue = event.target.value.trim(); 
  } else {
    const priceInputFallback = document.getElementById("item-price");
    if (priceInputFallback && typeof priceInputFallback.value === 'string') {
      inputValue = priceInputFallback.value.trim();
    }
  }

  const price = Number(inputValue);

  if (!isNaN(price) && price >= 0) {
    const fee = Math.floor(price * 0.1);
    const profit = Math.floor(price - fee);

    feeDisplay.textContent = fee.toLocaleString();
    profitDisplay.textContent = profit.toLocaleString();
  } else {
    feeDisplay.textContent = "-";
    profitDisplay.textContent = "-";
  }
};

const initPriceCalculation = () => {
  const priceInput = document.getElementById("item-price");
  const feeDisplay = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

  if (!priceInput || !feeDisplay || !profitDisplay) {
    return;
  }

  priceInput.removeEventListener("input", priceInput.currentListener);

  const listener = (event) => {
    onPriceInput(event, feeDisplay, profitDisplay);
  };
  priceInput.addEventListener("input", listener);
  priceInput.currentListener = listener; 

  priceInput.dispatchEvent(new Event('input'));
};

document.addEventListener('turbo:load', initPriceCalculation);

document.addEventListener('turbo:render', initPriceCalculation);