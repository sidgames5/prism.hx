package prism.util.structs;

import prism.util.structs.Message;

typedef Request = {
	status:Int,
	?actions:Array<Action>,
	?response:Array<Any>,
	?messages:Array<Message>
}
