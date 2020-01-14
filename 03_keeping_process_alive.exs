defmodule HelloWorld do
  def listen do
    receive do
      {:puts, name} -> IO.puts("Hello #{name}!")
    end

    listen()
  end
end

pid = spawn(HelloWorld, :listen, [])

send(pid, {:puts, "World"})
Process.alive?(pid) # true
