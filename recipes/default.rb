#
# Cookbook Name:: df_spark
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.



log "\n\nINITIATING SPARK RUN FROM DOWNLOAD #{node['df_spark']['source']}\n\n" do 
    level :info
end

template '/home/vagrant/README_SPARK.txt' do 
  source 'README_SPARK.txt.erb'
  mode "0644"
  only_if { ::File.exists?('/home/vagrant') }
end

template '/home/vagrant/chef_spark_attribute_values.txt' do 
  source 'attribute_values.txt.erb'
  mode "0644"
  only_if { ::File.exists?('/home/vagrant') }
end

template '/home/vagrant/compileSpark.sh' do 
  source 'compileSpark.sh.erb'
  mode "0777"
  only_if { ::File.exists?('/home/vagrant') }
end

template '/home/vagrant/moveSparkToUsrLocal.sh' do 
  source 'moveSparkToUsrLocal.sh.erb'
  mode "0777"
  only_if { ::File.exists?('/home/vagrant') }
end

directory node['df_spark']['local_dir'] do 
    mode "0755"
    recursive true
    action :create 
end

remote_file node['df_spark']['remote_file'] do 
    source node['df_spark']['source']
    mode "0755" 
    action :create_if_missing
end

execute "unzip_file" do 
    cwd node['df_spark']['local_dir']
    command "tar -xzvf " + node['df_spark']['tar_name']
    action :run
end
