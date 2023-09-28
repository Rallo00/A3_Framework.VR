waitUntil { !isNil {player} };
waitUntil { player == player };

//BRIEFING DI MISSIONE
player createDiaryRecord ["Diary", ["BRIEFING","
<font size='25' color='#C48214'>TITOLO</font><br/><br/>" + 
localize "STR_INF_briefing" + 
"<br/><img image='RalloFramework\images\signature.paa' width='128' height='128'/>
"]];
