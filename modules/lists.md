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
