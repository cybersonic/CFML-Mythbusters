<cfset testinstance.start = getTickCount("nano")>
<cfloop from="1" to="#loops#" index="x"><cfif isDefined("variables.z")></cfif></cfloop>
<cfset testinstance.end = getTickCount("nano")>
<cfset testinstance.total = testinstance.end - testinstance.start>	
