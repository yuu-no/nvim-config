---
description: LazyVim を使った Neovim 設定リポジトリのアーキテクチャ・規約
alwaysApply: true
---

# このリポジトリについて

LazyVim ベースの Neovim 設定リポジトリ。プラグイン管理は lazy.nvim を使用している。

## ディレクトリ構造

```
lua/
  config/
    autocmds.lua    # カスタム autocommands（LazyVim のものを拡張）
    keymaps.lua     # カスタム keymaps（LazyVim のものを拡張/削除）
    lazy.lua        # lazy.nvim 本体のセットアップ
    options.lua     # vim オプション（LazyVim のものを拡張）
    options/
      ftdetect.lua  # filetype 検出
  plugins/          # カスタムプラグイン・LazyVim プラグインの上書き
    *.lua
```

## LazyVim との関係

- LazyVim 本体は `~/.local/share/nvim/lazy/LazyVim/` にある
- LazyVim のデフォルト設定を確認する際は必ずこのパスのソースを参照すること
  - `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/keymaps.lua` — デフォルト keymaps
  - `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/options.lua` — デフォルト options
  - `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/` — デフォルトプラグイン設定
- インストール済みの全プラグインは `~/.local/share/nvim/lazy/<plugin-name>/` にある

## プラグインの上書き・拡張方法

`lua/plugins/` 配下のファイルは `{ import = "plugins" }` でロードされる。
LazyVim が既に設定しているプラグインを上書きする場合、**同じプラグイン名**で spec を返すだけでよい。
lazy.nvim が自動的にマージしてくれる。

```lua
-- 正しい上書き方法
return {
  {
    "plugin/name",
    opts = {
      -- ここで上書きしたいものだけ書く
    },
  },
}
```

`opts` をテーブルで返した場合は LazyVim のデフォルト `opts` にディープマージされる。
関数で返した場合は完全に置き換えられる（`opts = function(_, opts) ... end` を使うとデフォルトを参照しながら変更できる）。

## config/ の拡張ルール

- `config/keymaps.lua` は VeryLazy イベント後に自動ロードされる
- LazyVim のデフォルト keymap を削除するには `vim.keymap.del()` を使う（現在 `<A-j>/<A-k>` を削除済み）
- `config/options.lua` は lazy.nvim 起動前に自動ロードされる
- `config/autocmds.lua` は VeryLazy イベント後に自動ロードされる

## 重要な設定値（現在のカスタマイズ）

- `opt.timeoutlen = 100`（LazyVim デフォルトは 300）
- `opt.clipboard = "unnamedplus"`
- Mason は無効化（`ensure_installed = {}`）— LSP は Nix/システムで管理
- LSP の mason フラグは基本 `false`
