Feature: Get Booking Ids
  Este servicio es utilizado para poder
  consultar todos los ids de las reservas de restfullbooker

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    
    Scenario: verificar peticion correcta el obtener todo los booking ids
      Given path '/booking'
      When method Get
      Then status 200