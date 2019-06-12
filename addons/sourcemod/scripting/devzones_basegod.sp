#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#include <sdkhooks>
#include <devzones>

public Plugin:myinfo =
{
	name = "SM DEV Zones - NoDamage",
	author = "Franc1sco franug",
	description = "",
	version = "3.1",
	url = "http://steamcommunity.com/id/franug"
};

public OnPluginStart()
{
	for(int i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i))
		{
			OnClientPutInServer(i);
		}
}

public OnClientPutInServer(client)
{
   SDKHook(client, SDKHook_OnTakeDamage, OnTakeDamage);
}

public Action:OnTakeDamage(victim, &attacker, &inflictor, &Float:damage, &damagetype)
{
	if(!IsValidClient(victim) || !IsValidClient(attacker)) return Plugin_Continue;
	
	if(!Zone_IsClientInZone(victim, "basegod", false) && !Zone_IsClientInZone(attacker, "basegod", false)) return Plugin_Continue;
	
	PrintHintText(attacker, "Basedeki oyunculara hasar vuramazsın!");
	PrintToChat(attacker, "[\x02smdestek.net\x01] \x04Basedeki oyunculara hasar vuramazsın!");
	
	return Plugin_Handled;
}

public IsValidClient( client ) 
{ 
    if ( !( 1 <= client <= MaxClients ) || !IsClientInGame(client) ) 
        return false; 
     
    return true; 
}