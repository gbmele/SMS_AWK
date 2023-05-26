BEGIN{

## RAW3
##input 71 fields ----> is DOC and 70days of shifts.

#RS ="|"   #turn this on for mzn file dump turn it off for csv file dump

FS =","   #this is the only separator required for CSV == a CSV file is comma delimited and records are \n delimited
OFS="*"
}
NR>=1{

#gsub(/ /,"")   #psace
gsub(/\n/,"")  #newline

c= split($0,ARR,",")
  DOCS[NR]=$1
  r=DOCS[NR]
  for (i =2 ;i<=c;i++){
    r = r OFS ARR[i]
    ROSTER[DOCS[NR] SUBSEP (i-1)] = ARR[i]
   }
   print r
}

END{
print ROSTER[DOCS[1] SUBSEP 1]
print ROSTER["JD" SUBSEP 1]
print ROSTER["JD" SUBSEP 70]
print ROSTER["DZ" SUBSEP 70]
}
