<cfset testinstance.start = getTickCount()>
<cfloop from="1" to="#loops#" index="x">{test}</cfloop>
<cfset testinstance.end = getTickCount()>
<cfset testinstance.total = testinstance.end - testinstance.start>	
