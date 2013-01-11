-module(erlx_router).
-export([dispatch/3]).

dispatch(Req, DocRoot, Path) ->
  case Req:get(method) of
    Method when Method =:= 'GET'; Method =:= 'HEAD' ->
    case Path of
      _ ->
        Req:serve_file(Path, DocRoot)
    end;
  'POST' ->
    case Path of
      _ ->
        Req:not_found()
    end;
  _ ->
    Req:respond({501, [], []})
end.
