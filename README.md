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
-has_one :order  
-has_many :purchase_managements  

# itemsテーブル "商品出品機能"

|          column         |     type     |            option            |
|-------------------------|--------------|------------------------------|
| user                    |  references  | null:false foreign_key: true |
| title                   |    string    | null:false                   |
| category                |    string    | null:false                   |
| condition               |    string    | null:false                   |
| shipping_charge         |    string    | null:false                   |
| prefectures             |   integer    | null:false foreign_key: true |
| shipping_days           |     date     | null:false                   |
| price                   |    integer   | null:false                   |

## Association
-belongs_to :user  
-has_one :purchase_management  
-belongs_to_active_hash :prefectures
<!-- -has_many :comments   -->

#　ordersテーブル "商品購入機能"

|          column         |     type     |            option            |
|-------------------------|--------------|------------------------------|
| postal_code             |   integer    | null:false                   |
| prefectures             |   integer    | null:false foreign_key: true |
| city                    |    string    | null:false                   |
| address                 |    string    | null:false                   |
| building_name           |    string    |                              |
| phone_number            |   integer    | null:false                   |
| purchase_management     |   integer    | null:false foreign_key: true |


## Association  
-has_one_active_hash :prefectures  
-has_one :purchase_management  
<!-- -belongs_to :item   -->

# purchase_managementsテーブル "購入管理機能"

|          column         |     type     |            option            |
|-------------------------|--------------|------------------------------|
| user                    |  references  | null:false foreign_key: true |
| item                    |  references  | null:false foreign_key: true |
| order                   |  references  | null:false foreign_key: true |

## Association  
-belongs_to :user 
-belongs_to :item  
-belongs_to :order


<!-- ## Association
-belongs_to :user  
-belongs_to :items   -->



