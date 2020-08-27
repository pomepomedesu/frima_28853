 function caluculation (){

  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  item_price.addEventListener("input", function() {
    const item = item_price.value;
    console.log(item)
    const fee = Math.floor(item * 0.1);
    const profit_price = (item - fee);
    add_tax_price.textContent = fee
    profit.textContent = profit_price
  });
}
window.addEventListener('click', caluculation)





