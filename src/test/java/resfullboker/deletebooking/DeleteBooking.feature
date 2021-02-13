Feature: Delete booking
  Este servio nos permite eliminar reservas por medio del booking id

  Background:
    * url baseUrl

    Scenario: Verificar petición correcta para eliminar una reserva reciba 201
      * def CreateTokenResponse = call read('classpath:common/readtoken.feature')
      * def accessToken = CreateTokenResponse.response.token
      Given path '/booking/' + 5
      And cookie token = accessToken
      When method DELETE
      Then status 201