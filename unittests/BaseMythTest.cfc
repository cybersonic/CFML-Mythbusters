component output="false" extends="mxunit.framework.TestCase" {
private function loadResults(name){
		var res = FileRead(expandPath("/results/#name#.results"));
		return Evaluate(res);
	}

	private function getFastestFor(item, data){
		var firstTime = true;
		var fastest = 0;
		for(r in data){
			if(r.name EQ item){
				if(firstTime){
					fastest = r.result;
					firstTime = false;
				}
				if(r.result LT fastest){
					fastest = r.result;
				}
			}
		}
		return fastest;
	}
}