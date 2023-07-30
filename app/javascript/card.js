const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY)// PAY.JPテスト公開鍵

  // 入力フォームの作成
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  // id属性の要素とフォームを置き換える
  numberElement.mount('#card-number');
  expiryElement.mount('#card-expiry');
  cvcElement.mount('#card-cvc');

  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault();
    // トークンの取得
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // クレジットカードの情報を削除
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();

      // フォームの情報をサーバーサイドに送信
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);