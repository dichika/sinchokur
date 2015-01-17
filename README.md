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
library(sinchokur)
print(getRemain(Rmdファイル名,現在の行数))
```
###現在の進行状況をつぶやく。
```r
getRemainTw(Rmdファイル名,現在の行数,CONSUMER_KEY,CONSUMER_SECRET)
```
なお
```r
options(CONSUMER_KEY="XXXXXXXXXXXXX",
        CONSUMER_SECRET="XXXXXXXXXXXXXXXXXXXXX"
        )
```
と.Rprofileに書いておくとRmdファイル名と現在の行数を入れるだけでそのままつぶやきます。

###進捗をほめる
```r
# AnomalyDetectionパッケージをインストールしておく
devtools::install_github(“twitter/AnomalyDetection”)

iijanaidesuka(ほめたい相手のtwitterid, ほめたい相手のgithubのusername, 
              twitterのCONSUMER_KEY, twitterのCONSUMER_SECRET)
```
こんな感じでつぶやく。
<blockquote class="twitter-tweet" lang="ja"><p><a href="https://twitter.com/dichika">@dichika</a> 2015-01-12の進捗、いいじゃないですか <a href="https://t.co/oLYEJ2mq6k">https://t.co/oLYEJ2mq6k</a> <a href="https://twitter.com/hashtag/%E9%80%B2%E6%8D%97?src=hash">#進捗</a></p>&mdash; Yoshio TOKOROSAWA (@dichika) <a href="https://twitter.com/dichika/status/556355154773946369">2015, 1月 17</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
