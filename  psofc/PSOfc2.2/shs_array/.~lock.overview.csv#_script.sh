#$ -S /bin/sh 
#$ -wd /vol/grid-solar/sgeusers/daiyan
##$ -M Yan.Dai@ecs.vuw.ac.nz
##$ -m be 

mkdir -p /local/tmp/daiyan/$JOB_ID 

if [ -d /local/tmp/daiyan/$JOB_ID ]; then
        cd /local/tmp/daiyan/$JOB_ID
else
        echo "There's no job directory to change into" 
        echo "Here's LOCAL TMP "
        ls -la /local/tmp
        echo "AND LOCAL TMP FRED "
        ls -la /local/tmp/daiyan
        echo "Exiting"
        exit 1

fi

cp /vol/grid-solar/sgeusers/daiyan/run_array_Aug_7_2013/arrayjava.jar .
mkdir file_array
cp -r /vol/grid-solar/sgeusers/daiyan/Data .
java -jar arrayjava.jar .~lock.overview.csv#

rm arrayjava.jar
cp -r *  /vol/grid-solar/sgeusers/daiyan/run_array_Aug_7_2013/
rm -r Data
rm -r file_array
cd /vol/grid-solar/sgeusers/daiyan
pwd
rm -fr /local/tmp/daiyan/$JOB_ID
