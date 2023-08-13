package prism.util.structs;

import haxe.io.Bytes;
import prism.util.structs.Message;

typedef Action = {
	instruction:Int,
	?params:{
		?username:String,
		?password:String,
		?data:Any,
		?message:Message
	}
}
