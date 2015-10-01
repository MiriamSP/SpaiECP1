@echo off
set workspace=E:\Master\SW\workspace\SPAI\miriam.sanz.ecp1.miw.upm.es
set PATH=%PATH%C:\Program Files\Java\jdk1.8.0_60\bin;E:\Master\SW\apache-maven-3.3.3\bin
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_60
set M2_HOME=E:\Master\SW\apache-maven-3.3.3
echo -----------------------------------------
echo Clean y test en el perfil develop y package en el perfil preproductio(C) miriam.sanz.ecp1.miw.upm.es
echo -----------------------------------------
echo .
echo Workspace --- %workspace%
echo .
echo .

cd %workspace%
:: -ff, --fail-fast. Stop at first failure in reactorized builds. Línea de comentario
echo ============ mvn -ff clean test (profile: develop) =========================================================================
echo .
call mvn -ff clean test 
if errorLevel 1 goto errorDevelop

echo .
:: -Dmaven.test.skip=true. To skip running the tests for a particular project
echo ============ call mvn -Dmaven.test.skip=true install -Denvironment.type=preproduction (profile: preproduction) ================
echo .
call mvn -Dmaven.test.skip=true install -Denvironment.type=preproduction
pause
exit

:errorDevelop
echo .
echo .
echo .
echo ########  ERRORES...
pause
