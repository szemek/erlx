%% @author Mochi Media <dev@mochimedia.com>
%% @copyright erlx Mochi Media <dev@mochimedia.com>

%% @doc Callbacks for the erlx application.

-module(erlx_app).
-author("Mochi Media <dev@mochimedia.com>").

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for erlx.
start(_Type, _StartArgs) ->
    erlx_deps:ensure(),
    erlx_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for erlx.
stop(_State) ->
    ok.
