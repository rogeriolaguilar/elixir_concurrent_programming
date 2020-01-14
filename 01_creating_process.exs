defmodule HelloWorld do
  def puts(name) do
    Process.sleep(3)
    IO.puts("Hello #{name}!")
  end
end

pid = spawn(HelloWorld, :hello, ["World"])

Process.alive?(pid) # false