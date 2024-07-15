start_services:
  service.running:
    -names:
      - Sentinel
      - imDsSyncSvc
      - imDmsSvc
      - iManageMicroServiceHub
      - Redis
      - ActiveMQ