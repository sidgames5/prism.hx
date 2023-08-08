package prism.util.structs;

import prism.util.structs.Config;
import prism.util.structs.Account;
import prism.util.structs.Message;

typedef DB = {
	messages:Array<Message>,
	users:Array<Account>,
	config:Config
}
