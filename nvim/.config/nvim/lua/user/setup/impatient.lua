local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  print("gurk! it broke!")
  return
end

--impatient.enable_profile()
