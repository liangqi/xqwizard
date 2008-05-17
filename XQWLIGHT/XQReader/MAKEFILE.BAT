del XQReader.ja?
makefile\preverify.exe -classpath lib\cldcapi10.jar;lib\midpapi20.jar -d bin bin
cd bin
..\makefile\7z a -tzip ..\XQReader.jar *
cd ..
copy bin\META-INF\MANIFEST.MF XQReader.jad
echo.>> XQReader.jad
makefile\SHOWSIZE XQReader.jar "MIDlet-Jar-Size: %%d" >> XQReader.jad
echo MIDlet-Jar-URL: XQReader.jar>> XQReader.jad