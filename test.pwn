// generated by "sampctl package generate"

#include "account.inc"

new 
	gPlayerKills[MAX_PLAYERS],
	gPlayerDeaths[MAX_PLAYERS],
	Float: gPlayerHealth[MAX_PLAYERS],
	gPlayerPhrase[MAX_PLAYERS][30];

main() {
	// write tests for libraries here and run "sampctl package run"
}

public OnGameModeInit() {
	AddPlayerClass(0, 0.00, 0.00, 0.00, 0.00, 0, 0, 0, 0, 0, 0);

	AddAccountData("kills", TYPE_INT, gPlayerKills);
	AddAccountData("deaths", TYPE_INT, gPlayerDeaths);
	AddAccountData("health", TYPE_FLOAT, gPlayerHealth);
	AddAccountData("phrase", TYPE_STRING, gPlayerPhrase);
	return 1;
}

public OnPlayerConnect(playerid) {
	gPlayerKills[playerid] = 20;
	gPlayerDeaths[playerid] = 10;
	gPlayerHealth[playerid] = 80.25;
	strcat(gPlayerPhrase[playerid], "test_phrase");
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[]) {
	
	if(!strcmp(cmdtext, "/stats", true)) {
		new string[128];
		format(string, sizeof(string), "Kills: %i | Deaths: %i | Health: %0.2f, Phrase: %s",
			gPlayerKills[playerid],
			gPlayerDeaths[playerid],
			gPlayerHealth[playerid],
			gPlayerPhrase[playerid]
		);
		SendClientMessage(playerid, 0x00FF00FF, string);
		return 1;
	}

	if(!strcmp(cmdtext, "/register", true, 9)) {
		if(IsPlayerLoggedIn(playerid)) 
			return SendClientMessage(playerid, 0xFF0000FF, "Already logged in!");

		if(!strlen(cmdtext[10])) {
			return SendClientMessage(playerid, 0xFF0000FF, "Usage: /register <password>");
		}

		if(!RegisterPlayer(playerid, cmdtext[10])) {
			SendClientMessage(playerid, 0xFF0000FF, "Username already registered!");
		} else {
			SendClientMessage(playerid, 0x00FF00FF, "Successfully registered!");
		}
		return 1;
	}

	if(!strcmp(cmdtext, "/login", true, 6)) {
		if(IsPlayerLoggedIn(playerid))
			return SendClientMessage(playerid, 0xFF0000FF, "Already logged in!");

		if(!strlen(cmdtext[7])) {
			return SendClientMessage(playerid, 0xFF0000FF, "Usage: /login <password>");
		}

		if(!LoginPlayer(playerid, cmdtext[7])) {
			SendClientMessage(playerid, 0xFF0000FF, "Incorrect password!");
		} else {
			SendClientMessage(playerid, 0x00FF00FF, "Successfully logged in!");
		}
		return 1;
	}
	return 0;
}