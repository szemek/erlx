-module(eval_controller).
-compile([export_all]).

index(Req) ->
  {ok, HTMLOutput} = eval_index_dtl:render([]),
  Req:respond({200, [{"Content-Type", "text/html"}], HTMLOutput}).

exec(Req) ->
  PostData = Req:parse_post(),
  String = proplists:get_value("string", PostData),
  Req:respond({200, [{"Content-Type", "text/plain"}], String}).
