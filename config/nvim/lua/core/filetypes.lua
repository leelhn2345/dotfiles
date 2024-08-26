vim.filetype.add({
  -- detect and assign filetype based on extension
  extension = {
    log = "log",
    conf = "conf",
    env = "dotenv",
    http = "http",
  },
  -- detect and assign filetypes based on entire filename
  filename = {
    [".env"] = "dotenv",
  },
  -- detect and assign filetypes based on certain patterns
  pattern = {
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})
