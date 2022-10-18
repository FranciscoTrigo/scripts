#
# http://pbrisbin.com:8080/bin/piratesearch
#
# this script searches the piratebay, returns
# the first 30 results, then downloads the user
# selected torrent
#
# added support for specifying multiple torrents
# to download by answering multiple numbers
# separated by spaces after the search results
#
# accepts any input as search term
#
# piratesearch 24
# piratesearch porn
# piratesearch the new hugh jackman flick
#
# requires:
#       wget
#       lynx
#
###

### config 
# place to download the torrents to
DIR="$HOME/Downloads"

# place to keep temp files
WD="/tmp/piratesearch"

### script
make_clean() {
  [ -d $WD ] && rm -r $WD; mkdir -p $WD

  [ -d $DIR ] || mkdir -p $DIR
}

message() {
  echo "usage: pirateseaerch [options] [search terms]"
  echo
  echo "  options:"
  echo "        -a, --audio      search audio torrents"
  echo "        -v, --video      search video torrents"
  echo "        -A, --apps       search application torrents"
  echo "        -g, --games      search games torrents"
  echo "        -o, --other      search other torrents"
  echo "        -h, --help       display this"
  echo
  echo "        none             search all torrents"
  echo
  exit 1
}

errorout() {
  echo "error: $*"
  echo

  [ -d $WD ] && rm -r $WD
  exit 1
}

cleanexit() {
  [ -d $WD ] && rm -r $WD
  exit 0
}

search () {
  touch $WD/results.lst

  lynx -dump "http://thepiratebay.org/search/$term/$criteria" |\
    awk '/\.TPB\.torrent$/ {print $2}' | cut -d "/" -f 5- | sed 's/\.TPB\.torrent//g' |\
    while read result; do
      NUM="$(echo $result | awk -F "." '{print $NF}')"
      TITLE="$(echo $result | sed s/\.$NUM//g)"
      echo "$count $NUM $TITLE" >> $WD/results.lst
      count=$((count+1))
    done
  
  NOR=$(grep -v ^$ $WD/results.lst | wc -l)
  [ $NOR -eq 0 ] && errorout "No results or search engine overloaded, feel free to try again in a few seconds."

  echo
  grep -v ^$ $WD/results.lst | tail -n30 | while read lines; do
    num="$(echo $lines | awk '{print $1}')"
    title="$(echo $lines | awk '{print $3}' | sed 's/__/_/g' | sed 's/_/\ /g')"
    echo -e "\t\e[1;37m$num \t\e[0m$title"
  done
  echo

  if [ $(($NOR%30)) -ne 0 ]; then
    echo -n ":: Enter the number to download or q for [q]uit: " && read A
    while [ "$A" = "m" ]; do
      echo -n ":: No more results, enter the number(s) to download or q for [q]uit: " && read A
    done
  else
    echo -n ":: Enter the number(s) to download, m for [m]ore, or q for [q]uit: " && read A
  fi
  
  [ "$A" = "q" ] && cleanexit
}


EXT=""

while [ -n "$1" ]; do
  case "$1" in
    -h|--help)  message                  ;;
    -a|--audio) EXT="${EXT},100" ; shift ;;
    -v|--video) EXT="${EXT},200" ; shift ;;
    -A|--apps)  EXT="${EXT},300" ; shift ;;
    -g|--games) EXT="${EXT},400" ; shift ;;
    -o|--other) EXT="${EXT},500" ; shift ;;
    *)          break                    ;;
  esac
done

ext="${EXT[@]:1}" # trim leading ','
term="$*"
A="m"
page=0
count=1

make_clean

# run the searches
while [ "$A" = "m" ]; do
  criteria="$page/99/${ext:-0}"
  search
  page=$((page+1))
  count=$((count+30))
done

# after user selection
for a in $A; do
  NUM="$(awk "/^$a\ /"'{print $2}' $WD/results.lst)"
  TITLE="$(awk "/^$a\ /"'{print $3}' $WD/results.lst)"

  if [ "$NUM" = "" ]; then
    echo "Skipping invalid choice $a..."
  else
    URL="http://torrents.thepiratebay.org/$NUM/$TITLE.$NUM.TPB.torrent"
    cd $DIR && wget -q "$URL"
    if [ $? -eq 0 ]; then
      echo "---> torrent $TITLE downloaded"
    else
      echo "-!-> torrent $TITLE failed to download"
    fi
  fi
done

cleanexit

alias lsi='ls | grep -i'
