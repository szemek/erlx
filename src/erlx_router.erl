-module(erlx_router).
-export([dispatch/3]).

dispatch(Req, DocRoot, Path) ->
  [Module | Function] = re:split(Path, "/", [{return, list}, {parts,2}]),
  case Module of
    "" ->
      main_controller:index(Req);
    "css" ->
      Req:serve_file(Path, DocRoot);
    "js" ->
      Req:serve_file(Path, DocRoot);
    "favicon.ico" ->
      Req:serve_file(Path, DocRoot);
    "eval" ->
      case Function of
        ["exec"] -> eval_controller:exec(Req);
        _ -> eval_controller:index(Req)
      end;
    _ ->
      functions_controller:show(Req, Module, Function)
  end.
