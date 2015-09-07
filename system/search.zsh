function grepcode()
{
	if [ -z $@ ]; then
		echo "usage: $FUNCNAME searchstring"
	else
		echo "Searching for \"$@\" in $PWD/*"
		grep -nr "$@" ./* | grep -v "\.svn" | grep -v "/stc/" | grep -v "\.git" | grep -v "/node_modules/" | grep -v "/bower_components/" | grep -v "*.min.js"
	fi
}
