-- Neovim's default right-click PopUp menu only defines Copy/Cut/Delete for
-- Visual/Select mode (see :help popup-menu + vim/_core/defaults.lua). Opening
-- the menu in Normal or Insert mode therefore raises
-- "Menu not defined for Normal Mode" / "...Insert Mode".
--
-- Add the missing Normal/Insert variants so those items work everywhere.
vim.cmd([[
  nnoremenu PopUp.Copy   "+yy
  nnoremenu PopUp.Cut    "+dd
  nnoremenu PopUp.Delete "_dd
  inoremenu PopUp.Copy   <C-O>"+yy
  inoremenu PopUp.Cut    <C-O>"+dd
  inoremenu PopUp.Delete <C-O>"_dd
]])
