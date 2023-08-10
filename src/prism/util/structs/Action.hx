package prism.util.structs;

import prism.util.structs.Message;
import haxe.io.Bytes;
import prism.util.structs.Message

typedef Action = {
	instruction:Int,
	?params:{
		?username:String,
		?password:String,
		?data:Any,
	  ?messages:Array<Message>
	}
}
