class UserViewingParty < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_party

  #validations of user id, viewing party id, role..?
end
