Feature: Create token
  Este servicio generara el token donde el usuario se logueara

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'


    Scenario: Verificar que al enviar la peticion con user y possword correctos recibe 200
      Given path '/auth'
      And request
      """
      {
         "username" : "admin",
         "password" : "password123"
       }
      """
      When method POST
      Then status 200
      And match response.token == '#string'







