<cfset System = CreateObject("java", "java.lang.System")>
<cfset testinstance.start = System.nanoTime()>
<cfloop from="1" to="#loops#" index="x"><cfoutput>
	<cfloop from="1" to="100" index="i">
		#i#
	</cfloop>
</cfoutput></cfloop>
<cfset testinstance.end = System.nanoTime()>
<cfset testinstance.total = testinstance.end - testinstance.start>	
