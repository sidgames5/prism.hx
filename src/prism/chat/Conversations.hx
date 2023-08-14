package prism.chat;

import prism.util.structs.Account;
import prism.util.structs.Request;
import haxe.Json;
import sys.Http;
import prism.util.structs.Conversation;
import prism.util.Instructions.*;

class Conversations {
	public static function register(c:Conversation, url:String):Int {
		var req = new Http(url);
		var d:Request = {
			status: NULL,
			actions: [
				{
					instruction: CREATE_CONVERSATION,
					params: {
						data: c
					}
				}
			]
		};
		req.setPostData(Json.stringify(d));
		var id = 0;
		req.onData = (raw:String) -> {
			var data:Request = Json.parse(raw);
			id = data.response[0];
		}
		req.request(true);
		return id;
	}

	public static function addParticipant(user:Account, convo:Int, url:String) {
		var req = new Http(url);
		var d:Request = {
			status: NULL,
			actions: [
				{
					instruction: ADD_PARTICIPANT,
					params: {
						data: user,
						index: convo
					}
				}
			]
		};
		req.setPostData(Json.stringify(d));
		req.onData = (raw:String) -> {
			var data:Request = Json.parse(raw);
		}
		req.request(true);
	}

	public static function removeParticipant(user:Account, convo:Int, url:String) {
		var req = new Http(url);
		var d:Request = {
			status: NULL,
			actions: [
				{
					instruction: REMOVE_PARTICIPANT,
					params: {
						data: user,
						index: convo
					}
				}
			]
		};
		req.setPostData(Json.stringify(d));
		req.onData = (raw:String) -> {
			var data:Request = Json.parse(raw);
		}
		req.request(true);
	}
}
