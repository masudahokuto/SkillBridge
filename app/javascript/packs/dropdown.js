document.addEventListener("DOMContentLoaded", () => {
  const dropdownToggle = document.getElementById('dropdownToggle');
  const dropdownMenu = document.getElementById('dropdownMenu');

  // プロフィール画像をクリックしたときのイベントリスナー
  dropdownToggle.addEventListener('click', (event) => {
    event.preventDefault(); // デフォルトのリンク動作を防ぐ
    dropdownMenu.classList.toggle('show'); // showクラスをトグル
  });

  // ドロップダウン外をクリックしたときにメニューを閉じる
  document.addEventListener('click', (event) => {
    if (!dropdownToggle.contains(event.target) && !dropdownMenu.contains(event.target)) {
      dropdownMenu.classList.remove('show'); // showクラスを削除
    }
  });
});