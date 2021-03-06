#!/bin/bash
set -e

echo "Checking ../textgen-tests-config.json"
jsonschema -i ../textgen-tests-config.json schemas/project_definition.json

for generator_test_data in $( echo data/*/test.json ); do
	echo "Checking $generator_test_data";
	jsonschema -i "$generator_test_data" schemas/generator_test.json
done

for test_data in $( echo data/*/tests/*/test.json ); do
	echo "Checking $test_data";
	jsonschema -i "$test_data" schemas/test.json
done
