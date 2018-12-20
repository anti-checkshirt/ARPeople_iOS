# クローン

```bash
$ git clone https://github.com/anti-checkshirt/ARPeople_iOS.git
```

# インストール

ライブラリの管理はCocoaPodsで行います。

CocoaPodsを入れてない場合はインストールしましょう。

入ってる場合は飛ばしてください

- CocoaPodsインストール

```bash
$ sudo gem install cocoapods
$ pod setup
```

- すでにインストールしてる場合はこちらを

```bash
$ pod install
```



# 画像アップロードの手順



- Wi-Fiに鯖を作る
- Swiftの画像アップロード時のURLを変更
- Xcodeをビルド
- 写真を10枚選択する(この時動画を含んでると落ちる)
- これでおそらくRailsとSwift両方にログが出るはず
- Railsは書き換えても問題ないが、iOSは再びテストするとき再度ビルドし直してください



# Branch



Developはハッカソンのデモで使ったBranch

masterはRailsに画像をアップロードするロジックを含んだBranch
