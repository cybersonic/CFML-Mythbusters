<cfparam name="CALLER.showCF10" default="true">
<cfparam name="CALLER.showCF9" default="false">
<cfparam name="CALLER.showRailo" default="false">
<cfparam name="attributes.test" default="">
<cfparam name="attributes.reload" default="false">
	
<cfoutput>	
<cfif CALLER.showRailo>
	<article>
        <h3>Results - Railo</h3>
        <iframe src='#CALLER.RAILOURL#index.cfm?test=#attributes.test#&reload=#reload#'></iframe>
    </article>
	
</cfif>

<cfif CALLER.showCF10>
	<article>
        <h3>Results - ColdFusion 10</h3>
        <iframe src='#CALLER.CF10URL#index.cfm?test=#attributes.test#&reload=#reload#'></iframe>
    </article>
</cfif>

<cfif CALLER.showCF9>
	<article>
        <h3>Results - ColdFusion 9</h3>
        <iframe src='#CALLER.CF9URL#index.cfm?test=#attributes.test#&reload=#reload#'></iframe>
    </article>
</cfif>
</cfoutput>

