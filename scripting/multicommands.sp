#include <sourcemod>

public Plugin myinfo = 
{
	name = "multicommands",
	author = "Blue Malgeran",
	description = "A very basic multicommands plugin.",
	version = "0.1",
	url = "BlueMalgeran.tk"
};

public void OnPluginStart()
{
	RegConsoleCmd("sm_cmd1", cmd_command1, "disc 1");
	
	RegAdminCmd("sm_cmd2", cmd_command2, ADMFLAG_SLAY, "disc 2");
	
	RegConsoleCmd("sm_cmd", cmd_command3, "disc 3");
}

public Action cmd_command1(int client, int args) {
	if (args > 0) {
		char s_arg1[64];
		GetCmdArg(1, s_arg1, sizeof(s_arg1));
		
		PrintToChat(client, "Argument: %s", s_arg1);
	} else {
		PrintToChat(client, "Successful argument!");
	}
}

public Action cmd_command2(int client, int args) {
	PrintToChat(client, "Yes sir! (ADMIN)");
}

public Action cmd_command3(int client, int args) {
	if (GetUserFlagBits(client) & ADMFLAG_SLAY) {
	} else {
		PrintToChat(client, "No sir! (ADMIN)");
		}
}
