-module (local_test_SUITE).

-export ([local_test/1, all/0]).

all() -> [local_test].

local_test(_Config) ->
    code_path_reproducer:hello_world(),
    ok.
