-module (remote_test_SUITE).

-export ([remote_test/1, all/0]).

all() -> [remote_test].

remote_test(_Config) ->
    RemoteNode = 'a@127.0.0.1',
    CodePath = code:get_path(),
    {ok, HostNode} = ct_slave:start(RemoteNode,
                                    [{kill_if_fail, true},
                                     {init_timeout, 3000},
                                     {startup_timeout, 3000},
                                     {startup_functions, [
                                         {code, set_path, [CodePath]},
                                         {application, ensure_all_started, [code_path_reproducer]}]}]),
    ct:print("\e[32m Node ~p [OK] \e[0m", [HostNode]),
    timer:sleep(3000),
    net_kernel:connect_node(RemoteNode),
    true = rpc:call(RemoteNode, code_path_producer, hello_word, []),
    {ok, _} = ct_slave:stop(RemoteNode),
    ok.
