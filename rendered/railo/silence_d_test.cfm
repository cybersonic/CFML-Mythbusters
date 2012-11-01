<cfset testinstance.start = getTickCount("nano")>
<cfloop from="1" to="#loops#" index="x"><cfsilent>
	<cfloop from="1" to="10" index="j">
		<cfloop from="1" to="#iCount#" index="i">
			<cfset b = variables.a>
		</cfloop>
	</cfloop>
</cfsilent>
</cfloop>
<cfset testinstance.end = getTickCount("nano")>
<cfset testinstance.total = testinstance.end - testinstance.start>	
