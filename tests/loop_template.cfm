<cfset testinstance.start = getTickCount("nano")>
<cfloop from="1" to="#loops#" index="x">{test}</cfloop>
<cfset testinstance.end = getTickCount("nano")>
<cfset testinstance.total = testinstance.end - testinstance.start>	
