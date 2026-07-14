return {
  "coder/claudecode.nvim",
  opts = {
    terminal = {
      -- 外部ターミナル（Herdr）を使う指定
      provider = "external",

      provider_opts = {
        -- herdr pane split は JSON を返すため jq で pane_id を抽出してから run する。
        -- ペインのシェルは fish で `VAR=val cmd` 形式が使えないので、IDE 連携用の env
        -- （CLAUDE_CODE_SSE_PORT 等）は herdr の --env で新ペインに渡す。
        -- シェル構文を含むので sh -c でラップして argv table を返す。
        external_terminal_cmd = function(cmd, env)
          local split = {
            "herdr pane split --direction right --ratio 0.70",
            "--cwd " .. vim.fn.shellescape(vim.fn.getcwd()),
          }
          for k, v in pairs(env or {}) do
            table.insert(split, "--env " .. vim.fn.shellescape(k .. "=" .. tostring(v)))
          end
          table.insert(split, "--focus")
          local script = string.format(
            "NEW_PANE=$(%s | jq -r '.result.pane.pane_id') && herdr pane run \"$NEW_PANE\" %s",
            table.concat(split, " "),
            vim.fn.shellescape(cmd)
          )
          return { "sh", "-c", script }
        end,
      },
    },
    diff_opts = {
      open_in_new_tab = true,
      keep_terminal_focus = true,
    },
  },
}
