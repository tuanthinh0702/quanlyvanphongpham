/*****************************************************************************************************
Created By: Ferdous Md. Jannatul, Sr. Software Engineer
Created On: 10 December 2005
Last Modified: 13 April 2006
******************************************************************************************************/
		//Generating Pop-up Print Preview page
		function getPrint(print_area)
		{	
			//Creating new page
			var pp = window.open();
			//Adding HTML opening tag with <HEAD> … </HEAD> portion 
			pp.document.writeln('<HTML><HEAD><title>Print Preview</title><LINK href="print/Styles.css"  type="text/css" rel="stylesheet">')
			pp.document.writeln('<LINK href="print/PrintStyle.css"  type="text/css" rel="stylesheet" media="print"><base target="_self"></HEAD>')
			//Adding Body Tag
			pp.document.writeln('<body MS_POSITIONING="GridLayout" bottomMargin="1pt" leftMargin="1.3pt" topMargin="0.75pt" rightMargin="0">');
			//Adding form Tag
			pp.document.writeln('<form  method="post">');
			//Writing print area of the calling page
			pp.document.writeln(document.getElementById("mainModule_ctl00_" + print_area).innerHTML);
						//Creating two buttons Print and Close within a table
			pp.document.writeln('<TABLE width=100%><TR><TD align=left><INPUT ID="PRINT" type="button" value="Print" onclick="javascript:location.reload(true);window.print();"><INPUT ID="CLOSE" type="button" value="Close" onclick="window.close();"></TD></TR></TABLE>');

			//Ending Tag of </form>, </body> and </HTML>
			pp.document.writeln('</form></body></HTML>');			
			
		}		
		