return {
  "jake-stewart/multicursor.nvim",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- Disable and enable cursors.
    set(
      { "n", "x" },
      "<c-q>",
      mc.toggleCursor,
      { desc = "Toggle multi-cursor" }
    )

    -- Add a cursor for all matches of cursor word/selection in the document.
    set(
      { "n", "x" },
      "<leader>A",
      mc.matchAllAddCursors,
      { desc = "Multicursor match all current word" }
    )

    -- Append/insert for each line of visual selections.
    -- Similar to block selection insertion.
    set(
      "x",
      "I",
      mc.insertVisual,
      { desc = "Insert cursor for each line of visual selection" }
    )
    set(
      "x",
      "A",
      mc.appendVisual,
      { desc = "Append cursor for each line of visual selection" }
    )

    -- match new cursors within visual selections by regex.
    set("x", "m", mc.matchCursors, { desc = "Match new cursors by regex" })

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet(
        { "n", "x" },
        "<left>",
        mc.prevCursor,
        { desc = "Previous cursor as main cursor" }
      )
      layerSet(
        { "n", "x" },
        "<right>",
        mc.nextCursor,
        { desc = "Next cursor as main cursor" }
      )

      -- Delete the main cursor.
      layerSet(
        { "n", "x" },
        "<leader>x",
        mc.deleteCursor,
        { desc = "Delete main cursor" }
      )

      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end, { desc = "Enable or clear cursors" })
    end)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
