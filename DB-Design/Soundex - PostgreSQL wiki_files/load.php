var isCompatible=function(){if(navigator.appVersion.indexOf('MSIE')!==-1&&parseFloat(navigator.appVersion.split('MSIE')[1])<6){return false;}return true;};var startUp=function(){mw.config=new mw.Map(true);mw.loader.addSource({"local":{"loadScript":"/load.php","apiScript":"/api.php"}});mw.loader.register([["site","1539894433",[],"site"],["noscript","1539894433",[],"noscript"],["startup","1553382354",[],"startup"],["user","1539894433",[],"user"],["user.groups","1539894433",[],"user"],["user.options","1553382354",[],"private"],["user.cssprefs","1553382354",["mediawiki.user"],"private"],["user.tokens","1539894433",[],"private"],["filepage","1539894433",[]],["skins.chick","1539894433",[]],["skins.cologneblue","1539894433",[]],["skins.modern","1539894433",[]],["skins.monobook","1539894433",[]],["skins.nostalgia","1539894433",[]],["skins.simple","1539894433",[]],["skins.standard","1539894433",[]],["skins.vector","1539894433",[]],["jquery","1539894433",[]],["jquery.appear","1539894433",[]],[
"jquery.arrowSteps","1539894433",[]],["jquery.async","1539894433",[]],["jquery.autoEllipsis","1539894433",["jquery.highlightText"]],["jquery.byteLength","1539894433",[]],["jquery.byteLimit","1539894433",["jquery.byteLength"]],["jquery.checkboxShiftClick","1539894433",[]],["jquery.client","1539894433",[]],["jquery.collapsibleTabs","1539894433",[]],["jquery.color","1539894433",["jquery.colorUtil"]],["jquery.colorUtil","1539894433",[]],["jquery.cookie","1539894433",[]],["jquery.delayedBind","1539894433",[]],["jquery.expandableField","1539894433",["jquery.delayedBind"]],["jquery.farbtastic","1539894433",["jquery.colorUtil"]],["jquery.footHovzer","1539894433",[]],["jquery.form","1539894433",[]],["jquery.getAttrs","1539894433",[]],["jquery.highlightText","1539894433",[]],["jquery.hoverIntent","1539894433",[]],["jquery.json","1539894433",[]],["jquery.localize","1539894433",[]],["jquery.makeCollapsible","1540388085",[]],["jquery.messageBox","1539894433",[]],["jquery.mockjax","1539894433",[]],[
"jquery.mw-jump","1539894433",[]],["jquery.mwExtension","1539894433",[]],["jquery.placeholder","1539894433",[]],["jquery.qunit","1539894433",[]],["jquery.qunit.completenessTest","1539894433",["jquery.qunit"]],["jquery.spinner","1539894433",[]],["jquery.suggestions","1539894433",["jquery.autoEllipsis"]],["jquery.tabIndex","1539894433",[]],["jquery.tablesorter","1541217134",["jquery.mwExtension"]],["jquery.textSelection","1539894433",[]],["jquery.validate","1539894433",[]],["jquery.xmldom","1539894433",[]],["jquery.tipsy","1539894433",[]],["jquery.ui.core","1539894433",["jquery"],"jquery.ui"],["jquery.ui.widget","1539894433",[],"jquery.ui"],["jquery.ui.mouse","1539894433",["jquery.ui.widget"],"jquery.ui"],["jquery.ui.position","1539894433",[],"jquery.ui"],["jquery.ui.draggable","1539894433",["jquery.ui.core","jquery.ui.mouse","jquery.ui.widget"],"jquery.ui"],["jquery.ui.droppable","1539894433",["jquery.ui.core","jquery.ui.mouse","jquery.ui.widget","jquery.ui.draggable"],"jquery.ui"],[
"jquery.ui.resizable","1539894433",["jquery.ui.core","jquery.ui.widget","jquery.ui.mouse"],"jquery.ui"],["jquery.ui.selectable","1539894433",["jquery.ui.core","jquery.ui.widget","jquery.ui.mouse"],"jquery.ui"],["jquery.ui.sortable","1539894433",["jquery.ui.core","jquery.ui.widget","jquery.ui.mouse"],"jquery.ui"],["jquery.ui.accordion","1539894433",["jquery.ui.core","jquery.ui.widget"],"jquery.ui"],["jquery.ui.autocomplete","1539894433",["jquery.ui.core","jquery.ui.widget","jquery.ui.position"],"jquery.ui"],["jquery.ui.button","1539894433",["jquery.ui.core","jquery.ui.widget"],"jquery.ui"],["jquery.ui.datepicker","1539894433",["jquery.ui.core"],"jquery.ui"],["jquery.ui.dialog","1539894433",["jquery.ui.core","jquery.ui.widget","jquery.ui.button","jquery.ui.draggable","jquery.ui.mouse","jquery.ui.position","jquery.ui.resizable"],"jquery.ui"],["jquery.ui.progressbar","1539894433",["jquery.ui.core","jquery.ui.widget"],"jquery.ui"],["jquery.ui.slider","1539894433",["jquery.ui.core",
"jquery.ui.widget","jquery.ui.mouse"],"jquery.ui"],["jquery.ui.tabs","1539894433",["jquery.ui.core","jquery.ui.widget"],"jquery.ui"],["jquery.effects.core","1539894433",["jquery"],"jquery.ui"],["jquery.effects.blind","1539894433",["jquery.effects.core"],"jquery.ui"],["jquery.effects.bounce","1539894433",["jquery.effects.core"],"jquery.ui"],["jquery.effects.clip","1539894433",["jquery.effects.core"],"jquery.ui"],["jquery.effects.drop","1539894433",["jquery.effects.core"],"jquery.ui"],["jquery.effects.explode","1539894433",["jquery.effects.core"],"jquery.ui"],["jquery.effects.fade","1539894433",["jquery.effects.core"],"jquery.ui"],["jquery.effects.fold","1539894433",["jquery.effects.core"],"jquery.ui"],["jquery.effects.highlight","1539894433",["jquery.effects.core"],"jquery.ui"],["jquery.effects.pulsate","1539894433",["jquery.effects.core"],"jquery.ui"],["jquery.effects.scale","1539894433",["jquery.effects.core"],"jquery.ui"],["jquery.effects.shake","1539894433",["jquery.effects.core"],
"jquery.ui"],["jquery.effects.slide","1539894433",["jquery.effects.core"],"jquery.ui"],["jquery.effects.transfer","1539894433",["jquery.effects.core"],"jquery.ui"],["mediawiki","1539894433",[]],["mediawiki.api","1539894433",["mediawiki.util"]],["mediawiki.api.category","1539894433",["mediawiki.api","mediawiki.Title"]],["mediawiki.api.edit","1539894433",["mediawiki.api","mediawiki.Title"]],["mediawiki.api.parse","1539894433",["mediawiki.api"]],["mediawiki.api.titleblacklist","1539894433",["mediawiki.api","mediawiki.Title"]],["mediawiki.api.watch","1539894433",["mediawiki.api","mediawiki.user"]],["mediawiki.debug","1539894433",["jquery.footHovzer"]],["mediawiki.debug.init","1539894433",["mediawiki.debug"]],["mediawiki.feedback","1539894433",["mediawiki.api.edit","mediawiki.Title","mediawiki.jqueryMsg","jquery.ui.dialog"]],["mediawiki.htmlform","1539894433",[]],["mediawiki.Title","1539894433",["mediawiki.util"]],["mediawiki.Uri","1539894433",[]],["mediawiki.user","1539894433",[
"jquery.cookie"]],["mediawiki.util","1540388084",["jquery.client","jquery.cookie","jquery.messageBox","jquery.mwExtension"]],["mediawiki.action.edit","1539894433",["jquery.textSelection","jquery.byteLimit"]],["mediawiki.action.history","1539894433",["jquery.ui.button"],"mediawiki.action.history"],["mediawiki.action.history.diff","1539894433",[],"mediawiki.action.history"],["mediawiki.action.view.dblClickEdit","1539894433",["mediawiki.util"]],["mediawiki.action.view.metadata","1540416586",[]],["mediawiki.action.view.rightClickEdit","1539894433",[]],["mediawiki.action.watch.ajax","1539894433",["mediawiki.api.watch","mediawiki.util"]],["mediawiki.language","1539894433",[]],["mediawiki.jqueryMsg","1539894433",["mediawiki.language","mediawiki.util"]],["mediawiki.libs.jpegmeta","1539894433",[]],["mediawiki.page.ready","1539894433",["jquery.checkboxShiftClick","jquery.makeCollapsible","jquery.placeholder","jquery.mw-jump","mediawiki.util"]],["mediawiki.page.startup","1539894433",[
"jquery.client","mediawiki.util"]],["mediawiki.special","1539894433",[]],["mediawiki.special.block","1539894433",["mediawiki.util"]],["mediawiki.special.changeemail","1539894433",["mediawiki.util"]],["mediawiki.special.changeslist","1539894433",["jquery.makeCollapsible"]],["mediawiki.special.movePage","1539894433",["jquery.byteLimit"]],["mediawiki.special.preferences","1539894433",[]],["mediawiki.special.recentchanges","1539894433",["mediawiki.special"]],["mediawiki.special.search","1539894433",[]],["mediawiki.special.undelete","1539894433",[]],["mediawiki.special.upload","1540925010",["mediawiki.libs.jpegmeta","mediawiki.util"]],["mediawiki.special.javaScriptTest","1539894433",["jquery.qunit"]],["mediawiki.tests.qunit.testrunner","1539894433",["jquery.qunit","jquery.qunit.completenessTest","mediawiki.page.startup","mediawiki.page.ready"]],["mediawiki.legacy.ajax","1539894433",["mediawiki.util","mediawiki.legacy.wikibits"]],["mediawiki.legacy.commonPrint","1539894433",[]],[
"mediawiki.legacy.config","1539894433",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.IEFixes","1539894433",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.mwsuggest","1539894433",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.preview","1539894433",["mediawiki.legacy.wikibits"]],["mediawiki.legacy.protect","1539894433",["mediawiki.legacy.wikibits","jquery.byteLimit"]],["mediawiki.legacy.shared","1539894433",[]],["mediawiki.legacy.oldshared","1539894433",[]],["mediawiki.legacy.upload","1539894433",["mediawiki.legacy.wikibits","mediawiki.util"]],["mediawiki.legacy.wikibits","1539894433",["mediawiki.util"]],["mediawiki.legacy.wikiprintable","1539894433",[]],["ext.geshi.local","1539894433",[]],["ext.nuke","1539894433",[]]]);mw.config.set({"wgLoadScript":"/load.php","debug":false,"skin":"postgresql","stylepath":"/skins","wgUrlProtocols":
"http\\:\\/\\/|https\\:\\/\\/|ftp\\:\\/\\/|irc\\:\\/\\/|ircs\\:\\/\\/|gopher\\:\\/\\/|telnet\\:\\/\\/|nntp\\:\\/\\/|worldwind\\:\\/\\/|mailto\\:|news\\:|svn\\:\\/\\/|git\\:\\/\\/|mms\\:\\/\\/|\\/\\/","wgArticlePath":"/wiki/$1","wgScriptPath":"","wgScriptExtension":".php","wgScript":"/index.php","wgVariantArticlePath":false,"wgActionPaths":{},"wgServer":"https://wiki.postgresql.org","wgUserLanguage":"en","wgContentLanguage":"en","wgVersion":"1.19.20+dfsg-2.3","wgEnableAPI":true,"wgEnableWriteAPI":true,"wgDefaultDateFormat":"dmy","wgMonthNames":["","January","February","March","April","May","June","July","August","September","October","November","December"],"wgMonthNamesShort":["","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"wgMainPageTitle":"Main Page","wgFormattedNamespaces":{"-2":"Media","-1":"Special","0":"","1":"Talk","2":"User","3":"User talk","4":"PostgreSQL wiki","5":"PostgreSQL wiki talk","6":"File","7":"File talk","8":"MediaWiki","9":
"MediaWiki talk","10":"Template","11":"Template talk","12":"Help","13":"Help talk","14":"Category","15":"Category talk"},"wgNamespaceIds":{"media":-2,"special":-1,"":0,"talk":1,"user":2,"user_talk":3,"postgresql_wiki":4,"postgresql_wiki_talk":5,"file":6,"file_talk":7,"mediawiki":8,"mediawiki_talk":9,"template":10,"template_talk":11,"help":12,"help_talk":13,"category":14,"category_talk":15,"image":6,"image_talk":7,"project":4,"project_talk":5},"wgSiteName":"PostgreSQL wiki","wgFileExtensions":["png","gif","jpg","jpeg","pdf","svg","gz","bz2","doc","docx","odp","odt","odg","ogg","otg","pdf","ppt","pptx","sql","svg","swf","sxi","tar","tgz","xls","xlsx","zip"],"wgDBname":"wikidb","wgFileCanRotate":true,"wgAvailableSkins":{"chick":"Chick","vector":"Vector","standard":"Standard","simple":"Simple","nostalgia":"Nostalgia","modern":"Modern","monobook":"MonoBook","myskin":"MySkin","cologneblue":"CologneBlue","postgresql":"PostgreSQL"},"wgExtensionAssetsPath":"/extensions","wgCookiePrefix":
"wikidb","wgResourceLoaderMaxQueryLength":-1,"wgCaseSensitiveNamespaces":[]});};if(isCompatible()){document.write("\x3cscript src=\"/load.php?debug=false\x26amp;lang=en\x26amp;modules=jquery%2Cmediawiki\x26amp;only=scripts\x26amp;skin=postgresql\x26amp;version=20141001T215140Z\"\x3e\x3c/script\x3e");}delete isCompatible;;

/* cache key: wikidb:resourceloader:filter:minify-js:7:c29b0b7242f18d52c132e3bb4fb7e661 */
