package prism.util.structs;

import prism.util.structs.Message;
import haxe.io.Bytes;

typedef Action = {
	instruction:Int,
	?params:{
		?username:String,
		?password:String,
		?data:Any,
		?message:Message
	}
}
