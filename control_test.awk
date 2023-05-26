BEGIN{print "HI"
OFS = " "
}
NR > 1{
              _DOC = 1
              _MZS = 2  #minizinc shift
          _VERSION = 3  #version of shift a1 a2 p1 p2 etc
               IDX = $_DOC SUBSEP $_MZS SUBSEP $_VERSION
         CLIN[IDX] = $4
      NONCLIN[IDX] = $5
         DAYS[IDX] = $6
       WEEKS[IDX SUBSEP "WKS"] = $7
}

END{
doc = "RP"
day = 5
shift = "c"
v1 = doc SUBSEP shift SUBSEP 1 
v2 = doc SUBSEP shift SUBSEP 2
   if(match(DAYS[v1],day)) {print CLIN[v1], NONCLIN[v1]}
   if(match(DAYS[v2],day)) {print CLIN[v2], NONCLIN[v2]}

if (WEEKS[c1 SUBSEP "WKS"] == 2) {print "in week 2 working on day " day " so it is day " (2 - 1) * 7 + day" "NONCLIN[c1]}

}