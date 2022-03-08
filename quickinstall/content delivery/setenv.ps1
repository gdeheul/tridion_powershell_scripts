#####################################################################
#                                                                   #
#   SDL Delivery environment variables script                       #
#                                                                   #
#   some values are dependent on TARGET_LOCATION & HOST_IP          #
#                                                                   #
#####################################################################

$delivery_vars["./logs"] = "E:/logs/tridion/content delivery/live"

# Discovery
$delivery_vars["DISCOVERY_DEFAULT_SERVER_NAME"] = "DATA_BASE_SERVER"
$delivery_vars["DISCOVERY_DEFAULT_PORT_NUMBER"] = "4000"
$delivery_vars["DISCOVERY_DEFAULT_DATABASE_NAME"] = "broker_discovery_live"
$delivery_vars["DISCOVERY_DEFAULT_USER"] = "broker_login"
$delivery_vars["DISCOVERY_DEFAULT_PASSWORD"] = "encrypted:lEkYSdEsER18dmI+qTxhxQ=="

# Content
$delivery_vars["CONTENT_DEFAULT_SERVER_NAME"] = "DATA_BASE_SERVER"
$delivery_vars["CONTENT_DEFAULT_PORT_NUMBER"] = "4000"
$delivery_vars["CONTENT_DEFAULT_DATABASE_NAME"] = "broker_live"
$delivery_vars["CONTENT_DEFAULT_USER"] = "broker_login"
$delivery_vars["CONTENT_DEFAULT_PASSWORD"] = "encrypted:lEkYSdEsER18dmI+qTxhxQ=="

# Preview
$delivery_vars["PREVIEW_DEFAULT_SERVER_NAME"] = "DATA_BASE_SERVER"
$delivery_vars["PREVIEW_DEFAULT_PORT_NUMBER"] = "4000"
$delivery_vars["PREVIEW_DEFAULT_DATABASE_NAME"] = "broker_session_live"
$delivery_vars["PREVIEW_DEFAULT_USER"] = "AG4B_broker_login"
$delivery_vars["PREVIEW_DEFAULT_PASSWORD"] = "encrypted:lEkYSdEsER18dmI+qTxhxQ=="

# UGC
$delivery_vars["UGC_DEFAULT_SERVER_NAME"] = "mssqlserver.hostname"
$delivery_vars["UGC_DEFAULT_PORT_NUMBER"] = "4000"
$delivery_vars["UGC_DEFAULT_DATABASE_NAME"] = "database.name"
$delivery_vars["UGC_DEFAULT_USER"] = "user.name"
$delivery_vars["UGC_DEFAULT_PASSWORD"] = "user.password"

$delivery_vars["DEFAULT_FILE"] = "\\tridion.domain.nl\tridion_prd02$\sites\live"
$delivery_vars["DEFAULT_DATA_FILE"] = "\\tridion.domain.nl\tridion_prd02$\sites\live"

# Deployer Endpoint and Deployer Engine
$delivery_vars["DEPLOYER_STATE_DEFAULT_SERVER_NAME"] = "DATA_BASE_SERVER"
$delivery_vars["DEPLOYER_STATE_DEFAULT_PORT_NUMBER"] = "4000"
$delivery_vars["DEPLOYER_STATE_DEFAULT_DATABASE_NAME"] = "state_store_live"
$delivery_vars["DEPLOYER_STATE_DEFAULT_USER"] = "ss_login"
$delivery_vars["DEPLOYER_STATE_DEFAULT_PASSWORD"] = "encrypted:lEkYSdEsER18dmI+qTxhxQ=="

$delivery_vars["QUEUE_PATH"] =  "F:\temp\tridion\live\queue\incoming"
$delivery_vars["QP_FINAL_TX"] = $delivery_vars["QUEUE_PATH"] + "\FinalTX"
$delivery_vars["QP_PREPARE"] = $delivery_vars["QUEUE_PATH"] + "\Prepare"
$delivery_vars["BINARY_PATH"] = "F:\temp\tridion\live\binary"
