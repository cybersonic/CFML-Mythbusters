<cfsilent>
	<cfloop from="1" to="10" index="j">
		<cfloop from="1" to="#iCount#" index="i">
			<cfset b = variables.a>
		</cfloop>
		<cfflush>
	</cfloop>
</cfsilent>
