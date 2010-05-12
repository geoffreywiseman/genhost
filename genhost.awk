BEGIN {
  notloc = "^#![A-Za-z]+#"
  isloc = "^#[A-Za-z]+#"
  loc_match = ( "^#" loc "#" )
  loc_mismatch = ( "^#!" loc "#" )
}
$0 ~ loc_match { gsub( loc_match, "" ) }
$0 ~ notloc && $0 !~ loc_mismatch { gsub( notloc, "" ) } 
$0 ~ locmismatch { gsub( notloc, "#" ) }
$0 ~ isloc && $0 !~ loc_match { gsub( isloc, "#" ) }
{ print $0 }
