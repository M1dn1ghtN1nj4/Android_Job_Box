@echo off
Color a
Android Job Box v1.00 by ChevyCam94
cd >> tmp.log
set /p current=< tmp.log
del tmp.log
cd %current%\Data

:start
cls
Echo.
Echo    ������������ Android Job Box v1.00 ������������              \   /
Echo    �          ����� By ChevyCam94 �����          �              �����
Echo    �                                             �            ���������
Echo    �  [1] Unlock bootloader          (fastboot)  �           ��� ��� ���
Echo    �  [2] Relock bootloader          (fastboot)  �           �����������
Echo    �  [3] Backup and Restore...      (adb)       �        �� ����������� ��
Echo    �                                             �        �����������������
Echo    �                                             �        �� ����������� ��
Echo    �����������������������������������������������        �� ����������� ��
Echo    �                                             �        �� ����������� ��
Echo    � [r]    Reboot...                            �           �����������
Echo    � [e]    Exit                                 �             ��� ���
Echo    �                                             �             ��� ���
Echo    �����������������������������������������������             ��� ���
Echo.
@echo off
set /p choice=Select:

if %choice% == 1 goto bootloader
if %choice% == 2 goto relock
if %choice% == 3 goto backuprestore

if %choice% == r goto reboot
if %choice% == e goto exit

if not %choice% == 1 goto restart
if not %choice% == 2 goto restart
if not %choice% == 3 goto restart
if not %choice% == r goto restart
if not %choice% == e goto restart

:bootloader
cls
Echo.
Echo    ����������������������������      ���
Echo    �                          �     �   �
Echo    �  Unlock the bootloader?  �         �
Echo    �  Must be in "fastboot"   �    �������
Echo    �    Abort with CTRL+C     �    �������
Echo    �                          �    �������
Echo    ����������������������������    �������
Echo.
Pause
Echo.
fastboot oem unlock
Echo.
Pause
goto start

:relock
cls
Echo.
Echo    ����������������������������      ���
Echo    �                          �     �   �
Echo    �  Relock the bootloader?  �     �   �
Echo    �  Must be in "fastboot"   �    �������
Echo    �    Abort with CTRL+C     �    �������
Echo    �                          �    �������
Echo    ����������������������������    �������
Echo.
Pause
Echo.
fastboot oem lock
Echo.
Pause
goto start

:backuprestore
cls
Echo.
Echo    ������������������������������
Echo    �                            �
Echo    �  Backup and Restore:       �     ���                    ���
Echo    �                            �    �   ����         �     �   ����
Echo    �  [b] Backup                �    �      �          �    �      �
Echo    �  [r] Restore               �    �      �   ���������   �      �
Echo    �  [o] Open backup folder    �    �      �          �    �      �
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
Echo.
Pause
goto start

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
adb backup -all -f "%whereami%\Backup\%backupname%.ab"
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
Echo.
Pause
goto start

:rda
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

:rdf
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

:rr
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
adb reboot-bootloader
goto reboot

:restart
set /p _ok=* Invalid entry! Please choose again  *
@ping localhost -n 2 >NUL
goto start

:exit
cls
Echo.
Echo    ���������������������������������������������������������      \ /
Echo    �                                                       �      ���
Echo    �  Thank you for choosing Android Job Box!              �     � � �
Echo    �  If you found this helpful, please consider donating  �  � ������� �
Echo    �                                                       �  �����������
Echo    �  Credit to Lexmazter for the original script that     �  � ������� �
Echo    �  this is based off of                                 �  � ������� �
Echo    �                                                       �     �� ��
Echo    ���������������������������������������������������������     �� ��
Echo.
@ping localhost -n 3 >NUL
exit