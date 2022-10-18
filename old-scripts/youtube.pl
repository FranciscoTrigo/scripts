#!/usr/bin/perl
use LWP::Simple;

my $player = 'mplayer';
my $url = shift or die("Needs argument");
my $body = get($url);
my($t) = $body =~ /"t":\s*"(.+?)"/is;
my($video_id) = $body =~ /"video_id":\s*"(.+?)"/is;
my $real_url = "http://www.youtube.com/get_video?video_id=$video_id&t=$t";
print "$real_url\n";
system("$player '$real_url'"); 
exit 0;
