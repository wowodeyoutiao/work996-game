@echo off
Echo ============== Copy Config To Server EnvirData =================
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_att_score.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_custpro_caption.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_equip.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_item.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_magic.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_npclist.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_suit.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_monster.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_mongen.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_store.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_level.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_game_data.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_setup.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\cfg_newtask.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\MapInfo.txt" "E:\Game996\MirServer\Mir200\Envir\" /I /E
xcopy /y "E:\Work996Git\work996-game\NewConfig\!Setup.txt" "E:\Game996\MirServer\Mir200\" /I /E


Echo ============== Copy ScriptConfig To Server =================
xcopy /y E:\Work996Git\work996-game\version_first\Envir\*.*  E:\Game996\MirServer\Mir200\Envir\ /I /E

Echo ============== Copy ScriptConfig To Client =================
xcopy /y E:\Work996Git\work996-game\version_first\MirClient\dev\scripts\*.*  E:\Game996\MirClient\dev\scripts\ /I /E

Echo ====== Finish=======

