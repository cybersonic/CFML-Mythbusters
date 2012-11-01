<cfset System = CreateObject("java", "java.lang.System")>
<cfset testinstance.start = System.nanoTime()>
<cfloop from="1" to="#loops#" index="x"><cfset sLst = listAppend(sLst, x)></cfloop>
<cfset testinstance.end = System.nanoTime()>
<cfset testinstance.total = testinstance.end - testinstance.start>	
