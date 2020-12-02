# :whale2:T.town
T.townは太地町の行政と太地町民との間で行える行政相談（チャットサービス）及び、町のお知らせを掲載するサービスです。

![Image from Gyazo](https://i.gyazo.com/0c57dcad8d5accd5ea80aca6a68501d2.jpg)

<br />

## :globe_with_meridians: URL
URL: http://54.150.184.7

※町民として利用する場合、トップページの右上にある:bust_in_silhouette:をクリックしログイン画面に遷移した後、「町民専用アカウント」のボタンをクリックすると、フォームに文字を入力せずにログインできます。（一応、行政がホストで利用する運用を考えているため、町民アカウントで利用する場合は、お知らせを投稿をすることができません。）


## :thought_balloon: 制作背景
前職で努めていた太地町役場で改善したいと思った箇所があったので、こんなものがあったら労力も軽減でき予算削減につながるのではないかと考え作成いたしました。
<br />改善したいと思った箇所が次の2点です。
<br />:one: **町の回覧（お知らせ）を紙媒体のものからデジタルにする**
<br />:two: **行政相談の記録をデジタルで管理及び直接行政と町民とのやり取りを行う**

:one:つ目は町からのお知らせを各区長の方に委託して、区ごとに配布してもらう作業を行っていたのですが、その区長の方に回覧物を配る作業を職員四人体制で一時間程度かけて配布しておりました。この作業を無くしデジタル化した回覧（お知らせ）を利用できれば、そこに対しての業務がなくなり他の業務に時間を割くことができます。又、紙媒体で回覧物を配っていたその印刷物に対しての予算軽減にもつながると考えられます。そして、何より町民の方の負担（太地町の高齢化率は40%以上ですので、回覧物を配ることが苦になっているという意見もありましたので）を軽減することができるので作成に至りました。

:two:つ目は、行政相談の業務を行っていた際に、感じたことを導入しました。各市町村には、行政相談員という方がおり、市町村に対して疑問に思っていることや、改善してほしいことをその行政相談員の方に、相談し行政に連絡する業務があるのですが、その行政相談員の方が「記録して伝えて・記録して伝えて」を繰り返して行っており、記録ミス等があったのでその箇所をデジタルで記録することで、ミスがなくなり、行政相談員の方の業務が軽減できると考えたので作成に至りました。

## :green_book:機能一覧

### ユーザー機能
- ユーザー登録・編集・削除（deviseのgemを使用)
- ゲストログイン（町民専用ログイン）
- マイページにて以下の投稿の一覧表示
  - 全ての自分の投稿
  - いいねの回数

### 投稿機能
- 回覧の内容やイベントの情報をログインしている方が投稿・編集・削除
- 一覧表示、詳細表示
- イベント場所等は地図表示（Google Maps API）
- タグ付けacts-as-taggable-onのgemを使用）
- 検索（キーワード検索（非同期）・タグ検索）
- いいね機能（非同期）
- 投稿内容に対してコメント（非同期）

### メッセージ機能
- 町民と行政同士のメッセージ送信（非同期、画像も送信可）
- 自動更新
- トーク履歴の表示


<br />

## :notebook:使用技術
### フロントエンド
- Haml
- Sass
- JavaScript（一部jQuery）

### バックエンド
- Ruby 2.6.6  
- Rails 6.0.3.4

### データベース
- MySQL2  

### テスト
- RSpec

### 開発環境
- RuboCop

### 本番環境
- AWS(VPC、EC2、S3、Route53、ACM、ALB)  
- Nginx、Unicorn

<br />

## :closed_book:ER図
![Image from Gyazo](https://i.gyazo.com/ab5438d5405ef6e6fece172122a48ca6.png)
