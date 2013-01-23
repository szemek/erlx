-module(eval_controller).
-compile([export_all]).

index(Req) ->
  {ok, HTMLOutput} = eval_index_dtl:render([]),
  Req:respond({200, [{"Content-Type", "text/html"}], HTMLOutput}).

exec(Req) ->
  PostData = Req:parse_post(),
  Code = proplists:get_value("code", PostData),
  % http://blog.syntaxvssemantics.com/2009/02/convert-arbitrary-erlang-expression-to.html
  Eval = binary_to_list(list_to_binary(io_lib:format("~p", [eval:exec(Code)]))),
  Req:respond({200, [{"Content-Type", "text/plain"}], Eval}).
