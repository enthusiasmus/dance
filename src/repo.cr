module Repo
  extend Crecto::Repo

  config do |conf|
    conf.adapter = Crecto::Adapters::Mysql
    conf.hostname = "localhost"
    conf.database = "dance"
    conf.username = "xxx"
    conf.password = "xxx"
    conf.port = 3306
  end
end
