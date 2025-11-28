return {
  "saghen/blink.indent",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    scope = {
      -- disable color indentations
      highlights = { "BlinkIndentScope" },
    },
  },
}
