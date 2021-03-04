# omelet

メモ帳を作ろうプロジェクト

## 始め方 (windows)

### 環境

```bash
$ flutter --version
Flutter 2.0.0 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 60bd88df91 (22 hours ago) • 2021-03-03 09:13:17 -0800
Engine • revision 40441def69
Tools • Dart 2.12.0
```

- Gitのinstall

- Flutterのinstall

  - [このリンク](https://flutter.dev/docs/get-started/install/windows)からダウンロード
  - 任意のフォルダに解凍
    - 例えば、`c:\env`にフォルダを作成しその中で解凍する
    - `c:\env\flutter\...`となる
  - 環境変数`path`に追加する
    - 例の場合なら`c:\env\flutter\bin`
  - コマンド`flutter doctor --android-licenses`が実行できればOK

- Android Studioのインストール (Debug用のエミューレータ)
  - [このリンク](https://developer.android.com/studio?hl=ja)からダウンロード

- Gitからclone

```bash
$ git clone https://github.com/u9uru/omelet.git
$ cd omelet
$ flutter pub get
```
