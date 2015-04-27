<!---
	*********************************************************************************************************
	* This is an example page showing connectivity between GetSatisfaction's FASTPASS and ColdFusion.		*
	* I've written this because getSatisfaction does not provide any native support for CF:					*
	* http://getsatisfaction.com/developers/fastpass-implementation											*
	*																										*
	* Please see the video here from getSatisfaction.tv / getSatisfaction.com on							*
	* how their Single-Sign On Architecture with FASTPASS is setup:											*
	* http://getsatisfaction.tv/2009/11/single-sign-on-with-get-satisfaction-an-introduction-to-fastpass/	*
	*																										*
	* This uses JavaLoader to run the getSatisfaction java files.											*
	* 																										*
	* Grandville Ricks, 2011.																				*
	* e: guru@geezimgood.com | w: geezimgood.com															*
	********************************************************************************************************* 
--->

<cfoutput>

	<!--- Let's do a sample based on getSatisfaction's FastPass Creds.
	This is just a check to ensure that the FastPass authentication is working properly.
	Replace these credentials with your info:
	http://getsatisfaction.com/<YOUR_SITE>/admin/fastpasses
	 --->
	
	<cfscript>
	// We're using the GetSatisfaction.com FASTPASS. Let's connect to our CFC:
	oFastPass = CreateObject("component", "com/gsfn");
	
	/* One method: authenticateUser. All parameters are required. -
	key: Your secret key - provided by getsatisfaction.com
	secret: Your secret string - provided by getsatisfaction.com
	email: This can be your user's email address
	name: This should be your user's name (we use firstname + lastname in our system)
	uid: This should be your user's identification information.
	*/
	signMeIn = oFastPass.authenticateUser(
	key="YOUR_KEY_PROVIDED_BY_GETSATISFACTION"
	,secret="YOUR_SECRET_TOKEN_PROVIDED_BY_GETSATISFACTION"
	,email="YOUR_SITE_USER"
	,name="YOUR_SITE_USER_FIRSTNAME  YOUR_SITE_USER_LASTNAME"
	,uid="YOUR_SITE_USER_ID"
	);
	</cfscript>
	
	#signMeIn#
</cfoutput>

<!--- If all goes well, cookies should be set and you should be able to access the
		getSatisfaction.com community. 
		
		<cflocation url="http://www.getsatisfaction.com/<YOUR_COMMUNITY_NAME>" addtoken="false" />
		--->

Done. View Source and watch the Tokens Change. Typically you would place a redirect here to go to your
getsatisfaction.com community.