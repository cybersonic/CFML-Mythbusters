component extends="unittests.BaseMythTest"{


	function testCFSCript(){
		var results = loadResults("railo/loops");
		var a = getFastestFor("a", results);
		var	b = getFastestFor("b", results);
		var	c = getFastestFor("c", results);
		
		AssertTrue(b GT a);
		AssertTrue(b GT c);
		AssertTrue(a GT c);
	}

	
}