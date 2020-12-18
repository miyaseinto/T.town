# :whale2:T.town
T.townは太地町（和歌山県の最南端に位置する町です）の行政と太地町民との間で行える行政相談（チャットサービス）及び、町のお知らせを掲載するサービスです。

![Image from Gyazo](https://i.gyazo.com/0c57dcad8d5accd5ea80aca6a68501d2.jpg)

<br />

## :globe_with_meridians: URL
URL: http://taijitown.com

※町民として利用する場合、トップページの右上にある:bust_in_silhouette:をクリックしログイン画面に遷移した後、「町民専用アカウント」のボタンをクリックすると、フォームに文字を入力せずにログインできます。行政と町民との間で使うことを想定しておりますので、ゲストログインでログインする場合は町民専用アカウントととして考えており、一般ログインは行政アカウントで各課（総務課、住民福祉課、産業建設課、教育委員会）によってログインします。
<br/><strong>※ポートフォリオですので、ゲストログイン（町民専用）でも投稿できる仕様にしております。</strong>

## :bust_in_silhouette: ログインアカウント
ホスト側が行政として使用するため、各課のアカウントの名前とメールアドレスに対してvalidationをかけております。一覧は以下になります。行政として利用する場合は使用ください。
|名　前|メールアドレス|パスワード|
|:----------:|:----------------:|:------------:|
|総務課|soumu@taiji.town|soumu12345|
|住民福祉課|jyuumin@taiji.town|jyuumin12345|
|産業建設課|sanken@taiji.town|sanken12345|
|教育委員会|kyouiku@taiji.town|kyouiku12345|

## :thought_balloon: 制作背景
私は、太地町役場の総務課で防災業務を主に行っておりました。その他の業務で町民の方々に町のお知らせ等を配る業務(以下回覧業務という)及び行政相談業務(町民の方が行政に対してのお願い及び質問等を行政相談員を介して伝えてもらい答えを提示する業務)に携わっておりました。その業務の中で、改善することにより職員及び町民の方の労力も軽減でき予算削減にもつながるのではないかと考え作成いたしました。以下に改善要素を記載します。それぞれT.townで改善見込みがあると考えております。
### 回覧業務に関しての改善要素
<p>1.紙媒体で行っていたため、印刷費用・その他にかかる印刷用紙費等に際しての予算削減（回覧業務に関しての予算は約年間40万円程度）</p>
<p>2.回覧配布業務（各家のポストに区長の方が配布する業務）での区長の方の労力削減</p>
<p>3.区長の方に一年間通して報酬を支払っているため、その予算削減にもつながる（区長報酬に関しての予算は約年間200万円程度）</p>
<p>4.職員が回覧の日になると車で各区長の方の自宅へ1時間かけて配布しているため、職員の労力削減</p>

### 行政相談に関しての改善要素
<p>1.委託でお願いしている行政相談員の労力軽減</p>
<p>2.行政相談の行き違い等を防ぐことができる</p>
<p>3.伝えられる相談が直接でないため（行政相談員を介しているため）解釈違い等が起こりうる可能性を低下できる</p>
<p>4.匿名での相談を行うために行政相談員を介しているのだが、それが不要になり直接町民というアカウントから相談ができる様になる</p>
これらを、改善できると考え作成に至りました。

## :open_file_folder:機能動作
:large_blue_diamond:投稿一覧画面です。一覧画面で内容を読み取れる仕様にしております。
[![Image from Gyazo](https://i.gyazo.com/679379037d4f87d0962c01682ea1ed71.png)](https://gyazo.com/679379037d4f87d0962c01682ea1ed71)

:large_blue_diamond:投稿の詳細画面です。左側には、誰が投稿したのかがわかるように表示をしております。中央には投稿した内容の詳細を表示し、いいね機能もわかりやすく表示しております。右側にコメントができる仕様をとっております。
[![Image from Gyazo](https://i.gyazo.com/8d820f2694e98e461c6f0a7f1105ada3.png)](https://gyazo.com/8d820f2694e98e461c6f0a7f1105ada3)

:large_blue_diamond:投稿の一覧画面で文字検索を行っています。一文字一文字が入力されるたびに検索される仕様にしております。
https://gyazo.com/4272d1578fac5a588d760afc0d428989

:large_blue_diamond:投稿の一覧画面でタグによって検索ができるようにしており、クリックするでけで表示を変えております。
https://gyazo.com/c17eda8d0775d9aea2ed4ca7d32c2119

:large_blue_diamond:行政相談のチャット画面です。行政側と町民側でアイコンを変えております。又、入力時間の表記もしておりますので、記録メモのミス等を回避することができます。
![Image from Gyazo](https://i.gyazo.com/292d05f5e4ea038981c1c8abf0f49ef2.jpg)


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
- タグ付け(acts-as-taggable-onのgemを使用）
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
- MariaDB  

### テスト
- RSpec
- FactoryBot

### 開発環境
- RuboCop

### 本番環境
- AWS(VPC、EC2、S3、Route53) 
- Nginx、Unicorn

<br />

## :closed_book:ER図
![Image from Gyazo](https://i.gyazo.com/ab5438d5405ef6e6fece172122a48ca6.png)


## :orange_book:インフラ図
![Image from Gyazo](https://i.gyazo.com/afbb6850269c97204b8b4a81db1a53dc.png)
