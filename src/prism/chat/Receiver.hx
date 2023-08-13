package prism.chat;

import haxe.Http;
import haxe.Json;
import prism.util.Instructions.*;
import prism.util.structs.Message;
import prism.util.structs.Request;

class Receiver {
	/**
	 * Gets all messages from the remote server
	 * @param url URL of the remote server
	 * @return Array of all the messages
	 * @since 0.1
	 */
	public static function getAll(url:String):Array<Message> {
		var req = new Http(url);
		var r:Request = {
			status: NULL,
			actions: [
				{
					instruction: READ
				}
			]
		};
		var re = [];
		req.setPostData(Json.stringify(r));
		req.onData = (raw:String) -> {
			var data:Request = Json.parse(raw);
			if (data.status == SUCCESS) {
				re = data.messages;
			} else if (data.status == FAILURE || data.status == ERROR || data.status == NOT_FOUND || data.status == INVALID) {}
			trace(raw);
		}
		req.request(true);
		return re;
	}

	/**
	 * Gets the latest message from the remote server
	 * @param url URL of the remote server
	 * @return The latest message
	 * @since 0.1
	 */
	public static function getLatest(url:String):Message {
		var g = getAll(url);
		return g[g.length - 1];
	}

	/**
	 * Gets the latest messages from the remote server
	 * @param url URL of the remote server
	 * @param count Number of messages to return
	 * @return Array of messages
	 * @since 0.1
	 */
	public static function getMultiple(url:String, count:Int):Array<Message> {
		var x = [];
		var g = getAll(url);

		var start = g.length - count;

		for (m in 0...g.length) {
			if (m > start) {
				x.push(g[m]);
			}
		}

		return x;
	}
}
