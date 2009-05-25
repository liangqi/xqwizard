del XQWLight.ja?
del XQWLight-NoKeyPad.ja?
makefile\preverify.exe -classpath lib\cldcapi10.jar;lib\midpapi20.jar -d bin bin
cd bin
copy META-INF\MANIFEST.MF ..\XQWLight.jad
..\makefile\ZIP -r -X ..\XQWLight.jar *
echo.>> META-INF\MANIFEST.MF
echo XQWLight-NoKeyPad: true>> META-INF\MANIFEST.MF
copy META-INF\MANIFEST.MF ..\XQWLight-NoKeyPad.jad
..\makefile\ZIP -r -X ..\XQWLight-NoKeyPad.jar *
cd ..
echo.>> XQWLight.jad
makefile\SHOWSIZE XQWLight.jar "MIDlet-Jar-Size: %%d" >> XQWLight.jad
echo MIDlet-Jar-URL: XQWLight.jar>> XQWLight.jad
echo.>> XQWLight-NoKeyPad.jad
makefile\SHOWSIZE XQWLight-NoKeyPad.jar "MIDlet-Jar-Size: %%d" >> XQWLight-NoKeyPad.jad
echo MIDlet-Jar-URL: XQWLight-NoKeyPad.jar>> XQWLight-NoKeyPad.jad