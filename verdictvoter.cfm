<cfparam name="attributes.id" default="0">
<cfparam name="attributes.test" default="Forgot to name this test!">
<cfoutput>
    <article>
			
			<h1>#attributes.test#</h1
			<div class="icons">
				
				<script>
					setTest(#attributes.id#, "#attributes.test#");
				</script>
				
				<div class="icon" id="confirmed_#attributes.id#"><img src="presentation/confirmed.jpg" id="img_confirmed" onclick="setVerdict(#attributes.id#,'confirmed')"></div>
				<div class="icon" id="plausable_#attributes.id#"><img src="presentation/plausable.jpg" id="img_plausable" onclick="setVerdict(#attributes.id#,'plausable')"></div>
				<div class="icon" id="busted_#attributes.id#"><img src="presentation/busted.jpg" id="img_busted" onclick="setVerdict(#attributes.id#,'busted')"></div>
			</div>
    </article>
</cfoutput>