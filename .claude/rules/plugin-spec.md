---
description: lua/plugins/ 配下のファイルを編集・追加するときのルール
globs: ["lua/plugins/*.lua", "lua/config/*.lua"]
---

# プラグイン設定の書き方

## 基本形式

`lua/plugins/` の各ファイルは lazy.nvim の spec テーブルを返す。

```lua
return {
  {
    "author/plugin-name",
    opts = { ... },
  },
}
```

## 作業前の確認手順

1. **LazyVim が既に設定しているか確認する**
   `~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/` を検索して、
   対象プラグインが既に設定されていないか確認してから作業する。

2. **既存プラグインのオプション確認**
   LazyVim のデフォルト `opts` を確認した上で、変更が必要な部分だけ上書きする。

3. **lazy-lock.json でインストール済みか確認**
   プラグインを追加する前に `lazy-lock.json` で既にインストールされていないか確認する。

## opts のマージ挙動

| `opts` の型 | 挙動 |
|---|---|
| `table` | LazyVim のデフォルト opts にディープマージ |
| `function(_, opts)` | `opts` にデフォルト値が入ってくるので、それを参照して変更 |
| `function(_)` | デフォルトを完全無視（意図的な場合のみ使う）|

## キーマップの追加

LazyVim 組み込みのキーマップと競合しないよう、追加前に
`~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/keymaps.lua` を確認する。

```lua
-- プラグイン spec 内でキーマップを定義する場合
keys = {
  { "<leader>xx", "<cmd>SomeCmd<cr>", desc = "Description" },
},
```

## LSP 設定の注意点

このリポジトリでは **Mason を使わない**（LSP は Nix/システムで管理）。
LSP を追加する場合は必ず `mason = false` を付ける:

```lua
opts = {
  servers = {
    some_lsp = {
      mason = false,
    },
  },
},
```

## フォーマッター設定（conform.nvim）

`lua/plugins/format.lua` で filetype ごとに設定。
`lsp_format = "never"` は LSP のフォーマットを無効にする（json など特定の ft 用）。

## ファイル分割の基準

1ファイルにまとめるか分けるかは**機能の凝集度**で判断する。
関連する設定は同じファイルにまとめるのが望ましい。
既存のファイル構成（`format.lua`, `lsp.lua`, `treesitter.lua` など）を参考にする。
