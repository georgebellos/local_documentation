require 'fileutils'

desc 'update documentation'
task default: [:update_submodules, :update_rails_docs, :update_rails_guides,
               :update_ruby_core_docs, :update_ruby_stdlib_docs, :update_ri_docs] do
  puts 'updated local documention'
end

desc 'Update submodules'
task :update_submodules do
  puts 'updating submodules'
  sh "git submodule foreach git pull"
end

desc 'update ruby ri documentation'
task :update_ri_docs do
  puts 'generating ruby ri documentation'
  sh "rvm all do rvm docs generate-ri"
end

desc 'update rails documentation'
task :update_rails_docs do
  puts 'generating rails documentation'
  sh "cd rails && yardoc rails -n"
end

desc 'update rails guides'
task :update_rails_guides do
  puts 'generating rails guides'
  sh 'cd rails && bundle update'
  sh 'cd rails/guides && rake guides:generate'
end

desc 'update ruby core documentation'
task :update_ruby_core_docs do
  puts 'generating ruby core documentation'
  sh "cd ruby && yardoc *.c -n"
end

desc 'update ruby stdlib documentation'
task :update_ruby_stdlib_docs do
  puts 'generating ruby stdlib documentation'
  sh "cd ruby && yardoc -b .yardoc-stdlib -o doc-stdlib -n"
end
