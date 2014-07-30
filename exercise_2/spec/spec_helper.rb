require 'rspec/its'
require 'simplecov'
SimpleCov.start

Dir.glob("./app/**/*.rb").each { |f| require f }

def create_orgs
  #create root org
  root = Organization.new

  #create orgs
  orgs = (1..3).map{ root.add_child }

  #create child orgs
  orgs.each do |org|
    (1..3).each{ org.add_child }
  end

  return root
end
