# JavaScript について説明できる

## 1. JavaScript とは

JavaScript とは何か、HTML/CSS とはどのような関係にあるのか、プログラミング初心者にわかるように説明してください。

1. JavaScriptとはウェブページやウェブアプリケーションを作るための言語。JavaScriptは動的なコンテンツの作成(ユーザーによってwebページのコンテンツを変える事ができる)
ユーザーとのインタラクション（ユーザーがなんらかのアクションを行なったとき、システムがそれに応じた反応を返すこと）、データの検証などができる。
またECMAScriptという標準仕様に基づいており
Webブラウザやサーバーサイドのランタイム環境（プログラムが実行されるために必要なソフトウェアおよびハードウェアの環境のこと）で実行することができます。

## 2. ECMAScript とは

ECMAScript とは何か、プログラミング初心者にわかるように説明してください。

なお、学習する際には ECMAScript 2015（ES2015）以降のバージョンを学習してください。}

JavaScriptの中に入っている
元々JavaScriptは各ベンダーが独自にそれぞれの路線で機能を作っていたため
ブラウザ間で互換性がなかったので
互換性のあるJavaScriptを作ろうということで
「どの実行環境でも共通の動きをする動作が定義されている」
ECMAScriptがコアとしてJavaScriptに入ることでそれぞれのブラウザ間で互換性が生まれた
1つのソースコードでお互いのブラウザが動作できるようになった

## 3. 環境構築

JavaScript のコードを実行できるように環境を構築してください。

JavaScript の実行方法はいくつかあります。

1. ブラウザの開発者ツールのコンソールで実行する
2. ファイルを作成し、ブラウザで開く
3. Node.js をインストールし、コマンドラインで実行する

そのうち、本学習においては2を推奨します。1はちょっとした処理を実行するには便利ですが、書いたコードが手元に残らないため、復習しづらくなります。3は、Node.js のインストールが必要になるため、環境構築が面倒になります。2が一番手軽で、コードも手元に残り復習しやすいです。

以下、2の方法で環境構築を行います。

まず、任意のディレクトリに `hello.html` というファイルを作成してください。ファイル名は何でも構いません。学習トピックごとにファイルをわけ、トピックに関する名前をつけると復習しやすくなります。

```html
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>JavaScript学習</title>
</head>

<body>
  <script src="hello.js"></script>
</body>

</html>
```

次に、`hello.js` というファイルを作成してください。ファイル名は何でも構いません。

```js
console.log('Hello World');
```

最後に、`hello.html` をブラウザで開いてください。ブラウザの開発者ツールのコンソールに `Hello World` と表示されれば成功です。

なお、Visual Studio Code を使用されている場合は、[Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) という拡張機能をインストールすると、ファイルを保存すると自動的にブラウザが更新されるため、便利です。