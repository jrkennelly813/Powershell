﻿$apps = get-content -Path \\ec-nas\EC-IT\Scripts\StartMenuItems.txt
$StartupPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\"

foreach ($app in $apps){
   if(test-path $StartupPath$app){
       Write-Host "Found $app"
        Remove-Item -Path $StartupPath$app
    }
    else{
        Write-Host "Didn't find $app"
    }
}