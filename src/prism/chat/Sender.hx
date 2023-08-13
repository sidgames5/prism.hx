package prism.chat;

import prism.crypto.Encryption;
import haxe.io.Bytes;
import haxe.Json;
import prism.util.Instructions.*;
import prism.util.structs.Request;
import haxe.Http;
import prism.util.structs.Message;

class Sender {
	public static function send(message:Message, url:String) {
		var req = new Http(url);
		var c:Request = {
			status: NULL,
			actions: [
				{
					instruction: MESSAGE,
					params: {},
					messages: [message]
				}
			]
		};
		req.setPostData(Json.stringify(c));
		req.request(true);
	}
}
