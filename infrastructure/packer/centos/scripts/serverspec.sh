#!/bin/sh -e

# Install Ruby
yum -y install ruby ruby-devel rubygems

gem install bundler -v 1.6.2 --no-ri --no-rdoc
cd /tmp/test
bundle install --path vendor/bundle

echo "WI-169 Tests are currently disabled."
exit 0

echo "Running tests..."
TEST_FILES=`ls ./spec/*_spec.rb | xargs`
TEST_RESULTS_FILE="test-results.txt"
EXEC_MODE=true bundle exec "rspec --format documentation --out ${TEST_RESULTS_FILE} --format documentation ${TEST_FILES}"

# Exit with error code if we have test failures or no test results
# @see https://circleci.com/docs/rspec-wrong-exit-code
if [ -e $TEST_RESULTS_FILE ]; then
  echo "INFO File ${TEST_RESULTS_FILE} exists."
else
  echo "ERROR Could not find test results.Something is wrong. Exiting now."
  exit 1
fi

if grep --quiet "^Failed examples:$" $TEST_RESULTS_FILE; then
  echo "ERROR Found test failures inside the test results. Exiting now."
  exit 1
fi

# Cleanup
rm -r /tmp/test
