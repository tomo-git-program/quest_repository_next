**ステップ１**

**テーブル: channels**

| カラム名     | データ型      | NULL | キー         | 初期値           | AUTO INCREMENT |
| ------------ | ------------- | ---- | ------------ | ---------------- | -------------- |
| channel_id   | INT           | NO   | PRIMARY KEY  |                  | YES            |
| channel_name | VARCHAR(100)  | NO   |              |                  |                |

**テーブル: programs**

| カラム名          | データ型      | NULL | キー         | 初期値           | AUTO INCREMENT |
| ----------------- | ------------- | ---- | ------------ | ---------------- | -------------- |
| program_id        | INT           | NO   | PRIMARY KEY  |                  | YES            |
| program_title     | VARCHAR(100)  | NO   |              |                  |                |
| program_description | VARCHAR(255) | YES  |              |                  |                |
| genre             | VARCHAR(50)   | NO   |              |                  |                |

**テーブル: seasons**

| カラム名         | データ型      | NULL | キー         | 初期値           | AUTO INCREMENT |
| ---------------- | ------------- | ---- | ------------ | ---------------- | -------------- |
| season_id        | INT           | NO   | PRIMARY KEY  |                  | YES            |
| program_id       | INT           | NO   | FOREIGN KEY  |                  |                |
| season_number    | INT           | NO   |              |                  |                |

**テーブル: episodes**

| カラム名           | データ型      | NULL | キー         | 初期値           | AUTO INCREMENT |
| ------------------ | ------------- | ---- | ------------ | ---------------- | -------------- |
| episode_id         | INT           | NO   | PRIMARY KEY  |                  | YES            |
| season_id          | INT           | NO   | FOREIGN KEY  |                  |                |
| episode_number     | INT           | YES  |              |                  |                |
| episode_title      | VARCHAR(100)  | NO   |              |                  |                |
| episode_description | VARCHAR(255) | YES  |              |                  |                |
| video_duration     | TIME          | NO   |              |                  |                |
| release_date       | DATE          | NO   |              |                  |                |
| views_count        | INT           | NO   |              |                  |                |

**テーブル: program_genres**

| カラム名           | データ型      | NULL | キー         | 初期値           | AUTO INCREMENT |
| ------------------ | ------------- | ---- | ------------ | ---------------- | -------------- |
| genre_id           | INT           | NO   | PRIMARY KEY  |                  | YES            |
| program_id         | INT           | NO   | FOREIGN KEY  |                  |                |
| genre              | VARCHAR(50)   | NO   |              |                  |                |

**テーブル: channel_programs**

| カラム名                  | データ型      | NULL | キー         | 初期値           | AUTO INCREMENT |
| ------------------------- | ------------- | ---- | ------------ | ---------------- | -------------- |
| channel_program_id        | INT           | NO   | PRIMARY KEY  |                  | YES            |
| channel_id                | INT           | NO   | FOREIGN KEY  |                  |                |
| program_id                | INT           | NO   | FOREIGN KEY  |                  |                |
| time_slot                 | DATETIME      | NO   |              |                  |                |

**テーブル: episode_views**

| カラム名              | データ型      | NULL | キー         | 初期値           | AUTO INCREMENT |
| --------------------- | ------------- | ---- | ------------ | ---------------- | -------------- |
| episode_view_id       | INT           | NO   | PRIMARY KEY  |                  | YES            |
| episode_id            | INT           | NO   | FOREIGN KEY  |                  |                |
| channel_program_id    | INT           | NO   | FOREIGN KEY  |                  |                |
| views_count           | INT           | NO   |              |                  |                |


**ステップ2**
以下は、データベースの構築およびテーブルの作成、サンプルデータの挿入の手順ドキュメントです。

# MySQL起動＆ログイン手順

1. MySQL クライアントを開き以下のコマンドを入力してください。

```sql
mysql -u root -p
```
そうすると以下の様にパスワード入力を求められますので入力をお願いします。
```sql
Enter password:
```

# データベース作成＆データベース移動手順

2. 新しいデータベースを作成します。以下のコマンドを実行します。

   ```sql
   CREATE DATABASE internet_tv;
   ```

   

3. 作成したデータベースに移動します。

   ```sql
   USE internet_tv;
   ```

## テーブル作成手順

1. `channels` テーブルを作成します。以下のコマンドを実行します。

   ```sql
   CREATE TABLE channels (
     channel_id INT PRIMARY KEY AUTO_INCREMENT,
     channel_name VARCHAR(100) NOT NULL
   );
   ```

2. `programs` テーブルを作成します。以下のコマンドを実行します。

   ```sql
   CREATE TABLE programs (
     program_id INT PRIMARY KEY AUTO_INCREMENT,
     program_title VARCHAR(100) NOT NULL,
     program_description VARCHAR(255),
     genre VARCHAR(50) NOT NULL
   );
   ```

3. `seasons` テーブルを作成します。以下のコマンドを実行します。

   ```sql
   CREATE TABLE seasons (
     season_id INT PRIMARY KEY AUTO_INCREMENT,
     program_id INT NOT NULL,
     season_number INT NOT NULL,
     FOREIGN KEY (program_id) REFERENCES programs (program_id)
   );
   ```

4. `episodes` テーブルを作成します。以下のコマンドを実行します。

   ```sql
   CREATE TABLE episodes (
     episode_id INT PRIMARY KEY AUTO_INCREMENT,
     season_id INT NOT NULL,
     episode_number INT,
     episode_title VARCHAR(100) NOT NULL,
     episode_description VARCHAR(255),
     video_duration TIME NOT NULL,
     release_date DATE NOT NULL,
     views_count INT NOT NULL,
     FOREIGN KEY (season_id) REFERENCES seasons (season_id)
   );
   ```

5. `program_genres` テーブルを作成します。以下のコマンドを実行します。

   ```sql
   CREATE TABLE program_genres (
     genre_id INT PRIMARY KEY AUTO_INCREMENT,
     program_id INT NOT NULL,
     genre VARCHAR(50) NOT NULL,
     FOREIGN KEY (program_id) REFERENCES programs (program_id)
   );
   ```

6. `channel_programs` テーブルを作成します。以下のコマンドを実行します。

   ```sql
   CREATE TABLE channel_programs (
     channel_program_id INT PRIMARY KEY AUTO_INCREMENT,
     channel_id INT NOT NULL,
     program_id INT NOT NULL,
     time_slot DATETIME NOT NULL,
     FOREIGN KEY (channel_id) REFERENCES channels (channel_id),
     FOREIGN KEY (program_id) REFERENCES programs (program_id)
   );
   ```

7. `episode_views` テーブルを作成します。以下のコマンドを実行します。
 ```sql
CREATE TABLE episode_views (
  episode_view_id INT PRIMARY KEY AUTO_INCREMENT,
  episode_id INT NOT NULL,
  channel_program_id INT NOT NULL,
  views_count INT NOT NULL,
  FOREIGN KEY (episode_id) REFERENCES episodes (episode_id),
  FOREIGN KEY (channel_program_id) REFERENCES channel_programs (channel_program_id)
);
```


# データ挿入手順

1. `channels` テーブルにサンプルデータを挿入します。以下のコマンドを実行します。

   ```sql
   INSERT INTO channels (channel_name) VALUES
     ('ドラマ1'),
     ('ドラマ2'),
     ('アニメ1'),
     ('アニメ2'),
     ('スポーツ'),
     ('ペット');
   ```

2. `programs` テーブルにサンプルデータを挿入します。以下のコマンドを実行します。

   ```sql
   INSERT INTO programs (program_title, program_description, genre) VALUES
     ('ドラマA', 'ドラマAの説明', 'ドラマ'),
     ('ドラマB', 'ドラマBの説明', 'ドラマ'),
     ('アニメX', 'アニメXの説明', 'アニメ'),
     ('アニメY', 'アニメYの説明', 'アニメ'),
     ('スポーツ番組A', 'スポーツ番組Aの説明', 'スポーツ'),
     ('ペット番組A', 'ペット番組Aの説明', 'ペット');
   ```

3. `seasons` テーブルにサンプルデータを挿入します。以下のコマンドを実行します。

   ```sql
   INSERT INTO seasons (program_id, season_number) VALUES
     (1, 1),
     (1, 2),
     (3, 1),
     (4, 1);
   ```

4. `episodes` テーブルにサンプルデータを挿入します。以下のコマンドを実行します。

   ```sql
   INSERT INTO episodes (season_id, episode_number, episode_title, episode_description, video_duration, release_date, views_count) VALUES
     (1, 1, 'ドラマA - エピソード1', 'ドラマAのエピソード1の説明', '00:30:00', '2022-01-01', 100),
     (1, 2, 'ドラマA - エピソード2', 'ドラマAのエピソード2の説明', '00:30:00', '2022-01-08', 150),
     (2, 1, 'ドラマB - エピソード1', 'ドラマBのエピソード1の説明', '00:30:00', '2022-02-01', 120),
     (3, NULL, 'アニメX - エピソード1', 'アニメXのエピソード1の説明', '00:20:00', '2022-03-01', 200);


5. `program_genres` テーブルにサンプルデータを挿入します。以下のコマンドを実行します。
```sql
INSERT INTO program_genres (program_id, genre)
VALUES
  (1, 'Action'),
  (1, 'Adventure'),
  (2, 'Comedy'),
  (3, 'Drama'),
  (4, 'Science Fiction');
```

6. `channel_programs` テーブルにサンプルデータを挿入します。以下のコマンドを実行します。

```sql
INSERT INTO channel_programs (channel_id, program_id, time_slot)
VALUES
  (1, 1, '2023-05-15 09:00:00'),
  (1, 2, '2023-05-15 12:30:00'),
  (2, 3, '2023-05-15 15:45:00'),
  (2, 4, '2023-05-15 19:00:00');
```
7. `episode_views` テーブルにサンプルデータを挿入します。以下のコマンドを実行します。

```sql
INSERT INTO episode_views (episode_id, channel_program_id, views_count)
VALUES
  (1, 1, 500),
  (2, 1, 750),
  (3, 2, 350),
  (4, 2, 900);
```


# データ取得手順

1. エピソード視聴数トップ3のエピソードタイトルと視聴数を取得するクエリ:

```sql
SELECT episode_title, views_count
FROM episodes
ORDER BY views_count DESC
LIMIT 3;
```

2. エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得するクエリ:

```sql
SELECT p.program_title, s.season_number, e.episode_number, e.episode_title, e.views_count
FROM episodes e
JOIN seasons s ON e.season_id = s.season_id
JOIN programs p ON s.program_id = p.program_id
ORDER BY e.views_count DESC
LIMIT 3;
```

3. 本日放送される番組のチャンネル名、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得するクエリ:

```sql
SELECT c.channel_name, cp.time_slot AS start_time, ADDTIME(cp.time_slot, e.video_duration) AS end_time, s.season_number, e.episode_number, e.episode_title, e.episode_description
FROM episodes e
JOIN seasons s ON e.season_id = s.season_id
JOIN channel_programs cp ON e.season_id = cp.program_id
JOIN channels c ON cp.channel_id = c.channel_id
WHERE DATE(cp.time_slot) = CURDATE()
ORDER BY cp.time_slot;
```

4. ドラマチャンネルの番組表を本日から一週間分取得するためのクエリ:

```sql
SELECT DATE(cp.time_slot) AS broadcast_date, TIME(cp.time_slot) AS start_time, ADDTIME(cp.time_slot, e.video_duration) AS end_time, s.season_number, e.episode_number, e.episode_title, e.episode_description
FROM episodes e
JOIN seasons s ON e.season_id = s.season_id
JOIN channel_programs cp ON e.season_id = cp.program_id
JOIN channels c ON cp.channel_id = c.channel_id
WHERE c.channel_name = 'ドラマ1' 
  AND DATE(cp.time_slot) BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
ORDER BY cp.time_slot;
```
