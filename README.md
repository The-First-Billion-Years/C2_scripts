# C2_scripts

C2 wiki https://www.computerome.dk/wiki

## SSH login

For easy login add the following to your `~/.ssh/config` file on your laptop:
```
Host c2
    HostName ssh.computerome.dk
    User YOUR_C2_USERNAME
    ForwardAgent yes
    IdentityFile ~/.ssh/id_rsa.pub
```

Login and move to project directory
```
ssh c2
cd /home/projects/ku_00154/
```

## Running jobs

Run a job
```
qsub PATH_TO_SCRIPT.sh
```

Check your jobs
```
# check your jobs
qstat -u USER_NAME

# info about job
qstat -f JOB_ID
```

## Usage stats
To inquire about your usage of Computerome, you can run the usage command, available through the usage_script module
```
$ module load tools usage_script/2.0
$ usage -u
```

## Copying data from C2 to your computer

```
rsync -av -e ssh c2:PATH_TO_DATA_ON_C2/* FINAL_LOCATION_ON_YOUR_LAPTOP ;  notify -message "rsync complete" &
```
