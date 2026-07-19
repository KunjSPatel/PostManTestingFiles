#!/bin/bash

newman run \
collections/contact.collection.json \
-e environments/qa.environment.json \
-r cli,htmlextra \
--reporter-htmlextra-export reports/api-test-report.html