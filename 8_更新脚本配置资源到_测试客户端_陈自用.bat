@echo off
Echo ============== Copy ScriptConfig To Client =================
xcopy /y E:\Work996Git\work996-game\version_first\MirClient\dev\scripts\*.*  E:\Game996\MirClient\dev\scripts\ /I /E
xcopy /y E:\Work996Git\work996-game\version_first\MirClient\dev\GUILayout\*.*  E:\Game996\MirClient\dev\GUILayout\ /I /E
xcopy /y E:\Work996Git\work996-game\version_first\MirClient\dev\res\*.*  E:\Game996\MirClient\dev\res\ /I /E
xcopy /y E:\Work996Git\work996-game\version_first\MirClient\dev\anim\*.*  E:\Game996\MirClient\dev\anim\ /I /E
xcopy /y E:\Work996Git\work996-game\version_first\MirClient\dev\data_config\*.*  E:\Game996\MirClient\dev\data_config\ /I /E

Echo ====== Finish=======

