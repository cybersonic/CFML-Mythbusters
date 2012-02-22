<cfcomponent extends="super">
	<cfset superInit = init>
	<cffunction name="myMethod" access="public" output="no" returntype="boolean">
		<cfset init()>
		<cfreturn true>
	</cffunction>
	<cffunction name="myMethod2" access="public" output="no" returntype="boolean">
		<cfreturn false>
	</cffunction>
</cfcomponent>