# ubuntu-setup-script
研究室の Ubuntu PC セットアップ用スクリプト
スクリプトはセキュリティー上の理由から暗号化されています。

## 開発環境の構築
1. 依存するソフトウェアをインストールします

```
bundle
```

## スクリプトの編集
スクリプトを変更するには、暗号化されたスクリプトをデコードする必要があります。
デコードされたスクリプトはリポジトリの直下に生成されます。

```bash
bundle exec bcl-install-decode
# ./docs/ubuntu-setup-script.sh.enc が復号されて、 ./ubuntu-setup-script.sh が作成
```

## スクリプトを暗号化
スクリプトをデプロイするには暗号化する必要があります。
暗号化は以下のように行います。

```bash
bundle exec bcl-install-encode
```

## 設定の追加

```bash
https_proxy=http://proxy.cc.yamaguchi-u.ac.jp:8080 wget -q https://bcl-group.github.io/ubuntu-setup-script/setup.sh -O- | PASSWD=Gr********* bash
```

