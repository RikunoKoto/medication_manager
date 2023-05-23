# 服薬管理アプリ作成

## 1. 概要
Android または iPhone で動作する服薬を管理するアプリを作成する。

## 2. 機能要件

- 薬を登録できる。
- 登録した薬を削除できる。
- 登録した薬を編集できる。
- 登録した薬の1日(アプリ起動日)に服用した回数を記録できる。
    - 1日の服用回数の上限に達した場合は画面で分かるように表現できる。

## 3. 詳細仕様

### 3.1 薬の登録

- 薬名、服用期間、服用回数、服用量を入力することができる。
- 服用期間は、飲み始める日から飲み終える日までを設定できる。
- 服用回数は、1日に飲むタイミングが何回あるかを設定できる。
- 服用量は、1回に飲む何錠(錠剤の場合)飲むかを設定できる。

### 3.2 薬の削除

- 登録した薬を削除することができる。

### 3.3 薬の編集

- 登録した薬の情報(薬名、服用期間、服用回数、服用量)を編集することができる。

### 3.5 服用回数の登録

- 指定した薬の1日に飲んだ回数を記録することができる。
    - 服用した回数の保存はアプリ起動日のみでも構わない。
    - アプリ起動中に日付が変わった場合の考慮も不要で構わない。
- 1日の服用回数の上限に至った場合はそれが分かるように画面で表現することができる。

## 4. 非機能要件

- データは、スマートフォン内に保存される。
- アプリは、スマートフォンで動作する。
- アプリは、flutterで作成する

## 5. 必須ではない機能要件

- 服用タイミングを設定(毎食後、食間、就寝前等)できる。
- アプリ起動日以前の服用記録を閲覧できる。
- 薬の種類(錠剤、粉末、塗り薬など)を設定できる。

## 6. 開発規模について

- 余暇を使って1週間程度の開発規模になると考えます。

## 7. 確認したい箇所ついて

- デザインや機能的な優位性よりも、拡張性や発展性など作りやすさ、コードの見やすさなどを  
  意識した作りになっているかを確認させて頂きます。
  アプリとして完成させるよりも、ご自身のこだわりが伝わってくるような成果物を期待しております。