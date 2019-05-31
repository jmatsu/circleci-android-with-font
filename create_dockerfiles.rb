#!/usr/bin/env ruby

require 'erb'
require 'fileutils'

MIN_SDK=27
MAX_SDK=29
DOCKERFILE_DIR='build'

def for_each_dockerfile(&b)
  (MIN_SDK..MAX_SDK).each do |api_version|
    name = "#{DOCKERFILE_DIR}/Dockerfile.#{api_version}"
    b.call(api_version, name)
  end
end

def system!(*cmds)
  system(*cmds.map(&:to_s)) || abort("#{cmds} failed")
end

FileUtils.mkdir_p(DOCKERFILE_DIR)
template = File.read("Dockerfile.erb")

for_each_dockerfile do |api_version, name|
  File.open(name, 'w') do |f|
    f.write(ERB.new(template).result(binding))
  end
end

for_each_dockerfile do |api_version, name|
  container="jmatsu/android:api-#{api_version}"
  puts "#{container} will be built"
  system!('docker', 'build', '-t', container, '-f', name, '.')
  system!('docker', 'push', container)
end