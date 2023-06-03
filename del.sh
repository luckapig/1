timenow=$(date "+%Y-%m-%d_%H-%M-%S")
timedel=$(date +'%Y-%m-%d_%H-%M-%S' -d "-40 minute")
daynow=$(date "+%Y-%m-%d")
daydel=$(date +"%Y-%m-%d" -d "-3 day")

find save -type f -name "*$daydel*.png" -exec rm -rf {} \; 


echo $timenow
echo $timedel
echo $daydel > del.time
