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

Factory.define :department do |department|
  department.id         1
  department.code       "0000"
  department.name       "user_department"
end

Factory.define :branch do |branch|
  branch.id                  1
  branch.code                "0001"
  branch.name                "user_branch"
  branch.department_id       1
end