﻿<!---
*************************************************************************************************
* Name: gsfn.cfc																				*
* This is using Mark Mandel's JavaLoader for connectivity between the FASTPASS package and CF	*
* Grandville Ricks, 2011.																		*
* e: guru@geezimgood.com | w: geezimgood.com													*
*************************************************************************************************
--->

<cfcomponent>

	<cffunction name="authenticateUser"
				returntype="any"
				access="public">
		<cfargument name="key" type="string" required="true" />
		<cfargument name="secret" type="string" required="true" />
		<cfargument name="email" type="string" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="uid" type="string" required="true" />
			<cfset myUser = JavaCast("string", "#arguments.uid#")>

			<cfset var local.userid = #myUser#>
			<cfscript>
			paths = arrayNew(1);
			
			// We'll use this for our source code (this is non-compiled Java)
			srcpaths = [ expandPath("java/com/gsfn") ];
			
			// jar and class files.
			paths[1] = expandPath("java/commons-codec-1.3.jar");
			paths[2] = expandPath("java/commons-lang-2.4.jar");
			paths[3] = expandPath("java/fastpass.jar");
			paths[4] = expandPath("java/oauth-core.jar");
			paths[5] = expandPath("java/com/gsfn/FastPass.class");

			// I'm using JavaLoader
			loader = createObject("component", "javaloader.JavaLoader").init(loadPaths=paths,sourceDirectories=srcpaths);
			
			// create a FASTPASS based on oAuth Authentication.
			FastPass = loader.create("FastPass");
			
			getAuth = FastPass.script(
			"#arguments.key#"
			,"#arguments.secret#"
			,"#arguments.email#"
			,"#arguments.name#"
			,"#local.userid#"

			);
			</cfscript>	
			
			<cfreturn getAuth />
				
	</cffunction>
	

</cfcomponent>