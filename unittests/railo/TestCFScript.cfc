component extends="unittests.BaseMythTest"{


	function testCFSCript(){
		var results = loadResults("railo/script_1");
		var a = getFastestFor("a", results);
		var	b = getFastestFor("b", results)
		
		AssertTrue(a GT b);
	}

	
}