use inc::Module::Install;
name 'HDK48';
all_from 'lib/HDK48.pm';
readme_from 'lib/HDK48.pm';
readme_markdown_from 'lib/HDK48.pm';
githubmeta;

requires 'Cocoa::Growl';
requires 'Cocoa::EventLoop';

osx_app(
    name   => 'HDK48',
    script => 'hdk48.pl',
);

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
