local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  print("tele h_status_notok")
  return
end

local h_status_ok, harpoon = pcall(require, "harpoon")
if not h_status_ok then
  print("tele harpoon is not ok")
  return
end

lvim.builtin.telescope.load_extension = { "harpoon" }
telescope.load_extension "harpoon"
