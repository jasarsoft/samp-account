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
	AddAccountData("kills", TYPE_INT, gPlayerKills);
	AddAccountData("deaths", TYPE_INT, gPlayerDeaths);
	AddAccountData("health", TYPE_FLOAT, gPlayerHealth);
	AddAccountData("phrase", TYPE_STRING, gPlayerPhrase);
	return 1;
}