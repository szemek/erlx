-module(redistogo).
-compile([export_all]).

connect() ->
  REDISTOGO_URL = os:getenv("REDISTOGO_URL"),
  {match, [
      _,
      _,
      _,
      {PassStart, PassLen},
      {HostStart, HostLen},
      {PortStart, PortLen}
    ]} = re:run(REDISTOGO_URL, "([a-z]+)://([a-z]+):([a-z0-9]+)@([a-z\.]+):([0-9]+)/"),
  Pass = lists:sublist(REDISTOGO_URL, PassStart+1, PassLen),
  Host = lists:sublist(REDISTOGO_URL, HostStart+1, HostLen),
  Port = lists:sublist(REDISTOGO_URL, PortStart+1, PortLen),
  {ok, Connection} = eredis:start_link(Host, Port, 0, Pass),
  Connection.
