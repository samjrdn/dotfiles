sourceif /usr/local/share/chruby/chruby.sh
sourceif /usr/local/share/chruby/auto.sh

sourceif $HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh
sourceif $HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh

chruby ruby-3.3.3
