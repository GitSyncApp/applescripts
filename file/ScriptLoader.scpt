FasdUAS 1.101.10   ��   ��    k             l        	  j     �� 
�� 0 scriptloader ScriptLoader 
 I    �� ��
�� .sysoloadscpt        file  4     �� 
�� 
alis  l    ����  b        l    ����  I   ��  
�� .earsffdralis        afdr  m    ��
�� afdrscr�  ��  
�� 
from  m    ��
�� fldmfldu  �� ��
�� 
rtyp  m    ��
�� 
ctxt��  ��  ��    m       �   , f i l e : S c r i p t L o a d e r . s c p t��  ��  ��    1 +prerequisite for loading .applescript files    	 �   V p r e r e q u i s i t e   f o r   l o a d i n g   . a p p l e s c r i p t   f i l e s      j    *�� �� 0 
fileparser 
FileParser  n   )    n   )    I    )��  ���� 0 load_script      !�� ! 4    %�� "
�� 
alis " l   $ #���� # b    $ $ % $ l   " &���� & I   "�� ' (
�� .earsffdralis        afdr ' m    ��
�� afdrscr� ( �� ) *
�� 
from ) m    ��
�� fldmfldu * �� +��
�� 
rtyp + m    ��
�� 
ctxt��  ��  ��   % m   " # , , � - - 6 f i l e : F i l e P a r s e r . a p p l e s c r i p t��  ��  ��  ��    o    ���� 0 scriptloader ScriptLoader   f       . / . l      �� 0 1��   0 1 +
 * Loads many scripts at a specific path
     1 � 2 2 V 
   *   L o a d s   m a n y   s c r i p t s   a t   a   s p e c i f i c   p a t h 
   /  3 4 3 i   + . 5 6 5 I      �������� 0 	load_many  ��  ��   6 k       7 7  8 9 8 l     �� : ;��   :  get files in a folder    ; � < < * g e t   f i l e s   i n   a   f o l d e r 9  = > = l     �� ? @��   ? @ :get extension for each file and make sure its .applescript    @ � A A t g e t   e x t e n s i o n   f o r   e a c h   f i l e   a n d   m a k e   s u r e   i t s   . a p p l e s c r i p t >  B�� B l     �� C D��   C B <make a note that it can also support .scpt in a later update    D � E E x m a k e   a   n o t e   t h a t   i t   c a n   a l s o   s u p p o r t   . s c p t   i n   a   l a t e r   u p d a t e��   4  F G F l      �� H I��   H 1 +
 * Loads many scripts at a relative path
     I � J J V 
   *   L o a d s   m a n y   s c r i p t s   a t   a   r e l a t i v e   p a t h 
   G  K L K i   / 2 M N M I      �������� 0 relative_load_many  ��  ��   N l     �� O P��   O 1 +same as load_many, but with a relative path    P � Q Q V s a m e   a s   l o a d _ m a n y ,   b u t   w i t h   a   r e l a t i v e   p a t h L  R S R l      �� T U��   T  
 *
     U � V V 
 
   * 
   S  W X W i   3 6 Y Z Y I      �� [���� 0 load   [  \ ] \ o      ���� 0 	hsf_alias   ]  ^�� ^ o      ���� 0 	file_name  ��  ��   Z k      _ _  ` a ` l     b c d b r      e f e b      g h g l     i���� i c      j k j o     ���� 0 	hsf_alias   k m    ��
�� 
ctxt��  ��   h o    ���� 0 	file_name   f o      ���� 0 the_file_path   c V Pcombines the path and the file name into "folder:sub_folder:file.txt" hsf format    d � l l � c o m b i n e s   t h e   p a t h   a n d   t h e   f i l e   n a m e   i n t o   " f o l d e r : s u b _ f o l d e r : f i l e . t x t "   h s f   f o r m a t a  m�� m l    n o p n L     q q I    �� r���� 0 load_script   r  s�� s 4   	 �� t
�� 
alis t o    ���� 0 the_file_path  ��  ��   o g afinally makes the hsf_file path into an alias hsf file path and then calls the load_script method    p � u u � f i n a l l y   m a k e s   t h e   h s f _ f i l e   p a t h   i n t o   a n   a l i a s   h s f   f i l e   p a t h   a n d   t h e n   c a l l s   t h e   l o a d _ s c r i p t   m e t h o d��   X  v w v l      �� x y��   x��
 * Note: we use load_script to load plain-text .applescript files, which cant be loaded directly without this method
 * Note: we use .applescript instead of .scpt files because its easier to put plain text script files under version control like github
 * Note: You can load compiled scripts (.scpt) or plain text scripts (.applescript). Make sure, though, that your .applescript files are encoded as either Mac (what AppleScript Editor uses) UTF-8 (if you use another text editor). Any scripts loaded are expected to be installed into your Scripts directory. Use the line below to reference the script:
 * Remember to import this method before you use it with a property: 
 * Example: 
 * property ScriptLoader : load script alias ((path to scripts folder from user domain as text) & "file:ScriptLoader.scpt")--prerequisite for loading .applescript files * property ListAsserter : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "list:ListAsserter.applescript"))  * my ListAsserter's equals_to({1, 2, 3, 4}, {1, 2, 3, 4})
 * if my ListAsserter's equals_to({1, 2, 3, 4}, {1, 2, 3, 4}) then *		log "yes" *	else *		log "no" *	end if
 * @Param: apple_script_path: is an "alias hsf file path"
     y � z z	� 
   *   N o t e :   w e   u s e   l o a d _ s c r i p t   t o   l o a d   p l a i n - t e x t   . a p p l e s c r i p t   f i l e s ,   w h i c h   c a n t   b e   l o a d e d   d i r e c t l y   w i t h o u t   t h i s   m e t h o d 
   *   N o t e :   w e   u s e   . a p p l e s c r i p t   i n s t e a d   o f   . s c p t   f i l e s   b e c a u s e   i t s   e a s i e r   t o   p u t   p l a i n   t e x t   s c r i p t   f i l e s   u n d e r   v e r s i o n   c o n t r o l   l i k e   g i t h u b 
   *   N o t e :   Y o u   c a n   l o a d   c o m p i l e d   s c r i p t s   ( . s c p t )   o r   p l a i n   t e x t   s c r i p t s   ( . a p p l e s c r i p t ) .   M a k e   s u r e ,   t h o u g h ,   t h a t   y o u r   . a p p l e s c r i p t   f i l e s   a r e   e n c o d e d   a s   e i t h e r   M a c   ( w h a t   A p p l e S c r i p t   E d i t o r   u s e s )   U T F - 8   ( i f   y o u   u s e   a n o t h e r   t e x t   e d i t o r ) .   A n y   s c r i p t s   l o a d e d   a r e   e x p e c t e d   t o   b e   i n s t a l l e d   i n t o   y o u r   S c r i p t s   d i r e c t o r y .   U s e   t h e   l i n e   b e l o w   t o   r e f e r e n c e   t h e   s c r i p t : 
   *   R e m e m b e r   t o   i m p o r t   t h i s   m e t h o d   b e f o r e   y o u   u s e   i t   w i t h   a   p r o p e r t y :   
   *   E x a m p l e :   
   *   p r o p e r t y   S c r i p t L o a d e r   :   l o a d   s c r i p t   a l i a s   ( ( p a t h   t o   s c r i p t s   f o l d e r   f r o m   u s e r   d o m a i n   a s   t e x t )   &   " f i l e : S c r i p t L o a d e r . s c p t " ) - - p r e r e q u i s i t e   f o r   l o a d i n g   . a p p l e s c r i p t   f i l e s    *   p r o p e r t y   L i s t A s s e r t e r   :   m y   S c r i p t L o a d e r ' s   l o a d _ s c r i p t ( a l i a s   ( ( p a t h   t o   s c r i p t s   f o l d e r   f r o m   u s e r   d o m a i n   a s   t e x t )   &   " l i s t : L i s t A s s e r t e r . a p p l e s c r i p t " ) )      *   m y   L i s t A s s e r t e r ' s   e q u a l s _ t o ( { 1 ,   2 ,   3 ,   4 } ,   { 1 ,   2 ,   3 ,   4 } ) 
   *   i f   m y   L i s t A s s e r t e r ' s   e q u a l s _ t o ( { 1 ,   2 ,   3 ,   4 } ,   { 1 ,   2 ,   3 ,   4 } )   t h e n    * 	 	 l o g   " y e s "    * 	 e l s e    * 	 	 l o g   " n o "    * 	 e n d   i f 
   *   @ P a r a m :   a p p l e _ s c r i p t _ p a t h :   i s   a n   " a l i a s   h s f   f i l e   p a t h " 
   w  { | { i   7 : } ~ } I      �� ���� 0 load_script     ��� � o      ���� 0 apple_script_path  ��  ��   ~ k     { � �  � � � Q     x � � � � r    
 � � � I   �� ���
�� .sysoloadscpt        file � o    ���� 0 apple_script_path  ��   � o      ���� 0 script_object   � R      ���� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � d       � � m      �������   � l   x � � � � k    x � �  � � � r     � � � m     � � � � �   � o      ���� 0 script_text   �  � � � Q    1 � � � � l     � � � � r      � � � I   �� ���
�� .rdwrread****        **** � o    ���� 0 apple_script_path  ��   � o      ���� 0 script_text   � ( " Try reading as Mac encoding first    � � � � D   T r y   r e a d i n g   a s   M a c   e n c o d i n g   f i r s t � R      ���� �
�� .ascrerr ****      � ****��   � �� ���
�� 
errn � d       � � m      �������   � l  ( 1 � � � � l  ( 1 � � � � r   ( 1 � � � I  ( /�� � �
�� .rdwrread****        **** � o   ( )���� 0 apple_script_path   � �� ���
�� 
as   � m   * +��
�� 
utf8��   � o      ���� 0 script_text   �   Finally try UTF-8    � � � � $   F i n a l l y   t r y   U T F - 8 � &   Error reading script's encoding    � � � � @   E r r o r   r e a d i n g   s c r i p t ' s   e n c o d i n g �  ��� � Q   2 x � � � � r   5 H � � � I  5 F�� ���
�� .sysodsct****        scpt � l  5 B ����� � b   5 B � � � b   5 @ � � � b   5 > � � � b   5 < � � � b   5 : � � � b   5 8 � � � m   5 6 � � � � �  s c r i p t   s � o   6 7��
�� 
ret  � o   8 9���� 0 script_text   � o   : ;��
�� 
ret  � m   < = � � � � �  e n d   s c r i p t   � o   > ?��
�� 
ret  � m   @ A � � � � �  r e t u r n   s��  ��  ��   � o      ���� 0 script_object   � R      �� � �
�� .ascrerr ****      � **** � o      ���� 0 e   � �� � �
�� 
errn � o      ���� 0 n   � �� � �
�� 
ptlr � o      ���� 0 p   � �� � �
�� 
erob � o      ���� 0 f   � �� ���
�� 
errt � o      ���� 0 t  ��   � k   P x � �  � � � I  P a�� ���
�� .sysodlogaskr        TEXT � b   P ] � � � b   P Y � � � b   P W � � � b   P S � � � m   P Q � � � � � , E r r o r   r e a d i n g   l i b r a r y   � o   Q R���� 0 apple_script_path   � m   S V � � � � �    � o   W X���� 0 e   � m   Y \ � � � � � : P l e a s e   e n c o d e   a s   M a c   o r   U T F - 8��   �  ��� � R   b x�� � �
�� .ascrerr ****      � **** � o   v w���� 0 e   � �� � �
�� 
errn � o   f g���� 0 n   � �� � �
�� 
ptlr � o   j k���� 0 p   � �� � �
�� 
erob � o   n o���� 0 f   � � ��~
� 
errt � o   r s�}�} 0 t  �~  ��  ��   �   text format script     � � � � (   t e x t   f o r m a t   s c r i p t   �  ��| � l  y { � � � � L   y { � � o   y z�{�{ 0 script_object   � + %return the script, it is now loadable    � � � � J r e t u r n   t h e   s c r i p t ,   i t   i s   n o w   l o a d a b l e�|   |  � � � l     ��z�y � I     �x ��w�x 0 load   �  � � � I   �v ��u
�v .earsffdralis        afdr �  f    �u   �    m     � , F i l e P a r s e r . a p p l e s c r i p t �t m    �s�s���t  �w  �z  �y   �  l      �r�r  MG
 * NOTE: this method is a little strange, it serves as a simple way to load script files relative to the position of the script that is loading it.
 * Example: property FileParser : ScriptLoader's load(path to me, "FileParser.applescript",-1)--loads the script
 * @PARAM: the path_offset is used to offset the path backwards
     �		� 
   *   N O T E :   t h i s   m e t h o d   i s   a   l i t t l e   s t r a n g e ,   i t   s e r v e s   a s   a   s i m p l e   w a y   t o   l o a d   s c r i p t   f i l e s   r e l a t i v e   t o   t h e   p o s i t i o n   o f   t h e   s c r i p t   t h a t   i s   l o a d i n g   i t . 
   *   E x a m p l e :   p r o p e r t y   F i l e P a r s e r   :   S c r i p t L o a d e r ' s   l o a d ( p a t h   t o   m e ,   " F i l e P a r s e r . a p p l e s c r i p t " , - 1 ) - - l o a d s   t h e   s c r i p t 
   *   @ P A R A M :   t h e   p a t h _ o f f s e t   i s   u s e d   t o   o f f s e t   t h e   p a t h   b a c k w a r d s 
   
�q
 i   ; > I      �p�o�p 0 relative_load    o      �n�n 0 	hsf_alias    o      �m�m 0 	file_name   �l o      �k�k 0 path_offset  �l  �o   k     %  r      o     �j�j 0 	hsf_alias   o      �i�i 0 the_offset_file_path    Y    �h�g k      l   �f !�f     log i   ! �"" 
 l o g   i #�e# r    $%$ 4    �d&
�d 
alis& l   '�c�b' b    ()( l   *�a�`* c    +,+ o    �_�_ 0 the_offset_file_path  , m    �^
�^ 
ctxt�a  �`  ) m    -- �..  : :�c  �b  % o      �]�] 0 the_offset_file_path  �e  �h 0 i   o    �\�\ 0 path_offset   m    	�[�[���g   /0/ l   �Z12�Z  1  log the_offset_file_path   2 �33 0 l o g   t h e _ o f f s e t _ f i l e _ p a t h0 4�Y4 I    %�X5�W�X 0 load  5 676 o     �V�V 0 the_offset_file_path  7 8�U8 o     !�T�T 0 	file_name  �U  �W  �Y  �q       
�S9:;<=>?@A�S  9 �R�Q�P�O�N�M�L�K�R 0 scriptloader ScriptLoader�Q 0 
fileparser 
FileParser�P 0 	load_many  �O 0 relative_load_many  �N 0 load  �M 0 load_script  �L 0 relative_load  
�K .aevtoappnull  �   � ****: �JB C�J  B k      DD EFE l      �IGH�I  G 1 +
 * Loads many scripts at a specific path
    H �II V 
   *   L o a d s   m a n y   s c r i p t s   a t   a   s p e c i f i c   p a t h 
  F JKJ i     LML I      �H�G�F�H 0 	load_many  �G  �F  M k      NN OPO l     �EQR�E  Q  get files in a folder   R �SS * g e t   f i l e s   i n   a   f o l d e rP TUT l     �DVW�D  V @ :get extension for each file and make sure its .applescript   W �XX t g e t   e x t e n s i o n   f o r   e a c h   f i l e   a n d   m a k e   s u r e   i t s   . a p p l e s c r i p tU Y�CY l     �BZ[�B  Z B <make a note that it can also support .scpt in a later update   [ �\\ x m a k e   a   n o t e   t h a t   i t   c a n   a l s o   s u p p o r t   . s c p t   i n   a   l a t e r   u p d a t e�C  K ]^] l      �A_`�A  _ 1 +
 * Loads many scripts at a relative path
    ` �aa V 
   *   L o a d s   m a n y   s c r i p t s   a t   a   r e l a t i v e   p a t h 
  ^ bcb i    ded I      �@�?�>�@ 0 relative_load_many  �?  �>  e l     �=fg�=  f 1 +same as load_many, but with a relative path   g �hh V s a m e   a s   l o a d _ m a n y ,   b u t   w i t h   a   r e l a t i v e   p a t hc iji l      �<kl�<  k  
 *
    l �mm 
 
   * 
  j non i    pqp I      �;r�:�; 0 load  r sts o      �9�9 0 	hsf_alias  t u�8u o      �7�7 0 	file_name  �8  �:  q k     vv wxw l    yz{y r     |}| b     ~~ l    ��6�5� c     ��� o     �4�4 0 	hsf_alias  � m    �3
�3 
ctxt�6  �5   o    �2�2 0 	file_name  } o      �1�1 0 the_file_path  z V Pcombines the path and the file name into "folder:sub_folder:file.txt" hsf format   { ��� � c o m b i n e s   t h e   p a t h   a n d   t h e   f i l e   n a m e   i n t o   " f o l d e r : s u b _ f o l d e r : f i l e . t x t "   h s f   f o r m a tx ��0� l   ���� L    �� I    �/��.�/ 0 load_script  � ��-� 4   	 �,�
�, 
alis� o    �+�+ 0 the_file_path  �-  �.  � g afinally makes the hsf_file path into an alias hsf file path and then calls the load_script method   � ��� � f i n a l l y   m a k e s   t h e   h s f _ f i l e   p a t h   i n t o   a n   a l i a s   h s f   f i l e   p a t h   a n d   t h e n   c a l l s   t h e   l o a d _ s c r i p t   m e t h o d�0  o ��� l      �*���*  ���
 * Note: we use load_script to load plain-text .applescript files, which cant be loaded directly without this method
 * Note: we use .applescript instead of .scpt files because its easier to put plain text script files under version control like github
 * Note: You can load compiled scripts (.scpt) or plain text scripts (.applescript). Make sure, though, that your .applescript files are encoded as either Mac (what AppleScript Editor uses) UTF-8 (if you use another text editor). Any scripts loaded are expected to be installed into your Scripts directory. Use the line below to reference the script:
 * Remember to import this method before you use it with a property: 
 * Example: 
 * property ScriptLoader : load script alias ((path to scripts folder from user domain as text) & "file:ScriptLoader.scpt")--prerequisite for loading .applescript files * property ListAsserter : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "list:ListAsserter.applescript"))  * my ListAsserter's equals_to({1, 2, 3, 4}, {1, 2, 3, 4})
 * if my ListAsserter's equals_to({1, 2, 3, 4}, {1, 2, 3, 4}) then *		log "yes" *	else *		log "no" *	end if
 * @Param: apple_script_path: is an "alias hsf file path"
    � ���	� 
   *   N o t e :   w e   u s e   l o a d _ s c r i p t   t o   l o a d   p l a i n - t e x t   . a p p l e s c r i p t   f i l e s ,   w h i c h   c a n t   b e   l o a d e d   d i r e c t l y   w i t h o u t   t h i s   m e t h o d 
   *   N o t e :   w e   u s e   . a p p l e s c r i p t   i n s t e a d   o f   . s c p t   f i l e s   b e c a u s e   i t s   e a s i e r   t o   p u t   p l a i n   t e x t   s c r i p t   f i l e s   u n d e r   v e r s i o n   c o n t r o l   l i k e   g i t h u b 
   *   N o t e :   Y o u   c a n   l o a d   c o m p i l e d   s c r i p t s   ( . s c p t )   o r   p l a i n   t e x t   s c r i p t s   ( . a p p l e s c r i p t ) .   M a k e   s u r e ,   t h o u g h ,   t h a t   y o u r   . a p p l e s c r i p t   f i l e s   a r e   e n c o d e d   a s   e i t h e r   M a c   ( w h a t   A p p l e S c r i p t   E d i t o r   u s e s )   U T F - 8   ( i f   y o u   u s e   a n o t h e r   t e x t   e d i t o r ) .   A n y   s c r i p t s   l o a d e d   a r e   e x p e c t e d   t o   b e   i n s t a l l e d   i n t o   y o u r   S c r i p t s   d i r e c t o r y .   U s e   t h e   l i n e   b e l o w   t o   r e f e r e n c e   t h e   s c r i p t : 
   *   R e m e m b e r   t o   i m p o r t   t h i s   m e t h o d   b e f o r e   y o u   u s e   i t   w i t h   a   p r o p e r t y :   
   *   E x a m p l e :   
   *   p r o p e r t y   S c r i p t L o a d e r   :   l o a d   s c r i p t   a l i a s   ( ( p a t h   t o   s c r i p t s   f o l d e r   f r o m   u s e r   d o m a i n   a s   t e x t )   &   " f i l e : S c r i p t L o a d e r . s c p t " ) - - p r e r e q u i s i t e   f o r   l o a d i n g   . a p p l e s c r i p t   f i l e s    *   p r o p e r t y   L i s t A s s e r t e r   :   m y   S c r i p t L o a d e r ' s   l o a d _ s c r i p t ( a l i a s   ( ( p a t h   t o   s c r i p t s   f o l d e r   f r o m   u s e r   d o m a i n   a s   t e x t )   &   " l i s t : L i s t A s s e r t e r . a p p l e s c r i p t " ) )      *   m y   L i s t A s s e r t e r ' s   e q u a l s _ t o ( { 1 ,   2 ,   3 ,   4 } ,   { 1 ,   2 ,   3 ,   4 } ) 
   *   i f   m y   L i s t A s s e r t e r ' s   e q u a l s _ t o ( { 1 ,   2 ,   3 ,   4 } ,   { 1 ,   2 ,   3 ,   4 } )   t h e n    * 	 	 l o g   " y e s "    * 	 e l s e    * 	 	 l o g   " n o "    * 	 e n d   i f 
   *   @ P a r a m :   a p p l e _ s c r i p t _ p a t h :   i s   a n   " a l i a s   h s f   f i l e   p a t h " 
  � ��� i    ��� I      �)��(�) 0 load_script  � ��'� o      �&�& 0 apple_script_path  �'  �(  � k     {�� ��� Q     x���� r    
��� I   �%��$
�% .sysoloadscpt        file� o    �#�# 0 apple_script_path  �$  � o      �"�" 0 script_object  � R      �!� �
�! .ascrerr ****      � ****�   � ���
� 
errn� d      �� m      ����  � l   x���� k    x�� ��� r    ��� m    �� ���  � o      �� 0 script_text  � ��� Q    1���� l    ���� r     ��� I   ���
� .rdwrread****        ****� o    �� 0 apple_script_path  �  � o      �� 0 script_text  � ( " Try reading as Mac encoding first   � ��� D   T r y   r e a d i n g   a s   M a c   e n c o d i n g   f i r s t� R      ���
� .ascrerr ****      � ****�  � ���
� 
errn� d      �� m      ����  � l  ( 1���� l  ( 1���� r   ( 1��� I  ( /���
� .rdwrread****        ****� o   ( )�� 0 apple_script_path  � ���
� 
as  � m   * +�
� 
utf8�  � o      �� 0 script_text  �   Finally try UTF-8   � ��� $   F i n a l l y   t r y   U T F - 8� &   Error reading script's encoding   � ��� @   E r r o r   r e a d i n g   s c r i p t ' s   e n c o d i n g� ��� Q   2 x���� r   5 H��� I  5 F���

� .sysodsct****        scpt� l  5 B��	�� b   5 B��� b   5 @��� b   5 >��� b   5 <��� b   5 :��� b   5 8��� m   5 6�� ���  s c r i p t   s� o   6 7�
� 
ret � o   8 9�� 0 script_text  � o   : ;�
� 
ret � m   < =�� ���  e n d   s c r i p t  � o   > ?�
� 
ret � m   @ A�� ���  r e t u r n   s�	  �  �
  � o      �� 0 script_object  � R      ���
� .ascrerr ****      � ****� o      �� 0 e  � � ��
�  
errn� o      ���� 0 n  � ����
�� 
ptlr� o      ���� 0 p  � ����
�� 
erob� o      ���� 0 f  � �����
�� 
errt� o      ���� 0 t  ��  � k   P x�� ��� I  P a�����
�� .sysodlogaskr        TEXT� b   P ]��� b   P Y��� b   P W��� b   P S��� m   P Q�� ��� , E r r o r   r e a d i n g   l i b r a r y  � o   Q R���� 0 apple_script_path  � m   S V�� ���   � o   W X���� 0 e  � m   Y \�� ��� : P l e a s e   e n c o d e   a s   M a c   o r   U T F - 8��  � ���� R   b x�� 
�� .ascrerr ****      � ****  o   v w���� 0 e   ��
�� 
errn o   f g���� 0 n   ��
�� 
ptlr o   j k���� 0 p   ��
�� 
erob o   n o���� 0 f   ����
�� 
errt o   r s���� 0 t  ��  ��  �  �   text format script    � �		 (   t e x t   f o r m a t   s c r i p t  � 
��
 l  y { L   y { o   y z���� 0 script_object   + %return the script, it is now loadable    � J r e t u r n   t h e   s c r i p t ,   i t   i s   n o w   l o a d a b l e��  �  l    ���� I     ������ 0 load    I   ����
�� .earsffdralis        afdr  f    ��    m     � , F i l e P a r s e r . a p p l e s c r i p t �� m    ��������  ��  ��  ��    l      ����  MG
 * NOTE: this method is a little strange, it serves as a simple way to load script files relative to the position of the script that is loading it.
 * Example: property FileParser : ScriptLoader's load(path to me, "FileParser.applescript",-1)--loads the script
 * @PARAM: the path_offset is used to offset the path backwards
     �  � 
   *   N O T E :   t h i s   m e t h o d   i s   a   l i t t l e   s t r a n g e ,   i t   s e r v e s   a s   a   s i m p l e   w a y   t o   l o a d   s c r i p t   f i l e s   r e l a t i v e   t o   t h e   p o s i t i o n   o f   t h e   s c r i p t   t h a t   i s   l o a d i n g   i t . 
   *   E x a m p l e :   p r o p e r t y   F i l e P a r s e r   :   S c r i p t L o a d e r ' s   l o a d ( p a t h   t o   m e ,   " F i l e P a r s e r . a p p l e s c r i p t " , - 1 ) - - l o a d s   t h e   s c r i p t 
   *   @ P A R A M :   t h e   p a t h _ o f f s e t   i s   u s e d   t o   o f f s e t   t h e   p a t h   b a c k w a r d s 
   !��! i    "#" I      ��$���� 0 relative_load  $ %&% o      ���� 0 	hsf_alias  & '(' o      ���� 0 	file_name  ( )��) o      ���� 0 path_offset  ��  ��  # k     %** +,+ r     -.- o     ���� 0 	hsf_alias  . o      ���� 0 the_offset_file_path  , /0/ Y    1��23��1 k    44 565 l   ��78��  7  log i   8 �99 
 l o g   i6 :��: r    ;<; 4    ��=
�� 
alis= l   >����> b    ?@? l   A����A c    BCB o    ���� 0 the_offset_file_path  C m    ��
�� 
ctxt��  ��  @ m    DD �EE  : :��  ��  < o      ���� 0 the_offset_file_path  ��  �� 0 i  2 o    ���� 0 path_offset  3 m    	��������  0 FGF l   ��HI��  H  log the_offset_file_path   I �JJ 0 l o g   t h e _ o f f s e t _ f i l e _ p a t hG K��K I    %��L���� 0 load  L MNM o     ���� 0 the_offset_file_path  N O��O o     !���� 0 	file_name  ��  ��  ��  ��  C ��PQRSTUV��  P �������������� 0 	load_many  �� 0 relative_load_many  �� 0 load  �� 0 load_script  �� 0 relative_load  
�� .aevtoappnull  �   � ****Q ��M����WX���� 0 	load_many  ��  ��  W  X  �� hR ��e����YZ���� 0 relative_load_many  ��  ��  Y  Z  �� hS ��q����[\���� 0 load  �� ��]�� ]  ������ 0 	hsf_alias  �� 0 	file_name  ��  [ �������� 0 	hsf_alias  �� 0 	file_name  �� 0 the_file_path  \ ������
�� 
ctxt
�� 
alis�� 0 load_script  �� ��&�%E�O**�/k+ T �������^_���� 0 load_script  �� ��`�� `  ���� 0 apple_script_path  ��  ^ ������������������ 0 apple_script_path  �� 0 script_object  �� 0 script_text  �� 0 e  �� 0 n  �� 0 p  �� 0 f  �� 0 t  _ ����a���b�������������c���������������
�� .sysoloadscpt        file��  a ������
�� 
errn���(��  
�� .rdwrread****        ****b ������
�� 
errn���\��  
�� 
as  
�� 
utf8
�� 
ret 
�� .sysodsct****        scpt�� 0 e  c ���d
�� 
errn� 0 n  d �~�}e
�~ 
ptlr�} 0 p  e �|�{f
�| 
erob�{ 0 f  f �z�y�x
�z 
errt�y 0 t  �x  
�� .sysodlogaskr        TEXT
�� 
errn
�� 
ptlr
�� 
erob
�� 
errt�� �� | �j  E�W mX  �E�O �j E�W X  ���l E�O ��%�%�%�%�%�%j E�W /X  �%a %�%a %j O)a �a �a �a �a �O�U �w#�v�ugh�t�w 0 relative_load  �v �si�s i  �r�q�p�r 0 	hsf_alias  �q 0 	file_name  �p 0 path_offset  �u  g �o�n�m�l�k�o 0 	hsf_alias  �n 0 	file_name  �m 0 path_offset  �l 0 the_offset_file_path  �k 0 i  h �j�iD�h
�j 
alis
�i 
ctxt�h 0 load  �t &�E�O �ikh *��&�%/E�[OY��O*��l+ V �gj�f�ekl�d
�g .aevtoappnull  �   � ****j k     mm �c�c  �f  �e  k  l �b�a
�b .earsffdralis        afdr�a 0 load  �d *)j  �im+ ; �`nop�` 0 s  n k      qq rsr l     �_tu�_  t � �property FileParser : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "file:FileParser.applescript"))   u �vv p r o p e r t y   F i l e P a r s e r   :   m y   S c r i p t L o a d e r ' s   l o a d _ s c r i p t ( a l i a s   ( ( p a t h   t o   s c r i p t s   f o l d e r   f r o m   u s e r   d o m a i n   a s   t e x t )   &   " f i l e : F i l e P a r s e r . a p p l e s c r i p t " ) )s wxw l     yz{y j     �^|�^ 0 scriptloader ScriptLoader| I    �]}�\
�] .sysoloadscpt        file} 4     �[~
�[ 
alis~ l   �Z�Y b    ��� l   ��X�W� I   �V��
�V .earsffdralis        afdr� m    �U
�U afdrscr�� �T��
�T 
from� m    �S
�S fldmfldu� �R��Q
�R 
rtyp� m    �P
�P 
ctxt�Q  �X  �W  � m    �� ��� , f i l e : S c r i p t L o a d e r . s c p t�Z  �Y  �\  z 1 +prerequisite for loading .applescript files   { ��� V p r e r e q u i s i t e   f o r   l o a d i n g   . a p p l e s c r i p t   f i l e sx ��� j    *�O��O 0 
textparser 
TextParser� n   )��� n   )��� I    )�N��M�N 0 load_script  � ��L� 4    %�K�
�K 
alis� l   $��J�I� b    $��� l   "��H�G� I   "�F��
�F .earsffdralis        afdr� m    �E
�E afdrscr�� �D��
�D 
from� m    �C
�C fldmfldu� �B��A
�B 
rtyp� m    �@
�@ 
ctxt�A  �H  �G  � m   " #�� ��� 6 t e x t : T e x t P a r s e r . a p p l e s c r i p t�J  �I  �L  �M  � o    �?�? 0 scriptloader ScriptLoader�  f    � ��� l      �>���>  � � �
 * Only works if the file actually exists akak an alias
 * Reads the actual file
 * Example: FileParser's read_URL(POSIX path of (((path to desktop) as string) & "colors.xml"))--returns the content of xml on the desktop
    � ���� 
   *   O n l y   w o r k s   i f   t h e   f i l e   a c t u a l l y   e x i s t s   a k a k   a n   a l i a s 
   *   R e a d s   t h e   a c t u a l   f i l e 
   *   E x a m p l e :   F i l e P a r s e r ' s   r e a d _ U R L ( P O S I X   p a t h   o f   ( ( ( p a t h   t o   d e s k t o p )   a s   s t r i n g )   &   " c o l o r s . x m l " ) ) - - r e t u r n s   t h e   c o n t e n t   o f   x m l   o n   t h e   d e s k t o p 
  � ��� i   + .��� I      �=��<�= 0 read_url read_URL� ��;� o      �:�: 0 file_url file_URL�;  �<  � L     	�� l    ��9�8� I    �7��6
�7 .rdwrread****        ****� 4     �5�
�5 
psxf� o    �4�4 0 file_url file_URL�6  �9  �8  � ��� l      �3���3  � � }
 * Returns the POSIX path from a file path
 * Example: posix_path(Macintosh HD:Users:John:project:--"/Users/John/project/"
    � ��� � 
   *   R e t u r n s   t h e   P O S I X   p a t h   f r o m   a   f i l e   p a t h 
   *   E x a m p l e :   p o s i x _ p a t h ( M a c i n t o s h   H D : U s e r s : J o h n : p r o j e c t : - - " / U s e r s / J o h n / p r o j e c t / " 
  � ��� i   / 2��� I      �2��1�2 0 
posix_path  � ��0� o      �/�/ 0 the_path  �0  �1  � L     �� n     ��� 1    �.
�. 
psxp� o     �-�- 0 the_path  � ��� l      �,���,  � K E
 * Returns the file url from a file path
 * Todo: write an example
    � ��� � 
   *   R e t u r n s   t h e   f i l e   u r l   f r o m   a   f i l e   p a t h 
   *   T o d o :   w r i t e   a n   e x a m p l e 
  � ��� i   3 6��� I      �+��*�+ 0 file_url file_URL� ��)� o      �(�( 0 	file_path  �)  �*  � k     �� ��� l     �'���'  � + %log "fileURL() filePath: " & filePath   � ��� J l o g   " f i l e U R L ( )   f i l e P a t h :   "   &   f i l e P a t h� ��&� O     ��� k    �� ��� r    	��� n    ��� 1    �%
�% 
url � o    �$�$ 0 	file_path  � o      �#�# 0 the_url the_URL� ��� l  
 
�"���"  � ! log ("the_URL: " & the_URL)   � ��� 6 l o g   ( " t h e _ U R L :   "   &   t h e _ U R L )� ��!� L   
 �� o   
 � �  0 the_url the_URL�!  � m     ���                                                                                  sevs  alis    �  Macintosh HD               Ё��H+    System Events.app                                               �5>�        ����  	                CoreServices    Ё{�      �5"�         �   �  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �&  � ��� l      ����  � � �
 * Returns a "hfs alias path" from a "POSIX path"
 * Example file_path(POSIX path of (path to desktop)): --"alias Macintosh HD:Users:John:Desktop:"
    � ���, 
   *   R e t u r n s   a   " h f s   a l i a s   p a t h "   f r o m   a   " P O S I X   p a t h " 
   *   E x a m p l e   f i l e _ p a t h ( P O S I X   p a t h   o f   ( p a t h   t o   d e s k t o p ) ) :   - - " a l i a s   M a c i n t o s h   H D : U s e r s : J o h n : D e s k t o p : " 
  � ��� i   7 :��� I      ���� 0 	file_path  � ��� o      �� 0 fileurl fileURL�  �  � k     �� ��� r     ��� 4     ��
� 
psxf� o    �� 0 fileurl fileURL� o      �� 0 
posix_file  � ��� L    �� c    
��� o    �� 0 
posix_file  � m    	�
� 
alis�  � ��� l      ����  � � }
 * Returns a "hsf path" from an "alias hsf path"
 * Example: hfs_path(path to desktop)--"Macintosh HD:Users:John:Desktop:"
    � ��� � 
   *   R e t u r n s   a   " h s f   p a t h "   f r o m   a n   " a l i a s   h s f   p a t h " 
   *   E x a m p l e :   h f s _ p a t h ( p a t h   t o   d e s k t o p ) - - " M a c i n t o s h   H D : U s e r s : J o h n : D e s k t o p : " 
  � ��� i   ; >��� I      ���� 0 hfs_path  � ��� o      �� 0 	file_path  �  �  � l       L      c      o     �� 0 	file_path   m    �
� 
ctxt ! string and text can be used    � 6 s t r i n g   a n d   t e x t   c a n   b e   u s e d�  l      �	
�  	 � �
 * Param the_hsf_file_path: Macintosh HD:Users:John:project:Text.txt
 * Returns: an alias object with the hsf file path
 * Note: you can cast as alias and as text to convert back and forth from hsf and alias hsf
    
 �� 
   *   P a r a m   t h e _ h s f _ f i l e _ p a t h :   M a c i n t o s h   H D : U s e r s : J o h n : p r o j e c t : T e x t . t x t 
   *   R e t u r n s :   a n   a l i a s   o b j e c t   w i t h   t h e   h s f   f i l e   p a t h 
   *   N o t e :   y o u   c a n   c a s t   a s   a l i a s   a n d   a s   t e x t   t o   c o n v e r t   b a c k   a n d   f o r t h   f r o m   h s f   a n d   a l i a s   h s f 
    i   ? B I      ��� 0 alias_file_path   �
 o      �	�	 0 the_hsf_file_path  �
  �   L      c      o     �� 0 the_hsf_file_path   m    �
� 
alis  l      ��    
 * TODO:  Explain
     � ( 
   *   T O D O :     E x p l a i n 
    i   C F I      ��� 0 file_name_by_url   � o      �� 0 file_url file_URL�  �   L        I     �!� � 0 	file_name  ! "��" I    ��#���� 0 	file_path  # $��$ o    ���� 0 file_url file_URL��  ��  ��  �    %&% l      ��'(��  ' : 4
 * Returns the implicit path from a HSF file path
    ( �)) h 
   *   R e t u r n s   t h e   i m p l i c i t   p a t h   f r o m   a   H S F   f i l e   p a t h 
  & *+* i   G J,-, I      ��.���� &0 implicit_file_url implicit_file_URL. /��/ o      ���� 0 hfs_path  ��  ��  - k     00 121 r     	343 n     565 1    ��
�� 
psxp6 o     ���� 0 hfs_path  4 o      ���� 0 
posix_path  2 787 r   
 9:9 b   
 ;<; m   
 == �>>  f i l e : / /< o    ���� 0 
posix_path  : o      ���� &0 implicit_file_url implicit_file_URL8 ?��? L    @@ o    ���� &0 implicit_file_url implicit_file_URL��  + ABA l      ��CD��  C � �
 * Note can be used on files and folders
 * Example: FileParser's parent_folder(path to me)--"folder Macintosh HD:Users:John:projects:SomeProject:"
 * @Param file_path: HFS alias file type
    D �EE~ 
   *   N o t e   c a n   b e   u s e d   o n   f i l e s   a n d   f o l d e r s 
   *   E x a m p l e :   F i l e P a r s e r ' s   p a r e n t _ f o l d e r ( p a t h   t o   m e ) - - " f o l d e r   M a c i n t o s h   H D : U s e r s : J o h n : p r o j e c t s : S o m e P r o j e c t : " 
   *   @ P a r a m   f i l e _ p a t h :   H F S   a l i a s   f i l e   t y p e 
  B FGF i   K NHIH I      ��J���� 0 parent_folder  J K��K o      ���� 0 	file_path  ��  ��  I O     
LML l   	NOPN L    	QQ n    RSR 1    ��
�� 
ctnrS o    ���� 0 	file_path  O 6 0 sets the parent folder of the folder you select   P �TT `   s e t s   t h e   p a r e n t   f o l d e r   o f   t h e   f o l d e r   y o u   s e l e c tM m     UU�                                                                                  sevs  alis    �  Macintosh HD               Ё��H+    System Events.app                                               �5>�        ����  	                CoreServices    Ё{�      �5"�         �   �  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  G VWV l      ��XY��  X � �
 * posix_parent(path to me)--/Users/someUser/Library/Scripts/file/
 * NOTE: This method is great when you dont want to use system events to get the parent
 * NOTE: works on both files and folders
    Y �ZZ� 
   *   p o s i x _ p a r e n t ( p a t h   t o   m e ) - - / U s e r s / s o m e U s e r / L i b r a r y / S c r i p t s / f i l e / 
   *   N O T E :   T h i s   m e t h o d   i s   g r e a t   w h e n   y o u   d o n t   w a n t   t o   u s e   s y s t e m   e v e n t s   t o   g e t   t h e   p a r e n t 
   *   N O T E :   w o r k s   o n   b o t h   f i l e s   a n d   f o l d e r s 
  W [\[ i   O R]^] I      ��_���� 0 posix_file_parent  _ `��` o      ���� 0 alias_hsf_file_path  ��  ��  ^ r     	aba n     cdc 1    ��
�� 
psxpd l    e����e b     fgf l    h����h c     iji o     ���� 0 alias_hsf_file_path  j m    ��
�� 
ctxt��  ��  g m    kk �ll  : :��  ��  b o      ���� 0 parent_posix_file_path  \ mnm l      ��op��  o A ;
 * Returns the parent path of @param alias_hsf_file_path
    p �qq v 
   *   R e t u r n s   t h e   p a r e n t   p a t h   o f   @ p a r a m   a l i a s _ h s f _ f i l e _ p a t h 
  n rsr i   S Vtut I      ��v���� 0 alias_hsf_parent  v w��w o      ���� 0 alias_hsf_file_path  ��  ��  u L     
xx 4     	��y
�� 
alisy l   z����z b    {|{ l   }����} c    ~~ o    ���� 0 alias_hsf_file_path   m    ��
�� 
ctxt��  ��  | m    �� ���  : :��  ��  s ��� l      ������  � 1 +
 * Note can be used on files and folders
    � ��� V 
   *   N o t e   c a n   b e   u s e d   o n   f i l e s   a n d   f o l d e r s 
  � ��� i   W Z��� I      ������� 0 	file_kind  � ���� o      ���� 0 	file_path  ��  ��  � O     
��� L    	�� n    ��� 1    ��
�� 
kind� o    ���� 0 	file_path  � m     ���                                                                                  sevs  alis    �  Macintosh HD               Ё��H+    System Events.app                                               �5>�        ����  	                CoreServices    Ё{�      �5"�         �   �  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� l      ������  � 1 +
 * Returns the file kind from a file_URL
    � ��� V 
   *   R e t u r n s   t h e   f i l e   k i n d   f r o m   a   f i l e _ U R L 
  � ��� i   [ ^��� I      ������� $0 file_kind_by_url file_kind_by_URL� ���� o      ���� 0 file_url file_URL��  ��  � L     �� I     ������� 0 	file_kind  � ���� I    ������� 0 	file_path  � ���� o    ���� 0 file_url file_URL��  ��  ��  ��  � ��� l      ������  � � }
 * Note can be used on files and folders
 * name of FileParser's fileProperties(the_file)
 * TODO get a list of properties
    � ��� � 
   *   N o t e   c a n   b e   u s e d   o n   f i l e s   a n d   f o l d e r s 
   *   n a m e   o f   F i l e P a r s e r ' s   f i l e P r o p e r t i e s ( t h e _ f i l e ) 
   *   T O D O   g e t   a   l i s t   o f   p r o p e r t i e s 
  � ��� i   _ b��� I      ������� 0 file_properties  � ���� o      ���� 0 	file_path  ��  ��  � O     
��� L    	�� n    ��� 1    ��
�� 
pALL� o    ���� 0 	file_path  � m     ���                                                                                  sevs  alis    �  Macintosh HD               Ё��H+    System Events.app                                               �5>�        ����  	                CoreServices    Ё{�      �5"�         �   �  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  � ��� l      ������  �:4
 * Example: name:test.db, creation date:date Thursday 29 August 2013 18:43:31, modification date:date Thursday 21 November 2013 20:07:41, size:28672, folder:false, alias:false, package folder:false, visible:true, extension hidden:false, name extension:db, displayed name:test.db, kind:Document, file type:
    � ���h 
   *   E x a m p l e :   n a m e : t e s t . d b ,   c r e a t i o n   d a t e : d a t e   T h u r s d a y   2 9   A u g u s t   2 0 1 3   1 8 : 4 3 : 3 1 ,   m o d i f i c a t i o n   d a t e : d a t e   T h u r s d a y   2 1   N o v e m b e r   2 0 1 3   2 0 : 0 7 : 4 1 ,   s i z e : 2 8 6 7 2 ,   f o l d e r : f a l s e ,   a l i a s : f a l s e ,   p a c k a g e   f o l d e r : f a l s e ,   v i s i b l e : t r u e ,   e x t e n s i o n   h i d d e n : f a l s e ,   n a m e   e x t e n s i o n : d b ,   d i s p l a y e d   n a m e : t e s t . d b ,   k i n d : D o c u m e n t ,   f i l e   t y p e : 
  � ��� i   c f��� I      ������� 0 	file_info  � ���� o      ���� 0 the_file  ��  ��  � I    �����
�� .sysonfo4asfe        file� o     ���� 0 the_file  ��  � ��� l      ������  � � �
 * Returns the file extension of the file, i.e: .zip
 * Note: its also possible to do it directly from the file, google it, or use regexp
    � ��� 
   *   R e t u r n s   t h e   f i l e   e x t e n s i o n   o f   t h e   f i l e ,   i . e :   . z i p 
   *   N o t e :   i t s   a l s o   p o s s i b l e   t o   d o   i t   d i r e c t l y   f r o m   t h e   f i l e ,   g o o g l e   i t ,   o r   u s e   r e g e x p 
  � ��� i   g j��� I      ������� 0 file_extension  � ���� o      ���� 0 the_file  ��  ��  � L     	�� n     ��� 1    ��
�� 
nmxt� l    ������ I    �����
�� .sysonfo4asfe        file� o     ���� 0 the_file  ��  ��  ��  � ��� l      ������  � = 7
 * Folder names
 * Note can take POSIX file or Alias
    � ��� n 
   *   F o l d e r   n a m e s 
   *   N o t e   c a n   t a k e   P O S I X   f i l e   o r   A l i a s 
  � ��� i   k n��� I      ������� 0 folder_names  � ���� o      ���� 0 
the_folder  ��  ��  � O     ��� L    �� n    ��� 1   
 ��
�� 
pnam� n    
��� 2   
��
�� 
cfol� 4    ���
�� 
cfol� l   ������ o    ���� 0 
the_folder  ��  ��  � m     ���                                                                                  MACS  alis    t  Macintosh HD               Ё��H+    
Finder.app                                                      X��B��        ����  	                CoreServices    Ё{�      �B�         �   �  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� l      ������  � E ?
 * Todo: does this method return file names and folder names
    � ��� ~ 
   *   T o d o :   d o e s   t h i s   m e t h o d   r e t u r n   f i l e   n a m e s   a n d   f o l d e r   n a m e s 
  � ��� i   o r��� I      ������� 0 
file_names  � ���� o      ���� 0 
the_folder  ��  ��  � O     ��� L    �� n    ��� 1   
 ��
�� 
pnam� n    
��� 2   
��
�� 
file� 4    ���
�� 
cfol� l   ������ o    ���� 0 
the_folder  ��  ��  � m     ���                                                                                  MACS  alis    t  Macintosh HD               Ё��H+    
Finder.app                                                      X��B��        ����  	                CoreServices    Ё{�      �B�         �   �  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� l      ������  � � �
 * Returns the file name from the file path
 * Todo: does it include the file extension?
 * Todo: does this work with posix?, if not make a note about how to convert hsf to posix
 * Note: works with hsf paths
    � ���� 
   *   R e t u r n s   t h e   f i l e   n a m e   f r o m   t h e   f i l e   p a t h 
   *   T o d o :   d o e s   i t   i n c l u d e   t h e   f i l e   e x t e n s i o n ? 
   *   T o d o :   d o e s   t h i s   w o r k   w i t h   p o s i x ? ,   i f   n o t   m a k e   a   n o t e   a b o u t   h o w   t o   c o n v e r t   h s f   t o   p o s i x 
   *   N o t e :   w o r k s   w i t h   h s f   p a t h s 
  � � � i   s v I      ������ 0 	file_name   �� o      ���� 0 the_file_path  ��  ��   O     
 L    	 n    	 1    ��
�� 
pnam	 o    ���� 0 the_file_path   m     

�                                                                                  MACS  alis    t  Macintosh HD               Ё��H+    
Finder.app                                                      X��B��        ����  	                CoreServices    Ё{�      �B�         �   �  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��     l      ����   � �
 * Returns all file names of all files in a folder
 * Todo: does this return folder names aswell?
 * Todo: create a method for single files that trims away the extension and loop this method instead
     �� 
   *   R e t u r n s   a l l   f i l e   n a m e s   o f   a l l   f i l e s   i n   a   f o l d e r 
   *   T o d o :   d o e s   t h i s   r e t u r n   f o l d e r   n a m e s   a s w e l l ? 
   *   T o d o :   c r e a t e   a   m e t h o d   f o r   s i n g l e   f i l e s   t h a t   t r i m s   a w a y   t h e   e x t e n s i o n   a n d   l o o p   t h i s   m e t h o d   i n s t e a d 
    i   w z I      ������ 0 file_names_sans_ext   �� o      ���� 0 
the_folder  ��  ��   k     7  r      I     ��~� 0 
file_names   �} o    �|�| 0 
the_folder  �}  �~   o      �{�{ 0 
temp_names    r   	   J   	 �z�z    o      �y�y 	0 names   !"! X    4#�x$# r    /%&% n   ,'(' 4   ) ,�w)
�w 
cobj) m   * +�v�v ( n   )*+* I   # )�u,�t�u 	0 split  , -.- o   # $�s�s 0 	temp_name  . /�r/ m   $ %00 �11  .�r  �t  + o    #�q�q 0 
textparser 
TextParser& n      232  ;   - .3 o   , -�p�p 	0 names  �x 0 	temp_name  $ o    �o�o 0 
temp_names  " 4�n4 L   5 755 o   5 6�m�m 	0 names  �n   676 l      �l89�l  8 A ;
 * Returns an alias hfs file path from a POSIX file path
    9 �:: v 
   *   R e t u r n s   a n   a l i a s   h f s   f i l e   p a t h   f r o m   a   P O S I X   f i l e   p a t h 
  7 ;<; i   { ~=>= I      �k?�j�k 0 alias_hfs_file_path  ? @�i@ o      �h�h 0 posix_file_path  �i  �j  > k     AA BCB r     DED c     FGF 4     �gH
�g 
psxfH o    �f�f 0 posix_file_path  G m    �e
�e 
alisE o      �d�d 0 the_alias_hfs_file_path  C I�cI L   	 JJ o   	 
�b�b 0 the_alias_hfs_file_path  �c  < KLK l      �aMN�a  M A ;
 * Returns an alias hfs file path from a POSIX file path
    N �OO v 
   *   R e t u r n s   a n   a l i a s   h f s   f i l e   p a t h   f r o m   a   P O S I X   f i l e   p a t h 
  L PQP i    �RSR I      �`T�_�` 0 hfs_file_path  T U�^U o      �]�] 0 posix_file_path  �^  �_  S k     VV WXW r     YZY I     �\[�[�\ 0 alias_hfs_file_path  [ \�Z\ o    �Y�Y 0 posix_file_path  �Z  �[  Z o      �X�X 0 the_alias_hfs_file_path  X ]�W] l  	 ^_`^ L   	 aa c   	 bcb o   	 
�V�V 0 the_alias_hfs_file_path  c m   
 �U
�U 
ctxt_ < 6converts an "alias HFS file path" to a "HFS file path"   ` �dd l c o n v e r t s   a n   " a l i a s   H F S   f i l e   p a t h "   t o   a   " H F S   f i l e   p a t h "�W  Q efe l      �Tgh�T  g H B
 * hfs_parent(path to me)--Macintosh HD:Users:John:SomeProject:
    h �ii � 
   *   h f s _ p a r e n t ( p a t h   t o   m e ) - - M a c i n t o s h   H D : U s e r s : J o h n : S o m e P r o j e c t : 
  f jkj i   � �lml I      �Sn�R�S 0 hfs_parent_path  n o�Qo o      �P�P 0 the_hsf_path  �Q  �R  m k     pp qrq r     sts I     �Ou�N�O 0 parent_folder  u v�Mv o    �L�L 0 the_hsf_path  �M  �N  t o      �K�K 0 the_parent_folder  r wxw r   	 yzy I   	 �J{�I�J 0 file_url file_URL{ |�H| o   
 �G�G 0 the_parent_folder  �H  �I  z o      �F�F 0 the_posix_path  x }~} r    � I    �E��D�E 0 hfs_file_path  � ��C� o    �B�B 0 the_posix_path  �C  �D  � o      �A�A 0 the_hfs_file_path  ~ ��@� L    �� o    �?�? 0 the_hfs_file_path  �@  k ��>� l     �=�<�;�=  �<  �;  �>  o �:� ��:  � k      �� ��� h     �9n�9 0 s  � ��8� l    ��7�6� L     �� o     �5�5 0 s  �7  �6  �8  � �4�;��4  � �3�2�3 0 s  
�2 .aevtoappnull  �   � ****� �1��0�/���.
�1 .aevtoappnull  �   � ****� k     �� ��-�-  �0  �/  �  �  �. b   p ���������������������������� �,�+�*�)�(�'�&�%�$�#�"�!� �������������, 0 scriptloader ScriptLoader�+ 0 
textparser 
TextParser�* 0 read_url read_URL�) 0 
posix_path  �( 0 file_url file_URL�' 0 	file_path  �& 0 hfs_path  �% 0 alias_file_path  �$ 0 file_name_by_url  �# &0 implicit_file_url implicit_file_URL�" 0 parent_folder  �! 0 posix_file_parent  �  0 alias_hsf_parent  � 0 	file_kind  � $0 file_kind_by_url file_kind_by_URL� 0 file_properties  � 0 	file_info  � 0 file_extension  � 0 folder_names  � 0 
file_names  � 0 	file_name  � 0 file_names_sans_ext  � 0 alias_hfs_file_path  � 0 hfs_file_path  � 0 hfs_parent_path  � �� ��  � k      �� ��� l      ����  � 1 +
 * Loads many scripts at a specific path
    � ��� V 
   *   L o a d s   m a n y   s c r i p t s   a t   a   s p e c i f i c   p a t h 
  � ��� i     ��� I      ���� 0 	load_many  �  �  � k      �� ��� l     ����  �  get files in a folder   � ��� * g e t   f i l e s   i n   a   f o l d e r� ��� l     ����  � @ :get extension for each file and make sure its .applescript   � ��� t g e t   e x t e n s i o n   f o r   e a c h   f i l e   a n d   m a k e   s u r e   i t s   . a p p l e s c r i p t� ��� l     ����  � B <make a note that it can also support .scpt in a later update   � ��� x m a k e   a   n o t e   t h a t   i t   c a n   a l s o   s u p p o r t   . s c p t   i n   a   l a t e r   u p d a t e�  � ��� l      �
���
  � 1 +
 * Loads many scripts at a relative path
    � ��� V 
   *   L o a d s   m a n y   s c r i p t s   a t   a   r e l a t i v e   p a t h 
  � ��� i    ��� I      �	���	 0 relative_load_many  �  �  � l     ����  � 1 +same as load_many, but with a relative path   � ��� V s a m e   a s   l o a d _ m a n y ,   b u t   w i t h   a   r e l a t i v e   p a t h� ��� l      ����  �  
 *
    � ��� 
 
   * 
  � ��� i    ��� I      ���� 0 load  � ��� o      �� 0 	hsf_alias  � ��� o      � �  0 	file_name  �  �  � k     �� ��� l    ���� r     ��� b     ��� l    ������ c     ��� o     ���� 0 	hsf_alias  � m    ��
�� 
ctxt��  ��  � o    ���� 0 	file_name  � o      ���� 0 the_file_path  � V Pcombines the path and the file name into "folder:sub_folder:file.txt" hsf format   � ��� � c o m b i n e s   t h e   p a t h   a n d   t h e   f i l e   n a m e   i n t o   " f o l d e r : s u b _ f o l d e r : f i l e . t x t "   h s f   f o r m a t� ���� l   ���� L    �� I    ������� 0 load_script  � ���� 4   	 ���
�� 
alis� o    ���� 0 the_file_path  ��  ��  � g afinally makes the hsf_file path into an alias hsf file path and then calls the load_script method   � ��� � f i n a l l y   m a k e s   t h e   h s f _ f i l e   p a t h   i n t o   a n   a l i a s   h s f   f i l e   p a t h   a n d   t h e n   c a l l s   t h e   l o a d _ s c r i p t   m e t h o d��  � ��� l      ������  ���
 * Note: we use load_script to load plain-text .applescript files, which cant be loaded directly without this method
 * Note: we use .applescript instead of .scpt files because its easier to put plain text script files under version control like github
 * Note: You can load compiled scripts (.scpt) or plain text scripts (.applescript). Make sure, though, that your .applescript files are encoded as either Mac (what AppleScript Editor uses) UTF-8 (if you use another text editor). Any scripts loaded are expected to be installed into your Scripts directory. Use the line below to reference the script:
 * Remember to import this method before you use it with a property: 
 * Example: 
 * property ScriptLoader : load script alias ((path to scripts folder from user domain as text) & "file:ScriptLoader.scpt")--prerequisite for loading .applescript files * property ListAsserter : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "list:ListAsserter.applescript"))  * my ListAsserter's equals_to({1, 2, 3, 4}, {1, 2, 3, 4})
 * if my ListAsserter's equals_to({1, 2, 3, 4}, {1, 2, 3, 4}) then *		log "yes" *	else *		log "no" *	end if
 * @Param: apple_script_path: is an "alias hsf file path"
    � ���	� 
   *   N o t e :   w e   u s e   l o a d _ s c r i p t   t o   l o a d   p l a i n - t e x t   . a p p l e s c r i p t   f i l e s ,   w h i c h   c a n t   b e   l o a d e d   d i r e c t l y   w i t h o u t   t h i s   m e t h o d 
   *   N o t e :   w e   u s e   . a p p l e s c r i p t   i n s t e a d   o f   . s c p t   f i l e s   b e c a u s e   i t s   e a s i e r   t o   p u t   p l a i n   t e x t   s c r i p t   f i l e s   u n d e r   v e r s i o n   c o n t r o l   l i k e   g i t h u b 
   *   N o t e :   Y o u   c a n   l o a d   c o m p i l e d   s c r i p t s   ( . s c p t )   o r   p l a i n   t e x t   s c r i p t s   ( . a p p l e s c r i p t ) .   M a k e   s u r e ,   t h o u g h ,   t h a t   y o u r   . a p p l e s c r i p t   f i l e s   a r e   e n c o d e d   a s   e i t h e r   M a c   ( w h a t   A p p l e S c r i p t   E d i t o r   u s e s )   U T F - 8   ( i f   y o u   u s e   a n o t h e r   t e x t   e d i t o r ) .   A n y   s c r i p t s   l o a d e d   a r e   e x p e c t e d   t o   b e   i n s t a l l e d   i n t o   y o u r   S c r i p t s   d i r e c t o r y .   U s e   t h e   l i n e   b e l o w   t o   r e f e r e n c e   t h e   s c r i p t : 
   *   R e m e m b e r   t o   i m p o r t   t h i s   m e t h o d   b e f o r e   y o u   u s e   i t   w i t h   a   p r o p e r t y :   
   *   E x a m p l e :   
   *   p r o p e r t y   S c r i p t L o a d e r   :   l o a d   s c r i p t   a l i a s   ( ( p a t h   t o   s c r i p t s   f o l d e r   f r o m   u s e r   d o m a i n   a s   t e x t )   &   " f i l e : S c r i p t L o a d e r . s c p t " ) - - p r e r e q u i s i t e   f o r   l o a d i n g   . a p p l e s c r i p t   f i l e s    *   p r o p e r t y   L i s t A s s e r t e r   :   m y   S c r i p t L o a d e r ' s   l o a d _ s c r i p t ( a l i a s   ( ( p a t h   t o   s c r i p t s   f o l d e r   f r o m   u s e r   d o m a i n   a s   t e x t )   &   " l i s t : L i s t A s s e r t e r . a p p l e s c r i p t " ) )      *   m y   L i s t A s s e r t e r ' s   e q u a l s _ t o ( { 1 ,   2 ,   3 ,   4 } ,   { 1 ,   2 ,   3 ,   4 } ) 
   *   i f   m y   L i s t A s s e r t e r ' s   e q u a l s _ t o ( { 1 ,   2 ,   3 ,   4 } ,   { 1 ,   2 ,   3 ,   4 } )   t h e n    * 	 	 l o g   " y e s "    * 	 e l s e    * 	 	 l o g   " n o "    * 	 e n d   i f 
   *   @ P a r a m :   a p p l e _ s c r i p t _ p a t h :   i s   a n   " a l i a s   h s f   f i l e   p a t h " 
  � ��� i       I      ������ 0 load_script   �� o      ���� 0 apple_script_path  ��  ��   k     {  Q     x	 r    


 I   ����
�� .sysoloadscpt        file o    ���� 0 apple_script_path  ��   o      ���� 0 script_object   R      ����
�� .ascrerr ****      � ****��   ����
�� 
errn d       m      �������  	 l   x k    x  r     m     �   o      ���� 0 script_text    Q    1 l     ! r     "#" I   ��$��
�� .rdwrread****        ****$ o    ���� 0 apple_script_path  ��  # o      ���� 0 script_text    ( " Try reading as Mac encoding first   ! �%% D   T r y   r e a d i n g   a s   M a c   e n c o d i n g   f i r s t R      ����&
�� .ascrerr ****      � ****��  & ��'��
�� 
errn' d      (( m      �������   l  ( 1)*+) l  ( 1,-., r   ( 1/0/ I  ( /��12
�� .rdwrread****        ****1 o   ( )���� 0 apple_script_path  2 ��3��
�� 
as  3 m   * +��
�� 
utf8��  0 o      ���� 0 script_text  -   Finally try UTF-8   . �44 $   F i n a l l y   t r y   U T F - 8* &   Error reading script's encoding   + �55 @   E r r o r   r e a d i n g   s c r i p t ' s   e n c o d i n g 6��6 Q   2 x7897 r   5 H:;: I  5 F��<��
�� .sysodsct****        scpt< l  5 B=����= b   5 B>?> b   5 @@A@ b   5 >BCB b   5 <DED b   5 :FGF b   5 8HIH m   5 6JJ �KK  s c r i p t   sI o   6 7��
�� 
ret G o   8 9���� 0 script_text  E o   : ;��
�� 
ret C m   < =LL �MM  e n d   s c r i p t  A o   > ?��
�� 
ret ? m   @ ANN �OO  r e t u r n   s��  ��  ��  ; o      ���� 0 script_object  8 R      ��PQ
�� .ascrerr ****      � ****P o      ���� 0 e  Q ��RS
�� 
errnR o      ���� 0 n  S ��TU
�� 
ptlrT o      ���� 0 p  U ��VW
�� 
erobV o      ���� 0 f  W ��X��
�� 
errtX o      ���� 0 t  ��  9 k   P xYY Z[Z I  P a��\��
�� .sysodlogaskr        TEXT\ b   P ]]^] b   P Y_`_ b   P Waba b   P Scdc m   P Qee �ff , E r r o r   r e a d i n g   l i b r a r y  d o   Q R���� 0 apple_script_path  b m   S Vgg �hh   ` o   W X���� 0 e  ^ m   Y \ii �jj : P l e a s e   e n c o d e   a s   M a c   o r   U T F - 8��  [ k��k R   b x��lm
�� .ascrerr ****      � ****l o   v w���� 0 e  m ��no
�� 
errnn o   f g���� 0 n  o ��pq
�� 
ptlrp o   j k���� 0 p  q ��rs
�� 
erobr o   n o���� 0 f  s ��t��
�� 
errtt o   r s���� 0 t  ��  ��  ��     text format script     �uu (   t e x t   f o r m a t   s c r i p t   v��v l  y {wxyw L   y {zz o   y z���� 0 script_object  x + %return the script, it is now loadable   y �{{ J r e t u r n   t h e   s c r i p t ,   i t   i s   n o w   l o a d a b l e��  � |}| l    ~����~ I     ������ 0 load   ��� I   �����
�� .earsffdralis        afdr�  f    ��  � ��� m    �� ��� , F i l e P a r s e r . a p p l e s c r i p t� ���� m    ��������  ��  ��  ��  } ��� l      ������  �MG
 * NOTE: this method is a little strange, it serves as a simple way to load script files relative to the position of the script that is loading it.
 * Example: property FileParser : ScriptLoader's load(path to me, "FileParser.applescript",-1)--loads the script
 * @PARAM: the path_offset is used to offset the path backwards
    � ���� 
   *   N O T E :   t h i s   m e t h o d   i s   a   l i t t l e   s t r a n g e ,   i t   s e r v e s   a s   a   s i m p l e   w a y   t o   l o a d   s c r i p t   f i l e s   r e l a t i v e   t o   t h e   p o s i t i o n   o f   t h e   s c r i p t   t h a t   i s   l o a d i n g   i t . 
   *   E x a m p l e :   p r o p e r t y   F i l e P a r s e r   :   S c r i p t L o a d e r ' s   l o a d ( p a t h   t o   m e ,   " F i l e P a r s e r . a p p l e s c r i p t " , - 1 ) - - l o a d s   t h e   s c r i p t 
   *   @ P A R A M :   t h e   p a t h _ o f f s e t   i s   u s e d   t o   o f f s e t   t h e   p a t h   b a c k w a r d s 
  � ���� i    ��� I      ������� 0 relative_load  � ��� o      ���� 0 	hsf_alias  � ��� o      ���� 0 	file_name  � ���� o      ���� 0 path_offset  ��  ��  � k     %�� ��� r     ��� o     ���� 0 	hsf_alias  � o      ���� 0 the_offset_file_path  � ��� Y    �������� k    �� ��� l   ������  �  log i   � ��� 
 l o g   i� ���� r    ��� 4    ���
�� 
alis� l   ������ b    ��� l   ������ c    ��� o    ���� 0 the_offset_file_path  � m    ��
�� 
ctxt��  ��  � m    �� ���  : :��  ��  � o      ���� 0 the_offset_file_path  ��  �� 0 i  � o    ���� 0 path_offset  � m    	��������  � ��� l   ������  �  log the_offset_file_path   � ��� 0 l o g   t h e _ o f f s e t _ f i l e _ p a t h� ���� I    %������� 0 load  � ��� o     ���� 0 the_offset_file_path  � ���� o     !���� 0 	file_name  ��  ��  ��  ��  � �����������  � �������������� 0 	load_many  �� 0 relative_load_many  �� 0 load  �� 0 load_script  �� 0 relative_load  
�� .aevtoappnull  �   � ****� �����~���}�� 0 	load_many  �  �~  �  �  �} h� �|��{�z���y�| 0 relative_load_many  �{  �z  �  �  �y h� �x��w�v���u�x 0 load  �w �t��t �  �s�r�s 0 	hsf_alias  �r 0 	file_name  �v  � �q�p�o�q 0 	hsf_alias  �p 0 	file_name  �o 0 the_file_path  � �n�m�l
�n 
ctxt
�m 
alis�l 0 load_script  �u ��&�%E�O**�/k+ � �k�j�i���h�k 0 load_script  �j �g��g �  �f�f 0 apple_script_path  �i  � �e�d�c�b�a�`�_�^�e 0 apple_script_path  �d 0 script_object  �c 0 script_text  �b 0 e  �a 0 n  �` 0 p  �_ 0 f  �^ 0 t  � �]�\��[��Z�YJ�XLN�W�V�egi�U�T�S�R�Q�P
�] .sysoloadscpt        file�\  � �O�N�M
�O 
errn�N�(�M  
�[ .rdwrread****        ****� �L�K�J
�L 
errn�K�\�J  
�Z 
as  
�Y 
utf8
�X 
ret 
�W .sysodsct****        scpt�V 0 e  � �I�H�
�I 
errn�H 0 n  � �G�F�
�G 
ptlr�F 0 p  � �E�D�
�E 
erob�D 0 f  � �C�B�A
�C 
errt�B 0 t  �A  
�U .sysodlogaskr        TEXT
�T 
errn
�S 
ptlr
�R 
erob
�Q 
errt�P �h | �j  E�W mX  �E�O �j E�W X  ���l E�O ��%�%�%�%�%�%j E�W /X  �%a %�%a %j O)a �a �a �a �a �O�� �@��?�>���=�@ 0 relative_load  �? �<��< �  �;�:�9�; 0 	hsf_alias  �: 0 	file_name  �9 0 path_offset  �>  � �8�7�6�5�4�8 0 	hsf_alias  �7 0 	file_name  �6 0 path_offset  �5 0 the_offset_file_path  �4 0 i  � �3�2��1
�3 
alis
�2 
ctxt�1 0 load  �= &�E�O �ikh *��&�%/E�[OY��O*��l+ � �0��/�.���-
�0 .aevtoappnull  �   � ****� k     �� |�,�,  �/  �.  �  � �+��*
�+ .earsffdralis        afdr�* 0 load  �- *)j  �im+ � �)����) 0 s  � k      �� ��� l     �(���(  � � �property TextParser : my ScriptLoader's load_script(alias ((path to scripts folder from user domain as text) & "text:TextParser.applescript"))   � ��� p r o p e r t y   T e x t P a r s e r   :   m y   S c r i p t L o a d e r ' s   l o a d _ s c r i p t ( a l i a s   ( ( p a t h   t o   s c r i p t s   f o l d e r   f r o m   u s e r   d o m a i n   a s   t e x t )   &   " t e x t : T e x t P a r s e r . a p p l e s c r i p t " ) )� ��� l      �'���'  � 6 0
 * Returns an array of every word in the_text
    � ��� ` 
   *   R e t u r n s   a n   a r r a y   o f   e v e r y   w o r d   i n   t h e _ t e x t 
  � ��� i     ��� I      �&��%�& 0 
every_word  � ��$� o      �#�# 0 the_text  �$  �%  � L     �� n     ��� 2    �"
�" 
cwor� o     �!�! 0 the_text  � ��� l      � ���   � r l
 * Returns all paragraps in a text as a list
 * TODO: write an example
 * // :TODO: rename to every_line?
    � ��� � 
   *   R e t u r n s   a l l   p a r a g r a p s   i n   a   t e x t   a s   a   l i s t 
   *   T O D O :   w r i t e   a n   e x a m p l e 
   *   / /   : T O D O :   r e n a m e   t o   e v e r y _ l i n e ? 
  � ��� i    ��� I      ���� 0 every_paragraph  � ��� o      �� 0 the_text  �  �  � k     3�� ��� r     � � J     ��    o      �� 0 paragraph_list  �  r    
 n     2   �
� 
cpar o    �� 0 the_text   o      �� 0 	para_list    X    0	�
	 Z    +�� ?     n     1    �
� 
leng o    �� 0 	next_line   m    ��   l  # ' s   # ' o   # $�� 0 	next_line   l     �� n        ;   % & o   $ %�� 0 paragraph_list  �  �   < 6 this takes care of not adding an emty item at the end    � l   t h i s   t a k e s   c a r e   o f   n o t   a d d i n g   a n   e m t y   i t e m   a t   t h e   e n d�  �  � 0 	next_line  
 o    �� 0 	para_list   � L   1 3 o   1 2�
�
 0 paragraph_list  �  �  l      �	�	   O I
 * Returns a list of text items by splitting a text at every delimiter
     �   � 
   *   R e t u r n s   a   l i s t   o f   t e x t   i t e m s   b y   s p l i t t i n g   a   t e x t   a t   e v e r y   d e l i m i t e r 
   !"! i    #$# I      �%�� 	0 split  % &'& o      �� 0 the_text  ' (�( o      �� 0 	delimiter  �  �  $ k     )) *+* r     ,-, o     �� 0 	delimiter  - 1    �
� 
txdl+ ./. r    010 n    	232 2    	�
� 
citm3 o    � �  0 the_text  1 o      ���� 0 ret_val  / 454 l   6786 r    9:9 m    ;; �<<  ,: 1    ��
�� 
txdl7 , &reset applescript delimiter to default   8 �== L r e s e t   a p p l e s c r i p t   d e l i m i t e r   t o   d e f a u l t5 >��> L    ?? o    ���� 0 ret_val  ��  " @A@ l      ��BC��  B ) #
 * Returns the length of theText
    C �DD F 
   *   R e t u r n s   t h e   l e n g t h   o f   t h e T e x t 
  A EFE i    GHG I      ��I���� 0 text_length  I J��J o      ���� 0 the_text  ��  ��  H L     KK n     LML 1    ��
�� 
lengM o     ���� 0 the_text  F NON l      ��PQ��  Pmg
 * Returns a comma delimited list like "blue, red, orange" from an array like {"blue","red","orange"}
 * Example: log TextParser's comma_delimited_text({"blue", "red", "orange"}) yields "blue, red, orange"
 * TODO USE THIS INSTEAD: set AppleScript's text item delimiters to {" "} -- A single space
 * TODO move to ArrayParser
 * AND THEN : the_list as text
    Q �RR� 
   *   R e t u r n s   a   c o m m a   d e l i m i t e d   l i s t   l i k e   " b l u e ,   r e d ,   o r a n g e "   f r o m   a n   a r r a y   l i k e   { " b l u e " , " r e d " , " o r a n g e " } 
   *   E x a m p l e :   l o g   T e x t P a r s e r ' s   c o m m a _ d e l i m i t e d _ t e x t ( { " b l u e " ,   " r e d " ,   " o r a n g e " } )   y i e l d s   " b l u e ,   r e d ,   o r a n g e " 
   *   T O D O   U S E   T H I S   I N S T E A D :   s e t   A p p l e S c r i p t ' s   t e x t   i t e m   d e l i m i t e r s   t o   { "   " }   - -   A   s i n g l e   s p a c e 
   *   T O D O   m o v e   t o   A r r a y P a r s e r 
   *   A N D   T H E N   :   t h e _ l i s t   a s   t e x t 
  O STS i    UVU I      ��W���� 0 comma_delimited_text  W X��X o      ���� 0 
text_items  ��  ��  V I     	��Y���� 0 delimited_text  Y Z[Z o    ���� 0 
text_items  [ \��\ b    ]^] m    __ �``  ,^ 1    ��
�� 
spac��  ��  T aba l     ��cd��  c f `Returns a text item by stitching many text items together with the delimiter inbetween each word   d �ee � R e t u r n s   a   t e x t   i t e m   b y   s t i t c h i n g   m a n y   t e x t   i t e m s   t o g e t h e r   w i t h   t h e   d e l i m i t e r   i n b e t w e e n   e a c h   w o r db fgf i    hih I      ��j���� 0 delimited_text  j klk o      ���� 0 
text_items  l m��m o      ���� 0 	delimiter  ��  ��  i k     Onn opo r     qrq m     ss �tt  r o      ���� 0 ret_val  p uvu Y    Lw��xy��w l   Gz{|z k    G}} ~~ r    ��� n    ��� 4    ���
�� 
cobj� o    ���� 0 i  � o    ���� 0 
text_items  � o      ���� 0 the_word   ��� r    ��� m    �� ���  � o      ���� 0 head  � ��� r    ��� o    ���� 0 	delimiter  � o      ���� 0 tail  � ��� Z     -������� =     #��� o     !���� 0 i  � m   ! "���� � r   & )��� m   & '�� ���  � o      ���� 0 head  ��  ��  � ��� Z   . =������� =   . 3��� o   . /���� 0 i  � l  / 2������ n   / 2��� 1   0 2��
�� 
leng� o   / 0���� 0 
text_items  ��  ��  � r   6 9��� m   6 7�� ���  � o      ���� 0 tail  ��  ��  � ���� r   > G��� b   > E��� b   > C��� b   > A��� o   > ?���� 0 ret_val  � o   ? @���� 0 head  � o   A B���� 0 the_word  � o   C D���� 0 tail  � o      ���� 0 ret_val  ��  { # Todo: store len in a variable   | ��� : T o d o :   s t o r e   l e n   i n   a   v a r i a b l e�� 0 i  x m    ���� y l   ������ n    ��� 1   	 ��
�� 
leng� o    	���� 0 
text_items  ��  ��  ��  v ���� L   M O�� o   M N���� 0 ret_val  ��  g ��� l      ������  � � �
 * TODO: doesnt this add a return at the last line? maybe use delimited_text() intead? 
 * // :TODO: try to find a better name
    � ��� 
   *   T O D O :   d o e s n t   t h i s   a d d   a   r e t u r n   a t   t h e   l a s t   l i n e ?   m a y b e   u s e   d e l i m i t e d _ t e x t ( )   i n t e a d ?   
   *   / /   : T O D O :   t r y   t o   f i n d   a   b e t t e r   n a m e 
  � ��� i    ��� I      ������� 0 to_paragraphs  � ���� o      ���� 0 the_list  ��  ��  � k     �� ��� r     ��� J     �� ���� o     ��
�� 
ret ��  � n     ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr� ���� L    �� c    ��� o    	���� 0 the_list  � m   	 
��
�� 
ctxt��  � ��� l      ������  � � �
 * cardinal is one two three etc
 * TODO: one could create a dynamic ordinal generator in the future, that would combine two words to generate twenthy+eigth etc
    � ���F 
   *   c a r d i n a l   i s   o n e   t w o   t h r e e   e t c 
   *   T O D O :   o n e   c o u l d   c r e a t e   a   d y n a m i c   o r d i n a l   g e n e r a t o r   i n   t h e   f u t u r e ,   t h a t   w o u l d   c o m b i n e   t w o   w o r d s   t o   g e n e r a t e   t w e n t h y + e i g t h   e t c 
  � ��� i    ��� I      ������� 0 ordinal  � ���� o      ���� 0 
the_number  ��  ��  � k     %�� ��� r     ��� J     �� ��� m     �� ��� 
 f i r s t� ��� m    �� ���  s e c o n d� ��� m    �� ��� 
 t h i r d� ��� m    �� ���  f o u r t h� ��� m    �� ��� 
 f i f t h� ��� m    �� ��� 
 s i x t h� ��� m    �� ���  s e v e n t h� ��� m    �� ���  e i g h t h� ��� m    	   � 
 n i n t h�  m   	 
 � 
 t e n t h  m   
  �		  e l e v e n t h 

 m     �  t w e l f t h  m     �  t h i r t e e n t h  m     �  f o u r t e e n t h  m     �  s e v e n t e e n t h  m     �  e i g t h t e e n t h  m       �!!  n i n e t e e n t h "��" m    ## �$$  t w e n t e e n t h��  � o      ���� 0 ordinals  � %��% L    %&& n    $'(' 4    #��)
�� 
cobj) o   ! "���� 0 
the_number  ( o    ���� 0 ordinals  ��  � *+* l      ��,-��  ,��
 * Returns encode text (escaped)
 * Caution: encode does not handle the double quote char very well
 * Note: this could also be done by creating a a method that does all the character trickery involved in unescaping/escaping text, but this method leverages the php language to do all this for us
 * Example: encode("<image location:files/img/image.jpg")--%3Cimage+location%3Afiles%2Fimg%2Fimage.jpg
    - �.." 
   *   R e t u r n s   e n c o d e   t e x t   ( e s c a p e d ) 
   *   C a u t i o n :   e n c o d e   d o e s   n o t   h a n d l e   t h e   d o u b l e   q u o t e   c h a r   v e r y   w e l l 
   *   N o t e :   t h i s   c o u l d   a l s o   b e   d o n e   b y   c r e a t i n g   a   a   m e t h o d   t h a t   d o e s   a l l   t h e   c h a r a c t e r   t r i c k e r y   i n v o l v e d   i n   u n e s c a p i n g / e s c a p i n g   t e x t ,   b u t   t h i s   m e t h o d   l e v e r a g e s   t h e   p h p   l a n g u a g e   t o   d o   a l l   t h i s   f o r   u s 
   *   E x a m p l e :   e n c o d e ( " < i m a g e   l o c a t i o n : f i l e s / i m g / i m a g e . j p g " ) - - % 3 C i m a g e + l o c a t i o n % 3 A f i l e s % 2 F i m g % 2 F i m a g e . j p g 
  + /0/ i     #121 I      ��3���� 
0 encode  3 4��4 o      ���� 0 the_text  ��  ��  2 L     
55 I    	��6��
�� .sysoexecTEXT���     TEXT6 b     787 b     9:9 m     ;; �<< 0 p h p   - r   ' e c h o   u r l e n c o d e ( ": o    ���� 0 the_text  8 m    == �>>  " ) ; '��  0 ?@? l      ��AB��  ATN
 * Returns dencode text (unescaped)
 * Note this could also be done by creating a a method that does all the character trickery involved in unescaping/escaping text, but this method leverages the php language to do all this for us
 * Example: decode(%3Cimage+location%3Afiles%2Fimg%2Fimage.jpg)--<image location:files/img/image.jpg
    B �CC� 
   *   R e t u r n s   d e n c o d e   t e x t   ( u n e s c a p e d ) 
   *   N o t e   t h i s   c o u l d   a l s o   b e   d o n e   b y   c r e a t i n g   a   a   m e t h o d   t h a t   d o e s   a l l   t h e   c h a r a c t e r   t r i c k e r y   i n v o l v e d   i n   u n e s c a p i n g / e s c a p i n g   t e x t ,   b u t   t h i s   m e t h o d   l e v e r a g e s   t h e   p h p   l a n g u a g e   t o   d o   a l l   t h i s   f o r   u s 
   *   E x a m p l e :   d e c o d e ( % 3 C i m a g e + l o c a t i o n % 3 A f i l e s % 2 F i m g % 2 F i m a g e . j p g ) - - < i m a g e   l o c a t i o n : f i l e s / i m g / i m a g e . j p g 
  @ DED i   $ 'FGF I      ��H���� 
0 decode  H I��I o      ���� 0 the_text  ��  ��  G L     
JJ I    	��K��
�� .sysoexecTEXT���     TEXTK b     LML b     NON m     PP �QQ 0 p h p   - r   ' e c h o   u r l d e c o d e ( "O o    ���� 0 the_text  M m    RR �SS  " ) ; '��  E TUT l      ��VW��  V C =
 * Returns a text in quoted form
 * Todo: write an example
    W �XX z 
   *   R e t u r n s   a   t e x t   i n   q u o t e d   f o r m 
   *   T o d o :   w r i t e   a n   e x a m p l e 
  U YZY i   ( +[\[ I      ��]���� 0 quoted_form  ] ^��^ o      ���� 0 the_text  ��  ��  \ L     __ n     `a` 1    ��
�� 
strqa o     ���� 0 the_text  Z bcb l      ��de��  d i c
 * substring
 * the start: 1
 * the end: ((length of second_part) - 2)
 * Todo: write an example
    e �ff � 
   *   s u b s t r i n g 
   *   t h e   s t a r t :   1 
   *   t h e   e n d :   ( ( l e n g t h   o f   s e c o n d _ p a r t )   -   2 ) 
   *   T o d o :   w r i t e   a n   e x a m p l e 
  c ghg i   , /iji I      ��k���� 0 
sub_string  k lml o      ���� 0 	the_start  m non o      ���� 0 the_end  o p��p o      ���� 0 the_text  ��  ��  j L     qq n     rsr 7   ��tu
�� 
ctxtt o    ���� 0 	the_start  u o    
���� 0 the_end  s o     ���� 0 the_text  h vwv l      ��xy��  x  y
 * Counts how many times a string appears in a text
 * Note: Its splits the text by the substring and counts the items
    y �zz � 
   *   C o u n t s   h o w   m a n y   t i m e s   a   s t r i n g   a p p e a r s   i n   a   t e x t 
   *   N o t e :   I t s   s p l i t s   t h e   t e x t   b y   t h e   s u b s t r i n g   a n d   c o u n t s   t h e   i t e m s 
  w {|{ i   0 3}~} I      ������ 0 occurrences   ��� o      ���� 0 the_text  � ���� o      ���� 	0 match  ��  ��  ~ k     �� ��� r     ��� o     ���� 	0 match  � n     ��� 1    ��
�� 
txdl� 1    �
� 
ascr� ��� r    ��� \    ��� l   ��~�}� I   �|��{
�| .corecnte****       ****� n    	��� 2    	�z
�z 
citm� o    �y�y 0 the_text  �{  �~  �}  � m    �x�x � o      �w�w 0 counter  � ��� r    ��� m    �� ���  � n     ��� 1    �v
�v 
txdl� 1    �u
�u 
ascr� ��t� L    �� o    �s�s 0 counter  �t  | ��� l      �r���r  �
 * Returns a text without linebreaks, a substitue replaces the linebreak char
 * Note: linebreaks often come in the form of \\n or \\r 
 * Caution: if a line is empty it is still replaced with the_substitute 
 * Param: the_substitue is the replacement for the linebreak
    � ���  
   *   R e t u r n s   a   t e x t   w i t h o u t   l i n e b r e a k s ,   a   s u b s t i t u e   r e p l a c e s   t h e   l i n e b r e a k   c h a r 
   *   N o t e :   l i n e b r e a k s   o f t e n   c o m e   i n   t h e   f o r m   o f   \ \ n   o r   \ \ r   
   *   C a u t i o n :   i f   a   l i n e   i s   e m p t y   i t   i s   s t i l l   r e p l a c e d   w i t h   t h e _ s u b s t i t u t e   
   *   P a r a m :   t h e _ s u b s t i t u e   i s   t h e   r e p l a c e m e n t   f o r   t h e   l i n e b r e a k 
  � ��q� i   4 7��� I      �p��o�p 0 	wrap_text  � ��� o      �n�n 0 the_text  � ��m� o      �l�l 0 the_substitue  �m  �o  � k     >�� ��� r     ��� m     �� ���  � o      �k�k 0 the_wrapped_text  � ��� r    	��� n    ��� 2   �j
�j 
cpar� o    �i�i 0 the_text  � o      �h�h 0 the_paragraphs  � ��� r   
 ��� n   
 ��� 1    �g
�g 
leng� o   
 �f�f 0 the_paragraphs  � o      �e�e 0 the_len  � ��� Y    ;��d���c� k    6�� ��� r     ��� n    ��� 4    �b�
�b 
cobj� o    �a�a 0 i  � o    �`�` 0 the_paragraphs  � o      �_�_ 0 the_paragraph  � ��^� Z   ! 6���]�� l  ! $��\�[� =   ! $��� o   ! "�Z�Z 0 i  � o   " #�Y�Y 0 the_len  �\  �[  � l  ' ,���� r   ' ,��� b   ' *��� o   ' (�X�X 0 the_wrapped_text  � o   ( )�W�W 0 the_paragraph  � o      �V�V 0 the_wrapped_text  � &  append the paragraph to the text   � ��� @ a p p e n d   t h e   p a r a g r a p h   t o   t h e   t e x t�]  � l  / 6���� r   / 6��� b   / 4��� b   / 2��� o   / 0�U�U 0 the_wrapped_text  � o   0 1�T�T 0 the_paragraph  � o   2 3�S�S 0 the_substitue  � o      �R�R 0 the_wrapped_text  � E ?append the paragraph to the text and the line break replacement   � ��� ~ a p p e n d   t h e   p a r a g r a p h   t o   t h e   t e x t   a n d   t h e   l i n e   b r e a k   r e p l a c e m e n t�^  �d 0 i  � m    �Q�Q � o    �P�P 0 the_len  �c  � ��O� L   < >�� o   < =�N�N 0 the_wrapped_text  �O  �q  � �M� ��M  � k      �� ��� h     �L��L 0 s  � ��K� l    ��J�I� L     �� o     �H�H 0 s  �J  �I  �K  � �G����G  � �F�E�F 0 s  
�E .aevtoappnull  �   � ****� �D��C�B���A
�D .aevtoappnull  �   � ****� k     �� ��@�@  �C  �B  �  �  �A b   � �������������� � �?�>�=�<�;�:�9�8�7�6�5�4�3�2�? 0 
every_word  �> 0 every_paragraph  �= 	0 split  �< 0 text_length  �; 0 comma_delimited_text  �: 0 delimited_text  �9 0 to_paragraphs  �8 0 ordinal  �7 
0 encode  �6 
0 decode  �5 0 quoted_form  �4 0 
sub_string  �3 0 occurrences  �2 0 	wrap_text  � �1��0�/�.�1 0 
every_word  �0 �-�-   �,�, 0 the_text  �/   �+�+ 0 the_text   �*
�* 
cwor�. ��-E� �)��(�'�&�) 0 every_paragraph  �( �%�%   �$�$ 0 the_text  �'   �#�"�!� �# 0 the_text  �" 0 paragraph_list  �! 0 	para_list  �  0 	next_line   �����
� 
cpar
� 
kocl
� 
cobj
� .corecnte****       ****
� 
leng�& 4jvE�O��-E�O $�[��l kh ��,j 	��6GY h[OY��O�� �$��	�� 	0 split  � �
� 
  ��� 0 the_text  � 0 	delimiter  �   ���� 0 the_text  � 0 	delimiter  � 0 ret_val  	 ��;
� 
txdl
� 
citm� �*�,FO��-E�O�*�,FO�� �H���� 0 text_length  � �
�
   �	�	 0 the_text  �   �� 0 the_text   �
� 
leng� ��,E� �V���� 0 comma_delimited_text  � ��   �� 0 
text_items  �   � �  0 
text_items   _����
�� 
spac�� 0 delimited_text  � 
*���%l+ � ��i�������� 0 delimited_text  �� ����   ������ 0 
text_items  �� 0 	delimiter  ��   ���������������� 0 
text_items  �� 0 	delimiter  �� 0 ret_val  �� 0 i  �� 0 the_word  �� 0 head  �� 0 tail   s�������
�� 
leng
�� 
cobj�� P�E�O Gk��,Ekh ��/E�O�E�O�E�O�k  �E�Y hO���,  �E�Y hO��%�%�%E�[OY��O�� ����������� 0 to_paragraphs  �� ����   ���� 0 the_list  ��   ���� 0 the_list   ��������
�� 
ret 
�� 
ascr
�� 
txdl
�� 
ctxt�� �kv��,FO��&� ����������� 0 ordinal  �� ����   ���� 0 
the_number  ��   ������ 0 
the_number  �� 0 ordinals   ��������  #������ 
�� 
cobj�� &����������������a a a vE�O�a �/E� ��2�������� 
0 encode  �� ����   ���� 0 the_text  ��   ���� 0 the_text   ;=��
�� .sysoexecTEXT���     TEXT�� �%�%j � ��G�������� 
0 decode  �� ����   ���� 0 the_text  ��   ���� 0 the_text   PR��
�� .sysoexecTEXT���     TEXT�� �%�%j � ��\���� !���� 0 quoted_form  �� ��"�� "  ���� 0 the_text  ��    ���� 0 the_text  ! ��
�� 
strq�� ��,E� ��j����#$���� 0 
sub_string  �� ��%�� %  �������� 0 	the_start  �� 0 the_end  �� 0 the_text  ��  # �������� 0 	the_start  �� 0 the_end  �� 0 the_text  $ ��
�� 
ctxt�� �[�\[Z�\Z�2E  ��~����&'���� 0 occurrences  �� ��(�� (  ������ 0 the_text  �� 	0 match  ��  & �������� 0 the_text  �� 	0 match  �� 0 counter  ' ���������
�� 
ascr
�� 
txdl
�� 
citm
�� .corecnte****       ****�� ���,FO��-j kE�O���,FO� �������)*���� 0 	wrap_text  �� ��+�� +  ������ 0 the_text  �� 0 the_substitue  ��  ) ���������������� 0 the_text  �� 0 the_substitue  �� 0 the_wrapped_text  �� 0 the_paragraphs  �� 0 the_len  �� 0 i  �� 0 the_paragraph  * �������
�� 
cpar
�� 
leng
�� 
cobj�� ?�E�O��-E�O��,E�O *k�kh ��/E�O��  
��%E�Y 	��%�%E�[OY��O�� �������,-���� 0 read_url read_URL�� ��.�� .  ���� 0 file_url file_URL��  , ���� 0 file_url file_URL- ����
�� 
psxf
�� .rdwrread****        ****�� 
*�/j � �������/0���� 0 
posix_path  �� ��1�� 1  ���� 0 the_path  ��  / ���� 0 the_path  0 ��
�� 
psxp�� ��,E� �������23���� 0 file_url file_URL�� ��4�� 4  �� 0 	file_path  ��  2 �~�}�~ 0 	file_path  �} 0 the_url the_URL3 ��|
�| 
url �� � 
��,E�O�U� �{��z�y56�x�{ 0 	file_path  �z �w7�w 7  �v�v 0 fileurl fileURL�y  5 �u�t�u 0 fileurl fileURL�t 0 
posix_file  6 �s�r
�s 
psxf
�r 
alis�x *�/E�O��&� �q��p�o89�n�q 0 hfs_path  �p �m:�m :  �l�l 0 	file_path  �o  8 �k�k 0 	file_path  9 �j
�j 
ctxt�n ��&� �i�h�g;<�f�i 0 alias_file_path  �h �e=�e =  �d�d 0 the_hsf_file_path  �g  ; �c�c 0 the_hsf_file_path  < �b
�b 
alis�f ��&� �a�`�_>?�^�a 0 file_name_by_url  �` �]@�] @  �\�\ 0 file_url file_URL�_  > �[�[ 0 file_url file_URL? �Z�Y�Z 0 	file_path  �Y 0 	file_name  �^ **�k+  k+ � �X-�W�VAB�U�X &0 implicit_file_url implicit_file_URL�W �TC�T C  �S�S 0 hfs_path  �V  A �R�R 0 hfs_path  B �Q=
�Q 
psxp�U ��,Ec  O�b  %Ec  	Ob  	� �PI�O�NDE�M�P 0 parent_folder  �O �LF�L F  �K�K 0 	file_path  �N  D �J�J 0 	file_path  E U�I
�I 
ctnr�M � ��,EU� �H^�G�FGH�E�H 0 posix_file_parent  �G �DI�D I  �C�C 0 alias_hsf_file_path  �F  G �B�A�B 0 alias_hsf_file_path  �A 0 parent_posix_file_path  H �@k�?
�@ 
ctxt
�? 
psxp�E 
��&�%�,E�� �>u�=�<JK�;�> 0 alias_hsf_parent  �= �:L�: L  �9�9 0 alias_hsf_file_path  �<  J �8�8 0 alias_hsf_file_path  K �7�6�
�7 
alis
�6 
ctxt�; *��&�%/E� �5��4�3MN�2�5 0 	file_kind  �4 �1O�1 O  �0�0 0 	file_path  �3  M �/�/ 0 	file_path  N ��.
�. 
kind�2 � ��,EU� �-��,�+PQ�*�- $0 file_kind_by_url file_kind_by_URL�, �)R�) R  �(�( 0 file_url file_URL�+  P �'�' 0 file_url file_URLQ �&�%�& 0 	file_path  �% 0 	file_kind  �* **�k+  k+ � �$��#�"ST�!�$ 0 file_properties  �# � U�  U  �� 0 	file_path  �"  S �� 0 	file_path  T ��
� 
pALL�! � ��,EU� ����VW�� 0 	file_info  � �X� X  �� 0 the_file  �  V �� 0 the_file  W �
� .sysonfo4asfe        file� �j  � ����YZ�� 0 file_extension  � �[� [  �� 0 the_file  �  Y �� 0 the_file  Z ��
� .sysonfo4asfe        file
� 
nmxt� 
�j  �,E� ���
�	\]�� 0 folder_names  �
 �^� ^  �� 0 
the_folder  �	  \ �� 0 
the_folder  ] ���
� 
cfol
� 
pnam� � *�/�-�,EU� ���� _`��� 0 
file_names  � ��a�� a  ���� 0 
the_folder  �   _ ���� 0 
the_folder  ` �������
�� 
cfol
�� 
file
�� 
pnam�� � *�/�-�,EU� ������bc���� 0 	file_name  �� ��d�� d  ���� 0 the_file_path  ��  b ���� 0 the_file_path  c 
��
�� 
pnam�� � ��,EU� ������ef���� 0 file_names_sans_ext  �� ��g�� g  ���� 0 
the_folder  ��  e ���������� 0 
the_folder  �� 0 
temp_names  �� 	0 names  �� 0 	temp_name  f ��������0���� 0 
file_names  
�� 
kocl
�� 
cobj
�� .corecnte****       ****�� 	0 split  �� 8*�k+  E�OjvE�O %�[��l kh b  ��l+ �k/�6F[OY��O�� ��>����hi���� 0 alias_hfs_file_path  �� ��j�� j  ���� 0 posix_file_path  ��  h ������ 0 posix_file_path  �� 0 the_alias_hfs_file_path  i ����
�� 
psxf
�� 
alis�� *�/�&E�O�� ��S����kl���� 0 hfs_file_path  �� ��m�� m  ���� 0 posix_file_path  ��  k ������ 0 posix_file_path  �� 0 the_alias_hfs_file_path  l ������ 0 alias_hfs_file_path  
�� 
ctxt�� *�k+  E�O��&� ��m����no���� 0 hfs_parent_path  �� ��p�� p  ���� 0 the_hsf_path  ��  n ���������� 0 the_hsf_path  �� 0 the_parent_folder  �� 0 the_posix_path  �� 0 the_hfs_file_path  o �������� 0 parent_folder  �� 0 file_url file_URL�� 0 hfs_file_path  �� *�k+  E�O*�k+ E�O*�k+ E�O�< �� 6����qr���� 0 	load_many  ��  ��  q  r  �� h= �� N����st���� 0 relative_load_many  ��  ��  s  t  �� h> �� Z����uv���� 0 load  �� ��w�� w  ������ 0 	hsf_alias  �� 0 	file_name  ��  u �������� 0 	hsf_alias  �� 0 	file_name  �� 0 the_file_path  v ������
�� 
ctxt
�� 
alis�� 0 load_script  �� ��&�%E�O**�/k+ ? �� ~����xy���� 0 load_script  �� ��z�� z  ���� 0 apple_script_path  ��  x ������������������ 0 apple_script_path  �� 0 script_object  �� 0 script_text  �� 0 e  �� 0 n  �� 0 p  �� 0 f  �� 0 t  y ����{ ���|���� ��� � �����} � � �������������
�� .sysoloadscpt        file��  { ������
�� 
errn���(��  
�� .rdwrread****        ****| ������
�� 
errn���\��  
�� 
as  
�� 
utf8
�� 
ret 
�� .sysodsct****        scpt�� 0 e  } ����~
�� 
errn�� 0 n  ~ ����
�� 
ptlr�� 0 p   �����
�� 
erob�� 0 f  � ������
�� 
errt�� 0 t  ��  
�� .sysodlogaskr        TEXT
�� 
errn
�� 
ptlr
�� 
erob
�� 
errt�� �� | �j  E�W mX  �E�O �j E�W X  ���l E�O ��%�%�%�%�%�%j E�W /X  �%a %�%a %j O)a �a �a �a �a �O�@ ����~���}�� 0 relative_load  � �|��| �  �{�z�y�{ 0 	hsf_alias  �z 0 	file_name  �y 0 path_offset  �~  � �x�w�v�u�t�x 0 	hsf_alias  �w 0 	file_name  �v 0 path_offset  �u 0 the_offset_file_path  �t 0 i  � �s�r-�q
�s 
alis
�r 
ctxt�q 0 load  �} &�E�O �ikh *��&�%/E�[OY��O*��l+ A �p��o�n���m
�p .aevtoappnull  �   � ****� k     ��  ��l�l  �o  �n  �  � �k�j
�k .earsffdralis        afdr�j 0 load  �m *)j  �im+ ascr  ��ޭ