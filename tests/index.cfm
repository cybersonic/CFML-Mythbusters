<cfparam name="url.test">
<cfparam name="url.names" default="a,b">
<cfparam name="FORM.susi" default="hello">
<cfparam name="url.loops" default="10000">
<cfset loops = url.loops>
<!--- variables used in the tests --->
<cfset variables.a = 25>
<cfset b = "susi">
<cfset oObj = createObject("component", "test")>
<cfset iCount =  100>
<cfset sLst = "">
<cfset aList = []>
<!--- create the tests if they are not rednered --->


<cfset loop_template = FileRead(expandPath("loop_template.cfm"))>
<cfif SERVER.ColdFusion.ProductName EQ "ColdFusion Server">
	<cfif ListFirst(SERVER.ColdFusion.ProductVersion) EQ 10>
		<cfset loop_template = FileRead(expandPath("tests/loop_template10.cfm"))>	
	<cfelse>		
		<cfset loop_template = FileRead(expandPath("tests/loop_template9.cfm"))>	
	</cfif>
	
</cfif>
<!--- Create the files for inclusion --->
<cfloop list="#url.names#" index="n">
	<cfif !FileExists("#url.test#_#n#_test.cfm")>
		<cfset testContent = FileRead(expandPath("#url.test#/#n#.cfm"))>
		<cfset test_with_loop = Replace(loop_template, "{test}", testContent)>
		<!--- now save it as name_test.cfm --->
		<cfset FileWrite(expandPath("rendered/#url.test#_#n#_test.cfm"), test_with_loop)>
	</cfif>
</cfloop>

<!--- make sure the output folder exists --->
<cfif !DirectoryExists(expandPath("results/"))>
	<cfset DirectoryCreate(expandPath("results/"))>
</cfif>
	
<cfset saveFile = expandPath("results/#url.test#.results")>

<cfif !FileExists(saveFile)>
<cfset testResult =  QueryNew("test,instance,name,result")>
<!--- Actually run it 10 times (so we get the fastest) --->
<cfloop from="1" to="10" index="c">

	<cfloop list="#url.names#" index="n">
		<cfset testinstance = {}>
		<!--
		<cfinclude template="rendered/#url.test#_#n#_test.cfm">
		-->
		<cfset queryAddRow(testResult)>
		<cfset querySetCell(testResult, "test", url.test)>
		<cfset querySetCell(testResult, "instance", c)>
		<cfset querySetCell(testResult, "name", n)>
		<cfset querySetCell(testResult, "result", testinstance.total)>
	</cfloop>
</cfloop>
<cfset FileWrite(saveFile, SerializeJSON(testResult))>
<cfelse>
	<cfset testResult = DESerializeJSON(FileRead(saveFile))>
</cfif>
<cfif isStruct(testResult)>
	<cfset testResult = convertToQuery(testResult)>
</cfif>

<cfchart chartwidth="700" chartheight="500" format="png">
	<cfchartseries type="bar" >
		<cfloop list="#url.names#" index="r">
			<cfchartdata item="#r#" value="#getFastest(testResult, r)#">			
		</cfloop>
	</cfchartseries>
</cfchart>	

<cfset total = 0>
<cfloop list="#url.names#" index="r">
	<cfset total += getFastest(testResult, r)>
</cfloop>

<br>
<cfloop list="#url.names#" index="r">
	<cfset pct = (100/total) * getFastest(testResult, r)>
<cfoutput>#r# = #NumberFormat(pct, "99,999")#%	</cfoutput>
</cfloop>

<cfchart chartwidth="700" chartheight="500" format="png">
	<cfloop list="#url.names#" index="r">
	<cfset rangeQuery = getRangeResults(testResult,r)>
	<cfchartseries type="bar" query="rangeQuery" itemcolumn="instance" valuecolumn="result" serieslabel="#r#"></cfchartseries>
	</cfloop>
</cfchart>


<cffunction name="getFastest">
	<cfargument name="results">
	<cfargument name="name">

	<cfquery name="local.fastest" dbtype="query">
		SELECT MIN(result) AS minresult FROM arguments.results
		WHERE name=<cfqueryparam cfsqltype="varchar" value="#arguments.name#">
	</cfquery>
	
	<cfreturn fastest.minresult>
</cffunction>

<cffunction name="getRangeResults">
	<cfargument name="results">
	<cfargument name="name">
	<cfquery name="local.range" dbtype="query">
		SELECT * FROM arguments.results
		 WHERE name= <cfqueryparam cfsqltype="varchar" value="#arguments.name#">
	</cfquery>
	<cfreturn range>
</cffunction>

<cfscript>
	function convertToQuery(myStruct){
		var mQ = QueryNew(ArrayToList(myStruct.columns));		
		for(var r in myStruct.data){
			QueryAddRow(mQ);
			QuerySetCell(mQ, "test", r[1]);
			QuerySetCell(mQ, "instance", r[2]);
			QuerySetCell(mQ, "name", r[3]);
			QuerySetCell(mQ, "result", r[4]);
		}
		return mQ;
	}
	
</cfscript>



