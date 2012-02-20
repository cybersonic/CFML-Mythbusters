<cfparam name="url.test">
<cfparam name="url.names" default="a,b">
<cfset stResults = {}>	

<!--- generic values the tests can use --->
<cfset variables.a = 25>
	
<!---
<cfif !fileExists("/tests/#url.test#/results.serialized")>
	--->
<cfloop list="#url.names#" index="n">
	<cfset stResults[n] = {}>
	<cfset stResults[n].start = getTickCount()>
	<cfloop from="1" to="10000" index="x">
			<cfinclude template="/tests/#url.test#/#n#.cfm">
	</cfloop>
	<cfset stResults[n].end = getTickCount()>	
	<cfset stResults[n].total = stResults[n].end - stResults[n].start>	
</cfloop>	
<!---
	<cfset FileWrite("/tests/#url.test#/results.serialized", serialize(stResults))>
<cfelse>
	<cfset stResults = Evaluate(FileRead("/tests/#url.test#/results.serialized"))>
</cfif>
--->

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