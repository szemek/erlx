-module(erlx_router).
-export([dispatch/3]).

dispatch(Req, DocRoot, Path) ->
  [Controller | Action] = re:split(Path, "/", [{return, list}]),
  case Controller of
    "" ->
      main_controller:index(Req);
    _ ->
      Req:serve_file(Path, DocRoot)
  end.
