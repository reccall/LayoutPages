REG QUERY "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION" /v "ToDayLayoutPages.exe"
IF %ERRORLEVEL% EQU 0 (
    ECHO O programa já existe no registro. 
) ELSE (
    REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION" /v ToDayLayoutPages.exe /t REG_DWORD /d 11001 /f
)
PAUSE