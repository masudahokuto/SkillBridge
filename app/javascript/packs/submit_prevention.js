document.addEventListener("DOMContentLoaded", function() {
  // フォーム要素を取得
  const searchForm = document.getElementById("search-form");
  const searchInput = document.getElementById("search-input");

  // エンターキーでフォームを送信しないようにする
  searchForm.addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
      event.preventDefault(); // エンターキーによる送信を無効にする
    }
  });
});
