include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "rbenv::rbenv_vars"

def setup
  install_ruby

  install_gems
end

def install_ruby
  rbenv_ruby node[:rbenv][:ruby_version] do
    global true
  end
end

def install_gems
  rbenv_gem "bundler" do
    ruby_version node[:rbenv][:ruby_version]
  end
end

setup
