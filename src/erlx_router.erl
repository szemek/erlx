-module(erlx_router).
-export([dispatch/3]).

dispatch(Req, DocRoot, Path) ->
  [Module | Function] = re:split(Path, "/", [{return, list}]),
  case Module of
    "" ->
      main_controller:index(Req);
    "css" ->
      Req:serve_file(Path, DocRoot);
    _ ->
      functions_controller:show(Req, Module, Function)
  end.
