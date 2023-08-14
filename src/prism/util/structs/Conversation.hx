package prism.util.structs;

import prism.util.structs.Message;
import prism.util.structs.Account;

typedef Conversation = {
	name:String,
	participants:Array<Account>,
	?messages:Array<Message>,
	?id:Int
}
