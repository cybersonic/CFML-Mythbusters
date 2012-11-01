<cfset testinstance.start = getTickCount("nano")>
<cfloop from="1" to="#loops#" index="x"><cfinvoke component="tests.test" method="myMethod"
	returnvariable="test1">
<cfinvoke component="tests.test" method="myMethod2"
	returnvariable="test2"></cfloop>
<cfset testinstance.end = getTickCount("nano")>
<cfset testinstance.total = testinstance.end - testinstance.start>	
