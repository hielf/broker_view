Factory.define :user do |user|
  user.name                       "Moumou"
  user.email                      "mou_test@mail.com"
  user.password                   "passpass"
  user.password_confirmation      "passpass"
end

Factory.sequence :email do |n|
  "person-#{n}@mail.com"
end

Factory.sequence :name do |n|
  "Person #{n}"
end

Factory.define :branch do |branch|
  branch.code       "0000"
  branch.name       "user_branch"
end