## all(Pred, List) -> boolean()

```erlang
> lists:all(fun(X) -> X > 2 end, [1,2,3,4]).
false
```

```erlang
> lists:all(fun(X) -> X > 2 end, [3,4]).
true
```

## any(Pred, List) -> boolean()

```erlang
> lists:any(fun(X) -> X > 2 end, [1,2,3,4]).
true
```

```erlang
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
