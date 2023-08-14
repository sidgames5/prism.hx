package prism.util.structs;

import haxe.io.Bytes;

typedef Account = {
	username:String,
	userID:Int,
	?password:Bytes,
	profile:{
		displayName:String, pfp:Bytes, bio:String
	}
}
