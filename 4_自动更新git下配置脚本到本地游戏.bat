@echo off
Echo ============== Copy Config To Server EnvirData =================
xcopy /y ".\NewConfig\cfg_att_score.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_custpro_caption.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_equip.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_item.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_magic.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_npclist.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_suit.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_monster.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_mongen.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_store.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_level.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_game_data.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_newtask.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\cfg_setup.xls" "E:\Game996\MirServer\Mir200\Envir\Data\" /I /E
xcopy /y ".\NewConfig\MapInfo.txt" "E:\Game996\MirServer\Mir200\Envir\" /I /E
xcopy /y ".\NewConfig\!Setup.txt" "E:\Game996\MirServer\Mir200\" /I /E


Echo ============== Copy ScriptConfig To Server =================
xcopy /y .\version_first\Envir\*.*  E:\Game996\MirServer\Mir200\Envir\ /I /E

Echo ============== Copy ScriptConfig To Client =================
xcopy /y .\version_first\MirClient\dev\scripts\*.*  E:\Game996\MirClient\dev\scripts\ /I /E
xcopy /y .\version_first\MirClient\dev\res\*.*  E:\Game996\MirClient\dev\res\ /I /E
xcopy /y .\version_first\MirClient\dev\GUILayout\*.*  E:\Game996\MirClient\dev\GUILayout\ /I /E
xcopy /y .\version_first\MirClient\dev\anim\*.*  E:\Game996\MirClient\dev\anim\ /I /E
xcopy /y .\version_first\MirClient\dev\data_config\*.*  E:\Game996\MirClient\dev\data_config\ /I /E

Echo ====== Finish=======

