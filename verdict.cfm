<cfparam name="attributes.result">
<cfparam name="attributes.message" default="">
<cfif ThisTag.executionMode IS "start">
<cfoutput>
	<article>
		<h3>Verdict</h3>
	    <img  class='centered' style='width: 800px' src="presentation/#attributes.result#.jpg">
	    <cfif len(attributes.message)>
		    <p>#attributes.message#</p>
		</cfif>
	</article>
</cfoutput>
</cfif>