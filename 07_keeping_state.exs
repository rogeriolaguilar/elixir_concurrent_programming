defmodule HelloWorld do
  def start_link, do: spawn(HelloWorld, :init, [0])

  def puts_en(pid, name), do: send(pid, {:puts, name})

  def greetings_count(pid), do: send(pid, {:greetings_count})

  def init(counter) do
    new_count = receive do
      {:puts, name} -> 
        IO.puts("Hello #{name}!")
        counter + 1
      {:greetings_count} -> 
        IO.puts("The greeting count is #{counter}")
        counter
      _ -> 
        IO.puts("What?")
        counter
    end

    init(new_count)
  end
end

# Codigo cliente
pid = HelloWorld.start_link

HelloWorld.greetings_count(pid) # The greeting count is 0
HelloWorld.puts_en(pid, "Thundercats") # Hello Thundercats!
HelloWorld.greetings_count(pid) # The greeting count is 1
