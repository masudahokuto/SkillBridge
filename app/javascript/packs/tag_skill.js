document.addEventListener('DOMContentLoaded', function() {
  const searchInput = document.getElementById('search-input');
  const skillCards = document.querySelectorAll('.skill-card-link');

  // searchInputが存在する場合のみイベントリスナーを追加
  if (searchInput) {
    searchInput.addEventListener('input', function() {
      const query = searchInput.value.toLowerCase();

      skillCards.forEach(function(card) {
        const tagTitleElement = card.querySelector('.skill-card-title');

        // skill-card-title 要素が存在するかを確認してから処理を行う
        if (tagTitleElement) {
          const tagTitle = tagTitleElement.textContent.toLowerCase();

          // タイトルが検索クエリにマッチすれば表示、そうでなければ非表示
          card.style.display = tagTitle.includes(query) ? 'block' : 'none';
        }
      });
    });
  }
});
