#!/bin/bash
sudo salt $1 state.apply transfer_files
sudo salt $1 state.apply stop_work_services
sudo salt $1 state.apply uninstall_work_server
sudo salt $1 state.apply install_work_server
sudo salt $1 state.apply start_work_services