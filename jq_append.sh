#!/bin/bash +x

a='[{"or":[{"aa":"11111"}]}]'
echo '{
     "and": [
         {
             "and": [
                 {
                     "artifact.module.build.name": {
                         "$eq": "maven+example"
                     }
                 },
                 {
                     "artifact.module.build.number": {
                         "$eq": "317"
                     }
                 }
             ]
         },
         {
             "or": [
                 {
                     "modified": "1234"
                 }
             ]
         }
     ]
 }' | jq ".and + $a"
