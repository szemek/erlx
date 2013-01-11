%% @author Mochi Media <dev@mochimedia.com>
%% @copyright 2010 Mochi Media <dev@mochimedia.com>

%% @doc erlx.

-module(erlx).
-author("Mochi Media <dev@mochimedia.com>").
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.


%% @spec start() -> ok
%% @doc Start the erlx server.
start() ->
    erlx_deps:ensure(),
    ensure_started(crypto),
    application:start(erlx).


%% @spec stop() -> ok
%% @doc Stop the erlx server.
stop() ->
    application:stop(erlx).
