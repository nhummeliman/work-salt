stop_services:
  service.dead:
    -names:
      - ActiveMQ
      - Redis
      - iManageMicroServiceHub
      - imDmsSvc
      - imDsSyncSvc
      - Sentinel