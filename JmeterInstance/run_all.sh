#!/bin/bash
if [[ -d results ]]; then
    echo "results directory already exists"
fi

if [[ -d reports ]]; then
    echo "reports directory already exists"
else mkdir reports
fi

if [[ -d processed_results ]]; then
    echo "processed_results directory already exists"
else mkdir processed_results
fi

concurrent_users=(10 50 100 500 1000 1500 2000 2500)
proxy_type=(DirectProxy CBRProxy CBRSOAPHeaderProxy CBRTransportHeaderProxy SecureProxy XSLTEnhancedProxy XSLTProxy)
request_payloads=(1K_buyStocks.xml 5K_buyStocks.xml 10K_buyStocks.xml 100K_buyStocks.xml 500B_buyStocks.xml)
secure_payloads=(1K_buyStocks_secure.xml 5K_buyStocks_secure.xml 10K_buyStocks_secure.xml 100K_buyStocks_secure.xml 500B_buyStocks_secure.xml)

ei_host=192.168.48.172
test_duration=600

mkdir -p results/gclogs

run_tests() {

 for c in ${concurrent_users[@]} ; do
        for h in ${proxy_type[@]} ; do
                      mkdir -p ~/results/$c
                      if [ $h == "SecureProxy" ] ; then
                           for i in ${secure_payloads[@]} ; do
                               ./esb-perf-execution.sh $ei_host $c $test_duration $h $i
                           done
                      else
                           for j in ${request_payloads[@]} ; do
                               ./esb-perf-execution.sh $ei_host $c $test_duration $h $j
                           done
                      fi
        # Increased due to errors
        sleep 240
        done
  done
}

run_tests

echo "Completed"

