<!DOCTYPE html>
<cfset showCF9 = false>
<cfset showCF10 = true>
<cfset CF9URL = "http://localhost:8500/tests/">
<cfset CF10URL = "http://acfmythbusters.local/tests/">
<cfparam name="URL.reload" default="false">
<cfset reload = "&amp;reload=#url.reload#">
	
<!--
  Google HTML5 slide template

  Authors: Luke Mahé (code)
           Marcin Wichary (code and design)
           
           Dominic Mazzoni (browser compatibility)
           Charles Chen (ChromeVox support)

  URL: http://code.google.com/p/html5slides/
-->

<html>
  <head>
    <title>CFML Mythbusters</title>
    <meta charset='utf-8'>
    <script
      src='js/slides.js'></script>
  </head>
  
  

  <body style='display: none'>
	<style>
	    /* Your individual styles here, or just use inline styles if that’s
	       what you want. */

		.slides.template-default article.biglogo  {
		  background: white url(images/railo-logo-orange.png) 50% 50% no-repeat !important;
		}
		.slides.template-default > article:not(.nobackground):not(.biglogo) {
		  background: url(images/railo-logo-small.png) 0px 590px no-repeat !important;  
		  background-color: white !important;  
		}

	  </style>
	<!--- 
		layout-regular to layout-faux-widescreen or layout-widescreen.
	--->
	
    <section class='slides layout-widescreen template-default'>
      
      <article class='biglogo'>
      </article>

      <article>
        <h1>
          CFML Mythbusters
          <br>
          <q>10 Coding Myths
			<br>
			<small>Put to the test!</small>
		  </q>
        </h1>
        <p>
          Mark Drew
          <br>
          2012
        </p>
      </article>
      
      <article>
       	<img src="presentation/my_name.png">
      </article>

      <article>
        <h3>CFML Myths!</h3>
        <p>
          <img class='centered' style='height: 400px' src="presentation/muppetmythbusters.jpg">
        </p>
		<p>
			<ul>
				<li>Explore a number of myths with regards to coding in CFML</li>
				<li>Put them to the test, and rate them plausible, confirmed or <b>busted</b>	</li>			
			</ul>
		</p>
      </article>
	<article>
        <h3>Source of the myths...</h3>
        <p>
			<ul>
				<li>"Water cooler" (read: Pub) Discussions</li>
				<li>Mailing Lists</li>
				<li>You! Let me know if there is something we can test!</li>

			</ul>
		</p>
      </article>
	<article>
        <h3>The Process</h3>
        <p>
          <img class='centered' style='width: 600px' src="presentation/monkey2001.jpg">
        </p>
		    <p>
			   <ul>
    				<li>Run the same code a bunch of times and time it! </li>
    				<li>Wind, time of day, what you had for lunch, are all factors. </li>
    				<li>Eliminate them as much as possible.</li>	
					<li>Take the best result from 10 tests of the code.</li>	
    			</ul>
    		</p>

      </article>

	<article>
        <h3>The Process 2</h3>
    	<ol>
			<li>Test each bit of code by looping 10000</li>
			<li>Run each test 10 times</li>		
			<li>Select the fastest result out of the 10 (Best Case)</li>		
			<li>Cache the result using <code>SerializeJSON()</code> (so not to bore you)</li>		
			<li>Some tests don't run 10000 times, as it wouldn't make sense. Some might run more or less.</li>					

		</ol>   
    </article>


	<article>
      <h3> Caveat Emptor - "Let the buyer beware."</h3>
  		<p>
	
			   <ul>
				  <li><abbr title="Your Milage May Vary">YMMV</abbr> (different configurations) 
        
          		<li>I obviously work for a <a href="http://www.getrailo.com" title="Railo!">Railo Technologies</a> but I want to play fair. </li>
				<li>Not a comparison of Railo Vs <abbr title="Adobe's ColdFusion">ACF</a> but testing each myth against each engine</li>
				<li>
				
				<cfif StructKeyExists(SERVER, "RAILO")>
				Running on Railo <code><cfoutput>#SERVER.RAILO.VERSION#</cfoutput></code>
				<cfelse>
				Running on ColdFusion <code><cfoutput>#SERVER.COLDFUSION.productversion#</cfoutput></code>								
				</cfif>
			</li>
				<li>Micro loops are not the best thing to test.</li>
			 </ul>

		  </p>
  </article>


<!--- myth 1 --->

    <article>
        <h3>Myth 1</h3>
        <q>
         CFScript is always faster! Even when using it for loops! Relatively!!!
        </q>
        <div class='author'>
         Alfred Einstein
        </div>
    </article>
    <article>
        <h3>Code</h3>
          <section><cf_show template="script_1/a.cfm"></section>
		  Vs.
          <section><cf_show template="script_1/b.cfm"></section>
    </article>

	<cf_results test="script_1&names=a,b" reload="#reload#">

    <article>
        <h3>Code</h3>
          <section><cf_show template="loops/a.cfm"></section>
		  <p>Vs.</p>
          <section><cf_show template="loops/b.cfm"></section>
		  <p>Vs.</p>
          <section><cf_show template="loops/c.cfm"></section>
    </article>

	<cf_results test="loops&names=a,b,c" reload="#reload#">
	

	<cf_verdict result="busted" message="CFSCript isn't much faster, there are some TAG functions that are even faster!">



	<!--- myth 2--->
	    <article>
	        <h3>Myth 2</h3>
	        <q>
	        	Inline IF's are much better than CFIF. I will stake my stake on it!
	        </q>
	        <div class='author'>
	        Abraham Van Helsing
	        </div>
	    </article>

	    <article>
	        <h3>Code</h3>
	          <section><cf_show template="inline_if/a.cfm"></section>
			  Vs.
	          <section><cf_show template="inline_if/b.cfm"></section>
			  Vs.
	          <section><cf_show template="inline_if/c.cfm"></section>
	    </article>

		<cf_results test="inline_if&names=a,b,c" reload="#reload#">
	  	<cf_verdict result="plausable" message="Such little difference in it, that we really can't decide">
	
		<!--- myth 3 --->
		    <article>
		        <h3>Myth 3</h3>
		        <q>
		        	isDefined() is bad! Naughty isDefined! Stop chewing the furniture!
		        </q>
		        <div class='author'>
		        	Grandpa (Abe) Simpson
		        </div>
		    </article>

		    <article>
		        <h3>Code</h3>
		          <section><cf_show template="isdefined/a.cfm"></section>
				  Vs.
		          <section><cf_show template="isdefined/b.cfm"></section>
				 Vs.
		          <section><cf_show template="isdefined/c.cfm"></section>
		    </article>

			<cf_results test="isdefined&names=a,b,c&loops=100000" reload="#reload#">
	
			<article>
		        <h3>Code</h3>
		          <section><cf_show template="isdefined_2/a.cfm"></section>
				  Vs.
		          <section><cf_show template="isdefined_2/b.cfm"></section>
				 Vs.
		          <section><cf_show template="isdefined_2/c.cfm"></section>
		    </article>
			
			<cf_results test="isdefined_2&names=a,b,c&loops=100000" reload="#reload#">
			<cf_verdict result="plausable" message="Such little difference in it, that we really can't decide">
	
	
	<!--- myth 4 --->
	    <article>
	        <h3>Myth 4</h3>
	        <q>&lt;cfloop&gt;
	        	&lt;cfoutput&gt;
				<br>#Item#<br>
				&lt;/cfoutput&gt;
				&lt;/cfloop&gt;
				<br> is the only way to go!
	        </q>
	        <div class='author'>
	        Mohandas Gandhi
	        </div>
	    </article>

	    <article>
	        <h3>Code</h3>
	          <section><cf_show template="output/a.cfm"></section>
			  Vs.
	          <section><cf_show template="output/b.cfm"></section>
	    </article>

		<cf_results test="output&names=a,b&loops=100" reload="#reload#">
		<cf_verdict result="busted" message="Obviously outputting within a loop is much faster, than creating multiple instances of cfoutput">
	
		<!--- myth 5 --->
    <article>
        <h3>Myth 5</h3>
        <q>
        	Don't CreateObject! Use Duplicate! It's much faster!!
        </q>
        <div class='author'>
        Angelina Jolie
        </div>
    </article>
	<article class="fill">
		<h3>
			Time to get some "Hackers" onto it
		</h3>
		<img  class='centered' style='width: 800px' src="presentation/aj_hacker.jpg">
 		<div class='source white'>
			Presentation improved by 100% with Angelina Jolie
		</div>
	</article>
    <article>
        <h3>Code</h3>
          <section><cf_show template="duplicate/a.cfm"></section>
		  Vs.
          <section><cf_show template="duplicate/b.cfm"></section>
    </article>
	 <article>
	          <section><cf_show template="test.cfc"></section>
			  <section><cf_show template="super.cfc"></section>
			  <section><cf_show template="supersuper.cfc"></section>
	    </article>

		<cf_results test="duplicate&names=a,b" reload="#reload#">
		<cf_verdict result="confirmed" message='You can get a major boost by duplicating objects, even if they extend other objects'>
	
			<cf_verdictvoter id="5" test="Use Duplicate() instead of CreateObject()">	
	
	
	<!--- myth 6 --->
    <article class='fill'>
        <h3>Myth 6</h3>
        <q class="white">
        	SILENCE is golden, it beats a comment, bear this in mind young Adso
        </q>
        <div class='author white'>
			William of Baskerville 
        </div>
		<img  class='centered' style='width: 800px' src="presentation/baskerville.jpg">
    </article>

    <article>
        <h3>Code - I</h3>
          <section><cf_show template="silence/a.cfm"></section>
		  Vs.
          <section><cf_show template="silence/b.cfm"></section>
    </article>

	<article>
	    <h3>Code - II</h3>
       			<section><cf_show template="silence/c.cfm"></section>
				  Vs.
	         <section><cf_show template="silence/d.cfm"></section>
	</article>
		
	
		<cf_results test="silence&names=a,b,c&loops=100&RequestTimeout=300" reload="#reload#">
		<cf_verdict result="busted" message='Not much difference between using different trimming methodologies'>
	
	
	<!--- myth 7--->
    <article>
        <h3>Myth 7</h3>
        <q>
        	Evaluate is good! You should use it all the time! Gotta have me some Evaluate!
        </q>
        <div class='author'>
			Tyra Banks - America's Next Top Developer
        </div>
    </article>
	<article>
		<h3>Code</h3>
	    <section><cf_show template="evaluate/a.cfm"></section>
		Vs.
	    <section><cf_show template="evaluate/b.cfm"></section>
		Vs.
	    <section><cf_show template="evaluate/c.cfm"></section>
	</article>
	
	
	<cf_results test="evaluate&names=a,b,c" reload="#reload#">
	<cf_verdict result="plausable" message='It is very slow in Railo, CF not so much'>

	  
	<!--- myth 8--->
    <article>
       <h3>Myth 8</h3>
	    <q>
		     	CFInvoke is the work of the DEVIL! Never use it!
		</q>
        <div class='author'>
			Cardinal Xim&eacute;nez
        </div>
	</article>
	<article class='fill'>
		<h3>You didn't expect them did you?</h3>
		<img  class='centered' style='width: 800px' src="presentation/spanishinquisition.jpg">
	</article>
	
	<article>
		<h3>Code</h3>
	    <section><cf_show template="invoke/a.cfm"></section>
		Vs.
	    <section><cf_show template="invoke/b.cfm"></section>
	    Vs.
	    <section><cf_show template="invoke/c.cfm"></section>
	</article>
	
	
	<cf_results test="invoke&names=a,b&loops=10000" reload="#reload#">
	<cf_verdict result="plausable" message='<strong>CFINVOKE</strong> creates new instances. No reason to use it with new syntax constructs like testObj["myMethod"]()'>
	
			<cf_verdictvoter id="8" test="Use CFINVOKE (or testObj['myMethod']()">	

	
	<!--- myth 9--->
    <article>
       <h3>Myth 9</h3>
	    <q>
		     All EQ are built Equal
		</q>
        <div class='author'>
			The Equalizer
        </div>
	</article>
	
	<article>
		<h3>Code</h3>
	    <section><cf_show template="compare/a.cfm"></section>
		Vs.
	    <section><cf_show template="compare/b.cfm"></section>
		Vs.
	    <section><cf_show template="compare/c.cfm"></section>
		Vs.
	    <section><cf_show template="compare/d.cfm"></section>

	</article>
	
	<cf_results test="compare&names=a,b&loops=10000" reload="#reload#">
	<cf_verdict result="plausable" message="<strong>EQ</strong> seems to work pretty well">

	<!--- myth 10--->
    <article>
       <h3>Myth 10</h3>
	    <q>
		     I like Lists, lists are fine, they are sexy and list like. Nothing wrong with Lists!
		</q>
        <div class='author'>
			A. Client
        </div>
	</article>
	
	<article>
		<h3>Code</h3>
	    <section><cf_show template="lists/a.cfm"></section>
		Vs.
	    <section><cf_show template="lists/b.cfm"></section>
		(Not forgetting!)
		<section><cfoutput>#HTMLCodeFormat("<cfset sList = ArrayToList(aList)>")#</cfoutput></section>
	    
	</article>
	
	<cf_results test="lists&names=a,b&loops=10000" reload="#reload#">
	<cf_verdict result="busted" message="Lists are very slow! Use arrays instead">
	
	<!--- myth 11--->
    <article>
       <h3>Myth 11</h3>
	    <q>
		    CFML is Dead!
		</q>
        <div class='author'>
			Joe "Uninformed" Public
        </div>
	</article>
    <article>
	    <q>
			<strong>CFML is NOT DEAD!</strong>
		</q>
			<ul>
				<li>WE are SUPPORTING it</li>
				<li>We are MARKETING it</li>
				<li>We are DEVELOPING it</li>
				<li>For the next 10 years and more</li>
			</ul>
				
	
        <div class='author'>
			Mark Drew
        </div>
	</article>
	 <article>
	   <h3>What the hosting companies say:</h3>
	   <br><br>
       <img style="width:800px" src="presentation/utdream.png">
	</article>
	<article>
	       <img style="width:800px" src="presentation/viviotech.png">
	</article>
	
	<article>
	       <img style="width:800px" src="presentation/hostek.png">
	</article>
	<article>
	       <img style="width:800px" src="presentation/hostmedia.png">
	</article>
	
    <article class='fill'>
		
		<h3>Some Download stats...</h3>
		<iframe src="http://www.getrailo.com/reports/dlstats.cfm"></iframe>
		<!--
		<img class='centered' style="width: 800px" src="presentation/railo_downloads.png">
		-->
	</article>	
	
	<cf_verdictvoter id="11" test="CFML is DEAD">
	

	<!--- Summary --->
	<article style="background-color:#0094c0 !important;">
		<h3>Summary</h3>
		<table class="mythbuster-table" boder="0" cellpadding=2 cellspacing=2>
			<thead>
				<tr class="innerdash">
				<th>Test</th>
				<th>
					Verdict
				</th>
			</tr>
			</thead>
			<tbody id="resultTable">
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
			</tbody>
		</table>
	</article>
	
	<article>
       <h3>Credits</h3>
		<ul>
			<li>Source code and presentation <a href="https://github.com/cybersonic/CFML-Mythbusters">https://github.com/cybersonic/CFML-Mythbusters</a></li>
			<li>Discovery Channel for the idea, and a great show</li>
			<li>Gert Franz and Michael Offner for help in  the testing of the tests (Test-ception!)</li>		
			<li>Slides by <a href="http://code.google.com/p/html5slides/">Google HTML5 Slides http://code.google.com/p/html5slides/</a></li>			
			<li>Fonts by <a href="http://www.google.com/webfonts">Google Fonts http://www.google.com/webfonts</a></li>			
		</ul>
	</article>

  </body>
</html>
