defmodule HelloWorld do
  def listen do
    receive do
      {:puts, name} -> IO.puts("Hello #{name}!")
    end
  end
end

pid = spawn(HelloWorld, :listen, [])

Process.alive?(pid) # true

send(pid, {:puts, "World"})

Process.alive?(pid) # false