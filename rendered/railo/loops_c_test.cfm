<cfset testinstance.start = getTickCount("nano")>
<cfloop from="1" to="#loops#" index="x">

<cfscript>
	loop from="1" to="100" index="j"{	}
</cfscript></cfloop>
<cfset testinstance.end = getTickCount("nano")>
<cfset testinstance.total = testinstance.end - testinstance.start>	
