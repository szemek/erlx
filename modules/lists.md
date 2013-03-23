## all(Pred, List) -> boolean()

```erlang
> lists:all(fun(X) -> X > 2 end, [1,2,3,4]).
false

> lists:all(fun(X) -> X > 2 end, [3,4]).
true
```

## any(Pred, List) -> boolean()

```erlang
> lists:any(fun(X) -> X > 2 end, [1,2,3,4]).
true

> lists:any(fun(X) -> X > 2 end, [1,2]).
false
```

## append(ListOfLists) -> List1

```erlang
> lists:append([[1, 2, 3], [a, b], [4, 5, 6]]).
[1,2,3,a,b,4,5,6]
```

## append(List1, List2) -> List3

```erlang
> lists:append("abc", "def").
"abcdef"
```

## concat(Things) -> string()

```erlang
> lists:concat([doc, '/', file, '.', 3]).
"doc/file.3"
```

## delete(Elem, List1) -> List2

```erlang
> lists:delete(1, [1, 1, 1]).
[1,1]

lists:delete(1, [2, 2, 2]).
[2,2,2]
```

## dropwhile(Pred, List1) -> List2

```erlang
> lists:dropwhile(fun(X) -> X < 3 end, [1,2,3]).
[3]

> lists:dropwhile(fun(X) -> X < 0 end, [1,2,3]).
[1,2,3]
```

## duplicate(N, Elem) -> List

```erlang
> lists:duplicate(5, xx).
[xx,xx,xx,xx,xx]
```

## filter(Pred, List1) -> List2

```erlang
> lists:filter(fun(X) -> X rem 2 == 0 end, [0,1,2,3,4,5]).
[0,2,4]

lists:filter(fun(X) -> X div 2 == 1 end, [0,1,2,3,4,5]).
[2,3]

lists:filter(fun(X) -> X > 3 end, [0,1,2,3,4,5]).
[4,5]
```

## flatlength(DeepList) -> integer() >= 0

```erlang
> lists:flatlength([1,[1,[1,[1]]]]).
4
```

## flatmap(Fun, List1) -> List2

```erlang
> lists:flatmap(fun(X)->[X,X] end, [a,b,c]).
[a,a,b,b,c,c]
```

## flatten(DeepList) -> List

```erlang
> lists:flatten([1,[1,[1,[1]]]]).
[1,1,1,1]
```

## flatten(DeepList, Tail) -> List

```erlang
> lists:flatten([1,[1,[1,[1]]]], [2,3]).
[1,1,1,1,2,3]
```

## foldl(Fun, Acc0, List) -> Acc1

```erlang
> lists:foldl(fun(X, Sum) -> X + Sum end, 0, [1,2,3,4,5]).
15

> lists:foldl(fun(X, Prod) -> X * Prod end, 1, [1,2,3,4,5]).
120

> lists:foldl(fun(Elem, AccIn) -> io:format("~p ", [Elem]), AccIn end, 0, [1,2,3]).
1 2 3 0
```

## foldr(Fun, Acc0, List) -> Acc1

```erlang
> lists:foldr(fun(X, Sum) -> X + Sum end, 0, [1,2,3,4,5]).
15

> lists:foldr(fun(X, Prod) -> X * Prod end, 1, [1,2,3,4,5]).
120

>lists:foldr(fun(Elem, AccIn) -> io:format("~p ", [Elem]), AccIn end, 0, [1,2,3]).
3 2 1 0
```

## foreach(Fun, List) -> ok

```erlang
> lists:foreach(fun(X) -> X end, [1,2,3]).
ok

> lists:foreach(fun(X) -> io:format(":: ~p~n", [X]) end, [1,2,3]).
:: 1
:: 2
:: 3
ok
```

## keydelete(Key, N, TupleList1) -> TupleList2

```erlang
> lists:keydelete(fruit, 1, [{fruit, banana}, {fruit, strawberry}]).
[{fruit,strawberry}]

> lists:keydelete(strawberry, 2, [{fruit, banana}, {fruit, strawberry}]).
[{fruit,banana}]
```

## keyfind(Key, N, TupleList) -> Tuple | false

```erlang
> lists:keyfind(strawberry, 1, [{fruit, banana}, {fruit, strawberry}]).
false

> lists:keyfind(strawberry, 2, [{fruit, banana}, {fruit, strawberry}]).
{fruit,strawberry}
```

## keymap(Fun, N, TupleList1) -> TupleList2

```erlang
> lists:keymap(fun({FirstName, LastName}) -> FirstName end, 2, [{person, {"Alice", "Wonder"}}, {person, {"Bob", "Smith"}}]).
[{person,"Alice"},{person,"Bob"}]
```
