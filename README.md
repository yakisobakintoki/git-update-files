# git-update-files
ファイル毎に更新された時のコミットを一覧にして出力する

# install

  ln -sf git-update-files/main.rb /usr/local/bin/git-update-files
  chmod u+x /usr/local/bin/git-update-files

# 使用方法

.git リポジトリがおいてあるディレクトリで、
git-update-files
とタイプして下さい。

出力の最後に、CSV形式で一覧表を出力します。
凡例
  o => 更新があった(HEAD~#{n})
  x => 更新がなかったコミット(HEAD~#{n})

