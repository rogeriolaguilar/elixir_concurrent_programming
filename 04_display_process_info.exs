defmodule HelloWorld do
  def listen do
    receive do
      {:puts, name} -> slow_puts(name)
    end
    listen()
  end

  defp slow_puts(name) do
    Process.sleep(3000)
    IO.puts("Hello #{name}!")
  end
end

pid = spawn(HelloWorld, :listen, [])
send(pid, {:puts, "Snarf"})
Process.info(pid)[:message_queue_len]