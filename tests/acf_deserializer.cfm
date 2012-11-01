<cfset myData=DeSerializeJSON(arguments.data)>
	
	<cfset retData = QueryNew(ArrayToList(MyData.columns))>
	<!--- need to convert this back to a query! --->
	
		<cfscript>
			for(d in myData.Data){
				QueryAddRow(retData);
				
				QuerySetCell(retData, "TEST", d[1]);
				QuerySetCell(retData, "INSTANCE", d[2]);
				QuerySetCell(retData, "NAME", d[3]);
				QuerySetCell(retData, "RESULT", d[4]);
			}
			
			
		</cfscript>
