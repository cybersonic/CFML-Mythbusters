<cfset testinstance.start = getTickCount("nano")>
<cfloop from="1" to="#loops#" index="x"><cfset b = IIF(a eq 5, DE(1), DE(2))>
</cfloop>
<cfset testinstance.end = getTickCount("nano")>
<cfset testinstance.total = testinstance.end - testinstance.start>	
