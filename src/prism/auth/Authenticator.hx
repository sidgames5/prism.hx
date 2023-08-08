package prism.auth;

import haxe.Json;
import prism.crypto.Encryption;
import prism.util.structs.Request;
import sys.Http;
import haxe.io.Bytes;
import prism.util.Instructions.*;

class Authenticator {
	/**
	 * Validates a user
	 * @param username The username to check
	 * @param password The user's hashed password
	 * @return Key, returns null if the user cannot be validated
	 * @since 0.1
	 */
	public static function login(username:String, password:Bytes, url:String):Int {
		var code = FAILURE;

		var req = new Http(url);
		var c:Request = {
			status: NULL,
			actions: [
				{
					instruction: LOGIN,
					params: {
						username: username,
						password: password.toHex()
					}
				}
			]
		};
		req.setPostData(Encryption.encrypt(Bytes.ofString(Json.stringify(c)), null).toHex());
		req.onData = function(raw:String) {
			var data:Request = Json.parse(Encryption.decrypt(Bytes.ofHex(raw), null).toString());
			code = data.status;
		}
		req.request(true);

		return code;
	}

	public static function getPasswordHash(username:String):Bytes {
		return null;
	}
}
