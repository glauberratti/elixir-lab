IO.puts("Hello world")

res = IO.gets("say something\n")
IO.puts(res)

IO.puts("say something else")
res2 = IO.read(:stdio, :line)
IO.puts(res2)
