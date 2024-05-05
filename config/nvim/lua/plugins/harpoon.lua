return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup({ settings = { save_on_toggle = true } })

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Harpoon Add" })

    vim.keymap.set("n", "<leader>hr", function()
      harpoon:list():remove()
    end, { desc = "Harpoon Remove" })

    vim.keymap.set("n", "<leader>hl", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon List" })

    vim.keymap.set("n", "<leader>h1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon Mark 1" })

    vim.keymap.set("n", "<leader>h2", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon Mark 2" })

    vim.keymap.set("n", "<leader>h3", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon Mark 3" })

    vim.keymap.set("n", "<leader>h4", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon Mark 4" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-p>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon Prev" })

    vim.keymap.set("n", "<C-n>", function()
      harpoon:list():next()
    end, { desc = "Harpoon Next" })
  end,
}
