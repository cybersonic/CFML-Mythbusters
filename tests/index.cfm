<cfparam name="url.test">
<cfparam name="url.names" default="a,b">
<cfparam name="url.reload" default="false">
<cfparam name="FORM.susi" default="hello">
<cfset stResults = {}>	

<!--- generic values the tests can use --->
<cfset variables.a = 25>
<cfset b = "susi">
<cfset oObj = createObject("component", "test")>
<cfset iCount =  100>
		
<cfif Not fileExists("/tests/#url.test#/results.json") OR url.reload>		
<cfloop list="#url.names#" index="n">
	<cfset stResults[n] = {}>
	<cfsavecontent variable="item">
	<cfset stResults[n].start = getTickCount()>
	<cfloop from="1" to="10000" index="x">
			<cfinclude template="/tests/#url.test#/#n#.cfm">
	</cfloop>
	<cfset stResults[n].end = getTickCount()>	
	</cfsavecontent>

	<cfset stResults[n].total = stResults[n].end - stResults[n].start>	
</cfloop>	
	<cfset FileWrite("/tests/#url.test#/results.json", SerializeJSON(stResults))>
<cfelse>
	<cfset stResults = DeSerializeJSON(FileRead("/tests/#url.test#/results.json"))>
		
</cfif>	

<cfset total = 0>
<cfchart chartwidth="700" chartheight="500" >
	<cfchartseries type="bar" colorlist="">
		<cfloop list="#url.names#" index="r">
			<cfchartdata item="#r#" value="#stResults[r].total#">			
		</cfloop>
	</cfchartseries>
</cfchart>	
<cfloop list="#url.names#" index="r">
		<cfset total += stResults[r].total>
</cfloop>
	
<!--- draw percentages --->	
<br>
<cfloop list="#url.names#" index="r">
	<cfset pct = (100/total) * stResults[r].total>
<cfoutput>#r# = #NumberFormat(pct, "99,999")#%	</cfoutput>
</cfloop>