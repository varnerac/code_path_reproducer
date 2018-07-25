%%%-------------------------------------------------------------------
%% @doc code_path_reproducer public API
%% @end
%%%-------------------------------------------------------------------

-module(code_path_reproducer_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    code_path_reproducer_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================