Para incluir a chave de registro FEATURE\_BROWSER\_EMULATION via Prompt de Comando (CMD), você pode usar o comando REG ADD.

Comando para adicionar a chave (para o IE11/Edge no modo IE)

O comando a seguir adiciona uma entrada para um aplicativo específico (neste exemplo, iexplore.exe) definindo o valor de emulação para 11001 (modo IE11/Edge no modo IE) no nível HKEY\_CURRENT\_USER: 

cmd

REG ADD "HKCU\\Software\\Microsoft\\Internet Explorer\\Main\\FeatureControl\\FEATURE\_BROWSER\_EMULATION" /v iexplore.exe /t REG\_DWORD /d 11001 /f

Observações importantes:

HKCU vs HKLM: O exemplo acima usa HKCU (HKEY\_CURRENT\_USER), que aplica a configuração apenas para o usuário atual. Para aplicar a todos os usuários, substitua HKCU por HKLM (HKEY\_LOCAL\_MACHINE). Isso geralmente requer a execução do CMD como administrador.

Nome do executável: Substitua iexplore.exe pelo nome do arquivo executável (.exe) do seu próprio aplicativo que precisa dessa configuração de emulação específica. Por exemplo, se o seu programa se chama MeuApp.exe, o comando seria:

cmd

REG ADD "HKCU\\Software\\Microsoft\\Internet Explorer\\Main\\FeatureControl\\FEATURE\_BROWSER\_EMULATION" /v MeuApp.exe /t REG\_DWORD /d 11001 /f

Valor 11001: Este valor hexadecimal (0x2af9) força o controle WebBrowser a usar a versão mais recente do motor de renderização do Internet Explorer (IE11/Edge), independentemente do modo de compatibilidade definido pelo usuário. Outros valores representam versões anteriores do IE.

Parâmetros:

/v: Especifica o nome do valor do registro (o nome do executável).

/t: Especifica o tipo de dados (REG\_DWORD para um valor numérico inteiro).

/d: Especifica os dados a serem gravados (o valor de emulação, 11001 neste caso).

/f: Força a substituição de uma entrada existente sem pedir confirmação. 

Para mais detalhes sobre a sintaxe do comando REG ADD, consulte a documentação oficial da Microsoft. 

