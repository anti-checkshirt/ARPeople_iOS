# クローン

```bash
$ git clone https://github.com/anti-checkshirt/ARPeople_iOS.git
```

# インストール

アプリで使用するライブラリは`Carthage`と`CocoaPods`で管理しています。

これらをインストールしていない場合は以下に沿ってインストールしてください。

- Carthageのインストール

```bash
$ brew install carthage
```

- CocoaPodsのインストール

```bash
$ brew install cocoapods
$ pod setup
```

`Carthage`と`CocoaPods`のインストールが完了したら、プロジェクトのルートディレクトリに移動して以下を実行してください。

```bash
$ carthage bootstrap --platform iOS
$ pod install
```

以上が終わると`ARPeople_iOS.xcworkspace`ファイルが生成されるので、**`ARPeople_iOS.xcodeproj`ではなく`ARPeople_iOS.xcworkspace`を**開いてビルドしてください。



# ENV

envファイルに記述する文言は@tomoki69386に聞いてください

