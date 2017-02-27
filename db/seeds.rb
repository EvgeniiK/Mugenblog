# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(
  ruby
  rails
  postgres
  db
  css
  js
  gem
  ubuntu
  linux
  HTTP
  HTML
).each { |tag| Tag.where(name: tag).first_or_create }

unless Rails.env.production?

  u = User.where(username: 'test_user',
                           lastname: 'userovich',
                           email: 'test@test.test').first_or_create( password: 'test' )
  Hint.where(command: 'sudo test run',
                       description: 'some intersection description')
    .first_or_create(
                     user: u,
                     link: '',
                     tags: [Tag.last]
                     )
  a = Article.where(title: 'Some very interesting Article',
                              content: %Q(<div>I need to get all the profile properties from web.config file<br><br></div><pre><strong>&lt;profile</strong> <strong>defaultProvider</strong>=\"AspNetSqlProfileProvider\" <strong>automaticSaveEnabled</strong>=\"false\" <strong>enabled</strong>=\"true\"<strong>&gt;</strong>\r\n<strong>&lt;providers&gt;</strong>\r\n    <strong>&lt;clear/&gt;</strong>\r\n    <strong>&lt;add</strong> <strong>name</strong>=\"AspNetSqlProfileProvider\" <strong>type</strong>=\"System.Web.Profile.SqlProfileProvider, System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a\" <strong>connectionStringName</strong>=\"ApplicationServices\" <strong>applicationName</strong>=\"/\" <strong>/&gt;</strong>\r\n<strong>&lt;/providers&gt;</strong>\r\n<strong>&lt;properties&gt;</strong>\r\n    <strong>&lt;add</strong> <strong>name</strong>=\"FirstName\" <strong>type</strong>=\"string\" <strong>/&gt;</strong>\r\n    <strong>&lt;add</strong> <strong>name</strong>=\"LastName\" <strong>type</strong>=\"string\" <strong>/&gt;</strong>\r\n    <strong>&lt;add</strong> <strong>name</strong>=\"Company\" <strong>type</strong>=\"string\" <strong>/&gt;</strong>\r\n<strong>&lt;/properties&gt;</strong></pre><div><br><br></div><div>I want to get the array with values ['FirstName','LastName','Company']<br><br></div>))
    .first_or_create( user: u, tags: [Tag.last] )

end
