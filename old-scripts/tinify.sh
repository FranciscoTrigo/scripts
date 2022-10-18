#Author: Philip Stark
# desc:  pass an url as the first and only argument to make it tiny or 
#        leave it away and it takes the content of the clipboard by
#        calling xclip. 
# licenced under the WTFPL (http://sam.zoy.org/wtfpl/)
 
if [ "$1" = "" ]; then
  tinyurl=$(curl http://tinyurl.com/api-create.php?url=$(xclip -selection clipboard -o) 2> /dev/null)
  echo $tinyurl;
  echo $tinyurl | xclip -selection clipboard -i;
else
  url=$1;
  tinyurl=$(curl http://tinyurl.com/api-create.php?url=${url} 2> /dev/null)
  echo $tinyurl;
  echo $tinyurl | xclip -selection clipboard -i;
fi
