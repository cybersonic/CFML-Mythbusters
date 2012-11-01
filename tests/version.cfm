<cfif StructKeyExists(SERVER, "railo")>
	<cfoutput>#SERVER.railo.version#</cfoutput>
<cfelse>
	<cfoutput>#SERVER.coldfusion.productversion#</cfoutput>
</cfif>
