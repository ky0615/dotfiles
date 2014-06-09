function js2coffee_d(){
	js2coffee $1 > `echo $1 | sed -e "s/\.js/.coffee/"`
	rm $1
}