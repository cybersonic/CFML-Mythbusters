<cfset System = CreateObject("java", "java.lang.System")>
<cfset testinstance.start = System.nanoTime()>
<cfloop from="1" to="#loops#" index="x"><cfif isDefined("variables.a")></cfif></cfloop>
<cfset testinstance.end = System.nanoTime()>
<cfset testinstance.total = testinstance.end - testinstance.start>	
