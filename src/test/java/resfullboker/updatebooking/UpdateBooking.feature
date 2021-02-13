Feature: Update Boking
  Este servicio es utilizado para poder
  actualizar las reservas que cuenta la pagina wweb

  Background:
    * url baseUrl
    * header Accept = 'application/json'
    
    Scenario: Verificar peticion correcta para actualizar una reserva reciba 200
      * def SchemaUtils = Java.type('com.intuit.karate.restfulbooker.util.SchemaUtils')
      * string schema = read('classpath:resfullboker/updatebooking/UpdateBooking-Schema.json')
      * def CreateTokenResponse = call read('classpath:common/readtoken.feature')
      * def accessToken = CreateTokenResponse.response.token
      Given path '/booking/' + 13
      And cookie token = accessToken
      And request
      """
      {
            "firstname" : "Jacy Valeria",
            "lastname" : "Flores Peña",
            "totalprice" : 11,
            "depositpaid" : true,
            "bookingdates" : {
                "checkin" : "2020-11-02",
                "checkout" : "2020-11-05"
            },
            "additionalneeds" : "Breakfast"
        }'
      """
      When method PUT
      Then status 200
      And assert SchemaUtils.isValid(response,schema)