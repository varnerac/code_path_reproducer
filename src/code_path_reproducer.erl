-module(code_path_reproducer).

-export([hello_world/0]).

hello_world() ->
    io:format("Hello world").