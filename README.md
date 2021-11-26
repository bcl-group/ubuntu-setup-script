# ubuntu-setup-script
研究室の Ubuntu PC セットアップ用スクリプト
スクリプトはセキュリティー上の理由から暗号化されています。

## スクリプトの編集
スクリプトを変更するには、暗号化されたスクリプトをデコードする必要があります。

```bash
cd <リポジトリー>
bcl-install-decode
# ./docs/ubuntu-setup-script.sh.enc が復号されて、 ./ubuntu-setup-script.sh が作成
```

## スクリプトを暗号化
```bash
cd <リポジトリー>
bcl-install-encode
```
