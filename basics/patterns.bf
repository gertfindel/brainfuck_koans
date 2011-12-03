This file is not valid since reserved characters are used as punctuation.
'_' marks the initial and final positions of the data pointer.

Duplicate a value (_a, 0, 0) -> (_0, a, a)
[->+>+<<]

Move a value (_a, 0) -> (_0, a)
[->+<]

Add (_a, b) -> (_0, b + a)
[->+<] yes, it the same

Substract (_a, b) -> (_0, b - a)
[->-<]

Multiply (_a, b, 0, 0, 0) -> (_0, b, 0, 0, a*b)
[->[>+>+<<-]>[-<+>]>[->+<]<<<]

While(a && b){a--; b--} (0, _a, b, 0) -> (0, max(a-b, 0), max(b-a, 0), _0 )
[>[< if a; if b
    ->-< dec a; dec b;
    [<] if a goto empty space else don't move
    >> go to b or stop flag
] ]


If(a){code}, destroying a
[
  code
  [-]
]

If(a){code}, preserving a (by copying it)
[->+>+<<] (_a, 0, 0) -> (_0, a, a)
>>[-<<+>>] (_0, a, a) -> (a, a, _0)

<[ now we can work on the copy
  code
  [-]
]


If(x){code1}else{code2}
                         (0 0 _x)
[<+<+>>-]<<[>>+<<-]+ (_1 x x)
>[
    code1
    <-
    >[-]] (0 _0 x) or (1 _0 x=0)
<[
    code2
-] (_0 0 x)


