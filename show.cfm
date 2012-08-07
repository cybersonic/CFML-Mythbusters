<cfscript>
	WriteOutput(HTMLCodeFormat(FileRead(expandPath("tests/#attributes.template#"))));
</cfscript>
