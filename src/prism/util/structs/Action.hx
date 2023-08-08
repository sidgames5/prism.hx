package prism.util.structs;

import haxe.io.Bytes;

typedef Action = {
	instruction:Int,
	params:{
		?username:String, ?password:String, ?data:Any
	}
}
