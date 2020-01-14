defmodule HelloWorld do
  def start_link do
    spawn(HelloWorld, :init, [])
  end

  def puts_en(pid, name) do
    send(pid, {:puts, name})
  end

  def puts_pt(pid, name) do
    send(pid, {:puts_pt, name})
  end

  def init do
    receive do
      {:puts, name} -> IO.puts("Hello #{name}!")
      {:puts_pt, name} -> IO.puts("Olá #{name}!")
      _ -> IO.puts("What?")
    end

    init()
  end
end

# Codigo cliente
pid = HelloWorld.start_link

HelloWorld.puts_en(pid, "Thundercats")
HelloWorld.puts_pt(pid, "Thundercats")
