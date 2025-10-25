const price = () => {
  // 価格入力フィールドの要素を取得
  const priceInput = document.getElementById("item-price");

  // 価格入力フィールドが存在しないページでは、以降の処理を実行しない
  if (!priceInput) {
    return;
  }

  // 'input'イベントリスナーを追加して、入力があるたびに手数料と利益を計算・表示
  priceInput.addEventListener("input", () => {
    // 入力された価格の値を取得
    const inputValue = priceInput.value;

    // 販売手数料と販売利益を表示する要素を取得
    const addTaxPrice = document.getElementById("add-tax-price");
    const profitPrice = document.getElementById("profit-price");

    // 手数料と利益の要素が存在する場合のみ計算と表示を行う
    if (addTaxPrice && profitPrice) {
      // 販売手数料（10%）を計算
      const tax = Math.floor(inputValue * 0.1);
      // 販売利益を計算
      const profit = inputValue - tax;

      // 計算結果をHTMLに挿入
      addTaxPrice.innerHTML = tax.toLocaleString();
      profitPrice.innerHTML = profit.toLocaleString();
    }
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
