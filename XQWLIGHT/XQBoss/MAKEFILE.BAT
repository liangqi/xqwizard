del XQPhD.ja?
makefile\preverify.exe -classpath lib\cldcapi10.jar;lib\midpapi20.jar -d bin bin
cd bin
..\makefile\7z a -tzip ..\XQPhD.jar *
cd ..
copy bin\META-INF\MANIFEST.MF XQPhD.jad
echo.>> XQPhD.jad
makefile\SHOWSIZE XQPhD.jar "MIDlet-Jar-Size: %%d" >> XQPhD.jad
echo MIDlet-Jar-URL: XQPhD.jar>> XQPhD.jad