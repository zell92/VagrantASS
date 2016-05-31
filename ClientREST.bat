@setlocal enableextensions enabledelayedexpansion
@echo Client Applicazione REST
@SET PRODUCT_SERVICE_URL=http://192.168.33.10:8080/AutoRest
@pause
:loop
@cls
@echo Effettua una scelta: 
@echo 1-Lista case automobilistiche
@echo 2-Lista automobili
@echo 3-Lista automobili di una casa automobilistica
@echo 4-Dati automobile
@echo 5-Dati casa automobilistica
@echo 6-Inserisci casa automobilistica
@echo 7-Inserisci automobile
@echo 8-Elimina casa automobilistica
@echo 9-Elimina automobile
@echo 0-Esci


@SET /P SCELTA=

@if %SCELTA% == 1 (@curl -s -H "Accept:application/json" -get "%PRODUCT_SERVICE_URL%/carmakers")

@if %SCELTA% == 2 (@curl -s -H "Accept:application/json" -get "%PRODUCT_SERVICE_URL%/cars")

@if %SCELTA% == 3 (
@echo Inserisci l'ID della casa automobilistica: 
@SET /P ID=
@curl -s -H "Accept:application/json" -get "%PRODUCT_SERVICE_URL%/cars/!ID!"
@SET ID=
)

@if %SCELTA% == 4 (
@echo Inserisci l'ID della macchina: 
@SET /P ID=
@curl -s -H "Accept:application/json" -get "%PRODUCT_SERVICE_URL%/car/!ID!"
@SET ID=
)

@if %SCELTA% == 5 (
@echo Inserisci l'ID della casa automobilistica: 
@SET /P ID=
@curl -s -H "Accept:application/json" -get "%PRODUCT_SERVICE_URL%/carmaker/!ID!"
@SET ID=
)


@if %SCELTA% == 6 (

@echo Inserisci il nome della casa automobilistica: 
@SET /P NAME=
@curl -s -H "Accept:application/json" --data "name=!NAME!" -post "%PRODUCT_SERVICE_URL%/carmakers"
@SET NAME=
)


@if %SCELTA% == 7 (
@echo Inserisci il modello dell'auto:
@SET /P MODEL=
@echo Inserisci il prezzo: 
@SET /P PRICE=
@echo Inserisci il codice prodotto: 
@SET /P CODE=
@echo Inserisci una descrizione dell'auto: 
@SET /P DESCRIPTION=
@echo Inserisci l'ID della casa automobilistica: 
@SET /P CARMAKERID=

@curl -s -H "Accept:application/json" --data "model=!MODEL!&price=!PRICE!&code=!CODE!&description=!DESCRIPTION!&carmakerId=!CARMAKERID!" -post "%PRODUCT_SERVICE_URL%/cars"

@echo Auto inserita: 
@echo modello:!MODEL!
@echo prezzo:!PRICE!
@echo codice:!CODE!
@echo descrizione:!DESCRIPTION!
@echo Id casa automobilistica:!CARMAKERID!


@SET MODEL=
@SET PRICE=
@SET DESCRIPTION=
@SET CODE=
@SET CARMAKERID=
)

@if %SCELTA% == 8 (

@echo Inserisci l'id della casa automobilistica che vuoi eliminare: 
@SET /P ID=
@echo %PRODUCT_SERVICE_URL%/carmaker/!ID!
@curl -s -H "Accept:application/json" -X DELETE "%PRODUCT_SERVICE_URL%/carmaker/!ID!"
@SET ID=
)

@if %SCELTA% == 9 (

@echo Inserisci l'id dell'auto che vuoi eliminare: 
@SET /P ID=
@curl -s -H "Accept:application/json" -X DELETE "%PRODUCT_SERVICE_URL%/car/!ID!"
@SET ID=
)


@if %SCELTA% == 0 (@goto end)
@echo.
@pause
@goto loop
:end
@endlocal
