@echo off
Echo ============== Copy ScriptConfig To Client =================
xcopy /y E:\Work996Git\work996-game\version_first\MirClient\dev\scripts\*.*  E:\Game996\MirClientDebug\dev\scripts\ /I /E
xcopy /y E:\Work996Git\work996-game\version_first\MirClient\dev\GUILayout\*.*  E:\Game996\MirClientDebug\dev\GUILayout\ /I /E

Echo ====== Finish=======

