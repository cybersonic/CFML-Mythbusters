<!DOCTYPE html>
<cfset showCF9 = false>
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
      src='/js/slides.js'></script>
  </head>
  
  

  <body style='display: none'>
	<style>
	    /* Your individual styles here, or just use inline styles if that’s
	       what you want. */

		.slides.template-default article.biglogo  {
		  background: white url(/images/railo-logo-orange.png) 50% 50% no-repeat !important;
		}
		.slides.template-default > article:not(.nobackground):not(.biglogo) {
		  background: url(/images/railo-logo-small.png) 0px 590px no-repeat !important;  
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
          10 Coding Myths, Busted!
        </h1>
        <p>
          Mark Drew
          <br>
          2012
        </p>
      </article>
      
      <article>
       	<img src="/presentation/my_name.png">
      </article>

      <article>
        <h3>CFML Myths!</h3>
        <p>
          <img class='centered' style='height: 400px' src="/presentation/muppetmythbusters.jpg">
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
          <img class='centered' style='width: 800px' src="/presentation/monkey2001.jpg">
        </p>
		    <p>
			   <ul>
    				<li>Run the same code a bunch of times and save it to the db! </li>
    				<li>Wind, time of day, what you had for lunch, are all factors. </li>
    				<li>Eliminate them as much as possible.</li>	
    			</ul>
    		</p>
      </article>

	<article>
      <h3> Caveat Emptor </h3>
      <p>
			   <ul>
				  <li><abbr title="Your Milage May Vary">YMMV</abbr> (different configurations) 
          <li>Tried to use trusted cache so all templates are pre-compiled
          <li>Already compiled in Railo as a .ra so compilation is out of the question
          <li>I obviously work for a <a href="http://www.getrailo.com" title="Railo!">certain company</a>
          <li>Not a comparison of Railo Vs <abbr title="Adobe's ColdFusion">ACF</a> but testing each myth against each engine
			 </ul>
		  </p>
  </article>


<!--- myth 1 --->

    <article>
        <h3>Myth 1</h3>
        <q>
         CFScript is always faster! Even when using it for loops!
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

	<article>
        <h3>Results -  Railo</h3>
        <iframe src='http://mythbusters.local/tests/index.cfm?test=script_1&names=a,b'></iframe>
    </article>
	
	<cfif showCF9>
	<article>
        <h3>Results ColdFusion 9</h3>
        <iframe src='http://localhost:8500/mythbusters/index.cfm?test=script_1&names=a,b'></iframe>
    </article>
	</cfif>



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
        <iframe src='http://mythbusters.local/tests/index.cfm?test=loops&names=a,b,c'></iframe>
    </article>

	<cfif showCF9>
	<article>
        <h3>Results ColdFusion 9</h3>
        <iframe src='http://localhost:8500/mythbusters/index.cfm?test=loops&names=a,b,c'></iframe>
    </article>
	</cfif>
	


	<article>
        <h3>Verdict</h3>
         <img  class='centered' style='width: 800px' src="/presentation/busted.jpg">
    </article>


	<!--- myth 2--->
	    <article>
	        <h3>Myth 2</h3>
	        <q>
	        	Inline IF's are much better than CFIF. I will stake my stake on it
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
	        <iframe src='http://mythbusters.local/tests/index.cfm?test=inline_if&names=a,b'></iframe>
	    </article>

	  	<article>
	        <h3>Verdict</h3>
	         <img  class='centered' style='width: 800px' src="/presentation/plausable.jpg">
			<p>Such little difference in it, that we really can't decide</p>
	    </article>
	
	
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
		    </article>

			<article>
		        <h3>Results</h3>
		        <iframe src='http://mythbusters.local/tests/index.cfm?test=isdefined&names=a,b'></iframe>
		    </article>

		  	<article>
		        <h3>Verdict</h3>
		         <img  class='centered' style='width: 800px' src="/presentation/plausable.jpg">
				<p>Such little difference in it, that we really can't decide</p>
		    </article>
	
	
	
	


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

  </body>
</html>
