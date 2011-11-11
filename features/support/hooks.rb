Before do
  Sham.reset
  RestClient.post "#{TEST_SERVICE_URI}/SampleService/Entities.svc/CleanDatabaseForTesting", {}
end