@echo off
set workspace=E:\Master\SW\workspace\SPAI\miriam.sanz.ecp1.miw.upm.es
set PATH=%PATH%C:\Program Files\Java\jdk1.8.0_60\bin;E:\Master\SW\apache-maven-3.3.3\bin
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_60
set M2_HOME=E:\Master\SW\apache-maven-3.3.3

echo -----------------------------------------
echo Clean y test en el perfil develop (C) miriam.sanz.ecp1.miw.upm.es
echo -----------------------------------------
echo .
echo Workspace --- %workspace%
echo .
echo .

cd %workspace%
:: Test en Develop
:: -ff, --fail-fast. Stop at first failure in reactorized builds
echo ============ mvn -ff clean test (profile: develop) =======================================================
echo .
call mvn -ff clean test
if errorLevel 1 goto errorDevelop
pause
exit

:errorDevelop
echo .
echo .
echo .
echo ########  ERRORES de test en Develop
pause
exit