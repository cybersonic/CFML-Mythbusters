<cfset System = CreateObject("java", "java.lang.System")>
<cfset testinstance.start = System.nanoTime()>
<cfloop from="1" to="#loops#" index="x"><cfset testObj = CreateObject("component", "tests.test")>
<cfset test1 = testObj.MyMethod()>
<cfset test2 = testObj.myMethod2()></cfloop>
<cfset testinstance.end = System.nanoTime()>
<cfset testinstance.total = testinstance.end - testinstance.start>	
