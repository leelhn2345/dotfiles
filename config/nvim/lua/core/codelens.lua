-- Neovim 0.12.x
-- Align CodeLens text to line indentation.
if vim.fn.has("nvim-0.12") == 0 then
  return
end

local codelens = vim.lsp.codelens

-- Provider is private in 0.12, so retrieve it from codelens.get().
local Provider
for i = 1, 20 do
  local name, value = debug.getupvalue(codelens.get, i)

  if not name then
    break
  end

  if name == "Provider" then
    Provider = value
    break
  end
end

if not Provider then
  vim.notify(
    "core.codelens: could not find vim.lsp.codelens Provider, skipping patch",
    vim.log.levels.WARN
  )
  return
end

if Provider._indent_alignment_patched then
  return
end

local original_on_win = Provider.on_win

Provider.on_win = function(self, toprow, botrow)
  local original_range_lsp = vim.range.lsp

  -- codelens.on_win() uses range.start_col as the amount of
  -- padding before the virtual-line text. Replace that value
  -- with the indentation width of the actual source line.
  vim.range.lsp = function(bufnr, lsp_range, encoding)
    local range = original_range_lsp(bufnr, lsp_range, encoding)

    local row = lsp_range.start.line
    local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1]
      or ""

    local indent = line:match("^%s*") or ""

    range.start_col = vim.fn.strdisplaywidth(indent)

    return range
  end

  -- Make sure vim.range.lsp is restored even if rendering fails.
  local ok, err = xpcall(function()
    original_on_win(self, toprow, botrow)
  end, debug.traceback)

  vim.range.lsp = original_range_lsp

  if not ok then
    error(err)
  end
end

Provider._indent_alignment_patched = true
