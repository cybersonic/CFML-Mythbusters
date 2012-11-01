<cfset System = CreateObject("java", "java.lang.System")>
<cfset testinstance.start = System.nanoTime()>
<cfloop from="1" to="#loops#" index="x"><cfinvoke component="tests.test" method="myMethod"
	returnvariable="test1">
<cfinvoke component="tests.test" method="myMethod2"
	returnvariable="test2"></cfloop>
<cfset testinstance.end = System.nanoTime()>
<cfset testinstance.total = testinstance.end - testinstance.start>	
