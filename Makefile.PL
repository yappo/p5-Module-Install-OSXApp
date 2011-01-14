use inc::Module::Install;
name 'Module-Install-OSXApp';
all_from 'lib/Module/Install/OSXApp.pm';
readme_from 'lib/Module/Install/OSXApp.pm';
readme_markdown_from 'lib/Module/Install/OSXApp.pm';
githubmeta;

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
