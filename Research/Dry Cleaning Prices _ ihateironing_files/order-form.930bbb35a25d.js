"use strict";window.IronWeb=window.IronWeb||{},function(){var e,f,n=$("#toggle-time-slots"),t=$(".time-slots"),d={},v=t.hasClass("pickup-locked"),a=t.hasClass("dropoff-locked"),s=$("#id_pickup_date"),l=$("#id_pickup_time_slot"),c=$("#id_dropoff_date"),r=$("#id_dropoff_time_slot"),i=$("#id_postcode"),o=i.length?$("#id_country"):null,u=$("#id_address"),h=(e=document.body.getAttribute("data-postcode"))?{postcode:e,country:document.body.getAttribute("data-country"),cleanerId:parseInt(document.body.getAttribute("data-cleaner-id"),10)}:null,p=s.closest("form"),b=function(){var t=$(".js-address-preview"),n=$(".js-address-preview-input"),e=n.val();e&&t.text(e);return{update:function(e){t.text(e).addClass("is-active"),n.val(t.text()),setTimeout(function(){t.removeClass("is-active")},1500)}}}(),g=p.data("timeSlotsUrl"),y=null,w=null,k={},D={autoclose:!0,format:"dd/mm/yyyy",beforeShowDay:function(e){return k[z(e)]!==A}};if(h)f=function(){return{postcode:h.postcode,country:h.country}};else if(u.length)f=function(){var e=u.val();if(e)return{address:e}},u.change(function(){this.value&&_()});else{var m=$(".js-address-search");f=function(){var e=i.val(),t=o.val();if(e&&t)return{postcode:e,country:t}},$.Topic("pca.address").subscribe(function(e){n.length?n.prop("disabled",!1):_().then(function(){null===y&&S()}),m.addClass("is-ready"),b.update(e.Label)}),$.Topic("pca.search").subscribe(function(){t.hasClass("no-hide")||t.hide(),n.prop("disabled",!0),y=null,m.removeClass("is-ready")}),i.val()||n.prop("disabled",!0)}function O(){t.show(),$(window).resize()}function _(){if(!f())return $.when();var t=n.text();return n.text("Loading..."),L().then(function(e){if(y=e.time_slots){!function(e){try{k=e.reduce(function(e,r){var t;return t=void 0===r.spans?A:r.spans.split(" ").map(function(e){var t=e.split("-",2),n=new Date(r.date);H(n,t[0]);var a=new Date(r.date);return H(a,t[1]),[n,a]},[]),e[r.date]=t,e},{})}catch(e){"Raven"in window&&window.Raven.captureException(e)}}(e.holiday_schedule);var t=new Date(e.earliest_pickup);return R(y,t)}}).then(function(e){return n.text(t),function(e){if(!e)return!1;s.data("earliestInfo",e),v||(s.prop("disabled",!1),s.datepicker("setStartDate",e.dateOnly));var t=I(y);s.data("disabledDays",t),s.add(c).datepicker("setDaysOfWeekDisabled",t);var n=s.datepicker("getDate");l.val()?-1<t.indexOf(n.getDay())?s.datepicker("setDate",null):(E(n),l.trigger("change")):s.val()?E(n):p[0].hasAttribute("data-pickup-autoselect-disabled")||s.datepicker("setDate",e.dateOnly);return!0}(e)})}function x(e){c.data("earliestInfo",e);var t,n=I(w),a=c.datepicker("getDate");(c.datepicker("setDaysOfWeekDisabled",n),c.prop("disabled",!1),c.val())?(t=-1<n.indexOf(a.getDay())||e.dateOnly>a?null:a,c.datepicker("setDate",t)):c.datepicker("setDate",e.dateOnly);c.datepicker("setStartDate",e.dateOnly)}function S(){n.prop("disabled",!0).blur(),$(".unserved-area").modal(),i.add(o).add("#id_address_line1").val("")}!function(){void 0!==$.fn.placeholder&&$("input").placeholder();s.prop("disabled",!0).prop("readonly",!0),l.prop("disabled",!0),c.prop("disabled",!0).prop("readonly",!0),r.prop("disabled",!0),l.find("option").each(function(){if(this.value){var e=$(this);d[M(e.text())]=e}}),s.datepicker(D).datepicker("setStartDate",new Date).on("changeDate",function(e){N("pickup changedate"),E(e.date),l.val()?l.trigger("change"):c.datepicker("setDate",null)}),l.change(function(){if(N("pickup time slot change"),this.value){var e,t=s.datepicker("getDate"),n=M(l.find(":selected").text());H(t,n),(e=t,L({pickup_start:e.toISOString(),earliest_only:1}).then(function(e){var r;r=h?[h.cleanerId]:l.find(":selected").data("cleaners"),w={},Object.keys(y).forEach(function(e){var n=w[e]={},a=y[e];Object.keys(a).forEach(function(e){var t=a[e];(function(e,t){for(var n=0;n<e.length;n++)for(var a=0;a<t.length;a++)if(e[n]===t[a])return!0;return!1})(r,t)&&(n[e]=t)})});var t=new Date(e.earliest_dropoff);return R(w,t)})).then(x)}else c.datepicker("setDate",null)}),c.datepicker(D).on("changeDate",function(e){N("dropoff changedate"),(e.date||!l.prop("disabled")&&l.val())&&!a||c.prop("disabled",!0),function(e){if(!e)return r.val(""),r.prop("disabled",!0);var t=j(e,w),n=W(c,e);T(t,r,n),r.trigger("change"),r.prop("disabled",!1),a&&r.prop("disabled",!0)}(e.date)}),r.change(function(){N("dropoff time slot change")})}(),_(),n.click(function(e){null===y?_().then(function(){null===y?(e.preventDefault(),S()):O()}):O()}),n.parents(".form-group").click(function(){n.prop("disabled")&&window.alert("Enter a postcode first.")}),function(){if(!window.chrome||p[0].getAttribute("action"))return;var e="/order/search/";p[0].action=e,p[0].addEventListener("submit",function(){-1!==this.action.indexOf(e)&&this.removeAttribute("action")})}(),p.submit(function(){p.find("button[type=submit]").prop("disabled",!0).addClass("disabled"),v&&(s.prop("disabled",!1),l.prop("disabled",!1));var e=function(){try{if("ga"in window){var e=window.ga.getAll();if(e.length)return e[0].get("clientId")}}catch(e){}return null}();e&&$('<input type="hidden" name="ga_client_id">').prop("value",e).appendTo(p)});var A=!0;function I(n){return Object.keys(n).reduce(function(e,t){return Object.keys(n[t]).length||e.push(t%7),e},[])}function C(e){return function(t){return e.every(function(e){return t>=e[0]&&t<e[1]})}}function j(a,e){var r=e[V(a.getDay())],t=k[z(a)];if(!Array.isArray(t))return r;var i=C(t);return Object.keys(r).reduce(function(e,t){var n=new Date(a.valueOf());return H(n,t),i(n)&&(e[t]=r[t]),e},{})}function E(e,t,n){var a=t||l,r=n||y;if(!e)return a.val(""),void(t||(a.prop("disabled",!0),c.datepicker("setDate",null)));var i,o=j(e,r);v||(i=W(s,e)),T(o,a,i),v||t||a.prop("disabled",!1)}function T(n,e,a){var r=$(e[0].options[0]),i=e.val(),o=!1;Object.keys(n).forEach(function(e){if(!(a&&e<a)){var t=d[e].clone();t.data("cleaners",n[e]),r=r.add(t),t[0].value===i&&(o=!0)}}),e.empty().append(r),e.val(o?i:"")}function W(e,t){var n=e.data("earliestInfo");return U(t).valueOf()===n.dateOnlyVal?n.timeSlot:null}function L(e){var t=f();return t?(e&&$.extend(t,e),$.get(g,t)):$.when()}function R(e,t){var n=new Date(t.valueOf()),a=n.valueOf();n.setMinutes(0,0,0);for(var r=V(n.getDay()),i=0;i<8;i++){var o=new Date(a);o.setDate(o.getDate()+i);var d=k[z(o)];if(d!==A){var s=Array.isArray(d)?C(d):null,l=Object.keys(e[r]);l.sort();for(var c=0,u=l.length;c<u;c++)if(H(o,l[c]),t<=o&&(null===s||s(o))){var p=U(o);return{date:o,dateOnly:p,dateOnlyVal:p.valueOf(),timeSlot:l[c]}}r=r%7+1}}throw window.intercomSettings&&window.Raven.setUserContext({user_id:window.intercomSettings.user_id||null}),window.Raven.setExtraContext({timeSlots:e,isPickupTimeSlots:y===e,startDate:t,lookup:f(),forcedData:h,pickupLocked:v}),new Error("No time slot available.")}function M(e){return e.split(" - ")[0]}function H(e,t){var n=t.split(":");e.setHours(n[0],void 0===n[1]?0:n[1],0,0)}function U(e){var t=new Date(e.getTime());return t.setHours(0,0,0,0),t}function V(e){return e||7}function z(e){return e.toISOString().slice(0,10)}function N(e){window.console&&console.log(e)}}(),function(){if(window.IronWeb.initCreateAddressModal){var n=$("#id_address");if(n.length){var a=$('<option value="">Add new address</option>');n.append(a);var e=window.IronWeb.initCreateAddressModal(function(e){var t='<option value="'+e.id+'">'+e.choice_label+"</option>";a.before(t),n.val(e.id)});n.change(function(){""===this.value&&(e.modal(),this.selectedIndex=0)})}}}();