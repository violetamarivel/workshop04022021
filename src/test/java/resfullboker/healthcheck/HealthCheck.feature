Feature: Health Check
  Este servicio sirver para verificar que todos los servicios esten ejecutados

  Background:
    * url baseUrl
    Scenario: Verificar petición correcta para consultar el estado del servicio reciba 201
      Given path '/ping'
      When method GET
      Then status 201
