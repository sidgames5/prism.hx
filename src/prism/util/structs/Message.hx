package prism.util.structs;

import prism.util.structs.Author;

typedef Message = {
	content:String,
	author:Author,
	timestamp:Int,
	?id:Int,
	crc32:Int
}
