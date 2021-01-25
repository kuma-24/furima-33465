'use strict'

{
   const salesTax = 0.1
   const formatter = new Intl.NumberFormat('ja-JA')
   const priceInput = document.getElementById("item-price");
   const addTaxPrice = document.getElementById("add-tax-price");
   const proFit = document.getElementById("profit");
   
   priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      addTaxPrice.innerHTML = formatter.format(Math.floor(inputValue * salesTax));
      proFit.innerHTML = formatter.format(Math.floor(inputValue - (inputValue * salesTax)));
   });
}
