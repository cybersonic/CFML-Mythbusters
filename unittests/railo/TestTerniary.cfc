component extends="unittests.BaseMythTest"{


	function testCFSCript(){
		var results = loadResults("railo/inline_if");
		var a = getFastestFor("a", results);
		var	b = getFastestFor("b", results)
		
		AssertTrue(a GT b);
	}

	
}