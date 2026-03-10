class Admin < User
	has_many :events, dependent: :destroy, foreign_key: "admin_id"
end