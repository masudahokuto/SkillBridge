document.addEventListener('DOMContentLoaded', function() {
  const searchInput = document.getElementById('search-input');
  const skillCards = document.querySelectorAll('.skill-card-link');

  searchInput.addEventListener('input', function() {
    const query = searchInput.value.toLowerCase();

    skillCards.forEach(function(card) {
      const tagTitle = card.querySelector('.skill-card-title').textContent.toLowerCase();
      
      // タイトルが検索クエリにマッチすれば表示、そうでなければ非表示
      if (tagTitle.includes(query)) {
        card.style.display = 'block';
      } else {
        card.style.display = 'none';
      }
    });
  });
});