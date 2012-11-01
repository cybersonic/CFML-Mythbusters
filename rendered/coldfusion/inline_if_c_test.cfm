<cfset System = CreateObject("java", "java.lang.System")>
<cfset testinstance.start = System.nanoTime()>
<cfloop from="1" to="#loops#" index="x"><cfset b = IIF(a eq 5, DE(1), DE(2))>
</cfloop>
<cfset testinstance.end = System.nanoTime()>
<cfset testinstance.total = testinstance.end - testinstance.start>	
