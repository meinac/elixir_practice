# Stack.Server

Using Stack.Server public API
```sh
$ cd stack
$ iex -S mix
$ Stack.Server.start_link([1, 2, 3, 4, 5])
$ Stack.Server.pop # => 1
$ Stack.Server.pop # => 2
$ Stack.Server.push(1) # => :ok
$ Stack.Server.push(8) # => :ok
$ Stack.Server.pop # => 8
```

or link it yourself
```sh
$ cd stack
$ iex -S mix
$ { :ok, pid } = GenServer.start_link(Stack.Server, [1, 2], name: :stack_server)
$ GenServer.call(:stack_server, :pop) # => 1
$ GenServer.call(:stack_server, :pop) # => 2
$ GenServer.call(:stack_server, :pop) # => nil
$ GenServer.cast(:stack_server, { :push, 5 }) # => :ok
$ GenServer.call(:stack_server, :pop) # => 5
```
