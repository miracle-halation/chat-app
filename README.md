# テーブル設計

## users テーブル

| Column		| Type		| Options			|
| ---------	| ------	| -----------	|
| name			|	string	|	null: false	|
|	email			|	string	|	null: false	|
| password	|	string	|	null: false	|

### Association
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column		| Type		| Options			|
| ---------	| ------	| -----------	|
| name			|	string	|	null: false	|

### Association
- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column		| Type		| Options													|
| --------	| ------	| ------------------------------	|
| user_id		|	integer	|	null: false, foreign_key: true	|
|	room_id		|	integer	|	null: false, foreign_key: true	|

### Association
- belongs_to :users
- belongs_to :rooms

## messages テーブル

| Column		| Type		| Options													|
| ---------	| ------	| ------------------------------	|
| content		|	string	|	null: false											|
| user_id		|	integer	|	null: false, foreign_key: true	|
|	room_id		|	integer	|	null: false, foreign_key: true	|

### Association
- belongs_to :users
- belongs_to :rooms
