<cfset testinstance.start = getTickCount("nano")>
<cfloop from="1" to="#loops#" index="x"><cfset a = 0><!---
---><cfset a = a + 1><!---
---><cfset b = a + 2><!---
---><cfset a = a + 3><!---
---><cfset b = a + 4><!---
---><cfset a = a + 5><!---
---><cfset b = a + 6></cfloop>
<cfset testinstance.end = getTickCount("nano")>
<cfset testinstance.total = testinstance.end - testinstance.start>	
