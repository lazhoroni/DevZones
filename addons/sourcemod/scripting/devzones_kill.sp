#include <sourcemod>
#include <sdktools>
#include <devzones>

public Plugin myinfo =
{
	name 	= "Kule Yasakla",
	author 	= "",
	version = "1.0",
	url 	= ""
};

public Zone_OnClientEntry(client, String:zone[])
{
	if (client < 1 || client > MaxClients || !IsClientInGame(client) || !IsPlayerAlive(client))
	{
		return;
	}
	if (StrContains(zone, "kule", false)))
	{
		PrintToChat(client, "[\x02smdestek.net\x01] \x04Kuleye çıkmak yasak olduğu için \x07öldürüldün!");
		ForcePlayerSuicide(client);
	}
}
