#!/bin/bash

# Тест производительности тестового блога

concurrencies=(10 50 150 200 300)

date
printf "\n\n\n"

for i in "${concurrencies[@]}"
do
  n=$((i * 10))
  t=`date "+%H:%M:%S"`
  printf "\n\nNum: ${n}, Conc: ${i}, Time: ${t}\n\n"
  ab -c ${i} -n ${n} -s 300 -dS \
    http://ec2-34-210-14-30.us-west-2.compute.amazonaws.com/
done

printf "\n\n\n"
date
