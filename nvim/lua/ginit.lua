-------------
-- Nvim-qt --
-------------

if vim.g.GuiLoaded then
  local font_name = "IosevkaTerm Nerd Font Propo"
  local font_size = 12
  local not_transparent = false

 local function toggleTransparency()
   not_transparent = not not_transparent
   if not_transparent then
     vim.cmd("GuiWindowOpacity " .. (0.93))
   else
     vim.cmd("GuiWindowOpacity " .. (1.0))
   end
 end

  vim.keymap.set("n", "<F10>", toggleTransparency, { })
  vim.cmd("autocmd VimEnter * call toggleTransparency()")

  vim.cmd [[
  GuiTabline 0
  GuiPopupmenu 0
  ]]
  vim.cmd("GuiFont! " .. font_name .. ":h" .. font_size)
end

-------------
-- Neovide --
-------------

if vim.g.neovide then
  vim.opt.guifont = "IosevkaTerm Nerd Font Propo:h12:w32"
  vim.g.remember_window_size = false
  vim.g.remember_window_position = false

  local function toggleTransparency()
    if vim.g.neovide_transparency == 1.0 then
      vim.cmd "let g:neovide_transparency=0.9"
    else
      vim.cmd "let g:neovide_transparency=1.0"
    end
  end

  vim.keymap.set("n", "<F10>", toggleTransparency, {  })
end

