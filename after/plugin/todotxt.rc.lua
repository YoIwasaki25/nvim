local status, todo = pcall(require, 'todotxt-nvim')
if (not status) then
end

todo.setup {
  todo_file = '/Users/yoiwasaki/minutes/todo.txt'
}
