# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## このリポジトリ

LazyVim ベースの個人用 Neovim 設定。`init.lua` → `require("config.lazy")` で lazy.nvim を起動し、
`lua/plugins/` を `{ import = "plugins" }` で読み込む。設定はすべて Lua。ビルド工程はない。

## 詳細ルール（作業前に必ず読む）

`.claude/rules/` に運用ルールがある。作業内容に応じて該当ファイルを参照すること。

- `.claude/rules/lazyvim-architecture.md` — ディレクトリ構造、LazyVim との関係、上書き/拡張方法
- `.claude/rules/plugin-spec.md` — `lua/plugins/` の書き方、`opts` マージ挙動、キーマップ追加手順
- `.claude/rules/reference-sources.md` — LazyVim デフォルト設定・プラグインソースの参照先パス

## 検証・フォーマット

- **Lua フォーマット**: `stylua .`（設定は `stylua.toml`: 2 スペース / column_width 120）。Lua を編集したら実行する。
- **設定変更の検証**: 起動時のエラーは `nvim --headless "+qa"` で確認できる（正常なら無出力）。
  対話的な動作確認はユーザーに `! nvim` の実行を促す。UI 挙動は自分では検証できないため「未検証」と明記する。

## この設定固有の前提

- **Mason 不使用**: LSP バイナリは Nix/システム管理。LSP を追加する際は必ず `mason = false`
  （`ensure_installed = {}` で Mason 自動インストールも無効化済み）。詳細は `lua/plugins/lsp.lua`。
- **Perl 開発が主対象**: `perlnavigator` LSP を使用。カレントに `.carmel` があると `PERL5OPT=-MCarmel::Setup`
  を注入する。テストは `yuu-no/neotest-prove`（`~/ghq/github.com/yuu-no/neotest-prove` のローカル dir）で prove を実行。
- **クリップボード**: `clipboard = "unnamedplus"` + `vim.g.clipboard = "osc52"`（リモート環境で OSC52 経由）。
- **json/jsonc は autoformat 無効**: `ftplugin/json.lua` と `autocmds.lua` で `vim.b.autoformat = false`。
  conform 側も `json = { lsp_format = "never" }`。
- **削除済みデフォルトキーマップ**: LazyVim の `<A-j>`/`<A-k>`（行移動）を `keymaps.lua` で `vim.keymap.del` 済み。

## LazyVim extras

有効な extras は `lazyvim.json` の `extras` 配列で管理（AI: claudecode/copilot、test.core、
snacks_explorer/picker、dial、yanky など）。extras の追加/削除はこのファイルを編集する。
