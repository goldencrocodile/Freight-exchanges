!function(){"use strict";!function(){var t=Math.PI;function e(t){throw new Error(t)}var n=Array.prototype,r=n.slice,i=function(){},o=i,a={},s=Date.now||function(){return(new Date).getTime()},c=navigator.userAgent;function u(t){return t.test(c)}window.addEventListener;var l=u(/iPhone/),d=l||u(/iPad/),h=u(/Android/),f=(u(/Windows Phone/),u(/Android [2-4]/)),p=u(/; wv\) |Gecko\) Version\/[^ ]+ Chrome|Windows Phone|Opera Mini|UCBrowser|FBAN|CriOS/)||d||f&&!u(/Chrome/),m=(u(/(Windows Phone|\(iP.+UCBrowser\/)/),u(/iPhone|Android 2\./),u(/Windows Phone/),c.match(/Chrome\/(\d+)/));m&&(m=parseInt(m[1],10));u(/iPhone OS 7/),h&&(m||u(/firefox/));function v(t){return"boolean"==typeof t}function g(t){return"number"==typeof t}function y(t){return"function"==typeof t}function b(t){return"string"==typeof t}function w(t){return t&&"object"==typeof t}function k(t,e,n){var r;if(arguments.length<3&&(n=this),t)if(void 0!==t.length)for(r=0;r<t.length;r++)e.call(n,r,t[r]);else for(r in t)t.hasOwnProperty(r)&&e.call(n,r,t[r])}function M(t,e,n){b(t)&&(t=e[t]);var i=arguments;return i.length>=3?function(){t.apply(e,r.call(i,2))}:function(){return t.apply(e,arguments)}}function x(t,e){if(1===arguments.length&&(e=0),arguments.length<3)setTimeout(t,e);else{var n=arguments;setTimeout(function(){t.apply(null,r.call(n,2))},e)}}function N(t,e,n,r){if(g(r))return setTimeout(function(){N(t,e,n)},r);if(b(t)&&(t=e&&e[t]),y(t)){e||(e=this);try{return arguments.length>=3?t.call(e,n):t.call(e)}catch(t){i("invoke",t)}}}var C=M(JSON.stringify,JSON),_=M(document.querySelector,document),T=M(document.querySelectorAll,document);M(document.getElementById,document);function S(t,e,n,r){if(!b(r)){if("get"===n)return r||(r=window),void(r.location=t);r&&(r=r.name)}var i=document.createElement("form");i.setAttribute("action",t),n&&i.setAttribute("method",n),r&&i.setAttribute("target",r),e&&(i.innerHTML=A(e)),Z.appendChild(i),i.submit(),Z.removeChild(i)}function A(t,e){if(w(t)){var n="";return k(t,function(t,r){e&&(t=e+"["+t+"]"),n+=A(r,t)}),n}return'<input type="hidden" name="'+e+'" value="'+t+'">'}var D,R=function(t){return b(t)?R(document.querySelector(t)):this instanceof R?void(this[0]=t):new R(t)};function L(e){!function(e){if(!window.requestAnimationFrame)return scrollBy(0,e);D&&clearTimeout(D);D=setTimeout(function(){var n=pageYOffset,r=Math.min(n+e,R(U).height()-innerHeight);e=r-n;var i=0,o=performance.now();requestAnimationFrame(function a(s){i+=(s-o)/300;if(i>=1)return scrollTo(0,r);var c=Math.sin(t*i/2);scrollTo(0,n+Math.round(e*c));o=s;requestAnimationFrame(a)})},100)}(e-pageYOffset)}R.prototype={on:function(t,e,n,r){var i,o=this[0];if(o&&(b(e)&&(e=r[e]),y(e))){var a=window.addEventListener;return i=a?function(t){return 3===t.target.nodeType&&(t.target=t.target.parentNode),e.call(r||this,t)}:function(t){return t||(t=window.event),t.target||(t.target=t.srcElement||document),t.preventDefault||(t.preventDefault=function(){this.returnValue=!1}),t.stopPropagation||(t.stopPropagation=t.preventDefault),t.currentTarget||(t.currentTarget=o),e.call(r||o,t)},k(t.split(" "),function(t,e){a?o.addEventListener(e,i,!!n):o.attachEvent("on"+e,i)}),M(function(){this.off(t,i,n)},this)}},off:function(t,e,n){window.removeEventListener?this[0].removeEventListener(t,e,!!n):window.detachEvent&&this[0].detachEvent("on"+t,e)},prop:function(t,e){var n=this[0];return 1===arguments.length?n&&n[t]:n?(n&&(n[t]=e),this):""},attr:function(t,e){if(w(t))return k(t,function(t,e){this.attr(t,e)},this),this;var n=arguments.length,r=this[0];return 1===n?r&&r.getAttribute(t):(r&&(e?r.setAttribute(t,e):r.removeAttribute(t)),this)},reflow:function(){return this.prop("offsetHeight"),this},remove:function(){try{var t=this[0];t.parentNode.removeChild(t)}catch(t){}return this},append:function(t){this[0].appendChild(t)},hasClass:function(t){return(" "+this[0].className+" ").indexOf(" "+t+" ")>=0},addClass:function(t){var e=this[0];return t&&e&&(e.className?this.hasClass(t)||(e.className+=" "+t):e.className=t),this},removeClass:function(t){var e=this[0];if(e){var n=(" "+e.className+" ").replace(" "+t+" "," ").replace(/^ | $/g,"");e.className!==n&&(e.className=n)}return this},toggleClass:function(t,e){return 1===arguments.length&&(e=!this.hasClass(t)),this[(e?"add":"remove")+"Class"](t)},qs:function(t){var e=this[0];if(e)return e.querySelector(t)},find:function(t){var e=this[0];if(e)return e.querySelectorAll(t)},$:function(t){return R(this.qs(t))},$0:function(){return R(this.firstElementChild)},css:function(t,e){var n=this.prop("style");if(n)if(1===arguments.length){if(!w(t))return n[t];k(t,function(t,e){this.css(t,e)},this)}else try{n[t]=e}catch(t){}return this},bbox:function(){return this[0]?this[0].getBoundingClientRect():a},offht:function(){return this.prop("offsetHeight")},height:function(t){return g(t)&&(t=t.toFixed(2)+"px"),b(t)?this.css("height",t):this[0]?this.bbox().height:void 0},hide:function(){return this.css("display","none")},toggle:function(t){N(t?"show":"hide",this)},show:function(){return this.css("display","block")},parent:function(){return R(this.prop("parentNode"))},val:function(t){return arguments.length?(this[0].value=t,this):this[0].value},html:function(t){return arguments.length?(this[0]&&(this[0].innerHTML=(e=t,E.innerHTML="",E.appendChild(document.createTextNode(e)),E.innerHTML)),this):this[0].innerHTML;var e},focus:function(){if(this[0])try{this[0].focus()}catch(t){}return this},blur:function(){if(this[0])try{this[0].blur()}catch(t){}return this},scrollTo:function(t){if(this[0])try{this[0].scrollTo(0,t)}catch(t){}return this}},R.post=function(t){t.method="post",t.headers||(t.headers={}),t.headers["Content-type"]="application/x-www-form-urlencoded";var e=[];return k(t.data,function(t,n){e.push(t+"="+encodeURIComponent(n))}),t.data=e.join("&"),R.ajax(t)},R.ajax=function(t){var e=new XMLHttpRequest;t.method||(t.method="get"),e.open(t.method,t.url,!0),k(t.headers,function(t,n){e.setRequestHeader(t,n)}),t.callback&&(e.onreadystatechange=function(){if(4===e.readyState&&e.status){var n;try{n=JSON.parse(e.responseText)}catch(t){(n=rt.error("Parsing error")).xhr={status:e.status,text:e.responseText}}t.callback(n)}},e.onerror=function(){var e=rt.error("Network error");e.xhr={status:0},t.callback(e)});var n=t.data||null;return m&&m<=33?N("send",e,n,1e3):e.send(n),e};var E=document.createElement("div");var P=function(t){var e,n,r,i={data:t.data||{},error:t.error||o,success:t.success||o,callback:t.callback||o,url:t.url||""},a=i.url;return a+=i.url.indexOf("?")<0?"?":"&",a+=(e=i.data,n=[],r=window.encodeURIComponent,k(e,function(t,e){n.push(r(t)+"="+r(e))}),n.join("&")),i.computedUrl=a,i};R.jsonp=function(t){t.data||(t.data={});var e=t.data.callback="jsonp_"+Math.random().toString(36).slice(2,15),n=P(t),r=!1;window[e]=function(t){delete t.http_status_code,n.success(t,n),n.callback(t,n);try{delete window[e]}catch(t){window[e]=void 0}};var i=document.createElement("script");return i.src=n.computedUrl,i.async=!0,i.onerror=function(t){n.error({error:!0,url:i.src,event:t}),n.callback({error:!0,url:i.src,event:t},n)},i.onload=i.onreadystatechange=function(){r||this.readyState&&"loaded"!==this.readyState&&"complete"!==this.readyState||(r=!0,i.onload=i.onreadystatechange=null,R(i).remove(),i=null)},document.documentElement.appendChild(i),{abort:function(){window[e]&&(window[e]=o)}}};var B="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",z=B+"+=",K={};k(B=B.slice(52)+B.slice(0,52),function(t,e){K[e]=t});var F=window.btoa;function O(t){for(var e="";t;)e=B[t%62]+e,t=Math.floor(t/62);return e}function $(){var t,e=O((s()-13885344e5).toString()+("000000"+Math.floor(1e6*Math.random())).slice(-6))+O(Math.floor(238328*Math.random()))+"0",n=0;return k(e,function(r){t=K[e[e.length-1-r]],(e.length-r)%2&&(t*=2),t>=62&&(t=t%62+1),n+=t}),(t=n%62)&&(t=B[62-t]),e.slice(0,13)+t}F||(F=function(t){var e,n,r,i,o,a;for(r=t.length,n=0,e="";n<r;){if(i=255&t.charCodeAt(n++),n===r){e+=z.charAt(i>>2),e+=z.charAt((3&i)<<4),e+="==";break}if(o=t.charCodeAt(n++),n===r){e+=z.charAt(i>>2),e+=z.charAt((3&i)<<4|(240&o)>>4),e+=z.charAt((15&o)<<2),e+="=";break}a=t.charCodeAt(n++),e+=z.charAt(i>>2),e+=z.charAt((3&i)<<4|(240&o)>>4),e+=z.charAt((15&o)<<2|(192&a)>>6),e+=z.charAt(63&a)}return e});var H=$(),I={library:"checkoutjs",platform:"browser",referer:location.href};function G(t,e,n){t.isLiveMode()&&x(function(){n instanceof Error&&(n={message:n.message,stack:n.stack});var r,i,o=(i={checkout_id:(r=t)?r.id:H},k(["integration","referer","library","platform","platform_version","os","os_version","device"],function(t,e){I[e]&&(i[e]=I[e])}),i);o.user_agent=null,o.mode="live";var a=t.get("order_id");a&&(o.order_id=a);var s={},c={options:s};n&&(c.data=n);var u=["key","amount","prefill","theme","image","description","name","method"];k(t.get(),function(t,e){var n=t.split("."),r=n[0];-1!==u.indexOf(r)&&(n.length>1?(u.hasOwnProperty(r)||(s[r]={}),s[r][n[1]]=e):s[t]=e)}),s.image&&rt.isBase64Image(s.image)&&(s.image="base64");var l={context:o,events:[{event:e,properties:c,timestamp:(new Date).getTime()}]};try{R.post({url:"https://lumberjack.razorpay.com/v1/track",method:"post",data:{key:"ZmY5N2M0YzVkN2JiYzkyMWM1ZmVmYWJk",data:encodeURIComponent(btoa(C(l)))}})}catch(t){}})}var U,Y=function(){function t(){return this._evts={},this._defs={},this}return t.prototype={onNew:o,def:function(t,e){this._defs[t]=e},on:function(t,e){if(b(t)&&y(e)){var n=this._evts;n[t]||(n[t]=[]),!1!==this.onNew(t,e)&&n[t].push(e)}return this},once:function(t,e){var n=e,r=this,i=function(){n.apply(r,arguments),r.off(t,i)};return e=i,this.on(t,e)},off:function(e,r){var i=arguments.length;if(!i)return t.call(this);var o,a=this._evts;if(2===i){var s=a[e];if(!(y(r)&&(o=s,o instanceof Array)))return;if(s.splice(function(t,e){if(n.indexOf)return t.indexOf(e);var r=t.length>>>0,i=Number(arguments[1])||0;for((i=i<0?Math.ceil(i):Math.floor(i))<0&&(i+=r);i<r;i++)if(i in t&&t[i]===e)return i;return-1}(s,r),1),s.length)return}return a[e]?delete a[e]:(e+=".",k(a,function(t){t.indexOf(e)||delete a[t]})),this},emit:function(t,e){return k(this._evts[t],function(t,n){try{n.call(this,e)}catch(t){console.error&&console.error(t)}},this),this},emitter:function(){var t=this,e=arguments;return function(){t.emit.apply(t,e)}}},t}();!function t(){(U=document.body||document.getElementsByTagName("body")[0])||setTimeout(t,99)}();var Z=U||document.documentElement;function W(t){return function e(){return U?t.call(this):(x(M(e,this),99),this)}}var j={api:"https://api.razorpay.com/",version:"v1/",frameApi:"/",cdn:"https://cdn.razorpay.com/"};try{var J=window.Razorpay.config;for(var q in J)j[q]=J[q]}catch(t){}function V(t){return t||(t=""),j.api+j.version+t}var X=window.Razorpay=function(t){if(!(this instanceof X))return new X(t);Y.call(this),this.id=$();try{var n=function(t){t&&"object"==typeof t||e("Invalid options");var n=function t(e){if(!(this instanceof t))return new t(e,n);var n=X.defaults;e=st(e,n);this.get=function(t){return arguments.length?t in e?e[t]:n[t]:e};this.set=function(t,n){e[t]=n};this.unset=function(t){delete e[t]}}(t);o=n,o=o.get(),k(it,function(t,n){t in o&&(a=n(o[t],o)),b(a)&&e("Invalid "+t+" ("+a+")")}),r=n,i=r.get("notes"),k(i,function(t,e){b(e)?e.length>254&&(i[t]=e.slice(0,254)):g(e)||v(e)||delete i[t]}),n.get("callback_url")&&p&&n.set("redirect",!0);var r,i;var o,a;return n}(t);this.get=n.get,this.set=n.set}catch(n){var r=n.message;this.get&&this.isLiveMode()||w(t)&&!t.parent&&alert(r),e(r)}this.get("key")||e("No key passed"),rt.validate(this),rt.isCheckout||G(this,"init"),this.postInit()},Q=X.prototype=new Y;function tt(t,e){return R.jsonp({url:V("preferences"),data:t,timeout:3e4,success:function(t){N(e,null,t)}})}Q.postInit=o,Q.onNew=function(t,e){if("ready"===t){var n=this;n.prefs?e(t,n.prefs):tt(nt(n),function(t){t.methods&&(n.prefs=t,n.methods=t.methods),e(n.prefs)})}},Q.emi_calculator=function(t,e){return X.emi.calculator(this.get("amount")/100,t,e)},X.emi={calculator:function(t,e,n){if(!n)return Math.ceil(t/e);n/=1200;var r=Math.pow(1+n,e);return parseInt(t*n*r/(r-1),10)}};X.payment={getMethods:function(t){return tt({key_id:X.defaults.key},function(e){t(e.methods||e)})}};var et=X.defaults={key:"",image:"",amount:100,currency:"INR",order_id:"",invoice_id:"",subscription_id:"",notes:null,callback_url:"",redirect:!1,description:"",customer_id:"",recurring:null,signature:"",retry:!0,target:"",subscription_card_change:null,display_currency:"",display_amount:"",recurring_token:{max_amount:0,expire_by:0}};function nt(t){if(t){var e=t.get,n={};return n.key_id=e("key"),k(["order_id","customer_id","invoice_id","subscription_id","recurring","subscription_card_change"],function(t,r){var i=e(r);i&&(n[r]=i)}),n}}Q.isLiveMode=function(){return/^rzp_l/.test(this.get("key"))};var rt={validate:o,msg:{wrongotp:"Entered OTP was incorrect. Re-enter to proceed."},isBase64Image:function(t){return/data:image\/[^;]+;base64/.test(t)},cancelMsg:"Payment cancelled",error:function(t){return{error:{description:t||rt.cancelMsg}}},redirect:function(t){if(!t.target&&window!==window.parent)return N(X.sendMessage,null,{event:"redirect",data:t});S(t.url,t.content,t.method,t.target)}},it={notes:function(t){var e="";if(w(t)){var n=0;if(k(t,function(){n++}),!(n>15))return;e="At most 15 notes are allowed"}return e},amount:function(t,e){if((/[^0-9]/.test(n=t)||!((n=parseInt(n,10))>=100))&&!e.recurring){return"should be passed in integer paise. Minimum value is 100 paise, i.e. â‚¹ 1"}var n},currency:function(t){if("INR"!==t&&"USD"!==t)return"INR and USD are the only supported values for currency field."},display_currency:function(t){if(!(t in rt.currencies)&&t!==X.defaults.display_currency)return"This display currency is not supported"},display_amount:function(t){if(!(t=String(t).replace(/([^0-9\.])/g,""))&&t!==X.defaults.display_amount)return""}};X.configure=function(t){k(st(t,X.defaults),function(t,e){typeof X.defaults[t]==typeof e&&(X.defaults[t]=e)})},rt.currencies={AFN:"&#x60b;",ALL:"&#x6b;",DZD:"Ø¯.Ø¬",WST:"T",EUR:"&#8364;",AOA:"Kz",XCD:"EC$",ARS:"$",AMD:"&#1423;",AWG:"Æ’",AUD:"A$",AZN:"Ð¼Ð°Ð½",BSD:"B$",BHD:"Ø¯.Ø¨",BDT:"&#x9f3;",BBD:"Bds$",BYR:"Br",BZD:"BZ$",XOF:"CFA",BMD:"BD$",BTN:"Nu.",BOB:"Bs.",BAM:"KM",BWP:"P",BRL:"R$",USD:"$",BND:"B$",BGN:"Ð»Ð²",BIF:"FBu",KHR:"áŸ›",XAF:"CFA",CAD:"C$",CVE:"Esc",KYD:"KY$",CLP:"$",CNY:"&#165;",COP:"$",KMF:"CF",NZD:"NZ$",CRC:"&#x20a1;",HRK:"Kn",CUC:"&#x20b1;",ANG:"Æ’",CZK:"KÄ",CDF:"FC",DKK:"Kr.",DJF:"Fdj",DOP:"RD$",EGP:"E&#163;",SVC:"&#x20a1;",ERN:"Nfa",ETB:"Br",FKP:"FK&#163;",FJD:"FJ$",XPF:"F",GMD:"D",GEL:"áƒš",GHS:"&#x20b5;",GIP:"&#163;",GTQ:"Q",GBP:"&#163;",GNF:"FG",GYD:"GY$",HTG:"G",HNL:"L",HKD:"HK$",HUF:"Ft",ISK:"Kr",IDR:"Rp",IRR:"&#xfdfc;",IQD:"Ø¹.Ø¯",ILS:"&#x20aa;",JMD:"J$",JPY:"&#165;",JOD:"Ø¯.Ø§",KZT:"&#x20b8;",KES:"KSh",KWD:"Ø¯.Ùƒ",KGS:"Ð»Ð²",LAK:"&#x20ad;",LVL:"Ls",LBP:"L&#163;",LSL:"L",LRD:"L$",LD:"Ù„.Ø¯",LYD:"Ù„.Ø¯",CHF:"Fr",LTL:"Lt",MOP:"P",MKD:"Ð´ÐµÐ½",MGA:"Ar",MWK:"MK",MYR:"RM",MVR:"Rf",MRO:"UM",MUR:"ÉŒs",MXN:"$",MDL:"L",MNT:"&#x20ae;",MAD:"Ø¯.Ù….",MZN:"MT",MMK:"K",NAD:"N$",NPR:"NÉŒs",NIO:"C$",NGN:"&#x20a6;",KPW:"â‚©",NOK:"Kr",OMR:"Ø±.Ø¹.",PKR:"ÉŒs",PAB:"B/.",PGK:"K",PYG:"&#x20b2;",PEN:"S/.",PHP:"&#x20b1;",PLN:"ZÅ‚",QAR:"QAR",RON:"L",RUB:"Ñ€ÑƒÐ±",RWF:"RF",SHP:"&#163;",STD:"Db",SAR:"Ø±.Ø³",RSD:"Ð”Ð¸Ð½.",SCR:"ÉŒs",SLL:"Le",SGD:"S$",SBD:"SI$",SOS:"So. Sh.",ZAR:"R",KRW:"â‚©",SDG:"&#163;Sd",LKR:"Rs",SFR:"Fr",SRD:"$",SZL:"L",SEK:"Kr",SYP:"S&#163;",TWD:"NT$",TJS:"SM",TZS:"TSh",THB:"&#x0e3f;",TOP:"T$",TTD:"TT$",TND:"Ø¯.Øª",TRY:"TL",TMT:"M",UGX:"USh",UAH:"&#x20b4;",AED:"Ø¯.Ø¥",UYU:"$U",UZS:"Ð»Ð²",VUV:"VT",VEF:"Bs",VND:"&#x20ab;",YER:"&#xfdfc;",ZMK:"ZK",ZWL:"Z$"},et.handler=function(t){if(this instanceof X){var e=this.get("callback_url");e&&S(e,t,"post")}},et.timeout=0,et.buttontext="Pay Now",et.parent=null,et.name="",et.ecod=!1,et.remember_customer=!1,et.method={netbanking:!0,card:!0,wallet:null,emi:!0,upi:!0,upi_intent:null},et.prefill={amount:"",wallet:"",method:"",name:"",contact:"",email:"",vpa:"","card[number]":"","card[expiry]":"","card[cvv]":"",bank:"","bank_account[name]":"","bank_account[account_number]":"","bank_account[ifsc]":"","aadhaar[number]":"",auth_type:""},et.features={cardsaving:!0},et.readonly={contact:!1,email:!1,name:!1},et.modal={confirm_close:!1,ondismiss:o,onhidden:o,escape:!0,animation:!0,backdropclose:!1},et.external={wallets:[],handler:o},et.theme={upi_only:!1,color:"",backdrop_color:"rgba(0,0,0,0.6)",image_padding:!0,image_frame:!0,close_button:!0,close_method_back:!1,hide_topbar:!1,branding:"",emi_mode:!1,debit_card:!1},it.parent=function(t){if(!R(t)[0])return"parent provided for embedded mode doesn't exist"};var ot={};function at(t,e,n,r){var i=e[n=n.toLowerCase()],o=typeof i;"string"===o&&(g(r)||v(r))?r=String(r):"number"===o?r=Number(r):"boolean"===o&&b(r)&&("true"===r?r=!0:"false"===r&&(r=!1)),null!==i&&o!==typeof r||(t[n]=r)}function st(t,e){var n={};return k(t,function(t,r){t in ot?k(r,function(r,i){at(n,e,t+"."+r,i)}):at(n,e,t,r)}),n}k(X.defaults,function(t,e){w(e)&&(ot[t]=!0,k(e,function(e,n){X.defaults[t+"."+e]=n}),delete X.defaults[t])});var ct,ut=Z.style,lt={overflow:"",metas:null,orientationchange:function(){lt.resize.call(this),lt.scroll.call(this)},resize:function(){var t=innerHeight||screen.height;mt.style.position=t<450?"absolute":"fixed",this.el.style.height=Math.max(t,460)+"px"},scroll:function(){if("number"==typeof window.pageYOffset)if(innerHeight<460){var t=460-innerHeight;pageYOffset>t+120&&L(t)}else this.isFocused||L(0)}};function dt(){return lt.metas||(lt.metas=T('head meta[name=viewport],head meta[name="theme-color"]')),lt.metas}function ht(t){try{vt.style.background=t}catch(t){}}function ft(t){if(t)return this.getEl(t),this.openRzp(t);this.getEl(),this.time=s()}ft.prototype={getEl:function(t){if(!this.el){var e={style:"opacity: 1; height: 100%; position: relative; background: none; display: block; border: 0 none transparent; margin: 0px; padding: 0px;",allowtransparency:!0,frameborder:0,width:"100%",height:"100%",src:function(t){var e=j.frame;if(!e){e=V("checkout");var n=nt(t);n||(n={},e+="/public"),j.js&&(n.checkout=j.js);var r=[];k(n,function(t,e){r.push(t+"="+e)}),r.length&&(e+="?"+r.join("&"))}return e}(t),class:"razorpay-checkout-frame"};this.el=R(document.createElement("iframe")).attr(e)[0]}return this.el},openRzp:function(t){var e=R(this.el).css({width:"100%",height:"100%"}),n=t.get("parent"),r=R(n||mt);!function(t,e){if(!ct)try{(ct=document.createElement("div")).className="razorpay-loader";var n="margin:-25px 0 0 -25px;height:50px;width:50px;animation:rzp-rot 1s infinite linear;-webkit-animation:rzp-rot 1s infinite linear;border: 1px solid rgba(255, 255, 255, 0.2);border-top-color: rgba(255, 255, 255, 0.7);border-radius: 50%;";n+=e?"margin: 100px auto -150px;border: 1px solid rgba(0, 0, 0, 0.2);border-top-color: rgba(0, 0, 0, 0.7);":"position:absolute;left:50%;top:50%;",ct.setAttribute("style",n),t.append(ct)}catch(t){}}(r,n),t!==this.rzp&&(e.parent()!==r[0]&&r.append(e[0]),this.rzp=t),n?(e.css("minHeight","530px"),this.embedded=!0):(r.css("display","block").reflow(),ht(t.get("theme.backdrop_color")),/^rzp_t/.test(t.get("key"))&&(gt.style.opacity=1),this.setMetaAndOverflow()),this.bind(),this.onload()},makeMessage:function(){var t=this.rzp,e=t.get(),n={integration:I.integration,referer:location.href,options:e,id:t.id};return k(t.modal.options,function(t,n){e["modal."+t]=n}),this.embedded&&(delete e.parent,n.embedded=!0),function(t){var e=t.image;if(e&&b(e)){if(rt.isBase64Image(e))return;if(e.indexOf("http")){var n=location.protocol+"//"+location.hostname+(location.port?":"+location.port:""),r="";"/"!==e[0]&&"/"!==(r+=location.pathname.replace(/[^\/]*$/g,""))[0]&&(r="/"+r),t.image=n+r+e}}}(e),n},close:function(){ht(""),gt.style.opacity=0,function(t){t&&k(t,function(t,e){R(e[0]).remove()});var e=dt();e&&k(e,function(t,e){_("head").appendChild(e)})}(this.$metas),ut.overflow=lt.overflow,this.unbind(),l&&scrollTo(0,lt.oldY)},bind:function(){if(!this.listeners){this.listeners=[];var t={};l&&(t.orientationchange=lt.orientationchange,this.rzp.get("parent")||(t.scroll=lt.scroll,t.resize=lt.resize)),k(t,function(t,e){this.listeners.push(R(window).on(t,e,null,this))},this)}},unbind:function(){var t;k(this.listeners,function(e,n){n.call(t)},t),this.listeners=null},setMetaAndOverflow:function(){var t=_("head");t&&(k(dt(),function(t,e){R(e).remove()}),this.$metas=[R(document.createElement("meta")).attr({name:"viewport",content:"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"}),R(document.createElement("meta")).attr({name:"theme-color",content:this.rzp.get("theme.color")})],k(this.$metas,function(e,n){t.appendChild(n[0])}),lt.overflow=ut.overflow,ut.overflow="hidden",l&&(lt.oldY=pageYOffset,window.scrollTo(0,0),lt.orientationchange.call(this)))},postMessage:function(t){t.id=this.rzp.id,t=C(t),this.el.contentWindow.postMessage(t,"*")},onmessage:function(t){var e;try{e=JSON.parse(t.data)}catch(t){return}var n=e.event,r=this.rzp;t.origin&&"frame"===e.source&&t.source===this.el.contentWindow&&(N("on"+n,this,e=e.data),"dismiss"!==n&&"fault"!==n||G(r,n,e))},onload:function(){this.rzp&&this.postMessage(this.makeMessage())},onfocus:function(){this.isFocused=!0},onblur:function(){this.isFocused=!1,lt.orientationchange.call(this)},onrender:function(){ct&&(R(ct).remove(),ct=null)},onredirect:function(t){rt.redirect(t)},onsubmit:function(t){if("wallet"===t.method){var e=this.rzp;k(e.get("external.wallets"),function(n,r){if(r===t.wallet)try{e.get("external.handler").call(e,t)}catch(t){i("merc",t)}})}},ondismiss:function(t){this.close(),N(this.rzp.get("modal.ondismiss"),0,t)},onhidden:function(){this.afterClose(),N(this.rzp.get("modal.onhidden"))},oncomplete:function(t){this.close();var e=this.rzp;G(e,"checkout_success",t),N(function(){N(this.get("handler"),this,t)},e,null,200)},onpaymenterror:function(t){try{this.rzp.emit("payment.error",t),this.rzp.emit("payment.failed",t)}catch(t){}},onfailure:function(t){this.ondismiss(),alert("Payment Failed.\n"+t.error.description),this.onhidden()},onfault:function(t){this.rzp.close(),alert("Oops! Something went wrong.\n"+t),this.afterClose()},afterClose:function(){mt.style.display="none"}},rt.isCheckout=!0;var pt,mt,vt,gt,yt,bt=document.currentScript||(pt=document.getElementsByTagName("script"))[pt.length-1],wt=function(t){var e=bt.parentNode,n=document.createElement("div");n.innerHTML=A(t),e.appendChild(n),e.onsubmit=o,e.submit()},kt=function(t){var e=document.createElement("input"),n=bt.parentElement;e.type="submit",e.value=t.get("buttontext"),e.className="razorpay-payment-button",n.appendChild(e),n.onsubmit=function(e){e.preventDefault();var r=n.action,i=t.get();if(b(r)&&r&&!i.callback_url&&window.btoa){var o={};k(R(n).find("[name]"),function(t,e){o[e.name]=e.value});var a={url:r};"post"===n.method&&(a.method="post");var s=n.target;s&&b(s)&&(a.target=n.target),Object.keys(o).length&&(a.content=o);try{var c=btoa(C({request:a,options:C(i),back:location.href}));i.callback_url=V("checkout/onyx")+"?data="+c}catch(t){}}return t.open(),!1}};function Mt(t){return yt?yt.openRzp(t):(yt=new ft(t),R(window).on("message",M("onmessage",yt)),mt.appendChild(yt.el)),yt}X.open=function(t){return X(t).open()},Q.postInit=function(){this.modal={options:a},this.get("parent")&&this.open()};var xt=Q.onNew;Q.onNew=function(t,e){"payment.error"===t&&G(this,"event_paymenterror",location.href),y(xt)&&xt.call(this,t,e)},Q.open=W(function(){var t=this.checkoutFrame=Mt(this);return G(this,"open"),t.el.contentWindow||(t.close(),t.afterClose(),alert("This browser is not supported.\nPlease try payment in another browser.")),"-new.js"===bt.src.slice(-7)&&G(this,"oldscript",location.href),this}),Q.close=function(){var t=this.checkoutFrame;t&&t.postMessage({event:"close"})},W(function(){mt=function(){var t=document.createElement("div");t.className="razorpay-container",t.innerHTML="<style>@keyframes rzp-rot{to{transform: rotate(360deg);}}@-webkit-keyframes rzp-rot{to{-webkit-transform: rotate(360deg);}}</style>";var e=t.style;return k({zIndex:1e9,position:"fixed",top:0,display:"none",left:0,height:"100%",width:"100%","-webkit-overflow-scrolling":"touch","-webkit-backface-visibility":"hidden","overflow-y":"visible"},function(t,n){e[t]=n}),U.appendChild(t),t}(),vt=function(){var t=document.createElement("div");t.className="razorpay-backdrop";var e=t.style;return k({"min-height":"100%",transition:"0.3s ease-out","-webkit-transition":"0.3s ease-out","-moz-transition":"0.3s ease-out",position:"fixed",top:0,left:0,width:"100%",height:"100%",filter:"progid:DXImageTransform.Microsoft.gradient(startColorstr=#96000000, endColorstr=#96000000)"},function(t,n){e[t]=n}),mt.appendChild(t),t}(),gt=function(){var t=document.createElement("span");t.target="_blank",t.href="",t.innerHTML="Test Mode";var e=t.style,n="opacity 0.3s ease-in",r="rotate(45deg)";return k({"text-decoration":"none",background:"#D64444",border:"1px dashed white",padding:"3px",opacity:"0","-webkit-transform":r,"-moz-transform":r,"-ms-transform":r,"-o-transform":r,transform:r,"-webkit-transition":n,"-moz-transition":n,transition:n,"font-family":"lato,ubuntu,helvetica,sans-serif",color:"white",position:"absolute",width:"200px","text-align":"center",right:"-50px",top:"50px"},function(t,n){e[t]=n}),vt.appendChild(t),t}(),yt=Mt();try{!function(){var t={};k(bt.attributes,function(e,n){var r=n.name.toLowerCase();if(/^data-/.test(r)){var i=t;r=r.replace(/^data-/,"");var o=n.value;"true"===o?o=!0:"false"===o&&(o=!1),/^notes\./.test(r)&&(t.notes||(t.notes={}),i=t.notes,r=r.replace(/^notes\./,"")),i[r]=o}});var e=t.key;if(e&&e.length>0){bt.parentElement.action,t.handler=wt;var n=X(t);t.parent||kt(n)}}()}catch(t){}})()}()}();