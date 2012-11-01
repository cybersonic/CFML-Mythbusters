<cfset testinstance.start = getTickCount("nano")>
<cfloop from="1" to="#loops#" index="x"><cfset testObj = CreateObject("component", "tests.test")>
<cfset test1 = testObj.MyMethod()>
<cfset test2 = testObj.myMethod2()></cfloop>
<cfset testinstance.end = getTickCount("nano")>
<cfset testinstance.total = testinstance.end - testinstance.start>	
