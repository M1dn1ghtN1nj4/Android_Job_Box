mode 140,50
@echo off
Color a
Title Android Job Box v1.50 by ChevyCam94
cd >> tmp.log
set /p current=< tmp.log
del tmp.log
cd %current%\Data

:start
cls
Echo.
Echo    ������������ Android Job Box v1.50 ������������             \   /
Echo    �          ����� By ChevyCam94 �����          �             �����
Echo    �                                             �           ���������
Echo    �  [1]  Unlock bootloader         (fastboot)  �          ��� ��� ���
Echo    �  [2]  Relock bootloader         (fastboot)  �          �����������
Echo    �  [3]  Backup and Restore...                 �       �� ����������� ��
Echo    �  [4]  Optimizations...                      �       �����������������
Echo    �  [5]  Flash images...                       �       �����������������
Echo    �                                             �       �� ����������� ��
Echo    �����������������������������������������������       �� ����������� ��
Echo    �                                             �          �����������
Echo    �  [r]  Reboot...                             �            ��� ���
Echo    �  [e]  Exit                                  �            ��� ���
Echo    �                                             �            ��� ���
Echo    �����������������������������������������������
Echo.
set /p choice=Select: 
if %choice% == 1 goto unlock
if %choice% == 2 goto relock
if %choice% == 3 goto backuprestore
if %choice% == 4 goto optimizations
if %choice% == 5 goto flash
if %choice% == r goto reboot
if %choice% == e goto exit
if not %choice% == 1 goto start
if not %choice% == 2 goto start
if not %choice% == 3 goto start
if not %choice% == 4 goto start
if not %choice% == 5 goto start
if not %choice% == d goto start
if not %choice% == r goto start
if not %choice% == e goto start

:optimizations
cls
Echo.
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
Echo.
@echo off
set /p choice=Select: 
if %choice% == a (
goto zipalignapk
)
if %choice% == o (
goto optimizeogg
)
if %choice% == 0 goto start
if not %choice% == a goto optimizations
if not %choice% == o goto optimizations
if not %choice% == 0 goto optimizations

:zipalignapk
cls
Echo.
Echo    �����������������������������������������
Echo    �                                       �     �������
Echo    �  Zipalign APKs:                       �   ��۱�������
Echo    �                                       �     ۱�����
Echo    �����������������������������������������   ��۱�������
Echo    �                                       �     ۱�����
Echo    �  [a]  \system\app              (adb)  �   ��۱�������
Echo    �  [p]  \system\priv-app         (adb)  �     �������
Echo    �                                       �
Echo    �����������������������������������������
Echo    �                                       �
Echo    �  [0]  Optimizations menu              �
Echo    �                                       �
Echo    �����������������������������������������
Echo.
@echo off
set /p choice=Select: 
if %choice% == a (
  Echo.
  Echo  Zipaligning APKs from '\system\app'
  Echo.
  Echo  Pulling APKs...
  if exist TEMP rd /Q /S TEMP
  mkdir TEMP
  adb start-server >nul 2>&1
  adb pull /system/app TEMP >nul 2>&1
  del /Q /S *.so >nul 2>&1
  Echo  Zipaligning...
  For /R TEMP %%G IN (*.apk) do (
    zipalign -f 4 %%G %%G_zipaligned >nul 2>&1
    zipalign -c -v 4 %%G_zipaligned >nul 2>&1
    del %%G >nul 2>&1
    copy %%G_zipaligned %%G >nul 2>&1
    del %%G_zipaligned >nul 2>&1
  )
  Echo  Pushing APKs...
  adb push TEMP /system/app >nul 2>&1
  Echo  Cleaning up local temporary files...
  rd /Q /S TEMP >nul 2>&1
  Echo.
  Echo  -= ZIPALIGN COMPLETE =-
  Echo.
  Pause
  goto zipalignapk
)
if %choice% == p (
  Echo.
  Echo  Zipaligning APKs from '\system\priv-app'
  Echo.
  Echo  Pulling APKs...
  if exist TEMP rd /Q /S TEMP
  mkdir TEMP
  adb start-server >nul 2>&1
  adb pull /system/priv-app TEMP >nul 2>&1
  del /Q /S *.so >nul 2>&1
  Echo  Zipaligning...
  For /R TEMP %%G IN (*.apk) do (
    zipalign -f 4 %%G %%G_zipaligned >nul 2>&1
    zipalign -c -v 4 %%G_zipaligned >nul 2>&1
    del %%G >nul 2>&1
    copy %%G_zipaligned %%G >nul 2>&1
    del %%G_zipaligned >nul 2>&1
  )
  Echo  Pushing APKs...
  adb push TEMP /system/priv-app >nul 2>&1
  Echo  Cleaning up local temporary files...
  rd /Q /S TEMP >nul 2>&1
  Echo.
  Echo  -= ZIPALIGN COMPLETE =-
  Echo.
  Pause
  goto zipalignapk
)
if %choice% == 0 goto optimizations
if not %choice% == a goto zipalignapk
if not %choice% == o goto zipalignapk
if not %choice% == 0 goto zipalignapk

:optimizeogg
cls
Echo.
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
Echo.
@echo off
set /p choice=Select: 
if %choice% == a (
  if exist OGG del /Q OGG
  @md OGG
  cls
  Echo.
  Echo  Mounting system R/W...
  adb remount
  Echo.
  Echo  Pulling audio files...
  adb pull /system/media/audio/alarms/ .
  for %%a in ("*.ogg") do (
    Echo %%a
    sox.exe %%a -C 0 "%current%\Data\OGG\%%a"
  )
  Echo.
  Echo  Pushing optimized audio back to device...
  adb push OGG /system/media/audio/alarms
  @rmdir /S /Q OGG
  @del *.ogg
  Echo.
  Echo  Optimizations complete!
  Pause
  goto optimizeogg
)
if %choice% == n (
  if exist OGG del /Q OGG
  @md OGG
  cls
  Echo.
  Echo  Mounting system R/W...
  adb remount
  Echo.
  Echo  Pulling audio files...
  adb pull /system/media/audio/notifications/ .
  for %%a in ("*.ogg") do (
    Echo %%a
    sox.exe %%a -C 0 "%current%\Data\OGG\%%a"
  )
  Echo.
  Echo  Pushing optimized audio back to device...
  adb push OGG /system/media/audio/notifications
  @rmdir /S /Q OGG
  @del *.ogg
  Echo.
  Echo  Optimizations complete!
  Pause
  goto optimizeogg
)
if %choice% == r (
  if exist OGG del /Q OGG
  @md OGG
  cls
  Echo.
  Echo  Mounting system R/W...
  adb remount
  Echo.
  Echo  Pulling audio files...
  adb pull /system/media/audio/ringtones/ .
  for %%a in ("*.ogg") do (
    Echo %%a
    sox.exe %%a -C 0 "%current%\Data\OGG\%%a"
  )
  Echo.
  Echo  Pushing optimized audio back to device...
  adb push OGG /system/media/audio/ringtones
  @rmdir /S /Q OGG
  @del *.ogg
  Echo.
  Echo  Optimizations complete!
  Pause
  goto optimizeogg
)
if %choice% == u (
  if exist OGG del /Q OGG
  @md OGG
  cls
  Echo.
  Echo  Mounting system R/W...
  adb remount
  Echo.
  Echo  Pulling audio files...
  adb pull /system/media/audio/ui/ .
  for %%a in ("*.ogg") do (
    Echo %%a
    sox.exe %%a -C 0 "%current%\Data\OGG\%%a"
  )
  Echo.
  Echo  Pushing optimized audio back to device...
  adb push OGG /system/media/audio/ui
  @rmdir /S /Q OGG
  @del *.ogg
  Echo.
  Echo  Optimizations complete!
  Pause
  goto optimizeogg
)
if %choice% == aa (
  if exist OGG del /Q OGG
  @md OGG
  cls
  Echo.
  Echo  Mounting system R/W...
  adb remount
  Echo.
  Echo  Pulling ALARMS audio files...
  adb pull /system/media/audio/alarms/ .
  for %%a in ("*.ogg") do (
    Echo %%a
    sox.exe %%a -C 0 "%current%\Data\OGG\%%a"
  )
  Echo.
  Echo  Pushing optimized ALARMS back to device...
  adb push OGG /system/media/audio/alarms
  @rmdir /S /Q OGG
  @del *.ogg
  @md OGG
  Echo.
  Echo  Pulling NOTIFICATIONS audio files...
  adb pull /system/media/audio/notifications/ .
  for %%a in ("*.ogg") do (
    Echo %%a
    sox.exe %%a -C 0 "%current%\Data\OGG\%%a"
  )
  Echo.
  Echo  Pushing optimized NOTIFICATIONS back to device...
  adb push OGG /system/media/audio/notifications
  @rmdir /S /Q OGG
  @del *.ogg
  @md OGG
  Echo.
  Echo  Pulling RINGTONES audio files...
  adb pull /system/media/audio/ringtones/ .
  for %%a in ("*.ogg") do (
    Echo %%a
    sox.exe %%a -C 0 "%current%\Data\OGG\%%a"
  )
  Echo.
  Echo  Pushing optimized RINGTONES back to device...
  adb push OGG /system/media/audio/ringtones
  @rmdir /S /Q OGG
  @del *.ogg
  @md OGG
  Echo.
  Echo  Pulling UI audio files...
  adb pull /system/media/audio/ui/ .
  for %%a in ("*.ogg") do (
    Echo %%a
    sox.exe %%a -C 0 "%current%\Data\OGG\%%a"
  )
  Echo.
  Echo  Pushing optimized UI back to device...
  adb push OGG /system/media/audio/ui
  @rmdir /S /Q OGG
  @del *.ogg
  @md OGG
  Echo.
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
Echo.
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
Echo.
@echo off
set /p choice=Select: 
if %choice% == 1 goto ffu
)
if %choice% == 2 (
Echo.
fastboot oem unlock
Echo.
goto start
)
if %choice% == 0 goto start
if not %choice% == 1 goto unlock
if not %choice% == 2 goto unlock
if not %choice% == 0 goto unlock

:ffu
cls
Echo.
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
Echo.
@echo off
set /p choice=Select: 
if %choice% == 1 (
Echo.
set /p backupname=Enter a name for your backup: 
adb backup -all -f "%current%\Backup\%backupname%.ab"
adb reboot bootloader
fastboot flashing unlock
Pause
goto start
)
if %choice% == 2 (
Echo.
fastboot flashing unlock
Echo.
Pause
goto start
)
if %choice% == 0 goto unlock
if not %choice% == 1 goto ffu
if not %choice% == 2 goto ffu
if not %choice% == 0 goto ffu

:relock
cls
Echo.
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
Echo.
@echo off
set /p choice=Select: 
if %choice% == 1 goto ffl
)
if %choice% == 2 (
Echo.
fastboot oem lock
Echo.
Pause
goto start
)
if %choice% == 0 goto start
if not %choice% == 1 goto relock
if not %choice% == 2 goto relock
if not %choice% == 0 goto relock

:ffl
cls
Echo.
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
Echo.
@echo off
set /p choice=Select: 
if %choice% == 1 (
Echo.
set /p backupname=Enter a name for your backup: 
adb backup -all -f "%current%\Backup\%backupname%.ab"
fastboot flashing lock
Pause
goto start
)
if %choice% == 2 (
Echo.
fastboot flashing lock
Echo.
Pause
goto start
)
if %choice% == 0 goto relock
if not %choice% == 1 goto ffl
if not %choice% == 2 goto ffl
if not %choice% == 0 goto ffl

:backuprestore
cls
Echo.
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
Echo.
set /p choice=Select: 
if %choice% == b goto backup
if %choice% == r goto restore
if %choice% == o goto open
if %choice% == 0 goto start
if not %choice% == b goto backuprestore
if not %choice% == r goto backuprestore
if not %choice% == o goto backuprestore
if not %choice% == 0 goto backuprestore

:backup
cls
Echo.
Echo    ���������������������������������������
Echo    �                                     �
Echo    �   The following are pulled from     �
Echo    �    -= INTERNAL STORAGE ONLY =-      �
Echo    �                                     �
Echo    ���������������������������������������
Echo    �                                     �
Echo    �  Backup:                            �
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
Echo.
set /p choice=Select: 
if %choice% == d (
Echo.
if not exist "%current%\Backup\Files\Download" mkdir "%current%\Backup\Files\Download"
adb pull /sdcard/Download "%current%\Backup\Files\Download"
Echo.
Pause
goto backup
)
if %choice% == p (
Echo.
if not exist "%current%\Backup\Files\Pictures" mkdir "%current%\Backup\Files\Pictures"
if not exist "%current%\Backup\Files\DCIM\Camera" mkdir "%current%\Backup\Files\DCIM\Camera"
adb pull /sdcard/Pictures "%current%\Backup\Files\Pictures"
adb pull /sdcard/DCIM/Camera "%current%\Backup\Files\DCIM\Camera"
Echo.
Pause
goto backup
)
if %choice% == m (
Echo.
if not exist "%current%\Backup\Files\Music" mkdir "%current%\Backup\Files\Music"
adb pull /sdcard/Music "%current%\Backup\Files\Music"
Echo.
Pause
goto backup
)
if %choice% == v (
Echo.
if not exist "%current%\Backup\Files\Video" mkdir "%current%\Backup\Files\Video"
if not exist "%current%\Backup\Files\Videos" mkdir "%current%\Backup\Files\Videos"
adb pull /sdcard/Video "%current%\Backup\Files\Video"
adb pull /sdcard/Videos "%current%\Backup\Files\Videos"
Echo.
Pause
goto backup
)
if %choice% == a (
Echo.
if not exist "%current%\Backup\Files\Android" mkdir "%current%\Backup\Files\Android"
adb pull /sdcard/Android "%current%\Backup\Files\Android"
Echo.
Pause
goto backup
)
if %choice% == 0 goto backuprestore
if not %choice% == d goto backup
if not %choice% == p goto backup
if not %choice% == m goto backup
if not %choice% == v goto backup
if not %choice% == a goto backup
if not %choice% == 0 goto backup

:restore
cls
Echo.
Echo    ���������������������������������������
Echo    �                                     �
Echo    �   The following are pulled from     �
Echo    �    -= INTERNAL STORAGE ONLY =-      �
Echo    �                                     �
Echo    ���������������������������������������
Echo    �                                     �
Echo    �  Restore:                           �
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
Echo.
set /p choice=Select: 
if %choice% == d (
Echo.
  if not exist "%current%\Backup\Files\Download" (
    Echo    Nothing in "Download"
    @ping localhost -n 2 >NUL
    goto restore
  ) else (
    adb push "%current%\Backup\Files\Download" /sdcard/Download
    Pause
    goto restore
  )
)
if %choice% == p (
Echo.
  if not exist "%current%\Backup\Files\Pictures" (
    Echo    Nothing in "Pictures"
    @ping localhost -n 2 >NUL
  ) else (
    adb push "%current%\Backup\Files\Pictures" /sdcard/Pictures
    Echo.
  )
  if not exist "%current%\Backup\Files\DCIM\Camera" (
    Echo    Nothing in "DCIM\Camera"
    @ping localhost -n 2 >NUL
    goto restore
  ) else (
    adb push "%current%\Backup\Files\DCIM\Camera" /sdcard/DCIM/Camera
    Pause
    goto restore
  )
)
if %choice% == m (
Echo.
  if not exist "%current%\Backup\Files\Music" (
    Echo    Nothing in "Music"
    @ping localhost -n 2 >NUL
  ) else (
    adb push "%current%\Backup\Files\Music" /sdcard/Music
    Pause
    goto restore
  )
)
if %choice% == v (
Echo.
  if not exist "%current%\Backup\Files\Video" (
    Echo    Nothing in "Video"
    @ping localhost -n 2 >NUL
  ) else (
    adb push "%current%\Backup\Files\Video" /sdcard/Video
    Echo.
  )
  if not exist "%current%\Backup\Files\Videos" (
    Echo    Nothing in "Videos"
    @ping localhost -n 2 >NUL
    goto restore
  ) else (
    adb push "%current%\Backup\Files\Videos" /sdcard/Videos
    Pause
    goto restore
  )
)
if %choice% == a (
Echo.
  if not exist "%current%\Backup\Files\Android" (
    Echo    Nothing in "Android"
    @ping localhost -n 2 >NUL
  ) else (
    adb push "%current%\Backup\Files\Android" /sdcard/Android
    Pause
    goto restore
  )
)
if %choice% == 0 goto backuprestore
if not %choice% == d goto restore
if not %choice% == p goto restore
if not %choice% == m goto restore
if not %choice% == v goto restore
if not %choice% == a goto restore
if not %choice% == 0 goto restore

:reboot
cls
Echo.
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
Echo.
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
Echo.
Echo    �������������������������������
Echo    �                             �
Echo    �  Reboot device?             �
Echo    �  Must be in "fastboot"      �
Echo    �                             �
Echo    �    Abort with CTRL+C        �
Echo    �                             �
Echo    �������������������������������
Echo.
Pause
Echo.
fastboot reboot
goto reboot

:ra
cls
Echo.
Echo    �������������������������������
Echo    �                             �
Echo    �  Reboot device?             �
Echo    �  Must NOT be in "fastboot"  �
Echo    �                             �
Echo    �    Abort with CTRL+C        �
Echo    �                             �
Echo    �������������������������������
Echo.
Pause
Echo.
adb reboot
goto reboot

:rr
cls
Echo.
Echo    �������������������������������
Echo    �                             �
Echo    �  Reboot into recovery?      �
Echo    �  Must NOT be in "fastboot"  �
Echo    �                             �
Echo    �    Abort with CTRL+C        �
Echo    �                             �
Echo    �������������������������������
Echo.
Pause
Echo.
adb reboot recovery
goto reboot

:rb
cls
Echo.
Echo    �������������������������������
Echo    �                             �
Echo    �  Reboot into bootloader?    �
Echo    �  Must NOT be in "fastboot"  �
Echo    �                             �
Echo    �    Abort with CTRL+C        �
Echo    �                             �
Echo    �������������������������������
Echo.
Pause
Echo.
adb reboot bootloader
goto reboot

:flash
cls
Echo.
Echo    ������������������������������
Echo    �                            �    ��������
Echo    �  Flash images:             �    ۱������               �����
Echo    �                            �    ۱������         �     ۱���
Echo    �  [fr]  Flash recovery      �    ۱������          �    ۱���
Echo    �                            �    ��������   ���������   ۱���
Echo    �  [0]   Main menu           �    �######�          �    ۱���
Echo    �                            �    ��������         �     �����
Echo    ������������������������������
Echo.
set /p choice=Select: 
if %choice% == fr goto flashrecovery
if %choice% == 0 goto start
if not %choice% == fr goto flash
if not %choice% == 0 goto flash

:flashrecovery
cls
Echo.
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
Echo.
set /p choice=Select: 
if %choice% == fr (
Echo.
fastboot flash recovery "%current%/Data/recovery.img"
Echo.
Pause
goto start
)
if %choice% == 0 goto flash
if not %choice% == fr goto flashrecovery
if not %choice% == 0 goto flashrecovery

:exit
cls
Echo.
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
Echo.
@ping localhost -n 3 >NUL
exit