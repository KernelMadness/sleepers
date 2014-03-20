#
# Cookbook Name:: sleepers
# Recipe:: default
#
# Copyright (C) 2014 Denis Rizaev
# 
# All rights reserved - Do Not Redistribute

include_recipe "sleepers::packages"
include_recipe "sleepers::tools"
include_recipe "sleepers::ruby"
include_recipe "sleepers::users"

include_recipe "sleepers::app_defaults"
include_recipe "sleepers::bluepill"
include_recipe "sleepers::postgres"
include_recipe "sleepers::config_files"
include_recipe "sleepers::web"
