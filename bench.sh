#!/bin/bash

# Тест производительности тестового блога

concurrencies=(300)

for i in "${concurrencies[@]}"
do
  n=$((i * 10))
  t=`date "+%H:%M:%S"`
  printf "\n\nNum: ${n}, Conc: ${i}, Time: ${t}\n\n"
  ab -c ${i} -n ${n} -s 300 -dS \
    http://ec2-52-24-51-160.us-west-2.compute.amazonaws.com/
done
