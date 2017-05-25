mode 140,50
@echo off
Color a
Title Android Job Box v3.00 by ChevyCam94
cd >> tmp.log
set /p current=< tmp.log
del tmp.log
cd %current%\Data

cls
Echo  Please be aware, this the majority of this programs work is done
Echo  in recovery mode.  Because of this, some functions may not work
Echo  as expected when booted in Android.  The use of TWRP 3.x.x-x or
Echo  newer is recommended, and in a couple places, required.
Echo/
Pause

:start
cls
Echo/
Echo    ������  Android Job Box v3.00  ������             \   /
Echo    �    ������ By ChevyCam94 ������    �             �����
Echo    �                                   �           ���������
Echo    �  [1]  Unlock bootloader           �          ��� ��� ���
Echo    �  [2]  Relock bootloader           �          �����������
Echo    �                                   �       �� ����������� ��
Echo    �  [3]  Backup and Restore          �       �����������������
Echo    �                                   �       �����������������
Echo    �  [4]  Install APKs                �       �� ����������� ��
Echo    �                                   �       �� ����������� ��
Echo    �  [5]  Optimizations               �          �����������
Echo    �                                   �            ��� ���
Echo    �  [6]  Flash images                �            ��� ���
Echo    �                                   �            ��� ���
Echo    �������������������������������������
Echo    �                                   �
Echo    �  [r]  Reboot...                   �
Echo    �  [e]  Exit                        �
Echo    �                                   �
Echo    �������������������������������������
Echo/
set /p choice=Select: 
if %choice% == 1 goto unlock
if %choice% == 2 goto relock
if %choice% == 3 goto backuprestore
if %choice% == 4 goto installapks
if %choice% == 5 goto optimizations
if %choice% == 6 goto flash
if %choice% == r goto reboot
if %choice% == e goto exit
if not %choice% == 1 goto start
if not %choice% == 2 goto start
if not %choice% == 3 goto start
if not %choice% == 4 goto start
if not %choice% == 5 goto start
if not %choice% == 6 goto start
if not %choice% == r goto start
if not %choice% == e goto start

:installapks
cls
Echo/
Echo    �����������������������������������������
Echo    �                                       �   ��������
Echo    �  Install APKs:                        �   ۱�������
Echo    �                                       �   ۱����۱�
Echo    �����������������������������������������   ۱����۱�
Echo    �                                       �   ۱�������
Echo    �  [i]  Install from 'APKs' folder      �   ۱�APK���
Echo    �                                       �   ۱�������
Echo    �  [o]  Open 'APKs' folder              �   ���������
Echo    �                                       �
Echo    �����������������������������������������
Echo    �                                       �
Echo    �  [0]  Main menu                       �
Echo    �                                       �
Echo    �����������������������������������������
Echo/
set /p choice=Select: 
if %choice% == i (
  if not exist "%current%\Data\APKs" (
    Echo  'APKs' directory doesnt exist!
    ping localhost -n 3 >NUL
    Goto installapks
  ) else (
    If not exist "%current%\Data\APKs\*.apk" (
      Echo/
      Echo  No APKs found in 'APKs' directory!
      ping localhost -n 3 >NUL
      Goto installapks
    ) else (
      Echo/
      Echo  Installing APKs to device...
      Echo/
      For /R APKs %%G IN (*.apk) do (
        For %%a in ("%%G") do (
          set "filePath=%%~dpa"
          set "file=%%~nxa"
          Echo %%~nxa
        )
        adb install "%%G" >nul 2>&1
      )
    )
  )
  Echo/
  Echo  -= APK INSTALLS COMPLETE =-
  Echo/
  Pause
  Goto installapks
)
if %choice% == o (
  if not exist "%current%\Data\APKs" mkdir "%current%\Data\APKs"
  %SystemRoot%\explorer.exe "%current%\Data\APKs"
  Goto installapks
)
if %choice% == 0 goto start
if not %choice% == a goto installapks
if not %choice% == o goto installapks
if not %choice% == 0 goto installapks

:optimizations
cls
Echo/
Echo    �����������������������������������������
Echo    �                                       �     �������
Echo    �  Optimizations:                       �   ��۱�������
Echo    �                                       �     ۱�����
Echo    �����������������������������������������   ��۱�������
Echo    �                                       �     ۱�����
Echo    �  [a]  Zipalign APKs            (adb)  �   ��۱�������
Echo    �  [o]  Optimize OGGs            (adb)  �     �������
Echo    �                                       �
Echo    �����������������������������������������
Echo    �                                       �
Echo    �  [0]  Main menu                       �
Echo    �                                       �
Echo    �����������������������������������������
Echo/
set /p choice=Select: 
if %choice% == a goto zipalignapk
if %choice% == o goto optimizeogg
if %choice% == 0 goto start
if not %choice% == a goto optimizations
if not %choice% == o goto optimizations
if not %choice% == 0 goto optimizations

:zipalignapk
cls
Echo/
Echo    �����������������������������������������
Echo    �                                       �     �������
Echo    �  Zipalign APKs:                       �   ��۱�������
Echo    �                                       �     ۱�����
Echo    �����������������������������������������   ��۱�������
Echo    �                                       �     ۱�����
Echo    �  [a]  \system\app              (adb)  �   ��۱�������
Echo    �  [p]  \system\priv-app         (adb)  �     �������
Echo    �  [d]  \data\app                (adb)  �
Echo    �                                       �
Echo    �  [oa] Optimize ALL APKs        (adb)  �
Echo    �                                       �
Echo    �����������������������������������������
Echo    �                                       �
Echo    �  [0]  Optimizations menu              �
Echo    �                                       �
Echo    �����������������������������������������
Echo/
set /p choice=Select: 
adb remount >nul 2>&1
Echo/
if %choice% == a (
  Echo  Zipaligning APKs from '\system\app'
  Echo/
  Echo  Pulling APKs...
  if exist TEMP rd /Q /S TEMP
  mkdir TEMP
  adb pull /system/app TEMP >nul 2>&1
  Echo  Removing all non-apk files...
  for /R "%current%\Data\TEMP" %%f in (*) do (if not "%%~xf"==".apk" del "%%~f")
  Echo  Removing all empty directories...
  for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d"
  call :subzipalign
  Echo  Pushing APKs...
  adb push %current%\Data\TEMP\. /system/ >nul 2>&1
  Echo  Cleaning up local temporary files...
  rd /Q /S TEMP >nul 2>&1
  Echo/
  Echo  -= ZIPALIGN COMPLETE =-
  Echo/
  Pause
  goto zipalignapk
)
if %choice% == p (
  Echo/
  Echo  Zipaligning APKs from '\system\priv-app'
  Echo/
  Echo  Pulling APKs...
  if exist TEMP rd /Q /S TEMP
  mkdir TEMP
  adb pull /system/priv-app TEMP >nul 2>&1
  Echo  Removing all non-apk files...
  for /R "%current%\Data\TEMP" %%f in (*) do (if not "%%~xf"==".apk" del "%%~f")
  Echo  Removing all empty directories...
  for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d"
  call :subzipalign
  Echo  Pushing APKs...
  adb push %current%\Data\TEMP\. /system/ >nul 2>&1
  Echo  Cleaning up local temporary files...
  rd /Q /S TEMP >nul 2>&1
  Echo/
  Echo  -= ZIPALIGN COMPLETE =-
  Echo/
  Pause
  goto zipalignapk
)
if %choice% == d (
  Echo/
  Echo  Zipaligning APKs from '\data\app'
  Echo/
  Echo  Pulling APKs...
  if exist TEMP rd /Q /S TEMP
  mkdir TEMP
  adb pull /data/app TEMP
  Echo  Removing all non-apk files...
  for /R "%current%\Data\TEMP" %%f in (*) do (if not "%%~xf"==".apk" del "%%~f")
  Echo  Removing all empty directories...
  for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d"
  call :subzipalign
  Echo  Pushing APKs...
  adb push %current%\Data\TEMP\. /data/ >nul 2>&1
  Echo  Cleaning up local temporary files...
  rd /Q /S TEMP >nul 2>&1
  Echo/
  Echo  -= ZIPALIGN COMPLETE =-
  Echo/
  Pause
  goto zipalignapk
)
if %choice% == oa (
  Echo/
  Echo  Preparing to zipalign ALL APKs...
  Echo/
  Echo  Zipaligning APKs from '\system\app'
  Echo/
  Echo  Pulling APKs...
  if exist TEMP rd /Q /S TEMP
  mkdir TEMP
  adb pull /system/app TEMP >nul 2>&1
  Echo  Removing all non-apk files...
  for /R "%current%\Data\TEMP" %%f in (*) do (if not "%%~xf"==".apk" del "%%~f")
  Echo  Removing all empty directories...
  for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d"
  call :subzipalign
  Echo  Pushing APKs...
  adb push TEMP /system/app >nul 2>&1
  Echo  Cleaning up local temporary files...
  rd /Q /S TEMP >nul 2>&1
  Echo/
  Echo/
  Echo  Zipaligning APKs from '\system\priv-app'
  Echo/
  Echo  Pulling APKs...
  if exist TEMP rd /Q /S TEMP
  mkdir TEMP
  adb pull /system/priv-app TEMP >nul 2>&1
  Echo  Removing all non-apk files...
  for /R "%current%\Data\TEMP" %%f in (*) do (if not "%%~xf"==".apk" del "%%~f")
  Echo  Removing all empty directories...
  for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d"
  call :subzipalign
  Echo  Pushing APKs...
  adb push TEMP /system/priv-app >nul 2>&1
  Echo  Cleaning up local temporary files...
  rd /Q /S TEMP >nul 2>&1
  Echo/
  Echo/
  Echo  Zipaligning APKs from '\data\app'
  Echo/
  Echo  Pulling APKs...
  if exist TEMP rd /Q /S TEMP
  mkdir TEMP
  adb start-server >nul 2>&1
  adb pull /data/app TEMP >nul 2>&1
  Echo  Removing all non-apk files...
  for /R "%current%\Data\TEMP" %%f in (*) do (if not "%%~xf"==".apk" del "%%~f")
  Echo  Removing all empty directories...
  for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d"
  call :subzipalign
  Echo  Pushing APKs...
  adb push TEMP /data/app >nul 2>&1
  Echo  Cleaning up local temporary files...
  rd /Q /S TEMP >nul 2>&1
  Echo/
  Echo  -= ZIPALIGN COMPLETE =-
  Echo/
  Pause
  goto zipalignapk
)
if %choice% == 0 goto optimizations
if not %choice% == a goto zipalignapk
if not %choice% == o goto zipalignapk
if not %choice% == d goto zipalignapk
if not %choice% == oa goto zipalignapk
if not %choice% == 0 goto zipalignapk

:optimizeogg
cls
Echo/
Echo    �����������������������������������������
Echo    �                                       �     �������
Echo    �  Optimizations:                       �   ��۱�������
Echo    �                                       �     ۱�����
Echo    �����������������������������������������   ��۱�������
Echo    �                                       �     ۱�����
Echo    �  -OGG-                                �   ��۱�������
Echo    �  [a]  Optimize ALARMS          (adb)  �     �������
Echo    �  [n]  Optimize NOTIFICATIONS   (adb)  �
Echo    �  [r]  Optimize RINGTONES       (adb)  �
Echo    �  [u]  Optimize UI SOUNDS       (adb)  �
Echo    �                                       �
Echo    �  [aa] Optimize ALL AUDIO       (adb)  �
Echo    �                                       �
Echo    �����������������������������������������
Echo    �                                       �
Echo    �  [0]  Optimizations menu              �
Echo    �                                       �
Echo    �����������������������������������������
Echo/
set /p choice=Select: 
adb remount >nul 2>&1
Echo/
if %choice% == a (
  call :suboggpreopt
  Echo  Pulling alarms files...
  adb pull /system/media/audio/alarms/ %current%\Data\OGG >nul 2>&1
  move %current%\Data\OGG\alarms\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\alarms
  call :suboggopt
  Echo  Finished compression...
  Echo  Pushing optimized audio back to device...
  adb push %current%\Data\OGG\. /system/media/audio/alarms/ >nul 2>&1
  call :suboggpostopt
  goto optimizeogg
)
if %choice% == n (
  call :suboggpreopt
  Echo  Pulling notifications files...
  adb pull /system/media/audio/notifications/ %current%\Data\OGG >nul 2>&1
  move %current%\Data\OGG\notifications\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\notifications >nul 2>&1
  call :suboggopt
  Echo  Finished compression...
  Echo  Pushing optimized audio back to device...
  adb push %current%\Data\OGG\. /system/media/audio/notifications/ >nul 2>&1
  call :suboggpostopt
  goto optimizeogg
)
if %choice% == r (
  call :suboggpreopt
  Echo  Pulling ringtones files...
  adb pull /system/media/audio/ringtones/ %current%\Data\OGG >nul 2>&1
  move %current%\Data\OGG\ringtones\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\ringtones >nul 2>&1
  call :suboggopt
  Echo  Finished compression...
  Echo  Pushing optimized audio back to device...
  adb push %current%\Data\OGG\. /system/media/audio/ringtones/ >nul 2>&1
  call :suboggpostopt
  goto optimizeogg
)
if %choice% == u (
  call :suboggpreopt
  Echo  Pulling ui files...
  adb pull /system/media/audio/ui/ %current%\Data\OGG >nul 2>&1
  move %current%\Data\OGG\ui\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\ui >nul 2>&1
  call :suboggopt
  Echo  Finished compression...
  Echo  Pushing optimized audio back to device...
  adb push %current%\Data\OGG\. /system/media/audio/ui/ >nul 2>&1
  call :suboggpostopt
  goto optimizeogg
)
if %choice% == aa (
  Echo  Pulling ALARMS...
  adb pull /system/media/audio/notifications/ %current%\Data\OGG >nul 2>&1
  move %current%\Data\OGG\notifications\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\notifications >nul 2>&1
  Echo  Optimizing ALARMS...
  call :suboggopt
  Echo  Pushing ALARMS...
  adb push %current%\Data\OGG\. /system/media/audio/alarms/ >nul 2>&1
  rmdir /S /Q %current%\Data\OGG
  Echo/
  Echo  Pulling NOTIFICATIONS...
  adb pull /system/media/audio/notifications/ %current%\Data\OGG >nul 2>&1
  move %current%\Data\OGG\notifications\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\notifications >nul 2>&1
  Echo  Optimizing NOTIFICATIONS...
  call :suboggopt
  Echo  Pushing NOTIFICATIONS...
  adb push %current%\Data\OGG\. /system/media/audio/alarms/ >nul 2>&1
  rmdir /S /Q %current%\Data\OGG
  Echo/
  Echo  Pulling RINGTONES...
  adb pull /system/media/audio/ringtones/ %current%\Data\OGG >nul 2>&1
  move %current%\Data\OGG\ringtones\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\ringtones >nul 2>&1
  Echo  Optimizing RINGTONES...
  call :suboggopt
  Echo  Pushing RINGTONES...
  adb push %current%\Data\OGG\. /system/media/audio/ringtones/ >nul 2>&1
  rmdir /S /Q %current%\Data\OGG
  Echo/
  Echo  Pulling UI...
  adb pull /system/media/audio/ui/ %current%\Data\OGG >nul 2>&1
  move %current%\Data\OGG\ui\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\ui >nul 2>&1
  Echo  Optimizing UI...
  call :suboggopt
  Echo  Pushing UI...
  adb push %current%\Data\OGG\. /system/media/audio/ui/ >nul 2>&1
  rmdir /S /Q %current%\Data\OGG
  Echo/
  Echo  All audio optimizations complete!
  Pause
  goto optimizeogg
)
if %choice% == 0 goto optimizations
if not %choice% == a goto optimizeogg
if not %choice% == n goto optimizeogg
if not %choice% == r goto optimizeogg
if not %choice% == u goto optimizeogg
if not %choice% == aa goto optimizeogg
if not %choice% == 0 goto optimizeogg

:unlock
cls
Echo/
Echo    �����������������������������������
Echo    �                                 �      ���
Echo    �  Unlock bootloader:             �     �   �
Echo    �                                 �     �   �
Echo    �  [1]  fastboot flashing unlock  �         �
Echo    �  [2]  fastboot oem unlock       �    �������
Echo    �                                 �    �������
Echo    �  [0]  Main menu                 �    �������
Echo    �                                 �    �������
Echo    �����������������������������������
Echo/
set /p choice=Select: 
if %choice% == 1 goto ffu
if %choice% == 2 (
  Echo/
  fastboot oem unlock
  Echo/
  goto start
)
if %choice% == 0 goto start
if not %choice% == 1 goto unlock
if not %choice% == 2 goto unlock
if not %choice% == 0 goto unlock

:ffu
cls
Echo/
Echo    �������������������������������������
Echo    �                                   �      ���
Echo    �  Unlock bootloader:               �     �   �
Echo    �                                   �     �   �
Echo    �  [1]  WITH backup     (adb)       �         �
Echo    �  [2]  WITHOUT backup  (fastboot)  �    �������
Echo    �                                   �    �������
Echo    �  [0]  Unlock menu                 �    �������
Echo    �                                   �    �������
Echo    �������������������������������������
Echo/
set /p choice=Select: 
if %choice% == 1 (
  call :subfullbackup
  adb reboot bootloader
  fastboot flashing unlock
  Pause
  goto start
)
if %choice% == 2 (
  Echo/
  fastboot flashing unlock
  Echo/
  Pause
  goto start
)
if %choice% == 0 goto unlock
if not %choice% == 1 goto ffu
if not %choice% == 2 goto ffu
if not %choice% == 0 goto ffu

:relock
cls
Echo/
Echo    ���������������������������������
Echo    �                               �
Echo    �  Relock bootloader:           �      ���
Echo    �                               �     �   �
Echo    �  [1]  fastboot flashing lock  �     �   �
Echo    �  [2]  fastboot oem lock       �    �������
Echo    �                               �    �������
Echo    �  [0]  Main menu               �    �������
Echo    �                               �    �������
Echo    ���������������������������������
Echo/
set /p choice=Select: 
if %choice% == 1 goto ffl
if %choice% == 2 (
  Echo/
  fastboot oem lock
  Echo/
  Pause
  goto start
)
if %choice% == 0 goto start
if not %choice% == 1 goto relock
if not %choice% == 2 goto relock
if not %choice% == 0 goto relock

:ffl
cls
Echo/
Echo    �������������������������������������
Echo    �                                   �
Echo    �  Relock bootloader:               �      ���
Echo    �                                   �     �   �
Echo    �  [1]  WITH backup     (adb)       �     �   �
Echo    �  [2]  WITHOUT backup  (fastboot)  �    �������
Echo    �                                   �    �������
Echo    �  [0]  Relock menu                 �    �������
Echo    �                                   �    �������
Echo    �������������������������������������
Echo/
set /p choice=Select: 
if %choice% == 1 (
  call :subfullbackup
  fastboot flashing lock
  Pause
  goto start
)
if %choice% == 2 (
  Echo/
  fastboot flashing lock
  Echo/
  Pause
  goto start
)
if %choice% == 0 goto relock
if not %choice% == 1 goto ffl
if not %choice% == 2 goto ffl
if not %choice% == 0 goto ffl

:backuprestore
cls
Echo/
Echo    �����������������������������
Echo    �                           �
Echo    �  Backup and Restore:      �
Echo    �                           �     ���                    ���
Echo    �  [b]  Backup...           �    ۱������         �     ۱������
Echo    �  [r]  Restore...          �    ۱������          �    ۱������
Echo    �                           �    ۱������   ���������   ۱������
Echo    �  [o]  Open backup folder  �    ۱������          �    ۱������
Echo    �                           �    ��������         �     ��������
Echo    �  [0]  Main menu           �
Echo    �                           �
Echo    �����������������������������
Echo/
set /p choice=Select: 
if %choice% == b goto backup
if %choice% == r goto restore
if %choice% == o (
  %SystemRoot%\explorer.exe "%current%\Backup"
  goto backuprestore
)
if %choice% == 0 goto start
if not %choice% == b goto backuprestore
if not %choice% == r goto backuprestore
if not %choice% == o goto backuprestore
if not %choice% == 0 goto backuprestore

:backup
cls
Echo/
Echo    ���������������������������������������
Echo    �                                     �
Echo    �   The following are pulled from     �
Echo    �    -= INTERNAL STORAGE ONLY =-      �
Echo    �                                     �
Echo    ���������������������������������������
Echo    �                                     �
Echo    �  Backup:                            �
Echo    �                                     �
Echo    �  [f]  Full Backup                   �
Echo    �                                     �
Echo    �  [d]  Downloads                     �
Echo    �  [p]  Pictures                      �
Echo    �  [v]  Videos                        �
Echo    �  [m]  Music                         �
Echo    �                                     �
Echo    �  [a]  Application data              �
Echo    �                                     �
Echo    �  [0]  Backup/Restore menu           �
Echo    �                                     �
Echo    ���������������������������������������
Echo/
cd %current%\Data
set /p choice=Select: 
if %choice% == f (
  call :subfullbackup
  goto backup
)
if %choice% == d (
  Echo/
  if not exist "%current%\Backup\Files\Download" mkdir "%current%\Backup\Files\Download"
  adb pull /sdcard/Download "%current%\Backup\Files\Download" >nul 2>&1
  Echo/
  Pause
  goto backup
)
if %choice% == p (
  Echo/
  if not exist "%current%\Backup\Files\Pictures" mkdir "%current%\Backup\Files\Pictures"
  if not exist "%current%\Backup\Files\DCIM\Camera" mkdir "%current%\Backup\Files\DCIM\Camera"
  adb pull /sdcard/Pictures "%current%\Backup\Files\Pictures" >nul 2>&1
  adb pull /sdcard/DCIM/Camera "%current%\Backup\Files\DCIM\Camera" >nul 2>&1
  Echo/
  Pause
  goto backup
)
if %choice% == m (
  Echo/
  if not exist "%current%\Backup\Files\Music" mkdir "%current%\Backup\Files\Music"
  adb pull /sdcard/Music "%current%\Backup\Files\Music" >nul 2>&1
  Echo/
  Pause
  goto backup
)
if %choice% == v (
  Echo/
  if not exist "%current%\Backup\Files\Video" mkdir "%current%\Backup\Files\Video"
  if not exist "%current%\Backup\Files\Videos" mkdir "%current%\Backup\Files\Videos"
  adb pull /sdcard/Video "%current%\Backup\Files\Video" >nul 2>&1
  adb pull /sdcard/Videos "%current%\Backup\Files\Videos" >nul 2>&1
  Echo/
  Pause
  goto backup
)
if %choice% == a (
  Echo/
  if not exist "%current%\Backup\Files\Android" mkdir "%current%\Backup\Files\Android"
  adb pull /sdcard/Android "%current%\Backup\Files\Android" >nul 2>&1
  Echo/
  Pause
  goto backup
)
if %choice% == 0 goto backuprestore
if not %choice% == f goto backup
if not %choice% == d goto backup
if not %choice% == p goto backup
if not %choice% == m goto backup
if not %choice% == v goto backup
if not %choice% == a goto backup
if not %choice% == 0 goto backup

:restore
cls
Echo/
Echo    ���������������������������������������
Echo    �                                     �
Echo    �    The following are pushed to      �
Echo    �    -= INTERNAL STORAGE ONLY =-      �
Echo    �                                     �
Echo    ���������������������������������������
Echo    �                                     �
Echo    �  Restore:                           �
Echo    �                                     �
Echo    �  [f]  Full Restore                  �
Echo    �                                     �
Echo    �  [d]  Downloads                     �
Echo    �  [p]  Pictures                      �
Echo    �  [v]  Videos                        �
Echo    �  [m]  Music                         �
Echo    �                                     �
Echo    �  [a]  Application data              �
Echo    �                                     �
Echo    �  [0]  Backup/Restore menu           �
Echo    �                                     �
Echo    ���������������������������������������
Echo/
set /p choice=Select: 
if %choice% == f (
Echo/
if not exist "%current%\Backup\Full_Backup" do (
  Echo  No backup to push back to device!
  Pause
  Goto restore
) else (
  Echo  Performing a full restore to '/sdcard/'
  Echo/
  Echo  Depending on how much data you have,
  Echo  this could take a couple hours.
  Echo/
  Echo  Restoring...
  adb push "%current%\Backup\Full_Backup" /sdcard >nul 2>&1
  Echo/
  Echo  -= RESTORE COMPLETE =-
  Pause
  goto restore
)
)
if %choice% == d (
Echo/
  if not exist "%current%\Backup\Files\Download" (
    Echo  Nothing in "Download"
    ping localhost -n 2 >NUL
    goto restore
  ) else (
    adb push "%current%\Backup\Files\Download" /sdcard/Download >nul 2>&1
    Pause
    goto restore
  )
if %choice% == p (
Echo/
  if not exist "%current%\Backup\Files\Pictures" (
    Echo  Nothing in "Pictures"
    ping localhost -n 2 >NUL
  ) else (
    adb push "%current%\Backup\Files\Pictures" /sdcard/Pictures >nul 2>&1
    Echo/
  )
  if not exist "%current%\Backup\Files\DCIM\Camera" (
    Echo  Nothing in "DCIM\Camera"
    ping localhost -n 2 >NUL
    goto restore
  ) else (
    adb push "%current%\Backup\Files\DCIM\Camera" /sdcard/DCIM/Camera >nul 2>&1
    Pause
    goto restore
  )
)
if %choice% == m (
Echo/
  if not exist "%current%\Backup\Files\Music" (
    Echo  Nothing in "Music"
    ping localhost -n 2 >NUL
  ) else (
    adb push "%current%\Backup\Files\Music" /sdcard/Music >nul 2>&1
    Pause
    goto restore
  )
)
if %choice% == v (
Echo/
  if not exist "%current%\Backup\Files\Video" (
    Echo  Nothing in "Video"
    ping localhost -n 2 >NUL
  ) else (
    adb push "%current%\Backup\Files\Video" /sdcard/Video >nul 2>&1
    Echo/
  )
  if not exist "%current%\Backup\Files\Videos" (
    Echo  Nothing in "Videos"
    ping localhost -n 2 >NUL
    goto restore
  ) else (
    adb push "%current%\Backup\Files\Videos" /sdcard/Videos >nul 2>&1
    Pause
    goto restore
  )
)
if %choice% == a (
Echo/
  if not exist "%current%\Backup\Files\Android" (
    Echo  Nothing in "Android"
    ping localhost -n 2 >NUL
  ) else (
    adb push "%current%\Backup\Files\Android" /sdcard/Android >nul 2>&1
    Pause
    goto restore
  )
)
if %choice% == 0 goto backuprestore
if not %choice% == f goto restore
if not %choice% == d goto restore
if not %choice% == p goto restore
if not %choice% == m goto restore
if not %choice% == v goto restore
if not %choice% == a goto restore
if not %choice% == 0 goto restore

:reboot
cls
Echo/
Echo    �������������������������������������������         ��������
Echo    �                                         �       ��        ��
Echo    �  Choose reboot method:                  �      �            �
Echo    �                                         �     �
Echo    �  [ra]  Reboot device (via adb)          �    �               �
Echo    �  [rf]  Reboot device (via fastboot)     �    �              ���
Echo    �  [rr]  Reboot into recovery             �    �             � � �
Echo    �  [rb]  Reboot into bootloader           �    �               �
Echo    �                                         �     �              �
Echo    �  [0]   Main menu                        �      �            �
Echo    �                                         �       ��        ��
Echo    �������������������������������������������         ��������
Echo/
set /p choice=Select: 
if %choice% == rda goto ra
if %choice% == rdf goto rf
if %choice% == rr goto rr
if %choice% == rb goto rb
if %choice% == 0 goto start
if not %choice% == ra goto reboot
if not %choice% == rf goto reboot
if not %choice% == rr goto reboot
if not %choice% == rb goto reboot
if not %choice% == 0 goto reboot

:rf
cls
Echo/
Echo    �������������������������������
Echo    �                             �
Echo    �  Reboot device?             �
Echo    �  Must be in "fastboot"      �
Echo    �                             �
Echo    �    Abort with CTRL+C        �
Echo    �                             �
Echo    �������������������������������
Echo/
Pause
Echo/
fastboot reboot
goto reboot

:ra
cls
Echo/
Echo    �������������������������������
Echo    �                             �
Echo    �  Reboot device?             �
Echo    �  Must NOT be in "fastboot"  �
Echo    �                             �
Echo    �    Abort with CTRL+C        �
Echo    �                             �
Echo    �������������������������������
Echo/
Pause
Echo/
adb reboot
goto reboot

:rr
cls
Echo/
Echo    �������������������������������
Echo    �                             �
Echo    �  Reboot into recovery?      �
Echo    �  Must NOT be in "fastboot"  �
Echo    �                             �
Echo    �    Abort with CTRL+C        �
Echo    �                             �
Echo    �������������������������������
Echo/
Pause
Echo/
adb reboot recovery
goto reboot

:rb
cls
Echo/
Echo    �������������������������������
Echo    �                             �
Echo    �  Reboot into bootloader?    �
Echo    �  Must NOT be in "fastboot"  �
Echo    �                             �
Echo    �    Abort with CTRL+C        �
Echo    �                             �
Echo    �������������������������������
Echo/
Pause
Echo/
adb reboot bootloader
goto reboot

:flash
cls
Echo/
Echo    ������������������������������
Echo    �                            �    ��������
Echo    �  Flash images:             �    ۱������               �����
Echo    �                            �    ۱������         �     ۱���
Echo    �  [fr]  Flash recovery      �    ۱������          �    ۱���
Echo    �                            �    ��������   ���������   ۱���
Echo    �  [0]   Main menu           �    �######�          �    ۱���
Echo    �                            �    ��������         �     �����
Echo    ������������������������������
Echo/
set /p choice=Select: 
if %choice% == fr goto flashrecovery
if %choice% == 0 goto start
if not %choice% == fr goto flash
if not %choice% == 0 goto flash

:flashrecovery
cls
Echo/
Echo    ��������������������������������������
Echo    �                                    �    ��������
Echo    �  Flash recovery:                   �    ۱������               �����
Echo    �                                    �    ۱������         �     ۱���
Echo    �  [fr]  "recovery.img"  (fastboot)  �    ۱������          �    ۱���
Echo    �        (in /Data)                  �    ��������   ���������   ۱���
Echo    �                                    �    �######�          �    ۱���
Echo    �  [0]   Flash menu                  �    ��������         �     �����
Echo    �                                    �
Echo    ��������������������������������������
Echo/
set /p choice=Select: 
if %choice% == fr (
  Echo/
  fastboot flash recovery "%current%/Data/recovery.img"
  Echo/
  Pause
  goto start
)
if %choice% == 0 goto flash
if not %choice% == fr goto flashrecovery
if not %choice% == 0 goto flashrecovery

:suboggpreopt
  if exist %current%\Data\OGG del /Q %current%\Data\OGG
  @md OGG
  cls
  Echo/
Goto :eof

:suboggopt
  Echo  Optimizing audio files...
  for %%a in ("%current%\Data\OGG\*.ogg") do (
    sox.exe %%a -C 0 "%%a"
  )
Goto :eof

:suboggpostopt
  @rmdir /S /Q %current%\Data\OGG
  Echo/
  Echo  Optimizations complete!
  Pause
Goto :eof

:subzipalign
  Echo  Zipaligning apks...
  REM  #### THIS IS FOR NEWER SYSTEMS
  For /R TEMP\* %%G IN (*.apk) do (
    zipalign -f 4 %%G %%G_zipaligned
    del %%G
    copy %%G_zipaligned %%G
    del %%G_zipaligned
  )
  REM  #### THIS IS FOR OLDER SYSTEMS
  For /R TEMP %%G IN (*.apk) do (
    zipalign -f 4 %%G %%G_zipaligned
    del %%G
    copy %%G_zipaligned %%G
    del %%G_zipaligned
  )
Goto :eof

:subfullbackup
if exist %current%\Backup\Full_Backup (
  :backupfolderexists
  cls
  Echo/
  Echo    ����������������������������������������������������������
  Echo    �                                                        �
  Echo    �  Backup folder already exists!                         �
  Echo    �                                                        �
  Echo    �  [o]  Overwrite local files with current device files  �
  Echo    �  [w]  Wipe current local backup and start fresh        �
  Echo    �                                                        �
  Echo    �  [0]  Backup menu                                      �
  Echo    �                                                        �
  Echo    ����������������������������������������������������������
  Echo/
  set /p option=Select: 
  if %option% == o (
    cls
    Echo  Merging device files with existing local files
    Echo/
    Echo  Depending on how much data you have,
    Echo  this could take a couple hours.
    Echo/
    Echo  Backing up...
    adb pull /sdcard/ "%current%\Backup\Full_Backup" >nul 2>&1
    Echo/
    Echo  -= BACKUP COMPLETE =-
    Pause
    Goto :eof
  )
  if %option% == w (
    cls
    Echo/
    Echo  Removing all current local files in 'Full_Backup'
    rmdir /S /Q "%current%\Backup\Full_Backup" >nul 2>&1
    Echo/
    Echo  Depending on how much data you have,
    Echo  this could take a couple hours.
    Echo/
    Echo  Backing up...
    adb pull /sdcard/ "%current%\Backup\Full_Backup" >nul 2>&1
    Echo/
    Echo  -= BACKUP COMPLETE =-
    Pause
    Goto :eof
  )
  if %option% == 0 goto :eof
  if not %option% == o goto backupfolderexists
  if not %option% == w goto backupfolderexists
  if not %option% == 0 goto backupfolderexists
)
)
    cls
    Echo/
    Echo  Depending on how much data you have,
    Echo  this could take a couple hours.
    Echo/
    Echo  Backing up...
    adb pull /sdcard/ "%current%\Backup\Full_Backup" >nul 2>&1
    Echo/
    Echo  -= BACKUP COMPLETE =-
    Pause
Goto :eof

:exit
cls
Echo/
Echo    ���������������������������������������������������������
Echo    �                                                       ��
Echo    �        Thank you for choosing Android Job Box!        ۱�
Echo    �  If you found this helpful, please consider donating  ۱�
Echo    �                                                       ۱�
Echo    �    No part of this script may be copied, modified     ۱�
Echo    �    redistributed, or included anywhere without my     ۱�
Echo    �               explicit written consent.               ۱�
Echo    �                                                       ۱�
Echo    �   Credit to Lexmazter for the original script base    ۱�
Echo    �   Credit to Chris Bagwell for SOX                     ۱�
Echo    �   Credit to Google for the adb/fastboot binaries      ۱�
Echo    �                                                       ۱�
Echo    ��������������������������������������������������������۱�
Echo     ۱��������������������������������������������������������
Echo      ���������������������������������������������������������
Echo/
@ping localhost -n 3 >NUL
exit