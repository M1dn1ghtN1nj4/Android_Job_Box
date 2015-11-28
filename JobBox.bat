@echo off
Color a
Android Job Box v1.20 by ChevyCam94
cd >> tmp.log
set /p current=< tmp.log
del tmp.log
cd %current%\Data

:start
cls
Echo.
Echo    ������������ Android Job Box v1.20 ������������             \   /
Echo    �          ����� By ChevyCam94 �����          �             �����
Echo    �                                             �           ���������
Echo    �  [1] Unlock bootloader          (fastboot)  �          ��� ��� ���
Echo    �  [2] Relock bootloader          (fastboot)  �          �����������
Echo    �  [3] Backup and Restore...      (adb)       �       �� ����������� ��
Echo    �  [4] Flash images...                        �       �����������������
Echo    �                                             �       �� ����������� ��
Echo    �����������������������������������������������       �� ����������� ��
Echo    �                                             �       �� ����������� ��
Echo    � [r]    Reboot...                            �          �����������
Echo    � [e]    Exit                                 �            ��� ���
Echo    �                                             �            ��� ���
Echo    �����������������������������������������������            ��� ���
Echo.
@echo off
set /p choice=Select: 
if %choice% == 1 goto unlock
if %choice% == 2 goto relock
if %choice% == 3 goto backuprestore
if %choice% == 4 goto flash
if %choice% == r goto reboot
if %choice% == e goto exit
if not %choice% == 1 goto start
if not %choice% == 2 goto start
if not %choice% == 3 goto start
if not %choice% == 4 goto start
if not %choice% == r goto start
if not %choice% == e goto start

:unlock
cls
Echo.
Echo    ����������������������������������
Echo    �                                �      ���
Echo    �  Unlock bootloader:            �     �   �
Echo    �                                �     �   �
Echo    �  [1] fastboot flashing unlock  �         �
Echo    �  [2] fastboot oem unlock       �    �������
Echo    �                                �    �������
Echo    �  [0] Main Menu                 �    �������
Echo    �                                �    �������
Echo    ����������������������������������
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
Echo    ������������������������������������
Echo    �                                  �      ���
Echo    �  Unlock bootloader:              �     �   �
Echo    �                                  �     �   �
Echo    �  [1] WITH backup     (adb)       �         �
Echo    �  [2] WITHOUT backup  (fastboot)  �    �������
Echo    �                                  �    �������
Echo    �  [0] Unlock menu                 �    �������
Echo    �                                  �    �������
Echo    ������������������������������������
Echo.
@echo off
set /p choice=Select: 
if %choice% == 1 (
Echo.
set /p backupname=Enter a name for your backup: 
adb backup -all -f "%current%\Backup\%backupname%.ab"
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
Echo    ��������������������������������
Echo    �                              �
Echo    �  Relock bootloader:          �      ���
Echo    �                              �     �   �
Echo    �  [1] fastboot flashing lock  �     �   �
Echo    �  [2] fastboot oem lock       �    �������
Echo    �                              �    �������
Echo    �  [0] Main Menu               �    �������
Echo    �                              �    �������
Echo    ��������������������������������
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
Echo    ������������������������������������
Echo    �                                  �
Echo    �  Relock bootloader:              �      ���
Echo    �                                  �     �   �
Echo    �  [1] WITH backup     (adb)       �     �   �
Echo    �  [2] WITHOUT backup  (fastboot)  �    �������
Echo    �                                  �    �������
Echo    �  [0] Relock menu                 �    �������
Echo    �                                  �    �������
Echo    ������������������������������������
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
Echo    ������������������������������
Echo    �                            �
Echo    �  Backup and Restore:       �     ���                    ���
Echo    �                            �    ۱������         �     ۱������
Echo    �  [b] Backup                �    ۱������          �    ۱������
Echo    �  [r] Restore               �    ۱������   ���������   ۱������
Echo    �  [o] Open backup folder    �    ۱������          �    ۱������
Echo    �                            �    ��������         �     ��������
Echo    �  [0] Main Menu             �
Echo    �                            �
Echo    ������������������������������
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
Echo    ��������������������������������������
Echo    �                                    �
Echo    �  Create a backup:                  �
Echo    �                                    �
Echo    �  Enter a name for your backup.     �
Echo    �  Find your backups in Data/Backup  �
Echo    �  folder with the name you gave it  �
Echo    �                                    �
Echo    �    Abort with CTRL+C               �
Echo    �                                    �
Echo    ��������������������������������������
Echo.
Pause
Echo.
set /p backupname=Enter a name for your backup: 
adb backup -all -f "%current%\Backup\%backupname%.ab"
Echo.
Pause
goto backuprestore

:restore
cls
Echo.
Echo    ��������������������������������������
Echo    �                                    �
Echo    �  Restore a backup:                 �
Echo    �                                    �
Echo    �  Enter the name of your backup or  �
Echo    �  find your backups in Data/Backup  �
Echo    �  folder with the name you gave it  �
Echo    �                                    �
Echo    �    Abort with CTRL+C               �
Echo    �                                    �
Echo    ��������������������������������������
Echo.
Pause
Echo.
set /p backupname=Enter the name of your backup: 
adb restore "%current%\Backup\%backupname%.ab"
Echo.
Pause
goto backuprestore

:open
cls
%SystemRoot%\explorer.exe "%current%\Backup"
Pause
goto backuprestore

:reboot
cls
Echo.
Echo    �������������������������������������������         ��������
Echo    �                                         �       ��        ��
Echo    �  Choose reboot method:                  �      �            �
Echo    �                                         �     �
Echo    �  [rda] Reboot device (via adb)          �    �               �
Echo    �  [rdf] Reboot device (via fastboot)     �    �              ���
Echo    �  [rr]  Reboot into recovery             �    �             � � �
Echo    �  [rb]  Reboot into bootloader           �    �               �
Echo    �                                         �     �              �
Echo    �  [0]   Main Menu                        �      �            �
Echo    �                                         �       ��        ��
Echo    �������������������������������������������         ��������
Echo.
set /p choice=Select: 
if %choice% == rda goto rda
if %choice% == rdf goto rdf
if %choice% == rr goto rr
if %choice% == rb goto rb
if %choice% == 0 goto start
if not %choice% == rda goto reboot
if not %choice% == rdf goto reboot
if not %choice% == rr goto reboot
if not %choice% == rb goto reboot
if not %choice% == 0 goto reboot

:rdf
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

:rda
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
Echo    �  Flash images:             �    �      �               �����
Echo    �                            �    �      �         �     ۱���
Echo    �  [fr] Flash recovery       �    �      �          �    ۱���
Echo    �                            �    ��������   ���������   ۱���
Echo    �  [0] Main Menu             �    ۱������          �    ۱���
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
Echo    �������������������������������������
Echo    �                                   �    ��������
Echo    �  Flash recovery:                  �    �      �               �����
Echo    �                                   �    �      �         �     ۱���
Echo    �  [fr] "recovery.img"  (fastboot)  �    �      �          �    ۱���
Echo    �       (in /Data)                  �    ��������   ���������   ۱���
Echo    �                                   �    ۱������          �    ۱���    
Echo    �  [0] Flash menu                   �    ��������         �     �����
Echo    �                                   �
Echo    �������������������������������������
Echo.
set /p choice=Select: 
if %choice% == fr (
Echo.
fastboot flash recovery %current%/Data/recovery.img
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
Echo    �   Credit to Lexmazter for the original script that    ۱�
Echo    �                 this is based off of                  ۱�
Echo    �                                                       ۱�
Echo    ��������������������������������������������������������۱�
Echo     ۱��������������������������������������������������������
Echo      ���������������������������������������������������������
Echo.
@ping localhost -n 3 >NUL
exit