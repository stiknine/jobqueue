FasdUAS 1.101.10   ��   ��    k             l      �� ��    � �
jobqueue
queue and process folders and files and folders in folders with files

version: 2.3.9

2008, 2009
Author: Harley Newton
This software is provided FREE with NO WARRANTY. Use at your own risk.
       	  l     ������  ��   	  
  
 l     �� ��      setup jobqueue system         l     �� ��    R L all queue folders are contained in a folder called jobqueues on the desktop         l     �� ��    O I save this script as an application or the install function will not work         l     ������  ��        l     �� ��    G A set administrator password to not be prompted for authentication         j     �� �� 0 admin_password    m                   l     ������  ��        l     ������  ��       !   l     �� "��   "   Start jobsetup app    !  # $ # l     %�� % I    ������
�� .miscactvnull��� ��� obj ��  ��  ��   $  & ' & l    (�� ( I   �� ) *
�� .sysodlogaskr        TEXT ) b     + , + b    	 - . - m     / / 4 .Create a jobqueue or install jobqueue scripts?    . o    ��
�� 
ret  , l 	 	 
 0�� 0 m   	 
 1 1 L F(Installing scripts requires authentication and OS X 10.4.x or above.)   ��   * �� 2 3
�� 
btns 2 J     4 4  5 6 5 m     7 7 
 Quit    6  8 9 8 m     : :  Install Scripts    9  ;�� ; m     < <  Create Queue   ��   3 �� = >
�� 
dflt = m    ����  > �� ? @
�� 
cbtn ? m    ����  @ �� A B
�� 
appr A m     C C  jobqueue Setup    B �� D��
�� 
disp D m    ���� ��  ��   '  E F E l     ������  ��   F  G H G l   G I�� I Z    G J K L M J =   ' N O N l   # P�� P n    # Q R Q 1    #��
�� 
bhit R l    S�� S 1    ��
�� 
rslt��  ��   O m   # & T T  Create Queue    K k   * / U U  V W V l  * *�� X��   X   create jobqueue folders    W  Y Z Y l  * *�� [��   [ 5 / Setup Folders Actions for the created jobqueue    Z  \�� \ n  * / ] ^ ] I   + /�������� 0 create_jobqueue  ��  ��   ^  f   * +��   L  _ ` _ =  2 ; a b a l  2 7 c�� c n   2 7 d e d 1   3 7��
�� 
bhit e l  2 3 f�� f 1   2 3��
�� 
rslt��  ��   b m   7 : g g  Install scripts    `  h�� h k   > C i i  j k j l  > >�� l��   l G A copy joqueue scripts to /Library/Scripts/Folder Actions Scripts/    k  m n m l  > >�� o��   o c ] you need administrator privileges to copy scritps to /Library/Scripts/Folder Action scripts/    n  p�� p n  > C q r q I   ? C�������� 0 install_jobqueue  ��  ��   r  f   > ?��  ��   M l  F F�� s��   s   user canceled   ��   H  t u t l     ������  ��   u  v w v l     ������  ��   w  x y x l     �� z��   z   create jobqueue folders    y  { | { l     ������  ��   |  } ~ } i      �  I      �������� 0 create_jobqueue  ��  ��   � O    P � � � k   O � �  � � � I   	������
�� .miscactvnull��� ��� obj ��  ��   �  � � � l  
 
������  ��   �  � � � l  
 
�� ���   � E ? get name for jobqueue, cancel or open Folder Actions Setup app    �  � � � I  
 �� � �
�� .sysodlogaskr        TEXT � m   
  � � &  Name for jobqueue "folder name":    � �� � �
�� 
dtxt � m     � �       � �� ���
�� 
appr � m     � �  
Queue Name   ��   �  � � � l   �� ���   �   name of jobqueue    �  � � � r     � � � n     � � � 1    ��
�� 
ttxt � l    ��� � 1    ��
�� 
rslt��   � o      ���� 0 jobname   �  � � � l   �� ���   � = 7 folder name to hold the queues, created on the desktop    �  � � � r     � � � m     � �  	jobqueues    � o      ���� 0 jobqueue   �  � � � l   �� ���   �   check if name is empty    �  ��� � Z   O � ��� � � >   ! � � � o    ���� 0 jobname   � m      � �       � k   $# � �  � � � Q   $ � � � � � k   ' P � �  � � � l  ' '�� ���   � A ; create new jobqueue in the jobqueues folder on the desktop    �  � � � I  ' ;�� � �
�� .corecrel****      � null � m   ' (��
�� 
cfol � �� � �
�� 
insh � l  ) . ��� � I  ) .�� ���
�� .earsffdralis        afdr � m   ) *��
�� afdmdesk��  ��   � �� ���
�� 
prdt � K   1 7 � � �� ���
�� 
pnam � o   4 5���� 0 jobqueue  ��  ��   �  � � � I  < L�� � �
�� .corecrel****      � null � m   < =��
�� 
cfol � �� � �
�� 
insh � l  > ? ��� � 1   > ?��
�� 
rslt��   � �� ���
�� 
prdt � K   B H � � �� ���
�� 
pnam � o   E F���� 0 jobname  ��  ��   �  � � � l  M M������  ��   �  ��� � r   M P � � � l  M N ��� � 1   M N��
�� 
rslt��   � o      ���� 0 
queue_path  ��   � R      ������
�� .ascrerr ****      � ****��  ��   � k   X � � �  � � � l  X X�� ���   � 0 * create jobqueues folder if does not exist    �  � � � r   X e � � � n   X c � � � 4   ` c�� �
�� 
cfol � o   a b���� 0 jobqueue   � 4   X `�� �
�� 
cfol � l  Z _ ��� � I  Z _�� ��
�� .earsffdralis        afdr � m   Z [�~
�~ afdmdesk�  ��   � l      ��} � 1      �|
�| 
rslt�}   �  � � � l  f f�{�z�{  �z   �  ��y � Q   f � � � � � I  i y�x � �
�x .corecrel****      � null � m   i j�w
�w 
cfol � �v � �
�v 
insh � l  k l ��u � 1   k l�t
�t 
rslt�u   � �s ��r
�s 
prdt � K   o u � � �q ��p
�q 
pnam � o   r s�o�o 0 jobname  �p  �r   � R      �n�m�l
�n .ascrerr ****      � ****�m  �l   � r   � � � � � m   � � � �       � l      ��k � 1      �j
�j 
rslt�k  �y   �  � � � l  � ��i�h�i  �h   �  � � � l  � ��g ��g   �   create queue folders    �  ��f � Z   �# � ��e � � =  � �   l  � ��d 1   � ��c
�c 
rslt�d   m   � �       � k   � �  l  � ��b�b     jobqueue exists    	 I  � ��a

�a .sysodlogaskr        TEXT
 m   � � : 4Queue already exists. Please use a different name...    �`
�` 
btns l 
 � ��_ J   � � �^ m   � �  OK   �^  �_   �]
�] 
dflt m   � ��\�\  �[
�[ 
appr m   � �  Queue Exists    �Z
�Z 
disp m   � ��Y�Y  �X�W
�X 
givu m   � ��V�V �W  	 �U n  � � I   � ��T�S�R�T 0 create_jobqueue  �S  �R    f   � ��U  �e   � k   �#   l  � ��Q!�Q  !   get path to new jobqueue     "#" r   � �$%$ l  � �&�P& 1   � ��O
�O 
rslt�P  % o      �N�N 0 
queue_path  # '(' l  � ��M�L�M  �L  ( )*) l  � ��K+�K  +   jobqueue folders   * ,-, r   � �./. b   � �010 o   � ��J�J 0 jobname  1 m   � �22  _queue   / o      �I�I 0 queue_folder  - 343 r   � �565 J   � �77 898 o   � ��H�H 0 queue_folder  9 :;: m   � �<<  	completed   ; =>= m   � �??  waiting   > @A@ m   � �BB 	 log   A C�GC m   � �DD  error   �G  6 o      �F�F 0 
job_queues  4 EFE l  � ��E�D�E  �D  F G�CG X   �#H�BIH Z   �JK�ALJ =  � �MNM n   � �OPO 1   � ��@
�@ 
pcntP o   � ��?�? 0 q  N o   � ��>�> 0 queue_folder  K k   ��QQ RSR l  � ��=�<�=  �<  S TUT r   �VWV c   � XYX m   � �ZZ  jobqueue.scpt   Y m   � ��;
�; 
ctxtW o      �:�: 
0 q_scpt  U [\[ r  ]^] c  
_`_ m  aa  jobprocess.scpt   ` m  	�9
�9 
ctxt^ o      �8�8 
0 p_scpt  \ bcb r  ded c  fgf o  �7�7 0 
queue_path  g m  �6
�6 
ctxte o      �5�5 0 fa_path  c hih r  "jkj c   lml l n�4n b  opo l q�3q c  rsr o  �2�2 0 
queue_path  s m  �1
�1 
TEXT�3  p o  �0�0 0 q  �4  m m  �/
�/ 
ctxtk o      �.�. 0 jq_path  i tut r  #/vwv n  #-xyx 1  )-�-
�- 
pnamy 4  #)�,z
�, 
alisz o  '(�+�+ 0 fa_path  w o      �*�* 0 fa_name  u {|{ r  03}~} o  01�)�) 0 q  ~ o      �(�( 0 jq_name  | � l 44�'�&�'  �&  � ��%� Q  4����$� k  7��� ��� l 77�#��#  �   create queue folder   � ��� I 7G�"��
�" .corecrel****      � null� m  78�!
�! 
cfol� � ��
�  
insh� o  9:�� 0 
queue_path  � ���
� 
prdt� K  =C�� ���
� 
pnam� o  @A�� 0 q  �  �  � ��� r  HK��� l HI��� 1  HI�
� 
rslt�  � o      �� 0 
queue_path  � ��� l LL���  �  � ��� l LL���  �   setup Folder Actions   � ��� I LQ���
� .miscactvnull��� ��� obj �  �  � ��� I Ry���
� .sysodlogaskr        TEXT� m  RU�� . (Do you want to setup Folder Actions now?   � ���
� 
btns� l 
Xc��� J  Xc�� ��� m  X[��  Create Queue   � ��� m  [^�� 
 Quit   � ��� m  ^a��  OK   �  �  � ���
� 
dflt� m  fg�� � �
��
�
 
cbtn� m  jk�	�	 � ���
� 
appr� m  lo��  Setup Folder Actions   � ���
� 
disp� m  rs�� �  � ��� l zz���  �  � ��� Z  z������ = z���� l z��� n  z��� 1  {�
� 
bhit� l z{�� � 1  z{��
�� 
rslt�   �  � m  ���  OK   � Q  ������� k  ���� ��� O  ����� k  ���� ��� l �������  � %  create jobqueue Folder Actions   � ��� I �������
�� .corecrel****      � null��  � ����
�� 
kocl� m  ����
�� 
foac� ����
�� 
insh� n  �����  ;  ��� 2 ����
�� 
foac� �����
�� 
prdt� K  ���� �����
�� 
ppth� o  ������ 0 fa_path  ��  ��  � ��� I �������
�� .corecrel****      � null��  � ����
�� 
kocl� m  ����
�� 
foac� ����
�� 
insh� n  �����  ;  ��� 2 ����
�� 
foac� �����
�� 
prdt� K  ���� �����
�� 
ppth� o  ������ 0 jq_path  ��  ��  � ��� l ��������  ��  � ��� l �������  � ' ! attach scripts to folder actions   � ���� l  �������  �tell folder action fa_name
											make new script at end of scripts with properties {name:q_scpt}
										end tell
										
										tell folder action jq_name
											make new script at end of scripts with properties {name:p_scpt}
										end tell   ��  � m  �����null     !����  �System Events.app'W똘���-  T���������4�W똰`�8����B�<�sevs   alis    �  stiknine                   �<-�H+    �System Events.app                                                p����        ����  	                CoreServices    �<�2      ��)$      �  �  �  6stiknine:System:Library:CoreServices:System Events.app  $  S y s t e m   E v e n t s . a p p    s t i k n i n e  -System/Library/CoreServices/System Events.app   / ��  � ��� l ��������  ��  � ��� l �������  � , & open Folder Actions Setup application   � ���� n ����� I  ���������� 0 openfas openFAS��  ��  �  f  ����  � R      ������
�� .ascrerr ****      � ****��  ��  ��  � ��� = ����� l ������ n  ����� 1  ����
�� 
bhit� l ������ 1  ����
�� 
rslt��  ��  � m  ��    Create Queue   � �� k  ��  l ������     create jobqueue folders     l ������   5 / Setup Folders Actions for the created jobqueue    	��	 n ��

 I  ���������� 0 create_jobqueue  ��  ��    f  ����  ��  � l ������     user canceled   � �� l ��������  ��  ��  � R      ������
�� .ascrerr ****      � ****��  ��  �$  �%  �A  L Q  �� k    l ����     create other folders    �� I ��
�� .corecrel****      � null m  ��
�� 
cfol ��
�� 
insh o  ���� 0 
queue_path   ����
�� 
prdt K   ����
�� 
pnam o  ���� 0 q  ��  ��  ��   R      ������
�� .ascrerr ****      � ****��  ��  ��  �B 0 q  I o   � ����� 0 
job_queues  �C  �f  ��   � k  &O  l &&����     jobqueue needs a name     !  I &I��"#
�� .sysodlogaskr        TEXT" m  &)$$ + %Please choose a name for the queue...   # ��%&
�� 
btns% l 
,1'��' J  ,1(( )��) m  ,/**  OK   ��  ��  & ��+,
�� 
dflt+ m  45���� , ��-.
�� 
appr- m  69//  
Queue Name   . ��01
�� 
disp0 m  <=���� 1 ��2��
�� 
givu2 m  @C���� ��  ! 3��3 n JO454 I  KO�������� 0 create_jobqueue  ��  ��  5  f  JK��  ��   � m     66�null     ߀��  �
Finder.appP  ��'W똸����  Ā{0�������4�W�`�X����B�<�MACS   alis    f  stiknine                   �<-�H+    �
Finder.app                                                       F����        ����  	                CoreServices    �<�2      ��,a      �  �  �  /stiknine:System:Library:CoreServices:Finder.app    
 F i n d e r . a p p    s t i k n i n e  &System/Library/CoreServices/Finder.app  / ��   ~ 787 l     ������  ��  8 9:9 l     ������  ��  : ;<; l     ��=��  = M G copy jobqueue scripts to the main Library Folder Action Scripts folder   < >?> l     ��@��  @ / ) using do shell script to install scripts   ? ABA l     ������  ��  B CDC i    
EFE I      �������� 0 install_jobqueue  ��  ��  F Q    {GH��G k   rII JKJ l   ��L��  L &   get current logged in user name   K MNM r    
OPO I   ��Q��
�� .sysoexecTEXT���     TEXTQ m    RR  whoami   ��  P o      ���� 0 	user_name  N STS r    UVU J    WW XYX m    ZZ  jobqueue.scpt   Y [��[ m    \\  jobprocess.scpt   ��  V o      ���� 0 jobqueue_scripts  T ]^] r    _`_ J    aa bcb m    dd  jobprocess_example.scpt   c efe m    gg  jobprocess_cl.scpt   f hih m    jj  jobprocess_image.scpt   i k��k m    ll  jobprocess_log.scpt   ��  ` o      ���� 0 jobqueue_x_scripts  ^ mnm l   ��o��  o   path to Folder Actions   n pqp r    &rsr l   $t��t n    $uvu 1   " $��
�� 
psxpv l   "w��w I   "��xy
�� .earsffdralis        afdrx m    ��
�� afdrfasfy ��z��
�� 
fromz m    ��
�� fldmfldl��  ��  ��  s o      ���� 0 fas_path  q {|{ l  ' '��}��  } * $ get the path to running application   | ~~ r   ' 8��� I  ' 6�����
�� .sysoexecTEXT���     TEXT� b   ' 2��� m   ' (��  dirname    � l  ( 1���� n   ( 1��� 1   / 1��
�� 
strq� l  ( /���� n   ( /��� 1   - /��
�� 
psxp� l  ( -��� I  ( -�~��}
�~ .earsffdralis        afdr�  f   ( )�}  �  ��  ��  ��  � o      �|�| 0 	this_path   ��� l  9 9�{�z�{  �z  � ��� l  9 9�y��y  � U O create a POSIX path to the jobqueue scripts so we can copy all scripts at once   � ��� r   9 >��� m   9 <��      � o      �x�x 0 cp  � ��� r   ? D��� m   ? B��      � o      �w�w 0 cpx  � ��� X   E ���v�� k   Y ��� ��� r   Y l��� b   Y j��� b   Y f��� b   Y d��� b   Y `��� b   Y ^��� o   Y Z�u�u 0 cp  � m   Z ]��  '   � o   ^ _�t�t 0 	this_path  � m   ` c��  /   � o   d e�s�s 0 s  � m   f i��  '    � o      �r�r 0 cp  � ��q� r   m ���� b   m ~��� b   m z��� b   m x��� b   m t��� b   m r��� o   m n�p�p 0 cpx  � m   n q��  '   � o   r s�o�o 0 	this_path  � m   t w��  /   � o   x y�n�n 0 s  � m   z }��  '    � o      �m�m 0 cpx  �q  �v 0 s  � o   H I�l�l 0 jobqueue_scripts  � ��� l  � ��k��k  �   with example scripts   � ��� X   � ���j�� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ��i�i 0 cpx  � m   � ���  '   � o   � ��h�h 0 	this_path  � m   � ���  
/examples/   � o   � ��g�g 0 sx  � m   � ���  '    � o      �f�f 0 cpx  �j 0 sx  � o   � ��e�e 0 jobqueue_x_scripts  � ��� l  � ��d�c�d  �c  � ��� l  � ��b��b  � P J create a POSIX path to the jobqueue scripts so we can change permissions    � ��� r   � ���� m   � ���      � o      �a�a 0 o  � ��� r   � ���� m   � ���      � o      �`�` 0 ox  � ��� X   � ���_�� k   � ��� ��� r   � ���� b   � ���� b   � ���� b   � ���� b   � ���� o   � ��^�^ 0 o  � m   � ���   '   � o   � ��]�] 0 fas_path  � o   � ��\�\ 0 a  � m   � ���  '   � o      �[�[ 0 o  � ��Z� r   � ���� b   � ���� b   � �   b   � � b   � � o   � ��Y�Y 0 ox   m   � �   '    o   � ��X�X 0 fas_path   o   � ��W�W 0 a  � m   � �  '   � o      �V�V 0 ox  �Z  �_ 0 a  � o   � ��U�U 0 jobqueue_scripts  � 	 l  � ��T
�T  
   with example scripts   	  X   � �S r   b   b   b   b   o  �R�R 0 ox   m     '    o  �Q�Q 0 fas_path   o  �P�P 0 x   m    '    o      �O�O 0 ox  �S 0 x   o   � ��N�N 0 jobqueue_x_scripts    l !!�M�L�M  �L    l !!�K�K     cp and chown commands     !  l !!�J"�J  " 7 1 using cp to copy scripts, need admin privileges    ! #$# l !!�I%�I  % C = using chown to set users permissions so scripts are editable   $ &'& r  !4()( b  !2*+* b  !0,-, b  !../. b  !*010 b  !&232 m  !$44 	 cp    3 o  $%�H�H 0 cp  1 l &)5�G5 n  &)676 1  ')�F
�F 
strq7 o  &'�E�E 0 fas_path  �G  / m  *-88  
 && chown    - o  ./�D�D 0 	user_name  + o  01�C�C 0 o  ) o      �B�B 
0 cp_cmd  ' 9:9 r  5H;<; b  5F=>= b  5D?@? b  5BABA b  5>CDC b  5:EFE m  58GG 	 cp    F o  89�A�A 0 cpx  D l :=H�@H n  :=IJI 1  ;=�?
�? 
strqJ o  :;�>�> 0 fas_path  �@  B m  >AKK  
 && chown    @ o  BC�=�= 0 	user_name  > o  DE�<�< 0 ox  < o      �;�; 0 cp_x_cmd  : LML l II�:�9�:  �9  M NON l II�8P�8  P   install example scripts?   O QRQ I IN�7�6�5
�7 .miscactvnull��� ��� obj �6  �5  R STS I Ox�4UV
�4 .sysodlogaskr        TEXTU b  OVWXW m  ORYY : 4Do you want to install the jobqueue example scripts?   X l 
RUZ�3Z o  RU�2
�2 
ret �3  V �1[\
�1 
btns[ J  Yd]] ^_^ m  Y\``  Cancel   _ aba m  \_cc  No   b d�0d m  _bee  OK   �0  \ �/fg
�/ 
dfltf m  gh�.�. g �-hi
�- 
apprh m  knjj  Example Scripts   i �,k�+
�, 
dispk m  qr�*�* �+  T lml l yy�)�(�)  �(  m non Z  ylpq�'rp = y�sts l y�u�&u n  y�vwv 1  |��%
�% 
bhitw l y|x�$x 1  y|�#
�# 
rslt�$  �&  t m  ��yy  OK   q k  ��zz {|{ l ���"}�"  } ' ! backup current jobprocess script   | ~~ n ����� I  ���!� ��! 0 scpt_bak  �   �  �  f  �� ��� l �����  �  � ��� l �����  � &   run copy command, with examples   � ��� I �����
� .miscactvnull��� ��� obj �  �  � ��� I �����
� .sysoexecTEXT���     TEXT� o  ���� 0 cp_x_cmd  � ���
� 
RApw� o  ���� 0 admin_password  � ���
� 
badm� m  ���
� boovtrue�  � ��� l �����  �  � ��� l �����  �   copy successful			   � ��� I �����
� .sysodlogaskr        TEXT� m  ���� y sSuccessfully copied: jobqueue.scpt, jobprocess.scpt and examples to folder: /Library/Scripts/Folder Action scripts/   � ���
� 
btns� l 
����� J  ���� ��� m  ����  Setup Actions   � ��� m  ����  Create Queue   � ��� m  ���� 
 Quit   �  �  � �
��
�
 
dflt� m  ���	�	 � ���
� 
appr� m  ����  Scripts Installed   � ���
� 
disp� m  ���� �  � ��� Z  ������� = ����� l ����� n  ����� 1  ���
� 
bhit� l ����� 1  ��� 
�  
rslt�  �  � m  ����  Create Queue   � k  ���� ��� l �������  �   create jobqueue folders   � ���� n ����� I  ���������� 0 create_jobqueue  ��  ��  �  f  ����  � ��� = ����� l ������ n  ����� 1  ����
�� 
bhit� l ������ 1  ����
�� 
rslt��  ��  � m  ����  Setup Actions   � ���� k  ���� ��� l �������  � , & open Folder Actions Setup application   � ���� n ����� I  ���������� 0 openfas openFAS��  ��  �  f  ����  ��  � l �������  �   user cancel   �  �'  r k  �l�� ��� l �������  � ' ! backup current jobprocess script   � ��� n � ��� I  � �������� 0 scpt_bak  ��  ��  �  f  ��� ��� l ������  ��  � ��� l �����  � $  run copy command, no examples   � ��� I ������
�� .miscactvnull��� ��� obj ��  ��  � ��� I ����
�� .sysoexecTEXT���     TEXT� o  ���� 
0 cp_cmd  � ����
�� 
RApw� o  ���� 0 admin_password  � �����
�� 
badm� m  ��
�� boovtrue��  � ��� l ������  ��  � ��� l �����  �   copy successful			   � ��� I >����
�� .sysodlogaskr        TEXT� m  �� l fSuccessfully copied: jobqueue.scpt, jobprocess.scpt to folder: /Library/Scripts/Folder Action scripts/   � ����
�� 
btns� l 
*���� J  *�� ��� m  "��  Setup Actions   � ��� m  "%��  Create Queue   � ���� m  %(�� 
 Quit   ��  ��  � ����
�� 
dflt� m  -.���� � ��� 
�� 
appr� m  14  Scripts Installed     ����
�� 
disp m  78���� ��  � �� Z  ?l = ?J	 l ?F
��
 n  ?F 1  BF��
�� 
bhit l ?B�� 1  ?B��
�� 
rslt��  ��  	 m  FI  Create Queue    k  MR  l MM����     create jobqueue folders    �� n MR I  NR�������� 0 create_jobqueue  ��  ��    f  MN��    = U` l U\�� n  U\ 1  X\��
�� 
bhit l UX�� 1  UX��
�� 
rslt��  ��   m  \_  Setup Actions    �� k  ch   !"! l cc��#��  # , & open Folder Actions Setup application   " $��$ n ch%&% I  dh�������� 0 openfas openFAS��  ��  &  f  cd��  ��   l kk��'��  '   user cancel   ��  o ()( l mm������  ��  ) *+* l mm��,��  , 4 . move jobwait script to the trash if it exists   + -��- n mr./. I  nr�������� 0 mv_scpt  ��  ��  /  f  mn��  H R      ������
�� .ascrerr ****      � ****��  ��  ��  D 010 l     ������  ��  1 232 l     ������  ��  3 454 l     ��6��  6 $  Open Folder Actions Setup app   5 787 l     ��9��  9 ` Z note: need to launch the app, then activate it - this seems to force the app to the front   8 :;: l     ������  ��  ; <=< i    >?> I      �������� 0 openfas openFAS��  ��  ? k     @@ ABA l     ��C��  C , & open Folder Actions Setup application   B D��D O     EFE k    GG HIH l   ��J��  J   launch app   I KLK I   	������
�� .ascrnoop****      � ****��  ��  L MNM l  
 
��O��  O   then activate app   N P��P I  
 ������
�� .miscactvnull��� ��� obj ��  ��  ��  F m     QQ�null     !����  7�Folder Actions Setup.app��  ����������4�W똰`�8����B�<�fasu   alis    �  stiknine                   �<-�H+    7�Folder Actions Setup.app                                         o���֙        ����  	                AppleScript     �<�2      ��*�      7�  K  :stiknine:Applications:AppleScript:Folder Actions Setup.app  2  F o l d e r   A c t i o n s   S e t u p . a p p    s t i k n i n e  1Applications/AppleScript/Folder Actions Setup.app   / ��  ��  = RSR l     ������  ��  S TUT l     ������  ��  U VWV l     ��X��  X D > backup current jobprocess script in case it has been modified   W YZY l     ������  ��  Z [\[ i    ]^] I      �������� 0 scpt_bak  ��  ��  ^ Q     +_`��_ k    "aa bcb r    ded b    fgf l   h��h n    iji 1   
 ��
�� 
psxpj l   
k��k I   
��lm
�� .earsffdralis        afdrl m    ��
�� afdrfasfm ��n��
�� 
fromn m    ��
�� fldmfldl��  ��  ��  g m    oo  jobprocess.scpt   e o      ���� 0 jp_scpt  c pqp l   ������  ��  q rsr l   ��t��  t 3 - rename current process script, append ".bak"   s uvu r    wxw b    yzy b    {|{ b    }~} b    � m    �� 
 mv '   � o    ���� 0 jp_scpt  ~ m    �� 	 ' '   | o    ���� 0 jp_scpt  z m    ��  .bak'   x o      ���� 
0 mv_cmd  v ���� I   "�����
�� .sysoexecTEXT���     TEXT� o    �� 
0 mv_cmd  ��  ��  ` R      �~�}�|
�~ .ascrerr ****      � ****�}  �|  ��  \ ��� l     �{�z�{  �z  � ��� l     �y�x�y  �x  � ��� l     �w��w  � a [ move jobwait script to trash, script has been merged with the jobprocess script (v. 2.x.x)   � ��� l     �v�u�v  �u  � ��� i    ��� I      �t�s�r�t 0 mv_scpt  �s  �r  � Q     *���q� k    !�� ��� r    ��� c    ��� l   ��p� b    ��� l   ��o� c    ��� l   
��n� I   
�m��
�m .earsffdralis        afdr� m    �l
�l afdrfasf� �k��j
�k 
from� m    �i
�i fldmfldl�j  �n  � m   
 �h
�h 
TEXT�o  � m    ��  jobwait.scpt   �p  � m    �g
�g 
alis� o      �f�f 0 scpt  � ��� l   �e�d�e  �d  � ��c� O    !��� I    �b��
�b .coremoveobj        obj � o    �a�a 0 scpt  � �`��_
�` 
insh� 1    �^
�^ 
trsh�_  � m    6�c  � R      �]�\�[
�] .ascrerr ****      � ****�\  �[  �q  � ��Z� l     �Y�X�Y  �X  �Z       	�W� �������W  � �V�U�T�S�R�Q�P�V 0 admin_password  �U 0 create_jobqueue  �T 0 install_jobqueue  �S 0 openfas openFAS�R 0 scpt_bak  �Q 0 mv_scpt  
�P .aevtoappnull  �   � ****� �O ��N�M���L�O 0 create_jobqueue  �N  �M  � �K�J�I�H�G�F�E�D�C�B�A�@�K 0 jobname  �J 0 jobqueue  �I 0 
queue_path  �H 0 queue_folder  �G 0 
job_queues  �F 0 q  �E 
0 q_scpt  �D 
0 p_scpt  �C 0 fa_path  �B 0 jq_path  �A 0 fa_name  �@ 0 jq_name  � A6�? ��> ��= ��<�;�:�9 � ��8�7�6�5�4�3�2�1�0 ��/�.�-�,�+�*�)2<?BD�(�'�&�%Z�$a�#�"�����!�� ������ $*/
�? .miscactvnull��� ��� obj 
�> 
dtxt
�= 
appr�< 
�; .sysodlogaskr        TEXT
�: 
rslt
�9 
ttxt
�8 
cfol
�7 
insh
�6 afdmdesk
�5 .earsffdralis        afdr
�4 
prdt
�3 
pnam
�2 .corecrel****      � null�1  �0  
�/ 
btns
�. 
dflt
�- 
disp
�, 
givu�+ �* 
�) 0 create_jobqueue  
�( 
kocl
�' 
cobj
�& .corecnte****       ****
�% 
pcnt
�$ 
ctxt
�# 
TEXT
�" 
alis
�! 
cbtn
�  
bhit
� 
foac
� 
ppth� � 0 openfas openFAS�LQ�M*j O������ O��,E�O�E�O�� .���j a a �l� O���a a �l� O�E�W 5X  *��j /��/E�O ���a a �l� W X  a E�O�a   .a a a kva k�a a la a a   O)j+ !Yj�E�O�a "%E�O�a #a $a %a &a vE�OG�[a 'a (l )kh �a *,� a +a ,&E�Oa -a ,&E�O�a ,&E�O�a .&�%a ,&E�O*a /�/a ,E�O�E�O ���a a �l� O�E�O*j Oa 0a a 1a 2a 3mva ma 4l�a 5a ka   O�a 6,a 7  [ Oa 8 ?*a 'a 9�*a 9-6a a :�la ; O*a 'a 9�*a 9-6a a :�la ; OPUO)j+ <W X  hY �a 6,a =  
)j+ !Y hOPW X  hY  ��a a �l� W X  h[OY��Y +a >a a ?kva k�a @a la a a   O)j+ !U� �F������ 0 install_jobqueue  �  �  � ��������������
�	� 0 	user_name  � 0 jobqueue_scripts  � 0 jobqueue_x_scripts  � 0 fas_path  � 0 	this_path  � 0 cp  � 0 cpx  � 0 s  � 0 sx  � 0 o  � 0 ox  � 0 a  � 0 x  �
 
0 cp_cmd  �	 0 cp_x_cmd  � PR�Z\dgjl����������� �����������������48GK��Y����`ce����j����������y���������������������������
� .sysoexecTEXT���     TEXT� 
� afdrfasf
� 
from
� fldmfldl
� .earsffdralis        afdr
� 
psxp
� 
strq
�  
kocl
�� 
cobj
�� .corecnte****       ****
�� .miscactvnull��� ��� obj 
�� 
ret 
�� 
btns
�� 
dflt
�� 
appr
�� 
disp�� 
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
bhit�� 0 scpt_bak  
�� 
RApw
�� 
badm�� 0 create_jobqueue  �� 0 openfas openFAS�� 0 mv_scpt  ��  ��  �|t�j E�O��lvE�O�����vE�O���l �,E�O�)j �,�,%j E�Oa E�Oa E�O ?�[a a l kh �a %�%a %�%a %E�O�a %�%a %�%a %E�[OY��O +�[a a l kh �a %�%a %�%a %E�[OY��Oa E�Oa E�O 7�[a a l kh �a  %�%�%a !%E�O�a "%�%�%a #%E�[OY��O '�[a a l kh �a $%�%�%a %%E�[OY��Oa &�%��,%a '%�%�%E�Oa (�%��,%a )%�%�%E�O*j *Oa +_ ,%a -a .a /a 0mva 1ma 2a 3a 4ka 5 6O_ 7a 8,a 9  v)j+ :O*j *O�a ;b   a <e� Oa =a -a >a ?a @mva 1ma 2a Aa 4ka 5 6O_ 7a 8,a B  
)j+ CY _ 7a 8,a D  
)j+ EY hY s)j+ :O*j *O�a ;b   a <e� Oa Fa -a Ga Ha Imva 1ma 2a Ja 4ka 5 6O_ 7a 8,a K  
)j+ CY _ 7a 8,a L  
)j+ EY hO)j+ MW X N Oh� ��?���������� 0 openfas openFAS��  ��  �  � Q����
�� .ascrnoop****      � ****
�� .miscactvnull��� ��� obj �� � *j O*j U� ��^���������� 0 scpt_bak  ��  ��  � ������ 0 jp_scpt  �� 
0 mv_cmd  � ����������o���������
�� afdrfasf
�� 
from
�� fldmfldl
�� .earsffdralis        afdr
�� 
psxp
�� .sysoexecTEXT���     TEXT��  ��  �� , $���l �,�%E�O�%�%�%�%E�O�j 	W X 
 h� ������������� 0 mv_scpt  ��  ��  � ���� 0 scpt  � �������������6����������
�� afdrfasf
�� 
from
�� fldmfldl
�� .earsffdralis        afdr
�� 
TEXT
�� 
alis
�� 
insh
�� 
trsh
�� .coremoveobj        obj ��  ��  �� + #���l �&�%�&E�O� ��*�,l 
UW X  h� �����������
�� .aevtoappnull  �   � ****� k     G��  #��  &��  G����  ��  ��  �  � �� /�� 1�� 7 : <������ C���������� T�� g��
�� .miscactvnull��� ��� obj 
�� 
ret 
�� 
btns
�� 
dflt
�� 
cbtn
�� 
appr
�� 
disp�� 

�� .sysodlogaskr        TEXT
�� 
rslt
�� 
bhit�� 0 create_jobqueue  �� 0 install_jobqueue  �� H*j  O��%�%����mv�m�k���k� O�a ,a   
)j+ Y �a ,a   
)j+ Y h ascr  ��ޭ