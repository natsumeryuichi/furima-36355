# README

# usersテーブル　　

|        column      |   type   |         option          |
|--------------------|----------|------------------------ |
| email              |  string  | null:false unique:true  |
| encrypted_password |  string  | null:false              |
| nickname           |  string  | null:false              |
| first_name         |  string  | null:false              |
| last_name          |  string  | null:false              |
| first_name_kana    |  string  | null:false              |
| last_name_kana     |  string  | null:false              |
| birth_day          |   date   | null:false              |

## Association
-has_many :items  
-has_many :purchase_managements  

# itemsテーブル "商品出品機能"

|          column         |     type     |            option            |
|-------------------------|--------------|------------------------------|
| user                    |  references  | null:false foreign_key: true |
| title                   |    string    | null:false                   |
| explanation             |     text     | null:false                   |
| category_id             |    integer   | null:false                   |
| condition_id            |    integer   | null:false                   |
| shipping_charge_id      |    integer   | null:false                   |
| prefecture_id           |    integer   | null:false                   |
| shipping_day_id         |    integer   | null:false                   |
| price                   |    integer   | null:false                   |

## Association
-belongs_to :user  
-has_one :purchase_management  

#　ordersテーブル "配送先"

|          column         |     type     |            option            |
|-------------------------|--------------|------------------------------|
| postal_code             |    string    | null:false                   |
| prefecture_id           |    integer  | null:false                   |
| city                    |    string    | null:false                   |
| address                 |    string    | null:false                   |
| building_name           |    string    |                              |
| phone_number            |    string    | null:false                   |
| purchase_management     |  references  | null:false foreign_key: true |


## Association  
-belongs_to :purchase_management  

# purchase_managementsテーブル "購入管理機能"

|          column         |     type     |            option            |
|-------------------------|--------------|------------------------------|
| user                    |  references  | null:false foreign_key: true |
| item                    |  references  | null:false foreign_key: true |

## Association  
-belongs_to :user 
-belongs_to :item  
-has_one :order




