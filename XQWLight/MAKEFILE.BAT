del XQWLight.ja?
makefile\preverify.exe -classpath lib\cldcapi10.jar;lib\midpapi20.jar -d bin bin
makefile\7z a -tzip XQWLight.jar .\bin\*
copy bin\META-INF\MANIFEST.MF XQWLight.jad
echo. >> XQWLight.jad
makefile\SHOWSIZE XQWLight.jar "MIDlet-Jar-Size: %%d" >> XQWLight.jad
echo MIDlet-Jar-URL: XQWLight.jar >> XQWLight.jad