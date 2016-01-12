defmodule Stack.Server do
  use GenServer

  ##############
  # Public API #
  ##############

  def start_link(initial_list) do
    GenServer.start_link(__MODULE__, initial_list, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(item) do
    GenServer.cast(__MODULE__, { :push, item })
  end

  #######################
  # GenServer Callbacks #
  #######################

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