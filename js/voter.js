var results = [];
var tests = [];

function setVerdict(testid, verdict){
	results[testid-1] = verdict;
	renderResults();
			
			
	setOthersLighter(testid, verdict)
		
}
		
		
function setOthersLighter(testid, verdict){
		var aItems = "confirmed,plausable,busted".split(",");

		for(item in aItems){
				var el=	document.getElementById(aItems[item] + "_" + testid);
			if(aItems[item] != verdict){
				el.setAttribute("class", "verdictUnselected")
			}
			else {
				el.setAttribute("class", "verdictSelected")
			}
		}
			
}
		
function setTest(testid, testname){
	tests[testid-1] = testname;
}
		
//Actually displays the results 
function renderResults(){
	var tableContents = document.getElementById('resultTable');
	clearTable(tableContents);
	var resultOut = "<tr>";
			
	for(var i = 0; i < results.length; i++){
		resultOut += "<td>" + tests[i] + "</td><td>" + results[i] + "</td>";
		resultOut += "</tr><tr>";
	}
	resultOut += "</tr>";
	tableContents.innerHTML = resultOut;
}
		
function clearTable(tableContents){
	tableContents.innerHTML = "";
}
