function tlmgr --wraps='TEXMFDIST/scripts/texlive/tlmgr.pl --usermode' --wraps='$TEXMFDIST/scripts/texlive/tlmgr.pl --usermode' --description 'alias tlmgr=$TEXMFDIST/scripts/texlive/tlmgr.pl --usermode'
  $TEXMFDIST/scripts/texlive/tlmgr.pl --usermode $argv; 
end
