Factory.define :user do |f|
  f.email "test@y.com"
  f.password "uuuuuu"
end

  def login(user)
    user.email
    user.password
    user.admin = true
  end