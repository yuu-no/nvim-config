---
description: LazyVim / Neovim プラグインのソースコード参照先
alwaysApply: true
---

# 参照先ガイド

## ローカルソース（優先して参照する）

| 確認したいもの | パス |
|---|---|
| LazyVim デフォルト設定全体 | `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/` |
| LazyVim デフォルト keymaps | `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/keymaps.lua` |
| LazyVim デフォルト options | `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/options.lua` |
| LazyVim プラグイン設定 | `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/` |
| LazyVim extras | `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/extras/` |
| 各プラグインのソース | `~/.local/share/nvim/lazy/<plugin-name>/` |
| インストール済みプラグイン一覧 | `lazy-lock.json` |

## プラグインのソースを調べる手順

1. まず `lazy-lock.json` でプラグイン名を確認
2. `~/.local/share/nvim/lazy/<plugin-name>/` を参照
3. API や型定義は `lua/` ディレクトリを確認

## LazyVim ユーティリティ

LazyVim は `LazyVim` グローバル（`~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/util/`）を提供している。
Lua ファイル内で `LazyVim.xxx` として使える。自前でユーティリティを書く前に確認する。
