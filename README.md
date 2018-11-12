# ark-server-docker
ARKのサーバー立て方2度と忘れないようにDocker化しました。

## 使用例
`tools/run-container.sh`参照

## 制限事項（TODO）
- データ永続化のためにはDockerのVolumeをマウントしないとダメ（ディレクトリとかをマウントしても権限で動かない）
  - データボリュームをエクスポートするワンライナーを後で追加しておく
- `my-settings`ブランチを見るとModとか使えてるけどUpdate確認とかの効率が悪い
  - そのうち純粋に`arkmanager`のDockerとした方が汎用性が高そう
