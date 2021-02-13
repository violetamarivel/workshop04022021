Feature: PartialUpdateBooking
  Se va actualizar las reservas de manera parcial en la web

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario: Verificar petición correcta para actualizar parcialmente una reserva reciba 200
      * def CreateTokenResponse = call read('classpath:common/readtoken.feature')
      * def accessToken = CreateTokenResponse.response.token
      Given path '/booking/' + 5
      And cookie token = accessToken
      And request
      """
             {
            "firstname" : "Violeta Valeria",
            "lastname" : "Flores Peña"
        }'
      """
      When method PATCH
      Then status 200

