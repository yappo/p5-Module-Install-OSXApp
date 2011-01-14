package Module::Install::OSXApp;
use strict;
use warnings;
use base qw(Module::Install::Base);
our $VERSION = '0.01';

sub osx_app {
    my($self, %args) = @_;
    my $name   = $args{name};
    my $script = $args{script};
    my $info_plist = _gen_info_plist(%args);

    open my $fh, '>', 'inc/Info.plist';
    print $fh $info_plist;
    close $fh;

    $self->Makefile->postamble(<<EOM);
osxapp: 
\t\$(NOECHO) rm -fr $name.app
\t\$(NOECHO) mkdir -p $name.app/Contents
\t\$(NOECHO) mkdir $name.app/Contents/MacOS
\t\$(NOECHO) mkdir $name.app/Contents/Resources
\t\$(NOECHO) cp $script $name.app/Contents/MacOS/$script
\t\$(NOECHO) chmod 0755 $name.app/Contents/MacOS/$script
\t\$(NOECHO) cp inc/Info.plist $name.app/Contents/Info.plist
EOM
}

sub _gen_info_plist {
    my %args = @_;
    my $name   = $args{name};
    my $script = $args{script};

    return <<EOP;
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>CFBundleExecutable</key>
    <string>$script</string>
    <key>CFBundleIconFile</key>
    <string>icon.icns</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleSignature</key>
    <string>????</string>
  </dict>
</plist>
EOP
}

1;
__END__

=head1 NAME

Module::Install::OSXApp -

=head1 SYNOPSIS

  use Module::Install::OSXApp;

=head1 DESCRIPTION

Module::Install::OSXApp is

=head1 AUTHOR

Kazuhiro Osawa E<lt>yappo {at} shibuya {dot} plE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
