-module(mongohq).
-compile([export_all]).

%%
%% http://blog.mongodb.org/post/7270427645/design-of-the-erlang-driver-for-mongodb
%% Plain Erlang string is interpreted as a BSON array of integers,
%% so make sure to always encode your strings, as in <<"hello">>
%% or bson:utf8("hello").
%%

parse_url() ->
  MONGOHQ_URL = os:getenv("MONGOHQ_URL"),
  {match, [
      _,
      _,
      {UserStart, UserLen},
      {PassStart, PassLen},
      {HostStart, HostLen},
      {PortStart, PortLen},
      {DbStart, DbLen}
    ]} = re:run(MONGOHQ_URL, "([a-z]+)://([a-z]+):([a-z0-9]+)@([a-z\.]+):([0-9]+)/([a-z0-9]+)"),
  Username = bson:utf8(lists:sublist(MONGOHQ_URL, UserStart+1, UserLen)),
  Password = bson:utf8(lists:sublist(MONGOHQ_URL, PassStart+1, PassLen)),
  Host = lists:sublist(MONGOHQ_URL, HostStart+1, HostLen),
  Port = list_to_integer(lists:sublist(MONGOHQ_URL, PortStart+1, PortLen)),
  Db = list_to_atom(lists:sublist(MONGOHQ_URL, DbStart+1, DbLen)),
  {Username, Password, Host, Port, Db}.

connect(Host, Port) ->
  {ok, Connection} = mongo:connect({Host, Port}),
  Connection.

auth() ->
  {Username, Password, Host, Port, Db} = parse_url(),
  Connection = connect(Host, Port),
  Authenticate = fun() -> mongo:auth(Username, Password) end,
  mongo:do(unsafe, slave_ok, Connection, Db, Authenticate).

