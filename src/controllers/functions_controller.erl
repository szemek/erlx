-module(functions_controller).
-compile([export_all]).

show(Req, Module, Function) ->
  {ok, HTMLOutput} = functions_show_dtl:render([]),
  Req:respond({200, [{"Content-Type", "text/html"}], HTMLOutput}).
