local status, colorizer = pcall(require, "colorizer")
if (not status) then
  return
end

colorizer.setup({
  '*' -- Highlight allfiles, but customize some others
})
