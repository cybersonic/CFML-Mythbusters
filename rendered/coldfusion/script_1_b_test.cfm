<cfset System = CreateObject("java", "java.lang.System")>
<cfset testinstance.start = System.nanoTime()>
<cfloop from="1" to="#loops#" index="x"><cfscript>
a = 0;
a = a + 1;
b = a + 2;	
a = a + 3;
b = a + 4;	
a = a + 5;
b = a + 6;
</cfscript></cfloop>
<cfset testinstance.end = System.nanoTime()>
<cfset testinstance.total = testinstance.end - testinstance.start>	
