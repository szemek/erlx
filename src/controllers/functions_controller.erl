-module(functions_controller).
-compile([export_all]).

show(Req, Module, [Function]) ->
  Host = {localhost, 27017},
  {ok, Connection} = mongo:connect(Host),
  mongo:do(safe, master, Connection, erlx, fun() ->
        Result = mongo_cursor:rest(mongo:find(list_to_atom(Module), {f, bson:utf8(Function)})),
      io:format("~p~n", [Result])
    end),
  mongo:disconnect(Connection),
  {ok, HTMLOutput} = functions_show_dtl:render([]),
  Req:respond({200, [{"Content-Type", "text/html"}], HTMLOutput}).
