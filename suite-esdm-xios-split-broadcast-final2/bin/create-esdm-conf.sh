#!/bin/bash

# Create ESDM conf file
cat > esdm.conf << EOF
{
        "esdm": {
                "backends": [
                        {
                                "type": "$VAR_TYPE",
                                "id": "$VAR_ID",
                                "target": "$VAR_TARGET"
                        }
                ],
                "metadata": {
                        "type": "metadummy",
                        "id": "md",
                        "target": "./_metadummy"
                }
        }
}
EOF
