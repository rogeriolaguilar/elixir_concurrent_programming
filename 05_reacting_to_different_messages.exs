defmodule HelloWorld do
  def listen do
    receive do
      {:puts, name} -> IO.puts("Hello #{name}!")
      {:puts_pt, name} -> IO.puts("Olá #{name}!")
      _ -> IO.puts("What?")
    end

    listen()
  end
end

pid = spawn(HelloWorld, :listen, [])

send(pid, {:puts, "Thundercats"})
send(pid, {:puts_pt, "Thundercats"})
send(pid, "Test")
