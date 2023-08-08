package prism.crypto;

import haxe.crypto.mode.Mode;
import haxe.crypto.Base64;
import haxe.crypto.TwoFish;
import haxe.io.Bytes;

class Encryption {
	public static function encrypt(x:Bytes, key:Bytes):Bytes {
		// var twofish = new TwoFish();
		// twofish.init(key);

		// var f = Bytes.ofString(Base64.encode(x));
		// f = twofish.encrypt(Mode.PCBC, f);
		// f = Bytes.ofString(Base64.encode(f));

		// return f;

		// encryption will not be supported for a bit

		return x;
	}

	public static function decrypt(x:Bytes, key:Bytes):Bytes {
		// var twofish = new TwoFish();
		// twofish.init(key);

		// var f = Base64.decode(x.toString());
		// f = twofish.decrypt(Mode.PCBC, f);
		// f = Base64.decode(f.toString());

		// return f;

		return x;
	}
}
