apt_update 'daily' do
  frequency 86_400
  action :periodic
end

include_recipe 'lamp::web'
include_recipe 'lamp::database'

directory 'webapp' do
  path   '/var/tomcat8/webapps'
  recursive true
end

remote_file 'sample.war' do
  source 'http://192.168.1.138/sample.war'
  path   '/var/tomcat8/webapps/sample.war'
  action :create
end
