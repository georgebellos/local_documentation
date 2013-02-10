## Local documentation for ruby, ruby gems and rails via yard

Clone this repo with the included submodules

    git clone --recursive https://github.com/georgebellos/local_documentation.git

Generate yardoc for rails, ruby, ruby stdlib.

    rake update_rails_docs
    rake update_ruby_core_docs
    rake update_ruby_stdlib_docs

You can generate the rails guides if you want.

    rake update_rails_guides

Start rack app to serve documentation.

    rackup  config.ru

I recommend using [Pow](http://pow.cx) for this task.

Bonus

If you use [rvm](http://rvm.io) you can update ri documentation for all rubies you have
installed.

    rake update_ri_docs

Any time you want to update all the documentation you just need to update the included
submodules(ruby, rails source) `rake update_submodules` and generate again the yardocs, or simply
run `rake`
