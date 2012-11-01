<cfset testinstance.start = getTickCount("nano")>
<cfloop from="1" to="#loops#" index="x"><cfloop from="1" to="100" index="i">
	<cfoutput>
		#i#
	</cfoutput>
</cfloop></cfloop>
<cfset testinstance.end = getTickCount("nano")>
<cfset testinstance.total = testinstance.end - testinstance.start>	
