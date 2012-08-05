<!DOCTYPE html>
<cfset showRailo = true>
<cfset showCF9 = false>
<cfset showCF10 = true>
<cfset CF9URL = "http://localhost:8080/cfusion9/mythbusters/tests/">
<cfset CF10URL = "http://localhost:8080/cfusion10/mythbusters/tests/">
<cfset RAILOURL = "http://localhost:8080/railo4/mythbusters/tests/">
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
	
    <section class='slides layout-faux-widescreen template-default'>
      
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
			<li>Cache the result using <code>Serialize()</code> (so not to bore you)</li>		
			<li>Some tests don't run 10000 times, as it wouldn't make sense.</li>					

		</ol>   
    </article>


	<article>
      <h3> Caveat Emptor - "Let the buyer beware."</h3>
  		<p>
	
			   <ul>
				  <li><abbr title="Your Milage May Vary">YMMV</abbr> (different configurations) 
          <li>Tried to use trusted cache so all templates are pre-compiled
          <li>Already compiled in Railo as a .ra so compilation is out of the question
          <li>I obviously work for a <a href="http://www.getrailo.com" title="Railo!">certain company</a>
			<li>Running on Railo <code><cfoutput>#SERVER.RAILO.VERSION#</cfoutput></code></li>
<!---
          <li>Not a comparison of Railo Vs <abbr title="Adobe's ColdFusion">ACF</a> but testing each myth against each engine</li>
--->
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

	<article>
        <h3>Results - Railo</h3>
        <iframe src='/tests/index.cfm?test=loops&names=a,b,c<cfoutput>#reload#</cfoutput>'></iframe>
    </article>

	<cfif showCF10>
	<article>
        <h3>Results -  CF10</h3>
        <iframe src='<cfoutput>#CF10URL#</cfoutput>index.cfm?test=loops&names=a,b<cfoutput>#reload#</cfoutput>'></iframe>
    </article>
	</cfif>
	

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
	    </article>

		<article>
	        <h3>Results</h3>
	        <iframe src='http://mythbusters.local/tests/index.cfm?test=inline_if&names=a,b<cfoutput>#reload#</cfoutput>'></iframe>
	    </article>

		<cfif showCF10>
		<article>
        	<h3>Results -  CF10</h3>
        	<iframe src='<cfoutput>#CF10URL#</cfoutput>index.cfm?test=inline_if&names=a,b<cfoutput>#reload#</cfoutput>'></iframe>
    	</article>
		</cfif>
	

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

			<article>
		        <h3>Results</h3>
		        <iframe src='http://mythbusters.local/tests/index.cfm?loops=100000&test=isdefined&names=a,b,c<cfoutput>#reload#</cfoutput>'></iframe>
		    </article>
			<cfif showCF10>
			<article>
	        	<h3>Results -  CF10</h3>
	        	<iframe src='<cfoutput>#CF10URL#</cfoutput>index.cfm?loops=100000&test=isdefined&names=a,b,c<cfoutput>#reload#</cfoutput>'></iframe>
	    	</article>
			</cfif>		  
			
			<article>
		        <h3>Code</h3>
		          <section><cf_show template="isdefined_2/a.cfm"></section>
				  Vs.
		          <section><cf_show template="isdefined_2/b.cfm"></section>
				 Vs.
		          <section><cf_show template="isdefined_2/c.cfm"></section>
		    </article>
			
			  
			<article>
		        <h3>Results</h3>
		        <iframe src='http://mythbusters.local/tests/index.cfm?loops=100000&test=isdefined_2&names=a,b,c<cfoutput>#reload#</cfoutput>'></iframe>
		    </article>
			<cfif showCF10>
			<article>
	        	<h3>Results -  CF10</h3>
	        	<iframe src='<cfoutput>#CF10URL#</cfoutput>index.cfm?loops=10000&test=isdefined_2&names=a,b,c<cfoutput>#reload#</cfoutput>'></iframe>
	    	</article>
			</cfif>
			
			
		<cf_verdict result="plausable" message="Such little difference in it, that we really can't decide">
	
	
	<!--- myth 4 --->
	    <article>
	        <h3>Myth 4</h3>
	        <q>
	        	&lt;cfoutput&gt;
				<br>#Item#<br>
				&lt;/cfoutput&gt;
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

		<article>
	        <h3>Results</h3>
	        <iframe src='http://mythbusters.local/tests/index.cfm?loops=100&test=output&amp;names=a,b<cfoutput>#reload#</cfoutput>'></iframe>
	    </article>
		<cfif showCF10>
			<article>
	        	<h3>Results -  CF10</h3>
	        	<iframe src='<cfoutput>#CF10URL#</cfoutput>index.cfm?loops=100&test=output&names=a,b<cfoutput>#reload#</cfoutput>'></iframe>
	    	</article>
			</cfif>		
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


	<article>
        <h3>Results</h3>
        <iframe src='http://mythbusters.local/tests/index.cfm?test=duplicate&amp;names=a,b<cfoutput>#reload#</cfoutput>'></iframe>
    </article>
	<cfif showCF10>
	<article>
       	<h3>Results -  CF10</h3>
       	<iframe src='<cfoutput>#CF10URL#</cfoutput>index.cfm?test=duplicate&loops=1000&names=a,b<cfoutput>#reload#</cfoutput>'></iframe>
   	</article>
	</cfif>		
	
	<cf_verdict result="confirmed" message='You can get a major boost by duplicating objects, even if they extend other objects'>
	
	
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
		
	

	<article>
        <h3>Results</h3>
        <iframe src='http://mythbusters.local/tests/index.cfm?loops=100&test=silence&amp;names=a,b,c,d&amp;RequestTimeout=300<cfoutput>#reload#</cfoutput>'></iframe>
    </article>
	
	<cfif showCF10>
	<article>
       	<h3>Results -  CF10</h3>
       	<iframe src='<cfoutput>#CF10URL#</cfoutput>index.cfm?loops=100&test=silence&names=a,b,c,d<cfoutput>#reload#</cfoutput>'></iframe>
   	</article>
	</cfif>		
	
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
	<article>
       	<h3>Results</h3>
	    <iframe src='/tests/index.cfm?test=evaluate&amp;names=a,b,c<cfoutput>#reload#</cfoutput>'></iframe>
	  </article>
	  
	<cfif showCF10>
	<article>
       	<h3>Results -  CF10</h3>
       	<iframe src='<cfoutput>#CF10URL#</cfoutput>index.cfm?test=evaluate&names=a,b,c<cfoutput>#reload#</cfoutput>'></iframe>
   	</article>
	</cfif>
	
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
	<article>
       	<h3>Results</h3>
	    <iframe src='/tests/index.cfm?loops=10000&test=invoke&amp;names=a,b,c<cfoutput>#reload#</cfoutput>'></iframe>
	</article>	
	<cfif showCF10>
	<article>
       	<h3>Results -  CF10</h3>
       	<iframe src='<cfoutput>#CF10URL#</cfoutput>index.cfm??loops=10000&test=invoke&names=a,b<cfoutput>#reload#</cfoutput>'></iframe>
   	</article>
	</cfif>
	<cf_verdict result="plausable" message='<strong>CFINVOKE</strong> creates new instances. No reason to use it with new syntax constructs like testObj["myMethod"]()'>
	
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
	</article>
	<article>
       	<h3>Results</h3>
	    <iframe src='/tests/index.cfm?test=compare&amp;names=a,b<cfoutput>#reload#</cfoutput>'></iframe>
	</article>	
	<article>
       	<h3>Results -  CF10</h3>
       	<iframe src='<cfoutput>#CF10URL#</cfoutput>index.cfm?test=compare&names=a,b<cfoutput>#reload#</cfoutput>'></iframe>
   	</article>
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
	<article>
       	<h3>Results</h3>
	    <iframe src='/tests/index.cfm?loops=1000&test=lists&amp;names=a,b<cfoutput>#reload#</cfoutput>'></iframe>
	</article>	
	<article>
       	<h3>Results -  CF10</h3>
       	<iframe src='<cfoutput>#CF10URL#</cfoutput>index.cfm?loops=1000&test=lists&names=a,b<cfoutput>#reload#</cfoutput>'></iframe>
   	</article>
	
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
		<img class='centered' style='width: 800px' src="presentation/railo_downloads.png">
		-->
	</article>	
	
	<cf_verdict result="busted" message="More people are using it, downloads growing, new versions all round">
	
	<!---
	<article>
       <h3>Competition: Win a copy of Railo 3: Beginner's Guide</h3>
		<img class='centered' style='height: 300px' src="presentation/railobook.jpg">
		<ul class="build">
			<li>Go to <a href="http://bit.ly/RailoBook">http://bit.ly/RailoBook</a></li>
			<li>Read the description of the book</li>
			<li>Email what the title of Chapter 7 is to <a href="mailto:contact@getrailo.com">contact@getrailo.com</a></li>		
			<li>Draw on the 30th of March</li>		
		</ul>
	</article>
	--->
	
	<article>
       <h3>Credits</h3>
		<ul>
			<li>Source code and presentation <a href="https://github.com/cybersonic/CFML-Mythbusters">https://github.com/cybersonic/CFML-Mythbusters</a></li>
			<li>Discovery Channel for the idea, and a great show</li>
			<li>Gert Franz for help in testing and the tests themselves</li>		
			<li>Christian Ready for getting me here! Oh, and Hubble. It's awesome.</li>		
			<li>Slides by <a href="http://code.google.com/p/html5slides/">HTML5 Slides http://code.google.com/p/html5slides/</a></li>			
		</ul>
	</article>
	<!---


      <article class='smaller'>
        <h3>
          Simple slide with header and text (small font)
        </h3>
        <p>
          This is a slide with just text. This is a slide with just text.
          This is a slide with just text. This is a slide with just text.
          This is a slide with just text. This is a slide with just text.
        </p>
        <p>
          There is more text just underneath with a <code>code sample: 5px</code>.
        </p>
      </article>

      <article>
        <h3>
          Slide with bullet points and a longer title, just because we
          can make it longer
        </h3>
        <ul>
          <li>
            Use this template to create your presentation
          </li>
          <li>
            Use the provided color palette, box and arrow graphics, and
            chart styles
          </li>
          <li>
            Instructions are provided to assist you in using this
            presentation template effectively
          </li>
          <li>
            At all times strive to maintain Google's corporate look and feel
          </li>
        </ul>
      </article>

      <article>
        <h3>
          Slide with bullet points that builds
        </h3>
        <ul class="build">
          <li>
            This is an example of a list
          </li>
          <li>
            The list items fade in
          </li>
          <li>
            Last one!
          </li>
        </ul>

        <div class="build">
          <p>Any element with child nodes can build.</p>
          <p>It doesn't have to be a list.</p>
        </div>
      </article>

      <article class='smaller'>
        <h3>
          Slide with bullet points (small font)
        </h3>
        <ul>
          <li>
            Use this template to create your presentation
          <li>
            Use the provided color palette, box and arrow graphics, and
            chart styles
          <li>
            Instructions are provided to assist you in using this
            presentation template effectively
          <li>
            At all times strive to maintain Google's corporate look and feel
        </ul>
      </article>

      <article>
        <h3>
          Slide with a table
        </h3>
        
        <table>
          <tr>
            <th>
              Name
            <th>
              Occupation
          <tr>
            <td>
              Luke Mahé
            <td>
              V.P. of Keepin’ It Real
          <tr>
            <td>
              Marcin Wichary
            <td>
              The Michael Bay of Doodles
        </table>
      </article>
      
      <article class='smaller'>
        <h3>
          Slide with a table (smaller text)
        </h3>
        
        <table>
          <tr>
            <th>
              Name
            <th>
              Occupation
          <tr>
            <td>
              Luke Mahé
            <td>
              V.P. of Keepin’ It Real
          <tr>
            <td>
              Marcin Wichary
            <td>
              The Michael Bay of Doodles
        </table>
      </article>
      
      <article>
        <h3>
          Styles
        </h3>
        <ul>
          <li>
            <span class='red'>class="red"</span>
          <li>
            <span class='blue'>class="blue"</span>
          <li>
            <span class='green'>class="green"</span>
          <li>
            <span class='yellow'>class="yellow"</span>
          <li>
            <span class='black'>class="black"</span>
          <li>
            <span class='white'>class="white"</span>
          <li>
            <b>bold</b> and <i>italic</i>
        </ul>
      </article>
      
      <article>
        <h2>
          Segue slide
        </h2>
      </article>

      <article>
        <h3>
          Slide with an image
        </h3>
        <p>
          <img style='height: 500px' src='images/example-graph.png'>
        </p>
        <div class='source'>
          Source: Sergey Brin
        </div>
      </article>

      <article>
        <h3>
          Slide with an image (centered)
        </h3>
        <p>
          <img class='centered' style='height: 500px' src='images/example-graph.png'>
        </p>
        <div class='source'>
          Source: Larry Page
        </div>
      </article>

      <article class='fill'>
        <h3>
          Image filling the slide (with optional header)
        </h3>
        <p>
          <img src='images/example-cat.jpg'>
        </p>
        <div class='source white'>
          Source: Eric Schmidt
        </div>
      </article>

      <article>
        <h3>
          This slide has some code
        </h3>
        <section>
        <pre>
&lt;script type='text/javascript'&gt;
  // Say hello world until the user starts questioning
  // the meaningfulness of their existence.
  function helloWorld(world) {
    for (var i = 42; --i &gt;= 0;) {
      alert('Hello ' + String(world));
    }
  }
&lt;/script&gt;
&lt;style&gt;
  p { color: pink }
  b { color: blue }
  u { color: 'umber' }
&lt;/style&gt;
</pre>
        </section>
      </article>
      
      <article class='smaller'>
        <h3>
          This slide has some code (small font)
        </h3>
        <section>
        <pre>
&lt;script type='text/javascript'&gt;
  // Say hello world until the user starts questioning
  // the meaningfulness of their existence.
  function helloWorld(world) {
    for (var i = 42; --i &gt;= 0;) {
      alert('Hello ' + String(world));
    }
  }
&lt;/script&gt;
&lt;style&gt;
  p { color: pink }
  b { color: blue }
  u { color: 'umber' }
&lt;/style&gt;
</pre>
        </section>
      </article>
      
      <article>
        <q>
          The best way to predict the future is to invent it.
        </q>
        <div class='author'>
          Alan Kay
        </div>
      </article>
      
      <article class='smaller'>
        <q>
          A distributed system is one in which the failure of a computer 
          you didn’t even know existed can render your own computer unusable.
        </q>
        <div class='author'>
          Leslie Lamport
        </div>
      </article>
      
      <article class='nobackground'>
        <h3>
          A slide with an embed + title
        </h3>
        
        <iframe src='http://www.google.com/doodle4google/history.html'></iframe>
      </article>

      <article class='nobackground'>
        <iframe src='http://www.google.com/doodle4google/history.html'></iframe>
      </article>

      <article class='fill'>
        <h3>
          Full-slide embed with (optional) slide title on top
        </h3>
        <iframe src='http://www.google.com/doodle4google/history.html'></iframe>
      </article>
      
      <article>
        <h3>
          Thank you!
        </h3>
        
        <ul>
          <li>
            <a href='http://www.google.com'>google.com</a>
        </ul>
      </article>

    </section>
	--->
  </body>
</html>
