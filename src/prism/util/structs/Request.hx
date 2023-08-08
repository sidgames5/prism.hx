package prism.util.structs;

typedef Request = {
	status:Int,
	?actions:Array<Action>,
	?response:Array<Any>
}
