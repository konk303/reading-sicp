## 文法

https://www.shido.info/lisp/scheme5.html

### if

```scheme
(define (method i)
  (if (= i 1)
  i
  (* i 2)))
```

### let

第1引数が名前と内容のペアのリスト
第2引数の処理内で↑がバインドされる

```scheme
(define (method i)
  (let(
       (one 1)
       (two 2))
    display (+ one two i)))
```

### cond

条件とreturnのペアのリスト
elseあり

```scheme
(define (method i)
  (cond ((= i 1) "one!")
        ((= i 2) "two!")
        (else "not one or two!")))
```

### lambda

lambda

```scheme
(lambda (x) (* x x))
```

### begin

begin は与えられた式を前から順番に評価していき、最後の式の値を返します。
