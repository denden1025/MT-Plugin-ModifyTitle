# MT Plugin ModifyTitle Readme
### update：2017/3/20
---
## 概要（Overview）
ブログ記事の投稿時または更新時、タイトルに自動で記事生成日を付加するプラグインです。

This plugin add creation date into the entry title automatically when the entry is created or updated.   

## 動作確認済み環境（Used environment for validation）
Fedora18 , Apache/2.4.4 (Fedora) , mod_proxy  , MovableType5.2.2（PSGI）  
Windows10 Home 64bit , Apache/2.4.23 (Win64)  , MovableType6.3.2

## 対応言語（Language）
日本語（Japanese)・英語（English）

## プラグインタイプ（Plugin Type）
コールバック（Call Back）

## プラグイン設定（Setting）
プラグイン設定はブログレベルのみです。システムレベル設定はありません。   
You can define only blog level setting.There aren't system level setting.

- 有効化（Enable）   
チェックするとプラグインが有効になります。   
This term which has been set checked: on enable us to use the plugin.  

- カテゴリーID（CatID）  
対象となる記事が所属するカテゴリーID番号  
記事がここで指定したカテゴリーに属する時のみ投稿日を付加する。   
The plugin compare category-ID of entry and this term. If category-ID of entry correspond to this term , the plugin add creation date into the title automatically before it is rebuit.

## フォーマット （Added Title Format）
(Title sentence) yyyy-m[m]-d[d]   

## コピーライト（Copyright）
Copyright (C) 2017 Tsutomu Igarashi (www.webkoza.com) All Rights Reserved.  

## 許諾（License）
MIT License
