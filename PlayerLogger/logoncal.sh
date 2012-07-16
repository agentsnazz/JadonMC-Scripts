#!/bin/bash
# logoncal.sh
# converts logon/logout data to 'visual' calendar

# Break up overnight sessions and convert to 10min units

for each line in parsedlogfile
do
    if there is another line after this one make it line2
        convert time1 to 10min time
        convert time2 to 10min time
        if date2 = date1
            for i from time1 to time2
                todaysarray[i]=1
done