defmodule Stack.Server do
  use GenServer

  def handle_call(:pop, _from, current_list) do
    case current_list do
      [head | tail] -> { :reply, head, tail }
      _ -> { :reply, nil, nil }
    end
  end

  def handle_cast({ :push, item }, current_list) do
    { :noreply, [item | current_list] }
  end

end