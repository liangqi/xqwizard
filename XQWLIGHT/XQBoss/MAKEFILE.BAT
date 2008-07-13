del XQBoss.ja?
makefile\preverify.exe -classpath lib\cldcapi10.jar;lib\midpapi20.jar -d bin bin
cd bin
..\makefile\ZIP -r ..\XQBoss.jar *
cd ..
copy bin\META-INF\MANIFEST.MF XQBoss.jad
echo.>> XQBoss.jad
makefile\SHOWSIZE XQBoss.jar "MIDlet-Jar-Size: %%d" >> XQBoss.jad
echo MIDlet-Jar-URL: XQBoss.jar>> XQBoss.jad