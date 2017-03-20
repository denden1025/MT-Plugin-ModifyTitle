# ===================================================================
# ★ ModifyTitle ★
# ===================================================================
package ModifyTitle;
#use strict;
#-----------------------------------------------
sub _handler{
my($cb,$app,$obj,$orig_obj) = @_;
#my $IDFILE = '/home/httpd/html/mt/plugins/ModifyTitle/lib/debug.txt';
#open IDF,">$IDFILE" or die "Cannot Open $IDFILE :$!";
my $blog_id = 'blog:' . $obj->blog_id;
my $plugin = MT->component('ModifyTitle');
my $Enable = $plugin->get_config_value('Enable', $blog_id);
if((defined($Enable)) and ($Enable == 1)){
	my $dda = &get_local_time('exp2');
	if($obj->title =~ /2[0-9][0-9][0-9]\-([1-9]|1[0-2])\-([1-9]|1[0-9]|2[0-9]|3[0-1])/){
	}else{
		my $CatID = $plugin->get_config_value('CatID', $blog_id);
#		print IDF "1 $Enable $CatID\n";
		my $val = $app->param('category_ids'); # カンマ区切りデータ
		my @vals = split(/,/,$val);
		for(@vals){
#			print IDF "$_\n";
			if($_ == $CatID){
#				print IDF "OK $_ $CatID\n";
				$obj->title($obj->title . ' ' . $dda);
				$orig_obj->title($orig_obj->title . ' ' . $dda);
				last;
			}
		}
	}
}
$blog_id .= ''; # 何かしないとエラーになるのはWhy..?
#close IDF;
}
#-----------------------------------------------
sub get_local_time{
	my ($type,$ysec) = @_;
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$wareki_nen,$seireki_nen,
	@month,$month,$tuki,@tuki,@youbi,$youbi,$current_time,$seireki,$wareki);
	if ($type eq 'exp'){
		($sec,$min,$hour,$mday,$mon,$year,$wday) = (gmtime($ysec))[0,1,2,3,4,5,6];
		$year_new = (gmtime($ysec))[5];
	}else{
		($sec,$min,$hour,$mday,$mon,$year,$wday) = (localtime)[0,1,2,3,4,5,6];
	}
	if ($year<2000){ #Y2K対応
		$seireki_nen = $year + 1900;
	}else{
		$seireki_nen = $year + 2000;
	}
	$wareki_nen = "平成" . ($year - 88);
	if ($type eq 'exp'){
		@month = ('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
		$month = $month[$mon];
	}else{
		$month = $mon + 1;
	}
	if ($type eq 'exp'){
		@youbi = ("Sun","Mon","Tue","Wed","Thr","Fri","Sat");
	}else{
		@youbi = ("日","月","火","水","木","金","土");
	}
	$youbi = $youbi[$wday];
	$current_time = sprintf("%02d:%02d:%02d",$hour,$min,$sec); 
	$seireki = "$seireki_nen" . "年" . "$month" . "月" . "$mday" . "日" ."($youbi)";
	$wareki = "$wareki_nen" . "年" . "$month" . "月" . "$mday" . "日" . "($youbi)";
	if ($type eq "ct"){
		return $current_time;
	}
	elsif ($type eq "w"){
		return $wareki;
	}
	elsif ($type eq "all"){
		return $seireki.' '.$current_time;
	}
	elsif ($type eq "exp"){
		return $youbi.','.' '.$mday.'-'.$month.'-'.$seireki_nen.' '.$current_time.' GMT';
	}
	elsif ($type eq "exp2"){
		return $seireki_nen.'-'.$month.'-'.$mday;
	}
	else {
		return $seireki;
	}
}

1; #
