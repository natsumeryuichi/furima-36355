# README

#usersテーブル

|        column      |   type   |         option          |
|--------------------|----------|------------------------ |
| email              |  string  | null:false unique:true  |
| encrypted_password |  string  | null:false              |
| nickname           |  string  | null:false              |
| first_name         |  string  | null:false              |
| last_name          |  string  | null:false              |
| first_name_kana    |  string  | null:false              |
| last_name_kana     |  string  | null:false              |
| birth_day           |   date   | null:false              |

##Association
-has_many :items
-has_many :orders
-has_many :comments

#itemsテーブル

|          column         |     type     |            option            |
|-------------------------|--------------|------------------------------|
| user                    |  references  | null:false foreign_key: true |
| title                   |    string    | null:false                   |
| category                |    string    | null:false                   |
| condition               |    string    | null:false                   |
| shipping_charge         |    string    | null:false                   |
| shipping_from           |    string    | null:false                   |
| shipping_days           |     date     | null:false                   |
| price                   |    integer   | null:false                   |

##Association
-belongs_to :user
-has_one :order
-has_many :comments
-has_one_attached :image

#ordersテーブル

|          column         |     type     |            option            |
|-------------------------|--------------|------------------------------|
| user                    |  references  | null:false foreign_key: true |
| item                    |  references  | null:false foreign_key: tru  |
| postal_code             |    integer   | null:false                   |
| prefecture              |    string    | null:false                   |
| city                    |    string    | null:false                   |
| address                 |    string    | null:false                   |
| building_name           |    string    |                              |
| phone_number            |    integer   | null:false                   |

##Association
-belongs_to :user
-belongs_to :items

#commentsテーブル

|          column         |     type     |            option            |
|-------------------------|--------------|------------------------------|
| user                    |  references  | null:false foreign_key: true |
| item                    |  references  | null:false foreign_key: tru  |
| comments                |    text      | null:false                   |

##Association
-belongs_to :user
-belongs_to :items

#imagesテーブル

|          column         |     type     |            option            |
|-------------------------|--------------|------------------------------|
| image                   |  string      | null:false                   |
| item                    |  references  | null:false foreign_key: tru  |

##Association
-belongs_to :items


