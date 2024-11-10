document.addEventListener("DOMContentLoaded", function() {
  // フォーム要素を取得
  const searchForm = document.getElementById("search-form");
  const searchInput = document.getElementById("search-input");

  // searchFormが存在する場合のみエンターキーによる送信を無効にする
  if (searchForm) {
    searchForm.addEventListener("keydown", function(event) {
      if (event.key === "Enter") {
        event.preventDefault(); // エンターキーによる送信を無効にする
      }
    });
  }
});
