package prism.accounts;

import haxe.Json;
import prism.util.structs.Request;
import haxe.Http;
import prism.util.structs.Account;
import prism.util.Instructions.*;

class Accounts {
	public static function getFromID(id:Int, url:String):Account {
		var a:Account = null;
		var req = new Http(url);
		var d:Request = {
			status: NULL,
			actions: [
				{
					instruction: GET,
					params: {
						type: USERS
					}
				}
			]
		};
		req.setPostData(Json.stringify(d));
		req.onData = (raw:String) -> {
			var data:Request = Json.parse(raw);
			if (data.status == SUCCESS) {
				for (r in data.response) {
					var ta:Account = r;
					if (ta.userID == id)
						a = data.response[0];
				}
			}
		}
		req.request(true);
		return a;
	}
}
