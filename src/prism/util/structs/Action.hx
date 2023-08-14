package prism.util.structs;

import haxe.io.Bytes;
import prism.util.structs.Message;

typedef Action = {
	instruction:Int,
	?status:Int,
	?params:{
		?username:String,
		?password:String,
		?data:Any,
		?message:Message,
		?index:Int,
		?startIndex:Int,
		?endIndex:Int
	},
	?messages:Array<Message>
}
