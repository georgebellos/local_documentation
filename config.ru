#\ -s puma
require 'yard'

libraries = {}
gems = {}
base = ENV['GEM_PATH'].split(':')[1][%r{^.+(?=/.+@global$)}] rescue nil

if base
  Gem.paths = {
    'GEM_PATH' => Dir["#{base}/ruby-*"].join(':'),
    'GEM_HOME' => ENV['GEM_HOME']
  }

  Gem.source_index.find_name('').each do |spec|
    libraries[spec.name] ||= []
    libraries[spec.name] << YARD::Server::LibraryVersion.new(spec.name, spec.version.to_s, nil, :gem)
  end
end

# include ruby core, ruby stdlib and rails documentation
libraries.merge!(
  "-railsdocs" => [YARD::Server::LibraryVersion.new("-railsdocs", nil, "rails/.yardoc")],
  "-rubydocs" => [YARD::Server::LibraryVersion.new("-rubydocs", nil, "ruby/.yardoc")],
  "-rubystdlib" => [YARD::Server::LibraryVersion.new("-rubystdlib", nil, "ruby/.yardoc-stdlib")])

run YARD::Server::RackAdapter.new(libraries)
