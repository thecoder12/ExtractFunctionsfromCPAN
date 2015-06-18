
## map -> actionon elements
## grep -> tests the elements
## sort -> sorts the elements

my @array = qw(1 2 3 4);
foreach (@array){
 
  $_ = $_ * 2;
  
}

print "=@array=\n";


##### same example using map

map {$_ = $_ * 2} @array;
print "=@array=\n";


##### same example using map differently

map $_*2, @array;
print "=@array=\n";


## another foreach example

$_ = uc foreach @array ;
print "=@array=\n";

### map - is best used to create a new list
## foreach - is best used in trnaforming a alist.



@dirs = grep { -d } @files; ### get the directories list from bunch of files/directories

@no_dup = grep { !$hash{$_}++ } @array; ## get the non duplicate entries from the array

@errors = grep {  /error/i } @logs; ## get the rows which has error keyword in it.

@true = grep { $_ } @all; ### get all elements from @all except empty string & zero values




