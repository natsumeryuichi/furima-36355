class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角ひらがな、全角カタカナ、漢字で入力して下さい" }
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角ひらがな、全角カタカナ、漢字で入力して下さい" }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい" }
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい" }
         validates :birth_day, presence: true
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英数で入力して下さい" }

         has_many :items
         has_many :purchase_managements
         has_many :comments
         has_many :relationships
         has_many :followings, through: :relationships, source: :follow
         has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
         has_many :followers, through: :reverse_of_relationships, source: :user
       
         def follow(other_user)
           unless self == other_user
             self.relationships.find_or_create_by(follower_id: other_user.id, folloewd_id: user_id)
           end
         end
       
         def unfollow(other_user)
           relationship = self.relationships.find_by(followed_id: user.id)
           relationship.destroy if relationship
         end
       
         def following?(other_user)
           self.followings.include?(other_user)
         end
end
