sinchokur
=====

進捗を可視化します
## Installation

```r
devtools::install_github("dichika/sinchokur")
```

## Usage

###現在の進行状況をコンソールに出力。
```r
print(getRemain(Rmdファイル名,現在の行数))
```
###現在の進行状況をつぶやく。
```r
getRemainTw(Rmdファイル名,現在の行数,CONSUMER_KEY,CONSUMER_SECRET)
```
options(CONSUMER_KEY="XXXXXXXXXXXXX",
        CONSUMER_SECRET="XXXXXXXXXXXXXXXXXXXXX")
と.Rprofileに書いておくとRmdファイル名と現在の行数を入れるだけでそのままつぶやきます。