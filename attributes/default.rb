#deconstructing the download from it's component parts
#http://docs.datafundamentals.com/lib/spark-1.4.1.tgz
default['df_spark']['version'] = "1.4.1"
default['df_spark']['web_lib_source'] = "http://docs.datafundamentals.com/lib/"
default['df_spark']['name'] = "spark-" + node['df_spark']['version']
default['df_spark']['tar_name'] = node['df_spark']['name'] + ".tgz"
default['df_spark']['source'] = node['df_spark']['web_lib_source'] + node['df_spark']['tar_name']  
default['df_spark']['local_dir'] = "/usr/local/spark/"
default['df_spark']['remote_file'] = node['df_spark']['local_dir']  + node['df_spark']['tar_name']   

