/*
To Do:
- Log commands via rcon protocol (SMRcon support?)
- Cvars for logging, enable/disable aspects
*/

#include <sourcemod>

char g_RConLogFile[PLATFORM_MAX_PATH];

public Plugin myinfo = 
{
	name = "RCon Logger",
	author = "sneaK",
	description = "Logs rcon usage",
	version = "0.1",
	url = "https://snksrv.com"
};

public void OnPluginStart()
{
	BuildPath(Path_SM, g_RConLogFile, PLATFORM_MAX_PATH, "logs/rcon.log");
}

public Action OnLogAction(Handle source, Identity ident, int client, int target, const char[] message)
{
	if((StrContains(message, "console command") != -1))
	{
		LogToFile(g_RConLogFile, "%s", message);
	}
}