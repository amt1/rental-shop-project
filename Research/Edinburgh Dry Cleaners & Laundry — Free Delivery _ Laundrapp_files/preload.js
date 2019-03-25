if (
    typeof window['OptiMonk'] !== "object"
    || typeof window['OptiMonk']['preloadInitialized'] !== "boolean"
) {

    var OptiMonkRegistry = {
        account: 12026,
        baseUrl: document.location.protocol + '//front.optimonk.com',
        contentUrl: document.location.protocol + '//cdn-content.optimonk.com',
        beUrl: 'https://backend.optimonk.com',
        assetsVersion: '210',
        activatedCampaigns: {"popup": false, "sidebar": false, "nanobar": false},
        mobileExitCampaigns: [],
        uuid: (function () {
            function s4() {return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1)}
            return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4()
        })()
    };
    /* Namespace */
    function ns(n){for(var i=n.split("."),o=window,r="",t=0,d=i.length;t<d;t++)o[r=i[t]]=void 0===o[r]?{}:o[r],o=o[r];return o}
    var OptiMonk = (function(OptiMonk){
        OptiMonk.addListener = function (obj, type, fn) {
            if (obj.addEventListener) {
                obj.addEventListener(type, fn, false);
            } else if (obj.attachEvent) {
                obj.attachEvent('on' + type, function () {
                    fn.apply(obj, new Array(window.event));
                });
            } else {
                obj["on" + type] = fn;
            }
        };

        OptiMonk.removeListener = function (obj, type, fn) {
            if (obj.removeEventListener) {
                obj.removeEventListener(type, fn, false);
            } else if (obj.detachEvent) {
                obj.detachEvent('on' + type, fn);
            } else {
                if (obj["on" + type]) {
                    delete obj["on" + type];
                }
            }
        }
        var OptiMonk;OptiMonk.Logger=function(){var t={},n=function(){return"object"==typeof window.console&&"function"==typeof window.console.error&&"function"==typeof window.console.log&&"function"==typeof window.console.info};return t.log=function(t){!1!==n()&&window.console.log(t)},t.error=function(t,e){!1!==n()&&(e=e||{},window.console.error(t,e))},t.info=function(t){!1!==n()&&window.console.info(t)},t}(),OptiMonk.Util={},OptiMonk.Util.JSON=JSON||{},OptiMonk.Util.quote=function(t){return escapable.lastIndex=0,escapable.test(t)?'"'+t.replace(escapable,function(t){var e=meta[t];return"string"==typeof e?e:"\\u"+("0000"+t.charCodeAt(0).toString(16)).slice(-4)})+'"':'"'+t+'"'},OptiMonk.Util.str=function(t,e){var n,r,o,i,a,p=gap,f=e[t];switch(f&&"object"==typeof f&&"function"==typeof f.toJSON&&(f=f.toJSON(t)),"function"==typeof rep&&(f=rep.call(e,t,f)),typeof f){case"string":return OptiMonk.Util.quote(f);case"number":return isFinite(f)?String(f):"null";case"boolean":case"null":return String(f);case"object":if(!f)return"null";if(gap+=indent,a=[],"[object Array]"===Object.prototype.toString.apply(f)){for(i=f.length,n=0;n<i;n+=1)a[n]=OptiMonk.Util.str(n,f)||"null";return o=0===a.length?"[]":gap?"[\n"+gap+a.join(",\n"+gap)+"\n"+p+"]":"["+a.join(",")+"]",gap=p,o}if(rep&&"object"==typeof rep)for(i=rep.length,n=0;n<i;n+=1)"string"==typeof rep[n]&&(r=rep[n],(o=OptiMonk.Util.str(r,f))&&a.push(OptiMonk.Util.quote(r)+(gap?": ":":")+o));else for(r in f)Object.prototype.hasOwnProperty.call(f,r)&&(o=OptiMonk.Util.str(r,f))&&a.push(OptiMonk.Util.quote(r)+(gap?": ":":")+o);return o=0===a.length?"{}":gap?"{\n"+gap+a.join(",\n"+gap)+"\n"+p+"}":"{"+a.join(",")+"}",gap=p,o}},OptiMonk.Util.stringify=function(t,e,n){if("function"==typeof OptiMonk.Util.JSON.stringify)return JSON.stringify(t,e,n);var r;if(escapable=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,meta={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},gap="",indent="","number"==typeof n)for(r=0;r<n;r+=1)indent+=" ";else"string"==typeof n&&(indent=n);if((rep=e)&&"function"!=typeof e&&("object"!=typeof e||"number"!=typeof e.length))throw new Error("JSON.stringify");return OptiMonk.Util.str("",{"":t})},OptiMonk.Util.parse=function(text,reviver){function walk(t,e){var n,r,o=t[e];if(o&&"object"==typeof o)for(n in o)Object.prototype.hasOwnProperty.call(o,n)&&(void 0!==(r=walk(o,n))?o[n]=r:delete o[n]);return reviver.call(t,e,o)}if("function"==typeof OptiMonk.Util.JSON.parse)return JSON.parse(text,reviver);var j;if(cx=/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,text=String(text),cx.lastIndex=0,cx.test(text)&&(text=text.replace(cx,function(t){return"\\u"+("0000"+t.charCodeAt(0).toString(16)).slice(-4)})),/^[\],:{}\s]*$/.test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,"")))return j=eval("("+text+")"),"function"==typeof reviver?walk({"":j},""):j;throw new SyntaxError("JSON.parse")},OptiMonk.Util.parseHelper=function(t,e){return"object"!=typeof e?decodeURIComponent(e):e},OptiMonk.Util.trim=function(t){return null===t?"":(t+"").replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,"")},OptiMonk.Util.checkVariable=function(t,e,n){var r=0,o=OptiMonk.ayepromise.defer();n=n||10;var i=setInterval(function(){void 0!==window[t]&&(o.resolve(window[t]),clearInterval(i)),++r===e&&(clearInterval(i),o.reject(!1))},n);return o.promise},OptiMonk.Util.assign=function(t,e){for(var n=Object(t),r=1;r<arguments.length;r++){var o=arguments[r];if(null!=o)for(var i in o)Object.prototype.hasOwnProperty.call(o,i)&&(n[i]=o[i])}return n},OptiMonk.vendor={isApple:/Apple\ Computer/.test(navigator.vendor)},OptiMonk.browser={isSafari:/Safari/.test(navigator.userAgent)&&OptiMonk.vendor.isApple,isIE:0<window.navigator.userAgent.indexOf("MSIE ")||!!navigator.userAgent.match(/Trident.*rv\:11\./)},OptiMonk.platform={isIphone:/iPhone/.test(navigator.platform),isIpad:/iPad/.test(navigator.platform),isIpod:/iPod/.test(navigator.platform)},function(o){o.ajax={load:function(t){var e,n,r;if("undefined"!=typeof XMLHttpRequest)"withCredential"in(e=new XMLHttpRequest)&&(e.withCredentials=!0);else{var o=["MSXML2.XmlHttp.5.0","MSXML2.XmlHttp.4.0","MSXML2.XmlHttp.3.0","MSXML2.XmlHttp.2.0","Microsoft.XmlHttp"];for(n=0,r=o.length;n<r;n++)try{e=new ActiveXObject(o[n]);break}catch(t){}}return e.onreadystatechange=function(){4===e.readyState&&t&&t(e.responseText)},e},get:function(t,e){var n=o.ajax.load(e);n.open("GET",t,!0),n.send("")},post:function(t,e,n){var r=o.ajax.load(n);r.open("POST",e,!0),r.setRequestHeader("Content-type","application/x-www-form-urlencoded"),r.send(t)}}}(OptiMonk||(OptiMonk={}));var ErrorReporter=function(e){var n={},r=OptiMonkRegistry.baseUrl+"/error/log";function o(t){e("message="+encodeURIComponent(JSON.stringify(t)),r)}function i(t){return!!n[t.message]}function a(t){n[t.message]=1}return{sendException:function(t){var e;i(t)||(a(t),o({message:(e=t).message,stack:e.stack,userAgent:navigator.userAgent,url:window.location.href,name:e.name,line:e.lineNumber||e.number}))},sendEventError:function(t){var e;i(t)||(a(t),o({message:(e=t).message,stack:e.error?e.error.stack:"",userAgent:navigator.userAgent,url:window.location.href,errorEvent:e,file:e.filename}))}}}(OptiMonk.ajax.post);

        OptiMonk.sendLoadRequest = function () {
            OptiMonk.ajax.post(
                'url=' + encodeURIComponent(window.location.href) + '&cookie=' + OptiMonk.Util.stringify(OptiMonk.getCookie()),
                OptiMonkRegistry.baseUrl + '/public/' + OptiMonkRegistry.account + '/js/load',
                OptiMonk.addResponseToHead
            );
        };

        OptiMonk.preloadInitialized = true;

        return OptiMonk;
    })(OptiMonk || {});
    (function (OptiMonk) {
        var ErrorReporter=function(r){var n={},t=OptiMonkRegistry.baseUrl+"/error/log";function o(e){r("message="+encodeURIComponent(JSON.stringify(e)),t)}function s(e){return!!n[e.message]}function a(e){n[e.message]=1}return{sendException:function(e){var r;s(e)||(a(e),o({message:(r=e).message,stack:r.stack,userAgent:navigator.userAgent,url:window.location.href,name:r.name,line:r.lineNumber||r.number}))},sendEventError:function(e){var r;s(e)||(a(e),o({message:(r=e).message,stack:r.error?r.error.stack:"",userAgent:navigator.userAgent,url:window.location.href,errorEvent:r,file:r.filename}))}}}(OptiMonk.ajax.post);
        OptiMonk.hasError = false;
        try {
            var OptiMonk;OptiMonk.ayepromise=function(){"use strict";var e={},s=function(){var t=!1;return function(e){return function(){t||(t=!0,e.apply(null,arguments))}}},p=function(i,r){var c=e.defer(),a=function(t,n){setTimeout(function(){var e;try{e=t(n)}catch(e){return void c.reject(e)}e===c.promise?c.reject(new TypeError("Cannot resolve promise with itself")):c.resolve(e)},1)};return{promise:c.promise,handle:function(e,t){var n,o;e===l?(o=t,i&&i.call?a(i,o):c.resolve(o)):(n=t,r&&r.call?a(r,n):c.reject(n))}}},l=1;return e.defer=function(){var o,i=0,r=[],c=function(e,t){i=e,o=t,r.forEach(function(e){e.handle(i,o)}),r=null},a=function(e){c(2,e)},t=function(e,t){var n=p(e,t);return 0===i?r.push(n):n.handle(i,o),n.promise},u=function(e){var t,n,o;try{o=(n=e)&&n.then,t="object"==typeof n&&"function"==typeof o?function(){return o.apply(n,arguments)}:void 0}catch(e){return void a(e)}t?function(e){var t=s();try{e(t(u),t(a))}catch(e){t(a)(e)}}(t):c(l,e)},e=s();return{resolve:e(u),reject:e(a),promise:{then:t,fail:function(e){return t(null,e)}}}},e}(),function(t){var e=function(){function e(){}return e.load=function(){var e=t.ayepromise.defer();return this.Loader.load(e),e.promise},e}();(t.Data=e).Loader={load:function(e){e.resolve()}}}(OptiMonk||(OptiMonk={})),OptiMonk.Util.checkVariable("ShopifyAnalytics",20).then(function(){var e,t;e=window.Shopify,t=window.ShopifyAnalytics,window.OptiMonk.ShopifyAdapter={isShopifyShop:function(){return void 0!==t&&void 0!==e},isProductPage:function(){return"product"===t.meta.page.pageType},getProductId:function(){return t.meta.product.id},getVariantId:function(){return t.meta.selectedVariantId},getProductPageData:function(){return{product_id:this.getProductId()}},getShopName:function(){return e.shop||e.Checkout.apiHost},getShopCurrency:function(){return t.meta.currency}},OptiMonk.triggerEvent(document.querySelector("html"),"optimonk#shopify-vars-loaded",window.OptiMonk.ShopifyAdapter)},function(){OptiMonk.triggerEvent(document.querySelector("html"),"optimonk#shopify-vars-not-loaded")}),OptiMonk.Cookie=function(t){var n,e,o,i,r,c=function(e){return"object"==typeof e&&(e=t.stringify(e)),navigator.userAgent.match(/^Opera.* Version\/12.*/)?encodeURIComponent(e):e};return{local:{setItem:function(e,t){var n=new Date,o=c(t);n.setUTCFullYear(n.getUTCFullYear()+2),o+="; expires="+n.toUTCString(),document.cookie=e+"="+o+";path=/;"},getItem:e=function(e){var t=document.cookie.match(new RegExp(e+"=([^;]+)"));return t?decodeURIComponent(t[1]):null},getItemSlices:o=function(e){for(var t,n=[],o=new RegExp(e+"_"+OptiMonkRegistry.account+"_[0-9]+=([^;]+)\\;?","gm");t=o.exec(document.cookie);)n=n.concat(JSON.parse(decodeURIComponent(t[1])));return n},removeItem:i=function(e){return!1!==n(e)&&(document.cookie=encodeURIComponent(e)+"=; expires=Thu, 01 Jan 1970 00:00:00 GMT;path=/;",!0)},hasItem:n=r=function(e){return!!e&&new RegExp("(?:^|;\\s*)"+encodeURIComponent(e).replace(/[\-\.\+\*]/g,"\\$&")+"\\s*\\=").test(document.cookie)}},session:{setItem:function(e,t){var n=c(t);document.cookie=e+"="+n+";path=/;"},getItem:e,getItemSlices:o,removeItem:i,hasItem:r}}}(OptiMonk.Util),OptiMonk.Storage=function(e,n){var t,o,i,r;return"object"!=typeof localStorage?e:(o=function(e){return null!==t(e)},r=function(e){return null!==i(e)},{local:{setItem:function(e,t){localStorage.setItem(e,n.stringify(t))},getItem:t=function(e){return n.parse(localStorage.getItem(e),n.parseHelper)},getItemSlices:function(e){return n.parse(localStorage.getItemSlices(e),n.parseHelper)},removeItem:function(e){localStorage.removeItem(e)},hasItem:o},session:{setItem:function(e,t){sessionStorage.setItem(e,n.stringify(t))},getItem:i=function(e){return n.parse(sessionStorage.getItem(e),n.parseHelper)},getItemSlices:function(e){return n.parse(sessionStorage.getItemSlices(e),n.parseHelper)},removeItem:function(e){sessionStorage.removeItem(e)},hasItem:r}})}(OptiMonk.Cookie,OptiMonk.Util),OptiMonk.messaging=function(){var e,o,i,r=1,c=this;return{postMessage:function(e,t,n){t&&(n=n||parent,c.postMessage?n.postMessage(e,t.replace(/([^:]+:\/\/[^\/]+).*/,"$1")):t&&(n.location=t.replace(/#.*$/,"")+"#"+ +new Date+r+++"&"+e))},receiveMessage:function(n,t){c.postMessage?(n&&(i=function(e){if("string"==typeof t&&e.origin!==t||"[object Function]"===Object.prototype.toString.call(t)&&!1===t(e.origin))return!1;n(e)}),c.addEventListener?c[n?"addEventListener":"removeEventListener"]("message",i,!1):c[n?"attachEvent":"detachEvent"]("onmessage",i)):(e&&clearInterval(e),e=null,n&&(e=setInterval(function(){var e=document.location.hash,t=/^#?\d+&/;e!==o&&t.test(e)&&n({data:(o=e).replace(t,"")})},100)))}}}(),OptiMonk.each=function(e,t){var n;for(n in e)e.hasOwnProperty(n)&&"length"!==n&&t(n,e[n])},OptiMonk.getCookie=function(){var e=OptiMonk.Cookie.local.getItem("optiMonkClient");if(e){if(e=OptiMonk.Util.parse(e),Array.isArray(e[OptiMonkRegistry.account].ca)){var t=e[OptiMonkRegistry.account].ca.concat(OptiMonk.Cookie.local.getItemSlices("optiMonkClient")),n={};return t.forEach(function(e){var t=e.caId;delete e.caId,n[t]=e}),e[OptiMonkRegistry.account].ca=n,e}return e}return(e={})[OptiMonkRegistry.account]={},e},OptiMonk.saveCookie=function(){var e=OptiMonk.getCookie();e[OptiMonkRegistry.account]=OptiMonkRegistry.Cookie;var t=e[OptiMonkRegistry.account].ca;if(30<Object.keys(t).length){var n=[],o=[],i=1;for(var r in t)if(t.hasOwnProperty(r)){var c=t[r];c.caId=r,o.push(c),i%30==0&&(n.push(o),o=[]),i++}n.push(o),n.forEach(function(e,t){t&&OptiMonk.Cookie.local.setItem("optiMonkClient_"+OptiMonkRegistry.account+"_"+t,e)});var a=JSON.parse(JSON.stringify(e));a[OptiMonkRegistry.account].ca=n[0],OptiMonk.Cookie.local.setItem("optiMonkClient",a)}else OptiMonk.Cookie.local.setItem("optiMonkClient",e)},OptiMonk.isCookieEnabled=function(){var e=navigator.cookieEnabled,t=!!e;return void 0!==e||t||(document.cookie="isCookie",t=-1!=document.cookie.indexOf("isCookie")),t},OptiMonk.isPreRender=function(){return!!document.webkitVisibilityState&&"prerender"===document.webkitVisibilityState},OptiMonk.shouldContinueLoading=function(){return OptiMonk.isCookieEnabled()&&!1===OptiMonk.isPreRender()},OptiMonk.addResponseToHead=function(e){var t=document.createElement("script"),n=document.createTextNode(e);t.appendChild(n),t.type="text/javascript",document.getElementsByTagName("head")[0].appendChild(t)},OptiMonk.triggerEvent=function(e,t,n){var o;document.createEvent?(o=document.createEvent("HTMLEvents")).initEvent(t,!0,!0):document.createEventObject&&((o=document.createEventObject()).eventType=t),o.eventName=t,o.parameters=n||{},e.dispatchEvent?e.dispatchEvent(o):e.fireEvent?e.fireEvent("on"+o.eventType,o):e[t]?e[t]():e["on"+t]&&e["on"+t]()};
            OptiMonk.triggerEvent(document.getElementsByTagName('html')[0], 'optimonk#preload-initialized');
            OptiMonk.Data.load()
                .then(function () {
                    if (OptiMonk.shouldContinueLoading()) {
                        OptiMonk.sendLoadRequest();
                    }
                });
            // Logging IE frontend errors
            if (OptiMonkRegistry.account === 11736) {
                OptiMonk.addListener(window, 'error', ErrorReporter.sendEventError)
            }
        } catch (exception) {
            ErrorReporter.sendException('preload', exception);
        }
    })(OptiMonk);
}
