-module(eval).
-compile([export_all]).

exec(S) ->
  {ok,Scanned,_} = erl_scan:string(S),
  {ok,Parsed} = erl_parse:parse_exprs(Scanned),
  Bindings = erl_eval:new_bindings(),
  {value, Value, _} = erl_eval:exprs(Parsed,Bindings),
  Value.
