# Linter

[![Gitter](https://img.shields.io/badge/gitter-join%20chat-1dce73.svg?style=flat)](https://gitter.im/AtomLinter/Linter?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Build Status](https://img.shields.io/travis/AtomLinter/Linter.svg?style=flat)](https://travis-ci.org/AtomLinter/Linter)

Lint your code with ease in [Atom](http://atom.io).

![atom-inline-messages](https://raw.githubusercontent.com/AtomLinter/Linter/master/inline-comments.gif)

The idea is to stop the linter plugins war, by providing a top level API for linters to parse and display errors in the Atom editor.

## Available linters
#### for JavaScript
- [linter-jshint](https://atom.io/packages/linter-jshint), for JavaScript and JSON, using `jshint`
- [linter-jscs](https://atom.io/packages/linter-jscs), for JavaScript, using `jscs`
- [linter-jsxhint](https://atom.io/packages/linter-jsxhint), for JSX (React.js), using `jsxhint`
- [linter-eslint](https://atom.io/packages/linter-eslint), for JavaScript, using `eslint`
- [linter-gjslint](https://atom.io/packages/linter-gjslint), for JavaScript, using `gjslint`
- [linter-flow](https://atom.io/packages/linter-flow), for JavaScript, using `flow`

#### for CoffeeScript
- [linter-coffeelint](https://atom.io/packages/linter-coffeelint), for CoffeeScript, using `coffeelint`

#### for Typescript
- [linter-tslint](https://atom.io/packages/linter-tslint), for Typescript, using `tslint`

#### for Dart
- [linter-dartanalyzer](https://atom.io/packages/linter-dartanalyzer), for Dart using `dartanalyzer`

#### for LiveScript
- [linter-lsc](https://atom.io/packages/linter-lsc), for LiveScript, using `lsc -a`

#### for Ruby and Ruby on Rails
- [linter-rubocop](https://atom.io/packages/linter-rubocop), for Ruby and Ruby on Rails, using `rubocop`
- [linter-ruby](https://atom.io/packages/linter-ruby), for Ruby, using `ruby -wc`
- [linter-erb](https://atom.io/packages/linter-erb), for .erb files, using `erb -x`
- [linter-haml](https://atom.io/packages/linter-haml), for .haml files, using `haml-lint`

#### for PHP
- [linter-php](https://atom.io/packages/linter-php), for PHP using `php -l`
- [linter-phpcs](https://atom.io/packages/linter-phpcs), for PHP, using `phpc`
- [linter-phpmd](https://atom.io/packages/linter-phpmd), for PHP, using `phpmd`

#### for Python
- [linter-pylint](https://atom.io/packages/linter-pylint), for Python, using `pylint`
- [linter-pyflakes](https://atom.io/packages/linter-pyflakes), for Python, using `pyflakes`
- [linter-pep8](https://atom.io/packages/linter-pep8), for Python, using `pep8`.
- [linter-pep257](https://atom.io/packages/linter-pep257), for Python, using `pep257`
- [linter-flake8](https://atom.io/packages/linter-flake8), for Python, using `flake8`
- [linter-pylama](https://atom.io/packages/linter-pylama), for Python, using `pylama`

#### for Java
- [linter-javac](https://atom.io/packages/linter-javac), for Java, using `javac`

#### for CSS / SASS / SCSS / LESS
- [linter-scss-lint](https://atom.io/packages/linter-scss-lint), for SASS/SCSS, using `scss-lint`
- [linter-less](https://atom.io/packages/linter-less), for LESS, using `less`
- [linter-csslint](https://atom.io/packages/linter-csslint), for CSS, using `csslint`

#### for XML
- [linter-xmllint](https://atom.io/packages/linter-xmllint), for XML, using `xmllint`

#### for Bash
- [linter-shellcheck](https://atom.io/packages/linter-shellcheck), for Bash, using `shellcheck`

#### for Scala
- [linter-scalac](https://atom.io/packages/linter-scalac), for Scala, using `scalac`

#### for C / C++
- [linter-clang](https://atom.io/packages/linter-clang), for C / C++, using `clang`
- [linter-cpplint](https://atom.io/packages/linter-cpplint), for C++, using `cpplint`

#### for Lua
- [linter-lua](https://atom.io/packages/linter-lua), for Lua, using `luac -p`
- [linter-luacheck](https://atom.io/packages/linter-luacheck) for Lua, using `luacheck`

#### for Clojure
- [linter-clojure](https://atom.io/packages/linter-clojure), for Clojure, using `clojure`

#### for Puppet
- [linter-puppet-lint](https://atom.io/packages/linter-puppet-lint), for Puppet, using `puppet-lint`

#### for Yaml
- [linter-js-yaml](https://atom.io/packages/linter-js-yaml), for Yaml, using `js-yaml`

#### for Haskell
- [linter-hlint](https://atom.io/packages/linter-hlint), for Haskell files, using `hlint`

#### for HTML / Bootstrap
- [linter-bootlint](https://atom.io/packages/linter-bootlint), for Bootstrap HTML, using `bootlint`
- [linter-tidy](https://atom.io/packages/linter-tidy), for HTML, using `tidy`
- [linter-htmlhint](https://atom.io/packages/linter-htmlhint), for html, using `htmlhint`

#### for Squirrel
- [linter-squirrel](https://atom.io/packages/linter-squirrel), for squirrel, using `squirrel-compiler`

#### for CoDScript
- [linter-codscriptizer](https://atom.io/packages/linter-codscriptizer), for CoDScript, using `codscriptizer -l`

#### for harbour
- [linter-harbour](https://atom.io/packages/linter-harbour), for Harbour, using `harbour`

#### for Rust
- [linter-rust](https://atom.io/packages/linter-rust), for Rust, using `rustc`

#### for Elixir
- [linter-elixirc](https://atom.io/packages/linter-elixirc), for Elixir, using `elixirc`

#### for Erlang
- [linter-erlc](https://atom.io/packages/linter-erlc), for Erlang, using `erlc`

#### for ActionScript/Flash/Flex/AIR
- [linter-flexpmd](https://atom.io/packages/linter-flexpmd),for ActionScript/Flash/Flex/AIR, using flexpmd

## Features

* **Lint on edit** – Instant error reporting for you! (And it's fast!)
* **Modular** – You install only the linters you need.
* **Active** – New linters are out every week.

## Installation

1. `$ apm install linter` – Install the main package.
2. `$ apm install linter-jshint` – Install the linter you need, here `jshint`.

## Configuration

* **Lint on save** [On / Off] - Lint the file when you save it
* **Lint on change** [On / Off] - Lint the file as you type
* **Show highlighting** [On / Off] - Highlight the range of wrong code
* **Show gutters**: [On / Off] - Show dot in the gutter on line error
* **Show messages around cursor** [On / Off] - Show error description in the status bar
* **Show status bar when cursor is in error range** [On / Off] - Either show status bar when the cursor is on the error line, or show it when the cursor is focus the range of wrong code
* **Show error inline** [On / Off] - Shows the error or warning message next to the code as opposed to in the status bar.
* **Lint on change interval** [in ms] - Interval between two lints while you are writing code

## Common errors

* `npm ERR! code ENOGIT` - You need to install git before installing linter. See [#114](https://github.com/AtomLinter/Linter/issues/102).
* `env: node: No such file or directory` – There's a problem with your node path – [check this](http://stackoverflow.com/a/20077620).
* `spawn ENOENT` or `spawn ENOTDIR` - A linter can't find a path to the executable. Try starting Atom from a shell via `atom` to make sure it gets your `PATH`. See also [#102](https://github.com/AtomLinter/Linter/issues/102), [#150](https://github.com/AtomLinter/Linter/issues/150).

## Documentation
http://atomlinter.github.io/Linter/

## Coming soon

- linter-pep257, for python, using `pep257`.
- linter-rst, for reStructuredText, using `docutils`.
- linter-phplint, for PHP, using `phplint`.
- linter-jsl, for JavaScript, using `jsl`.
- linter-oclitnt, for C / C++ / Objective-C, using `OCLint`.

## Contributing

If you're going to submit a pull request, please try to follow
[the official contribution guidelines of Atom](https://atom.io/docs/latest/contributing).

You need `nodejs` and `grunt-cli` installed before contributing.
Run `bower install node` then `npm install -g grunt-cli`.

Also, run `$ grunt dev` before any submission and while developing, it will achieves severals tasks:

* Compile and lint the CoffeeScript files
* Lint the stylesheets
* Lint any trailing spaces and ensure new line at end of file

You can generate the doc with `$ grunt doc`, it will open in your default browser.

## Donation
[![Share the love!](https://chewbacco-stuff.s3.amazonaws.com/donate.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=KXUYS4ARNHCN8)

[![donate-paypal](https://s3-eu-west-1.amazonaws.com/chewbacco-stuff/donate-paypal.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=KXUYS4ARNHCN8)

<a class="coinbase-button" data-code="2945dab392cb1cefbb7097e4cd17a603" data-button-style="custom_small" href="https://www.coinbase.com/checkouts/2945dab392cb1cefbb7097e4cd17a603">Donate Bitcoins</a><script src="https://www.coinbase.com/assets/button.js" type="text/javascript"></script>
