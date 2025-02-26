@echo off
Echo ============== Clear Old Data =================
rd "E:\TargetVersion996\DirServer\MirServer\Mir200\" /s /q

Echo ============== Copy Config To Server EnvirData =================
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_att_score.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_custpro_caption.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_equip.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_item.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_magic.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_npclist.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_suit.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_monster.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_mongen.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_store.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_level.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_game_data.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_setup.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_newtask.xls" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Data\" /I /E

xcopy /y "E:\Work996Git\work996-game\NewConfig\MapInfo.txt" "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\!Setup.txt" "E:\TargetVersion996\DirServer\MirServer\Mir200\" /I /E

Echo ============== Copy ScriptConfig To Server =================
xcopy /y E:\Work996Git\work996-game\version_first\Envir\Robot.txt  E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\ /I /E
xcopy /y E:\Work996Git\work996-game\version_first\Envir\MapQuest_Def\*.*  E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\MapQuest_Def\ /I /E
xcopy /y E:\Work996Git\work996-game\version_first\Envir\Market_Def\*.*  E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\Market_Def\ /I /E
xcopy /y E:\Work996Git\work996-game\version_first\Envir\MonItems\*.*  E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\MonItems\ /I /E
xcopy /y E:\Work996Git\work996-game\version_first\Envir\QuestDiary\*.*  E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\QuestDiary\ /I /E

rd "E:\TargetVersion996\DirServer\MirServer\Mir200\Envir\.vscode\" /s /q
Echo ====== Finish=======