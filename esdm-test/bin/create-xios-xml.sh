#!/bin/bash

# Create ESDM conf file
cat > esdm.conf << EOF
{
        "esdm": {
                "backends": [
                        {
                                "type": "POSIX",
                                "id": "p1",
                                "target": "./_posix1"
                        }
                ],
                "metadata": {
                        "type": "metadummy",
                        "id": "md",                     "target": "./_metadummy"
                }
        }
}
EOF