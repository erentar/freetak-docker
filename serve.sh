#!/bin/bash
# Sharing for FTSConfig.yaml
if [[ ! -f "/opt/fts/FTSConfig.yaml" ]]
  then
    python3 -c "from FreeTAKServer.core.configuration.configuration_wizard import autogenerate_config; autogenerate_config()"
fi

python3 -m FreeTAKServer.controllers.services.FTS &
cd $(pip3 show FreeTAKServer-UI | grep -Po "(?<=Location: ).+")/FreeTAKServer-UI/ && python3 ./run.py
