## 文法

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
