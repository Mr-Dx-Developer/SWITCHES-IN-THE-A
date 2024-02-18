const bu=function(){const e=document.createElement("link").relList;if(e&&e.supports&&e.supports("modulepreload"))return;for(const i of document.querySelectorAll('link[rel="modulepreload"]'))n(i);new MutationObserver(i=>{for(const s of i)if(s.type==="childList")for(const a of s.addedNodes)a.tagName==="LINK"&&a.rel==="modulepreload"&&n(a)}).observe(document,{childList:!0,subtree:!0});function t(i){const s={};return i.integrity&&(s.integrity=i.integrity),i.referrerpolicy&&(s.referrerPolicy=i.referrerpolicy),i.crossorigin==="use-credentials"?s.credentials="include":i.crossorigin==="anonymous"?s.credentials="omit":s.credentials="same-origin",s}function n(i){if(i.ep)return;i.ep=!0;const s=t(i);fetch(i.href,s)}};bu();function _e(){}const Ac=r=>r;function vu(r,e){for(const t in e)r[t]=e[t];return r}function Dc(r){return r()}function Aa(){return Object.create(null)}function Mt(r){r.forEach(Dc)}function ga(r){return typeof r=="function"}function Ge(r,e){return r!=r?e==e:r!==e||r&&typeof r=="object"||typeof r=="function"}function yu(r){return Object.keys(r).length===0}function wu(r,...e){if(r==null)return _e;const t=r.subscribe(...e);return t.unsubscribe?()=>t.unsubscribe():t}function ut(r,e,t){r.$$.on_destroy.push(wu(e,t))}function is(r){return r??""}function Mu(r,e,t){return r.set(t),e}const kc=typeof window<"u";let Rc=kc?()=>window.performance.now():()=>Date.now(),ba=kc?r=>requestAnimationFrame(r):_e;const Ii=new Set;function Ic(r){Ii.forEach(e=>{e.c(r)||(Ii.delete(e),e.f())}),Ii.size!==0&&ba(Ic)}function Nc(r){let e;return Ii.size===0&&ba(Ic),{promise:new Promise(t=>{Ii.add(e={c:r,f:t})}),abort(){Ii.delete(e)}}}function C(r,e){r.appendChild(e)}function zc(r){if(!r)return document;const e=r.getRootNode?r.getRootNode():r.ownerDocument;return e&&e.host?e:r.ownerDocument}function xu(r){const e=z("style");return Su(zc(r),e),e.sheet}function Su(r,e){C(r.head||r,e)}function B(r,e,t){r.insertBefore(e,t||null)}function U(r){r.parentNode.removeChild(r)}function Lt(r,e){for(let t=0;t<r.length;t+=1)r[t]&&r[t].d(e)}function z(r){return document.createElement(r)}function Ni(r){return document.createElementNS("http://www.w3.org/2000/svg",r)}function J(r){return document.createTextNode(r)}function K(){return J(" ")}function Dt(){return J("")}function ze(r,e,t,n){return r.addEventListener(e,t,n),()=>r.removeEventListener(e,t,n)}function L(r,e,t){t==null?r.removeAttribute(e):r.getAttribute(e)!==t&&r.setAttribute(e,t)}function Fc(r){return r===""?null:+r}function Cu(r){return Array.from(r.childNodes)}function he(r,e){e=""+e,r.wholeText!==e&&(r.data=e)}function zt(r,e){r.value=e??""}function Bn(r,e,t,n){t===null?r.style.removeProperty(e):r.style.setProperty(e,t,n?"important":"")}function Da(r,e){for(let t=0;t<r.options.length;t+=1){const n=r.options[t];if(n.__value===e){n.selected=!0;return}}r.selectedIndex=-1}function Tu(r){const e=r.querySelector(":checked")||r.options[0];return e&&e.__value}function Oc(r,e,{bubbles:t=!1,cancelable:n=!1}={}){const i=document.createEvent("CustomEvent");return i.initCustomEvent(r,t,n,e),i}const rs=new Map;let ss=0;function Eu(r){let e=5381,t=r.length;for(;t--;)e=(e<<5)-e^r.charCodeAt(t);return e>>>0}function Lu(r,e){const t={stylesheet:xu(e),rules:{}};return rs.set(r,t),t}function sa(r,e,t,n,i,s,a,o=0){const l=16.666/n;let c=`{
`;for(let _=0;_<=1;_+=l){const g=e+(t-e)*s(_);c+=_*100+`%{${a(g,1-g)}}
`}const u=c+`100% {${a(t,1-t)}}
}`,f=`__svelte_${Eu(u)}_${o}`,d=zc(r),{stylesheet:m,rules:h}=rs.get(d)||Lu(d,r);h[f]||(h[f]=!0,m.insertRule(`@keyframes ${f} ${u}`,m.cssRules.length));const p=r.style.animation||"";return r.style.animation=`${p?`${p}, `:""}${f} ${n}ms linear ${i}ms 1 both`,ss+=1,f}function Uc(r,e){const t=(r.style.animation||"").split(", "),n=t.filter(e?s=>s.indexOf(e)<0:s=>s.indexOf("__svelte")===-1),i=t.length-n.length;i&&(r.style.animation=n.join(", "),ss-=i,ss||Pu())}function Pu(){ba(()=>{ss||(rs.forEach(r=>{const{stylesheet:e}=r;let t=e.cssRules.length;for(;t--;)e.deleteRule(t);r.rules={}}),rs.clear())})}function wr(r,e,t,n){if(!e)return _e;const i=r.getBoundingClientRect();if(e.left===i.left&&e.right===i.right&&e.top===i.top&&e.bottom===i.bottom)return _e;const{delay:s=0,duration:a=300,easing:o=Ac,start:l=Rc()+s,end:c=l+a,tick:u=_e,css:f}=t(r,{from:e,to:i},n);let d=!0,m=!1,h;function p(){f&&(h=sa(r,0,1,a,s,o,f)),s||(m=!0)}function _(){f&&Uc(r,h),d=!1}return Nc(g=>{if(!m&&g>=l&&(m=!0),m&&g>=c&&(u(1,0),_()),!d)return!1;if(m){const v=g-l,b=0+1*o(v/a);u(b,1-b)}return!0}),p(),u(0,1),_}function Mr(r){const e=getComputedStyle(r);if(e.position!=="absolute"&&e.position!=="fixed"){const{width:t,height:n}=e,i=r.getBoundingClientRect();r.style.position="absolute",r.style.width=t,r.style.height=n,Au(r,i)}}function Au(r,e){const t=r.getBoundingClientRect();if(e.left!==t.left||e.top!==t.top){const n=getComputedStyle(r),i=n.transform==="none"?"":n.transform;r.style.transform=`${i} translate(${e.left-t.left}px, ${e.top-t.top}px)`}}let mr;function fr(r){mr=r}function va(){if(!mr)throw new Error("Function called outside component initialization");return mr}function lt(r){va().$$.on_mount.push(r)}function Du(r){va().$$.on_destroy.push(r)}function ln(){const r=va();return(e,t,{cancelable:n=!1}={})=>{const i=r.$$.callbacks[e];if(i){const s=Oc(e,t,{cancelable:n});return i.slice().forEach(a=>{a.call(r,s)}),!s.defaultPrevented}return!0}}const sr=[],ka=[],$r=[],Ra=[],ku=Promise.resolve();let aa=!1;function Ru(){aa||(aa=!0,ku.then(Bc))}function fi(r){$r.push(r)}const Ss=new Set;let Lr=0;function Bc(){const r=mr;do{for(;Lr<sr.length;){const e=sr[Lr];Lr++,fr(e),Iu(e.$$)}for(fr(null),sr.length=0,Lr=0;ka.length;)ka.pop()();for(let e=0;e<$r.length;e+=1){const t=$r[e];Ss.has(t)||(Ss.add(t),t())}$r.length=0}while(sr.length);for(;Ra.length;)Ra.pop()();aa=!1,Ss.clear(),fr(r)}function Iu(r){if(r.fragment!==null){r.update(),Mt(r.before_update);const e=r.dirty;r.dirty=[-1],r.fragment&&r.fragment.p(r.ctx,e),r.after_update.forEach(fi)}}let Zi;function Nu(){return Zi||(Zi=Promise.resolve(),Zi.then(()=>{Zi=null})),Zi}function Cs(r,e,t){r.dispatchEvent(Oc(`${e?"intro":"outro"}${t}`))}const es=new Set;let Nn;function Pe(){Nn={r:0,c:[],p:Nn}}function Ae(){Nn.r||Mt(Nn.c),Nn=Nn.p}function A(r,e){r&&r.i&&(es.delete(r),r.i(e))}function I(r,e,t,n){if(r&&r.o){if(es.has(r))return;es.add(r),Nn.c.push(()=>{es.delete(r),n&&(t&&r.d(1),n())}),r.o(e)}else n&&n()}const zu={duration:0};function as(r,e,t,n){let i=e(r,t),s=n?0:1,a=null,o=null,l=null;function c(){l&&Uc(r,l)}function u(d,m){const h=d.b-s;return m*=Math.abs(h),{a:s,b:d.b,d:h,duration:m,start:d.start,end:d.start+m,group:d.group}}function f(d){const{delay:m=0,duration:h=300,easing:p=Ac,tick:_=_e,css:g}=i||zu,v={start:Rc()+m,b:d};d||(v.group=Nn,Nn.r+=1),a||o?o=v:(g&&(c(),l=sa(r,s,d,h,m,p,g)),d&&_(0,1),a=u(v,h),fi(()=>Cs(r,d,"start")),Nc(b=>{if(o&&b>o.start&&(a=u(o,h),o=null,Cs(r,a.b,"start"),g&&(c(),l=sa(r,s,a.b,a.duration,0,p,i.css))),a){if(b>=a.end)_(s=a.b,1-s),Cs(r,a.b,"end"),o||(a.b?c():--a.group.r||Mt(a.group.c)),a=null;else if(b>=a.start){const w=b-a.start;s=a.a+a.d*p(w/a.duration),_(s,1-s)}}return!!(a||o)}))}return{run(d){ga(i)?Nu().then(()=>{i=i(),f(d)}):f(d)},end(){c(),a=o=null}}}function Fu(r,e){r.d(1),e.delete(r.key)}function Ou(r,e){I(r,1,1,()=>{e.delete(r.key)})}function Uu(r,e){r.f(),Fu(r,e)}function hs(r,e){r.f(),Ou(r,e)}function xr(r,e,t,n,i,s,a,o,l,c,u,f){let d=r.length,m=s.length,h=d;const p={};for(;h--;)p[r[h].key]=h;const _=[],g=new Map,v=new Map;for(h=m;h--;){const x=f(i,s,h),E=t(x);let M=a.get(E);M?n&&M.p(x,e):(M=c(E,x),M.c()),g.set(E,_[h]=M),E in p&&v.set(E,Math.abs(h-p[E]))}const b=new Set,w=new Set;function y(x){A(x,1),x.m(o,u),a.set(x.key,x),u=x.first,m--}for(;d&&m;){const x=_[m-1],E=r[d-1],M=x.key,S=E.key;x===E?(u=x.first,d--,m--):g.has(S)?!a.has(M)||b.has(M)?y(x):w.has(S)?d--:v.get(M)>v.get(S)?(w.add(M),y(x)):(b.add(S),d--):(l(E,a),d--)}for(;d--;){const x=r[d];g.has(x.key)||l(x,a)}for(;m;)y(_[m-1]);return _}function Bu(r,e){const t={},n={},i={$$scope:1};let s=r.length;for(;s--;){const a=r[s],o=e[s];if(o){for(const l in a)l in o||(n[l]=1);for(const l in o)i[l]||(t[l]=o[l],i[l]=1);r[s]=o}else for(const l in a)i[l]=1}for(const a in n)a in t||(t[a]=void 0);return t}function Vu(r){return typeof r=="object"&&r!==null?r:{}}function ee(r){r&&r.c()}function Q(r,e,t,n){const{fragment:i,on_mount:s,on_destroy:a,after_update:o}=r.$$;i&&i.m(e,t),n||fi(()=>{const l=s.map(Dc).filter(ga);a?a.push(...l):Mt(l),r.$$.on_mount=[]}),o.forEach(fi)}function $(r,e){const t=r.$$;t.fragment!==null&&(Mt(t.on_destroy),t.fragment&&t.fragment.d(e),t.on_destroy=t.fragment=null,t.ctx=[])}function Gu(r,e){r.$$.dirty[0]===-1&&(sr.push(r),Ru(),r.$$.dirty.fill(0)),r.$$.dirty[e/31|0]|=1<<e%31}function He(r,e,t,n,i,s,a,o=[-1]){const l=mr;fr(r);const c=r.$$={fragment:null,ctx:null,props:s,update:_e,not_equal:i,bound:Aa(),on_mount:[],on_destroy:[],on_disconnect:[],before_update:[],after_update:[],context:new Map(e.context||(l?l.$$.context:[])),callbacks:Aa(),dirty:o,skip_bound:!1,root:e.target||l.$$.root};a&&a(c.root);let u=!1;if(c.ctx=t?t(r,e.props||{},(f,d,...m)=>{const h=m.length?m[0]:d;return c.ctx&&i(c.ctx[f],c.ctx[f]=h)&&(!c.skip_bound&&c.bound[f]&&c.bound[f](h),u&&Gu(r,f)),d}):[],c.update(),u=!0,Mt(c.before_update),c.fragment=n?n(c.ctx):!1,e.target){if(e.hydrate){const f=Cu(e.target);c.fragment&&c.fragment.l(f),f.forEach(U)}else c.fragment&&c.fragment.c();e.intro&&A(r.$$.fragment),Q(r,e.target,e.anchor,e.customElement),Bc()}fr(l)}class We{$destroy(){$(this,1),this.$destroy=_e}$on(e,t){const n=this.$$.callbacks[e]||(this.$$.callbacks[e]=[]);return n.push(t),()=>{const i=n.indexOf(t);i!==-1&&n.splice(i,1)}}$set(e){this.$$set&&!yu(e)&&(this.$$.skip_bound=!0,this.$$set(e),this.$$.skip_bound=!1)}}const gi=[];function Ia(r,e){return{subscribe:Fn(r,e).subscribe}}function Fn(r,e=_e){let t;const n=new Set;function i(o){if(Ge(r,o)&&(r=o,t)){const l=!gi.length;for(const c of n)c[1](),gi.push(c,r);if(l){for(let c=0;c<gi.length;c+=2)gi[c][0](gi[c+1]);gi.length=0}}}function s(o){i(o(r))}function a(o,l=_e){const c=[o,l];return n.add(c),n.size===1&&(t=e(i)||_e),o(r),()=>{n.delete(c),n.size===0&&(t(),t=null)}}return{set:i,update:s,subscribe:a}}async function De(r,e={}){const t={method:"post",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(e)},n="snipe-menu";try{return await(await fetch(`https://${n}/${r}`,t)).json()}catch{}}const Hu=()=>{const r={showReport:Fn(!1),reportData:Fn({})};return{...r,...{closeReportForm(t=null){r.showReport.set(!1),De("closeReport",t)},showReportForm(t){r.showReport.set(!0),r.reportData.set(t)}}}},_r=Hu(),Wu=await fetch("config.json").then(r=>r.json()).catch(r=>console.log(r)),Xu=await fetch(`locales/${Wu.lang}.json`).then(r=>r.json()).catch(r=>console.log(r)),ju=()=>{new Date().getFullYear();const r={show:Fn(!1),data:Fn({}),locales:Ia(Xu),isDev:Ia(!1)},e={closeForm(t=null){r.show.set(!1),De("closeMenu",t)},toggleFocus(t=null){De("toggleFocus",t)},showForm(t){r.show.set(!0),r.data.set(t)},handleKeyUp(t){t.key=="Escape"&&(e.closeForm(),_r.closeReportForm()),t.key=="Alt"&&e.toggleFocus()}};return{...r,...e}},vt=ju(),qu=()=>{const r={unreadReport:Fn(!1)};return{...r,...{showUnreadReport(){r.unreadReport.set(!0)},hideUnreadReport(t=null){r.unreadReport.set(!1)}}}},oa=qu(),Yu=()=>{const r={showObject:Fn(!1),gizmoData:Fn({}),gizmoCamData:Fn({})};return{...r,...{closeGizmoObject(t=null){r.showObject.set(!1)},showGizmoObject(t){t.handle&&r.showObject.set(!0),r.gizmoData.set(t)},getCamCoords(t){r.gizmoCamData.set(t)}}}},dr=Yu();function Zu(r){const e=document.createElement("textarea");e.value=r,document.body.appendChild(e),e.select(),document.execCommand("copy"),document.body.removeChild(e)}function Ku(){function r(e){switch(e.data.action){case"openMenu":vt.showForm(e.data.data);break;case"forceClose":vt.closeForm();break;case"copytoclipboard":Zu(e.data.data);break;case"openUserReportMenu":_r.showReportForm(e.data.data);break;case"forceCloseUserReportMenu":_r.closeReportForm();break;case"showUnreadReport":oa.showUnreadReport();break;case"hideUnreadReport":oa.hideUnreadReport();break;case"showGizmoObject":dr.showGizmoObject(e.data.data);break;case"hideGizmoObject":dr.closeGizmoObject();break;case"gizmo-cam-cords":dr.getCamCoords(e.data.data);break}}lt(()=>window.addEventListener("message",r)),Du(()=>window.removeEventListener("message",r))}const Pr=parseFloat;function os(r,e=";"){let t;if(Array.isArray(r))t=r.filter(n=>n);else{t=[];for(const n in r)r[n]&&t.push(`${n}:${r[n]}`)}return t.join(e)}function Ju(r,e,t,n){let i,s;const a="1em";let o,l,c,u="-.125em";const f="visible";return n&&(c="center",s="1.25em"),t&&(i=t),e&&(e=="lg"?(l="1.33333em",o=".75em",u="-.225em"):e=="xs"?l=".75em":e=="sm"?l=".875em":l=e.replace("x","em")),os([os({float:i,width:s,height:a,"line-height":o,"font-size":l,"text-align":c,"vertical-align":u,"transform-origin":"center",overflow:f}),r])}function Qu(r,e,t,n,i,s=1,a="",o=""){let l=1,c=1;return i&&(i=="horizontal"?l=-1:i=="vertical"?c=-1:l=c=-1),os([`translate(${Pr(e)*s}${a},${Pr(t)*s}${a})`,`scale(${l*Pr(r)},${c*Pr(r)})`,n&&`rotate(${n}${o})`]," ")}function Na(r){let e,t,n,i,s,a,o;function l(f,d){return typeof f[7][4]=="string"?ef:$u}let c=l(r),u=c(r);return{c(){e=Ni("svg"),t=Ni("g"),n=Ni("g"),u.c(),L(n,"transform",r[10]),L(t,"transform",i=`translate(${r[7][0]/2} ${r[7][1]/2})`),L(t,"transform-origin",s=`${r[7][0]/4} 0`),L(e,"id",r[0]),L(e,"class",a=is(r[8])+" svelte-1cj2gr0"),L(e,"style",r[9]),L(e,"viewBox",o=`0 0 ${r[7][0]} ${r[7][1]}`),L(e,"aria-hidden","true"),L(e,"role","img"),L(e,"xmlns","http://www.w3.org/2000/svg")},m(f,d){B(f,e,d),C(e,t),C(t,n),u.m(n,null)},p(f,d){c===(c=l(f))&&u?u.p(f,d):(u.d(1),u=c(f),u&&(u.c(),u.m(n,null))),d&1024&&L(n,"transform",f[10]),d&128&&i!==(i=`translate(${f[7][0]/2} ${f[7][1]/2})`)&&L(t,"transform",i),d&128&&s!==(s=`${f[7][0]/4} 0`)&&L(t,"transform-origin",s),d&1&&L(e,"id",f[0]),d&256&&a!==(a=is(f[8])+" svelte-1cj2gr0")&&L(e,"class",a),d&512&&L(e,"style",f[9]),d&128&&o!==(o=`0 0 ${f[7][0]} ${f[7][1]}`)&&L(e,"viewBox",o)},d(f){f&&U(e),u.d()}}}function $u(r){let e,t,n,i,s,a,o,l,c,u;return{c(){e=Ni("path"),a=Ni("path"),L(e,"d",t=r[7][4][0]),L(e,"fill",n=r[3]||r[1]||"currentColor"),L(e,"fill-opacity",i=r[6]!=!1?r[4]:r[5]),L(e,"transform",s=`translate(${r[7][0]/-2} ${r[7][1]/-2})`),L(a,"d",o=r[7][4][1]),L(a,"fill",l=r[2]||r[1]||"currentColor"),L(a,"fill-opacity",c=r[6]!=!1?r[5]:r[4]),L(a,"transform",u=`translate(${r[7][0]/-2} ${r[7][1]/-2})`)},m(f,d){B(f,e,d),B(f,a,d)},p(f,d){d&128&&t!==(t=f[7][4][0])&&L(e,"d",t),d&10&&n!==(n=f[3]||f[1]||"currentColor")&&L(e,"fill",n),d&112&&i!==(i=f[6]!=!1?f[4]:f[5])&&L(e,"fill-opacity",i),d&128&&s!==(s=`translate(${f[7][0]/-2} ${f[7][1]/-2})`)&&L(e,"transform",s),d&128&&o!==(o=f[7][4][1])&&L(a,"d",o),d&6&&l!==(l=f[2]||f[1]||"currentColor")&&L(a,"fill",l),d&112&&c!==(c=f[6]!=!1?f[5]:f[4])&&L(a,"fill-opacity",c),d&128&&u!==(u=`translate(${f[7][0]/-2} ${f[7][1]/-2})`)&&L(a,"transform",u)},d(f){f&&U(e),f&&U(a)}}}function ef(r){let e,t,n,i;return{c(){e=Ni("path"),L(e,"d",t=r[7][4]),L(e,"fill",n=r[1]||r[2]||"currentColor"),L(e,"transform",i=`translate(${r[7][0]/-2} ${r[7][1]/-2})`)},m(s,a){B(s,e,a)},p(s,a){a&128&&t!==(t=s[7][4])&&L(e,"d",t),a&6&&n!==(n=s[1]||s[2]||"currentColor")&&L(e,"fill",n),a&128&&i!==(i=`translate(${s[7][0]/-2} ${s[7][1]/-2})`)&&L(e,"transform",i)},d(s){s&&U(e)}}}function tf(r){let e,t=r[7][4]&&Na(r);return{c(){t&&t.c(),e=Dt()},m(n,i){t&&t.m(n,i),B(n,e,i)},p(n,[i]){n[7][4]?t?t.p(n,i):(t=Na(n),t.c(),t.m(e.parentNode,e)):t&&(t.d(1),t=null)},i:_e,o:_e,d(n){t&&t.d(n),n&&U(e)}}}function nf(r,e,t){let{class:n=""}=e,{id:i=""}=e,{style:s=""}=e,{icon:a}=e,{size:o=""}=e,{color:l=""}=e,{fw:c=!1}=e,{pull:u=""}=e,{scale:f=1}=e,{translateX:d=0}=e,{translateY:m=0}=e,{rotate:h=""}=e,{flip:p=!1}=e,{spin:_=!1}=e,{pulse:g=!1}=e,{primaryColor:v=""}=e,{secondaryColor:b=""}=e,{primaryOpacity:w=1}=e,{secondaryOpacity:y=.4}=e,{swapOpacity:x=!1}=e,E,M,S,P;return r.$$set=k=>{"class"in k&&t(11,n=k.class),"id"in k&&t(0,i=k.id),"style"in k&&t(12,s=k.style),"icon"in k&&t(13,a=k.icon),"size"in k&&t(14,o=k.size),"color"in k&&t(1,l=k.color),"fw"in k&&t(15,c=k.fw),"pull"in k&&t(16,u=k.pull),"scale"in k&&t(17,f=k.scale),"translateX"in k&&t(18,d=k.translateX),"translateY"in k&&t(19,m=k.translateY),"rotate"in k&&t(20,h=k.rotate),"flip"in k&&t(21,p=k.flip),"spin"in k&&t(22,_=k.spin),"pulse"in k&&t(23,g=k.pulse),"primaryColor"in k&&t(2,v=k.primaryColor),"secondaryColor"in k&&t(3,b=k.secondaryColor),"primaryOpacity"in k&&t(4,w=k.primaryOpacity),"secondaryOpacity"in k&&t(5,y=k.secondaryOpacity),"swapOpacity"in k&&t(6,x=k.swapOpacity)},r.$$.update=()=>{r.$$.dirty&8192&&t(7,E=a&&a.icon||[0,0,"",[],""]),r.$$.dirty&12584960&&t(8,M=os([n,"svelte-fa",_&&"spin",g&&"pulse"]," ")),r.$$.dirty&118784&&t(9,S=Ju(s,o,u,c)),r.$$.dirty&4063232&&t(10,P=Qu(f,d,m,h,p,512))},[i,l,v,b,w,y,x,E,M,S,P,n,s,a,o,c,u,f,d,m,h,p,_,g]}class Ft extends We{constructor(e){super(),He(this,e,nf,tf,Ge,{class:11,id:0,style:12,icon:13,size:14,color:1,fw:15,pull:16,scale:17,translateX:18,translateY:19,rotate:20,flip:21,spin:22,pulse:23,primaryColor:2,secondaryColor:3,primaryOpacity:4,secondaryOpacity:5,swapOpacity:6})}}function Vc(r){const e=r-1;return e*e*e+1}function Sr(r,{from:e,to:t},n={}){const i=getComputedStyle(r),s=i.transform==="none"?"":i.transform,[a,o]=i.transformOrigin.split(" ").map(parseFloat),l=e.left+e.width*a/t.width-(t.left+a),c=e.top+e.height*o/t.height-(t.top+o),{delay:u=0,duration:f=m=>Math.sqrt(m)*120,easing:d=Vc}=n;return{delay:u,duration:ga(f)?f(Math.sqrt(l*l+c*c)):f,easing:d,css:(m,h)=>{const p=h*l,_=h*c,g=m+h*e.width/t.width,v=m+h*e.height/t.height;return`transform: ${s} translate(${p}px, ${_}px) scale(${g}, ${v});`}}}/*!
 * Font Awesome Free 6.1.2 by @fontawesome - https://fontawesome.com
 * License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License)
 * Copyright 2022 Fonticons, Inc.
 */var rf={prefix:"fas",iconName:"arrow-right-to-bracket",icon:[512,512,["sign-in"],"f090","M416 32h-64c-17.67 0-32 14.33-32 32s14.33 32 32 32h64c17.67 0 32 14.33 32 32v256c0 17.67-14.33 32-32 32h-64c-17.67 0-32 14.33-32 32s14.33 32 32 32h64c53.02 0 96-42.98 96-96V128C512 74.98 469 32 416 32zM342.6 233.4l-128-128c-12.51-12.51-32.76-12.49-45.25 0c-12.5 12.5-12.5 32.75 0 45.25L242.8 224H32C14.31 224 0 238.3 0 256s14.31 32 32 32h210.8l-73.38 73.38c-12.5 12.5-12.5 32.75 0 45.25s32.75 12.5 45.25 0l128-128C355.1 266.1 355.1 245.9 342.6 233.4z"]},sf={prefix:"fas",iconName:"arrow-rotate-right",icon:[512,512,[8635,"arrow-right-rotate","arrow-rotate-forward","redo"],"f01e","M496 48V192c0 17.69-14.31 32-32 32H320c-17.69 0-32-14.31-32-32s14.31-32 32-32h63.39c-29.97-39.7-77.25-63.78-127.6-63.78C167.7 96.22 96 167.9 96 256s71.69 159.8 159.8 159.8c34.88 0 68.03-11.03 95.88-31.94c14.22-10.53 34.22-7.75 44.81 6.375c10.59 14.16 7.75 34.22-6.375 44.81c-39.03 29.28-85.36 44.86-134.2 44.86C132.5 479.9 32 379.4 32 256s100.5-223.9 223.9-223.9c69.15 0 134 32.47 176.1 86.12V48c0-17.69 14.31-32 32-32S496 30.31 496 48z"]},af=sf,of={prefix:"fas",iconName:"arrows-rotate",icon:[512,512,[128472,"refresh","sync"],"f021","M464 16c-17.67 0-32 14.31-32 32v74.09C392.1 66.52 327.4 32 256 32C161.5 32 78.59 92.34 49.58 182.2c-5.438 16.81 3.797 34.88 20.61 40.28c16.89 5.5 34.88-3.812 40.3-20.59C130.9 138.5 189.4 96 256 96c50.5 0 96.26 24.55 124.4 64H336c-17.67 0-32 14.31-32 32s14.33 32 32 32h128c17.67 0 32-14.31 32-32V48C496 30.31 481.7 16 464 16zM441.8 289.6c-16.92-5.438-34.88 3.812-40.3 20.59C381.1 373.5 322.6 416 256 416c-50.5 0-96.25-24.55-124.4-64H176c17.67 0 32-14.31 32-32s-14.33-32-32-32h-128c-17.67 0-32 14.31-32 32v144c0 17.69 14.33 32 32 32s32-14.31 32-32v-74.09C119.9 445.5 184.6 480 255.1 480c94.45 0 177.4-60.34 206.4-150.2C467.9 313 458.6 294.1 441.8 289.6z"]},lf=of,cf={prefix:"fas",iconName:"bug",icon:[512,512,[],"f188","M352 96V99.56C352 115.3 339.3 128 323.6 128H188.4C172.7 128 159.1 115.3 159.1 99.56V96C159.1 42.98 202.1 0 255.1 0C309 0 352 42.98 352 96zM41.37 105.4C53.87 92.88 74.13 92.88 86.63 105.4L150.6 169.4C151.3 170 151.9 170.7 152.5 171.4C166.8 164.1 182.9 160 199.1 160H312C329.1 160 345.2 164.1 359.5 171.4C360.1 170.7 360.7 170 361.4 169.4L425.4 105.4C437.9 92.88 458.1 92.88 470.6 105.4C483.1 117.9 483.1 138.1 470.6 150.6L406.6 214.6C405.1 215.3 405.3 215.9 404.6 216.5C410.7 228.5 414.6 241.9 415.7 256H480C497.7 256 512 270.3 512 288C512 305.7 497.7 320 480 320H416C416 344.6 410.5 367.8 400.6 388.6C402.7 389.9 404.8 391.5 406.6 393.4L470.6 457.4C483.1 469.9 483.1 490.1 470.6 502.6C458.1 515.1 437.9 515.1 425.4 502.6L362.3 439.6C337.8 461.4 306.5 475.8 272 479.2V240C272 231.2 264.8 224 255.1 224C247.2 224 239.1 231.2 239.1 240V479.2C205.5 475.8 174.2 461.4 149.7 439.6L86.63 502.6C74.13 515.1 53.87 515.1 41.37 502.6C28.88 490.1 28.88 469.9 41.37 457.4L105.4 393.4C107.2 391.5 109.3 389.9 111.4 388.6C101.5 367.8 96 344.6 96 320H32C14.33 320 0 305.7 0 288C0 270.3 14.33 256 32 256H96.3C97.38 241.9 101.3 228.5 107.4 216.5C106.7 215.9 106 215.3 105.4 214.6L41.37 150.6C28.88 138.1 28.88 117.9 41.37 105.4H41.37z"]},gr={prefix:"fas",iconName:"chevron-down",icon:[448,512,[],"f078","M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"]},za={prefix:"fas",iconName:"chevron-left",icon:[320,512,[9001],"f053","M224 480c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L77.25 256l169.4 169.4c12.5 12.5 12.5 32.75 0 45.25C240.4 476.9 232.2 480 224 480z"]},Fa={prefix:"fas",iconName:"chevron-right",icon:[320,512,[9002],"f054","M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z"]},ls={prefix:"fas",iconName:"chevron-up",icon:[448,512,[],"f077","M416 352c-8.188 0-16.38-3.125-22.62-9.375L224 173.3l-169.4 169.4c-12.5 12.5-32.75 12.5-45.25 0s-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25C432.4 348.9 424.2 352 416 352z"]},uf={prefix:"fas",iconName:"circle-xmark",icon:[512,512,[61532,"times-circle","xmark-circle"],"f057","M0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256zM175 208.1L222.1 255.1L175 303C165.7 312.4 165.7 327.6 175 336.1C184.4 346.3 199.6 346.3 208.1 336.1L255.1 289.9L303 336.1C312.4 346.3 327.6 346.3 336.1 336.1C346.3 327.6 346.3 312.4 336.1 303L289.9 255.1L336.1 208.1C346.3 199.6 346.3 184.4 336.1 175C327.6 165.7 312.4 165.7 303 175L255.1 222.1L208.1 175C199.6 165.7 184.4 165.7 175 175C165.7 184.4 165.7 199.6 175 208.1V208.1z"]},ff=uf,df={prefix:"fas",iconName:"clipboard",icon:[384,512,[128203],"f328","M336 64h-53.88C268.9 26.8 233.7 0 192 0S115.1 26.8 101.9 64H48C21.5 64 0 85.48 0 112v352C0 490.5 21.5 512 48 512h288c26.5 0 48-21.48 48-48v-352C384 85.48 362.5 64 336 64zM192 64c17.67 0 32 14.33 32 32c0 17.67-14.33 32-32 32S160 113.7 160 96C160 78.33 174.3 64 192 64zM272 224h-160C103.2 224 96 216.8 96 208C96 199.2 103.2 192 112 192h160C280.8 192 288 199.2 288 208S280.8 224 272 224z"]},hf={prefix:"fas",iconName:"comment-dots",icon:[512,512,[62075,128172,"commenting"],"f4ad","M256 31.1c-141.4 0-255.1 93.12-255.1 208c0 49.62 21.35 94.98 56.97 130.7c-12.5 50.37-54.27 95.27-54.77 95.77c-2.25 2.25-2.875 5.734-1.5 8.734c1.249 3 4.021 4.766 7.271 4.766c66.25 0 115.1-31.76 140.6-51.39c32.63 12.25 69.02 19.39 107.4 19.39c141.4 0 255.1-93.13 255.1-207.1S397.4 31.1 256 31.1zM127.1 271.1c-17.75 0-32-14.25-32-31.1s14.25-32 32-32s32 14.25 32 32S145.7 271.1 127.1 271.1zM256 271.1c-17.75 0-31.1-14.25-31.1-31.1s14.25-32 31.1-32s31.1 14.25 31.1 32S273.8 271.1 256 271.1zM383.1 271.1c-17.75 0-32-14.25-32-31.1s14.25-32 32-32s32 14.25 32 32S401.7 271.1 383.1 271.1z"]},pf={prefix:"fas",iconName:"cubes",icon:[576,512,[],"f1b3","M172.1 40.16L268.1 3.76C280.9-1.089 295.1-1.089 307.9 3.76L403.9 40.16C425.6 48.41 440 69.25 440 92.52V204.7C441.3 205.1 442.6 205.5 443.9 205.1L539.9 242.4C561.6 250.6 576 271.5 576 294.7V413.9C576 436.1 562.9 456.2 542.5 465.1L446.5 507.3C432.2 513.7 415.8 513.7 401.5 507.3L288 457.5L174.5 507.3C160.2 513.7 143.8 513.7 129.5 507.3L33.46 465.1C13.13 456.2 0 436.1 0 413.9V294.7C0 271.5 14.39 250.6 36.15 242.4L132.1 205.1C133.4 205.5 134.7 205.1 136 204.7V92.52C136 69.25 150.4 48.41 172.1 40.16V40.16zM290.8 48.64C289 47.95 286.1 47.95 285.2 48.64L206.8 78.35L287.1 109.5L369.2 78.35L290.8 48.64zM392 210.6V121L309.6 152.6V241.8L392 210.6zM154.8 250.9C153 250.2 150.1 250.2 149.2 250.9L70.81 280.6L152 311.7L233.2 280.6L154.8 250.9zM173.6 455.3L256 419.1V323.2L173.6 354.8V455.3zM342.8 280.6L424 311.7L505.2 280.6L426.8 250.9C425 250.2 422.1 250.2 421.2 250.9L342.8 280.6zM528 413.9V323.2L445.6 354.8V455.3L523.2 421.2C526.1 419.9 528 417.1 528 413.9V413.9z"]},mf={prefix:"fas",iconName:"file-contract",icon:[384,512,[],"f56c","M256 0v128h128L256 0zM224 128L224 0H48C21.49 0 0 21.49 0 48v416C0 490.5 21.49 512 48 512h288c26.51 0 48-21.49 48-48V160h-127.1C238.3 160 224 145.7 224 128zM64 72C64 67.63 67.63 64 72 64h80C156.4 64 160 67.63 160 72v16C160 92.38 156.4 96 152 96h-80C67.63 96 64 92.38 64 88V72zM64 136C64 131.6 67.63 128 72 128h80C156.4 128 160 131.6 160 136v16C160 156.4 156.4 160 152 160h-80C67.63 160 64 156.4 64 152V136zM304 384c8.875 0 16 7.125 16 16S312.9 416 304 416h-47.25c-16.38 0-31.25-9.125-38.63-23.88c-2.875-5.875-8-6.5-10.12-6.5s-7.25 .625-10 6.125l-7.75 15.38C187.6 412.6 181.1 416 176 416H174.9c-6.5-.5-12-4.75-14-11L144 354.6L133.4 386.5C127.5 404.1 111 416 92.38 416H80C71.13 416 64 408.9 64 400S71.13 384 80 384h12.38c4.875 0 9.125-3.125 10.62-7.625l18.25-54.63C124.5 311.9 133.6 305.3 144 305.3s19.5 6.625 22.75 16.5l13.88 41.63c19.75-16.25 54.13-9.75 66 14.12c2 4 6 6.5 10.12 6.5H304z"]},_f={prefix:"fas",iconName:"gear",icon:[512,512,[9881,"cog"],"f013","M495.9 166.6C499.2 175.2 496.4 184.9 489.6 191.2L446.3 230.6C447.4 238.9 448 247.4 448 256C448 264.6 447.4 273.1 446.3 281.4L489.6 320.8C496.4 327.1 499.2 336.8 495.9 345.4C491.5 357.3 486.2 368.8 480.2 379.7L475.5 387.8C468.9 398.8 461.5 409.2 453.4 419.1C447.4 426.2 437.7 428.7 428.9 425.9L373.2 408.1C359.8 418.4 344.1 427 329.2 433.6L316.7 490.7C314.7 499.7 307.7 506.1 298.5 508.5C284.7 510.8 270.5 512 255.1 512C241.5 512 227.3 510.8 213.5 508.5C204.3 506.1 197.3 499.7 195.3 490.7L182.8 433.6C167 427 152.2 418.4 138.8 408.1L83.14 425.9C74.3 428.7 64.55 426.2 58.63 419.1C50.52 409.2 43.12 398.8 36.52 387.8L31.84 379.7C25.77 368.8 20.49 357.3 16.06 345.4C12.82 336.8 15.55 327.1 22.41 320.8L65.67 281.4C64.57 273.1 64 264.6 64 256C64 247.4 64.57 238.9 65.67 230.6L22.41 191.2C15.55 184.9 12.82 175.3 16.06 166.6C20.49 154.7 25.78 143.2 31.84 132.3L36.51 124.2C43.12 113.2 50.52 102.8 58.63 92.95C64.55 85.8 74.3 83.32 83.14 86.14L138.8 103.9C152.2 93.56 167 84.96 182.8 78.43L195.3 21.33C197.3 12.25 204.3 5.04 213.5 3.51C227.3 1.201 241.5 0 256 0C270.5 0 284.7 1.201 298.5 3.51C307.7 5.04 314.7 12.25 316.7 21.33L329.2 78.43C344.1 84.96 359.8 93.56 373.2 103.9L428.9 86.14C437.7 83.32 447.4 85.8 453.4 92.95C461.5 102.8 468.9 113.2 475.5 124.2L480.2 132.3C486.2 143.2 491.5 154.7 495.9 166.6V166.6zM256 336C300.2 336 336 300.2 336 255.1C336 211.8 300.2 175.1 256 175.1C211.8 175.1 176 211.8 176 255.1C176 300.2 211.8 336 256 336z"]},gf=_f,bf={prefix:"fas",iconName:"message",icon:[512,512,["comment-alt"],"f27a","M511.1 63.1v287.1c0 35.25-28.75 63.1-64 63.1h-144l-124.9 93.68c-7.875 5.75-19.12 .0497-19.12-9.7v-83.98h-96c-35.25 0-64-28.75-64-63.1V63.1c0-35.25 28.75-63.1 64-63.1h384C483.2 0 511.1 28.75 511.1 63.1z"]},vf={prefix:"fas",iconName:"palette",icon:[512,512,[127912],"f53f","M512 255.1C512 256.9 511.1 257.8 511.1 258.7C511.6 295.2 478.4 319.1 441.9 319.1H344C317.5 319.1 296 341.5 296 368C296 371.4 296.4 374.7 297 377.9C299.2 388.1 303.5 397.1 307.9 407.8C313.9 421.6 320 435.3 320 449.8C320 481.7 298.4 510.5 266.6 511.8C263.1 511.9 259.5 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256V255.1zM96 255.1C78.33 255.1 64 270.3 64 287.1C64 305.7 78.33 319.1 96 319.1C113.7 319.1 128 305.7 128 287.1C128 270.3 113.7 255.1 96 255.1zM128 191.1C145.7 191.1 160 177.7 160 159.1C160 142.3 145.7 127.1 128 127.1C110.3 127.1 96 142.3 96 159.1C96 177.7 110.3 191.1 128 191.1zM256 63.1C238.3 63.1 224 78.33 224 95.1C224 113.7 238.3 127.1 256 127.1C273.7 127.1 288 113.7 288 95.1C288 78.33 273.7 63.1 256 63.1zM384 191.1C401.7 191.1 416 177.7 416 159.1C416 142.3 401.7 127.1 384 127.1C366.3 127.1 352 142.3 352 159.1C352 177.7 366.3 191.1 384 191.1z"]},yf={prefix:"fas",iconName:"paper-plane",icon:[512,512,[61913],"f1d8","M511.6 36.86l-64 415.1c-1.5 9.734-7.375 18.22-15.97 23.05c-4.844 2.719-10.27 4.097-15.68 4.097c-4.188 0-8.319-.8154-12.29-2.472l-122.6-51.1l-50.86 76.29C226.3 508.5 219.8 512 212.8 512C201.3 512 192 502.7 192 491.2v-96.18c0-7.115 2.372-14.03 6.742-19.64L416 96l-293.7 264.3L19.69 317.5C8.438 312.8 .8125 302.2 .0625 289.1s5.469-23.72 16.06-29.77l448-255.1c10.69-6.109 23.88-5.547 34 1.406S513.5 24.72 511.6 36.86z"]},wf={prefix:"fas",iconName:"people-group",icon:[640,512,[],"e533","M184 88C184 118.9 158.9 144 128 144C97.07 144 72 118.9 72 88C72 57.07 97.07 32 128 32C158.9 32 184 57.07 184 88zM208.4 196.3C178.7 222.7 160 261.2 160 304C160 338.3 171.1 369.8 192 394.5V416C192 433.7 177.7 448 160 448H96C78.33 448 64 433.7 64 416V389.2C26.16 371.2 0 332.7 0 288C0 226.1 50.14 176 112 176H144C167.1 176 190.2 183.5 208.4 196.3V196.3zM64 245.7C54.04 256.9 48 271.8 48 288C48 304.2 54.04 319.1 64 330.3V245.7zM448 416V394.5C468 369.8 480 338.3 480 304C480 261.2 461.3 222.7 431.6 196.3C449.8 183.5 472 176 496 176H528C589.9 176 640 226.1 640 288C640 332.7 613.8 371.2 576 389.2V416C576 433.7 561.7 448 544 448H480C462.3 448 448 433.7 448 416zM576 330.3C585.1 319.1 592 304.2 592 288C592 271.8 585.1 256.9 576 245.7V330.3zM568 88C568 118.9 542.9 144 512 144C481.1 144 456 118.9 456 88C456 57.07 481.1 32 512 32C542.9 32 568 57.07 568 88zM256 96C256 60.65 284.7 32 320 32C355.3 32 384 60.65 384 96C384 131.3 355.3 160 320 160C284.7 160 256 131.3 256 96zM448 304C448 348.7 421.8 387.2 384 405.2V448C384 465.7 369.7 480 352 480H288C270.3 480 256 465.7 256 448V405.2C218.2 387.2 192 348.7 192 304C192 242.1 242.1 192 304 192H336C397.9 192 448 242.1 448 304zM256 346.3V261.7C246 272.9 240 287.8 240 304C240 320.2 246 335.1 256 346.3zM384 261.7V346.3C393.1 335 400 320.2 400 304C400 287.8 393.1 272.9 384 261.7z"]},Mf={prefix:"fas",iconName:"people-pulling",icon:[576,512,[],"e535","M32 48C32 21.49 53.49 0 80 0C106.5 0 128 21.49 128 48C128 74.51 106.5 96 80 96C53.49 96 32 74.51 32 48V48zM118.3 128C130.1 128 143.5 130.5 155.2 135.4L289.3 191.2C302.6 171.1 320.1 156.6 342.7 146.9L353.7 142C374.5 132.8 396.1 128 419.7 128C464.3 128 504.5 154.8 521.6 195.9L536.1 232.7L558.3 243.4C574.1 251.3 580.5 270.5 572.6 286.3C564.7 302.1 545.5 308.5 529.7 300.6L503 287.3C492.7 282.1 484.6 273.4 480.2 262.8L470.6 239.8L451.3 305.3L500.8 359.4C506.2 365.3 510.1 372.4 512 380.2L535 472.2C539.3 489.4 528.9 506.8 511.8 511C494.6 515.3 477.2 504.9 472.1 487.8L450.9 399.6L380.3 322.5C365.5 306.4 359.1 283.9 365.6 262.8L382.5 199.3C381.6 199.7 380.6 200.1 379.7 200.5L368.7 205.4C353.4 212.2 341.4 224.6 335.2 240.1L333.7 243.9C328.6 256.7 316.1 264.4 303 263.1C299.2 263.9 295.4 263.1 291.7 261.5L173.3 212.2L231.2 473.1C235.1 490.3 224.2 507.4 206.9 511.2C189.7 515.1 172.6 504.2 168.8 486.9L138.8 352H123.1L143.6 474.7C146.5 492.2 134.7 508.7 117.3 511.6C99.83 514.5 83.34 502.7 80.44 485.3L56.35 340.8C50.48 347.6 41.75 352 32 352C14.33 352 0 337.7 0 319.1V191.1C0 156.7 28.65 127.1 64 127.1L118.3 128zM416 48C416 21.49 437.5 0 464 0C490.5 0 512 21.49 512 48C512 74.51 490.5 96 464 96C437.5 96 416 74.51 416 48V48zM356.7 344.2L397.4 388.6L382.9 424.8C380.5 430.9 376.9 436.4 372.3 440.9L310.6 502.6C298.1 515.1 277.9 515.1 265.4 502.6C252.9 490.1 252.9 469.9 265.4 457.4L324.7 398L349.7 335.6C351.8 338.6 354.2 341.4 356.7 344.2H356.7z"]},xf={prefix:"fas",iconName:"person-walking",icon:[320,512,[128694,"walking"],"f554","M256 48C256 74.51 234.5 96 208 96C181.5 96 160 74.51 160 48C160 21.49 181.5 0 208 0C234.5 0 256 21.49 256 48zM126.5 199.3C125.6 199.7 124.6 200.1 123.7 200.5L112.7 205.4C97.41 212.2 85.42 224.6 79.22 240.1L77.71 243.9C71.15 260.3 52.53 268.3 36.12 261.7C19.71 255.1 11.73 236.5 18.29 220.1L19.8 216.3C32.19 185.4 56.18 160.5 86.66 146.9L97.66 142C118.5 132.8 140.1 128 163.7 128C208.3 128 248.5 154.8 265.6 195.9L280.1 232.7L302.3 243.4C318.1 251.3 324.5 270.5 316.6 286.3C308.7 302.1 289.5 308.5 273.7 300.6L247 287.3C236.7 282.1 228.6 273.4 224.2 262.8L214.6 239.8L195.3 305.3L244.8 359.4C250.2 365.3 254.1 372.4 256 380.2L279 472.2C283.3 489.4 272.9 506.8 255.8 511C238.6 515.3 221.2 504.9 216.1 487.8L194.9 399.6L124.3 322.5C109.5 306.4 103.1 283.9 109.6 262.8L126.5 199.3zM68.73 398L93.69 335.6C95.84 338.6 98.16 341.4 100.7 344.2L141.4 388.6L126.9 424.8C124.5 430.9 120.9 436.4 116.3 440.9L54.63 502.6C42.13 515.1 21.87 515.1 9.372 502.6C-3.124 490.1-3.124 469.9 9.372 457.4L68.73 398z"]},Sf={prefix:"fas",iconName:"play",icon:[384,512,[9654],"f04b","M361 215C375.3 223.8 384 239.3 384 256C384 272.7 375.3 288.2 361 296.1L73.03 472.1C58.21 482 39.66 482.4 24.52 473.9C9.377 465.4 0 449.4 0 432V80C0 62.64 9.377 46.63 24.52 38.13C39.66 29.64 58.21 29.99 73.03 39.04L361 215z"]},Cf={prefix:"fas",iconName:"share",icon:[512,512,["arrow-turn-right","mail-forward"],"f064","M503.7 226.2l-176 151.1c-15.38 13.3-39.69 2.545-39.69-18.16V272.1C132.9 274.3 66.06 312.8 111.4 457.8c5.031 16.09-14.41 28.56-28.06 18.62C39.59 444.6 0 383.8 0 322.3c0-152.2 127.4-184.4 288-186.3V56.02c0-20.67 24.28-31.46 39.69-18.16l176 151.1C514.8 199.4 514.8 216.6 503.7 226.2z"]},Tf={prefix:"fas",iconName:"star",icon:[576,512,[61446,11088],"f005","M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"]},Ef={prefix:"fas",iconName:"stop",icon:[384,512,[9209],"f04d","M384 128v255.1c0 35.35-28.65 64-64 64H64c-35.35 0-64-28.65-64-64V128c0-35.35 28.65-64 64-64H320C355.3 64 384 92.65 384 128z"]},Lf={prefix:"fas",iconName:"terminal",icon:[576,512,[],"f120","M9.372 86.63C-3.124 74.13-3.124 53.87 9.372 41.37C21.87 28.88 42.13 28.88 54.63 41.37L246.6 233.4C259.1 245.9 259.1 266.1 246.6 278.6L54.63 470.6C42.13 483.1 21.87 483.1 9.372 470.6C-3.124 458.1-3.124 437.9 9.372 425.4L178.7 256L9.372 86.63zM544 416C561.7 416 576 430.3 576 448C576 465.7 561.7 480 544 480H256C238.3 480 224 465.7 224 448C224 430.3 238.3 416 256 416H544z"]},Pf={prefix:"fas",iconName:"video",icon:[576,512,["video-camera"],"f03d","M384 112v288c0 26.51-21.49 48-48 48h-288c-26.51 0-48-21.49-48-48v-288c0-26.51 21.49-48 48-48h288C362.5 64 384 85.49 384 112zM576 127.5v256.9c0 25.5-29.17 40.39-50.39 25.79L416 334.7V177.3l109.6-75.56C546.9 87.13 576 102.1 576 127.5z"]},Gc={prefix:"fas",iconName:"x",icon:[384,512,[120],"58","M376.6 427.5c11.31 13.58 9.484 33.75-4.094 45.06c-5.984 4.984-13.25 7.422-20.47 7.422c-9.172 0-18.27-3.922-24.59-11.52L192 305.1l-135.4 162.5c-6.328 7.594-15.42 11.52-24.59 11.52c-7.219 0-14.48-2.438-20.47-7.422c-13.58-11.31-15.41-31.48-4.094-45.06l142.9-171.5L7.422 84.5C-3.891 70.92-2.063 50.75 11.52 39.44c13.56-11.34 33.73-9.516 45.06 4.094L192 206l135.4-162.5c11.3-13.58 31.48-15.42 45.06-4.094c13.58 11.31 15.41 31.48 4.094 45.06l-142.9 171.5L376.6 427.5z"]};function cs(r,{delay:e=0,duration:t=400,easing:n=Vc}={}){const i=getComputedStyle(r),s=+i.opacity,a=parseFloat(i.height),o=parseFloat(i.paddingTop),l=parseFloat(i.paddingBottom),c=parseFloat(i.marginTop),u=parseFloat(i.marginBottom),f=parseFloat(i.borderTopWidth),d=parseFloat(i.borderBottomWidth);return{delay:e,duration:t,easing:n,css:m=>`overflow: hidden;opacity: ${Math.min(m*20,1)*s};height: ${m*a}px;padding-top: ${m*o}px;padding-bottom: ${m*l}px;margin-top: ${m*c}px;margin-bottom: ${m*u}px;border-top-width: ${m*f}px;border-bottom-width: ${m*d}px;`}}/*!
 * Font Awesome Free 6.1.2 by @fontawesome - https://fontawesome.com
 * License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License)
 * Copyright 2022 Fonticons, Inc.
 */var Af={prefix:"far",iconName:"star",icon:[576,512,[61446,11088],"f005","M287.9 0C297.1 0 305.5 5.25 309.5 13.52L378.1 154.8L531.4 177.5C540.4 178.8 547.8 185.1 550.7 193.7C553.5 202.4 551.2 211.9 544.8 218.2L433.6 328.4L459.9 483.9C461.4 492.9 457.7 502.1 450.2 507.4C442.8 512.7 432.1 513.4 424.9 509.1L287.9 435.9L150.1 509.1C142.9 513.4 133.1 512.7 125.6 507.4C118.2 502.1 114.5 492.9 115.1 483.9L142.2 328.4L31.11 218.2C24.65 211.9 22.36 202.4 25.2 193.7C28.03 185.1 35.5 178.8 44.49 177.5L197.7 154.8L266.3 13.52C270.4 5.249 278.7 0 287.9 0L287.9 0zM287.9 78.95L235.4 187.2C231.9 194.3 225.1 199.3 217.3 200.5L98.98 217.9L184.9 303C190.4 308.5 192.9 316.4 191.6 324.1L171.4 443.7L276.6 387.5C283.7 383.7 292.2 383.7 299.2 387.5L404.4 443.7L384.2 324.1C382.9 316.4 385.5 308.5 391 303L476.9 217.9L358.6 200.5C350.7 199.3 343.9 194.3 340.5 187.2L287.9 78.95z"]};function Df(r){let e,t,n;return{c(){e=z("div"),t=z("span"),L(t,"class",n=is(r[0]?"loader":"small-loader")+" svelte-s46sr9"),L(t,"style",""),L(e,"id","loader-id"),L(e,"class","loader-wrapper svelte-s46sr9")},m(i,s){B(i,e,s),C(e,t)},p(i,[s]){s&1&&n!==(n=is(i[0]?"loader":"small-loader")+" svelte-s46sr9")&&L(t,"class",n)},i:_e,o:_e,d(i){i&&U(e)}}}function kf(r,e,t){let{marginLeft:n="40%",marginRight:i="",marginTop:s="50%",isBig:a=!1}=e;return lt(()=>{const o=document.getElementById("loader-id");n!==""&&(o.style.marginLeft=n),i!==""&&(o.style.marginRight=i),s!==""&&(o.style.marginTop=s)}),r.$$set=o=>{"marginLeft"in o&&t(1,n=o.marginLeft),"marginRight"in o&&t(2,i=o.marginRight),"marginTop"in o&&t(3,s=o.marginTop),"isBig"in o&&t(0,a=o.isBig)},[a,n,i,s]}class ft extends We{constructor(e){super(),He(this,e,kf,Df,Ge,{marginLeft:1,marginRight:2,marginTop:3,isBig:0})}}function Oa(r,e,t){const n=r.slice();return n[14]=e[t],n}function Ua(r){let e,t=r[5],n=[];for(let i=0;i<t.length;i+=1)n[i]=Ba(Oa(r,t,i));return{c(){e=z("div");for(let i=0;i<n.length;i+=1)n[i].c();L(e,"class","dropdown-menu")},m(i,s){B(i,e,s);for(let a=0;a<n.length;a+=1)n[a].m(e,null)},p(i,s){if(s&288){t=i[5];let a;for(a=0;a<t.length;a+=1){const o=Oa(i,t,a);n[a]?n[a].p(o,s):(n[a]=Ba(o),n[a].c(),n[a].m(e,null))}for(;a<n.length;a+=1)n[a].d(1);n.length=t.length}},d(i){i&&U(e),Lt(n,i)}}}function Ba(r){let e,t,n=r[14].id+"",i,s,a=r[14].name+"",o,l,c;function u(){return r[12](r[14])}return{c(){e=z("p"),t=J("("),i=J(n),s=J(") "),o=J(a)},m(f,d){B(f,e,d),C(e,t),C(e,i),C(e,s),C(e,o),l||(c=ze(e,"click",u),l=!0)},p(f,d){r=f,d&32&&n!==(n=r[14].id+"")&&he(i,n),d&32&&a!==(a=r[14].name+"")&&he(o,a)},d(f){f&&U(e),l=!1,c()}}}function Rf(r){let e,t,n,i,s,a,o,l,c,u,f,d,m,h,p;f=new Ft({props:{icon:gr,class:"txt-xs dropdown-chevron"}});let _=r[4]&&Ua(r);return{c(){e=z("div"),t=z("p"),n=J(r[0]),i=J(":"),s=K(),a=z("div"),o=z("div"),l=z("input"),c=K(),u=z("div"),ee(f.$$.fragment),d=K(),_&&_.c(),L(t,"class","block txt-sm panel-labels"),L(l,"id",r[1]),L(l,"type","text"),L(l,"class","panel-inputs txt-sm p-2"),L(l,"placeholder",r[2]),L(o,"class","relative"),L(a,"class","dropdown")},m(g,v){B(g,e,v),C(e,t),C(t,n),C(t,i),C(e,s),C(e,a),C(a,o),C(o,l),zt(l,r[3]),C(o,c),C(o,u),Q(f,u,null),C(a,d),_&&_.m(a,null),m=!0,h||(p=[ze(l,"input",r[11]),ze(l,"click",r[6]),ze(l,"keyup",r[7]),ze(u,"click",r[6])],h=!0)},p(g,[v]){(!m||v&1)&&he(n,g[0]),(!m||v&2)&&L(l,"id",g[1]),(!m||v&4)&&L(l,"placeholder",g[2]),v&8&&l.value!==g[3]&&zt(l,g[3]),g[4]?_?_.p(g,v):(_=Ua(g),_.c(),_.m(a,null)):_&&(_.d(1),_=null)},i(g){m||(A(f.$$.fragment,g),m=!0)},o(g){I(f.$$.fragment,g),m=!1},d(g){g&&U(e),$(f),_&&_.d(),h=!1,Mt(p)}}}function If(r,e,t){const n=ln();let{ddLabel:i,dropdownList:s,ddId:a,placeholder:o="",selectedValue:l}=e,c="",u=!1,f=[];lt(()=>{t(5,f=s)});function d(){u?(document.getElementById(a).style.borderBottomLeftRadius="0.2vw",document.getElementById(a).style.borderBottomRightRadius="0.2vw"):(document.getElementById(a).style.borderBottomLeftRadius="0",document.getElementById(a).style.borderBottomRightRadius="0"),t(4,u=!u)}function m(){t(4,u=!0),t(5,f=s.filter(g=>{let v=g.name.toLocaleLowerCase(),b=g.id.toString().toLocaleLowerCase();if(v.includes(c.toLocaleLowerCase())||b.includes(c.toLocaleLowerCase()))return g}))}function h(g){t(3,c=g.name),document.getElementById(a).style.borderBottomLeftRadius="0.2vw",document.getElementById(a).style.borderBottomRightRadius="0.2vw",t(4,u=!1),n("searchable-dd-selected-value",g)}function p(){c=this.value,t(3,c)}const _=g=>h(g);return r.$$set=g=>{"ddLabel"in g&&t(0,i=g.ddLabel),"dropdownList"in g&&t(9,s=g.dropdownList),"ddId"in g&&t(1,a=g.ddId),"placeholder"in g&&t(2,o=g.placeholder),"selectedValue"in g&&t(10,l=g.selectedValue)},[i,a,o,c,u,f,d,m,h,s,l,p,_]}class bn extends We{constructor(e){super(),He(this,e,If,Rf,Ge,{ddLabel:0,dropdownList:9,ddId:1,placeholder:2,selectedValue:10})}}function Nf(r){let e,t,n,i,s,a,o,l;return{c(){e=z("p"),t=J(r[2]),n=J(":"),i=K(),s=z("input"),L(e,"class","block txt-sm panel-labels"),L(s,"id",r[3]),L(s,"type","text"),L(s,"placeholder",r[1]),L(s,"style","width=auto;"),L(s,"class",a="panel-inputs "+r[4])},m(c,u){B(c,e,u),C(e,t),C(e,n),B(c,i,u),B(c,s,u),zt(s,r[0]),o||(l=[ze(s,"input",r[7]),ze(s,"keyup",r[5])],o=!0)},p(c,[u]){u&4&&he(t,c[2]),u&8&&L(s,"id",c[3]),u&2&&L(s,"placeholder",c[1]),u&16&&a!==(a="panel-inputs "+c[4])&&L(s,"class",a),u&1&&s.value!==c[0]&&zt(s,c[0])},i:_e,o:_e,d(c){c&&U(e),c&&U(i),c&&U(s),o=!1,Mt(l)}}}function zf(r,e,t){let{placeholder:n="",label:i="",inputId:s,inputValue:a="",className:o="block",width:l="90%"}=e;const c=ln();lt(()=>{const d=document.getElementById(s);d.style.width=l});function u(){c("input-value-update",a)}function f(){a=this.value,t(0,a)}return r.$$set=d=>{"placeholder"in d&&t(1,n=d.placeholder),"label"in d&&t(2,i=d.label),"inputId"in d&&t(3,s=d.inputId),"inputValue"in d&&t(0,a=d.inputValue),"className"in d&&t(4,o=d.className),"width"in d&&t(6,l=d.width)},[a,n,i,s,o,u,l,f]}class Tn extends We{constructor(e){super(),He(this,e,zf,Nf,Ge,{placeholder:1,label:2,inputId:3,inputValue:0,className:4,width:6})}}function Ff(r){let e,t,n,i;return{c(){e=z("button"),t=J(r[0]),L(e,"id",r[3]),L(e,"class",r[1]),e.disabled=r[2]},m(s,a){B(s,e,a),C(e,t),n||(i=ze(e,"click",r[4]),n=!0)},p(s,[a]){a&1&&he(t,s[0]),a&8&&L(e,"id",s[3]),a&2&&L(e,"class",s[1]),a&4&&(e.disabled=s[2])},i:_e,o:_e,d(s){s&&U(e),n=!1,i()}}}function Of(r,e,t){const n=ln();let{buttonLabel:i,className:s="block panel-btns txt-xs",btnDisabled:a=!0,btnId:o}=e;function l(){n("button-clicked")}return r.$$set=c=>{"buttonLabel"in c&&t(0,i=c.buttonLabel),"className"in c&&t(1,s=c.className),"btnDisabled"in c&&t(2,a=c.btnDisabled),"btnId"in c&&t(3,o=c.btnId)},[i,s,a,o,l]}class gt extends We{constructor(e){super(),He(this,e,Of,Ff,Ge,{buttonLabel:0,className:1,btnDisabled:2,btnId:3})}}function Uf(r){let e,t,n,i,s,a,o;return{c(){e=z("div"),t=z("input"),n=K(),i=z("p"),s=J(r[1]),L(t,"type","checkbox"),L(t,"class","cursor-pointer"),L(t,"id",r[2]),L(t,"name",r[2]),L(i,"class","inline-block txt-sm panel-labels pleft-1 ptop-1"),L(e,"class","checkboxes")},m(l,c){B(l,e,c),C(e,t),zt(t,r[0]),C(e,n),C(e,i),C(i,s),a||(o=[ze(t,"change",r[4]),ze(t,"click",r[3])],a=!0)},p(l,[c]){c&4&&L(t,"id",l[2]),c&4&&L(t,"name",l[2]),c&1&&zt(t,l[0]),c&2&&he(s,l[1])},i:_e,o:_e,d(l){l&&U(e),a=!1,Mt(o)}}}function Bf(r,e,t){const n=ln();let{checkboxValue:i,checkboxLabel:s,checkboxId:a}=e;function o(){t(0,i=!i),n("checkbox-clicked",i)}function l(){i=this.value,t(0,i)}return r.$$set=c=>{"checkboxValue"in c&&t(0,i=c.checkboxValue),"checkboxLabel"in c&&t(1,s=c.checkboxLabel),"checkboxId"in c&&t(2,a=c.checkboxId)},[i,s,a,o,l]}class us extends We{constructor(e){super(),He(this,e,Bf,Uf,Ge,{checkboxValue:0,checkboxLabel:1,checkboxId:2})}}function Vf(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Gf(r){let e,t,n,i,s,a,o,l,c,u;return e=new bn({props:{ddLabel:r[0].vehicle,dropdownList:r[3],ddId:"spawn-car-dd-input",placeholder:r[0].vehicle,selectedValue:r[4]}}),e.$on("searchable-dd-selected-value",r[13]),n=new Tn({props:{placeholder:r[0].override_placeholder,label:r[0].override,inputId:"spawn-car-override-input",inputValue:r[8]}}),n.$on("input-value-update",r[14]),s=new us({props:{checkboxValue:r[6],checkboxLabel:r[0].max_mods,checkboxId:r[6]}}),s.$on("checkbox-clicked",r[15]),o=new us({props:{checkboxValue:r[7],checkboxLabel:r[0].seat_vehicle,checkboxId:r[7]}}),o.$on("checkbox-clicked",r[16]),c=new gt({props:{buttonLabel:r[0].submit,btnDisabled:r[5],btnId:"submit-btn-spawn-car"}}),c.$on("button-clicked",r[12]),{c(){ee(e.$$.fragment),t=K(),ee(n.$$.fragment),i=K(),ee(s.$$.fragment),a=K(),ee(o.$$.fragment),l=K(),ee(c.$$.fragment)},m(f,d){Q(e,f,d),B(f,t,d),Q(n,f,d),B(f,i,d),Q(s,f,d),B(f,a,d),Q(o,f,d),B(f,l,d),Q(c,f,d),u=!0},p(f,d){const m={};d&1&&(m.ddLabel=f[0].vehicle),d&8&&(m.dropdownList=f[3]),d&1&&(m.placeholder=f[0].vehicle),d&16&&(m.selectedValue=f[4]),e.$set(m);const h={};d&1&&(h.placeholder=f[0].override_placeholder),d&1&&(h.label=f[0].override),d&256&&(h.inputValue=f[8]),n.$set(h);const p={};d&64&&(p.checkboxValue=f[6]),d&1&&(p.checkboxLabel=f[0].max_mods),d&64&&(p.checkboxId=f[6]),s.$set(p);const _={};d&128&&(_.checkboxValue=f[7]),d&1&&(_.checkboxLabel=f[0].seat_vehicle),d&128&&(_.checkboxId=f[7]),o.$set(_);const g={};d&1&&(g.buttonLabel=f[0].submit),d&32&&(g.btnDisabled=f[5]),c.$set(g)},i(f){u||(A(e.$$.fragment,f),A(n.$$.fragment,f),A(s.$$.fragment,f),A(o.$$.fragment,f),A(c.$$.fragment,f),u=!0)},o(f){I(e.$$.fragment,f),I(n.$$.fragment,f),I(s.$$.fragment,f),I(o.$$.fragment,f),I(c.$$.fragment,f),u=!1},d(f){$(e,f),f&&U(t),$(n,f),f&&U(i),$(s,f),f&&U(a),$(o,f),f&&U(l),$(c,f)}}}function Hf(r){let e,t,n,i;const s=[Gf,Vf],a=[];function o(l,c){return!l[1]&&!l[2]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Wf(r,e,t){let n,{localeConsts:i}=e,{isDev:s}=vt;ut(r,s,y=>t(18,n=y));let a=!1,o=!1,l=[],c="",u=!0,f=!1,d=!1,m="";lt(async()=>{t(2,o=!0),n?t(3,l=[{id:1,name:"Sakshi"},{id:2,name:"Pushkar"},{id:3,name:"Monu"},{id:4,name:"Chinu"},{id:5,name:"Vaishnavi"},{id:6,name:"Anvi"},{id:7,name:"Lalla"}]):t(3,l=await De("getAllVehicles")),t(2,o=!1)});function h(y){t(4,c=y.detail),c!==""&&t(5,u=!1)}function p(){m.trim(),m.trim()!==""?t(5,u=!1):t(5,u=!0)}async function _(){t(1,a=!0),await De("spawncardata",{selectedPlayer:c,override:m,maxMods:f,seatValue:d}),t(5,u=!0),t(4,c=""),t(6,f=!1),t(7,d=!1),t(8,m=""),t(1,a=!1)}const g=y=>h(y),v=y=>{t(8,m=y.detail),p()},b=y=>t(6,f=y.detail),w=y=>t(7,d=y.detail);return r.$$set=y=>{"localeConsts"in y&&t(0,i=y.localeConsts)},[i,a,o,l,c,u,f,d,m,s,h,p,_,g,v,b,w]}class Xf extends We{constructor(e){super(),He(this,e,Wf,Hf,Ge,{localeConsts:0})}}function jf(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function qf(r){let e,t,n,i;return e=new Tn({props:{placeholder:r[6],label:r[5],inputId:"announce-input",inputValue:r[1]}}),e.$on("input-value-update",r[10]),n=new gt({props:{buttonLabel:r[0].submit,btnDisabled:r[2],btnId:"submit-btn-announce"}}),n.$on("button-clicked",r[8]),{c(){ee(e.$$.fragment),t=K(),ee(n.$$.fragment)},m(s,a){Q(e,s,a),B(s,t,a),Q(n,s,a),i=!0},p(s,a){const o={};a&64&&(o.placeholder=s[6]),a&32&&(o.label=s[5]),a&2&&(o.inputValue=s[1]),e.$set(o);const l={};a&1&&(l.buttonLabel=s[0].submit),a&4&&(l.btnDisabled=s[2]),n.$set(l)},i(s){i||(A(e.$$.fragment,s),A(n.$$.fragment,s),i=!0)},o(s){I(e.$$.fragment,s),I(n.$$.fragment,s),i=!1},d(s){$(e,s),s&&U(t),$(n,s)}}}function Yf(r){let e,t,n,i;const s=[qf,jf],a=[];function o(l,c){return!l[3]&&!l[4]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Zf(r,e,t){let{title:n,localeConsts:i}=e,s="",a=!0,o=!1,l=!1,c="",u="",f="";lt(async()=>{t(4,l=!0),h(),t(4,l=!1)});function d(){t(2,a=s.trim()==="")}async function m(){t(3,o=!0);let _={};if(n===i.search_by_citizen_id){const v=parseInt(s);if(isNaN(v)){t(3,o=!1),t(1,s="");return}_={citizenId:v}}else _={announcement:s};const g=await De(c,_);i.search_by_citizen_id,t(3,o=!1),t(1,s="")}function h(){n===i.Announce?(t(1,s=""),c="announce",t(5,u=i.announce),t(6,f=i.announce_placeholder)):n===i.search_by_citizen_id&&(t(1,s=""),c="searchCitizenId",t(5,u=i.citizen_id_label),t(6,f=i.search_placeholder))}const p=_=>{t(1,s=_.detail),d()};return r.$$set=_=>{"title"in _&&t(9,n=_.title),"localeConsts"in _&&t(0,i=_.localeConsts)},[i,s,a,o,l,u,f,d,m,n,p]}class Kf extends We{constructor(e){super(),He(this,e,Zf,Yf,Ge,{title:9,localeConsts:0})}}function Jf(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Qf(r){let e,t,n,i,s,a;e=new Tn({props:{placeholder:"10.00,10.00,10.00",label:r[0].coordinates_label,inputId:"teleport-coords-input",inputValue:r[1]}}),e.$on("input-value-update",r[7]),n=new gt({props:{buttonLabel:r[0].submit,btnDisabled:r[2],btnId:"submit-btn-teleport-coords"}}),n.$on("button-clicked",r[6]);let o=r[4]!==""&&Va(r);return{c(){ee(e.$$.fragment),t=K(),ee(n.$$.fragment),i=K(),o&&o.c(),s=Dt()},m(l,c){Q(e,l,c),B(l,t,c),Q(n,l,c),B(l,i,c),o&&o.m(l,c),B(l,s,c),a=!0},p(l,c){const u={};c&1&&(u.label=l[0].coordinates_label),c&2&&(u.inputValue=l[1]),e.$set(u);const f={};c&1&&(f.buttonLabel=l[0].submit),c&4&&(f.btnDisabled=l[2]),n.$set(f),l[4]!==""?o?o.p(l,c):(o=Va(l),o.c(),o.m(s.parentNode,s)):o&&(o.d(1),o=null)},i(l){a||(A(e.$$.fragment,l),A(n.$$.fragment,l),a=!0)},o(l){I(e.$$.fragment,l),I(n.$$.fragment,l),a=!1},d(l){$(e,l),l&&U(t),$(n,l),l&&U(i),o&&o.d(l),l&&U(s)}}}function Va(r){let e,t;return{c(){e=z("p"),t=J(r[4]),L(e,"class","input-error")},m(n,i){B(n,e,i),C(e,t)},p(n,i){i&16&&he(t,n[4])},d(n){n&&U(e)}}}function $f(r){let e,t,n,i;const s=[Qf,Jf],a=[];function o(l,c){return l[3]?1:0}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function ed(r,e,t){let{localeConsts:n}=e,i="",s=!0,a=!1,o="";function l(){t(2,s=i.trim()===""||i.includes(" "))}async function c(){t(3,a=!0);const f=i.split(",");if(f.length!==3)return t(4,o=n.enter_coords_error_msg),t(3,a=!1),o;for(let m=0;m<f.length;m++)if(f[m].split(".").length!==2)return t(4,o=n.coords_decimal_error_msg),t(3,a=!1),o;const d={xcoord:f[0],ycoord:f[1],zcoord:f[2]};await De("teleportcoords",d),t(3,a=!1),t(1,i=""),t(4,o="")}const u=f=>{t(1,i=f.detail),l()};return r.$$set=f=>{"localeConsts"in f&&t(0,n=f.localeConsts)},[n,i,s,a,o,l,c,u]}class td extends We{constructor(e){super(),He(this,e,ed,$f,Ge,{localeConsts:0})}}function nd(r){let e,t,n,i,s,a,o,l;return{c(){e=z("p"),t=J(r[2]),n=J(":"),i=K(),s=z("input"),L(e,"class","block txt-sm panel-labels"),L(s,"id",r[3]),L(s,"type","number"),L(s,"placeholder",r[1]),L(s,"style","width=auto;"),L(s,"class",a="panel-inputs "+r[4])},m(c,u){B(c,e,u),C(e,t),C(e,n),B(c,i,u),B(c,s,u),zt(s,r[0]),o||(l=[ze(s,"input",r[10]),ze(s,"keyup",r[5])],o=!0)},p(c,[u]){u&4&&he(t,c[2]),u&8&&L(s,"id",c[3]),u&2&&L(s,"placeholder",c[1]),u&16&&a!==(a="panel-inputs "+c[4])&&L(s,"class",a),u&1&&Fc(s.value)!==c[0]&&zt(s,c[0])},i:_e,o:_e,d(c){c&&U(e),c&&U(i),c&&U(s),o=!1,Mt(l)}}}function id(r,e,t){let{placeholder:n="",label:i="",inputId:s,inputValue:a,className:o="block",width:l="90%",pattern:c="",step:u="",min:f=""}=e;const d=ln();lt(()=>{const p=document.getElementById(s);p.style.width=l,c.trim()!==""&&p.setAttribute("pattern",c),u.trim()!==""&&p.setAttribute("step",u),f.trim()!==""&&p.setAttribute("min",u)});function m(){d("input-value-update",a)}function h(){a=Fc(this.value),t(0,a)}return r.$$set=p=>{"placeholder"in p&&t(1,n=p.placeholder),"label"in p&&t(2,i=p.label),"inputId"in p&&t(3,s=p.inputId),"inputValue"in p&&t(0,a=p.inputValue),"className"in p&&t(4,o=p.className),"width"in p&&t(6,l=p.width),"pattern"in p&&t(7,c=p.pattern),"step"in p&&t(8,u=p.step),"min"in p&&t(9,f=p.min)},[a,n,i,s,o,m,l,c,u,f,h]}class Ui extends We{constructor(e){super(),He(this,e,id,nd,Ge,{placeholder:1,label:2,inputId:3,inputValue:0,className:4,width:6,pattern:7,step:8,min:9})}}function rd(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function sd(r){let e,t,n,i,s,a,o,l;return e=new bn({props:{ddLabel:r[0].player,dropdownList:r[3],ddId:"give-money-player-dd-input",placeholder:r[0].player_placeholder,selectedValue:r[4]}}),e.$on("searchable-dd-selected-value",r[19]),n=new bn({props:{ddLabel:r[9],dropdownList:r[6],ddId:"give-money-item-dd-input",placeholder:r[0].search_placeholder,selectedValue:r[7]}}),n.$on("searchable-dd-selected-value",r[20]),s=new Ui({props:{label:r[0].amount,inputId:"give-money-input",inputValue:r[11],className:"small-panel-inputs txt-sm p-1",width:"40%",step:"1",min:"1"}}),s.$on("input-value-update",r[21]),o=new gt({props:{buttonLabel:r[10],btnDisabled:r[5]||r[8]||r[12],btnId:"submit-btn-give-money"}}),o.$on("button-clicked",r[17]),{c(){ee(e.$$.fragment),t=K(),ee(n.$$.fragment),i=K(),ee(s.$$.fragment),a=K(),ee(o.$$.fragment)},m(c,u){Q(e,c,u),B(c,t,u),Q(n,c,u),B(c,i,u),Q(s,c,u),B(c,a,u),Q(o,c,u),l=!0},p(c,u){const f={};u&1&&(f.ddLabel=c[0].player),u&8&&(f.dropdownList=c[3]),u&1&&(f.placeholder=c[0].player_placeholder),u&16&&(f.selectedValue=c[4]),e.$set(f);const d={};u&512&&(d.ddLabel=c[9]),u&64&&(d.dropdownList=c[6]),u&1&&(d.placeholder=c[0].search_placeholder),u&128&&(d.selectedValue=c[7]),n.$set(d);const m={};u&1&&(m.label=c[0].amount),u&2048&&(m.inputValue=c[11]),s.$set(m);const h={};u&1024&&(h.buttonLabel=c[10]),u&4384&&(h.btnDisabled=c[5]||c[8]||c[12]),o.$set(h)},i(c){l||(A(e.$$.fragment,c),A(n.$$.fragment,c),A(s.$$.fragment,c),A(o.$$.fragment,c),l=!0)},o(c){I(e.$$.fragment,c),I(n.$$.fragment,c),I(s.$$.fragment,c),I(o.$$.fragment,c),l=!1},d(c){$(e,c),c&&U(t),$(n,c),c&&U(i),$(s,c),c&&U(a),$(o,c)}}}function ad(r){let e,t,n,i;const s=[sd,rd],a=[];function o(l,c){return!l[1]&&!l[2]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function od(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=vt;ut(r,a,P=>t(22,n=P));let o=!1,l=!1,c=[],u="",f=!0,d=[],m="",h=!0,p="",_="",g,v=!0;lt(async()=>{t(2,l=!0),n?t(3,c=[{id:1,name:"Sakshi"},{id:2,name:"Pushkar"},{id:3,name:"Monu"},{id:4,name:"Chinu"},{id:5,name:"Vaishnavi"},{id:6,name:"Anvi"},{id:7,name:"Lalla"}]):t(3,c=await De("getPlayerList")),i==s.Give_Item?(t(6,d=await De("getAllItems")),t(9,p=s.itemLabel),t(10,_=s.give_item_btn)):(t(6,d=[{id:"cash",name:"Cash"},{id:"bank",name:"Bank"}]),t(9,p=s.money_type),t(10,_=s.give_money_btn)),t(2,l=!1)});function b(P){t(4,u=P.detail),u!==""&&t(5,f=!1)}function w(P){t(7,m=P.detail),m!==""&&t(8,h=!1)}function y(){t(12,v=!Number.isInteger(g)||g<=0)}async function x(){t(1,o=!0);const P={selectedPlayer:u,selectedItem:m,amount:g};i==s.Give_Item?await De("giveitem",P):(await De("giveMoney",P),t(5,f=!0),t(8,h=!0),t(4,u=""),t(7,m=""),t(11,g="")),t(1,o=!1)}const E=P=>b(P),M=P=>w(P),S=P=>{t(11,g=P.detail),y()};return r.$$set=P=>{"title"in P&&t(18,i=P.title),"localeConsts"in P&&t(0,s=P.localeConsts)},[s,o,l,c,u,f,d,m,h,p,_,g,v,a,b,w,y,x,i,E,M,S]}class ld extends We{constructor(e){super(),He(this,e,od,ad,Ge,{title:18,localeConsts:0})}}function cd(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function ud(r){let e,t,n,i,s,a;e=new Tn({props:{placeholder:r[0].max_8_chars,label:r[0].plate_number,inputId:"change-plate-input",inputValue:r[1]}}),e.$on("input-value-update",r[7]),n=new gt({props:{buttonLabel:r[0].submit,btnDisabled:r[2],btnId:"submit-btn-change-plate"}}),n.$on("button-clicked",r[6]);let o=r[4]!==""&&Ga(r);return{c(){ee(e.$$.fragment),t=K(),ee(n.$$.fragment),i=K(),o&&o.c(),s=Dt()},m(l,c){Q(e,l,c),B(l,t,c),Q(n,l,c),B(l,i,c),o&&o.m(l,c),B(l,s,c),a=!0},p(l,c){const u={};c&1&&(u.placeholder=l[0].max_8_chars),c&1&&(u.label=l[0].plate_number),c&2&&(u.inputValue=l[1]),e.$set(u);const f={};c&1&&(f.buttonLabel=l[0].submit),c&4&&(f.btnDisabled=l[2]),n.$set(f),l[4]!==""?o?o.p(l,c):(o=Ga(l),o.c(),o.m(s.parentNode,s)):o&&(o.d(1),o=null)},i(l){a||(A(e.$$.fragment,l),A(n.$$.fragment,l),a=!0)},o(l){I(e.$$.fragment,l),I(n.$$.fragment,l),a=!1},d(l){$(e,l),l&&U(t),$(n,l),l&&U(i),o&&o.d(l),l&&U(s)}}}function Ga(r){let e,t;return{c(){e=z("p"),t=J(r[4]),L(e,"class","input-error")},m(n,i){B(n,e,i),C(e,t)},p(n,i){i&16&&he(t,n[4])},d(n){n&&U(e)}}}function fd(r){let e,t,n,i;const s=[ud,cd],a=[];function o(l,c){return l[3]?1:0}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function dd(r,e,t){let{localeConsts:n}=e,i="",s=!0,a=!1,o="";function l(){i.trim().length>8?t(4,o=n.plate_less_than_8):/^[A-Za-z0-9]*$/.test(i)?t(4,o=""):t(4,o=n.plate_no_spl_chars),t(2,s=i.trim()===""||o!=="")}async function c(){t(3,a=!0),await De("changePlate",{plateNumber:i}),t(3,a=!1),t(1,i="")}const u=f=>{t(1,i=f.detail),l()};return r.$$set=f=>{"localeConsts"in f&&t(0,n=f.localeConsts)},[n,i,s,a,o,l,c,u]}class hd extends We{constructor(e){super(),He(this,e,dd,fd,Ge,{localeConsts:0})}}function pd(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function md(r){let e,t,n,i;return e=new Tn({props:{placeholder:r[0].object_placeholder,label:r[0].object_label,inputId:"spawn-object-input",inputValue:r[1]}}),e.$on("input-value-update",r[6]),n=new gt({props:{buttonLabel:r[0].submit,btnDisabled:r[2],btnId:"submit-btn-spawn-objects"}}),n.$on("button-clicked",r[5]),{c(){ee(e.$$.fragment),t=K(),ee(n.$$.fragment)},m(s,a){Q(e,s,a),B(s,t,a),Q(n,s,a),i=!0},p(s,a){const o={};a&1&&(o.placeholder=s[0].object_placeholder),a&1&&(o.label=s[0].object_label),a&2&&(o.inputValue=s[1]),e.$set(o);const l={};a&1&&(l.buttonLabel=s[0].submit),a&4&&(l.btnDisabled=s[2]),n.$set(l)},i(s){i||(A(e.$$.fragment,s),A(n.$$.fragment,s),i=!0)},o(s){I(e.$$.fragment,s),I(n.$$.fragment,s),i=!1},d(s){$(e,s),s&&U(t),$(n,s)}}}function _d(r){let e,t,n,i;const s=[md,pd],a=[];function o(l,c){return l[3]?1:0}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function gd(r,e,t){let{localeConsts:n}=e,i="",s=!0,a=!1;function o(){t(2,s=i.trim()===""||i.includes(" "))}async function l(){t(3,a=!0),await De("spawnObject",{objectName:i}),t(3,a=!1),t(1,i="")}const c=u=>{t(1,i=u.detail),o()};return r.$$set=u=>{"localeConsts"in u&&t(0,n=u.localeConsts)},[n,i,s,a,o,l,c]}class bd extends We{constructor(e){super(),He(this,e,gd,_d,Ge,{localeConsts:0})}}function vd(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function yd(r){let e,t,n,i,s,a,o,l,c,u,f,d,m;return e=new bn({props:{ddLabel:r[9],dropdownList:r[2],ddId:"create-stashes-dd-input",placeholder:r[0].search_placeholder,selectedValue:r[5]}}),e.$on("searchable-dd-selected-value",r[16]),i=new Ui({props:{label:r[0].size,inputId:"create-stashes-size-input",inputValue:r[6],className:"small-panel-inputs txt-sm p-1",width:"40%",pattern:"^[-/d]/d*$",step:"1"}}),i.$on("input-value-update",r[17]),o=new Ui({props:{label:r[0].slots,inputId:"create-stashes-slots-input",inputValue:r[7],className:"small-panel-inputs txt-sm p-1",width:"40%",pattern:"^[-/d]/d*$",step:"1"}}),o.$on("input-value-update",r[18]),u=new Tn({props:{placeholder:"prop_container_03mb",label:r[0].prop_override,inputId:"prop-container-input",inputValue:r[10]}}),u.$on("input-value-update",r[19]),d=new gt({props:{buttonLabel:r[8],btnDisabled:r[4],btnId:"submit-btn-create-stashes"}}),d.$on("button-clicked",r[13]),{c(){ee(e.$$.fragment),t=K(),n=z("div"),ee(i.$$.fragment),s=K(),a=z("div"),ee(o.$$.fragment),l=K(),c=z("div"),ee(u.$$.fragment),f=K(),ee(d.$$.fragment),L(n,"class","mtop-1"),L(a,"class","mtop-1 mbot-3"),L(c,"class","mtop-1")},m(h,p){Q(e,h,p),B(h,t,p),B(h,n,p),Q(i,n,null),B(h,s,p),B(h,a,p),Q(o,a,null),B(h,l,p),B(h,c,p),Q(u,c,null),B(h,f,p),Q(d,h,p),m=!0},p(h,p){const _={};p&512&&(_.ddLabel=h[9]),p&4&&(_.dropdownList=h[2]),p&1&&(_.placeholder=h[0].search_placeholder),p&32&&(_.selectedValue=h[5]),e.$set(_);const g={};p&1&&(g.label=h[0].size),p&64&&(g.inputValue=h[6]),i.$set(g);const v={};p&1&&(v.label=h[0].slots),p&128&&(v.inputValue=h[7]),o.$set(v);const b={};p&1&&(b.label=h[0].prop_override),p&1024&&(b.inputValue=h[10]),u.$set(b);const w={};p&256&&(w.buttonLabel=h[8]),p&16&&(w.btnDisabled=h[4]),d.$set(w)},i(h){m||(A(e.$$.fragment,h),A(i.$$.fragment,h),A(o.$$.fragment,h),A(u.$$.fragment,h),A(d.$$.fragment,h),m=!0)},o(h){I(e.$$.fragment,h),I(i.$$.fragment,h),I(o.$$.fragment,h),I(u.$$.fragment,h),I(d.$$.fragment,h),m=!1},d(h){$(e,h),h&&U(t),h&&U(n),$(i),h&&U(s),h&&U(a),$(o),h&&U(l),h&&U(c),$(u),h&&U(f),$(d,h)}}}function wd(r){let e,t,n,i;const s=[yd,vd],a=[];function o(l,c){return!l[1]&&!l[3]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Md(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=vt;ut(r,a,k=>t(22,n=k));let o=!1,l=[],c=!1,u=!0,f="",d,m,h="",p="",_=s.submit,g=s.label,v="";lt(async()=>{t(3,c=!0),b(),n?t(2,l=[{id:1,name:"Job1"},{id:2,name:"Job2"},{id:3,name:"Job3"},{id:4,name:"Job4"},{id:5,name:"Job5"},{id:6,name:"Job6"},{id:7,name:"Job7"}]):t(2,l=await De(p)),t(3,c=!1)});function b(){i===s.Create_Job_Stashes?(h="setJobStash",t(9,g=s.jobLabel),p="getindividualjobs",t(8,_=s.create_job_stash_btn)):i===s.Create_Gang_Stashes&&(h="setGangStash",t(9,g=s.gangLabel),p="getIndividualGangs",t(8,_=s.create_gang_stash_btn))}function w(k){t(5,f=k.detail),x()}async function y(){t(1,o=!0),await De(h,{selectedValue:f,size:d,slot:m,prop_override:v}),t(4,u=!0),t(5,f=""),t(6,d=0),t(7,m=0),t(10,v=""),t(1,o=!1)}function x(){t(4,u=f===""||!Number.isInteger(m)||!Number.isInteger(d))}const E=k=>w(k),M=k=>{t(6,d=k.detail),x()},S=k=>{t(7,m=k.detail),x()},P=k=>{t(10,v=k.detail)};return r.$$set=k=>{"title"in k&&t(15,i=k.title),"localeConsts"in k&&t(0,s=k.localeConsts)},[s,o,l,c,u,f,d,m,_,g,v,a,w,y,x,i,E,M,S,P]}class xd extends We{constructor(e){super(),He(this,e,Md,wd,Ge,{title:15,localeConsts:0})}}function Sd(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Cd(r){let e,t,n,i;const s=[Ed,Td],a=[];function o(l,c){return l[2]?1:0}return e=o(r),t=a[e]=s[e](r),{c(){t.c(),n=Dt()},m(l,c){a[e].m(l,c),B(l,n,c),i=!0},p(l,c){let u=e;e=o(l),e===u?a[e].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),t=a[e],t?t.p(l,c):(t=a[e]=s[e](l),t.c()),A(t,1),t.m(n.parentNode,n))},i(l){i||(A(t),i=!0)},o(l){I(t),i=!1},d(l){a[e].d(l),l&&U(n)}}}function Td(r){let e,t,n,i,s,a,o=r[1].citizen_id_label+"",l,c,u=r[3].citizenId+"",f,d,m,h,p=r[1].name_label+"",_,g,v=r[3].name+"",b,w,y,x,E=r[1].job_label+"",M,S,P=r[3].job+"",k,H,V,F,j=r[1].gang_label+"",ce,de,te=r[3].gang+"",re,fe,be,Y,ue=r[1].cash_bank_label+"",pe,W,Me=r[3].cashBalance+"",ye,Te,Se=r[3].bankBalance+"",Ne,Re,Ve,je;return n=new Ft({props:{icon:Gc,class:"txt-2xs"}}),{c(){e=z("div"),t=z("div"),ee(n.$$.fragment),i=K(),s=z("p"),a=z("span"),l=J(o),c=J(": "),f=J(u),d=K(),m=z("p"),h=z("span"),_=J(p),g=J(": "),b=J(v),w=K(),y=z("p"),x=z("span"),M=J(E),S=J(": "),k=J(P),H=K(),V=z("p"),F=z("span"),ce=J(j),de=J(": "),re=J(te),fe=K(),be=z("p"),Y=z("span"),pe=J(ue),W=J(": "),ye=J(Me),Te=J(" / "),Ne=J(Se),L(t,"class","svelte-99a6q2"),L(a,"class","svelte-99a6q2"),L(s,"class","svelte-99a6q2"),L(h,"class","svelte-99a6q2"),L(m,"class","svelte-99a6q2"),L(x,"class","svelte-99a6q2"),L(y,"class","svelte-99a6q2"),L(F,"class","svelte-99a6q2"),L(V,"class","svelte-99a6q2"),L(Y,"class","svelte-99a6q2"),L(be,"class","svelte-99a6q2"),L(e,"class","player-info svelte-99a6q2")},m(qe,it){B(qe,e,it),C(e,t),Q(n,t,null),C(e,i),C(e,s),C(s,a),C(a,l),C(a,c),C(s,f),C(e,d),C(e,m),C(m,h),C(h,_),C(h,g),C(m,b),C(e,w),C(e,y),C(y,x),C(x,M),C(x,S),C(y,k),C(e,H),C(e,V),C(V,F),C(F,ce),C(F,de),C(V,re),C(e,fe),C(e,be),C(be,Y),C(Y,pe),C(Y,W),C(be,ye),C(be,Te),C(be,Ne),Re=!0,Ve||(je=ze(t,"click",r[14]),Ve=!0)},p(qe,it){(!Re||it&2)&&o!==(o=qe[1].citizen_id_label+"")&&he(l,o),(!Re||it&8)&&u!==(u=qe[3].citizenId+"")&&he(f,u),(!Re||it&2)&&p!==(p=qe[1].name_label+"")&&he(_,p),(!Re||it&8)&&v!==(v=qe[3].name+"")&&he(b,v),(!Re||it&2)&&E!==(E=qe[1].job_label+"")&&he(M,E),(!Re||it&8)&&P!==(P=qe[3].job+"")&&he(k,P),(!Re||it&2)&&j!==(j=qe[1].gang_label+"")&&he(ce,j),(!Re||it&8)&&te!==(te=qe[3].gang+"")&&he(re,te),(!Re||it&2)&&ue!==(ue=qe[1].cash_bank_label+"")&&he(pe,ue),(!Re||it&8)&&Me!==(Me=qe[3].cashBalance+"")&&he(ye,Me),(!Re||it&8)&&Se!==(Se=qe[3].bankBalance+"")&&he(Ne,Se)},i(qe){Re||(A(n.$$.fragment,qe),Re=!0)},o(qe){I(n.$$.fragment,qe),Re=!1},d(qe){qe&&U(e),$(n),Ve=!1,je()}}}function Ed(r){let e,t,n,i,s,a,o,l;e=new bn({props:{ddLabel:r[10],dropdownList:r[5],ddId:"player-dd-input",placeholder:r[1].search,selectedValue:r[7]}}),e.$on("searchable-dd-selected-value",r[17]),n=new gt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[9],btnDisabled:r[8],btnId:"submit-btn-player-list-dd-main"}}),n.$on("button-clicked",r[13]);const c=[Pd,Ld],u=[];function f(d,m){return d[0]===d[1].Bring_Player?0:d[0]===d[1].Show_Props?1:-1}return~(s=f(r))&&(a=u[s]=c[s](r)),{c(){ee(e.$$.fragment),t=K(),ee(n.$$.fragment),i=K(),a&&a.c(),o=Dt()},m(d,m){Q(e,d,m),B(d,t,m),Q(n,d,m),B(d,i,m),~s&&u[s].m(d,m),B(d,o,m),l=!0},p(d,m){const h={};m&1024&&(h.ddLabel=d[10]),m&32&&(h.dropdownList=d[5]),m&2&&(h.placeholder=d[1].search),m&128&&(h.selectedValue=d[7]),e.$set(h);const p={};m&512&&(p.buttonLabel=d[9]),m&256&&(p.btnDisabled=d[8]),n.$set(p);let _=s;s=f(d),s===_?~s&&u[s].p(d,m):(a&&(Pe(),I(u[_],1,1,()=>{u[_]=null}),Ae()),~s?(a=u[s],a?a.p(d,m):(a=u[s]=c[s](d),a.c()),A(a,1),a.m(o.parentNode,o)):a=null)},i(d){l||(A(e.$$.fragment,d),A(n.$$.fragment,d),A(a),l=!0)},o(d){I(e.$$.fragment,d),I(n.$$.fragment,d),I(a),l=!1},d(d){$(e,d),d&&U(t),$(n,d),d&&U(i),~s&&u[s].d(d),d&&U(o)}}}function Ld(r){let e,t;return e=new gt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[1].teleport_btn,btnDisabled:r[8],btnId:"submit-btn-player-list-dd-teleport"}}),e.$on("button-clicked",r[16]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&2&&(s.buttonLabel=n[1].teleport_btn),i&256&&(s.btnDisabled=n[8]),e.$set(s)},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Pd(r){let e,t;return e=new gt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[1].send_back_btn,btnDisabled:r[8],btnId:"submit-btn-player-list-dd-send-back"}}),e.$on("button-clicked",r[15]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&2&&(s.buttonLabel=n[1].send_back_btn),i&256&&(s.btnDisabled=n[8]),e.$set(s)},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Ad(r){let e,t,n,i;const s=[Cd,Sd],a=[];function o(l,c){return!l[4]&&!l[6]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Dd(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=vt;ut(r,a,S=>t(20,n=S));let o=!1,l={citizenId:0,name:"",job:"",gang:"",cashBalance:0,bankBalance:0},c=!1,u=[],f=!1,d="",m=!0,h=s.submit,p="",_=s.player,g="getPlayerList";lt(async()=>{t(6,f=!0),v(),n?t(5,u=[{id:1,name:"Sakshi"},{id:2,name:"Pushkar"},{id:3,name:"Monu"},{id:4,name:"Chinu"},{id:5,name:"Vaishnavi"},{id:6,name:"Anvi"},{id:7,name:"Lalla"}]):t(5,u=await De(g)),t(6,f=!1)});function v(){i===s.Clothes_Menu?(p="giveclothes",t(9,h=s.submit)):i===s.Freeze_Player?(p="freezeplayer",t(9,h=s.freeze_btn)):i===s.Revive?(p="reviveplayer",t(9,h=s.revive_btn)):i===s.Teleport_to_Player?(p="teleporttoplayer",t(9,h=s.teleport_btn)):i===s.Open_Inventory?(p="openinventory",t(9,h=s.open_btn)):i===s.Player_Info?(p="getplayerinfo",t(9,h=s.get_info_btn)):i===s.Clear_Inventory?(p="clearInventory",t(9,h=s.clear_btn)):i===s.Bring_Player?(p="bringPlayer",t(9,h=s.bring_btn)):i===s.Spectate_Player?(p="spectatePlayer",t(9,h=s.spectate_btn)):i===s.Saved_Locations?(t(10,_=s.locations_label),g="getSavedLocations",p="sendToSavedLocation",t(9,h=s.submit)):i===s.Open_Trunk?(t(10,_=s.plate_number_label),g="getAllOwnedVehicles",p="openTrunk",t(9,h=s.submit)):i===s.Open_Glovebox?(t(10,_=s.plate_number_label),g="getAllOwnedVehicles",p="openGlovebox",t(9,h=s.submit)):i===s.Unban_Player?(t(10,_=s.player_name_label),g="getBannedPlayers",p="unbanPlayer",t(9,h=s.submit)):i==s.Show_Props?(t(10,_=s.prop_name_label),g="getProps",p="deleteProp",t(9,h=s.delete_btn)):i===s.Drunk_Player?(p="drunkPlayer",t(9,h=s.submit)):i===s.Set_Player_on_Fire?(p="firePlayer",t(9,h=s.submit)):i===s.Slap_Player_In_Sky?(p="slapSky",t(9,h=s.submit)):i===s.Send_Player_To_JailBox?(p="sendToJailBox",t(9,h=s.submit)):i===s.Change_Vehicle_State?(t(10,_=s.plate_number_label),g="getAllOutsideVehicles",p="changeVehicleState",t(9,h=s.submit)):i===s.Force_Logout_Player?(p="forceLogout",t(9,h=s.submit)):i===s.Give_Outfits?(p="giveOutfits",t(9,h=s.submit)):i===s.Damage_Player_Vehicle?(p="damagePlayerVehicle",t(9,h=s.submit)):i===s.Heal?(p="healplayer",t(9,h=s.heal_btn)):i===s.Wipe_Player?(g="getAllUniquePlayers",p="wipePlayer",t(9,h=s.wipe_btn)):i===s.Pee_Player?(p="peePlayer",t(9,h=s.submit)):i===s.Poop_Player?(p="poopPlayer",t(9,h=s.submit)):i===s.Remove_Stress&&(p="removeStress",t(9,h=s.submit))}function b(S){t(7,d=S.detail),d!==""&&t(8,m=!1)}async function w(){t(4,c=!0);const P=await De(p,{selectedPlayer:d});t(8,m=!0),t(7,d=""),i===s.Show_Props&&t(5,u=await De(g)),t(4,c=!1),i===s.Player_Info&&(t(2,o=!0),t(3,l=P))}function y(){t(2,o=!1),t(3,l={citizenId:0,name:"",job:"",gang:"",cashBalance:0,bankBalance:0})}async function x(){t(4,c=!0),await De("sendBackPlayer",{selectedPlayer:d}),t(8,m=!0),t(7,d=""),t(4,c=!1)}async function E(){t(4,c=!0),await De("teleportToProp",{selectedPlayer:d}),t(8,m=!1),t(4,c=!1)}const M=S=>b(S);return r.$$set=S=>{"title"in S&&t(0,i=S.title),"localeConsts"in S&&t(1,s=S.localeConsts)},[i,s,o,l,c,u,f,d,m,h,_,a,b,w,y,x,E,M]}class kd extends We{constructor(e){super(),He(this,e,Dd,Ad,Ge,{title:0,localeConsts:1})}}function Rd(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Id(r){let e,t,n,i,s,a,o,l;e=new bn({props:{ddLabel:r[8],dropdownList:r[3],ddId:"one-dd-input",placeholder:r[1].searchString,selectedValue:r[6]}}),e.$on("searchable-dd-selected-value",r[16]);const c=[zd,Nd],u=[];function f(d,m){return d[0]===d[1].Open_Stash?0:1}return i=f(r),s=u[i]=c[i](r),o=new gt({props:{buttonLabel:r[10],btnDisabled:r[5],btnId:"submit-btn-one-ddone-input"}}),o.$on("button-clicked",r[14]),{c(){ee(e.$$.fragment),t=K(),n=z("div"),s.c(),a=K(),ee(o.$$.fragment),L(n,"class","mtop-1")},m(d,m){Q(e,d,m),B(d,t,m),B(d,n,m),u[i].m(n,null),B(d,a,m),Q(o,d,m),l=!0},p(d,m){const h={};m&256&&(h.ddLabel=d[8]),m&8&&(h.dropdownList=d[3]),m&2&&(h.placeholder=d[1].searchString),m&64&&(h.selectedValue=d[6]),e.$set(h);let p=i;i=f(d),i===p?u[i].p(d,m):(Pe(),I(u[p],1,1,()=>{u[p]=null}),Ae(),s=u[i],s?s.p(d,m):(s=u[i]=c[i](d),s.c()),A(s,1),s.m(n,null));const _={};m&1024&&(_.buttonLabel=d[10]),m&32&&(_.btnDisabled=d[5]),o.$set(_)},i(d){l||(A(e.$$.fragment,d),A(s),A(o.$$.fragment,d),l=!0)},o(d){I(e.$$.fragment,d),I(s),I(o.$$.fragment,d),l=!1},d(d){$(e,d),d&&U(t),d&&U(n),u[i].d(),d&&U(a),$(o,d)}}}function Nd(r){let e,t;return e=new Tn({props:{placeholder:r[11],label:r[9],inputId:"one-dd-string-input",inputValue:r[7],className:"small-panel-inputs txt-sm p-1"}}),e.$on("input-value-update",r[18]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&2048&&(s.placeholder=n[11]),i&512&&(s.label=n[9]),i&128&&(s.inputValue=n[7]),e.$set(s)},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function zd(r){let e,t;return e=new Tn({props:{placeholder:r[11],label:r[9],inputId:"one-dd-string-input",inputValue:r[7],className:"small-panel-inputs txt-sm p-1"}}),e.$on("input-value-update",r[17]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&2048&&(s.placeholder=n[11]),i&512&&(s.label=n[9]),i&128&&(s.inputValue=n[7]),e.$set(s)},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Fd(r){let e,t,n,i;const s=[Id,Rd],a=[];function o(l,c){return!l[2]&&!l[4]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Od(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=vt;ut(r,a,P=>t(21,n=P));let o=!1,l=[],c=!1,u=!0,f="",d,m="",h="",p="",_="",g=s.submit,v=s.search_placeholder;lt(async()=>{t(4,c=!0),b(),n?t(3,l=[{id:1,name:"Job1"},{id:2,name:"Job2"},{id:3,name:"Job3"},{id:4,name:"Job4"},{id:5,name:"Job5"},{id:6,name:"Job6"},{id:7,name:"Job7"}]):t(3,l=await De(_)),t(4,c=!1)});function b(){i===s.Kick?(t(7,d=""),t(8,m=s.player),t(9,h=s.reason),_="getPlayerList",p="kickPlayer",t(10,g=s.kick_btn),t(11,v=s.player_placeholder)):i===s.Warn?(t(7,d=""),t(8,m=s.player),t(9,h=s.reason),_="getPlayerList",p="warnPlayer",t(10,g=s.warn_btn),t(11,v=s.player_placeholder)):i===s.DM_Player?(t(7,d=""),t(8,m=s.player),t(9,h=s.messagePlayerLabel),_="getPlayerList",p="sendDmToPlayer",t(10,g=s.messagePlayerButton),t(11,v=s.player_placeholder)):i===s.Open_Stash&&(t(7,d=""),t(8,m=s.stash_name_label),t(9,h=s.owner_stash_label),_="getStashes",p="openStash",t(10,g=s.submit))}function w(P){t(6,f=P.detail),x()}async function y(){t(2,o=!0),n||await De(p,{selectedValue:f,inputValue:d}),t(5,u=!0),t(6,f=""),t(7,d=""),t(2,o=!1)}function x(){i===s.Open_Stash?t(5,u=!1):t(5,u=d.trim()==="")}const E=P=>w(P),M=P=>{t(7,d=P.detail)},S=P=>{t(7,d=P.detail),x()};return r.$$set=P=>{"title"in P&&t(0,i=P.title),"localeConsts"in P&&t(1,s=P.localeConsts)},[i,s,o,l,c,u,f,d,m,h,g,v,a,w,y,x,E,M,S]}class Ud extends We{constructor(e){super(),He(this,e,Od,Fd,Ge,{title:0,localeConsts:1})}}function Bd(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Vd(r){let e,t,n,i,s,a,o,l;e=new bn({props:{ddLabel:r[0].player,dropdownList:r[3],ddId:"two-dd-player-dd-input",placeholder:r[0].player_placeholder,selectedValue:r[4]}}),e.$on("searchable-dd-selected-value",r[19]),n=new bn({props:{ddLabel:r[10],dropdownList:r[6],ddId:"two-dd-item-dd-input",placeholder:r[0].search_placeholder,selectedValue:r[7]}}),n.$on("searchable-dd-selected-value",r[20]),s=new gt({props:{buttonLabel:r[9],btnDisabled:r[5]||r[8],btnId:"submit-btn-two-dd-player-main"}}),s.$on("button-clicked",r[16]);let c=r[11]&&Ha(r);return{c(){ee(e.$$.fragment),t=K(),ee(n.$$.fragment),i=K(),ee(s.$$.fragment),a=K(),c&&c.c(),o=Dt()},m(u,f){Q(e,u,f),B(u,t,f),Q(n,u,f),B(u,i,f),Q(s,u,f),B(u,a,f),c&&c.m(u,f),B(u,o,f),l=!0},p(u,f){const d={};f&1&&(d.ddLabel=u[0].player),f&8&&(d.dropdownList=u[3]),f&1&&(d.placeholder=u[0].player_placeholder),f&16&&(d.selectedValue=u[4]),e.$set(d);const m={};f&1024&&(m.ddLabel=u[10]),f&64&&(m.dropdownList=u[6]),f&1&&(m.placeholder=u[0].search_placeholder),f&128&&(m.selectedValue=u[7]),n.$set(m);const h={};f&512&&(h.buttonLabel=u[9]),f&288&&(h.btnDisabled=u[5]||u[8]),s.$set(h),u[11]?c?(c.p(u,f),f&2048&&A(c,1)):(c=Ha(u),c.c(),A(c,1),c.m(o.parentNode,o)):c&&(Pe(),I(c,1,1,()=>{c=null}),Ae())},i(u){l||(A(e.$$.fragment,u),A(n.$$.fragment,u),A(s.$$.fragment,u),A(c),l=!0)},o(u){I(e.$$.fragment,u),I(n.$$.fragment,u),I(s.$$.fragment,u),I(c),l=!1},d(u){$(e,u),u&&U(t),$(n,u),u&&U(i),$(s,u),u&&U(a),c&&c.d(u),u&&U(o)}}}function Ha(r){let e,t;return e=new gt({props:{buttonLabel:r[0].revert_btn,btnDisabled:r[12],btnId:"submit-btn-two-dd-player-revert"}}),e.$on("button-clicked",r[17]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&1&&(s.buttonLabel=n[0].revert_btn),i&4096&&(s.btnDisabled=n[12]),e.$set(s)},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Gd(r){let e,t,n,i;const s=[Vd,Bd],a=[];function o(l,c){return!l[1]&&!l[2]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Hd(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=vt;ut(r,a,H=>t(23,n=H));let o=!1,l=!1,c=[],u="",f=!0,d=[],m="",h=!0,p=s.submit,_="",g="",v="",b=!1,w=!0;lt(async()=>{t(2,l=!0),i==s.Change_Ped_Model&&t(11,b=!0),y(),n?t(3,c=[{id:1,name:"Sakshi"},{id:2,name:"Pushkar"},{id:3,name:"Monu"},{id:4,name:"Chinu"},{id:5,name:"Vaishnavi"},{id:6,name:"Anvi"},{id:7,name:"Lalla"}]):t(3,c=await De("getPlayerList")),n?t(6,d=[{id:"police",name:"Level",grade:0},{id:2,name:"Item2"},{id:3,name:"Item3"},{id:4,name:"Item4"}]):t(6,d=await De(g)),t(2,l=!1)});function y(){i===s.Give_Job?(_="setjob",t(10,v=s.jobLabel),g="getJobs",t(9,p=s.submit)):i===s.Give_Car?(_="givecar",t(10,v=s.vehicle),g="getAllVehicles",t(9,p=s.submit)):i===s.Change_Ped_Model?(_="setPedModel",t(10,v=s.modelLabel),g="getModels",t(9,p=s.submit)):i===s.Give_Gang?(_="setGang",t(10,v=s.gangLabel),g="getGangs",t(9,p=s.submit)):i===s.Play_Sound_On_Player?(_="playSoundPlayer",t(10,v=s.soundLabel),g="getSounds",t(9,p=s.submit)):i===s.Give_Perms&&(_="givePerms",t(10,v=s.permsLabel),g="getRoles",t(9,p=s.submit))}function x(H){t(4,u=H.detail),u!==""&&(t(5,f=!1),t(12,w=!1))}function E(H){t(7,m=H.detail),m!==""&&t(8,h=!1)}async function M(){t(1,o=!0),await De(_,{selectedPlayer:u,selectedItem:m}),t(5,f=!0),t(8,h=!0),t(12,w=!0),t(4,u=""),t(7,m=""),t(1,o=!1)}async function S(){t(1,o=!0),await De("revertClothing",{selectedPlayer:u}),t(5,f=!0),t(8,h=!0),t(12,w=!0),t(4,u=""),t(7,m=""),t(1,o=!1)}const P=H=>x(H),k=H=>E(H);return r.$$set=H=>{"title"in H&&t(18,i=H.title),"localeConsts"in H&&t(0,s=H.localeConsts)},[s,o,l,c,u,f,d,m,h,p,v,b,w,a,x,E,M,S,i,P,k]}class Wd extends We{constructor(e){super(),He(this,e,Hd,Gd,Ge,{title:18,localeConsts:0})}}function Xd(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function jd(r){let e,t,n,i,s,a,o,l,c,u,f,d,m,h,p,_;t=new gt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[0].vector2,btnDisabled:!1,btnId:"submit-btn-vector-2"}}),t.$on("button-clicked",r[4]);let g=r[2]==="getVector2"&&Wa(r);a=new gt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[0].vector3,btnDisabled:!1,btnId:"submit-btn-vector-3"}}),a.$on("button-clicked",r[5]);let v=r[2]==="getVector3"&&Xa(r);u=new gt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[0].vector4,btnDisabled:!1,btnId:"submit-btn-vector-4"}}),u.$on("button-clicked",r[6]);let b=r[2]==="getVector4"&&ja(r);h=new gt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[0].copy_json,btnDisabled:!1,btnId:"submit-btn-getJson"}}),h.$on("button-clicked",r[7]);let w=r[2]==="getJson"&&qa(r);return{c(){e=z("div"),ee(t.$$.fragment),n=K(),g&&g.c(),i=K(),s=z("div"),ee(a.$$.fragment),o=K(),v&&v.c(),l=K(),c=z("div"),ee(u.$$.fragment),f=K(),b&&b.c(),d=K(),m=z("div"),ee(h.$$.fragment),p=K(),w&&w.c(),L(e,"class","btn-panel svelte-fd2v0h"),L(s,"class","btn-panel svelte-fd2v0h"),L(c,"class","btn-panel svelte-fd2v0h"),L(m,"class","btn-panel svelte-fd2v0h")},m(y,x){B(y,e,x),Q(t,e,null),C(e,n),g&&g.m(e,null),B(y,i,x),B(y,s,x),Q(a,s,null),C(s,o),v&&v.m(s,null),B(y,l,x),B(y,c,x),Q(u,c,null),C(c,f),b&&b.m(c,null),B(y,d,x),B(y,m,x),Q(h,m,null),C(m,p),w&&w.m(m,null),_=!0},p(y,x){const E={};x&1&&(E.buttonLabel=y[0].vector2),t.$set(E),y[2]==="getVector2"?g?g.p(y,x):(g=Wa(y),g.c(),g.m(e,null)):g&&(g.d(1),g=null);const M={};x&1&&(M.buttonLabel=y[0].vector3),a.$set(M),y[2]==="getVector3"?v?v.p(y,x):(v=Xa(y),v.c(),v.m(s,null)):v&&(v.d(1),v=null);const S={};x&1&&(S.buttonLabel=y[0].vector4),u.$set(S),y[2]==="getVector4"?b?b.p(y,x):(b=ja(y),b.c(),b.m(c,null)):b&&(b.d(1),b=null);const P={};x&1&&(P.buttonLabel=y[0].copy_json),h.$set(P),y[2]==="getJson"?w?w.p(y,x):(w=qa(y),w.c(),w.m(m,null)):w&&(w.d(1),w=null)},i(y){_||(A(t.$$.fragment,y),A(a.$$.fragment,y),A(u.$$.fragment,y),A(h.$$.fragment,y),_=!0)},o(y){I(t.$$.fragment,y),I(a.$$.fragment,y),I(u.$$.fragment,y),I(h.$$.fragment,y),_=!1},d(y){y&&U(e),$(t),g&&g.d(),y&&U(i),y&&U(s),$(a),v&&v.d(),y&&U(l),y&&U(c),$(u),b&&b.d(),y&&U(d),y&&U(m),$(h),w&&w.d()}}}function Wa(r){let e,t=r[0].copy_to_clipboard+"",n;return{c(){e=z("p"),n=J(t),L(e,"class","inline-block svelte-fd2v0h")},m(i,s){B(i,e,s),C(e,n)},p(i,s){s&1&&t!==(t=i[0].copy_to_clipboard+"")&&he(n,t)},d(i){i&&U(e)}}}function Xa(r){let e,t=r[0].copy_to_clipboard+"",n;return{c(){e=z("p"),n=J(t),L(e,"class","inline-block svelte-fd2v0h")},m(i,s){B(i,e,s),C(e,n)},p(i,s){s&1&&t!==(t=i[0].copy_to_clipboard+"")&&he(n,t)},d(i){i&&U(e)}}}function ja(r){let e,t=r[0].copy_to_clipboard+"",n;return{c(){e=z("p"),n=J(t),L(e,"class","inline-block svelte-fd2v0h")},m(i,s){B(i,e,s),C(e,n)},p(i,s){s&1&&t!==(t=i[0].copy_to_clipboard+"")&&he(n,t)},d(i){i&&U(e)}}}function qa(r){let e,t=r[0].copy_to_clipboard+"",n;return{c(){e=z("p"),n=J(t),L(e,"class","inline-block svelte-fd2v0h")},m(i,s){B(i,e,s),C(e,n)},p(i,s){s&1&&t!==(t=i[0].copy_to_clipboard+"")&&he(n,t)},d(i){i&&U(e)}}}function qd(r){let e,t,n,i;const s=[jd,Xd],a=[];function o(l,c){return l[1]?1:0}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Yd(r,e,t){let{localeConsts:n}=e,i="",s=!1,a="";async function o(d){t(2,a=d),t(1,s=!0),i=await De(d);var m=document.createElement("textarea");document.body.appendChild(m),m.value=i,m.select(),document.execCommand("copy"),document.body.removeChild(m),t(1,s=!1)}const l=()=>o("getVector2"),c=()=>o("getVector3"),u=()=>o("getVector4"),f=()=>o("getJson");return r.$$set=d=>{"localeConsts"in d&&t(0,n=d.localeConsts)},[n,s,a,o,l,c,u,f]}class Zd extends We{constructor(e){super(),He(this,e,Yd,qd,Ge,{localeConsts:0})}}function Ya(r,e,t){const n=r.slice();return n[7]=e[t],n}function Kd(r){let e=r[7][r[1]]+"",t;return{c(){t=J(e)},m(n,i){B(n,t,i)},p(n,i){i&3&&e!==(e=n[7][n[1]]+"")&&he(t,e)},d(n){n&&U(t)}}}function Jd(r){let e,t=r[7].id+"",n,i,s=r[7][r[1]]+"",a;return{c(){e=J("("),n=J(t),i=J(") "),a=J(s)},m(o,l){B(o,e,l),B(o,n,l),B(o,i,l),B(o,a,l)},p(o,l){l&1&&t!==(t=o[7].id+"")&&he(n,t),l&3&&s!==(s=o[7][o[1]]+"")&&he(a,s)},d(o){o&&U(e),o&&U(n),o&&U(i),o&&U(a)}}}function Qd(r){let e=r[7]+"",t;return{c(){t=J(e)},m(n,i){B(n,t,i)},p(n,i){i&1&&e!==(e=n[7]+"")&&he(t,e)},d(n){n&&U(t)}}}function Za(r){let e,t,n,i;function s(l,c){return c&1&&(t=null),l[3]?Qd:(t==null&&(t=!!l[7].hasOwnProperty("id")),t?Jd:Kd)}let a=s(r,-1),o=a(r);return{c(){e=z("option"),o.c(),n=K(),e.__value=i=r[1]===null?r[7]:r[7][r[1]],e.value=e.__value},m(l,c){B(l,e,c),o.m(e,null),C(e,n)},p(l,c){a===(a=s(l,c))&&o?o.p(l,c):(o.d(1),o=a(l),o&&(o.c(),o.m(e,n))),c&3&&i!==(i=l[1]===null?l[7]:l[7][l[1]])&&(e.__value=i,e.value=e.__value)},d(l){l&&U(e),o.d()}}}function $d(r){let e,t,n,i,s=r[0],a=[];for(let o=0;o<s.length;o+=1)a[o]=Za(Ya(r,s,o));return{c(){e=z("div"),t=z("select");for(let o=0;o<a.length;o+=1)a[o].c();r[2]===void 0&&fi(()=>r[5].call(t)),L(e,"class","inline-block regular-dropdown")},m(o,l){B(o,e,l),C(e,t);for(let c=0;c<a.length;c+=1)a[c].m(t,null);Da(t,r[2]),n||(i=[ze(t,"change",r[5]),ze(t,"change",r[4])],n=!0)},p(o,[l]){if(l&11){s=o[0];let c;for(c=0;c<s.length;c+=1){const u=Ya(o,s,c);a[c]?a[c].p(u,l):(a[c]=Za(u),a[c].c(),a[c].m(t,null))}for(;c<a.length;c+=1)a[c].d(1);a.length=s.length}l&7&&Da(t,o[2])},i:_e,o:_e,d(o){o&&U(e),Lt(a,o),n=!1,Mt(i)}}}function eh(r,e,t){let{dropdownValues:n,selectKey:i=null}=e,s=i==null,a;const o=ln();function l(){o("regular-dropdown-select",a)}function c(){a=Tu(this),t(2,a),t(1,i),t(0,n)}return r.$$set=u=>{"dropdownValues"in u&&t(0,n=u.dropdownValues),"selectKey"in u&&t(1,i=u.selectKey)},[n,i,a,s,l,c]}class Bi extends We{constructor(e){super(),He(this,e,eh,$d,Ge,{dropdownValues:0,selectKey:1})}}function th(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function nh(r){let e,t,n,i,s,a,o,l,c,u,f,d;return e=new bn({props:{ddLabel:r[0].player,dropdownList:r[3],ddId:"ban-player-dd-input",placeholder:r[0].player_placeholder,selectedValue:r[4]}}),e.$on("searchable-dd-selected-value",r[17]),n=new Ui({props:{placeholder:r[0].ban_time,label:r[0].ban_time,inputId:"ban-player-time-input",inputValue:r[8],className:"inline-block",width:"40%"}}),n.$on("input-value-update",r[18]),s=new Bi({props:{dropdownValues:r[12]}}),s.$on("regular-dropdown-select",r[19]),o=new us({props:{checkboxValue:r[6],checkboxLabel:r[0].permanent,checkboxId:r[6]}}),o.$on("checkbox-clicked",r[20]),c=new Tn({props:{placeholder:r[0].reason_placeholder,label:r[0].reason,inputId:"ban-player-reason-input",inputValue:r[7]}}),c.$on("input-value-update",r[21]),f=new gt({props:{buttonLabel:r[0].ban_btn,btnDisabled:r[5]||r[10],btnId:"submit-btn-ban-player"}}),f.$on("button-clicked",r[15]),{c(){ee(e.$$.fragment),t=K(),ee(n.$$.fragment),i=K(),ee(s.$$.fragment),a=K(),ee(o.$$.fragment),l=K(),ee(c.$$.fragment),u=K(),ee(f.$$.fragment)},m(m,h){Q(e,m,h),B(m,t,h),Q(n,m,h),B(m,i,h),Q(s,m,h),B(m,a,h),Q(o,m,h),B(m,l,h),Q(c,m,h),B(m,u,h),Q(f,m,h),d=!0},p(m,h){const p={};h&1&&(p.ddLabel=m[0].player),h&8&&(p.dropdownList=m[3]),h&1&&(p.placeholder=m[0].player_placeholder),h&16&&(p.selectedValue=m[4]),e.$set(p);const _={};h&1&&(_.placeholder=m[0].ban_time),h&1&&(_.label=m[0].ban_time),h&256&&(_.inputValue=m[8]),n.$set(_);const g={};h&64&&(g.checkboxValue=m[6]),h&1&&(g.checkboxLabel=m[0].permanent),h&64&&(g.checkboxId=m[6]),o.$set(g);const v={};h&1&&(v.placeholder=m[0].reason_placeholder),h&1&&(v.label=m[0].reason),h&128&&(v.inputValue=m[7]),c.$set(v);const b={};h&1&&(b.buttonLabel=m[0].ban_btn),h&1056&&(b.btnDisabled=m[5]||m[10]),f.$set(b)},i(m){d||(A(e.$$.fragment,m),A(n.$$.fragment,m),A(s.$$.fragment,m),A(o.$$.fragment,m),A(c.$$.fragment,m),A(f.$$.fragment,m),d=!0)},o(m){I(e.$$.fragment,m),I(n.$$.fragment,m),I(s.$$.fragment,m),I(o.$$.fragment,m),I(c.$$.fragment,m),I(f.$$.fragment,m),d=!1},d(m){$(e,m),m&&U(t),$(n,m),m&&U(i),$(s,m),m&&U(a),$(o,m),m&&U(l),$(c,m),m&&U(u),$(f,m)}}}function ih(r){let e,t,n,i;const s=[nh,th],a=[];function o(l,c){return!l[1]&&!l[2]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function rh(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=vt;ut(r,a,V=>t(24,n=V));let o=!1,l=!1,c=[],u="",f=!0,d="",m="",h=!1,p="",_,g=["Minutes","Hours","Weeks","Months","Year"],v="Minutes",b=!0;lt(async()=>{t(2,l=!0),w(),n?t(3,c=[{id:1,name:"Sakshi"},{id:2,name:"Pushkar"},{id:3,name:"Monu"},{id:4,name:"Chinu"},{id:5,name:"Vaishnavi"},{id:6,name:"Anvi"},{id:7,name:"Lalla"}]):t(3,c=await De(m)),t(2,l=!1)});function w(){i===s.Ban_Player?(m="getPlayerList",d="banPlayer"):i===s.Ban_Offline_Player&&(m="getAllPlayersOffline",d="banOfflinePlayer")}function y(V){t(4,u=V.detail),u!==""&&t(5,f=!1)}function x(){let V=!1;_!==""&&_!==null&&!h&&_!==void 0&&(V=_.toString().split(".").length>1);let F=h?!1:_<=0||!Number.isInteger(_);t(10,b=F||V||p.trim()==="")}async function E(){t(1,o=!0),await De(d,{selectedPlayer:u,banTime:_,banOpt:v,isPermanent:h==="true"||h===!0,reason:p}),t(5,f=!0),t(4,u=""),t(6,h=!1),t(8,_=0),t(7,p=""),t(9,v="Minutes"),t(1,o=!1)}const M=V=>y(V),S=V=>{t(8,_=V.detail),x()},P=V=>t(9,v=V.detail),k=V=>{t(6,h=V.detail),x()},H=V=>{t(7,p=V.detail),x()};return r.$$set=V=>{"title"in V&&t(16,i=V.title),"localeConsts"in V&&t(0,s=V.localeConsts)},[s,o,l,c,u,f,h,p,_,v,b,a,g,y,x,E,i,M,S,P,k,H]}class sh extends We{constructor(e){super(),He(this,e,rh,ih,Ge,{title:16,localeConsts:0})}}function ah(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function oh(r){let e,t,n,i;return e=new Ui({props:{placeholder:r[5],label:r[3],inputId:"clear-area-input",inputValue:r[2]}}),e.$on("input-value-update",r[10]),n=new gt({props:{buttonLabel:r[4],btnDisabled:r[0],btnId:"submit-btn-change-area"}}),n.$on("button-clicked",r[7]),{c(){ee(e.$$.fragment),t=K(),ee(n.$$.fragment)},m(s,a){Q(e,s,a),B(s,t,a),Q(n,s,a),i=!0},p(s,a){const o={};a&32&&(o.placeholder=s[5]),a&8&&(o.label=s[3]),a&4&&(o.inputValue=s[2]),e.$set(o);const l={};a&16&&(l.buttonLabel=s[4]),a&1&&(l.btnDisabled=s[0]),n.$set(l)},i(s){i||(A(e.$$.fragment,s),A(n.$$.fragment,s),i=!0)},o(s){I(e.$$.fragment,s),I(n.$$.fragment,s),i=!1},d(s){$(e,s),s&&U(t),$(n,s)}}}function lh(r){let e,t,n,i;const s=[oh,ah],a=[];function o(l,c){return l[1]?1:0}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function ch(r,e,t){let{title:n,localeConsts:i}=e,s=!0,a=!1,o,l="",c="",u=i.submit,f=i.search_placeholder;lt(async()=>{d()});function d(){n===i.Clear_Area_Vehicles?(t(2,o=""),i.clear_area,t(3,l=i.radius),c="clearVehicles",t(4,u=i.clear_area),t(5,f=i.enter_radius_placeholder)):n===i.Clear_Area_Peds?(t(2,o=""),i.clear_area,t(3,l=i.radius),c="clearPeds",t(4,u=i.clear_area),t(5,f=i.enter_radius_placeholder)):n===i.Clear_Area_Objects&&(t(2,o=""),i.clear_area,t(3,l=i.radius),c="clearObjects",t(4,u=i.clear_area),t(5,f=i.enter_radius_placeholder))}function m(){t(0,s=o<=0||!Number.isInteger(o))}async function h(){t(1,a=!0),await De(c,{radius:o}),t(0,s=!0),t(2,o=""),t(1,a=!1)}const p=_=>{t(2,o=_.detail),m()};return r.$$set=_=>{"title"in _&&t(8,n=_.title),"localeConsts"in _&&t(9,i=_.localeConsts)},[s,a,o,l,u,f,m,h,n,i,p]}class uh extends We{constructor(e){super(),He(this,e,ch,lh,Ge,{title:8,localeConsts:9})}}function fh(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function dh(r){let e,t,n,i,s;e=new bn({props:{ddLabel:r[8],dropdownList:r[3],ddId:"player-dd-input",placeholder:r[1].search,selectedValue:r[6]}}),e.$on("searchable-dd-selected-value",r[13]);let a=r[0]===r[1].Change_Weather&&Ka(r);return i=new gt({props:{buttonLabel:r[9],btnDisabled:r[7],btnId:"submit-btn-single-dd"}}),i.$on("button-clicked",r[12]),{c(){ee(e.$$.fragment),t=K(),a&&a.c(),n=K(),ee(i.$$.fragment)},m(o,l){Q(e,o,l),B(o,t,l),a&&a.m(o,l),B(o,n,l),Q(i,o,l),s=!0},p(o,l){const c={};l&256&&(c.ddLabel=o[8]),l&8&&(c.dropdownList=o[3]),l&2&&(c.placeholder=o[1].search),l&64&&(c.selectedValue=o[6]),e.$set(c),o[0]===o[1].Change_Weather?a?a.p(o,l):(a=Ka(o),a.c(),a.m(n.parentNode,n)):a&&(a.d(1),a=null);const u={};l&512&&(u.buttonLabel=o[9]),l&128&&(u.btnDisabled=o[7]),i.$set(u)},i(o){s||(A(e.$$.fragment,o),A(i.$$.fragment,o),s=!0)},o(o){I(e.$$.fragment,o),I(i.$$.fragment,o),s=!1},d(o){$(e,o),o&&U(t),a&&a.d(o),o&&U(n),$(i,o)}}}function Ka(r){let e,t=r[1].current_weather+"",n,i,s;return{c(){e=z("div"),n=J(t),i=J(": "),s=J(r[4])},m(a,o){B(a,e,o),C(e,n),C(e,i),C(e,s)},p(a,o){o&2&&t!==(t=a[1].current_weather+"")&&he(n,t),o&16&&he(s,a[4])},d(a){a&&U(e)}}}function hh(r){let e,t,n,i;const s=[dh,fh],a=[];function o(l,c){return!l[2]&&!l[5]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function ph(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=vt;ut(r,a,y=>t(16,n=y));let o=!1,l=[],c="",u=!1,f="",d=!0,m=s.label,h=s.submit,p="",_="";lt(async()=>{t(5,u=!0),g(),n?t(3,l=[{id:1,name:"Sakshi"},{id:2,name:"Pushkar"},{id:3,name:"Monu"},{id:4,name:"Chinu"},{id:5,name:"Vaishnavi"},{id:6,name:"Anvi"},{id:7,name:"Lalla"}]):(t(3,l=await De(_)),t(4,c=await De("getCurrentWeather"))),t(5,u=!1)});function g(){i===s.Change_Weather?(t(8,m=s.weather_label),_="getWeatherList",p="setWeather",t(9,h=s.weather_btn)):i===s.Remove_Perms&&(t(8,m=s.Remove_Perms_label),_="getAdmins",p="removeRoles",t(9,h=s.submit))}function v(y){t(6,f=y.detail),f!==""&&t(7,d=!1)}async function b(){t(2,o=!0),await De(p,{selectedValue:f}),t(6,f=""),t(2,o=!1)}const w=y=>v(y);return r.$$set=y=>{"title"in y&&t(0,i=y.title),"localeConsts"in y&&t(1,s=y.localeConsts)},[i,s,o,l,c,u,f,d,m,h,a,v,b,w]}class mh extends We{constructor(e){super(),He(this,e,ph,hh,Ge,{title:0,localeConsts:1})}}function _h(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function gh(r){let e,t=r[0].time_and_period+"",n,i,s,a,o,l,c,u,f;return a=new Bi({props:{dropdownValues:r[4]}}),a.$on("regular-dropdown-select",r[7]),l=new Bi({props:{dropdownValues:r[5]}}),l.$on("regular-dropdown-select",r[8]),u=new gt({props:{buttonLabel:r[0].change_time,btnDisabled:r[2]===""||r[3]==="",btnId:"submit-btn-change-time"}}),u.$on("button-clicked",r[6]),{c(){e=z("p"),n=J(t),i=J(":"),s=K(),ee(a.$$.fragment),o=K(),ee(l.$$.fragment),c=K(),ee(u.$$.fragment),L(e,"class","block txt-sm panel-labels")},m(d,m){B(d,e,m),C(e,n),C(e,i),B(d,s,m),Q(a,d,m),B(d,o,m),Q(l,d,m),B(d,c,m),Q(u,d,m),f=!0},p(d,m){(!f||m&1)&&t!==(t=d[0].time_and_period+"")&&he(n,t);const h={};m&1&&(h.buttonLabel=d[0].change_time),m&12&&(h.btnDisabled=d[2]===""||d[3]===""),u.$set(h)},i(d){f||(A(a.$$.fragment,d),A(l.$$.fragment,d),A(u.$$.fragment,d),f=!0)},o(d){I(a.$$.fragment,d),I(l.$$.fragment,d),I(u.$$.fragment,d),f=!1},d(d){d&&U(e),d&&U(s),$(a,d),d&&U(o),$(l,d),d&&U(c),$(u,d)}}}function bh(r){let e,t,n,i;const s=[gh,_h],a=[];function o(l,c){return!l[1]&&!vh?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}let vh=!1;function yh(r,e,t){let{localeConsts:n}=e,i=!1,s=[1,2,3,4,5,6,7,8,9,10,11,12],a=["AM","PM"],o="",l="AM";async function c(){t(1,i=!0),await De("setTime",{selectedTime:o,selectedPeriod:l}),t(2,o=""),t(3,l="AM"),t(1,i=!1)}const u=d=>t(2,o=d.detail),f=d=>t(3,l=d.detail);return r.$$set=d=>{"localeConsts"in d&&t(0,n=d.localeConsts)},[n,i,o,l,s,a,c,u,f]}class wh extends We{constructor(e){super(),He(this,e,yh,bh,Ge,{localeConsts:0})}}function Ja(r,e,t){const n=r.slice();return n[18]=e[t],n[20]=t,n}function Mh(r){let e,t,n,i=r[2],s=[];for(let o=0;o<i.length;o+=1)s[o]=Qa(Ja(r,i,o));const a=o=>I(s[o],1,1,()=>{s[o]=null});return t=new gt({props:{buttonLabel:r[1].submit,btnDisabled:r[4],btnId:r[0].keyName+"-submit-btn"}}),t.$on("button-clicked",r[5]),{c(){for(let o=0;o<s.length;o+=1)s[o].c();e=K(),ee(t.$$.fragment)},m(o,l){for(let c=0;c<s.length;c+=1)s[c].m(o,l);B(o,e,l),Q(t,o,l),n=!0},p(o,l){if(l&68){i=o[2];let u;for(u=0;u<i.length;u+=1){const f=Ja(o,i,u);s[u]?(s[u].p(f,l),A(s[u],1)):(s[u]=Qa(f),s[u].c(),A(s[u],1),s[u].m(e.parentNode,e))}for(Pe(),u=i.length;u<s.length;u+=1)a(u);Ae()}const c={};l&2&&(c.buttonLabel=o[1].submit),l&16&&(c.btnDisabled=o[4]),l&1&&(c.btnId=o[0].keyName+"-submit-btn"),t.$set(c)},i(o){if(!n){for(let l=0;l<i.length;l+=1)A(s[l]);A(t.$$.fragment,o),n=!0}},o(o){s=s.filter(Boolean);for(let l=0;l<s.length;l+=1)I(s[l]);I(t.$$.fragment,o),n=!1},d(o){Lt(s,o),o&&U(e),$(t,o)}}}function xh(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Sh(r){let e,t,n;function i(...s){return r[11](r[18],...s)}return t=new bn({props:{ddLabel:r[18].label,dropdownList:r[18].fetchedData,ddId:r[18].type+"-"+r[20],placeholder:r[18].placeholder,selectedValue:r[18].selectedValue}}),t.$on("searchable-dd-selected-value",i),{c(){e=z("div"),ee(t.$$.fragment),L(e,"class","svelte-1wiqead")},m(s,a){B(s,e,a),Q(t,e,null),n=!0},p(s,a){r=s;const o={};a&4&&(o.ddLabel=r[18].label),a&4&&(o.dropdownList=r[18].fetchedData),a&4&&(o.ddId=r[18].type+"-"+r[20]),a&4&&(o.placeholder=r[18].placeholder),a&4&&(o.selectedValue=r[18].selectedValue),t.$set(o)},i(s){n||(A(t.$$.fragment,s),n=!0)},o(s){I(t.$$.fragment,s),n=!1},d(s){s&&U(e),$(t)}}}function Ch(r){let e,t,n;function i(...s){return r[10](r[18],...s)}return t=new us({props:{checkboxValue:r[18].selectedValue,checkboxLabel:r[18].label,checkboxId:r[18].type+"-"+r[20]}}),t.$on("checkbox-clicked",i),{c(){e=z("div"),ee(t.$$.fragment),L(e,"class","svelte-1wiqead")},m(s,a){B(s,e,a),Q(t,e,null),n=!0},p(s,a){r=s;const o={};a&4&&(o.checkboxValue=r[18].selectedValue),a&4&&(o.checkboxLabel=r[18].label),a&4&&(o.checkboxId=r[18].type+"-"+r[20]),t.$set(o)},i(s){n||(A(t.$$.fragment,s),n=!0)},o(s){I(t.$$.fragment,s),n=!1},d(s){s&&U(e),$(t)}}}function Th(r){let e,t,n=r[18].label+"",i,s,a,o,l;function c(...u){return r[9](r[18],...u)}return o=new Bi({props:{dropdownValues:r[18].fetchedData}}),o.$on("regular-dropdown-select",c),{c(){e=z("div"),t=z("p"),i=J(n),s=J(":"),a=K(),ee(o.$$.fragment),L(t,"class","block txt-sm panel-labels"),L(e,"class","svelte-1wiqead")},m(u,f){B(u,e,f),C(e,t),C(t,i),C(t,s),C(e,a),Q(o,e,null),l=!0},p(u,f){r=u,(!l||f&4)&&n!==(n=r[18].label+"")&&he(i,n);const d={};f&4&&(d.dropdownValues=r[18].fetchedData),o.$set(d)},i(u){l||(A(o.$$.fragment,u),l=!0)},o(u){I(o.$$.fragment,u),l=!1},d(u){u&&U(e),$(o)}}}function Eh(r){let e,t,n;function i(...s){return r[8](r[18],...s)}return t=new Ui({props:{placeholder:r[18].placeholder,label:r[18].label,inputId:r[18].type+"-"+r[20],inputValue:r[18].selectedValue}}),t.$on("input-value-update",i),{c(){e=z("div"),ee(t.$$.fragment),L(e,"class","svelte-1wiqead")},m(s,a){B(s,e,a),Q(t,e,null),n=!0},p(s,a){r=s;const o={};a&4&&(o.placeholder=r[18].placeholder),a&4&&(o.label=r[18].label),a&4&&(o.inputId=r[18].type+"-"+r[20]),a&4&&(o.inputValue=r[18].selectedValue),t.$set(o)},i(s){n||(A(t.$$.fragment,s),n=!0)},o(s){I(t.$$.fragment,s),n=!1},d(s){s&&U(e),$(t)}}}function Lh(r){let e,t,n;function i(...s){return r[7](r[18],...s)}return t=new Tn({props:{placeholder:r[18].placeholder,label:r[18].label,inputId:r[18].type+"-"+r[20],inputValue:r[18].selectedValue}}),t.$on("input-value-update",i),{c(){e=z("div"),ee(t.$$.fragment),L(e,"class","svelte-1wiqead")},m(s,a){B(s,e,a),Q(t,e,null),n=!0},p(s,a){r=s;const o={};a&4&&(o.placeholder=r[18].placeholder),a&4&&(o.label=r[18].label),a&4&&(o.inputId=r[18].type+"-"+r[20]),a&4&&(o.inputValue=r[18].selectedValue),t.$set(o)},i(s){n||(A(t.$$.fragment,s),n=!0)},o(s){I(t.$$.fragment,s),n=!1},d(s){s&&U(e),$(t)}}}function Qa(r){let e,t,n,i;const s=[Lh,Eh,Th,Ch,Sh],a=[];function o(l,c){return l[18].type==="string-input"?0:l[18].type==="number-input"?1:l[18].type==="regular-dropdown"?2:l[18].type==="checkbox-input"?3:l[18].type==="searchable-dropdown"?4:-1}return~(e=o(r))&&(t=a[e]=s[e](r)),{c(){t&&t.c(),n=Dt()},m(l,c){~e&&a[e].m(l,c),B(l,n,c),i=!0},p(l,c){let u=e;e=o(l),e===u?~e&&a[e].p(l,c):(t&&(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae()),~e?(t=a[e],t?t.p(l,c):(t=a[e]=s[e](l),t.c()),A(t,1),t.m(n.parentNode,n)):t=null)},i(l){i||(A(t),i=!0)},o(l){I(t),i=!1},d(l){~e&&a[e].d(l),l&&U(n)}}}function Ph(r){let e,t,n,i;const s=[xh,Mh],a=[];function o(l,c){return l[3]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c(),L(e,"class","custom-panel-page svelte-1wiqead")},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Ah(r,e,t){let{panelData:n,localeConsts:i}=e,s="",a=[],o=[],l={},c=!1,u=!0;lt(()=>{t(3,c=!0),s=n.cb,t(2,a=n.components),f(),o=a.filter(w=>w.fillCompulsory),d()});function f(){let w=[];l=a.reduce((x,E)=>(E.fetchDataUrl&&E.fetchDataUrl.trim()!==""&&!l.hasOwnProperty(E.fetchDataUrl)&&(x[E.fetchDataUrl]=null),x),{}),Object.keys(l).map(x=>{w.push(new Promise(async(E,M)=>{const S=await De(x);l[x]=S,E(l)}))}),Promise.all(w).then(x=>{a.map(E=>{E.fetchDataUrl&&l.hasOwnProperty(E.fetchDataUrl.trim())&&(E.fetchedData=l[E.fetchDataUrl.trim()]),E.selectedValue=E.type==="regular-dropdown"?E.fetchedData[0]:E.type==="checkbox-input"?!1:null}),t(3,c=!1)})}function d(){const w=y=>y.selectedValue!==null&&(typeof y.selectedValue=="string"?y.selectedValue.trim()!=="":!0);t(4,u=!o.every(w))}async function m(){t(3,c=!0);let w={};a.map(x=>{w[x.keyName]=x.selectedValue}),await De(s,w);let y=a.map(x=>(x.selectedValue=x.type==="regular-dropdown"?x.fetchedData[0]:x.type==="checkbox-input"?!1:null,x));t(2,a=y),d(),t(3,c=!1)}function h(w,y){y.selectedValue=w.detail,d()}const p=(w,y)=>h(y,w),_=(w,y)=>h(y,w),g=(w,y)=>h(y,w),v=(w,y)=>h(y,w),b=(w,y)=>h(y,w);return r.$$set=w=>{"panelData"in w&&t(0,n=w.panelData),"localeConsts"in w&&t(1,i=w.localeConsts)},[n,i,a,c,u,m,h,p,_,g,v,b]}class Dh extends We{constructor(e){super(),He(this,e,Ah,Ph,Ge,{panelData:0,localeConsts:1})}}function kh(r){let e,t;return e=new Ft({props:{icon:Af,class:"txt-xs"}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Rh(r){let e,t;return e=new Ft({props:{icon:Tf,class:"txt-xs",color:"gold"}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function $a(r){let e,t,n;return t=new Ft({props:{icon:r[3]?ls:gr,class:"txt-xs"}}),{c(){e=z("div"),ee(t.$$.fragment),L(e,"class","chevron-sign")},m(i,s){B(i,e,s),Q(t,e,null),n=!0},p(i,s){const a={};s&8&&(a.icon=i[3]?ls:gr),t.$set(a)},i(i){n||(A(t.$$.fragment,i),n=!0)},o(i){I(t.$$.fragment,i),n=!1},d(i){i&&U(e),$(t)}}}function eo(r){let e,t,n,i;const s=[r[5]];var a=r[4];function o(l){let c={};for(let u=0;u<s.length;u+=1)c=vu(c,s[u]);return{props:c}}return a&&(t=new a(o())),{c(){e=z("div"),t&&ee(t.$$.fragment),L(e,"class","open-panels")},m(l,c){B(l,e,c),t&&Q(t,e,null),i=!0},p(l,c){const u=c&32?Bu(s,[Vu(l[5])]):{};if(a!==(a=l[4])){if(t){Pe();const f=t;I(f.$$.fragment,1,0,()=>{$(f,1)}),Ae()}a?(t=new a(o()),ee(t.$$.fragment),A(t.$$.fragment,1),Q(t,e,null)):t=null}else a&&t.$set(u)},i(l){i||(t&&A(t.$$.fragment,l),fi(()=>{n||(n=as(e,cs,{duration:400},!0)),n.run(1)}),i=!0)},o(l){t&&I(t.$$.fragment,l),n||(n=as(e,cs,{duration:400},!1)),n.run(0),i=!1},d(l){l&&U(e),t&&$(t),l&&n&&n.end()}}}function Ih(r){let e,t,n,i,s,a,o,l,c=r[0].title+"",u,f,d,m,h,p,_;const g=[Rh,kh],v=[];function b(x,E){return x[0].isStarred==="1"?0:1}i=b(r),s=v[i]=g[i](r);let w=r[0].hasPanel&&$a(r),y=r[2]&&eo(r);return{c(){e=z("div"),t=z("div"),n=z("div"),s.c(),a=K(),o=z("div"),l=z("p"),u=J(c),f=K(),w&&w.c(),m=K(),y&&y.c(),L(n,"class","cursor-pointer row-col-panel"),L(l,"class","txt-sm font-medium title"),L(o,"class","panel-title-chevron"),L(t,"id","main-panel"),L(t,"class",d="closed-panel "+r[1])},m(x,E){B(x,e,E),C(e,t),C(t,n),v[i].m(n,null),C(t,a),C(t,o),C(o,l),C(l,u),C(o,f),w&&w.m(o,null),C(e,m),y&&y.m(e,null),h=!0,p||(_=[ze(n,"click",r[7]),ze(o,"click",r[8])],p=!0)},p(x,[E]){let M=i;i=b(x),i===M?v[i].p(x,E):(Pe(),I(v[M],1,1,()=>{v[M]=null}),Ae(),s=v[i],s?s.p(x,E):(s=v[i]=g[i](x),s.c()),A(s,1),s.m(n,null)),(!h||E&1)&&c!==(c=x[0].title+"")&&he(u,c),x[0].hasPanel?w?(w.p(x,E),E&1&&A(w,1)):(w=$a(x),w.c(),A(w,1),w.m(o,null)):w&&(Pe(),I(w,1,1,()=>{w=null}),Ae()),(!h||E&2&&d!==(d="closed-panel "+x[1]))&&L(t,"class",d),x[2]?y?(y.p(x,E),E&4&&A(y,1)):(y=eo(x),y.c(),A(y,1),y.m(e,null)):y&&(Pe(),I(y,1,1,()=>{y=null}),Ae())},i(x){h||(A(s),A(w),A(y),h=!0)},o(x){I(s),I(w),I(y),h=!1},d(x){x&&U(e),v[i].d(),w&&w.d(),y&&y.d(),p=!1,Mt(_)}}}function Nh(r,e,t){let n,{panelData:i,bgColor:s}=e,a=!1,o=!1,l,{locales:c}=vt;ut(r,c,_=>t(9,n=_));let u=n,f=[{component:kd,titles:[u.Clothes_Menu,u.Player_Info,u.Revive,u.Teleport_to_Player,u.Open_Inventory,u.Freeze_Player,u.Clear_Inventory,u.Bring_Player,u.Spectate_Player,u.Saved_Locations,u.Open_Trunk,u.Open_Glovebox,u.Unban_Player,u.Show_Props,u.Drunk_Player,u.Set_Player_on_Fire,u.Slap_Player_In_Sky,u.Send_Player_To_JailBox,u.Change_Vehicle_State,u.Force_Logout_Player,u.Give_Outfits,u.Damage_Player_Vehicle,u.Heal,u.Wipe_Player,u.Pee_Player,u.Poop_Player,u.Remove_Stress]},{component:Ud,titles:[u.Open_Stash,u.Kick,u.Warn,u.DM_Player]},{component:Wd,titles:[u.Give_Car,u.Give_Job,u.Give_Gang,u.Change_Ped_Model,u.Play_Sound_On_Player,u.Give_Perms]},{component:uh,titles:[u.Clear_Area_Vehicles,u.Clear_Area_Peds,u.Clear_Area_Objects]},{component:ld,titles:[u.Give_Item,u.Give_Money]},{component:xd,titles:[u.Create_Job_Stashes,u.Create_Gang_Stashes]},{component:Kf,titles:[u.Announce,u.search_by_citizen_id]},{component:sh,titles:[u.Ban_Offline_Player,u.Ban_Player]},{component:Xf,titles:[u.Spawn_Car]},{component:td,titles:[u.Teleport_Coords]},{component:hd,titles:[u.Change_Plate]},{component:bd,titles:[u.Spawn_Objects]},{component:Zd,titles:[u.Copy_Coordinates]},{component:mh,titles:[u.Change_Weather,u.Remove_Perms]},{component:wh,titles:[u.Change_Time]},{component:Dh,custom:!0}],d={};lt(()=>{i.tabName==="custom"?t(5,d={panelData:i,localeConsts:u}):t(5,d={title:i.title,localeConsts:u})});const m=ln();function h(){t(0,i.isStarred=i.isStarred==="1"?"0":"1",i),localStorage.setItem(i.title,i.isStarred),m("star",{panelData:i})}function p(){i.hasPanel?(f.filter(_=>{(i.tabName==="custom"&&_.hasOwnProperty("custom")&&_.custom||_.hasOwnProperty("titles")&&_.titles.includes(i.title))&&t(4,l=_.component)}),t(3,o=!o),t(2,a=!a)):m("panelClicked",{panelData:i})}return r.$$set=_=>{"panelData"in _&&t(0,i=_.panelData),"bgColor"in _&&t(1,s=_.bgColor)},[i,s,a,o,l,d,c,h,p]}class zh extends We{constructor(e){super(),He(this,e,Nh,Ih,Ge,{panelData:0,bgColor:1})}}function Fh(r){let e,t,n=r[0].choose_theme_label+"",i,s,a,o,l,c,u=r[0].save_btn+"",f,d,m,h;return o=new Bi({props:{dropdownValues:r[2]}}),o.$on("regular-dropdown-select",r[4]),{c(){e=z("div"),t=z("p"),i=J(n),s=J(":"),a=K(),ee(o.$$.fragment),l=K(),c=z("button"),f=J(u),L(t,"class","heading svelte-y55mif"),L(c,"class","block change-theme-btn txt-sm"),L(e,"class","main-body svelte-y55mif")},m(p,_){B(p,e,_),C(e,t),C(t,i),C(t,s),C(e,a),Q(o,e,null),C(e,l),C(e,c),C(c,f),d=!0,m||(h=ze(c,"click",r[3]),m=!0)},p(p,[_]){(!d||_&1)&&n!==(n=p[0].choose_theme_label+"")&&he(i,n),(!d||_&1)&&u!==(u=p[0].save_btn+"")&&he(f,u)},i(p){d||(A(o.$$.fragment,p),d=!0)},o(p){I(o.$$.fragment,p),d=!1},d(p){p&&U(e),$(o),m=!1,h()}}}function Oh(r,e,t){let{localeConsts:n}=e,i=["Original","Dark","Project Sloth by Stone","QBCore by Stone","Surge by rust1co","VLT by Ryder","Vice By NRP","Svein By NRP","Notorious By NRP","NP theme by Jakobe","Emerald Coast Roleplay"],s="";const a=ln();lt(()=>{t(1,s=localStorage.getItem("theme-chosen")?localStorage.getItem("theme-chosen"):i[0]),o()});function o(){localStorage.setItem("theme-chosen",s),a("theme-changed")}const l=c=>t(1,s=c.detail);return r.$$set=c=>{"localeConsts"in c&&t(0,n=c.localeConsts)},[n,s,i,o,l]}class Uh extends We{constructor(e){super(),He(this,e,Oh,Fh,Ge,{localeConsts:0})}}const Bh=()=>{const r={filterAndSort(e,t,n,i,s,a){let o=r.filterArray(e,t,n);return i==="alpha"?r.alphabeticalSort(o,s):r.numericSort(o,s,a)},filterArray(e,t,n){return e.filter(i=>{if(i[t].toLocaleLowerCase().includes(n.toLocaleLowerCase()))return i})},toggleToolTip(e){const t=document.getElementById(e);t.style.visibility=t.style.visibility==="visible"?"hidden":"visible"},alphabeticalSort(e,t){return e.sort((n,i)=>n[t].localeCompare(i[t]))},numericSort(e,t,n){return n==="asc"?e.sort((i,s)=>i[t]-s[t]):e.sort((i,s)=>s[t]-i[t])},booleanSort(e,t,n){return n==="asc"?e.sort((i,s)=>Number(s[t])-Number(i[t])):e.sort((i,s)=>Number(i[t])-Number(s[t]))},upperCaseFirstLetter(e){return e.charAt(0).toUpperCase()+e.slice(1)},changeTimeBasedOnTimeZone(e,t){return e.map(n=>{var i=new Date(n[t]*1e3);let s=Intl.DateTimeFormat().resolvedOptions().timeZone,a=i.toLocaleString("en-US",{timeZone:s});return n.formattedTime=a,n})},copyToClipboard(e){const t=document.createElement("textarea");t.value=e,document.body.appendChild(t),t.select(),document.execCommand("copy"),document.body.removeChild(t)}};return{...r}},et=Bh();function to(r,e,t){const n=r.slice();return n[17]=e[t],n}function no(r,e,t){const n=r.slice();return n[20]=e[t],n}function io(r){let e,t=[],n=new Map,i,s=r[0];const a=o=>o[20];for(let o=0;o<s.length;o+=1){let l=no(r,s,o),c=a(l);n.set(c,t[o]=ro(c,l))}return{c(){e=z("div");for(let o=0;o<t.length;o+=1)t[o].c();L(e,"id","selected-tabs-id"),L(e,"class","selected-tabs svelte-1pl8bk8")},m(o,l){B(o,e,l);for(let c=0;c<t.length;c+=1)t[c].m(e,null);i=!0},p(o,l){if(l&513){s=o[0],Pe();for(let c=0;c<t.length;c+=1)t[c].r();t=xr(t,l,a,1,o,s,n,e,hs,ro,null,no);for(let c=0;c<t.length;c+=1)t[c].a();Ae()}},i(o){if(!i){for(let l=0;l<s.length;l+=1)A(t[l]);i=!0}},o(o){for(let l=0;l<t.length;l+=1)I(t[l]);i=!1},d(o){o&&U(e);for(let l=0;l<t.length;l+=1)t[l].d()}}}function ro(r,e){let t,n=e[20]+"",i,s,a,o,l,c=_e,u,f,d;o=new Ft({props:{icon:Gc,class:"txt-2xs hover:text-gray"}});function m(){return e[12](e[20])}return{key:r,first:null,c(){t=z("div"),i=J(n),s=K(),a=z("div"),ee(o.$$.fragment),L(a,"class","admin-settings-chip-cross"),L(t,"class","txt-sm admin-settings-chip"),this.first=t},m(h,p){B(h,t,p),C(t,i),C(t,s),C(t,a),Q(o,a,null),u=!0,f||(d=ze(a,"click",m),f=!0)},p(h,p){e=h,(!u||p&1)&&n!==(n=e[20]+"")&&he(i,n)},r(){l=t.getBoundingClientRect()},f(){Mr(t),c()},a(){c(),c=wr(t,l,Sr,{duration:1200})},i(h){u||(A(o.$$.fragment,h),u=!0)},o(h){I(o.$$.fragment,h),u=!1},d(h){h&&U(t),$(o),f=!1,d()}}}function Vh(r){let e,t,n,i,s,a,o=r[2].save_btn+"",l,c,u;return{c(){e=z("input"),n=K(),i=z("div"),s=z("div"),a=z("button"),l=J(o),L(e,"type","text"),L(e,"placeholder",t=r[2].search_placeholder),L(e,"class","inline-block"),L(a,"class","admin-settings-save-btn txt-sm"),L(s,"class","admin-settings-save"),L(i,"class","inline-block float-right")},m(f,d){B(f,e,d),zt(e,r[4]),B(f,n,d),B(f,i,d),C(i,s),C(s,a),C(a,l),c||(u=[ze(e,"input",r[13]),ze(e,"keyup",r[8]),ze(a,"click",r[10])],c=!0)},p(f,d){d&4&&t!==(t=f[2].search_placeholder)&&L(e,"placeholder",t),d&16&&e.value!==f[4]&&zt(e,f[4]),d&4&&o!==(o=f[2].save_btn+"")&&he(l,o)},d(f){f&&U(e),f&&U(n),f&&U(i),c=!1,Mt(u)}}}function Gh(r){let e,t=r[2].search_panels_placeholder+"",n;return{c(){e=z("p"),n=J(t),L(e,"class","txt-sm")},m(i,s){B(i,e,s),C(e,n)},p(i,s){s&4&&t!==(t=i[2].search_panels_placeholder+"")&&he(n,t)},d(i){i&&U(e)}}}function so(r){let e,t=[],n=new Map,i=r[5];const s=a=>a[17];for(let a=0;a<i.length;a+=1){let o=to(r,i,a),l=s(o);n.set(l,t[a]=ao(l,o))}return{c(){e=z("div");for(let a=0;a<t.length;a+=1)t[a].c();L(e,"id","dropdownmenu"),L(e,"class","admin-settings-show-drop-down")},m(a,o){B(a,e,o);for(let l=0;l<t.length;l+=1)t[l].m(e,null)},p(a,o){if(o&160){i=a[5];for(let l=0;l<t.length;l+=1)t[l].r();t=xr(t,o,s,1,a,i,n,e,Uu,ao,null,to);for(let l=0;l<t.length;l+=1)t[l].a()}},d(a){a&&U(e);for(let o=0;o<t.length;o+=1)t[o].d()}}}function ao(r,e){let t,n=e[17].title+"",i,s,a=_e,o,l;function c(){return e[14](e[17])}return{key:r,first:null,c(){t=z("p"),i=J(n),this.first=t},m(u,f){B(u,t,f),C(t,i),o||(l=ze(t,"click",c),o=!0)},p(u,f){e=u,f&32&&n!==(n=e[17].title+"")&&he(i,n)},r(){s=t.getBoundingClientRect()},f(){Mr(t),a()},a(){a(),a=wr(t,s,Sr,{duration:500})},d(u){u&&U(t),o=!1,l()}}}function Hh(r){let e,t,n=r[2].choose_options_for_role_access_text+"",i,s,a,o,l,c,u,f,d,m,h,p,_=r[0].length>0&&io(r);function g(y,x){return y[0].length===0&&!y[3]?Gh:Vh}let v=g(r),b=v(r),w=r[3]&&so(r);return{c(){e=z("div"),t=z("div"),i=J(n),s=K(),a=J(r[1]),o=J(":"),l=K(),_&&_.c(),c=K(),u=z("div"),b.c(),d=K(),w&&w.c(),L(t,"class","txt-md heading svelte-1pl8bk8"),L(u,"class",f="admin-settings-search-bar "+(r[0].length===0&&!r[3]?"mtop-2":"")),L(u,"id","search"),L(e,"id","main-setting-body-id"),L(e,"class","main-body-2 svelte-1pl8bk8")},m(y,x){B(y,e,x),C(e,t),C(t,i),C(t,s),C(t,a),C(t,o),C(e,l),_&&_.m(e,null),C(e,c),C(e,u),b.m(u,null),C(e,d),w&&w.m(e,null),m=!0,h||(p=ze(u,"click",r[6]),h=!0)},p(y,[x]){(!m||x&4)&&n!==(n=y[2].choose_options_for_role_access_text+"")&&he(i,n),(!m||x&2)&&he(a,y[1]),y[0].length>0?_?(_.p(y,x),x&1&&A(_,1)):(_=io(y),_.c(),A(_,1),_.m(e,c)):_&&(Pe(),I(_,1,1,()=>{_=null}),Ae()),v===(v=g(y))&&b?b.p(y,x):(b.d(1),b=v(y),b&&(b.c(),b.m(u,null))),(!m||x&9&&f!==(f="admin-settings-search-bar "+(y[0].length===0&&!y[3]?"mtop-2":"")))&&L(u,"class",f),y[3]?w?w.p(y,x):(w=so(y),w.c(),w.m(e,null)):w&&(w.d(1),w=null)},i(y){m||(A(_),m=!0)},o(y){I(_),m=!1},d(y){y&&U(e),_&&_.d(),b.d(),w&&w.d(),h=!1,p()}}}function Wh(r,e,t){let{dropdownMenu:n}=e,{selectedValues:i=[]}=e,{role:s,localeConsts:a}=e,o=!1,l="",c=[];lt(()=>{t(5,c=u()),t(5,c=et.alphabeticalSort(c,"title"))});function u(){return t(5,c=n.filter(b=>{if(!i.includes(b.title))return b})),c}function f(){t(3,o=!0),t(5,c=u()),t(5,c=et.alphabeticalSort(c,"title"))}function d(b){i.push(b.title),t(0,i),t(5,c=u()),m(),i.length>0&&(document.getElementById("selected-tabs-id"),document.getElementById("main-setting-body-id"),document.getElementById("search"),document.getElementById("dropdownmenu"))}function m(){u();let b=c.filter(w=>{if(w.title.toLocaleLowerCase().includes(l.toLocaleLowerCase()))return w});t(5,c=et.alphabeticalSort(b,"title"))}function h(b){const w=i.indexOf(b);i.splice(w,1),t(0,i),m()}async function p(){await De("saveModeratorCommands",{role:s,selectedValues:i})}const _=b=>h(b);function g(){l=this.value,t(4,l)}const v=b=>d(b);return r.$$set=b=>{"dropdownMenu"in b&&t(11,n=b.dropdownMenu),"selectedValues"in b&&t(0,i=b.selectedValues),"role"in b&&t(1,s=b.role),"localeConsts"in b&&t(2,a=b.localeConsts)},[i,s,a,o,l,c,f,d,m,h,p,n,_,g,v]}class Xh extends We{constructor(e){super(),He(this,e,Wh,Hh,Ge,{dropdownMenu:11,selectedValues:0,role:1,localeConsts:2})}}function jh(r){let e,t,n,i,s,a;e=new Bi({props:{dropdownValues:r[2]}}),e.$on("regular-dropdown-select",r[9]);const o=[Zh,Yh],l=[];function c(u,f){return u[6]?0:1}return n=c(r),i=l[n]=o[n](r),{c(){ee(e.$$.fragment),t=K(),i.c(),s=Dt()},m(u,f){Q(e,u,f),B(u,t,f),l[n].m(u,f),B(u,s,f),a=!0},p(u,f){const d={};f&4&&(d.dropdownValues=u[2]),e.$set(d);let m=n;n=c(u),n===m?l[n].p(u,f):(Pe(),I(l[m],1,1,()=>{l[m]=null}),Ae(),i=l[n],i?i.p(u,f):(i=l[n]=o[n](u),i.c()),A(i,1),i.m(s.parentNode,s))},i(u){a||(A(e.$$.fragment,u),A(i),a=!0)},o(u){I(e.$$.fragment,u),I(i),a=!1},d(u){$(e,u),u&&U(t),l[n].d(u),u&&U(s)}}}function qh(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Yh(r){let e,t;return e=new Xh({props:{dropdownMenu:r[0],selectedValues:r[4],role:r[3],localeConsts:r[1]}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&1&&(s.dropdownMenu=n[0]),i&16&&(s.selectedValues=n[4]),i&8&&(s.role=n[3]),i&2&&(s.localeConsts=n[1]),e.$set(s)},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Zh(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Kh(r){let e,t,n=r[1].choose_role_for_panel_visibility+"",i,s,a,o,l,c;const u=[qh,jh],f=[];function d(m,h){return m[5]?0:1}return o=d(r),l=f[o]=u[o](r),{c(){e=z("div"),t=z("p"),i=J(n),s=J(":"),a=K(),l.c(),L(t,"class","heading svelte-18n19w0"),L(e,"class","main-body svelte-18n19w0")},m(m,h){B(m,e,h),C(e,t),C(t,i),C(t,s),C(e,a),f[o].m(e,null),c=!0},p(m,[h]){(!c||h&2)&&n!==(n=m[1].choose_role_for_panel_visibility+"")&&he(i,n);let p=o;o=d(m),o===p?f[o].p(m,h):(Pe(),I(f[p],1,1,()=>{f[p]=null}),Ae(),l=f[o],l?l.p(m,h):(l=f[o]=u[o](m),l.c()),A(l,1),l.m(e,null))},i(m){c||(A(l),c=!0)},o(m){I(l),c=!1},d(m){m&&U(e),f[o].d()}}}function Jh(r,e,t){let n,{panels:i,localeConsts:s}=e,{isDev:a}=vt;ut(r,a,h=>t(10,n=h));let o=[],l="",c=[],u=!1,f=!1;lt(async()=>{t(5,u=!0),n?t(2,o=["Moderator","Admin"]):t(2,o=await De("getAllRoles")),await d(o[0]),t(5,u=!1),i.push({title:s.side_panel_player_list}),i.push({title:s.dev_mode_side_panel}),i.push({title:s.debug_mode_side_panel}),i.push({title:s.resources_side_panel}),i.push({title:s.reports_side_panel})});async function d(h){t(6,f=!0),t(3,l=h);const p={role:l};let _=[];n?_=["Admin Car","Announce"]:_=await De("getRoleWisePanels",p),t(4,c=_),t(6,f=!1)}const m=h=>d(h.detail);return r.$$set=h=>{"panels"in h&&t(0,i=h.panels),"localeConsts"in h&&t(1,s=h.localeConsts)},[i,s,o,l,c,u,f,a,d,m]}class Qh extends We{constructor(e){super(),He(this,e,Jh,Kh,Ge,{panels:0,localeConsts:1})}}const $h=()=>({...{canSendMessage(e,t){return e.key==="Enter"&&t!==""},scrollToTop(e,t){setTimeout(()=>{let n=document.getElementById(e);n.scrollTop=n.scrollHeight},t)}}}),On=$h();function oo(r,e,t){const n=r.slice();return n[11]=e[t],n}function ep(r){let e,t,n,i,s,a,o,l,c,u,f=r[1],d=[];for(let m=0;m<f.length;m+=1)d[m]=lo(oo(r,f,m));return o=new Ft({props:{icon:Cf}}),{c(){e=z("div");for(let m=0;m<d.length;m+=1)d[m].c();t=K(),n=z("div"),i=z("textarea"),s=K(),a=z("div"),ee(o.$$.fragment),L(e,"id","chat-display"),L(e,"class","display-chats svelte-6tspht"),L(i,"class","send-message-input"),L(a,"class","send-msg-icon"),L(n,"class","sending-message-wrapper")},m(m,h){B(m,e,h);for(let p=0;p<d.length;p+=1)d[p].m(e,null);B(m,t,h),B(m,n,h),C(n,i),zt(i,r[3]),C(n,s),C(n,a),Q(o,a,null),l=!0,c||(u=[ze(i,"input",r[9]),ze(a,"click",r[6]),ze(n,"keypress",r[8])],c=!0)},p(m,h){if(h&6){f=m[1];let p;for(p=0;p<f.length;p+=1){const _=oo(m,f,p);d[p]?d[p].p(_,h):(d[p]=lo(_),d[p].c(),d[p].m(e,null))}for(;p<d.length;p+=1)d[p].d(1);d.length=f.length}h&8&&zt(i,m[3])},i(m){l||(A(o.$$.fragment,m),l=!0)},o(m){I(o.$$.fragment,m),l=!1},d(m){m&&U(e),Lt(d,m),m&&U(t),m&&U(n),$(o),c=!1,Mt(u)}}}function tp(r){let e,t;return e=new ft({props:{isBig:!0}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function lo(r){let e,t=r[11].msg+"",n,i,s,a,o=r[11].name+"",l,c;return{c(){e=z("div"),n=J(t),s=K(),a=z("small"),l=J(o),L(e,"class",i="chat-panel "+(r[2]===r[11].name?"adjust-border-self even-pane-panel-bg":"adjust-border-others")+" svelte-6tspht"),L(a,"class",c="txt-2xs "+(r[2]===r[11].name?"adjust-border-self":"adjust-border-others")+" svelte-6tspht")},m(u,f){B(u,e,f),C(e,n),B(u,s,f),B(u,a,f),C(a,l)},p(u,f){f&2&&t!==(t=u[11].msg+"")&&he(n,t),f&6&&i!==(i="chat-panel "+(u[2]===u[11].name?"adjust-border-self even-pane-panel-bg":"adjust-border-others")+" svelte-6tspht")&&L(e,"class",i),f&2&&o!==(o=u[11].name+"")&&he(l,o),f&6&&c!==(c="txt-2xs "+(u[2]===u[11].name?"adjust-border-self":"adjust-border-others")+" svelte-6tspht")&&L(a,"class",c)},d(u){u&&U(e),u&&U(s),u&&U(a)}}}function np(r){let e,t,n,i,s=r[0].admin_menu_chat_heading+"",a,o,l,c,u,f,d,m,h,p;c=new Ft({props:{icon:lf,class:"txt-sm"}});const _=[tp,ep],g=[];function v(b,w){return b[4]?0:1}return f=v(r),d=g[f]=_[f](r),{c(){e=z("div"),t=z("div"),n=z("div"),i=z("p"),a=J(s),o=K(),l=z("div"),ee(c.$$.fragment),u=K(),d.c(),L(n,"class","heading"),L(l,"class","refresh"),L(t,"class","chat-header"),L(e,"class","main-body svelte-6tspht")},m(b,w){B(b,e,w),C(e,t),C(t,n),C(n,i),C(i,a),C(t,o),C(t,l),Q(c,l,null),C(e,u),g[f].m(e,null),m=!0,h||(p=ze(l,"click",r[7]),h=!0)},p(b,[w]){(!m||w&1)&&s!==(s=b[0].admin_menu_chat_heading+"")&&he(a,s);let y=f;f=v(b),f===y?g[f].p(b,w):(Pe(),I(g[y],1,1,()=>{g[y]=null}),Ae(),d=g[f],d?d.p(b,w):(d=g[f]=_[f](b),d.c()),A(d,1),d.m(e,null))},i(b){m||(A(c.$$.fragment,b),A(d),m=!0)},o(b){I(c.$$.fragment,b),I(d),m=!1},d(b){b&&U(e),$(c),g[f].d(),h=!1,p()}}}function ip(r,e,t){let n,{localeConsts:i}=e,{isDev:s}=vt;ut(r,s,h=>t(10,n=h));let a=[],o="",l="",c=!1;lt(async()=>{t(4,c=!0);let h={};n?h={chats:[{id:1,name:"name1#1234",msg:"Hey whatsup",time:1670784600},{id:2,name:"Sakshi",msg:"hello",time:1670784600},{id:3,name:"Pushkar",msg:"hi",time:1670784600},{id:4,name:"Sakshi",msg:"hi, im good. what is this nonsense",time:1670784600},{id:5,name:"Monu",msg:"well",time:1670784600},{id:6,name:"Pushkar",msg:"how are you",time:1670784600},{id:7,name:"Monu",msg:"where are you whereare you?? where are you ewwwrweffsdfdsgskhgskjfjksfksfkjsdgkdskjdsnvkjsndjvkngsjkfnjsknvkjnskj",time:1670784600},{id:8,name:"Sakshi",msg:"sad",time:1670784600}],currUserName:"Sakshi"}:h=await De("getAdminChats"),t(1,a=et.numericSort(h.chats,"id","asc")),t(2,o=h.currUserName),t(4,c=!1)});async function u(){if(t(4,c=!0),l!==""){const h={userName:o,message:l};let p={};n?p={chats:[{id:1,name:"name1#1234",msg:"Hey whatsup",time:1670784600},{id:2,name:"Sakshi",msg:"hello",time:1670784600},{id:3,name:"Pushkar",msg:"hi",time:1670784600},{id:4,name:"Sakshi",msg:"hi, im good. what is this nonsense",time:1670784600},{id:5,name:"Monu",msg:"well",time:1670784600},{id:6,name:"Pushkar",msg:"how are you",time:1670784600},{id:7,name:"Monu",msg:"where are you whereare you?? where are you ewwwrweffsdfdsgskhgskjfjksfksfkjsdgkdskjdsnvkjsndjvkngsjkfnjsknvkjnskj",time:1670784600},{id:8,name:"Sakshi",msg:"sad",time:1670784600}],currUserName:"Sakshi"}:p=await De("adminMessageSent",h),t(1,a=et.numericSort(p.chats,"id","asc"))}t(3,l=""),t(4,c=!1),On.scrollToTop("chat-display",100)}async function f(){t(4,c=!0);let h={};n?h={chats:[{id:1,name:"name1#1234",msg:"Hey whatsup",time:1670784600},{id:2,name:"Sakshi",msg:"hello",time:1670784600},{id:3,name:"Pushkar",msg:"hi",time:1670784600},{id:4,name:"Sakshi",msg:"hi, im good. what is this nonsense",time:1670784600},{id:5,name:"Monu",msg:"well",time:1670784600},{id:6,name:"Pushkar",msg:"how are you",time:1670784600},{id:7,name:"Monu",msg:"where are you whereare you?? where are you ewwwrweffsdfdsgskhgskjfjksfksfkjsdgkdskjdsnvkjsndjvkngsjkfnjsknvkjnskj",time:1670784600},{id:8,name:"Sakshi",msg:"sad",time:1670784600}],currUserName:"Sakshi"}:h=await De("refreshChats"),t(1,a=et.numericSort(h.chats,"id","asc")),t(4,c=!1),On.scrollToTop("chat-display",100)}function d(h){On.canSendMessage(h,l)&&u()}function m(){l=this.value,t(3,l)}return r.$$set=h=>{"localeConsts"in h&&t(0,i=h.localeConsts)},[i,a,o,l,c,s,u,f,d,m]}class rp extends We{constructor(e){super(),He(this,e,ip,np,Ge,{localeConsts:0})}}function co(r){let e,t,n,i,s,a,o,l=r[1].report_confirm_label+"",c,u,f,d=r[1].report_cancel_label+"",m,h,p;return{c(){e=z("div"),t=z("p"),n=J(r[0]),i=J("?"),s=K(),a=z("div"),o=z("button"),c=J(l),u=K(),f=z("button"),m=J(d),L(t,"class","txt-md"),L(o,"class","small-modal-btns txt-md confirm-btn"),L(f,"class","small-modal-btns txt-md cancel-btn"),L(a,"class","block"),L(e,"class","modal-body small-modal-body")},m(_,g){B(_,e,g),C(e,t),C(t,n),C(t,i),C(e,s),C(e,a),C(a,o),C(o,c),C(a,u),C(a,f),C(f,m),h||(p=[ze(o,"click",r[4]),ze(f,"click",r[3])],h=!0)},p(_,g){g&1&&he(n,_[0]),g&2&&l!==(l=_[1].report_confirm_label+"")&&he(c,l),g&2&&d!==(d=_[1].report_cancel_label+"")&&he(m,d)},d(_){_&&U(e),h=!1,Mt(p)}}}function uo(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function sp(r){let e,t,n,i,s,a=!r[2]&&co(r),o=r[2]&&uo();return{c(){e=z("div"),t=z("div"),n=z("div"),a&&a.c(),i=K(),o&&o.c(),L(n,"class","modal-content small-modal-content"),L(t,"class","modal-dialog small-modal-dialog"),L(e,"class","modal small-modal"),L(e,"tabindex","-1"),L(e,"aria-hidden","true")},m(l,c){B(l,e,c),C(e,t),C(t,n),a&&a.m(n,null),C(n,i),o&&o.m(n,null),s=!0},p(l,[c]){l[2]?a&&(a.d(1),a=null):a?a.p(l,c):(a=co(l),a.c(),a.m(n,i)),l[2]?o?c&4&&A(o,1):(o=uo(),o.c(),A(o,1),o.m(n,null)):o&&(Pe(),I(o,1,1,()=>{o=null}),Ae())},i(l){s||(A(o),s=!0)},o(l){I(o),s=!1},d(l){l&&U(e),a&&a.d(),o&&o.d()}}}function ap(r,e,t){const n=ln();let{whatToDelete:i="selected data"}=e,{localeConsts:s}=e,a=!1;function o(){n("closeModal")}function l(){t(2,a=!0),n("confirmModalAction"),t(2,a=!1)}return r.$$set=c=>{"whatToDelete"in c&&t(0,i=c.whatToDelete),"localeConsts"in c&&t(1,s=c.localeConsts)},[i,s,a,o,l]}class op extends We{constructor(e){super(),He(this,e,ap,sp,Ge,{whatToDelete:0,localeConsts:1})}}function fo(r,e,t){const n=r.slice();return n[24]=e[t],n}function ho(r,e,t){const n=r.slice();return n[27]=e[t],n}function lp(r){let e,t,n,i=r[0].id+"",s,a,o=r[0].name+"",l,c,u,f,d,m,h,p,_,g,v,b,w,y=r[15],x=[];for(let k=0;k<y.length;k+=1)x[k]=po(ho(r,y,k));const E=k=>I(x[k],1,1,()=>{x[k]=null});m=new Ft({props:{icon:ff}});const M=[fp,up],S=[];function P(k,H){return k[2]?0:1}return p=P(r),_=S[p]=M[p](r),{c(){e=z("div"),t=z("div"),n=J("("),s=J(i),a=J(") "),l=J(o),c=K(),u=z("div");for(let k=0;k<x.length;k+=1)x[k].c();f=K(),d=z("div"),ee(m.$$.fragment),h=K(),_.c(),g=Dt(),L(t,"class","txt-sm"),L(d,"class","close-icon txt-sm"),L(u,"class","report-children-icons"),L(e,"class","report-info")},m(k,H){B(k,e,H),C(e,t),C(t,n),C(t,s),C(t,a),C(t,l),C(e,c),C(e,u);for(let V=0;V<x.length;V+=1)x[V].m(u,null);C(u,f),C(u,d),Q(m,d,null),B(k,h,H),S[p].m(k,H),B(k,g,H),v=!0,b||(w=ze(d,"click",r[9]),b=!0)},p(k,H){if((!v||H&1)&&i!==(i=k[0].id+"")&&he(s,i),(!v||H&1)&&o!==(o=k[0].name+"")&&he(l,o),H&33794){y=k[15];let F;for(F=0;F<y.length;F+=1){const j=ho(k,y,F);x[F]?(x[F].p(j,H),A(x[F],1)):(x[F]=po(j),x[F].c(),A(x[F],1),x[F].m(u,f))}for(Pe(),F=y.length;F<x.length;F+=1)E(F);Ae()}let V=p;p=P(k),p===V?S[p].p(k,H):(Pe(),I(S[V],1,1,()=>{S[V]=null}),Ae(),_=S[p],_?_.p(k,H):(_=S[p]=M[p](k),_.c()),A(_,1),_.m(g.parentNode,g))},i(k){if(!v){for(let H=0;H<y.length;H+=1)A(x[H]);A(m.$$.fragment,k),A(_),v=!0}},o(k){x=x.filter(Boolean);for(let H=0;H<x.length;H+=1)I(x[H]);I(m.$$.fragment,k),I(_),v=!1},d(k){k&&U(e),Lt(x,k),$(m),k&&U(h),S[p].d(k),k&&U(g),b=!1,w()}}}function cp(r){let e,t;return e=new op({props:{whatToDelete:r[7],localeConsts:r[1]}}),e.$on("closeModal",r[16]),e.$on("confirmModalAction",r[11]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&128&&(s.whatToDelete=n[7]),i&2&&(s.localeConsts=n[1]),e.$set(s)},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function po(r){let e,t,n,i,s=r[1][r[27].localConstKey]+"",a,o,l,c;t=new Ft({props:{icon:r[27].icon}});function u(){return r[17](r[27])}function f(){return r[18](r[27])}function d(){return r[19](r[27])}return{c(){e=z("div"),ee(t.$$.fragment),n=K(),i=z("span"),a=J(s),L(i,"id",r[27].id),L(i,"class","tool-tip-text-top-report"),L(e,"class","close-icon txt-sm")},m(m,h){B(m,e,h),Q(t,e,null),C(e,n),C(e,i),C(i,a),o=!0,l||(c=[ze(e,"click",u),ze(e,"mouseenter",f),ze(e,"mouseleave",d)],l=!0)},p(m,h){r=m,(!o||h&2)&&s!==(s=r[1][r[27].localConstKey]+"")&&he(a,s)},i(m){o||(A(t.$$.fragment,m),o=!0)},o(m){I(t.$$.fragment,m),o=!1},d(m){m&&U(e),$(t),l=!1,Mt(c)}}}function up(r){let e,t,n,i,s,a,o,l=r[1].close_btn+"",c,u,f,d=r[1].send_btn+"",m,h,p,_,g=r[3],v=[];for(let b=0;b<g.length;b+=1)v[b]=mo(fo(r,g,b));return{c(){e=z("div");for(let b=0;b<v.length;b+=1)v[b].c();t=K(),n=z("div"),i=z("textarea"),s=K(),a=z("div"),o=z("button"),c=J(l),u=K(),f=z("button"),m=J(d),L(e,"id","chat-display"),L(e,"class","report-display-message-wrapper svelte-15b8wcv"),L(i,"class","report-send-message-input"),L(o,"class","txt-xs report-admin-btns-close"),L(f,"class",h="txt-xs report-admin-btns-send "+(r[5].trim()===""?"disable-icon":"report-admin-btns-send-enabled")+" svelte-15b8wcv"),L(a,"class","report-admin-btns"),L(n,"class","report-send-message-wrapper")},m(b,w){B(b,e,w);for(let y=0;y<v.length;y+=1)v[y].m(e,null);B(b,t,w),B(b,n,w),C(n,i),zt(i,r[5]),C(n,s),C(n,a),C(a,o),C(o,c),C(a,u),C(a,f),C(f,m),p||(_=[ze(i,"input",r[20]),ze(o,"click",r[12]),ze(f,"click",r[21]),ze(n,"keypress",r[14])],p=!0)},p(b,w){if(w&24){g=b[3];let y;for(y=0;y<g.length;y+=1){const x=fo(b,g,y);v[y]?v[y].p(x,w):(v[y]=mo(x),v[y].c(),v[y].m(e,null))}for(;y<v.length;y+=1)v[y].d(1);v.length=g.length}w&32&&zt(i,b[5]),w&2&&l!==(l=b[1].close_btn+"")&&he(c,l),w&2&&d!==(d=b[1].send_btn+"")&&he(m,d),w&32&&h!==(h="txt-xs report-admin-btns-send "+(b[5].trim()===""?"disable-icon":"report-admin-btns-send-enabled")+" svelte-15b8wcv")&&L(f,"class",h)},i:_e,o:_e,d(b){b&&U(e),Lt(v,b),b&&U(t),b&&U(n),p=!1,Mt(_)}}}function fp(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function mo(r){let e,t,n=r[24].message+"",i,s,a,o,l=(r[4]===r[24].sender?"You":r[24].sender)+"",c,u,f=r[24].formattedTime+"",d,m,h;return{c(){e=z("div"),t=z("div"),i=J(n),a=K(),o=z("small"),c=J(l),u=J(", "),d=J(f),h=K(),L(t,"class",s="report-chat-panel "+(r[4]===r[24].sender?"adjust-border-self even-pane-panel-bg":"adjust-border-others")+" svelte-15b8wcv"),L(o,"class",m="sender-info-display "+(r[4]===r[24].sender?"adjust-border-self":"adjust-border-others")+" svelte-15b8wcv"),L(e,"class","report-chat-body svelte-15b8wcv")},m(p,_){B(p,e,_),C(e,t),C(t,i),C(e,a),C(e,o),C(o,c),C(o,u),C(o,d),C(e,h)},p(p,_){_&8&&n!==(n=p[24].message+"")&&he(i,n),_&24&&s!==(s="report-chat-panel "+(p[4]===p[24].sender?"adjust-border-self even-pane-panel-bg":"adjust-border-others")+" svelte-15b8wcv")&&L(t,"class",s),_&24&&l!==(l=(p[4]===p[24].sender?"You":p[24].sender)+"")&&he(c,l),_&8&&f!==(f=p[24].formattedTime+"")&&he(d,f),_&24&&m!==(m="sender-info-display "+(p[4]===p[24].sender?"adjust-border-self":"adjust-border-others")+" svelte-15b8wcv")&&L(o,"class",m)},d(p){p&&U(e)}}}function dp(r){let e,t,n,i;const s=[cp,lp],a=[];function o(l,c){return l[6]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c(),L(e,"class","main-body svelte-15b8wcv")},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(Pe(),I(a[u],1,1,()=>{a[u]=null}),Ae(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),A(n,1),n.m(e,null))},i(l){i||(A(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function hp(r,e,t){let n;const i=ln();let{selectedPlayer:s,localeConsts:a}=e,{isDev:o}=vt;ut(r,o,k=>t(22,n=k));let l=!1,c=[],u="",f="",d=!1,m="";lt(async()=>{t(2,l=!0);const k={playerId:s.name};let H={};n?H={currentUser:"Monu",chats:[{sender:"sakshi#1234",message:"Hey whatsup",time:1670784600},{sender:"sakshi#1234",message:"hello",time:1670784600},{sender:"Pushkar",message:"hi",time:1670784600},{sender:"sakshi#1234",message:"hi, im good. what is this nonsense",time:1670784600},{sender:"Monu",message:"well",time:1670784600},{sender:"Pushkar",message:"how are you",time:1670784600},{sender:"Monu",message:"where are you whereare you?? where are you ewwwrweffsdfdsgskhgskjfjksfksfkjsdgkdskjdsnvkjsndjvkngsjkfnjsknvkjnskj",time:1670784600},{sender:"sakshi#1234",message:"sad",time:1670784600},{sender:"sakshi#1234",message:"Hey whatsup",time:1670784600},{sender:"sakshi#1234",message:"hello",time:1670784600},{sender:"Pushkar",message:"hi",time:1670784600},{sender:"sakshi#1234",message:"hi, im good. what is this nonsense",time:1670784600},{sender:"Monu",message:"well",time:1670784600},{sender:"Pushkar",message:"how are you",time:1670784600}]}:H=await De("getPlayerChats",k),t(3,c=H.chats),t(4,u=H.currentUser),t(3,c=et.changeTimeBasedOnTimeZone(c,"time")),t(2,l=!1),On.scrollToTop("chat-display",100)});function h(){i("closePage")}function p(k){const H={playerId:s.id};let V="";k=="teleport"?V="teleportToPlayerReport":k=="spectate"?V="spectatePlayerReport":k=="bring"?V="bringPlayerReport":k=="sendback"?V="sendBackReport":k=="copyIdentifier"&&et.copyToClipboard(s.identifier),De(V,H)}async function _(){const k={playerId:s.id,playerName:s.name};await De("closeTicket",k),i("closePage")}function g(){t(6,d=!0),t(7,m=a.delete_modal_message+" "+s.name)}async function v(){if(t(2,l=!0),f!==""){const k={sender:u,message:f,playerId:s.name},H=await De("sendMessageFromAdmin",k);t(3,c=H.chats),t(3,c=et.changeTimeBasedOnTimeZone(c,"time"))}t(5,f=""),t(7,m=""),t(2,l=!1),On.scrollToTop("chat-display",100)}function b(k){On.canSendMessage(k,f)&&v()}let w=[{id:"copy-id",actionValue:"copyIdentifier",icon:df,localConstKey:"copy_identifier_tooltip"},{id:"spectate-id",actionValue:"spectate",icon:Pf,localConstKey:"spectate_tooltip"},{id:"bring-id",actionValue:"bring",icon:Mf,localConstKey:"bring_tooltip"},{id:"send-back-id",actionValue:"sendback",icon:yf,localConstKey:"send_back_tooltip"},{id:"teleport-id",actionValue:"teleport",icon:xf,localConstKey:"teleport_tooltip"}];const y=()=>t(6,d=!1),x=k=>p(k.actionValue),E=k=>et.toggleToolTip(k.id),M=k=>et.toggleToolTip(k.id);function S(){f=this.value,t(5,f)}const P=()=>v();return r.$$set=k=>{"selectedPlayer"in k&&t(0,s=k.selectedPlayer),"localeConsts"in k&&t(1,a=k.localeConsts)},[s,a,l,c,u,f,d,m,o,h,p,_,g,v,b,w,y,x,E,M,S,P]}class pp extends We{constructor(e){super(),He(this,e,hp,dp,Ge,{selectedPlayer:0,localeConsts:1})}}function mp(r){let e,t,n,i;return{c(){e=z("div"),t=z("input"),L(t,"placeholder",r[0]),L(e,"class","search-bar txt-xs")},m(s,a){B(s,e,a),C(e,t),zt(t,r[1]),n||(i=[ze(t,"keyup",r[2]),ze(t,"input",r[3])],n=!0)},p(s,[a]){a&1&&L(t,"placeholder",s[0]),a&2&&t.value!==s[1]&&zt(t,s[1])},i:_e,o:_e,d(s){s&&U(e),n=!1,Mt(i)}}}function _p(r,e,t){let{placeholder:n}=e;const i=ln();let s="";function a(){i("search-value-update",s)}function o(){s=this.value,t(1,s)}return r.$$set=l=>{"placeholder"in l&&t(0,n=l.placeholder)},[n,s,a,o]}class ps extends We{constructor(e){super(),He(this,e,_p,mp,Ge,{placeholder:0})}}function _o(r,e,t){const n=r.slice();return n[14]=e[t],n}function gp(r){let e,t,n,i;e=new ps({props:{placeholder:r[0].search_placeholder}}),e.$on("search-value-update",r[9]);let s=r[3],a=[];for(let o=0;o<s.length;o+=1)a[o]=go(_o(r,s,o));return{c(){ee(e.$$.fragment),t=K();for(let o=0;o<a.length;o+=1)a[o].c();n=Dt()},m(o,l){Q(e,o,l),B(o,t,l);for(let c=0;c<a.length;c+=1)a[c].m(o,l);B(o,n,l),i=!0},p(o,l){const c={};if(l&1&&(c.placeholder=o[0].search_placeholder),e.$set(c),l&89){s=o[3];let u;for(u=0;u<s.length;u+=1){const f=_o(o,s,u);a[u]?a[u].p(f,l):(a[u]=go(f),a[u].c(),a[u].m(n.parentNode,n))}for(;u<a.length;u+=1)a[u].d(1);a.length=s.length}},i(o){i||(A(e.$$.fragment,o),i=!0)},o(o){I(e.$$.fragment,o),i=!1},d(o){$(e,o),o&&U(t),Lt(a,o),o&&U(n)}}}function bp(r){let e,t;return e=new pp({props:{selectedPlayer:r[4],localeConsts:r[0]}}),e.$on("closePage",r[8]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&16&&(s.selectedPlayer=n[4]),i&1&&(s.localeConsts=n[0]),e.$set(s)},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function vp(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function go(r){let e,t,n=r[14].id+"",i,s,a=r[14].name+"",o,l,c,u=r[0].last_updated+"",f,d,m=r[6](r[14].time)+"",h,p,_,g;function v(){return r[10](r[14])}return{c(){e=z("div"),t=J("("),i=J(n),s=J(") "),o=J(a),l=K(),c=z("div"),f=J(u),d=K(),h=J(m),p=K(),L(c,"class","report-time-wrapper"),L(e,"class","reports-wrapper txt-md")},m(b,w){B(b,e,w),C(e,t),C(e,i),C(e,s),C(e,o),C(e,l),C(e,c),C(c,f),C(c,d),C(c,h),C(e,p),_||(g=ze(e,"click",v),_=!0)},p(b,w){r=b,w&8&&n!==(n=r[14].id+"")&&he(i,n),w&8&&a!==(a=r[14].name+"")&&he(o,a),w&1&&u!==(u=r[0].last_updated+"")&&he(f,u),w&8&&m!==(m=r[6](r[14].time)+"")&&he(h,m)},d(b){b&&U(e),_=!1,g()}}}function yp(r){let e,t,n,i,s=r[0].reports_heading+"",a,o,l,c,u,f;const d=[vp,bp,gp],m=[];function h(p,_){return p[1]?0:p[4]!==""?1:2}return c=h(r),u=m[c]=d[c](r),{c(){e=z("div"),t=z("div"),n=z("div"),i=z("p"),a=J(s),o=K(),l=z("div"),u.c(),L(n,"class","heading"),L(t,"class","chat-header"),L(l,"class","report-body svelte-1wsh5b6"),L(e,"class","main-body svelte-1wsh5b6")},m(p,_){B(p,e,_),C(e,t),C(t,n),C(n,i),C(i,a),C(e,o),C(e,l),m[c].m(l,null),f=!0},p(p,[_]){(!f||_&1)&&s!==(s=p[0].reports_heading+"")&&he(a,s);let g=c;c=h(p),c===g?m[c].p(p,_):(Pe(),I(m[g],1,1,()=>{m[g]=null}),Ae(),u=m[c],u?u.p(p,_):(u=m[c]=d[c](p),u.c()),A(u,1),u.m(l,null))},i(p){f||(A(u),f=!0)},o(p){I(u),f=!1},d(p){p&&U(e),m[c].d()}}}function wp(r,e,t){let n,{localeConsts:i}=e,{isDev:s}=vt;ut(r,s,g=>t(13,n=g));let a=!1,o=[],l="",c=[],u="",f="";lt(async()=>{t(1,a=!0);let g={};n?g={players:[{id:1,name:"sakshi#1234",time:1670784600,identifier:"Test"}],currentUser:"pushkar@3445"}:g=await De("getAllUserNameWithReports"),o=g.players,t(3,c=et.numericSort(o,"time","desc")),t(1,a=!1)});function d(g){var v=new Date(g*1e3);let b=Intl.DateTimeFormat().resolvedOptions().timeZone;return f=v.toLocaleString("en-US",{timeZone:b}),f}function m(){t(3,c=et.filterAndSort(o,"name",l,"alpha","name"))}async function h(){t(1,a=!0);let g={};n?g={playerIds:[{id:1,name:"sakshi#1234"},"pushkar@3445"]}:g=await De("getAllUserNameWithReports"),o=g.players,t(3,c=et.numericSort(o,"time","desc")),t(1,a=!1),t(4,u="")}const p=g=>{t(2,l=g.detail),m()},_=g=>{t(4,u=g)};return r.$$set=g=>{"localeConsts"in g&&t(0,i=g.localeConsts)},[i,a,l,c,u,s,d,m,h,p,_]}class Mp extends We{constructor(e){super(),He(this,e,wp,yp,Ge,{localeConsts:0})}}function bo(r,e,t){const n=r.slice();return n[11]=e[t],n}function vo(r,e,t){const n=r.slice();return n[14]=e[t],n}function xp(r){let e,t=r[1].formattedTime+"",n;return{c(){e=z("p"),n=J(t)},m(i,s){B(i,e,s),C(e,n)},p(i,s){s&2&&t!==(t=i[1].formattedTime+"")&&he(n,t)},i:_e,o:_e,d(i){i&&U(e)}}}function Sp(r){let e,t,n;return t=new Ft({props:{icon:r[5]?ls:gr,class:"txt-xs"}}),{c(){e=z("div"),ee(t.$$.fragment),L(e,"class","chevron-sign")},m(i,s){B(i,e,s),Q(t,e,null),n=!0},p(i,s){const a={};s&32&&(a.icon=i[5]?ls:gr),t.$set(a)},i(i){n||(A(t.$$.fragment,i),n=!0)},o(i){I(t.$$.fragment,i),n=!1},d(i){i&&U(e),$(t)}}}function yo(r){let e,t,n,i,s,a,o,l=r[0].citizen_id_label+"",c,u,f=r[1].info.citizenId+"",d,m,h,p,_=r[0].name_label+"",g,v,b=r[1].info.name+"",w,y,x,E,M=r[0].job_label+"",S,P,k=r[1].info.job+"",H,V,F,j,ce=r[0].gang_label+"",de,te,re=r[1].info.gang+"",fe,be,Y,ue,pe=r[0].cash_label+"",W,Me,ye=r[1].info.cashBalance+"",Te,Se,Ne=r[0].bank_label+"",Re,Ve,je=r[1].info.bankBalance+"",qe,it,yt,_t,st=r[0].radio_channel_label+"",at,Ht,kt=r[1].info.radio+"",R,T,O,se,oe=r[0].phone_number_label+"",me,Le,xe=r[1].info.phone+"",le,Ue,Ee,Fe,we,Ie=r[1].licenses,Be=[];for(let N=0;N<Ie.length;N+=1)Be[N]=wo(vo(r,Ie,N));let rt=r[6],tt=[];for(let N=0;N<rt.length;N+=1)tt[N]=xo(bo(r,rt,N));return{c(){e=z("div"),t=z("div"),n=z("div");for(let N=0;N<Be.length;N+=1)Be[N].c();i=K(),s=z("div"),a=z("p"),o=z("span"),c=J(l),u=J(": "),d=J(f),m=K(),h=z("p"),p=z("span"),g=J(_),v=J(": "),w=J(b),y=K(),x=z("p"),E=z("span"),S=J(M),P=J(": "),H=J(k),V=K(),F=z("p"),j=z("span"),de=J(ce),te=J(": "),fe=J(re),be=K(),Y=z("p"),ue=z("span"),W=J(pe),Me=J(" : "),Te=J(ye),Se=J(" / "),Re=J(Ne),Ve=J(" : "),qe=J(je),it=K(),yt=z("p"),_t=z("span"),at=J(st),Ht=J(": "),R=J(kt),T=K(),O=z("p"),se=z("span"),me=J(oe),Le=J(": "),le=J(xe),Ue=K(),Ee=z("div");for(let N=0;N<tt.length;N+=1)tt[N].c();L(s,"class","player-info"),L(n,"class","values"),L(t,"class","open-panel-row"),L(Ee,"class","open-panel-row open-panel-row-buttons"),L(e,"class","player-panel-open-panels")},m(N,Z){B(N,e,Z),C(e,t),C(t,n);for(let ne=0;ne<Be.length;ne+=1)Be[ne].m(n,null);C(n,i),C(n,s),C(s,a),C(a,o),C(o,c),C(o,u),C(a,d),C(s,m),C(s,h),C(h,p),C(p,g),C(p,v),C(h,w),C(s,y),C(s,x),C(x,E),C(E,S),C(E,P),C(x,H),C(s,V),C(s,F),C(F,j),C(j,de),C(j,te),C(F,fe),C(s,be),C(s,Y),C(Y,ue),C(ue,W),C(ue,Me),C(ue,Te),C(ue,Se),C(ue,Re),C(ue,Ve),C(ue,qe),C(s,it),C(s,yt),C(yt,_t),C(_t,at),C(_t,Ht),C(yt,R),C(s,T),C(s,O),C(O,se),C(se,me),C(se,Le),C(O,le),C(e,Ue),C(e,Ee);for(let ne=0;ne<tt.length;ne+=1)tt[ne].m(Ee,null);we=!0},p(N,Z){if(Z&2){Ie=N[1].licenses;let ne;for(ne=0;ne<Ie.length;ne+=1){const ve=vo(N,Ie,ne);Be[ne]?Be[ne].p(ve,Z):(Be[ne]=wo(ve),Be[ne].c(),Be[ne].m(n,i))}for(;ne<Be.length;ne+=1)Be[ne].d(1);Be.length=Ie.length}if((!we||Z&1)&&l!==(l=N[0].citizen_id_label+"")&&he(c,l),(!we||Z&2)&&f!==(f=N[1].info.citizenId+"")&&he(d,f),(!we||Z&1)&&_!==(_=N[0].name_label+"")&&he(g,_),(!we||Z&2)&&b!==(b=N[1].info.name+"")&&he(w,b),(!we||Z&1)&&M!==(M=N[0].job_label+"")&&he(S,M),(!we||Z&2)&&k!==(k=N[1].info.job+"")&&he(H,k),(!we||Z&1)&&ce!==(ce=N[0].gang_label+"")&&he(de,ce),(!we||Z&2)&&re!==(re=N[1].info.gang+"")&&he(fe,re),(!we||Z&1)&&pe!==(pe=N[0].cash_label+"")&&he(W,pe),(!we||Z&2)&&ye!==(ye=N[1].info.cashBalance+"")&&he(Te,ye),(!we||Z&1)&&Ne!==(Ne=N[0].bank_label+"")&&he(Re,Ne),(!we||Z&2)&&je!==(je=N[1].info.bankBalance+"")&&he(qe,je),(!we||Z&1)&&st!==(st=N[0].radio_channel_label+"")&&he(at,st),(!we||Z&2)&&kt!==(kt=N[1].info.radio+"")&&he(R,kt),(!we||Z&1)&&oe!==(oe=N[0].phone_number_label+"")&&he(me,oe),(!we||Z&2)&&xe!==(xe=N[1].info.phone+"")&&he(le,xe),Z&337){rt=N[6];let ne;for(ne=0;ne<rt.length;ne+=1){const ve=bo(N,rt,ne);tt[ne]?tt[ne].p(ve,Z):(tt[ne]=xo(ve),tt[ne].c(),tt[ne].m(Ee,null))}for(;ne<tt.length;ne+=1)tt[ne].d(1);tt.length=rt.length}},i(N){we||(fi(()=>{Fe||(Fe=as(e,cs,{duration:400},!0)),Fe.run(1)}),we=!0)},o(N){Fe||(Fe=as(e,cs,{duration:400},!1)),Fe.run(0),we=!1},d(N){N&&U(e),Lt(Be,N),Lt(tt,N),N&&Fe&&Fe.end()}}}function wo(r){let e,t=r[14]+"",n,i,s;function a(){return r[9](r[14])}return{c(){e=z("p"),n=J(t),L(e,"class","value")},m(o,l){B(o,e,l),C(e,n),i||(s=ze(e,"click",a),i=!0)},p(o,l){r=o,l&2&&t!==(t=r[14]+"")&&he(n,t)},d(o){o&&U(e),i=!1,s()}}}function Mo(r){let e,t=r[0][r[11].buttonName+"_btn"]+"",n,i,s;function a(){return r[10](r[11])}return{c(){e=z("button"),n=J(t)},m(o,l){B(o,e,l),C(e,n),i||(s=ze(e,"click",a),i=!0)},p(o,l){r=o,l&1&&t!==(t=r[0][r[11].buttonName+"_btn"]+"")&&he(n,t)},d(o){o&&U(e),i=!1,s()}}}function xo(r){let e=r[4].includes(r[11].panel),t,n=e&&Mo(r);return{c(){n&&n.c(),t=Dt()},m(i,s){n&&n.m(i,s),B(i,t,s)},p(i,s){s&16&&(e=i[4].includes(i[11].panel)),e?n?n.p(i,s):(n=Mo(i),n.c(),n.m(t.parentNode,t)):n&&(n.d(1),n=null)},d(i){n&&n.d(i),i&&U(t)}}}function Cp(r){let e,t,n,i,s,a=r[1].id+"",o,l,c=r[1].name+"",u,f,d,m,h,p,_,g,v;const b=[Sp,xp],w=[];function y(E,M){return E[3]?0:1}d=y(r),m=w[d]=b[d](r);let x=r[5]&&yo(r);return{c(){e=z("div"),t=z("div"),n=z("div"),i=z("p"),s=J("("),o=J(a),l=J(") "),u=J(c),f=K(),m.c(),p=K(),x&&x.c(),L(i,"class","txt-sm font-medium title"),L(n,"class","player-panel-width panel-title-chevron"),L(t,"id","main-panel"),L(t,"class",h="closed-panel "+r[2])},m(E,M){B(E,e,M),C(e,t),C(t,n),C(n,i),C(i,s),C(i,o),C(i,l),C(i,u),C(n,f),w[d].m(n,null),C(e,p),x&&x.m(e,null),_=!0,g||(v=ze(t,"click",r[7]),g=!0)},p(E,[M]){(!_||M&2)&&a!==(a=E[1].id+"")&&he(o,a),(!_||M&2)&&c!==(c=E[1].name+"")&&he(u,c);let S=d;d=y(E),d===S?w[d].p(E,M):(Pe(),I(w[S],1,1,()=>{w[S]=null}),Ae(),m=w[d],m?m.p(E,M):(m=w[d]=b[d](E),m.c()),A(m,1),m.m(n,null)),(!_||M&4&&h!==(h="closed-panel "+E[2]))&&L(t,"class",h),E[5]?x?(x.p(E,M),M&32&&A(x,1)):(x=yo(E),x.c(),A(x,1),x.m(e,null)):x&&(Pe(),I(x,1,1,()=>{x=null}),Ae())},i(E){_||(A(m),A(x),_=!0)},o(E){I(m),I(x),_=!1},d(E){E&&U(e),w[d].d(),x&&x.d(),g=!1,v()}}}function Tp(r,e,t){let{localeConsts:n,panelData:i,bgColor:s,canOpenPanel:a=!1}=e,{showingPanels:o}=e,l=!1,c=[{buttonName:"teleport",panel:n.Teleport_to_Player},{buttonName:"bring",panel:n.Bring_Player},{buttonName:"spectate",panel:n.Spectate_Player},{buttonName:"freeze",panel:n.Freeze_Player},{buttonName:"send_back",panel:n.Bring_Player}];function u(){a&&t(5,l=!l)}async function f(h){const p={playerId:i.id,action:h};await De("playerListActions",p)}const d=h=>et.copyToClipboard(h),m=h=>f(h.buttonName);return r.$$set=h=>{"localeConsts"in h&&t(0,n=h.localeConsts),"panelData"in h&&t(1,i=h.panelData),"bgColor"in h&&t(2,s=h.bgColor),"canOpenPanel"in h&&t(3,a=h.canOpenPanel),"showingPanels"in h&&t(4,o=h.showingPanels)},[n,i,s,a,o,l,c,u,f,d,m]}class Ep extends We{constructor(e){super(),He(this,e,Tp,Cp,Ge,{localeConsts:0,panelData:1,bgColor:2,canOpenPanel:3,showingPanels:4})}}function So(r,e,t){const n=r.slice();return n[14]=e[t],n[16]=t,n}function Co(r,e,t){const n=r.slice();return n[17]=e[t],n}function Lp(r){let e,t,n,i,s,a,o=[],l=new Map,c,u=r[8],f=[];for(let h=0;h<u.length;h+=1)f[h]=To(Co(r,u,h));n=new ps({props:{placeholder:r[0].player_placeholder}}),n.$on("search-value-update",r[12]);let d=r[5];const m=h=>h[14].id;for(let h=0;h<d.length;h+=1){let p=So(r,d,h),_=m(p);l.set(_,o[h]=Eo(_,p))}return{c(){e=z("div");for(let h=0;h<f.length;h+=1)f[h].c();t=K(),ee(n.$$.fragment),i=K(),s=z("div"),a=z("div");for(let h=0;h<o.length;h+=1)o[h].c();L(e,"class","players-horizontal-tab"),L(a,"class","nav-body"),L(s,"class","item-rows")},m(h,p){B(h,e,p);for(let _=0;_<f.length;_+=1)f[_].m(e,null);B(h,t,p),Q(n,h,p),B(h,i,p),B(h,s,p),C(s,a);for(let _=0;_<o.length;_+=1)o[_].m(a,null);c=!0},p(h,p){if(p&1349){u=h[8];let g;for(g=0;g<u.length;g+=1){const v=Co(h,u,g);f[g]?f[g].p(v,p):(f[g]=To(v),f[g].c(),f[g].m(e,null))}for(;g<f.length;g+=1)f[g].d(1);f.length=u.length}const _={};if(p&1&&(_.placeholder=h[0].player_placeholder),n.$set(_),p&39){d=h[5],Pe();for(let g=0;g<o.length;g+=1)o[g].r();o=xr(o,p,m,1,h,d,l,a,hs,Eo,null,So);for(let g=0;g<o.length;g+=1)o[g].a();Ae()}},i(h){if(!c){A(n.$$.fragment,h);for(let p=0;p<d.length;p+=1)A(o[p]);c=!0}},o(h){I(n.$$.fragment,h);for(let p=0;p<o.length;p+=1)I(o[p]);c=!1},d(h){h&&U(e),Lt(f,h),h&&U(t),$(n,h),h&&U(i),h&&U(s);for(let p=0;p<o.length;p+=1)o[p].d()}}}function Pp(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Ap(r){let e,t=r[6].online.length+"",n,i;return{c(){e=J("("),n=J(t),i=J(")")},m(s,a){B(s,e,a),B(s,n,a),B(s,i,a)},p(s,a){a&64&&t!==(t=s[6].online.length+"")&&he(n,t)},d(s){s&&U(e),s&&U(n),s&&U(i)}}}function To(r){let e,t=et.upperCaseFirstLetter(r[0][r[17]+"_tab_name"])+"",n,i,s,a,o,l,c=r[17]==="online"&&Ap(r);function u(){return r[11](r[17])}return{c(){e=z("button"),n=J(t),i=K(),c&&c.c(),s=K(),L(e,"id",r[17]),L(e,"class",a="tablinks "+(r[2]===r[17]?"active-horizontal-tab-link":""))},m(f,d){B(f,e,d),C(e,n),C(e,i),c&&c.m(e,null),C(e,s),o||(l=ze(e,"click",u),o=!0)},p(f,d){r=f,d&1&&t!==(t=et.upperCaseFirstLetter(r[0][r[17]+"_tab_name"])+"")&&he(n,t),r[17]==="online"&&c.p(r,d),d&4&&a!==(a="tablinks "+(r[2]===r[17]?"active-horizontal-tab-link":""))&&L(e,"class",a)},d(f){f&&U(e),c&&c.d(),o=!1,l()}}}function Eo(r,e){let t,n,i,s,a=_e,o;return n=new Ep({props:{localeConsts:e[0],showingPanels:e[1],panelData:e[14],bgColor:e[14].isAdmin?"admin-player-resource-bg":"even-pane-panel-bg",canOpenPanel:e[2]==="online"}}),{key:r,first:null,c(){t=z("div"),ee(n.$$.fragment),i=K(),this.first=t},m(l,c){B(l,t,c),Q(n,t,null),C(t,i),o=!0},p(l,c){e=l;const u={};c&1&&(u.localeConsts=e[0]),c&2&&(u.showingPanels=e[1]),c&32&&(u.panelData=e[14]),c&32&&(u.bgColor=e[14].isAdmin?"admin-player-resource-bg":"even-pane-panel-bg"),c&4&&(u.canOpenPanel=e[2]==="online"),n.$set(u)},r(){s=t.getBoundingClientRect()},f(){Mr(t),a()},a(){a(),a=wr(t,s,Sr,{duration:400})},i(l){o||(A(n.$$.fragment,l),o=!0)},o(l){I(n.$$.fragment,l),o=!1},d(l){l&&U(t),$(n)}}}function Dp(r){let e,t,n=r[0].players_page_heading+"",i,s,a,o,l,c;const u=[Pp,Lp],f=[];function d(m,h){return m[3]?0:1}return o=d(r),l=f[o]=u[o](r),{c(){e=z("div"),t=z("div"),i=J(n),s=K(),a=z("div"),l.c(),L(t,"class","heading"),L(a,"class","body-wrapper"),L(e,"class","main-body")},m(m,h){B(m,e,h),C(e,t),C(t,i),C(e,s),C(e,a),f[o].m(a,null),c=!0},p(m,[h]){(!c||h&1)&&n!==(n=m[0].players_page_heading+"")&&he(i,n);let p=o;o=d(m),o===p?f[o].p(m,h):(Pe(),I(f[p],1,1,()=>{f[p]=null}),Ae(),l=f[o],l?l.p(m,h):(l=f[o]=u[o](m),l.c()),A(l,1),l.m(a,null))},i(m){c||(A(l),c=!0)},o(m){I(l),c=!1},d(m){m&&U(e),f[o].d()}}}function kp(r,e,t){let n,{localeConsts:i}=e,{showingPanels:s}=e,{isDev:a}=vt;ut(r,a,g=>t(13,n=g));let o="online",l=["online","offline"],c=!1,u="",f=[],d={online:[],offline:[]};lt(async()=>{t(3,c=!0);let g={};n?g={onlinePlayers:[{id:2,name:"Sakshi",licenses:["Driving","Cooking"]},{id:1,name:"Pushkar",licenses:["Driving","Chutyap"]}],offlinePlayers:[{id:3,name:"Shruti",timeOfDisconnect:1670784600},{id:4,name:"Vaishnavi",timeOfDisconnect:1670784600}]}:g=await De("getPlayerDataForList"),t(6,d.online=g.onlinePlayers,d),t(6,d.offline=et.changeTimeBasedOnTimeZone(g.offlinePlayers,"timeOfDisconnect"),d),m(),t(3,c=!1)});function m(){t(5,f=et.filterAndSort(d[o],"name",u,"num","id","asc"))}function h(g){t(2,o=g),m()}const p=g=>h(g),_=g=>{t(4,u=g.detail),m()};return r.$$set=g=>{"localeConsts"in g&&t(0,i=g.localeConsts),"showingPanels"in g&&t(1,s=g.showingPanels)},[i,s,o,c,u,f,d,a,l,m,h,p,_]}class Rp extends We{constructor(e){super(),He(this,e,kp,Dp,Ge,{localeConsts:0,showingPanels:1})}}function Ip(r){let e,t,n,i,s,a,o,l;return t=new Ft({props:{icon:Ef,class:"txt-xs stop"}}),s=new Ft({props:{icon:af,class:"txt-xs replay"}}),{c(){e=z("div"),ee(t.$$.fragment),n=K(),i=z("div"),ee(s.$$.fragment)},m(c,u){B(c,e,u),Q(t,e,null),B(c,n,u),B(c,i,u),Q(s,i,null),a=!0,o||(l=[ze(e,"click",r[4]),ze(i,"click",r[5])],o=!0)},p:_e,i(c){a||(A(t.$$.fragment,c),A(s.$$.fragment,c),a=!0)},o(c){I(t.$$.fragment,c),I(s.$$.fragment,c),a=!1},d(c){c&&U(e),$(t),c&&U(n),c&&U(i),$(s),o=!1,Mt(l)}}}function Np(r){let e,t,n,i,s;return t=new Ft({props:{icon:Sf,class:"txt-xs start"}}),{c(){e=z("div"),ee(t.$$.fragment)},m(a,o){B(a,e,o),Q(t,e,null),n=!0,i||(s=ze(e,"click",r[3]),i=!0)},p:_e,i(a){n||(A(t.$$.fragment,a),n=!0)},o(a){I(t.$$.fragment,a),n=!1},d(a){a&&U(e),$(t),i=!1,s()}}}function zp(r){let e,t,n,i,s,a=r[0].name+"",o,l,c,u,f,d,m;const h=[Np,Ip],p=[];function _(g,v){return g[0].state===0?0:1}return u=_(r),f=p[u]=h[u](r),{c(){e=z("div"),t=z("div"),n=z("div"),i=z("div"),s=z("p"),o=J(a),l=K(),c=z("div"),f.c(),L(s,"class","txt-sm font-medium title"),L(i,"class","resource-name"),L(c,"class","resource_button_icons"),L(n,"class","player-panel-width panel-title-chevron"),L(t,"id","main-panel"),L(t,"class",d="closed-panel "+r[1])},m(g,v){B(g,e,v),C(e,t),C(t,n),C(n,i),C(i,s),C(s,o),C(n,l),C(n,c),p[u].m(c,null),m=!0},p(g,[v]){(!m||v&1)&&a!==(a=g[0].name+"")&&he(o,a);let b=u;u=_(g),u===b?p[u].p(g,v):(Pe(),I(p[b],1,1,()=>{p[b]=null}),Ae(),f=p[u],f?f.p(g,v):(f=p[u]=h[u](g),f.c()),A(f,1),f.m(c,null)),(!m||v&2&&d!==(d="closed-panel "+g[1]))&&L(t,"class",d)},i(g){m||(A(f),m=!0)},o(g){I(f),m=!1},d(g){g&&U(e),p[u].d()}}}function Fp(r,e,t){const n=ln();let{panelData:i,bgColor:s}=e;function a(u){n("perform-resource-action",{panelData:i,action:u})}const o=()=>a("start"),l=()=>a("stop"),c=()=>a("restart");return r.$$set=u=>{"panelData"in u&&t(0,i=u.panelData),"bgColor"in u&&t(1,s=u.bgColor)},[i,s,a,o,l,c]}class Op extends We{constructor(e){super(),He(this,e,Fp,zp,Ge,{panelData:0,bgColor:1})}}function Lo(r,e,t){const n=r.slice();return n[15]=e[t],n[17]=t,n}function Po(r,e,t){const n=r.slice();return n[18]=e[t],n}function Up(r){let e,t,n,i,s,a,o=[],l=new Map,c,u=r[6],f=[];for(let h=0;h<u.length;h+=1)f[h]=Ao(Po(r,u,h));n=new ps({props:{placeholder:r[0].resources_search_placeholder}}),n.$on("search-value-update",r[11]);let d=r[3];const m=h=>h[15].id;for(let h=0;h<d.length;h+=1){let p=Lo(r,d,h),_=m(p);l.set(_,o[h]=Do(_,p))}return{c(){e=z("div");for(let h=0;h<f.length;h+=1)f[h].c();t=K(),ee(n.$$.fragment),i=K(),s=z("div"),a=z("div");for(let h=0;h<o.length;h+=1)o[h].c();L(e,"class","players-horizontal-tab"),L(a,"class","nav-body"),L(s,"class","item-rows")},m(h,p){B(h,e,p);for(let _=0;_<f.length;_+=1)f[_].m(e,null);B(h,t,p),Q(n,h,p),B(h,i,p),B(h,s,p),C(s,a);for(let _=0;_<o.length;_+=1)o[_].m(a,null);c=!0},p(h,p){if(p&209){u=h[6];let g;for(g=0;g<u.length;g+=1){const v=Po(h,u,g);f[g]?f[g].p(v,p):(f[g]=Ao(v),f[g].c(),f[g].m(e,null))}for(;g<f.length;g+=1)f[g].d(1);f.length=u.length}const _={};if(p&1&&(_.placeholder=h[0].resources_search_placeholder),n.$set(_),p&520){d=h[3],Pe();for(let g=0;g<o.length;g+=1)o[g].r();o=xr(o,p,m,1,h,d,l,a,hs,Do,null,Lo);for(let g=0;g<o.length;g+=1)o[g].a();Ae()}},i(h){if(!c){A(n.$$.fragment,h);for(let p=0;p<d.length;p+=1)A(o[p]);c=!0}},o(h){I(n.$$.fragment,h);for(let p=0;p<o.length;p+=1)I(o[p]);c=!1},d(h){h&&U(e),Lt(f,h),h&&U(t),$(n,h),h&&U(i),h&&U(s);for(let p=0;p<o.length;p+=1)o[p].d()}}}function Bp(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Ao(r){let e,t=et.upperCaseFirstLetter(r[0]["resources_"+r[18]+"_tab_name"])+"",n,i,s,a,o;function l(){return r[10](r[18])}return{c(){e=z("button"),n=J(t),i=K(),L(e,"id",r[18]),L(e,"class",s="tablinks "+(r[4]===r[18]?"active-horizontal-tab-link":""))},m(c,u){B(c,e,u),C(e,n),C(e,i),a||(o=ze(e,"click",l),a=!0)},p(c,u){r=c,u&1&&t!==(t=et.upperCaseFirstLetter(r[0]["resources_"+r[18]+"_tab_name"])+"")&&he(n,t),u&16&&s!==(s="tablinks "+(r[4]===r[18]?"active-horizontal-tab-link":""))&&L(e,"class",s)},d(c){c&&U(e),a=!1,o()}}}function Do(r,e){let t,n,i,s,a=_e,o;return n=new Op({props:{panelData:e[15],bgColor:"odd-pane-panel"}}),n.$on("perform-resource-action",e[9]),{key:r,first:null,c(){t=z("div"),ee(n.$$.fragment),i=K(),this.first=t},m(l,c){B(l,t,c),Q(n,t,null),C(t,i),o=!0},p(l,c){e=l;const u={};c&8&&(u.panelData=e[15]),n.$set(u)},r(){s=t.getBoundingClientRect()},f(){Mr(t),a()},a(){a(),a=wr(t,s,Sr,{duration:400})},i(l){o||(A(n.$$.fragment,l),o=!0)},o(l){I(n.$$.fragment,l),o=!1},d(l){l&&U(t),$(n)}}}function Vp(r){let e,t,n=r[0].resources_page_heading+"",i,s,a,o,l,c;const u=[Bp,Up],f=[];function d(m,h){return m[1]?0:1}return o=d(r),l=f[o]=u[o](r),{c(){e=z("div"),t=z("div"),i=J(n),s=K(),a=z("div"),l.c(),L(t,"class","heading"),L(a,"class","body-wrapper"),L(e,"class","main-body")},m(m,h){B(m,e,h),C(e,t),C(t,i),C(e,s),C(e,a),f[o].m(a,null),c=!0},p(m,[h]){(!c||h&1)&&n!==(n=m[0].resources_page_heading+"")&&he(i,n);let p=o;o=d(m),o===p?f[o].p(m,h):(Pe(),I(f[p],1,1,()=>{f[p]=null}),Ae(),l=f[o],l?l.p(m,h):(l=f[o]=u[o](m),l.c()),A(l,1),l.m(a,null))},i(m){c||(A(l),c=!0)},o(m){I(l),c=!1},d(m){m&&U(e),f[o].d()}}}function Gp(r,e,t){let n,{localeConsts:i}=e,{isDev:s}=vt;ut(r,s,v=>t(13,n=v));let a=!1,o="",l=[],c=["active","inactive"],u="active",f={active:[],inactive:[]};lt(async()=>{t(1,a=!0),await d(),t(1,a=!1)});async function d(){let v={};n?v={resources:[{id:1,name:"Resource XYZ",state:0},{id:2,name:"Resource DEF",state:1}]}:v=await De("getResourceList"),f.active=v.resources.filter(b=>b.state===1),f.inactive=v.resources.filter(b=>b.state===0),h()}function m(v){t(4,u=v),h()}function h(){t(3,l=et.filterAndSort(f[u],"name",o,"alpha","name"))}async function p(v){let b=v.detail.action,w=v.detail.panelData;t(1,a=!0);const y=b==="start"?"startResource":b==="stop"?"stopResource":"restartResource",x={name:w.name};let E="";n?E="ok":E=await De(y,x),E==="ok"&&await d(),t(1,a=!1)}const _=v=>m(v),g=v=>{t(2,o=v.detail),h()};return r.$$set=v=>{"localeConsts"in v&&t(0,i=v.localeConsts)},[i,a,o,l,u,s,c,m,h,p,_,g]}class Hp extends We{constructor(e){super(),He(this,e,Gp,Vp,Ge,{localeConsts:0})}}function Wp(r){let e,t,n,i,s=r[1][r[0].localConstKey]+"",a,o,l,c,u;return t=new Ft({props:{icon:r[0].icon,class:"txt-md "+r[2]}}),{c(){e=z("div"),ee(t.$$.fragment),n=K(),i=z("span"),a=J(s),L(i,"id",o=r[0].id),L(i,"class","tool-tip-text-top"),L(e,"class","inner-icon")},m(f,d){B(f,e,d),Q(t,e,null),C(e,n),C(e,i),C(i,a),l=!0,c||(u=[ze(e,"click",r[4]),ze(e,"mouseenter",r[5]),ze(e,"mouseleave",r[6])],c=!0)},p(f,[d]){const m={};d&1&&(m.icon=f[0].icon),d&4&&(m.class="txt-md "+f[2]),t.$set(m),(!l||d&3)&&s!==(s=f[1][f[0].localConstKey]+"")&&he(a,s),(!l||d&1&&o!==(o=f[0].id))&&L(i,"id",o)},i(f){l||(A(t.$$.fragment,f),l=!0)},o(f){I(t.$$.fragment,f),l=!1},d(f){f&&U(e),$(t),c=!1,Mt(u)}}}function Xp(r,e,t){const n=ln();let{menuItem:i,localeConsts:s,extraClassNames:a=""}=e;function o(f){n("showSideBarPage",f)}const l=()=>{o(i.showPageKey)},c=()=>et.toggleToolTip(i.id),u=()=>et.toggleToolTip(i.id);return r.$$set=f=>{"menuItem"in f&&t(0,i=f.menuItem),"localeConsts"in f&&t(1,s=f.localeConsts),"extraClassNames"in f&&t(2,a=f.extraClassNames)},[i,s,a,o,l,c,u]}class _i extends We{constructor(e){super(),He(this,e,Xp,Wp,Ge,{menuItem:0,localeConsts:1,extraClassNames:2})}}function ko(r,e,t){const n=r.slice();return n[58]=e[t],n[60]=t,n}function Ro(r,e,t){const n=r.slice();return n[61]=e[t],n}function Io(r,e,t){const n=r.slice();return n[64]=e[t],n}function No(r,e,t){const n=r.slice();return n[67]=e[t],n}function zo(r,e,t){const n=r.slice();return n[64]=e[t],n}function Fo(r,e,t){const n=r.slice();return n[64]=e[t],n}function Oo(r,e,t){const n=r.slice();return n[67]=e[t],n}function Uo(r,e,t){const n=r.slice();return n[67]=e[t],n}function Bo(r,e,t){const n=r.slice();return n[78]=e[t],n}function jp(r){let e,t,n,i,s,a,o,l,c,u,f,d,m=r[31],h=[];for(let S=0;S<m.length;S+=1)h[S]=Vo(Bo(r,m,S));const p=S=>I(h[S],1,1,()=>{h[S]=null});let _=r[7]&&Go(r),g=r[11]&&Wo(r),v=r[8]&&jo(r),b=r[9]&&Yo(r),w=r[10]&&Ko(r),y=r[15]&&Qo(r);const x=[em,$p,Qp,Jp,Kp,Zp,Yp],E=[];function M(S,P){return S[13].showGodModeAdminPage?0:S[13].showThemePage?1:S[13].showChat?2:S[13].showReportsPage?3:S[13].showPlayersPage?4:S[13].showResourcesPage?5:!S[13].showGodModeAdminPage&&!S[13].showThemePage&&!S[13].showChat&&!S[13].showPlayersPage&&!S[13].showResourcesPage?6:-1}return~(u=M(r))&&(f=E[u]=x[u](r)),{c(){e=z("div");for(let S=0;S<h.length;S+=1)h[S].c();t=K(),_&&_.c(),n=K(),g&&g.c(),i=K(),v&&v.c(),s=K(),b&&b.c(),a=K(),w&&w.c(),o=K(),y&&y.c(),l=K(),c=z("div"),f&&f.c(),L(e,"class","vertical-menu"),L(c,"id","inner_div_id"),L(c,"class","inner bg-dark-900/50")},m(S,P){B(S,e,P);for(let k=0;k<h.length;k+=1)h[k].m(e,null);C(e,t),_&&_.m(e,null),C(e,n),g&&g.m(e,null),C(e,i),v&&v.m(e,null),C(e,s),b&&b.m(e,null),C(e,a),w&&w.m(e,null),C(e,o),y&&y.m(e,null),B(S,l,P),B(S,c,P),~u&&E[u].m(c,null),d=!0},p(S,P){if(P[0]&545259520|P[1]&1){m=S[31];let H;for(H=0;H<m.length;H+=1){const V=Bo(S,m,H);h[H]?(h[H].p(V,P),A(h[H],1)):(h[H]=Vo(V),h[H].c(),A(h[H],1),h[H].m(e,t))}for(Pe(),H=m.length;H<h.length;H+=1)p(H);Ae()}S[7]?_?(_.p(S,P),P[0]&128&&A(_,1)):(_=Go(S),_.c(),A(_,1),_.m(e,n)):_&&(Pe(),I(_,1,1,()=>{_=null}),Ae()),S[11]?g?(g.p(S,P),P[0]&2048&&A(g,1)):(g=Wo(S),g.c(),A(g,1),g.m(e,i)):g&&(Pe(),I(g,1,1,()=>{g=null}),Ae()),S[8]?v?(v.p(S,P),P[0]&256&&A(v,1)):(v=jo(S),v.c(),A(v,1),v.m(e,s)):v&&(Pe(),I(v,1,1,()=>{v=null}),Ae()),S[9]?b?(b.p(S,P),P[0]&512&&A(b,1)):(b=Yo(S),b.c(),A(b,1),b.m(e,a)):b&&(Pe(),I(b,1,1,()=>{b=null}),Ae()),S[10]?w?(w.p(S,P),P[0]&1024&&A(w,1)):(w=Ko(S),w.c(),A(w,1),w.m(e,o)):w&&(Pe(),I(w,1,1,()=>{w=null}),Ae()),S[15]?y?(y.p(S,P),P[0]&32768&&A(y,1)):(y=Qo(S),y.c(),A(y,1),y.m(e,null)):y&&(Pe(),I(y,1,1,()=>{y=null}),Ae());let k=u;u=M(S),u===k?~u&&E[u].p(S,P):(f&&(Pe(),I(E[k],1,1,()=>{E[k]=null}),Ae()),~u?(f=E[u],f?f.p(S,P):(f=E[u]=x[u](S),f.c()),A(f,1),f.m(c,null)):f=null)},i(S){if(!d){for(let P=0;P<m.length;P+=1)A(h[P]);A(_),A(g),A(v),A(b),A(w),A(y),A(f),d=!0}},o(S){h=h.filter(Boolean);for(let P=0;P<h.length;P+=1)I(h[P]);I(_),I(g),I(v),I(b),I(w),I(y),I(f),d=!1},d(S){S&&U(e),Lt(h,S),_&&_.d(),g&&g.d(),v&&v.d(),b&&b.d(),w&&w.d(),y&&y.d(),S&&U(l),S&&U(c),~u&&E[u].d()}}}function qp(r){let e,t;return e=new ft({props:{marginLeft:"45%"}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Vo(r){let e,t;return e=new _i({props:{menuItem:r[78],localeConsts:r[23]}}),e.$on("showSideBarPage",r[39]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Go(r){let e,t,n=r[33],i=[];for(let a=0;a<n.length;a+=1)i[a]=Ho(Uo(r,n,a));const s=a=>I(i[a],1,1,()=>{i[a]=null});return{c(){for(let a=0;a<i.length;a+=1)i[a].c();e=Dt()},m(a,o){for(let l=0;l<i.length;l+=1)i[l].m(a,o);B(a,e,o),t=!0},p(a,o){if(o[0]&545259520|o[1]&4){n=a[33];let l;for(l=0;l<n.length;l+=1){const c=Uo(a,n,l);i[l]?(i[l].p(c,o),A(i[l],1)):(i[l]=Ho(c),i[l].c(),A(i[l],1),i[l].m(e.parentNode,e))}for(Pe(),l=n.length;l<i.length;l+=1)s(l);Ae()}},i(a){if(!t){for(let o=0;o<n.length;o+=1)A(i[o]);t=!0}},o(a){i=i.filter(Boolean);for(let o=0;o<i.length;o+=1)I(i[o]);t=!1},d(a){Lt(i,a),a&&U(e)}}}function Ho(r){let e,t;return e=new _i({props:{menuItem:r[67],localeConsts:r[23]}}),e.$on("showSideBarPage",r[40]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Wo(r){let e,t,n=r[32],i=[];for(let a=0;a<n.length;a+=1)i[a]=Xo(Oo(r,n,a));const s=a=>I(i[a],1,1,()=>{i[a]=null});return{c(){for(let a=0;a<i.length;a+=1)i[a].c();e=Dt()},m(a,o){for(let l=0;l<i.length;l+=1)i[l].m(a,o);B(a,e,o),t=!0},p(a,o){if(o[0]&545259520|o[1]&2){n=a[32];let l;for(l=0;l<n.length;l+=1){const c=Oo(a,n,l);i[l]?(i[l].p(c,o),A(i[l],1)):(i[l]=Xo(c),i[l].c(),A(i[l],1),i[l].m(e.parentNode,e))}for(Pe(),l=n.length;l<i.length;l+=1)s(l);Ae()}},i(a){if(!t){for(let o=0;o<n.length;o+=1)A(i[o]);t=!0}},o(a){i=i.filter(Boolean);for(let o=0;o<i.length;o+=1)I(i[o]);t=!1},d(a){Lt(i,a),a&&U(e)}}}function Xo(r){let e,t;return e=new _i({props:{menuItem:r[67],localeConsts:r[23]}}),e.$on("showSideBarPage",r[41]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function jo(r){let e,t,n=r[35],i=[];for(let a=0;a<n.length;a+=1)i[a]=qo(Fo(r,n,a));const s=a=>I(i[a],1,1,()=>{i[a]=null});return{c(){for(let a=0;a<i.length;a+=1)i[a].c();e=Dt()},m(a,o){for(let l=0;l<i.length;l+=1)i[l].m(a,o);B(a,e,o),t=!0},p(a,o){if(o[0]&545456128|o[1]&16){n=a[35];let l;for(l=0;l<n.length;l+=1){const c=Fo(a,n,l);i[l]?(i[l].p(c,o),A(i[l],1)):(i[l]=qo(c),i[l].c(),A(i[l],1),i[l].m(e.parentNode,e))}for(Pe(),l=n.length;l<i.length;l+=1)s(l);Ae()}},i(a){if(!t){for(let o=0;o<n.length;o+=1)A(i[o]);t=!0}},o(a){i=i.filter(Boolean);for(let o=0;o<i.length;o+=1)I(i[o]);t=!1},d(a){Lt(i,a),a&&U(e)}}}function qo(r){let e,t;return e=new _i({props:{menuItem:r[64],localeConsts:r[23],extraClassNames:r[64].id==="debug-id"&&r[17]||r[64].id==="dev-mode-id"&&r[16]?"clicked-icon":""}}),e.$on("showSideBarPage",r[42]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i[0]&196608&&(s.extraClassNames=n[64].id==="debug-id"&&n[17]||n[64].id==="dev-mode-id"&&n[16]?"clicked-icon":""),e.$set(s)},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Yo(r){let e,t,n=r[36],i=[];for(let a=0;a<n.length;a+=1)i[a]=Zo(zo(r,n,a));const s=a=>I(i[a],1,1,()=>{i[a]=null});return{c(){for(let a=0;a<i.length;a+=1)i[a].c();e=Dt()},m(a,o){for(let l=0;l<i.length;l+=1)i[l].m(a,o);B(a,e,o),t=!0},p(a,o){if(o[0]&545456128|o[1]&32){n=a[36];let l;for(l=0;l<n.length;l+=1){const c=zo(a,n,l);i[l]?(i[l].p(c,o),A(i[l],1)):(i[l]=Zo(c),i[l].c(),A(i[l],1),i[l].m(e.parentNode,e))}for(Pe(),l=n.length;l<i.length;l+=1)s(l);Ae()}},i(a){if(!t){for(let o=0;o<n.length;o+=1)A(i[o]);t=!0}},o(a){i=i.filter(Boolean);for(let o=0;o<i.length;o+=1)I(i[o]);t=!1},d(a){Lt(i,a),a&&U(e)}}}function Zo(r){let e,t;return e=new _i({props:{menuItem:r[64],localeConsts:r[23],extraClassNames:r[64].id==="debug-id"&&r[17]||r[64].id==="dev-mode-id"&&r[16]?"clicked-icon":""}}),e.$on("showSideBarPage",r[43]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i[0]&196608&&(s.extraClassNames=n[64].id==="debug-id"&&n[17]||n[64].id==="dev-mode-id"&&n[16]?"clicked-icon":""),e.$set(s)},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Ko(r){let e,t,n=r[34],i=[];for(let a=0;a<n.length;a+=1)i[a]=Jo(No(r,n,a));const s=a=>I(i[a],1,1,()=>{i[a]=null});return{c(){for(let a=0;a<i.length;a+=1)i[a].c();e=Dt()},m(a,o){for(let l=0;l<i.length;l+=1)i[l].m(a,o);B(a,e,o),t=!0},p(a,o){if(o[0]&545259520|o[1]&8){n=a[34];let l;for(l=0;l<n.length;l+=1){const c=No(a,n,l);i[l]?(i[l].p(c,o),A(i[l],1)):(i[l]=Jo(c),i[l].c(),A(i[l],1),i[l].m(e.parentNode,e))}for(Pe(),l=n.length;l<i.length;l+=1)s(l);Ae()}},i(a){if(!t){for(let o=0;o<n.length;o+=1)A(i[o]);t=!0}},o(a){i=i.filter(Boolean);for(let o=0;o<i.length;o+=1)I(i[o]);t=!1},d(a){Lt(i,a),a&&U(e)}}}function Jo(r){let e,t;return e=new _i({props:{menuItem:r[67],localeConsts:r[23]}}),e.$on("showSideBarPage",r[44]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Qo(r){let e,t,n=r[37],i=[];for(let a=0;a<n.length;a+=1)i[a]=$o(Io(r,n,a));const s=a=>I(i[a],1,1,()=>{i[a]=null});return{c(){for(let a=0;a<i.length;a+=1)i[a].c();e=Dt()},m(a,o){for(let l=0;l<i.length;l+=1)i[l].m(a,o);B(a,e,o),t=!0},p(a,o){if(o[0]&545259520|o[1]&64){n=a[37];let l;for(l=0;l<n.length;l+=1){const c=Io(a,n,l);i[l]?(i[l].p(c,o),A(i[l],1)):(i[l]=$o(c),i[l].c(),A(i[l],1),i[l].m(e.parentNode,e))}for(Pe(),l=n.length;l<i.length;l+=1)s(l);Ae()}},i(a){if(!t){for(let o=0;o<n.length;o+=1)A(i[o]);t=!0}},o(a){i=i.filter(Boolean);for(let o=0;o<i.length;o+=1)I(i[o]);t=!1},d(a){Lt(i,a),a&&U(e)}}}function $o(r){let e,t;return e=new _i({props:{menuItem:r[64],localeConsts:r[23]}}),e.$on("showSideBarPage",r[45]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Yp(r){let e,t,n,i,s,a,o=[],l=new Map,c,u=r[38],f=[];for(let h=0;h<u.length;h+=1)f[h]=el(Ro(r,u,h));n=new ps({props:{placeholder:r[23].search_placeholder}}),n.$on("search-value-update",r[47]);let d=r[5];const m=h=>h[58].id;for(let h=0;h<d.length;h+=1){let p=ko(r,d,h),_=m(p);l.set(_,o[h]=tl(_,p))}return{c(){e=z("div");for(let h=0;h<f.length;h+=1)f[h].c();t=K(),ee(n.$$.fragment),i=K(),s=z("div"),a=z("div");for(let h=0;h<o.length;h+=1)o[h].c();L(e,"class","horizontal-tab"),L(a,"class","nav-body"),L(s,"class","item-rows")},m(h,p){B(h,e,p);for(let _=0;_<f.length;_+=1)f[_].m(e,null);B(h,t,p),Q(n,h,p),B(h,i,p),B(h,s,p),C(s,a);for(let _=0;_<o.length;_+=1)o[_].m(a,null);c=!0},p(h,p){if(p[0]&41943056|p[1]&128){u=h[38];let _;for(_=0;_<u.length;_+=1){const g=Ro(h,u,_);f[_]?f[_].p(g,p):(f[_]=el(g),f[_].c(),f[_].m(e,null))}for(;_<f.length;_+=1)f[_].d(1);f.length=u.length}if(p[0]&402669600){d=h[5],Pe();for(let _=0;_<o.length;_+=1)o[_].r();o=xr(o,p,m,1,h,d,l,a,hs,tl,null,ko);for(let _=0;_<o.length;_+=1)o[_].a();Ae()}},i(h){if(!c){A(n.$$.fragment,h);for(let p=0;p<d.length;p+=1)A(o[p]);c=!0}},o(h){I(n.$$.fragment,h);for(let p=0;p<o.length;p+=1)I(o[p]);c=!1},d(h){h&&U(e),Lt(f,h),h&&U(t),$(n,h),h&&U(i),h&&U(s);for(let p=0;p<o.length;p+=1)o[p].d()}}}function Zp(r){let e,t;return e=new Hp({props:{localeConsts:r[23]}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Kp(r){let e,t;return e=new Rp({props:{localeConsts:r[23],showingPanels:r[12]}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i[0]&4096&&(s.showingPanels=n[12]),e.$set(s)},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Jp(r){let e,t;return e=new Mp({props:{localeConsts:r[23]}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Qp(r){let e,t;return e=new rp({props:{localeConsts:r[23]}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function $p(r){let e,t;return e=new Uh({props:{localeConsts:r[23]}}),e.$on("theme-changed",r[30]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function em(r){let e,t;return e=new Qh({props:{panels:r[18],localeConsts:r[23]}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i[0]&262144&&(s.panels=n[18]),e.$set(s)},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function el(r){let e,t=et.upperCaseFirstLetter(r[23][r[61]+"_tab"])+"",n,i,s,a;function o(){return r[46](r[61])}return{c(){e=z("button"),n=J(t),L(e,"id",r[61]),L(e,"class",i="tablinks "+(r[4]===r[61]?"active-horizontal-tab-link":""))},m(l,c){B(l,e,c),C(e,n),s||(a=ze(e,"click",o),s=!0)},p(l,c){r=l,c[0]&16&&i!==(i="tablinks "+(r[4]===r[61]?"active-horizontal-tab-link":""))&&L(e,"class",i)},d(l){l&&U(e),s=!1,a()}}}function tl(r,e){let t,n,i,s,a=_e,o;return n=new zh({props:{panelData:e[58],bgColor:e[14].includes(e[58].title)?"clicked-pane-non-panel":e[60]%2!==0?"odd-pane-panel":"even-pane-panel-bg"}}),n.$on("star",e[27]),n.$on("panelClicked",e[28]),{key:r,first:null,c(){t=z("div"),ee(n.$$.fragment),i=K(),this.first=t},m(l,c){B(l,t,c),Q(n,t,null),C(t,i),o=!0},p(l,c){e=l;const u={};c[0]&32&&(u.panelData=e[58]),c[0]&16416&&(u.bgColor=e[14].includes(e[58].title)?"clicked-pane-non-panel":e[60]%2!==0?"odd-pane-panel":"even-pane-panel-bg"),n.$set(u)},r(){s=t.getBoundingClientRect()},f(){Mr(t),a()},a(){a(),a=wr(t,s,Sr,{duration:400})},i(l){o||(A(n.$$.fragment,l),o=!0)},o(l){I(n.$$.fragment,l),o=!1},d(l){l&&U(t),$(n)}}}function tm(r){let e,t,n,i,s,a,o,l,c,u;n=new Ft({props:{icon:r[3]?Fa:za,size:"sm",color:"white",style:"margin-top:0.6vw;margin-left:0.45vw;"}});const f=[qp,jp],d=[];function m(h,p){return h[2]?0:1}return a=m(r),o=d[a]=f[a](r),{c(){e=z("div"),t=z("div"),ee(n.$$.fragment),i=K(),s=z("div"),o.c(),L(t,"id","expander"),L(t,"class","inline-block expander bg-gray-400 hover:bg-gray-600"),Bn(t,"margin-left",r[0]-1.5+"vw"),Bn(t,"margin-top",r[1]+"vw"),L(s,"id","menu_base_id"),L(s,"class","inline-block menu-base"),Bn(s,"margin-left",r[0]+"vw"),Bn(s,"margin-top",r[1]+"vw"),L(e,"class","block"),L(e,"data-theme",r[19])},m(h,p){B(h,e,p),C(e,t),Q(n,t,null),C(e,i),C(e,s),d[a].m(s,null),l=!0,c||(u=ze(t,"click",r[24]),c=!0)},p(h,p){const _={};p[0]&8&&(_.icon=h[3]?Fa:za),n.$set(_),(!l||p[0]&1)&&Bn(t,"margin-left",h[0]-1.5+"vw"),(!l||p[0]&2)&&Bn(t,"margin-top",h[1]+"vw");let g=a;a=m(h),a===g?d[a].p(h,p):(Pe(),I(d[g],1,1,()=>{d[g]=null}),Ae(),o=d[a],o?o.p(h,p):(o=d[a]=f[a](h),o.c()),A(o,1),o.m(s,null)),(!l||p[0]&1)&&Bn(s,"margin-left",h[0]+"vw"),(!l||p[0]&2)&&Bn(s,"margin-top",h[1]+"vw"),(!l||p[0]&524288)&&L(e,"data-theme",h[19])},i(h){l||(A(n.$$.fragment,h),A(o),l=!0)},o(h){I(n.$$.fragment,h),I(o),l=!1},d(h){h&&U(e),$(n),d[a].d(),c=!1,u()}}}function nm(r,e,t){let n,i,s,{left:a=70}=e,{top:o=5}=e,{locales:l,data:c,isDev:u}=vt;ut(r,l,O=>t(52,s=O)),ut(r,c,O=>t(50,n=O)),ut(r,u,O=>t(51,i=O));let f=s,d=!1,m=!1,h="all",p=[],_="",g=!1,v=!1,b=!1,w=!1,y=!1,x=[],E={showGodModeAdminPage:!1,showThemePage:!1,showChat:!1,showReportsPage:!1,showPlayersPage:!1,showResourcesPage:!1},M=[],S=!0,P=!1,k=!1,H=!1,V=[f.Max_Mod_Vehicle,f.Fix_Vehicle,f.Teleport_Marker,f.Revive_In_Radius,f.Bennys,f.Admin_Car,f.Refuel_Vehicle,f.Toggle_Duty,f.Give_Keys,f.Revive_All],F=[{id:1,title:f.Revive,hasPanel:!0,tabName:"player"},{id:2,title:f.NoClip,hasPanel:!1,tabName:"utility",cb:"noclip"},{id:3,title:f.Give_Item,hasPanel:!0,tabName:"player"},{id:4,title:f.Spawn_Car,hasPanel:!0,tabName:"utility"},{id:5,title:f.Fix_Vehicle,hasPanel:!1,tabName:"utility",cb:"fixvehicle"},{id:6,title:f.Clothes_Menu,hasPanel:!0,tabName:"player"},{id:7,title:f.Player_Info,hasPanel:!0,tabName:"player"},{id:8,title:f.Announce,hasPanel:!0,tabName:"utility"},{id:9,title:f.God_Mode,hasPanel:!1,tabName:"utility",cb:"godmode"},{id:10,title:f.Kick,hasPanel:!0,tabName:"player"},{id:11,title:f.Super_Jump,hasPanel:!1,tabName:"utility",cb:"superjump"},{id:12,title:f.Remove_Stress,hasPanel:!0,tabName:"utility"},{id:13,title:f.Teleport_Coords,hasPanel:!0,tabName:"utility"},{id:14,title:f.Teleport_Marker,hasPanel:!1,tabName:"utility",cb:"teleportmarker"},{id:15,title:f.Teleport_to_Player,hasPanel:!0,tabName:"player"},{id:16,title:f.Invisible,hasPanel:!1,tabName:"utility",cb:"invisible"},{id:17,title:f.Give_Money,hasPanel:!0,tabName:"player"},{id:18,title:f.Give_Car,hasPanel:!0,tabName:"player"},{id:19,title:f.Open_Inventory,hasPanel:!0,tabName:"player"},{id:20,title:f.Freeze_Player,hasPanel:!0,tabName:"player"},{id:21,title:f.Change_Plate,hasPanel:!0,tabName:"utility"},{id:22,title:f.Spawn_Objects,hasPanel:!0,tabName:"utility"},{id:23,title:f.Create_Job_Stashes,hasPanel:!0,tabName:"utility"},{id:24,title:f.Give_Job,hasPanel:!0,tabName:"player"},{id:25,title:f.Copy_Coordinates,hasPanel:!0,tabName:"utility"},{id:26,title:f.Toggle_Blips,hasPanel:!1,tabName:"utility",cb:"toggleBlips"},{id:27,title:f.Ban_Player,hasPanel:!0,tabName:"player"},{id:28,title:f.Show_Coordinates,hasPanel:!1,tabName:"utility",cb:"showCoords"},{id:29,title:f.Clear_Inventory,hasPanel:!0,tabName:"player"},{id:30,title:f.Bring_Player,hasPanel:!0,tabName:"player"},{id:31,title:f.Clear_Area_Vehicles,hasPanel:!0,tabName:"utility"},{id:32,title:f.Change_Weather,hasPanel:!0,tabName:"utility"},{id:33,title:f.Change_Time,hasPanel:!0,tabName:"utility"},{id:34,title:f.Create_Gang_Stashes,hasPanel:!0,tabName:"utility"},{id:35,title:f.Spectate_Player,hasPanel:!0,tabName:"player"},{id:36,title:f.Saved_Locations,hasPanel:!0,tabName:"utility"},{id:37,title:f.Revive_In_Radius,hasPanel:!1,tabName:"utility",cb:"reviveRadius"},{id:38,title:f.Show_Props,hasPanel:!0,tabName:"utility"},{id:39,title:f.Toggle_Names,hasPanel:!1,tabName:"utility",cb:"toggleNames"},{id:40,title:f.Bennys,hasPanel:!1,tabName:"utility",cb:"toggleBennys"},{id:41,title:f.Admin_Car,hasPanel:!1,tabName:"utility",cb:"addAdminCar"},{id:42,title:f.Refuel_Vehicle,hasPanel:!1,tabName:"utility",cb:"refuelVehicle"},{id:43,title:f.Toggle_Duty,hasPanel:!1,tabName:"player",cb:"toggleDuty"},{id:44,title:f.Open_Stash,hasPanel:!0,tabName:"player"},{id:45,title:f.Open_Trunk,hasPanel:!0,tabName:"player"},{id:46,title:f.Open_Glovebox,hasPanel:!0,tabName:"player"},{id:47,title:f.Unban_Player,hasPanel:!0,tabName:"player"},{id:48,title:f.Change_Ped_Model,hasPanel:!0,tabName:"player"},{id:49,title:f.Ban_Offline_Player,hasPanel:!0,tabName:"player"},{id:50,title:f.Warn,hasPanel:!0,tabName:"player"},{id:51,title:f.Give_Gang,hasPanel:!0,tabName:"player"},{id:52,title:f.Drunk_Player,hasPanel:!0,tabName:"troll"},{id:53,title:f.Set_Player_on_Fire,hasPanel:!0,tabName:"troll"},{id:54,title:f.Play_Sound_On_Player,hasPanel:!0,tabName:"troll"},{id:55,title:f.Slap_Player_In_Sky,hasPanel:!0,tabName:"troll"},{id:56,title:f.Send_Player_To_JailBox,hasPanel:!0,tabName:"troll"},{id:57,title:f.Give_Keys,hasPanel:!1,tabName:"utility",cb:"givekeys"},{id:58,title:f.Infinite_Ammo,hasPanel:!1,tabName:"utility",cb:"infiniteAmmo"},{id:59,title:f.Change_Vehicle_State,hasPanel:!0,tabName:"utility"},{id:60,title:f.Force_Logout_Player,hasPanel:!0,tabName:"utility"},{id:61,title:f.Give_Outfits,hasPanel:!0,tabName:"player"},{id:62,title:f.DM_Player,hasPanel:!0,tabName:"utility"},{id:63,title:f.Damage_Player_Vehicle,hasPanel:!0,tabName:"troll"},{id:64,title:f.NoClip_2,hasPanel:!1,tabName:"utility",cb:"noclip2"},{id:65,title:f.Admin_Tag,hasPanel:!1,tabName:"utility",cb:"admintag"},{id:66,title:f.Toggle_Minimap,hasPanel:!1,tabName:"utility",cb:"toggleminimap"},{id:67,title:f.Revive_All,hasPanel:!1,tabName:"player",cb:"reviveall"},{id:68,title:f.Clear_Area_Peds,hasPanel:!0,tabName:"utility"},{id:69,title:f.Clear_Area_Objects,hasPanel:!0,tabName:"utility"},{id:70,title:f.Heal,hasPanel:!0,tabName:"player"},{id:71,title:f.Wipe_Player,hasPanel:!0,tabName:"player"},{id:72,title:f.Max_Mod_Vehicle,hasPanel:!1,tabName:"utility",cb:"maxmodvehicle"},{id:73,title:f.Pee_Player,hasPanel:!0,tabName:"troll"},{id:74,title:f.Poop_Player,hasPanel:!0,tabName:"troll"},{id:75,title:f.Give_Perms,hasPanel:!0,tabName:"utility"},{id:76,title:f.Remove_Perms,hasPanel:!0,tabName:"utility"}],j=localStorage.getItem("theme-chosen")?localStorage.getItem("theme-chosen"):"Original";lt(async()=>{t(2,d=!0),t(19,j=localStorage.getItem("theme-chosen")?localStorage.getItem("theme-chosen"):"Original"),i&&Mu(c,n={clickedPanels:["NoClip"],userRole:"God",isTerminal:"no",canSeeReports:"yes",isESX:!0,panelsToDisplay:["Announce","Admin Car"],customPanels:[{panelTitle:"Sakshi",submitUrl:"sakshi-submit",components:[{type:"string-input",placeholder:"",fetchDataUrl:"",label:"SakshiLabel",fillCompulsory:!0,keyName:"sakshi"},{type:"number-input",placeholder:"1",fetchDataUrl:"",label:"SakshiNumberLabel",fillCompulsory:!0,keyName:"sakshinumber"},{type:"regular-dropdown",placeholder:"",fetchDataUrl:"somethingfetchurl",label:"SakshiRegDdLabel",fillCompulsory:!0,keyName:"sakshiregdd"},{type:"checkbox-input",placeholder:"",fetchDataUrl:"",label:"SakshicheckboxLabel",fillCompulsory:!1,keyName:"sakshicheckbox"},{type:"searchable-dropdown",placeholder:"",fetchDataUrl:"searchableddfetch",label:"SakshisearchableDdLabel",fillCompulsory:!0,keyName:"sakshisearchdd"}]},{panelTitle:"Pushkar",submitUrl:"pushkar-submit",components:[]}]},n),ce(n.customPanels),t(14,M=n.clickedPanels),t(15,S=n.isGod),n.userRole,t(16,P=n.isTerminal==="yes"),t(17,k=n.isDebug==="yes"),H=n.isESX===!0||n.isESX==="true",S&&(t(7,g=!0),t(8,v=!0),t(9,b=!0),t(10,w=!0),t(11,y=!0),t(12,x=F.map(O=>O.title))),de(),S||(t(12,x=n.panelsToDisplay),t(18,F=F.filter(O=>{if(x.includes(O.title))return O})),x.includes(f.side_panel_player_list)&&t(7,g=!0),x.includes(f.dev_mode_side_panel)&&t(8,v=!0),x.includes(f.debug_mode_side_panel)&&t(9,b=!0),x.includes(f.resources_side_panel)&&t(10,w=!0),x.includes(f.reports_side_panel)&&t(11,y=!0)),t(18,F=F.filter(O=>{if(O.title!==f.side_panel_player_list||O.title!==f.dev_mode_side_panel||O.title!==f.debug_mode_side_panel||O.title!==f.resources_side_panel||O.title!==f.reports_side_panel)return O})),pe(),t(2,d=!1)});function ce(O){let se=Math.max(...F.map(me=>me.id)),oe=O.map((me,Le)=>(me.components.length===0&&V.push(me.panelTitle),{id:se+Le+1,title:me.panelTitle,hasPanel:me.components.length>0,tabName:"custom",cb:me.submitUrl,components:me.components}));t(18,F=F.concat(oe))}function de(){H&&t(18,F=F.filter(O=>{if(O.title!==f.Create_Gang_Stashes&&O.title!==f.Give_Gang)return O}))}function te(){const O=document.getElementById("menu_base_id"),se=document.getElementById("inner_div_id"),oe=document.getElementById("expander"),me=100*(innerWidth/2)/innerWidth;if(m)O.style.width="23vw",O.style.transitionDuration="0.2s",O.style.transitionTimingFunction="linear",O.style.transform="translate(0vw)",se.style.width="20vw",oe.style.transitionDuration="0.2s",oe.style.transitionTimingFunction="linear",oe.style.transform="translate(0vw)";else{let Le=me-parseFloat(O.style.marginLeft)-20;O.style.width="40vw",O.style.transitionDuration="0.2s",O.style.transitionTimingFunction="linear",O.style.transform=`translate(${Le}vw)`,se.style.width="37vw",oe.style.transitionDuration="0.2s",oe.style.transitionTimingFunction="linear",oe.style.transform=`translate(${Le}vw)`}t(3,m=!m)}function re(O){t(4,h=O),pe()}function fe(O){return et.booleanSort(O,"isStarred","asc")}function be(){let O=et.filterAndSort(F,"title",_,"alpha","title");t(5,p=fe(O))}function Y(O){const se=O.detail.panelData,oe=p.indexOf(se);t(5,p[oe]=se,p);let me=p,Le=et.alphabeticalSort(me,"title");t(5,p=fe(Le)),pe()}async function ue(O){const se=O.detail.panelData;if(V.includes(se.title))await De(se.cb);else{let oe=[];M.includes(se.title)?oe=M.filter(Le=>Le!==se.title):(oe=M,oe.push(se.title)),t(14,M=oe),pe();const me={panelsClicked:M};await De(se.cb,me)}}function pe(){if(h==="all"){F.forEach(se=>{se.isStarred=localStorage.getItem(se.title)?localStorage.getItem(se.title):"0"});let O=et.alphabeticalSort(F,"title");t(5,p=fe(O))}else if(h==="player"){let O=F.filter(oe=>oe.tabName==="player"),se=et.alphabeticalSort(O,"title");t(5,p=fe(se))}else if(h==="utility"){let O=F.filter(oe=>oe.tabName==="utility"),se=et.alphabeticalSort(O,"title");t(5,p=fe(se))}else if(h==="troll"){let O=F.filter(oe=>oe.tabName==="troll"),se=et.alphabeticalSort(O,"title");t(5,p=fe(se))}else if(h==="fav"){let O=F.filter(oe=>oe.isStarred==="1"||oe.isStarred===1),se=et.alphabeticalSort(O,"title");t(5,p=fe(se))}else if(h==="custom"){let O=F.filter(oe=>oe.tabName==="custom"),se=et.alphabeticalSort(O,"title");t(5,p=fe(se))}}async function W(O){O==="clickTerminal"?(t(16,P=!P),await De("toggleDev")):O==="clickDebug"?(t(17,k=!k),await De("toggleDebug")):Object.keys(E).forEach(se=>{se===O?t(13,E[se]=!E[se],E):t(13,E[se]=!1,E)})}function Me(){j!==localStorage.getItem("theme-chosen")&&t(19,j=localStorage.getItem("theme-chosen")?localStorage.getItem("theme-chosen"):"Original")}let ye=[{id:"theme-id",showPageKey:"showThemePage",icon:vf,localConstKey:"theme_tooltip"},{id:"chat-id",showPageKey:"showChat",icon:bf,localConstKey:"chat_tooltip"}],Te=[{id:"reports-id",showPageKey:"showReportsPage",icon:mf,localConstKey:"report_tooltip"}],Se=[{id:"players-id",showPageKey:"showPlayersPage",icon:wf,localConstKey:"players_tooltip"}],Ne=[{id:"resources-id",showPageKey:"showResourcesPage",icon:pf,localConstKey:"resources_tooltip"}],Re=[{id:"dev-mode-id",showPageKey:"clickTerminal",icon:Lf,localConstKey:"dev_mode_tooltip"}],Ve=[{id:"debug-id",showPageKey:"clickDebug",icon:cf,localConstKey:"debug_tooltip"}],je=[{id:"settings-id",showPageKey:"showGodModeAdminPage",icon:gf,localConstKey:"settings_tooltip"}],qe=["all","player","utility","troll","fav","custom"];const it=O=>W(O.detail),yt=O=>W(O.detail),_t=O=>W(O.detail),st=O=>W(O.detail),at=O=>W(O.detail),Ht=O=>W(O.detail),kt=O=>W(O.detail),R=O=>re(O),T=O=>{t(6,_=O.detail),be()};return r.$$set=O=>{"left"in O&&t(0,a=O.left),"top"in O&&t(1,o=O.top)},[a,o,d,m,h,p,_,g,v,b,w,y,x,E,M,S,P,k,F,j,l,c,u,f,te,re,be,Y,ue,W,Me,ye,Te,Se,Ne,Re,Ve,je,qe,it,yt,_t,st,at,Ht,kt,R,T]}class im extends We{constructor(e){super(),He(this,e,nm,tm,Ge,{left:0,top:1},null,[-1,-1,-1])}}function nl(r,e,t){const n=r.slice();return n[16]=e[t],n}function rm(r){let e,t=r[2],n=[];for(let i=0;i<t.length;i+=1)n[i]=il(nl(r,t,i));return{c(){e=z("div");for(let i=0;i<n.length;i+=1)n[i].c();L(e,"id","chat-display"),L(e,"class","user-report-page-body")},m(i,s){B(i,e,s);for(let a=0;a<n.length;a+=1)n[a].m(e,null)},p(i,s){if(s&6){t=i[2];let a;for(a=0;a<t.length;a+=1){const o=nl(i,t,a);n[a]?n[a].p(o,s):(n[a]=il(o),n[a].c(),n[a].m(e,null))}for(;a<n.length;a+=1)n[a].d(1);n.length=t.length}},i:_e,o:_e,d(i){i&&U(e),Lt(n,i)}}}function sm(r){let e,t;return e=new ft({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function il(r){let e,t,n=r[16].message+"",i,s,a,o,l=r[1]===r[16].sender?"You":"Admin",c,u,f=r[16].formattedTime+"",d,m,h;return{c(){e=z("div"),t=z("div"),i=J(n),a=K(),o=z("small"),c=J(l),u=J(", "),d=J(f),h=K(),L(t,"class",s="txt-2sm user-report-chat-panel "+(r[1]===r[16].sender?"user-report-adjust-border-self-chat-info user-report-self-chat-panel-bg":"user-report-adjust-border-others-chat-info")),L(o,"class",m="txt-xs user-report-chat-info "+(r[1]===r[16].sender?"user-report-self-chat-info":"user-report-others-chat-info")),L(e,"class","user-report-each-chat")},m(p,_){B(p,e,_),C(e,t),C(t,i),C(e,a),C(e,o),C(o,c),C(o,u),C(o,d),C(e,h)},p(p,_){_&4&&n!==(n=p[16].message+"")&&he(i,n),_&6&&s!==(s="txt-2sm user-report-chat-panel "+(p[1]===p[16].sender?"user-report-adjust-border-self-chat-info user-report-self-chat-panel-bg":"user-report-adjust-border-others-chat-info"))&&L(t,"class",s),_&6&&l!==(l=p[1]===p[16].sender?"You":"Admin")&&he(c,l),_&4&&f!==(f=p[16].formattedTime+"")&&he(d,f),_&6&&m!==(m="txt-xs user-report-chat-info "+(p[1]===p[16].sender?"user-report-self-chat-info":"user-report-others-chat-info"))&&L(o,"class",m)},d(p){p&&U(e)}}}function am(r){let e,t,n,i,s,a,o,l,c,u,f,d,m,h,p;const _=[sm,rm],g=[];function v(b,w){return b[0]?0:1}return i=v(r),s=g[i]=_[i](r),f=new Ft({props:{icon:rf}}),{c(){e=z("div"),t=z("div"),t.textContent=`${r[7].reports_heading}`,n=K(),s.c(),a=K(),o=z("div"),l=z("textarea"),c=K(),u=z("div"),ee(f.$$.fragment),L(t,"class","user-report-header"),L(l,"class","user-report-send-message-input txt-sm"),L(u,"class",d="user-report-send-msg-icon "+(r[4]?"user-report-send-msg-icon-disabled":"user-report-send-msg-icon-enabled")),L(o,"class","user-report-send-message-wrapper"),L(e,"class","user-report-base")},m(b,w){B(b,e,w),C(e,t),C(e,n),g[i].m(e,null),C(e,a),C(e,o),C(o,l),zt(l,r[3]),C(o,c),C(o,u),Q(f,u,null),m=!0,h||(p=[ze(l,"input",r[11]),ze(l,"keydown",r[8]),ze(u,"click",r[9]),ze(o,"keypress",r[10])],h=!0)},p(b,[w]){let y=i;i=v(b),i===y?g[i].p(b,w):(Pe(),I(g[y],1,1,()=>{g[y]=null}),Ae(),s=g[i],s?s.p(b,w):(s=g[i]=_[i](b),s.c()),A(s,1),s.m(e,a)),w&8&&zt(l,b[3]),(!m||w&16&&d!==(d="user-report-send-msg-icon "+(b[4]?"user-report-send-msg-icon-disabled":"user-report-send-msg-icon-enabled")))&&L(u,"class",d)},i(b){m||(A(s),A(f.$$.fragment,b),m=!0)},o(b){I(s),I(f.$$.fragment,b),m=!1},d(b){b&&U(e),g[i].d(),$(f),h=!1,Mt(p)}}}function om(r,e,t){let n,i,s=!1,a="",o=[],{reportData:l}=_r;ut(r,l,b=>t(12,n=b));let c="",u=!0,{locales:f,data:d}=vt;ut(r,f,b=>t(13,i=b));let m=i;lt(async()=>{t(0,s=!0),t(2,o=n.chats),t(1,a=n.currentUser),h(),On.scrollToTop("chat-display",100),t(0,s=!1)});function h(){o.map(b=>{var w=new Date(b.time*1e3);let y=Intl.DateTimeFormat().resolvedOptions().timeZone,x=w.toLocaleString("en-US",{timeZone:y});return b.formattedTime=x,b})}function p(){t(4,u=c.trim()==="")}async function _(){if(!u){t(0,s=!0);const w=await De("sendReportMessage",{currentUser:a,newMessage:c});t(2,o=w.chats),h(),t(3,c=""),On.scrollToTop("chat-display",100),t(4,u=!0),t(0,s=!1)}}function g(b){On.canSendMessage(b,c)&&_()}function v(){c=this.value,t(3,c)}return[s,a,o,c,u,l,f,m,p,_,g,v]}class lm extends We{constructor(e){super(),He(this,e,om,am,Ge,{})}}function cm(r){let e,t,n,i,s;return i=new Ft({props:{icon:hf}}),{c(){e=z("div"),t=z("div"),n=z("div"),ee(i.$$.fragment),L(n,"class","unread-report-header-close svelte-j2h0ts"),L(t,"class","unread-right svelte-j2h0ts")},m(a,o){B(a,e,o),C(e,t),C(t,n),Q(i,n,null),s=!0},p:_e,i(a){s||(A(i.$$.fragment,a),s=!0)},o(a){I(i.$$.fragment,a),s=!1},d(a){a&&U(e),$(i)}}}class um extends We{constructor(e){super(),He(this,e,null,cm,Ge,{})}}/**
 * @license
 * Copyright 2010-2023 Three.js Authors
 * SPDX-License-Identifier: MIT
 */const ya="150",fm=0,rl=1,dm=2,Hc=1,hm=2,ar=3,Zn=0,an=1,zn=2,Yn=0,zi=1,sl=2,al=3,ol=4,pm=5,Di=100,mm=101,_m=102,ll=103,cl=104,gm=200,bm=201,vm=202,ym=203,Wc=204,Xc=205,wm=206,Mm=207,xm=208,Sm=209,Cm=210,Tm=0,Em=1,Lm=2,la=3,Pm=4,Am=5,Dm=6,km=7,jc=0,Rm=1,Im=2,Un=0,Nm=1,zm=2,Fm=3,Om=4,Um=5,qc=300,Vi=301,Gi=302,ca=303,ua=304,ms=306,fa=1e3,_n=1001,da=1002,Yt=1003,ul=1004,Ts=1005,fn=1006,Bm=1007,br=1008,di=1009,Vm=1010,Gm=1011,Yc=1012,Hm=1013,li=1014,ci=1015,vr=1016,Wm=1017,Xm=1018,Fi=1020,jm=1021,gn=1023,qm=1024,Ym=1025,ui=1026,Hi=1027,Zm=1028,Km=1029,Jm=1030,Qm=1031,$m=1033,Es=33776,Ls=33777,Ps=33778,As=33779,fl=35840,dl=35841,hl=35842,pl=35843,e_=36196,ml=37492,_l=37496,gl=37808,bl=37809,vl=37810,yl=37811,wl=37812,Ml=37813,xl=37814,Sl=37815,Cl=37816,Tl=37817,El=37818,Ll=37819,Pl=37820,Al=37821,Ds=36492,t_=36283,Dl=36284,kl=36285,Rl=36286,hi=3e3,ht=3001,n_=3200,i_=3201,r_=0,s_=1,xn="srgb",yr="srgb-linear",Zc="display-p3",ks=7680,a_=519,Il=35044,Nl="300 es",ha=1035;class Xi{addEventListener(e,t){this._listeners===void 0&&(this._listeners={});const n=this._listeners;n[e]===void 0&&(n[e]=[]),n[e].indexOf(t)===-1&&n[e].push(t)}hasEventListener(e,t){if(this._listeners===void 0)return!1;const n=this._listeners;return n[e]!==void 0&&n[e].indexOf(t)!==-1}removeEventListener(e,t){if(this._listeners===void 0)return;const i=this._listeners[e];if(i!==void 0){const s=i.indexOf(t);s!==-1&&i.splice(s,1)}}dispatchEvent(e){if(this._listeners===void 0)return;const n=this._listeners[e.type];if(n!==void 0){e.target=this;const i=n.slice(0);for(let s=0,a=i.length;s<a;s++)i[s].call(this,e);e.target=null}}}const Bt=["00","01","02","03","04","05","06","07","08","09","0a","0b","0c","0d","0e","0f","10","11","12","13","14","15","16","17","18","19","1a","1b","1c","1d","1e","1f","20","21","22","23","24","25","26","27","28","29","2a","2b","2c","2d","2e","2f","30","31","32","33","34","35","36","37","38","39","3a","3b","3c","3d","3e","3f","40","41","42","43","44","45","46","47","48","49","4a","4b","4c","4d","4e","4f","50","51","52","53","54","55","56","57","58","59","5a","5b","5c","5d","5e","5f","60","61","62","63","64","65","66","67","68","69","6a","6b","6c","6d","6e","6f","70","71","72","73","74","75","76","77","78","79","7a","7b","7c","7d","7e","7f","80","81","82","83","84","85","86","87","88","89","8a","8b","8c","8d","8e","8f","90","91","92","93","94","95","96","97","98","99","9a","9b","9c","9d","9e","9f","a0","a1","a2","a3","a4","a5","a6","a7","a8","a9","aa","ab","ac","ad","ae","af","b0","b1","b2","b3","b4","b5","b6","b7","b8","b9","ba","bb","bc","bd","be","bf","c0","c1","c2","c3","c4","c5","c6","c7","c8","c9","ca","cb","cc","cd","ce","cf","d0","d1","d2","d3","d4","d5","d6","d7","d8","d9","da","db","dc","dd","de","df","e0","e1","e2","e3","e4","e5","e6","e7","e8","e9","ea","eb","ec","ed","ee","ef","f0","f1","f2","f3","f4","f5","f6","f7","f8","f9","fa","fb","fc","fd","fe","ff"];let zl=1234567;const hr=Math.PI/180,fs=180/Math.PI;function ji(){const r=Math.random()*4294967295|0,e=Math.random()*4294967295|0,t=Math.random()*4294967295|0,n=Math.random()*4294967295|0;return(Bt[r&255]+Bt[r>>8&255]+Bt[r>>16&255]+Bt[r>>24&255]+"-"+Bt[e&255]+Bt[e>>8&255]+"-"+Bt[e>>16&15|64]+Bt[e>>24&255]+"-"+Bt[t&63|128]+Bt[t>>8&255]+"-"+Bt[t>>16&255]+Bt[t>>24&255]+Bt[n&255]+Bt[n>>8&255]+Bt[n>>16&255]+Bt[n>>24&255]).toLowerCase()}function $t(r,e,t){return Math.max(e,Math.min(t,r))}function wa(r,e){return(r%e+e)%e}function o_(r,e,t,n,i){return n+(r-e)*(i-n)/(t-e)}function l_(r,e,t){return r!==e?(t-r)/(e-r):0}function pr(r,e,t){return(1-t)*r+t*e}function c_(r,e,t,n){return pr(r,e,1-Math.exp(-t*n))}function u_(r,e=1){return e-Math.abs(wa(r,e*2)-e)}function f_(r,e,t){return r<=e?0:r>=t?1:(r=(r-e)/(t-e),r*r*(3-2*r))}function d_(r,e,t){return r<=e?0:r>=t?1:(r=(r-e)/(t-e),r*r*r*(r*(r*6-15)+10))}function h_(r,e){return r+Math.floor(Math.random()*(e-r+1))}function p_(r,e){return r+Math.random()*(e-r)}function m_(r){return r*(.5-Math.random())}function __(r){r!==void 0&&(zl=r);let e=zl+=1831565813;return e=Math.imul(e^e>>>15,e|1),e^=e+Math.imul(e^e>>>7,e|61),((e^e>>>14)>>>0)/4294967296}function g_(r){return r*hr}function b_(r){return r*fs}function pa(r){return(r&r-1)===0&&r!==0}function v_(r){return Math.pow(2,Math.ceil(Math.log(r)/Math.LN2))}function Kc(r){return Math.pow(2,Math.floor(Math.log(r)/Math.LN2))}function y_(r,e,t,n,i){const s=Math.cos,a=Math.sin,o=s(t/2),l=a(t/2),c=s((e+n)/2),u=a((e+n)/2),f=s((e-n)/2),d=a((e-n)/2),m=s((n-e)/2),h=a((n-e)/2);switch(i){case"XYX":r.set(o*u,l*f,l*d,o*c);break;case"YZY":r.set(l*d,o*u,l*f,o*c);break;case"ZXZ":r.set(l*f,l*d,o*u,o*c);break;case"XZX":r.set(o*u,l*h,l*m,o*c);break;case"YXY":r.set(l*m,o*u,l*h,o*c);break;case"ZYZ":r.set(l*h,l*m,o*u,o*c);break;default:console.warn("THREE.MathUtils: .setQuaternionFromProperEuler() encountered an unknown order: "+i)}}function or(r,e){switch(e.constructor){case Float32Array:return r;case Uint16Array:return r/65535;case Uint8Array:return r/255;case Int16Array:return Math.max(r/32767,-1);case Int8Array:return Math.max(r/127,-1);default:throw new Error("Invalid component type.")}}function Jt(r,e){switch(e.constructor){case Float32Array:return r;case Uint16Array:return Math.round(r*65535);case Uint8Array:return Math.round(r*255);case Int16Array:return Math.round(r*32767);case Int8Array:return Math.round(r*127);default:throw new Error("Invalid component type.")}}const Ln={DEG2RAD:hr,RAD2DEG:fs,generateUUID:ji,clamp:$t,euclideanModulo:wa,mapLinear:o_,inverseLerp:l_,lerp:pr,damp:c_,pingpong:u_,smoothstep:f_,smootherstep:d_,randInt:h_,randFloat:p_,randFloatSpread:m_,seededRandom:__,degToRad:g_,radToDeg:b_,isPowerOfTwo:pa,ceilPowerOfTwo:v_,floorPowerOfTwo:Kc,setQuaternionFromProperEuler:y_,normalize:Jt,denormalize:or};class ot{constructor(e=0,t=0){ot.prototype.isVector2=!0,this.x=e,this.y=t}get width(){return this.x}set width(e){this.x=e}get height(){return this.y}set height(e){this.y=e}set(e,t){return this.x=e,this.y=t,this}setScalar(e){return this.x=e,this.y=e,this}setX(e){return this.x=e,this}setY(e){return this.y=e,this}setComponent(e,t){switch(e){case 0:this.x=t;break;case 1:this.y=t;break;default:throw new Error("index is out of range: "+e)}return this}getComponent(e){switch(e){case 0:return this.x;case 1:return this.y;default:throw new Error("index is out of range: "+e)}}clone(){return new this.constructor(this.x,this.y)}copy(e){return this.x=e.x,this.y=e.y,this}add(e){return this.x+=e.x,this.y+=e.y,this}addScalar(e){return this.x+=e,this.y+=e,this}addVectors(e,t){return this.x=e.x+t.x,this.y=e.y+t.y,this}addScaledVector(e,t){return this.x+=e.x*t,this.y+=e.y*t,this}sub(e){return this.x-=e.x,this.y-=e.y,this}subScalar(e){return this.x-=e,this.y-=e,this}subVectors(e,t){return this.x=e.x-t.x,this.y=e.y-t.y,this}multiply(e){return this.x*=e.x,this.y*=e.y,this}multiplyScalar(e){return this.x*=e,this.y*=e,this}divide(e){return this.x/=e.x,this.y/=e.y,this}divideScalar(e){return this.multiplyScalar(1/e)}applyMatrix3(e){const t=this.x,n=this.y,i=e.elements;return this.x=i[0]*t+i[3]*n+i[6],this.y=i[1]*t+i[4]*n+i[7],this}min(e){return this.x=Math.min(this.x,e.x),this.y=Math.min(this.y,e.y),this}max(e){return this.x=Math.max(this.x,e.x),this.y=Math.max(this.y,e.y),this}clamp(e,t){return this.x=Math.max(e.x,Math.min(t.x,this.x)),this.y=Math.max(e.y,Math.min(t.y,this.y)),this}clampScalar(e,t){return this.x=Math.max(e,Math.min(t,this.x)),this.y=Math.max(e,Math.min(t,this.y)),this}clampLength(e,t){const n=this.length();return this.divideScalar(n||1).multiplyScalar(Math.max(e,Math.min(t,n)))}floor(){return this.x=Math.floor(this.x),this.y=Math.floor(this.y),this}ceil(){return this.x=Math.ceil(this.x),this.y=Math.ceil(this.y),this}round(){return this.x=Math.round(this.x),this.y=Math.round(this.y),this}roundToZero(){return this.x=this.x<0?Math.ceil(this.x):Math.floor(this.x),this.y=this.y<0?Math.ceil(this.y):Math.floor(this.y),this}negate(){return this.x=-this.x,this.y=-this.y,this}dot(e){return this.x*e.x+this.y*e.y}cross(e){return this.x*e.y-this.y*e.x}lengthSq(){return this.x*this.x+this.y*this.y}length(){return Math.sqrt(this.x*this.x+this.y*this.y)}manhattanLength(){return Math.abs(this.x)+Math.abs(this.y)}normalize(){return this.divideScalar(this.length()||1)}angle(){return Math.atan2(-this.y,-this.x)+Math.PI}distanceTo(e){return Math.sqrt(this.distanceToSquared(e))}distanceToSquared(e){const t=this.x-e.x,n=this.y-e.y;return t*t+n*n}manhattanDistanceTo(e){return Math.abs(this.x-e.x)+Math.abs(this.y-e.y)}setLength(e){return this.normalize().multiplyScalar(e)}lerp(e,t){return this.x+=(e.x-this.x)*t,this.y+=(e.y-this.y)*t,this}lerpVectors(e,t,n){return this.x=e.x+(t.x-e.x)*n,this.y=e.y+(t.y-e.y)*n,this}equals(e){return e.x===this.x&&e.y===this.y}fromArray(e,t=0){return this.x=e[t],this.y=e[t+1],this}toArray(e=[],t=0){return e[t]=this.x,e[t+1]=this.y,e}fromBufferAttribute(e,t){return this.x=e.getX(t),this.y=e.getY(t),this}rotateAround(e,t){const n=Math.cos(t),i=Math.sin(t),s=this.x-e.x,a=this.y-e.y;return this.x=s*n-a*i+e.x,this.y=s*i+a*n+e.y,this}random(){return this.x=Math.random(),this.y=Math.random(),this}*[Symbol.iterator](){yield this.x,yield this.y}}class Kt{constructor(){Kt.prototype.isMatrix3=!0,this.elements=[1,0,0,0,1,0,0,0,1]}set(e,t,n,i,s,a,o,l,c){const u=this.elements;return u[0]=e,u[1]=i,u[2]=o,u[3]=t,u[4]=s,u[5]=l,u[6]=n,u[7]=a,u[8]=c,this}identity(){return this.set(1,0,0,0,1,0,0,0,1),this}copy(e){const t=this.elements,n=e.elements;return t[0]=n[0],t[1]=n[1],t[2]=n[2],t[3]=n[3],t[4]=n[4],t[5]=n[5],t[6]=n[6],t[7]=n[7],t[8]=n[8],this}extractBasis(e,t,n){return e.setFromMatrix3Column(this,0),t.setFromMatrix3Column(this,1),n.setFromMatrix3Column(this,2),this}setFromMatrix4(e){const t=e.elements;return this.set(t[0],t[4],t[8],t[1],t[5],t[9],t[2],t[6],t[10]),this}multiply(e){return this.multiplyMatrices(this,e)}premultiply(e){return this.multiplyMatrices(e,this)}multiplyMatrices(e,t){const n=e.elements,i=t.elements,s=this.elements,a=n[0],o=n[3],l=n[6],c=n[1],u=n[4],f=n[7],d=n[2],m=n[5],h=n[8],p=i[0],_=i[3],g=i[6],v=i[1],b=i[4],w=i[7],y=i[2],x=i[5],E=i[8];return s[0]=a*p+o*v+l*y,s[3]=a*_+o*b+l*x,s[6]=a*g+o*w+l*E,s[1]=c*p+u*v+f*y,s[4]=c*_+u*b+f*x,s[7]=c*g+u*w+f*E,s[2]=d*p+m*v+h*y,s[5]=d*_+m*b+h*x,s[8]=d*g+m*w+h*E,this}multiplyScalar(e){const t=this.elements;return t[0]*=e,t[3]*=e,t[6]*=e,t[1]*=e,t[4]*=e,t[7]*=e,t[2]*=e,t[5]*=e,t[8]*=e,this}determinant(){const e=this.elements,t=e[0],n=e[1],i=e[2],s=e[3],a=e[4],o=e[5],l=e[6],c=e[7],u=e[8];return t*a*u-t*o*c-n*s*u+n*o*l+i*s*c-i*a*l}invert(){const e=this.elements,t=e[0],n=e[1],i=e[2],s=e[3],a=e[4],o=e[5],l=e[6],c=e[7],u=e[8],f=u*a-o*c,d=o*l-u*s,m=c*s-a*l,h=t*f+n*d+i*m;if(h===0)return this.set(0,0,0,0,0,0,0,0,0);const p=1/h;return e[0]=f*p,e[1]=(i*c-u*n)*p,e[2]=(o*n-i*a)*p,e[3]=d*p,e[4]=(u*t-i*l)*p,e[5]=(i*s-o*t)*p,e[6]=m*p,e[7]=(n*l-c*t)*p,e[8]=(a*t-n*s)*p,this}transpose(){let e;const t=this.elements;return e=t[1],t[1]=t[3],t[3]=e,e=t[2],t[2]=t[6],t[6]=e,e=t[5],t[5]=t[7],t[7]=e,this}getNormalMatrix(e){return this.setFromMatrix4(e).invert().transpose()}transposeIntoArray(e){const t=this.elements;return e[0]=t[0],e[1]=t[3],e[2]=t[6],e[3]=t[1],e[4]=t[4],e[5]=t[7],e[6]=t[2],e[7]=t[5],e[8]=t[8],this}setUvTransform(e,t,n,i,s,a,o){const l=Math.cos(s),c=Math.sin(s);return this.set(n*l,n*c,-n*(l*a+c*o)+a+e,-i*c,i*l,-i*(-c*a+l*o)+o+t,0,0,1),this}scale(e,t){return this.premultiply(Rs.makeScale(e,t)),this}rotate(e){return this.premultiply(Rs.makeRotation(-e)),this}translate(e,t){return this.premultiply(Rs.makeTranslation(e,t)),this}makeTranslation(e,t){return this.set(1,0,e,0,1,t,0,0,1),this}makeRotation(e){const t=Math.cos(e),n=Math.sin(e);return this.set(t,-n,0,n,t,0,0,0,1),this}makeScale(e,t){return this.set(e,0,0,0,t,0,0,0,1),this}equals(e){const t=this.elements,n=e.elements;for(let i=0;i<9;i++)if(t[i]!==n[i])return!1;return!0}fromArray(e,t=0){for(let n=0;n<9;n++)this.elements[n]=e[n+t];return this}toArray(e=[],t=0){const n=this.elements;return e[t]=n[0],e[t+1]=n[1],e[t+2]=n[2],e[t+3]=n[3],e[t+4]=n[4],e[t+5]=n[5],e[t+6]=n[6],e[t+7]=n[7],e[t+8]=n[8],e}clone(){return new this.constructor().fromArray(this.elements)}}const Rs=new Kt;function Jc(r){for(let e=r.length-1;e>=0;--e)if(r[e]>=65535)return!0;return!1}function ds(r){return document.createElementNS("http://www.w3.org/1999/xhtml",r)}class Zt{constructor(e=0,t=0,n=0,i=1){this.isQuaternion=!0,this._x=e,this._y=t,this._z=n,this._w=i}static slerpFlat(e,t,n,i,s,a,o){let l=n[i+0],c=n[i+1],u=n[i+2],f=n[i+3];const d=s[a+0],m=s[a+1],h=s[a+2],p=s[a+3];if(o===0){e[t+0]=l,e[t+1]=c,e[t+2]=u,e[t+3]=f;return}if(o===1){e[t+0]=d,e[t+1]=m,e[t+2]=h,e[t+3]=p;return}if(f!==p||l!==d||c!==m||u!==h){let _=1-o;const g=l*d+c*m+u*h+f*p,v=g>=0?1:-1,b=1-g*g;if(b>Number.EPSILON){const y=Math.sqrt(b),x=Math.atan2(y,g*v);_=Math.sin(_*x)/y,o=Math.sin(o*x)/y}const w=o*v;if(l=l*_+d*w,c=c*_+m*w,u=u*_+h*w,f=f*_+p*w,_===1-o){const y=1/Math.sqrt(l*l+c*c+u*u+f*f);l*=y,c*=y,u*=y,f*=y}}e[t]=l,e[t+1]=c,e[t+2]=u,e[t+3]=f}static multiplyQuaternionsFlat(e,t,n,i,s,a){const o=n[i],l=n[i+1],c=n[i+2],u=n[i+3],f=s[a],d=s[a+1],m=s[a+2],h=s[a+3];return e[t]=o*h+u*f+l*m-c*d,e[t+1]=l*h+u*d+c*f-o*m,e[t+2]=c*h+u*m+o*d-l*f,e[t+3]=u*h-o*f-l*d-c*m,e}get x(){return this._x}set x(e){this._x=e,this._onChangeCallback()}get y(){return this._y}set y(e){this._y=e,this._onChangeCallback()}get z(){return this._z}set z(e){this._z=e,this._onChangeCallback()}get w(){return this._w}set w(e){this._w=e,this._onChangeCallback()}set(e,t,n,i){return this._x=e,this._y=t,this._z=n,this._w=i,this._onChangeCallback(),this}clone(){return new this.constructor(this._x,this._y,this._z,this._w)}copy(e){return this._x=e.x,this._y=e.y,this._z=e.z,this._w=e.w,this._onChangeCallback(),this}setFromEuler(e,t){const n=e._x,i=e._y,s=e._z,a=e._order,o=Math.cos,l=Math.sin,c=o(n/2),u=o(i/2),f=o(s/2),d=l(n/2),m=l(i/2),h=l(s/2);switch(a){case"XYZ":this._x=d*u*f+c*m*h,this._y=c*m*f-d*u*h,this._z=c*u*h+d*m*f,this._w=c*u*f-d*m*h;break;case"YXZ":this._x=d*u*f+c*m*h,this._y=c*m*f-d*u*h,this._z=c*u*h-d*m*f,this._w=c*u*f+d*m*h;break;case"ZXY":this._x=d*u*f-c*m*h,this._y=c*m*f+d*u*h,this._z=c*u*h+d*m*f,this._w=c*u*f-d*m*h;break;case"ZYX":this._x=d*u*f-c*m*h,this._y=c*m*f+d*u*h,this._z=c*u*h-d*m*f,this._w=c*u*f+d*m*h;break;case"YZX":this._x=d*u*f+c*m*h,this._y=c*m*f+d*u*h,this._z=c*u*h-d*m*f,this._w=c*u*f-d*m*h;break;case"XZY":this._x=d*u*f-c*m*h,this._y=c*m*f-d*u*h,this._z=c*u*h+d*m*f,this._w=c*u*f+d*m*h;break;default:console.warn("THREE.Quaternion: .setFromEuler() encountered an unknown order: "+a)}return t!==!1&&this._onChangeCallback(),this}setFromAxisAngle(e,t){const n=t/2,i=Math.sin(n);return this._x=e.x*i,this._y=e.y*i,this._z=e.z*i,this._w=Math.cos(n),this._onChangeCallback(),this}setFromRotationMatrix(e){const t=e.elements,n=t[0],i=t[4],s=t[8],a=t[1],o=t[5],l=t[9],c=t[2],u=t[6],f=t[10],d=n+o+f;if(d>0){const m=.5/Math.sqrt(d+1);this._w=.25/m,this._x=(u-l)*m,this._y=(s-c)*m,this._z=(a-i)*m}else if(n>o&&n>f){const m=2*Math.sqrt(1+n-o-f);this._w=(u-l)/m,this._x=.25*m,this._y=(i+a)/m,this._z=(s+c)/m}else if(o>f){const m=2*Math.sqrt(1+o-n-f);this._w=(s-c)/m,this._x=(i+a)/m,this._y=.25*m,this._z=(l+u)/m}else{const m=2*Math.sqrt(1+f-n-o);this._w=(a-i)/m,this._x=(s+c)/m,this._y=(l+u)/m,this._z=.25*m}return this._onChangeCallback(),this}setFromUnitVectors(e,t){let n=e.dot(t)+1;return n<Number.EPSILON?(n=0,Math.abs(e.x)>Math.abs(e.z)?(this._x=-e.y,this._y=e.x,this._z=0,this._w=n):(this._x=0,this._y=-e.z,this._z=e.y,this._w=n)):(this._x=e.y*t.z-e.z*t.y,this._y=e.z*t.x-e.x*t.z,this._z=e.x*t.y-e.y*t.x,this._w=n),this.normalize()}angleTo(e){return 2*Math.acos(Math.abs($t(this.dot(e),-1,1)))}rotateTowards(e,t){const n=this.angleTo(e);if(n===0)return this;const i=Math.min(1,t/n);return this.slerp(e,i),this}identity(){return this.set(0,0,0,1)}invert(){return this.conjugate()}conjugate(){return this._x*=-1,this._y*=-1,this._z*=-1,this._onChangeCallback(),this}dot(e){return this._x*e._x+this._y*e._y+this._z*e._z+this._w*e._w}lengthSq(){return this._x*this._x+this._y*this._y+this._z*this._z+this._w*this._w}length(){return Math.sqrt(this._x*this._x+this._y*this._y+this._z*this._z+this._w*this._w)}normalize(){let e=this.length();return e===0?(this._x=0,this._y=0,this._z=0,this._w=1):(e=1/e,this._x=this._x*e,this._y=this._y*e,this._z=this._z*e,this._w=this._w*e),this._onChangeCallback(),this}multiply(e){return this.multiplyQuaternions(this,e)}premultiply(e){return this.multiplyQuaternions(e,this)}multiplyQuaternions(e,t){const n=e._x,i=e._y,s=e._z,a=e._w,o=t._x,l=t._y,c=t._z,u=t._w;return this._x=n*u+a*o+i*c-s*l,this._y=i*u+a*l+s*o-n*c,this._z=s*u+a*c+n*l-i*o,this._w=a*u-n*o-i*l-s*c,this._onChangeCallback(),this}slerp(e,t){if(t===0)return this;if(t===1)return this.copy(e);const n=this._x,i=this._y,s=this._z,a=this._w;let o=a*e._w+n*e._x+i*e._y+s*e._z;if(o<0?(this._w=-e._w,this._x=-e._x,this._y=-e._y,this._z=-e._z,o=-o):this.copy(e),o>=1)return this._w=a,this._x=n,this._y=i,this._z=s,this;const l=1-o*o;if(l<=Number.EPSILON){const m=1-t;return this._w=m*a+t*this._w,this._x=m*n+t*this._x,this._y=m*i+t*this._y,this._z=m*s+t*this._z,this.normalize(),this._onChangeCallback(),this}const c=Math.sqrt(l),u=Math.atan2(c,o),f=Math.sin((1-t)*u)/c,d=Math.sin(t*u)/c;return this._w=a*f+this._w*d,this._x=n*f+this._x*d,this._y=i*f+this._y*d,this._z=s*f+this._z*d,this._onChangeCallback(),this}slerpQuaternions(e,t,n){return this.copy(e).slerp(t,n)}random(){const e=Math.random(),t=Math.sqrt(1-e),n=Math.sqrt(e),i=2*Math.PI*Math.random(),s=2*Math.PI*Math.random();return this.set(t*Math.cos(i),n*Math.sin(s),n*Math.cos(s),t*Math.sin(i))}equals(e){return e._x===this._x&&e._y===this._y&&e._z===this._z&&e._w===this._w}fromArray(e,t=0){return this._x=e[t],this._y=e[t+1],this._z=e[t+2],this._w=e[t+3],this._onChangeCallback(),this}toArray(e=[],t=0){return e[t]=this._x,e[t+1]=this._y,e[t+2]=this._z,e[t+3]=this._w,e}fromBufferAttribute(e,t){return this._x=e.getX(t),this._y=e.getY(t),this._z=e.getZ(t),this._w=e.getW(t),this}_onChange(e){return this._onChangeCallback=e,this}_onChangeCallback(){}*[Symbol.iterator](){yield this._x,yield this._y,yield this._z,yield this._w}}class G{constructor(e=0,t=0,n=0){G.prototype.isVector3=!0,this.x=e,this.y=t,this.z=n}set(e,t,n){return n===void 0&&(n=this.z),this.x=e,this.y=t,this.z=n,this}setScalar(e){return this.x=e,this.y=e,this.z=e,this}setX(e){return this.x=e,this}setY(e){return this.y=e,this}setZ(e){return this.z=e,this}setComponent(e,t){switch(e){case 0:this.x=t;break;case 1:this.y=t;break;case 2:this.z=t;break;default:throw new Error("index is out of range: "+e)}return this}getComponent(e){switch(e){case 0:return this.x;case 1:return this.y;case 2:return this.z;default:throw new Error("index is out of range: "+e)}}clone(){return new this.constructor(this.x,this.y,this.z)}copy(e){return this.x=e.x,this.y=e.y,this.z=e.z,this}add(e){return this.x+=e.x,this.y+=e.y,this.z+=e.z,this}addScalar(e){return this.x+=e,this.y+=e,this.z+=e,this}addVectors(e,t){return this.x=e.x+t.x,this.y=e.y+t.y,this.z=e.z+t.z,this}addScaledVector(e,t){return this.x+=e.x*t,this.y+=e.y*t,this.z+=e.z*t,this}sub(e){return this.x-=e.x,this.y-=e.y,this.z-=e.z,this}subScalar(e){return this.x-=e,this.y-=e,this.z-=e,this}subVectors(e,t){return this.x=e.x-t.x,this.y=e.y-t.y,this.z=e.z-t.z,this}multiply(e){return this.x*=e.x,this.y*=e.y,this.z*=e.z,this}multiplyScalar(e){return this.x*=e,this.y*=e,this.z*=e,this}multiplyVectors(e,t){return this.x=e.x*t.x,this.y=e.y*t.y,this.z=e.z*t.z,this}applyEuler(e){return this.applyQuaternion(Fl.setFromEuler(e))}applyAxisAngle(e,t){return this.applyQuaternion(Fl.setFromAxisAngle(e,t))}applyMatrix3(e){const t=this.x,n=this.y,i=this.z,s=e.elements;return this.x=s[0]*t+s[3]*n+s[6]*i,this.y=s[1]*t+s[4]*n+s[7]*i,this.z=s[2]*t+s[5]*n+s[8]*i,this}applyNormalMatrix(e){return this.applyMatrix3(e).normalize()}applyMatrix4(e){const t=this.x,n=this.y,i=this.z,s=e.elements,a=1/(s[3]*t+s[7]*n+s[11]*i+s[15]);return this.x=(s[0]*t+s[4]*n+s[8]*i+s[12])*a,this.y=(s[1]*t+s[5]*n+s[9]*i+s[13])*a,this.z=(s[2]*t+s[6]*n+s[10]*i+s[14])*a,this}applyQuaternion(e){const t=this.x,n=this.y,i=this.z,s=e.x,a=e.y,o=e.z,l=e.w,c=l*t+a*i-o*n,u=l*n+o*t-s*i,f=l*i+s*n-a*t,d=-s*t-a*n-o*i;return this.x=c*l+d*-s+u*-o-f*-a,this.y=u*l+d*-a+f*-s-c*-o,this.z=f*l+d*-o+c*-a-u*-s,this}project(e){return this.applyMatrix4(e.matrixWorldInverse).applyMatrix4(e.projectionMatrix)}unproject(e){return this.applyMatrix4(e.projectionMatrixInverse).applyMatrix4(e.matrixWorld)}transformDirection(e){const t=this.x,n=this.y,i=this.z,s=e.elements;return this.x=s[0]*t+s[4]*n+s[8]*i,this.y=s[1]*t+s[5]*n+s[9]*i,this.z=s[2]*t+s[6]*n+s[10]*i,this.normalize()}divide(e){return this.x/=e.x,this.y/=e.y,this.z/=e.z,this}divideScalar(e){return this.multiplyScalar(1/e)}min(e){return this.x=Math.min(this.x,e.x),this.y=Math.min(this.y,e.y),this.z=Math.min(this.z,e.z),this}max(e){return this.x=Math.max(this.x,e.x),this.y=Math.max(this.y,e.y),this.z=Math.max(this.z,e.z),this}clamp(e,t){return this.x=Math.max(e.x,Math.min(t.x,this.x)),this.y=Math.max(e.y,Math.min(t.y,this.y)),this.z=Math.max(e.z,Math.min(t.z,this.z)),this}clampScalar(e,t){return this.x=Math.max(e,Math.min(t,this.x)),this.y=Math.max(e,Math.min(t,this.y)),this.z=Math.max(e,Math.min(t,this.z)),this}clampLength(e,t){const n=this.length();return this.divideScalar(n||1).multiplyScalar(Math.max(e,Math.min(t,n)))}floor(){return this.x=Math.floor(this.x),this.y=Math.floor(this.y),this.z=Math.floor(this.z),this}ceil(){return this.x=Math.ceil(this.x),this.y=Math.ceil(this.y),this.z=Math.ceil(this.z),this}round(){return this.x=Math.round(this.x),this.y=Math.round(this.y),this.z=Math.round(this.z),this}roundToZero(){return this.x=this.x<0?Math.ceil(this.x):Math.floor(this.x),this.y=this.y<0?Math.ceil(this.y):Math.floor(this.y),this.z=this.z<0?Math.ceil(this.z):Math.floor(this.z),this}negate(){return this.x=-this.x,this.y=-this.y,this.z=-this.z,this}dot(e){return this.x*e.x+this.y*e.y+this.z*e.z}lengthSq(){return this.x*this.x+this.y*this.y+this.z*this.z}length(){return Math.sqrt(this.x*this.x+this.y*this.y+this.z*this.z)}manhattanLength(){return Math.abs(this.x)+Math.abs(this.y)+Math.abs(this.z)}normalize(){return this.divideScalar(this.length()||1)}setLength(e){return this.normalize().multiplyScalar(e)}lerp(e,t){return this.x+=(e.x-this.x)*t,this.y+=(e.y-this.y)*t,this.z+=(e.z-this.z)*t,this}lerpVectors(e,t,n){return this.x=e.x+(t.x-e.x)*n,this.y=e.y+(t.y-e.y)*n,this.z=e.z+(t.z-e.z)*n,this}cross(e){return this.crossVectors(this,e)}crossVectors(e,t){const n=e.x,i=e.y,s=e.z,a=t.x,o=t.y,l=t.z;return this.x=i*l-s*o,this.y=s*a-n*l,this.z=n*o-i*a,this}projectOnVector(e){const t=e.lengthSq();if(t===0)return this.set(0,0,0);const n=e.dot(this)/t;return this.copy(e).multiplyScalar(n)}projectOnPlane(e){return Is.copy(this).projectOnVector(e),this.sub(Is)}reflect(e){return this.sub(Is.copy(e).multiplyScalar(2*this.dot(e)))}angleTo(e){const t=Math.sqrt(this.lengthSq()*e.lengthSq());if(t===0)return Math.PI/2;const n=this.dot(e)/t;return Math.acos($t(n,-1,1))}distanceTo(e){return Math.sqrt(this.distanceToSquared(e))}distanceToSquared(e){const t=this.x-e.x,n=this.y-e.y,i=this.z-e.z;return t*t+n*n+i*i}manhattanDistanceTo(e){return Math.abs(this.x-e.x)+Math.abs(this.y-e.y)+Math.abs(this.z-e.z)}setFromSpherical(e){return this.setFromSphericalCoords(e.radius,e.phi,e.theta)}setFromSphericalCoords(e,t,n){const i=Math.sin(t)*e;return this.x=i*Math.sin(n),this.y=Math.cos(t)*e,this.z=i*Math.cos(n),this}setFromCylindrical(e){return this.setFromCylindricalCoords(e.radius,e.theta,e.y)}setFromCylindricalCoords(e,t,n){return this.x=e*Math.sin(t),this.y=n,this.z=e*Math.cos(t),this}setFromMatrixPosition(e){const t=e.elements;return this.x=t[12],this.y=t[13],this.z=t[14],this}setFromMatrixScale(e){const t=this.setFromMatrixColumn(e,0).length(),n=this.setFromMatrixColumn(e,1).length(),i=this.setFromMatrixColumn(e,2).length();return this.x=t,this.y=n,this.z=i,this}setFromMatrixColumn(e,t){return this.fromArray(e.elements,t*4)}setFromMatrix3Column(e,t){return this.fromArray(e.elements,t*3)}setFromEuler(e){return this.x=e._x,this.y=e._y,this.z=e._z,this}equals(e){return e.x===this.x&&e.y===this.y&&e.z===this.z}fromArray(e,t=0){return this.x=e[t],this.y=e[t+1],this.z=e[t+2],this}toArray(e=[],t=0){return e[t]=this.x,e[t+1]=this.y,e[t+2]=this.z,e}fromBufferAttribute(e,t){return this.x=e.getX(t),this.y=e.getY(t),this.z=e.getZ(t),this}random(){return this.x=Math.random(),this.y=Math.random(),this.z=Math.random(),this}randomDirection(){const e=(Math.random()-.5)*2,t=Math.random()*Math.PI*2,n=Math.sqrt(1-e**2);return this.x=n*Math.cos(t),this.y=n*Math.sin(t),this.z=e,this}*[Symbol.iterator](){yield this.x,yield this.y,yield this.z}}const Is=new G,Fl=new Zt;function Oi(r){return r<.04045?r*.0773993808:Math.pow(r*.9478672986+.0521327014,2.4)}function Ns(r){return r<.0031308?r*12.92:1.055*Math.pow(r,.41666)-.055}const w_=new Kt().fromArray([.8224621,.0331941,.0170827,.177538,.9668058,.0723974,-1e-7,1e-7,.9105199]),M_=new Kt().fromArray([1.2249401,-.0420569,-.0196376,-.2249404,1.0420571,-.0786361,1e-7,0,1.0982735]),qn=new G;function x_(r){return r.convertSRGBToLinear(),qn.set(r.r,r.g,r.b).applyMatrix3(M_),r.setRGB(qn.x,qn.y,qn.z)}function S_(r){return qn.set(r.r,r.g,r.b).applyMatrix3(w_),r.setRGB(qn.x,qn.y,qn.z).convertLinearToSRGB()}const C_={[yr]:r=>r,[xn]:r=>r.convertSRGBToLinear(),[Zc]:x_},T_={[yr]:r=>r,[xn]:r=>r.convertLinearToSRGB(),[Zc]:S_},jt={enabled:!1,get legacyMode(){return console.warn("THREE.ColorManagement: .legacyMode=false renamed to .enabled=true in r150."),!this.enabled},set legacyMode(r){console.warn("THREE.ColorManagement: .legacyMode=false renamed to .enabled=true in r150."),this.enabled=!r},get workingColorSpace(){return yr},set workingColorSpace(r){console.warn("THREE.ColorManagement: .workingColorSpace is readonly.")},convert:function(r,e,t){if(this.enabled===!1||e===t||!e||!t)return r;const n=C_[e],i=T_[t];if(n===void 0||i===void 0)throw new Error(`Unsupported color space conversion, "${e}" to "${t}".`);return i(n(r))},fromWorkingColorSpace:function(r,e){return this.convert(r,this.workingColorSpace,e)},toWorkingColorSpace:function(r,e){return this.convert(r,e,this.workingColorSpace)}};let bi;class Qc{static getDataURL(e){if(/^data:/i.test(e.src)||typeof HTMLCanvasElement>"u")return e.src;let t;if(e instanceof HTMLCanvasElement)t=e;else{bi===void 0&&(bi=ds("canvas")),bi.width=e.width,bi.height=e.height;const n=bi.getContext("2d");e instanceof ImageData?n.putImageData(e,0,0):n.drawImage(e,0,0,e.width,e.height),t=bi}return t.width>2048||t.height>2048?(console.warn("THREE.ImageUtils.getDataURL: Image converted to jpg for performance reasons",e),t.toDataURL("image/jpeg",.6)):t.toDataURL("image/png")}static sRGBToLinear(e){if(typeof HTMLImageElement<"u"&&e instanceof HTMLImageElement||typeof HTMLCanvasElement<"u"&&e instanceof HTMLCanvasElement||typeof ImageBitmap<"u"&&e instanceof ImageBitmap){const t=ds("canvas");t.width=e.width,t.height=e.height;const n=t.getContext("2d");n.drawImage(e,0,0,e.width,e.height);const i=n.getImageData(0,0,e.width,e.height),s=i.data;for(let a=0;a<s.length;a++)s[a]=Oi(s[a]/255)*255;return n.putImageData(i,0,0),t}else if(e.data){const t=e.data.slice(0);for(let n=0;n<t.length;n++)t instanceof Uint8Array||t instanceof Uint8ClampedArray?t[n]=Math.floor(Oi(t[n]/255)*255):t[n]=Oi(t[n]);return{data:t,width:e.width,height:e.height}}else return console.warn("THREE.ImageUtils.sRGBToLinear(): Unsupported image type. No color space conversion applied."),e}}class $c{constructor(e=null){this.isSource=!0,this.uuid=ji(),this.data=e,this.version=0}set needsUpdate(e){e===!0&&this.version++}toJSON(e){const t=e===void 0||typeof e=="string";if(!t&&e.images[this.uuid]!==void 0)return e.images[this.uuid];const n={uuid:this.uuid,url:""},i=this.data;if(i!==null){let s;if(Array.isArray(i)){s=[];for(let a=0,o=i.length;a<o;a++)i[a].isDataTexture?s.push(zs(i[a].image)):s.push(zs(i[a]))}else s=zs(i);n.url=s}return t||(e.images[this.uuid]=n),n}}function zs(r){return typeof HTMLImageElement<"u"&&r instanceof HTMLImageElement||typeof HTMLCanvasElement<"u"&&r instanceof HTMLCanvasElement||typeof ImageBitmap<"u"&&r instanceof ImageBitmap?Qc.getDataURL(r):r.data?{data:Array.from(r.data),width:r.width,height:r.height,type:r.data.constructor.name}:(console.warn("THREE.Texture: Unable to serialize Texture."),{})}let E_=0;class on extends Xi{constructor(e=on.DEFAULT_IMAGE,t=on.DEFAULT_MAPPING,n=_n,i=_n,s=fn,a=br,o=gn,l=di,c=on.DEFAULT_ANISOTROPY,u=hi){super(),this.isTexture=!0,Object.defineProperty(this,"id",{value:E_++}),this.uuid=ji(),this.name="",this.source=new $c(e),this.mipmaps=[],this.mapping=t,this.wrapS=n,this.wrapT=i,this.magFilter=s,this.minFilter=a,this.anisotropy=c,this.format=o,this.internalFormat=null,this.type=l,this.offset=new ot(0,0),this.repeat=new ot(1,1),this.center=new ot(0,0),this.rotation=0,this.matrixAutoUpdate=!0,this.matrix=new Kt,this.generateMipmaps=!0,this.premultiplyAlpha=!1,this.flipY=!0,this.unpackAlignment=4,this.encoding=u,this.userData={},this.version=0,this.onUpdate=null,this.isRenderTargetTexture=!1,this.needsPMREMUpdate=!1}get image(){return this.source.data}set image(e=null){this.source.data=e}updateMatrix(){this.matrix.setUvTransform(this.offset.x,this.offset.y,this.repeat.x,this.repeat.y,this.rotation,this.center.x,this.center.y)}clone(){return new this.constructor().copy(this)}copy(e){return this.name=e.name,this.source=e.source,this.mipmaps=e.mipmaps.slice(0),this.mapping=e.mapping,this.wrapS=e.wrapS,this.wrapT=e.wrapT,this.magFilter=e.magFilter,this.minFilter=e.minFilter,this.anisotropy=e.anisotropy,this.format=e.format,this.internalFormat=e.internalFormat,this.type=e.type,this.offset.copy(e.offset),this.repeat.copy(e.repeat),this.center.copy(e.center),this.rotation=e.rotation,this.matrixAutoUpdate=e.matrixAutoUpdate,this.matrix.copy(e.matrix),this.generateMipmaps=e.generateMipmaps,this.premultiplyAlpha=e.premultiplyAlpha,this.flipY=e.flipY,this.unpackAlignment=e.unpackAlignment,this.encoding=e.encoding,this.userData=JSON.parse(JSON.stringify(e.userData)),this.needsUpdate=!0,this}toJSON(e){const t=e===void 0||typeof e=="string";if(!t&&e.textures[this.uuid]!==void 0)return e.textures[this.uuid];const n={metadata:{version:4.5,type:"Texture",generator:"Texture.toJSON"},uuid:this.uuid,name:this.name,image:this.source.toJSON(e).uuid,mapping:this.mapping,repeat:[this.repeat.x,this.repeat.y],offset:[this.offset.x,this.offset.y],center:[this.center.x,this.center.y],rotation:this.rotation,wrap:[this.wrapS,this.wrapT],format:this.format,internalFormat:this.internalFormat,type:this.type,encoding:this.encoding,minFilter:this.minFilter,magFilter:this.magFilter,anisotropy:this.anisotropy,flipY:this.flipY,generateMipmaps:this.generateMipmaps,premultiplyAlpha:this.premultiplyAlpha,unpackAlignment:this.unpackAlignment};return Object.keys(this.userData).length>0&&(n.userData=this.userData),t||(e.textures[this.uuid]=n),n}dispose(){this.dispatchEvent({type:"dispose"})}transformUv(e){if(this.mapping!==qc)return e;if(e.applyMatrix3(this.matrix),e.x<0||e.x>1)switch(this.wrapS){case fa:e.x=e.x-Math.floor(e.x);break;case _n:e.x=e.x<0?0:1;break;case da:Math.abs(Math.floor(e.x)%2)===1?e.x=Math.ceil(e.x)-e.x:e.x=e.x-Math.floor(e.x);break}if(e.y<0||e.y>1)switch(this.wrapT){case fa:e.y=e.y-Math.floor(e.y);break;case _n:e.y=e.y<0?0:1;break;case da:Math.abs(Math.floor(e.y)%2)===1?e.y=Math.ceil(e.y)-e.y:e.y=e.y-Math.floor(e.y);break}return this.flipY&&(e.y=1-e.y),e}set needsUpdate(e){e===!0&&(this.version++,this.source.needsUpdate=!0)}}on.DEFAULT_IMAGE=null;on.DEFAULT_MAPPING=qc;on.DEFAULT_ANISOTROPY=1;class Ot{constructor(e=0,t=0,n=0,i=1){Ot.prototype.isVector4=!0,this.x=e,this.y=t,this.z=n,this.w=i}get width(){return this.z}set width(e){this.z=e}get height(){return this.w}set height(e){this.w=e}set(e,t,n,i){return this.x=e,this.y=t,this.z=n,this.w=i,this}setScalar(e){return this.x=e,this.y=e,this.z=e,this.w=e,this}setX(e){return this.x=e,this}setY(e){return this.y=e,this}setZ(e){return this.z=e,this}setW(e){return this.w=e,this}setComponent(e,t){switch(e){case 0:this.x=t;break;case 1:this.y=t;break;case 2:this.z=t;break;case 3:this.w=t;break;default:throw new Error("index is out of range: "+e)}return this}getComponent(e){switch(e){case 0:return this.x;case 1:return this.y;case 2:return this.z;case 3:return this.w;default:throw new Error("index is out of range: "+e)}}clone(){return new this.constructor(this.x,this.y,this.z,this.w)}copy(e){return this.x=e.x,this.y=e.y,this.z=e.z,this.w=e.w!==void 0?e.w:1,this}add(e){return this.x+=e.x,this.y+=e.y,this.z+=e.z,this.w+=e.w,this}addScalar(e){return this.x+=e,this.y+=e,this.z+=e,this.w+=e,this}addVectors(e,t){return this.x=e.x+t.x,this.y=e.y+t.y,this.z=e.z+t.z,this.w=e.w+t.w,this}addScaledVector(e,t){return this.x+=e.x*t,this.y+=e.y*t,this.z+=e.z*t,this.w+=e.w*t,this}sub(e){return this.x-=e.x,this.y-=e.y,this.z-=e.z,this.w-=e.w,this}subScalar(e){return this.x-=e,this.y-=e,this.z-=e,this.w-=e,this}subVectors(e,t){return this.x=e.x-t.x,this.y=e.y-t.y,this.z=e.z-t.z,this.w=e.w-t.w,this}multiply(e){return this.x*=e.x,this.y*=e.y,this.z*=e.z,this.w*=e.w,this}multiplyScalar(e){return this.x*=e,this.y*=e,this.z*=e,this.w*=e,this}applyMatrix4(e){const t=this.x,n=this.y,i=this.z,s=this.w,a=e.elements;return this.x=a[0]*t+a[4]*n+a[8]*i+a[12]*s,this.y=a[1]*t+a[5]*n+a[9]*i+a[13]*s,this.z=a[2]*t+a[6]*n+a[10]*i+a[14]*s,this.w=a[3]*t+a[7]*n+a[11]*i+a[15]*s,this}divideScalar(e){return this.multiplyScalar(1/e)}setAxisAngleFromQuaternion(e){this.w=2*Math.acos(e.w);const t=Math.sqrt(1-e.w*e.w);return t<1e-4?(this.x=1,this.y=0,this.z=0):(this.x=e.x/t,this.y=e.y/t,this.z=e.z/t),this}setAxisAngleFromRotationMatrix(e){let t,n,i,s;const l=e.elements,c=l[0],u=l[4],f=l[8],d=l[1],m=l[5],h=l[9],p=l[2],_=l[6],g=l[10];if(Math.abs(u-d)<.01&&Math.abs(f-p)<.01&&Math.abs(h-_)<.01){if(Math.abs(u+d)<.1&&Math.abs(f+p)<.1&&Math.abs(h+_)<.1&&Math.abs(c+m+g-3)<.1)return this.set(1,0,0,0),this;t=Math.PI;const b=(c+1)/2,w=(m+1)/2,y=(g+1)/2,x=(u+d)/4,E=(f+p)/4,M=(h+_)/4;return b>w&&b>y?b<.01?(n=0,i=.707106781,s=.707106781):(n=Math.sqrt(b),i=x/n,s=E/n):w>y?w<.01?(n=.707106781,i=0,s=.707106781):(i=Math.sqrt(w),n=x/i,s=M/i):y<.01?(n=.707106781,i=.707106781,s=0):(s=Math.sqrt(y),n=E/s,i=M/s),this.set(n,i,s,t),this}let v=Math.sqrt((_-h)*(_-h)+(f-p)*(f-p)+(d-u)*(d-u));return Math.abs(v)<.001&&(v=1),this.x=(_-h)/v,this.y=(f-p)/v,this.z=(d-u)/v,this.w=Math.acos((c+m+g-1)/2),this}min(e){return this.x=Math.min(this.x,e.x),this.y=Math.min(this.y,e.y),this.z=Math.min(this.z,e.z),this.w=Math.min(this.w,e.w),this}max(e){return this.x=Math.max(this.x,e.x),this.y=Math.max(this.y,e.y),this.z=Math.max(this.z,e.z),this.w=Math.max(this.w,e.w),this}clamp(e,t){return this.x=Math.max(e.x,Math.min(t.x,this.x)),this.y=Math.max(e.y,Math.min(t.y,this.y)),this.z=Math.max(e.z,Math.min(t.z,this.z)),this.w=Math.max(e.w,Math.min(t.w,this.w)),this}clampScalar(e,t){return this.x=Math.max(e,Math.min(t,this.x)),this.y=Math.max(e,Math.min(t,this.y)),this.z=Math.max(e,Math.min(t,this.z)),this.w=Math.max(e,Math.min(t,this.w)),this}clampLength(e,t){const n=this.length();return this.divideScalar(n||1).multiplyScalar(Math.max(e,Math.min(t,n)))}floor(){return this.x=Math.floor(this.x),this.y=Math.floor(this.y),this.z=Math.floor(this.z),this.w=Math.floor(this.w),this}ceil(){return this.x=Math.ceil(this.x),this.y=Math.ceil(this.y),this.z=Math.ceil(this.z),this.w=Math.ceil(this.w),this}round(){return this.x=Math.round(this.x),this.y=Math.round(this.y),this.z=Math.round(this.z),this.w=Math.round(this.w),this}roundToZero(){return this.x=this.x<0?Math.ceil(this.x):Math.floor(this.x),this.y=this.y<0?Math.ceil(this.y):Math.floor(this.y),this.z=this.z<0?Math.ceil(this.z):Math.floor(this.z),this.w=this.w<0?Math.ceil(this.w):Math.floor(this.w),this}negate(){return this.x=-this.x,this.y=-this.y,this.z=-this.z,this.w=-this.w,this}dot(e){return this.x*e.x+this.y*e.y+this.z*e.z+this.w*e.w}lengthSq(){return this.x*this.x+this.y*this.y+this.z*this.z+this.w*this.w}length(){return Math.sqrt(this.x*this.x+this.y*this.y+this.z*this.z+this.w*this.w)}manhattanLength(){return Math.abs(this.x)+Math.abs(this.y)+Math.abs(this.z)+Math.abs(this.w)}normalize(){return this.divideScalar(this.length()||1)}setLength(e){return this.normalize().multiplyScalar(e)}lerp(e,t){return this.x+=(e.x-this.x)*t,this.y+=(e.y-this.y)*t,this.z+=(e.z-this.z)*t,this.w+=(e.w-this.w)*t,this}lerpVectors(e,t,n){return this.x=e.x+(t.x-e.x)*n,this.y=e.y+(t.y-e.y)*n,this.z=e.z+(t.z-e.z)*n,this.w=e.w+(t.w-e.w)*n,this}equals(e){return e.x===this.x&&e.y===this.y&&e.z===this.z&&e.w===this.w}fromArray(e,t=0){return this.x=e[t],this.y=e[t+1],this.z=e[t+2],this.w=e[t+3],this}toArray(e=[],t=0){return e[t]=this.x,e[t+1]=this.y,e[t+2]=this.z,e[t+3]=this.w,e}fromBufferAttribute(e,t){return this.x=e.getX(t),this.y=e.getY(t),this.z=e.getZ(t),this.w=e.getW(t),this}random(){return this.x=Math.random(),this.y=Math.random(),this.z=Math.random(),this.w=Math.random(),this}*[Symbol.iterator](){yield this.x,yield this.y,yield this.z,yield this.w}}class pi extends Xi{constructor(e=1,t=1,n={}){super(),this.isWebGLRenderTarget=!0,this.width=e,this.height=t,this.depth=1,this.scissor=new Ot(0,0,e,t),this.scissorTest=!1,this.viewport=new Ot(0,0,e,t);const i={width:e,height:t,depth:1};this.texture=new on(i,n.mapping,n.wrapS,n.wrapT,n.magFilter,n.minFilter,n.format,n.type,n.anisotropy,n.encoding),this.texture.isRenderTargetTexture=!0,this.texture.flipY=!1,this.texture.generateMipmaps=n.generateMipmaps!==void 0?n.generateMipmaps:!1,this.texture.internalFormat=n.internalFormat!==void 0?n.internalFormat:null,this.texture.minFilter=n.minFilter!==void 0?n.minFilter:fn,this.depthBuffer=n.depthBuffer!==void 0?n.depthBuffer:!0,this.stencilBuffer=n.stencilBuffer!==void 0?n.stencilBuffer:!1,this.depthTexture=n.depthTexture!==void 0?n.depthTexture:null,this.samples=n.samples!==void 0?n.samples:0}setSize(e,t,n=1){(this.width!==e||this.height!==t||this.depth!==n)&&(this.width=e,this.height=t,this.depth=n,this.texture.image.width=e,this.texture.image.height=t,this.texture.image.depth=n,this.dispose()),this.viewport.set(0,0,e,t),this.scissor.set(0,0,e,t)}clone(){return new this.constructor().copy(this)}copy(e){this.width=e.width,this.height=e.height,this.depth=e.depth,this.viewport.copy(e.viewport),this.texture=e.texture.clone(),this.texture.isRenderTargetTexture=!0;const t=Object.assign({},e.texture.image);return this.texture.source=new $c(t),this.depthBuffer=e.depthBuffer,this.stencilBuffer=e.stencilBuffer,e.depthTexture!==null&&(this.depthTexture=e.depthTexture.clone()),this.samples=e.samples,this}dispose(){this.dispatchEvent({type:"dispose"})}}class eu extends on{constructor(e=null,t=1,n=1,i=1){super(null),this.isDataArrayTexture=!0,this.image={data:e,width:t,height:n,depth:i},this.magFilter=Yt,this.minFilter=Yt,this.wrapR=_n,this.generateMipmaps=!1,this.flipY=!1,this.unpackAlignment=1}}class L_ extends on{constructor(e=null,t=1,n=1,i=1){super(null),this.isData3DTexture=!0,this.image={data:e,width:t,height:n,depth:i},this.magFilter=Yt,this.minFilter=Yt,this.wrapR=_n,this.generateMipmaps=!1,this.flipY=!1,this.unpackAlignment=1}}class Cr{constructor(e=new G(1/0,1/0,1/0),t=new G(-1/0,-1/0,-1/0)){this.isBox3=!0,this.min=e,this.max=t}set(e,t){return this.min.copy(e),this.max.copy(t),this}setFromArray(e){let t=1/0,n=1/0,i=1/0,s=-1/0,a=-1/0,o=-1/0;for(let l=0,c=e.length;l<c;l+=3){const u=e[l],f=e[l+1],d=e[l+2];u<t&&(t=u),f<n&&(n=f),d<i&&(i=d),u>s&&(s=u),f>a&&(a=f),d>o&&(o=d)}return this.min.set(t,n,i),this.max.set(s,a,o),this}setFromBufferAttribute(e){let t=1/0,n=1/0,i=1/0,s=-1/0,a=-1/0,o=-1/0;for(let l=0,c=e.count;l<c;l++){const u=e.getX(l),f=e.getY(l),d=e.getZ(l);u<t&&(t=u),f<n&&(n=f),d<i&&(i=d),u>s&&(s=u),f>a&&(a=f),d>o&&(o=d)}return this.min.set(t,n,i),this.max.set(s,a,o),this}setFromPoints(e){this.makeEmpty();for(let t=0,n=e.length;t<n;t++)this.expandByPoint(e[t]);return this}setFromCenterAndSize(e,t){const n=$n.copy(t).multiplyScalar(.5);return this.min.copy(e).sub(n),this.max.copy(e).add(n),this}setFromObject(e,t=!1){return this.makeEmpty(),this.expandByObject(e,t)}clone(){return new this.constructor().copy(this)}copy(e){return this.min.copy(e.min),this.max.copy(e.max),this}makeEmpty(){return this.min.x=this.min.y=this.min.z=1/0,this.max.x=this.max.y=this.max.z=-1/0,this}isEmpty(){return this.max.x<this.min.x||this.max.y<this.min.y||this.max.z<this.min.z}getCenter(e){return this.isEmpty()?e.set(0,0,0):e.addVectors(this.min,this.max).multiplyScalar(.5)}getSize(e){return this.isEmpty()?e.set(0,0,0):e.subVectors(this.max,this.min)}expandByPoint(e){return this.min.min(e),this.max.max(e),this}expandByVector(e){return this.min.sub(e),this.max.add(e),this}expandByScalar(e){return this.min.addScalar(-e),this.max.addScalar(e),this}expandByObject(e,t=!1){e.updateWorldMatrix(!1,!1);const n=e.geometry;if(n!==void 0)if(t&&n.attributes!=null&&n.attributes.position!==void 0){const s=n.attributes.position;for(let a=0,o=s.count;a<o;a++)$n.fromBufferAttribute(s,a).applyMatrix4(e.matrixWorld),this.expandByPoint($n)}else n.boundingBox===null&&n.computeBoundingBox(),Fs.copy(n.boundingBox),Fs.applyMatrix4(e.matrixWorld),this.union(Fs);const i=e.children;for(let s=0,a=i.length;s<a;s++)this.expandByObject(i[s],t);return this}containsPoint(e){return!(e.x<this.min.x||e.x>this.max.x||e.y<this.min.y||e.y>this.max.y||e.z<this.min.z||e.z>this.max.z)}containsBox(e){return this.min.x<=e.min.x&&e.max.x<=this.max.x&&this.min.y<=e.min.y&&e.max.y<=this.max.y&&this.min.z<=e.min.z&&e.max.z<=this.max.z}getParameter(e,t){return t.set((e.x-this.min.x)/(this.max.x-this.min.x),(e.y-this.min.y)/(this.max.y-this.min.y),(e.z-this.min.z)/(this.max.z-this.min.z))}intersectsBox(e){return!(e.max.x<this.min.x||e.min.x>this.max.x||e.max.y<this.min.y||e.min.y>this.max.y||e.max.z<this.min.z||e.min.z>this.max.z)}intersectsSphere(e){return this.clampPoint(e.center,$n),$n.distanceToSquared(e.center)<=e.radius*e.radius}intersectsPlane(e){let t,n;return e.normal.x>0?(t=e.normal.x*this.min.x,n=e.normal.x*this.max.x):(t=e.normal.x*this.max.x,n=e.normal.x*this.min.x),e.normal.y>0?(t+=e.normal.y*this.min.y,n+=e.normal.y*this.max.y):(t+=e.normal.y*this.max.y,n+=e.normal.y*this.min.y),e.normal.z>0?(t+=e.normal.z*this.min.z,n+=e.normal.z*this.max.z):(t+=e.normal.z*this.max.z,n+=e.normal.z*this.min.z),t<=-e.constant&&n>=-e.constant}intersectsTriangle(e){if(this.isEmpty())return!1;this.getCenter(Ki),Ar.subVectors(this.max,Ki),vi.subVectors(e.a,Ki),yi.subVectors(e.b,Ki),wi.subVectors(e.c,Ki),Vn.subVectors(yi,vi),Gn.subVectors(wi,yi),ei.subVectors(vi,wi);let t=[0,-Vn.z,Vn.y,0,-Gn.z,Gn.y,0,-ei.z,ei.y,Vn.z,0,-Vn.x,Gn.z,0,-Gn.x,ei.z,0,-ei.x,-Vn.y,Vn.x,0,-Gn.y,Gn.x,0,-ei.y,ei.x,0];return!Os(t,vi,yi,wi,Ar)||(t=[1,0,0,0,1,0,0,0,1],!Os(t,vi,yi,wi,Ar))?!1:(Dr.crossVectors(Vn,Gn),t=[Dr.x,Dr.y,Dr.z],Os(t,vi,yi,wi,Ar))}clampPoint(e,t){return t.copy(e).clamp(this.min,this.max)}distanceToPoint(e){return this.clampPoint(e,$n).distanceTo(e)}getBoundingSphere(e){return this.isEmpty()?e.makeEmpty():(this.getCenter(e.center),e.radius=this.getSize($n).length()*.5),e}intersect(e){return this.min.max(e.min),this.max.min(e.max),this.isEmpty()&&this.makeEmpty(),this}union(e){return this.min.min(e.min),this.max.max(e.max),this}applyMatrix4(e){return this.isEmpty()?this:(Pn[0].set(this.min.x,this.min.y,this.min.z).applyMatrix4(e),Pn[1].set(this.min.x,this.min.y,this.max.z).applyMatrix4(e),Pn[2].set(this.min.x,this.max.y,this.min.z).applyMatrix4(e),Pn[3].set(this.min.x,this.max.y,this.max.z).applyMatrix4(e),Pn[4].set(this.max.x,this.min.y,this.min.z).applyMatrix4(e),Pn[5].set(this.max.x,this.min.y,this.max.z).applyMatrix4(e),Pn[6].set(this.max.x,this.max.y,this.min.z).applyMatrix4(e),Pn[7].set(this.max.x,this.max.y,this.max.z).applyMatrix4(e),this.setFromPoints(Pn),this)}translate(e){return this.min.add(e),this.max.add(e),this}equals(e){return e.min.equals(this.min)&&e.max.equals(this.max)}}const Pn=[new G,new G,new G,new G,new G,new G,new G,new G],$n=new G,Fs=new Cr,vi=new G,yi=new G,wi=new G,Vn=new G,Gn=new G,ei=new G,Ki=new G,Ar=new G,Dr=new G,ti=new G;function Os(r,e,t,n,i){for(let s=0,a=r.length-3;s<=a;s+=3){ti.fromArray(r,s);const o=i.x*Math.abs(ti.x)+i.y*Math.abs(ti.y)+i.z*Math.abs(ti.z),l=e.dot(ti),c=t.dot(ti),u=n.dot(ti);if(Math.max(-Math.max(l,c,u),Math.min(l,c,u))>o)return!1}return!0}const P_=new Cr,Ji=new G,Us=new G;class _s{constructor(e=new G,t=-1){this.center=e,this.radius=t}set(e,t){return this.center.copy(e),this.radius=t,this}setFromPoints(e,t){const n=this.center;t!==void 0?n.copy(t):P_.setFromPoints(e).getCenter(n);let i=0;for(let s=0,a=e.length;s<a;s++)i=Math.max(i,n.distanceToSquared(e[s]));return this.radius=Math.sqrt(i),this}copy(e){return this.center.copy(e.center),this.radius=e.radius,this}isEmpty(){return this.radius<0}makeEmpty(){return this.center.set(0,0,0),this.radius=-1,this}containsPoint(e){return e.distanceToSquared(this.center)<=this.radius*this.radius}distanceToPoint(e){return e.distanceTo(this.center)-this.radius}intersectsSphere(e){const t=this.radius+e.radius;return e.center.distanceToSquared(this.center)<=t*t}intersectsBox(e){return e.intersectsSphere(this)}intersectsPlane(e){return Math.abs(e.distanceToPoint(this.center))<=this.radius}clampPoint(e,t){const n=this.center.distanceToSquared(e);return t.copy(e),n>this.radius*this.radius&&(t.sub(this.center).normalize(),t.multiplyScalar(this.radius).add(this.center)),t}getBoundingBox(e){return this.isEmpty()?(e.makeEmpty(),e):(e.set(this.center,this.center),e.expandByScalar(this.radius),e)}applyMatrix4(e){return this.center.applyMatrix4(e),this.radius=this.radius*e.getMaxScaleOnAxis(),this}translate(e){return this.center.add(e),this}expandByPoint(e){if(this.isEmpty())return this.center.copy(e),this.radius=0,this;Ji.subVectors(e,this.center);const t=Ji.lengthSq();if(t>this.radius*this.radius){const n=Math.sqrt(t),i=(n-this.radius)*.5;this.center.addScaledVector(Ji,i/n),this.radius+=i}return this}union(e){return e.isEmpty()?this:this.isEmpty()?(this.copy(e),this):(this.center.equals(e.center)===!0?this.radius=Math.max(this.radius,e.radius):(Us.subVectors(e.center,this.center).setLength(e.radius),this.expandByPoint(Ji.copy(e.center).add(Us)),this.expandByPoint(Ji.copy(e.center).sub(Us))),this)}equals(e){return e.center.equals(this.center)&&e.radius===this.radius}clone(){return new this.constructor().copy(this)}}const An=new G,Bs=new G,kr=new G,Hn=new G,Vs=new G,Rr=new G,Gs=new G;class Ma{constructor(e=new G,t=new G(0,0,-1)){this.origin=e,this.direction=t}set(e,t){return this.origin.copy(e),this.direction.copy(t),this}copy(e){return this.origin.copy(e.origin),this.direction.copy(e.direction),this}at(e,t){return t.copy(this.origin).addScaledVector(this.direction,e)}lookAt(e){return this.direction.copy(e).sub(this.origin).normalize(),this}recast(e){return this.origin.copy(this.at(e,An)),this}closestPointToPoint(e,t){t.subVectors(e,this.origin);const n=t.dot(this.direction);return n<0?t.copy(this.origin):t.copy(this.origin).addScaledVector(this.direction,n)}distanceToPoint(e){return Math.sqrt(this.distanceSqToPoint(e))}distanceSqToPoint(e){const t=An.subVectors(e,this.origin).dot(this.direction);return t<0?this.origin.distanceToSquared(e):(An.copy(this.origin).addScaledVector(this.direction,t),An.distanceToSquared(e))}distanceSqToSegment(e,t,n,i){Bs.copy(e).add(t).multiplyScalar(.5),kr.copy(t).sub(e).normalize(),Hn.copy(this.origin).sub(Bs);const s=e.distanceTo(t)*.5,a=-this.direction.dot(kr),o=Hn.dot(this.direction),l=-Hn.dot(kr),c=Hn.lengthSq(),u=Math.abs(1-a*a);let f,d,m,h;if(u>0)if(f=a*l-o,d=a*o-l,h=s*u,f>=0)if(d>=-h)if(d<=h){const p=1/u;f*=p,d*=p,m=f*(f+a*d+2*o)+d*(a*f+d+2*l)+c}else d=s,f=Math.max(0,-(a*d+o)),m=-f*f+d*(d+2*l)+c;else d=-s,f=Math.max(0,-(a*d+o)),m=-f*f+d*(d+2*l)+c;else d<=-h?(f=Math.max(0,-(-a*s+o)),d=f>0?-s:Math.min(Math.max(-s,-l),s),m=-f*f+d*(d+2*l)+c):d<=h?(f=0,d=Math.min(Math.max(-s,-l),s),m=d*(d+2*l)+c):(f=Math.max(0,-(a*s+o)),d=f>0?s:Math.min(Math.max(-s,-l),s),m=-f*f+d*(d+2*l)+c);else d=a>0?-s:s,f=Math.max(0,-(a*d+o)),m=-f*f+d*(d+2*l)+c;return n&&n.copy(this.origin).addScaledVector(this.direction,f),i&&i.copy(Bs).addScaledVector(kr,d),m}intersectSphere(e,t){An.subVectors(e.center,this.origin);const n=An.dot(this.direction),i=An.dot(An)-n*n,s=e.radius*e.radius;if(i>s)return null;const a=Math.sqrt(s-i),o=n-a,l=n+a;return l<0?null:o<0?this.at(l,t):this.at(o,t)}intersectsSphere(e){return this.distanceSqToPoint(e.center)<=e.radius*e.radius}distanceToPlane(e){const t=e.normal.dot(this.direction);if(t===0)return e.distanceToPoint(this.origin)===0?0:null;const n=-(this.origin.dot(e.normal)+e.constant)/t;return n>=0?n:null}intersectPlane(e,t){const n=this.distanceToPlane(e);return n===null?null:this.at(n,t)}intersectsPlane(e){const t=e.distanceToPoint(this.origin);return t===0||e.normal.dot(this.direction)*t<0}intersectBox(e,t){let n,i,s,a,o,l;const c=1/this.direction.x,u=1/this.direction.y,f=1/this.direction.z,d=this.origin;return c>=0?(n=(e.min.x-d.x)*c,i=(e.max.x-d.x)*c):(n=(e.max.x-d.x)*c,i=(e.min.x-d.x)*c),u>=0?(s=(e.min.y-d.y)*u,a=(e.max.y-d.y)*u):(s=(e.max.y-d.y)*u,a=(e.min.y-d.y)*u),n>a||s>i||((s>n||isNaN(n))&&(n=s),(a<i||isNaN(i))&&(i=a),f>=0?(o=(e.min.z-d.z)*f,l=(e.max.z-d.z)*f):(o=(e.max.z-d.z)*f,l=(e.min.z-d.z)*f),n>l||o>i)||((o>n||n!==n)&&(n=o),(l<i||i!==i)&&(i=l),i<0)?null:this.at(n>=0?n:i,t)}intersectsBox(e){return this.intersectBox(e,An)!==null}intersectTriangle(e,t,n,i,s){Vs.subVectors(t,e),Rr.subVectors(n,e),Gs.crossVectors(Vs,Rr);let a=this.direction.dot(Gs),o;if(a>0){if(i)return null;o=1}else if(a<0)o=-1,a=-a;else return null;Hn.subVectors(this.origin,e);const l=o*this.direction.dot(Rr.crossVectors(Hn,Rr));if(l<0)return null;const c=o*this.direction.dot(Vs.cross(Hn));if(c<0||l+c>a)return null;const u=-o*Hn.dot(Gs);return u<0?null:this.at(u/a,s)}applyMatrix4(e){return this.origin.applyMatrix4(e),this.direction.transformDirection(e),this}equals(e){return e.origin.equals(this.origin)&&e.direction.equals(this.direction)}clone(){return new this.constructor().copy(this)}}class Et{constructor(){Et.prototype.isMatrix4=!0,this.elements=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]}set(e,t,n,i,s,a,o,l,c,u,f,d,m,h,p,_){const g=this.elements;return g[0]=e,g[4]=t,g[8]=n,g[12]=i,g[1]=s,g[5]=a,g[9]=o,g[13]=l,g[2]=c,g[6]=u,g[10]=f,g[14]=d,g[3]=m,g[7]=h,g[11]=p,g[15]=_,this}identity(){return this.set(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1),this}clone(){return new Et().fromArray(this.elements)}copy(e){const t=this.elements,n=e.elements;return t[0]=n[0],t[1]=n[1],t[2]=n[2],t[3]=n[3],t[4]=n[4],t[5]=n[5],t[6]=n[6],t[7]=n[7],t[8]=n[8],t[9]=n[9],t[10]=n[10],t[11]=n[11],t[12]=n[12],t[13]=n[13],t[14]=n[14],t[15]=n[15],this}copyPosition(e){const t=this.elements,n=e.elements;return t[12]=n[12],t[13]=n[13],t[14]=n[14],this}setFromMatrix3(e){const t=e.elements;return this.set(t[0],t[3],t[6],0,t[1],t[4],t[7],0,t[2],t[5],t[8],0,0,0,0,1),this}extractBasis(e,t,n){return e.setFromMatrixColumn(this,0),t.setFromMatrixColumn(this,1),n.setFromMatrixColumn(this,2),this}makeBasis(e,t,n){return this.set(e.x,t.x,n.x,0,e.y,t.y,n.y,0,e.z,t.z,n.z,0,0,0,0,1),this}extractRotation(e){const t=this.elements,n=e.elements,i=1/Mi.setFromMatrixColumn(e,0).length(),s=1/Mi.setFromMatrixColumn(e,1).length(),a=1/Mi.setFromMatrixColumn(e,2).length();return t[0]=n[0]*i,t[1]=n[1]*i,t[2]=n[2]*i,t[3]=0,t[4]=n[4]*s,t[5]=n[5]*s,t[6]=n[6]*s,t[7]=0,t[8]=n[8]*a,t[9]=n[9]*a,t[10]=n[10]*a,t[11]=0,t[12]=0,t[13]=0,t[14]=0,t[15]=1,this}makeRotationFromEuler(e){const t=this.elements,n=e.x,i=e.y,s=e.z,a=Math.cos(n),o=Math.sin(n),l=Math.cos(i),c=Math.sin(i),u=Math.cos(s),f=Math.sin(s);if(e.order==="XYZ"){const d=a*u,m=a*f,h=o*u,p=o*f;t[0]=l*u,t[4]=-l*f,t[8]=c,t[1]=m+h*c,t[5]=d-p*c,t[9]=-o*l,t[2]=p-d*c,t[6]=h+m*c,t[10]=a*l}else if(e.order==="YXZ"){const d=l*u,m=l*f,h=c*u,p=c*f;t[0]=d+p*o,t[4]=h*o-m,t[8]=a*c,t[1]=a*f,t[5]=a*u,t[9]=-o,t[2]=m*o-h,t[6]=p+d*o,t[10]=a*l}else if(e.order==="ZXY"){const d=l*u,m=l*f,h=c*u,p=c*f;t[0]=d-p*o,t[4]=-a*f,t[8]=h+m*o,t[1]=m+h*o,t[5]=a*u,t[9]=p-d*o,t[2]=-a*c,t[6]=o,t[10]=a*l}else if(e.order==="ZYX"){const d=a*u,m=a*f,h=o*u,p=o*f;t[0]=l*u,t[4]=h*c-m,t[8]=d*c+p,t[1]=l*f,t[5]=p*c+d,t[9]=m*c-h,t[2]=-c,t[6]=o*l,t[10]=a*l}else if(e.order==="YZX"){const d=a*l,m=a*c,h=o*l,p=o*c;t[0]=l*u,t[4]=p-d*f,t[8]=h*f+m,t[1]=f,t[5]=a*u,t[9]=-o*u,t[2]=-c*u,t[6]=m*f+h,t[10]=d-p*f}else if(e.order==="XZY"){const d=a*l,m=a*c,h=o*l,p=o*c;t[0]=l*u,t[4]=-f,t[8]=c*u,t[1]=d*f+p,t[5]=a*u,t[9]=m*f-h,t[2]=h*f-m,t[6]=o*u,t[10]=p*f+d}return t[3]=0,t[7]=0,t[11]=0,t[12]=0,t[13]=0,t[14]=0,t[15]=1,this}makeRotationFromQuaternion(e){return this.compose(A_,e,D_)}lookAt(e,t,n){const i=this.elements;return rn.subVectors(e,t),rn.lengthSq()===0&&(rn.z=1),rn.normalize(),Wn.crossVectors(n,rn),Wn.lengthSq()===0&&(Math.abs(n.z)===1?rn.x+=1e-4:rn.z+=1e-4,rn.normalize(),Wn.crossVectors(n,rn)),Wn.normalize(),Ir.crossVectors(rn,Wn),i[0]=Wn.x,i[4]=Ir.x,i[8]=rn.x,i[1]=Wn.y,i[5]=Ir.y,i[9]=rn.y,i[2]=Wn.z,i[6]=Ir.z,i[10]=rn.z,this}multiply(e){return this.multiplyMatrices(this,e)}premultiply(e){return this.multiplyMatrices(e,this)}multiplyMatrices(e,t){const n=e.elements,i=t.elements,s=this.elements,a=n[0],o=n[4],l=n[8],c=n[12],u=n[1],f=n[5],d=n[9],m=n[13],h=n[2],p=n[6],_=n[10],g=n[14],v=n[3],b=n[7],w=n[11],y=n[15],x=i[0],E=i[4],M=i[8],S=i[12],P=i[1],k=i[5],H=i[9],V=i[13],F=i[2],j=i[6],ce=i[10],de=i[14],te=i[3],re=i[7],fe=i[11],be=i[15];return s[0]=a*x+o*P+l*F+c*te,s[4]=a*E+o*k+l*j+c*re,s[8]=a*M+o*H+l*ce+c*fe,s[12]=a*S+o*V+l*de+c*be,s[1]=u*x+f*P+d*F+m*te,s[5]=u*E+f*k+d*j+m*re,s[9]=u*M+f*H+d*ce+m*fe,s[13]=u*S+f*V+d*de+m*be,s[2]=h*x+p*P+_*F+g*te,s[6]=h*E+p*k+_*j+g*re,s[10]=h*M+p*H+_*ce+g*fe,s[14]=h*S+p*V+_*de+g*be,s[3]=v*x+b*P+w*F+y*te,s[7]=v*E+b*k+w*j+y*re,s[11]=v*M+b*H+w*ce+y*fe,s[15]=v*S+b*V+w*de+y*be,this}multiplyScalar(e){const t=this.elements;return t[0]*=e,t[4]*=e,t[8]*=e,t[12]*=e,t[1]*=e,t[5]*=e,t[9]*=e,t[13]*=e,t[2]*=e,t[6]*=e,t[10]*=e,t[14]*=e,t[3]*=e,t[7]*=e,t[11]*=e,t[15]*=e,this}determinant(){const e=this.elements,t=e[0],n=e[4],i=e[8],s=e[12],a=e[1],o=e[5],l=e[9],c=e[13],u=e[2],f=e[6],d=e[10],m=e[14],h=e[3],p=e[7],_=e[11],g=e[15];return h*(+s*l*f-i*c*f-s*o*d+n*c*d+i*o*m-n*l*m)+p*(+t*l*m-t*c*d+s*a*d-i*a*m+i*c*u-s*l*u)+_*(+t*c*f-t*o*m-s*a*f+n*a*m+s*o*u-n*c*u)+g*(-i*o*u-t*l*f+t*o*d+i*a*f-n*a*d+n*l*u)}transpose(){const e=this.elements;let t;return t=e[1],e[1]=e[4],e[4]=t,t=e[2],e[2]=e[8],e[8]=t,t=e[6],e[6]=e[9],e[9]=t,t=e[3],e[3]=e[12],e[12]=t,t=e[7],e[7]=e[13],e[13]=t,t=e[11],e[11]=e[14],e[14]=t,this}setPosition(e,t,n){const i=this.elements;return e.isVector3?(i[12]=e.x,i[13]=e.y,i[14]=e.z):(i[12]=e,i[13]=t,i[14]=n),this}invert(){const e=this.elements,t=e[0],n=e[1],i=e[2],s=e[3],a=e[4],o=e[5],l=e[6],c=e[7],u=e[8],f=e[9],d=e[10],m=e[11],h=e[12],p=e[13],_=e[14],g=e[15],v=f*_*c-p*d*c+p*l*m-o*_*m-f*l*g+o*d*g,b=h*d*c-u*_*c-h*l*m+a*_*m+u*l*g-a*d*g,w=u*p*c-h*f*c+h*o*m-a*p*m-u*o*g+a*f*g,y=h*f*l-u*p*l-h*o*d+a*p*d+u*o*_-a*f*_,x=t*v+n*b+i*w+s*y;if(x===0)return this.set(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);const E=1/x;return e[0]=v*E,e[1]=(p*d*s-f*_*s-p*i*m+n*_*m+f*i*g-n*d*g)*E,e[2]=(o*_*s-p*l*s+p*i*c-n*_*c-o*i*g+n*l*g)*E,e[3]=(f*l*s-o*d*s-f*i*c+n*d*c+o*i*m-n*l*m)*E,e[4]=b*E,e[5]=(u*_*s-h*d*s+h*i*m-t*_*m-u*i*g+t*d*g)*E,e[6]=(h*l*s-a*_*s-h*i*c+t*_*c+a*i*g-t*l*g)*E,e[7]=(a*d*s-u*l*s+u*i*c-t*d*c-a*i*m+t*l*m)*E,e[8]=w*E,e[9]=(h*f*s-u*p*s-h*n*m+t*p*m+u*n*g-t*f*g)*E,e[10]=(a*p*s-h*o*s+h*n*c-t*p*c-a*n*g+t*o*g)*E,e[11]=(u*o*s-a*f*s-u*n*c+t*f*c+a*n*m-t*o*m)*E,e[12]=y*E,e[13]=(u*p*i-h*f*i+h*n*d-t*p*d-u*n*_+t*f*_)*E,e[14]=(h*o*i-a*p*i-h*n*l+t*p*l+a*n*_-t*o*_)*E,e[15]=(a*f*i-u*o*i+u*n*l-t*f*l-a*n*d+t*o*d)*E,this}scale(e){const t=this.elements,n=e.x,i=e.y,s=e.z;return t[0]*=n,t[4]*=i,t[8]*=s,t[1]*=n,t[5]*=i,t[9]*=s,t[2]*=n,t[6]*=i,t[10]*=s,t[3]*=n,t[7]*=i,t[11]*=s,this}getMaxScaleOnAxis(){const e=this.elements,t=e[0]*e[0]+e[1]*e[1]+e[2]*e[2],n=e[4]*e[4]+e[5]*e[5]+e[6]*e[6],i=e[8]*e[8]+e[9]*e[9]+e[10]*e[10];return Math.sqrt(Math.max(t,n,i))}makeTranslation(e,t,n){return this.set(1,0,0,e,0,1,0,t,0,0,1,n,0,0,0,1),this}makeRotationX(e){const t=Math.cos(e),n=Math.sin(e);return this.set(1,0,0,0,0,t,-n,0,0,n,t,0,0,0,0,1),this}makeRotationY(e){const t=Math.cos(e),n=Math.sin(e);return this.set(t,0,n,0,0,1,0,0,-n,0,t,0,0,0,0,1),this}makeRotationZ(e){const t=Math.cos(e),n=Math.sin(e);return this.set(t,-n,0,0,n,t,0,0,0,0,1,0,0,0,0,1),this}makeRotationAxis(e,t){const n=Math.cos(t),i=Math.sin(t),s=1-n,a=e.x,o=e.y,l=e.z,c=s*a,u=s*o;return this.set(c*a+n,c*o-i*l,c*l+i*o,0,c*o+i*l,u*o+n,u*l-i*a,0,c*l-i*o,u*l+i*a,s*l*l+n,0,0,0,0,1),this}makeScale(e,t,n){return this.set(e,0,0,0,0,t,0,0,0,0,n,0,0,0,0,1),this}makeShear(e,t,n,i,s,a){return this.set(1,n,s,0,e,1,a,0,t,i,1,0,0,0,0,1),this}compose(e,t,n){const i=this.elements,s=t._x,a=t._y,o=t._z,l=t._w,c=s+s,u=a+a,f=o+o,d=s*c,m=s*u,h=s*f,p=a*u,_=a*f,g=o*f,v=l*c,b=l*u,w=l*f,y=n.x,x=n.y,E=n.z;return i[0]=(1-(p+g))*y,i[1]=(m+w)*y,i[2]=(h-b)*y,i[3]=0,i[4]=(m-w)*x,i[5]=(1-(d+g))*x,i[6]=(_+v)*x,i[7]=0,i[8]=(h+b)*E,i[9]=(_-v)*E,i[10]=(1-(d+p))*E,i[11]=0,i[12]=e.x,i[13]=e.y,i[14]=e.z,i[15]=1,this}decompose(e,t,n){const i=this.elements;let s=Mi.set(i[0],i[1],i[2]).length();const a=Mi.set(i[4],i[5],i[6]).length(),o=Mi.set(i[8],i[9],i[10]).length();this.determinant()<0&&(s=-s),e.x=i[12],e.y=i[13],e.z=i[14],hn.copy(this);const c=1/s,u=1/a,f=1/o;return hn.elements[0]*=c,hn.elements[1]*=c,hn.elements[2]*=c,hn.elements[4]*=u,hn.elements[5]*=u,hn.elements[6]*=u,hn.elements[8]*=f,hn.elements[9]*=f,hn.elements[10]*=f,t.setFromRotationMatrix(hn),n.x=s,n.y=a,n.z=o,this}makePerspective(e,t,n,i,s,a){const o=this.elements,l=2*s/(t-e),c=2*s/(n-i),u=(t+e)/(t-e),f=(n+i)/(n-i),d=-(a+s)/(a-s),m=-2*a*s/(a-s);return o[0]=l,o[4]=0,o[8]=u,o[12]=0,o[1]=0,o[5]=c,o[9]=f,o[13]=0,o[2]=0,o[6]=0,o[10]=d,o[14]=m,o[3]=0,o[7]=0,o[11]=-1,o[15]=0,this}makeOrthographic(e,t,n,i,s,a){const o=this.elements,l=1/(t-e),c=1/(n-i),u=1/(a-s),f=(t+e)*l,d=(n+i)*c,m=(a+s)*u;return o[0]=2*l,o[4]=0,o[8]=0,o[12]=-f,o[1]=0,o[5]=2*c,o[9]=0,o[13]=-d,o[2]=0,o[6]=0,o[10]=-2*u,o[14]=-m,o[3]=0,o[7]=0,o[11]=0,o[15]=1,this}equals(e){const t=this.elements,n=e.elements;for(let i=0;i<16;i++)if(t[i]!==n[i])return!1;return!0}fromArray(e,t=0){for(let n=0;n<16;n++)this.elements[n]=e[n+t];return this}toArray(e=[],t=0){const n=this.elements;return e[t]=n[0],e[t+1]=n[1],e[t+2]=n[2],e[t+3]=n[3],e[t+4]=n[4],e[t+5]=n[5],e[t+6]=n[6],e[t+7]=n[7],e[t+8]=n[8],e[t+9]=n[9],e[t+10]=n[10],e[t+11]=n[11],e[t+12]=n[12],e[t+13]=n[13],e[t+14]=n[14],e[t+15]=n[15],e}}const Mi=new G,hn=new Et,A_=new G(0,0,0),D_=new G(1,1,1),Wn=new G,Ir=new G,rn=new G,Ol=new Et,Ul=new Zt;class Tr{constructor(e=0,t=0,n=0,i=Tr.DEFAULT_ORDER){this.isEuler=!0,this._x=e,this._y=t,this._z=n,this._order=i}get x(){return this._x}set x(e){this._x=e,this._onChangeCallback()}get y(){return this._y}set y(e){this._y=e,this._onChangeCallback()}get z(){return this._z}set z(e){this._z=e,this._onChangeCallback()}get order(){return this._order}set order(e){this._order=e,this._onChangeCallback()}set(e,t,n,i=this._order){return this._x=e,this._y=t,this._z=n,this._order=i,this._onChangeCallback(),this}clone(){return new this.constructor(this._x,this._y,this._z,this._order)}copy(e){return this._x=e._x,this._y=e._y,this._z=e._z,this._order=e._order,this._onChangeCallback(),this}setFromRotationMatrix(e,t=this._order,n=!0){const i=e.elements,s=i[0],a=i[4],o=i[8],l=i[1],c=i[5],u=i[9],f=i[2],d=i[6],m=i[10];switch(t){case"XYZ":this._y=Math.asin($t(o,-1,1)),Math.abs(o)<.9999999?(this._x=Math.atan2(-u,m),this._z=Math.atan2(-a,s)):(this._x=Math.atan2(d,c),this._z=0);break;case"YXZ":this._x=Math.asin(-$t(u,-1,1)),Math.abs(u)<.9999999?(this._y=Math.atan2(o,m),this._z=Math.atan2(l,c)):(this._y=Math.atan2(-f,s),this._z=0);break;case"ZXY":this._x=Math.asin($t(d,-1,1)),Math.abs(d)<.9999999?(this._y=Math.atan2(-f,m),this._z=Math.atan2(-a,c)):(this._y=0,this._z=Math.atan2(l,s));break;case"ZYX":this._y=Math.asin(-$t(f,-1,1)),Math.abs(f)<.9999999?(this._x=Math.atan2(d,m),this._z=Math.atan2(l,s)):(this._x=0,this._z=Math.atan2(-a,c));break;case"YZX":this._z=Math.asin($t(l,-1,1)),Math.abs(l)<.9999999?(this._x=Math.atan2(-u,c),this._y=Math.atan2(-f,s)):(this._x=0,this._y=Math.atan2(o,m));break;case"XZY":this._z=Math.asin(-$t(a,-1,1)),Math.abs(a)<.9999999?(this._x=Math.atan2(d,c),this._y=Math.atan2(o,s)):(this._x=Math.atan2(-u,m),this._y=0);break;default:console.warn("THREE.Euler: .setFromRotationMatrix() encountered an unknown order: "+t)}return this._order=t,n===!0&&this._onChangeCallback(),this}setFromQuaternion(e,t,n){return Ol.makeRotationFromQuaternion(e),this.setFromRotationMatrix(Ol,t,n)}setFromVector3(e,t=this._order){return this.set(e.x,e.y,e.z,t)}reorder(e){return Ul.setFromEuler(this),this.setFromQuaternion(Ul,e)}equals(e){return e._x===this._x&&e._y===this._y&&e._z===this._z&&e._order===this._order}fromArray(e){return this._x=e[0],this._y=e[1],this._z=e[2],e[3]!==void 0&&(this._order=e[3]),this._onChangeCallback(),this}toArray(e=[],t=0){return e[t]=this._x,e[t+1]=this._y,e[t+2]=this._z,e[t+3]=this._order,e}_onChange(e){return this._onChangeCallback=e,this}_onChangeCallback(){}*[Symbol.iterator](){yield this._x,yield this._y,yield this._z,yield this._order}}Tr.DEFAULT_ORDER="XYZ";class xa{constructor(){this.mask=1}set(e){this.mask=(1<<e|0)>>>0}enable(e){this.mask|=1<<e|0}enableAll(){this.mask=-1}toggle(e){this.mask^=1<<e|0}disable(e){this.mask&=~(1<<e|0)}disableAll(){this.mask=0}test(e){return(this.mask&e.mask)!==0}isEnabled(e){return(this.mask&(1<<e|0))!==0}}let k_=0;const Bl=new G,xi=new Zt,Dn=new Et,Nr=new G,Qi=new G,R_=new G,I_=new Zt,Vl=new G(1,0,0),Gl=new G(0,1,0),Hl=new G(0,0,1),N_={type:"added"},Wl={type:"removed"};class Ut extends Xi{constructor(){super(),this.isObject3D=!0,Object.defineProperty(this,"id",{value:k_++}),this.uuid=ji(),this.name="",this.type="Object3D",this.parent=null,this.children=[],this.up=Ut.DEFAULT_UP.clone();const e=new G,t=new Tr,n=new Zt,i=new G(1,1,1);function s(){n.setFromEuler(t,!1)}function a(){t.setFromQuaternion(n,void 0,!1)}t._onChange(s),n._onChange(a),Object.defineProperties(this,{position:{configurable:!0,enumerable:!0,value:e},rotation:{configurable:!0,enumerable:!0,value:t},quaternion:{configurable:!0,enumerable:!0,value:n},scale:{configurable:!0,enumerable:!0,value:i},modelViewMatrix:{value:new Et},normalMatrix:{value:new Kt}}),this.matrix=new Et,this.matrixWorld=new Et,this.matrixAutoUpdate=Ut.DEFAULT_MATRIX_AUTO_UPDATE,this.matrixWorldNeedsUpdate=!1,this.matrixWorldAutoUpdate=Ut.DEFAULT_MATRIX_WORLD_AUTO_UPDATE,this.layers=new xa,this.visible=!0,this.castShadow=!1,this.receiveShadow=!1,this.frustumCulled=!0,this.renderOrder=0,this.animations=[],this.userData={}}onBeforeRender(){}onAfterRender(){}applyMatrix4(e){this.matrixAutoUpdate&&this.updateMatrix(),this.matrix.premultiply(e),this.matrix.decompose(this.position,this.quaternion,this.scale)}applyQuaternion(e){return this.quaternion.premultiply(e),this}setRotationFromAxisAngle(e,t){this.quaternion.setFromAxisAngle(e,t)}setRotationFromEuler(e){this.quaternion.setFromEuler(e,!0)}setRotationFromMatrix(e){this.quaternion.setFromRotationMatrix(e)}setRotationFromQuaternion(e){this.quaternion.copy(e)}rotateOnAxis(e,t){return xi.setFromAxisAngle(e,t),this.quaternion.multiply(xi),this}rotateOnWorldAxis(e,t){return xi.setFromAxisAngle(e,t),this.quaternion.premultiply(xi),this}rotateX(e){return this.rotateOnAxis(Vl,e)}rotateY(e){return this.rotateOnAxis(Gl,e)}rotateZ(e){return this.rotateOnAxis(Hl,e)}translateOnAxis(e,t){return Bl.copy(e).applyQuaternion(this.quaternion),this.position.add(Bl.multiplyScalar(t)),this}translateX(e){return this.translateOnAxis(Vl,e)}translateY(e){return this.translateOnAxis(Gl,e)}translateZ(e){return this.translateOnAxis(Hl,e)}localToWorld(e){return this.updateWorldMatrix(!0,!1),e.applyMatrix4(this.matrixWorld)}worldToLocal(e){return this.updateWorldMatrix(!0,!1),e.applyMatrix4(Dn.copy(this.matrixWorld).invert())}lookAt(e,t,n){e.isVector3?Nr.copy(e):Nr.set(e,t,n);const i=this.parent;this.updateWorldMatrix(!0,!1),Qi.setFromMatrixPosition(this.matrixWorld),this.isCamera||this.isLight?Dn.lookAt(Qi,Nr,this.up):Dn.lookAt(Nr,Qi,this.up),this.quaternion.setFromRotationMatrix(Dn),i&&(Dn.extractRotation(i.matrixWorld),xi.setFromRotationMatrix(Dn),this.quaternion.premultiply(xi.invert()))}add(e){if(arguments.length>1){for(let t=0;t<arguments.length;t++)this.add(arguments[t]);return this}return e===this?(console.error("THREE.Object3D.add: object can't be added as a child of itself.",e),this):(e&&e.isObject3D?(e.parent!==null&&e.parent.remove(e),e.parent=this,this.children.push(e),e.dispatchEvent(N_)):console.error("THREE.Object3D.add: object not an instance of THREE.Object3D.",e),this)}remove(e){if(arguments.length>1){for(let n=0;n<arguments.length;n++)this.remove(arguments[n]);return this}const t=this.children.indexOf(e);return t!==-1&&(e.parent=null,this.children.splice(t,1),e.dispatchEvent(Wl)),this}removeFromParent(){const e=this.parent;return e!==null&&e.remove(this),this}clear(){for(let e=0;e<this.children.length;e++){const t=this.children[e];t.parent=null,t.dispatchEvent(Wl)}return this.children.length=0,this}attach(e){return this.updateWorldMatrix(!0,!1),Dn.copy(this.matrixWorld).invert(),e.parent!==null&&(e.parent.updateWorldMatrix(!0,!1),Dn.multiply(e.parent.matrixWorld)),e.applyMatrix4(Dn),this.add(e),e.updateWorldMatrix(!1,!0),this}getObjectById(e){return this.getObjectByProperty("id",e)}getObjectByName(e){return this.getObjectByProperty("name",e)}getObjectByProperty(e,t){if(this[e]===t)return this;for(let n=0,i=this.children.length;n<i;n++){const a=this.children[n].getObjectByProperty(e,t);if(a!==void 0)return a}}getObjectsByProperty(e,t){let n=[];this[e]===t&&n.push(this);for(let i=0,s=this.children.length;i<s;i++){const a=this.children[i].getObjectsByProperty(e,t);a.length>0&&(n=n.concat(a))}return n}getWorldPosition(e){return this.updateWorldMatrix(!0,!1),e.setFromMatrixPosition(this.matrixWorld)}getWorldQuaternion(e){return this.updateWorldMatrix(!0,!1),this.matrixWorld.decompose(Qi,e,R_),e}getWorldScale(e){return this.updateWorldMatrix(!0,!1),this.matrixWorld.decompose(Qi,I_,e),e}getWorldDirection(e){this.updateWorldMatrix(!0,!1);const t=this.matrixWorld.elements;return e.set(t[8],t[9],t[10]).normalize()}raycast(){}traverse(e){e(this);const t=this.children;for(let n=0,i=t.length;n<i;n++)t[n].traverse(e)}traverseVisible(e){if(this.visible===!1)return;e(this);const t=this.children;for(let n=0,i=t.length;n<i;n++)t[n].traverseVisible(e)}traverseAncestors(e){const t=this.parent;t!==null&&(e(t),t.traverseAncestors(e))}updateMatrix(){this.matrix.compose(this.position,this.quaternion,this.scale),this.matrixWorldNeedsUpdate=!0}updateMatrixWorld(e){this.matrixAutoUpdate&&this.updateMatrix(),(this.matrixWorldNeedsUpdate||e)&&(this.parent===null?this.matrixWorld.copy(this.matrix):this.matrixWorld.multiplyMatrices(this.parent.matrixWorld,this.matrix),this.matrixWorldNeedsUpdate=!1,e=!0);const t=this.children;for(let n=0,i=t.length;n<i;n++){const s=t[n];(s.matrixWorldAutoUpdate===!0||e===!0)&&s.updateMatrixWorld(e)}}updateWorldMatrix(e,t){const n=this.parent;if(e===!0&&n!==null&&n.matrixWorldAutoUpdate===!0&&n.updateWorldMatrix(!0,!1),this.matrixAutoUpdate&&this.updateMatrix(),this.parent===null?this.matrixWorld.copy(this.matrix):this.matrixWorld.multiplyMatrices(this.parent.matrixWorld,this.matrix),t===!0){const i=this.children;for(let s=0,a=i.length;s<a;s++){const o=i[s];o.matrixWorldAutoUpdate===!0&&o.updateWorldMatrix(!1,!0)}}}toJSON(e){const t=e===void 0||typeof e=="string",n={};t&&(e={geometries:{},materials:{},textures:{},images:{},shapes:{},skeletons:{},animations:{},nodes:{}},n.metadata={version:4.5,type:"Object",generator:"Object3D.toJSON"});const i={};i.uuid=this.uuid,i.type=this.type,this.name!==""&&(i.name=this.name),this.castShadow===!0&&(i.castShadow=!0),this.receiveShadow===!0&&(i.receiveShadow=!0),this.visible===!1&&(i.visible=!1),this.frustumCulled===!1&&(i.frustumCulled=!1),this.renderOrder!==0&&(i.renderOrder=this.renderOrder),Object.keys(this.userData).length>0&&(i.userData=this.userData),i.layers=this.layers.mask,i.matrix=this.matrix.toArray(),this.matrixAutoUpdate===!1&&(i.matrixAutoUpdate=!1),this.isInstancedMesh&&(i.type="InstancedMesh",i.count=this.count,i.instanceMatrix=this.instanceMatrix.toJSON(),this.instanceColor!==null&&(i.instanceColor=this.instanceColor.toJSON()));function s(o,l){return o[l.uuid]===void 0&&(o[l.uuid]=l.toJSON(e)),l.uuid}if(this.isScene)this.background&&(this.background.isColor?i.background=this.background.toJSON():this.background.isTexture&&(i.background=this.background.toJSON(e).uuid)),this.environment&&this.environment.isTexture&&this.environment.isRenderTargetTexture!==!0&&(i.environment=this.environment.toJSON(e).uuid);else if(this.isMesh||this.isLine||this.isPoints){i.geometry=s(e.geometries,this.geometry);const o=this.geometry.parameters;if(o!==void 0&&o.shapes!==void 0){const l=o.shapes;if(Array.isArray(l))for(let c=0,u=l.length;c<u;c++){const f=l[c];s(e.shapes,f)}else s(e.shapes,l)}}if(this.isSkinnedMesh&&(i.bindMode=this.bindMode,i.bindMatrix=this.bindMatrix.toArray(),this.skeleton!==void 0&&(s(e.skeletons,this.skeleton),i.skeleton=this.skeleton.uuid)),this.material!==void 0)if(Array.isArray(this.material)){const o=[];for(let l=0,c=this.material.length;l<c;l++)o.push(s(e.materials,this.material[l]));i.material=o}else i.material=s(e.materials,this.material);if(this.children.length>0){i.children=[];for(let o=0;o<this.children.length;o++)i.children.push(this.children[o].toJSON(e).object)}if(this.animations.length>0){i.animations=[];for(let o=0;o<this.animations.length;o++){const l=this.animations[o];i.animations.push(s(e.animations,l))}}if(t){const o=a(e.geometries),l=a(e.materials),c=a(e.textures),u=a(e.images),f=a(e.shapes),d=a(e.skeletons),m=a(e.animations),h=a(e.nodes);o.length>0&&(n.geometries=o),l.length>0&&(n.materials=l),c.length>0&&(n.textures=c),u.length>0&&(n.images=u),f.length>0&&(n.shapes=f),d.length>0&&(n.skeletons=d),m.length>0&&(n.animations=m),h.length>0&&(n.nodes=h)}return n.object=i,n;function a(o){const l=[];for(const c in o){const u=o[c];delete u.metadata,l.push(u)}return l}}clone(e){return new this.constructor().copy(this,e)}copy(e,t=!0){if(this.name=e.name,this.up.copy(e.up),this.position.copy(e.position),this.rotation.order=e.rotation.order,this.quaternion.copy(e.quaternion),this.scale.copy(e.scale),this.matrix.copy(e.matrix),this.matrixWorld.copy(e.matrixWorld),this.matrixAutoUpdate=e.matrixAutoUpdate,this.matrixWorldNeedsUpdate=e.matrixWorldNeedsUpdate,this.matrixWorldAutoUpdate=e.matrixWorldAutoUpdate,this.layers.mask=e.layers.mask,this.visible=e.visible,this.castShadow=e.castShadow,this.receiveShadow=e.receiveShadow,this.frustumCulled=e.frustumCulled,this.renderOrder=e.renderOrder,this.userData=JSON.parse(JSON.stringify(e.userData)),t===!0)for(let n=0;n<e.children.length;n++){const i=e.children[n];this.add(i.clone())}return this}}Ut.DEFAULT_UP=new G(0,1,0);Ut.DEFAULT_MATRIX_AUTO_UPDATE=!0;Ut.DEFAULT_MATRIX_WORLD_AUTO_UPDATE=!0;const pn=new G,kn=new G,Hs=new G,Rn=new G,Si=new G,Ci=new G,Xl=new G,Ws=new G,Xs=new G,js=new G;class In{constructor(e=new G,t=new G,n=new G){this.a=e,this.b=t,this.c=n}static getNormal(e,t,n,i){i.subVectors(n,t),pn.subVectors(e,t),i.cross(pn);const s=i.lengthSq();return s>0?i.multiplyScalar(1/Math.sqrt(s)):i.set(0,0,0)}static getBarycoord(e,t,n,i,s){pn.subVectors(i,t),kn.subVectors(n,t),Hs.subVectors(e,t);const a=pn.dot(pn),o=pn.dot(kn),l=pn.dot(Hs),c=kn.dot(kn),u=kn.dot(Hs),f=a*c-o*o;if(f===0)return s.set(-2,-1,-1);const d=1/f,m=(c*l-o*u)*d,h=(a*u-o*l)*d;return s.set(1-m-h,h,m)}static containsPoint(e,t,n,i){return this.getBarycoord(e,t,n,i,Rn),Rn.x>=0&&Rn.y>=0&&Rn.x+Rn.y<=1}static getUV(e,t,n,i,s,a,o,l){return this.getBarycoord(e,t,n,i,Rn),l.set(0,0),l.addScaledVector(s,Rn.x),l.addScaledVector(a,Rn.y),l.addScaledVector(o,Rn.z),l}static isFrontFacing(e,t,n,i){return pn.subVectors(n,t),kn.subVectors(e,t),pn.cross(kn).dot(i)<0}set(e,t,n){return this.a.copy(e),this.b.copy(t),this.c.copy(n),this}setFromPointsAndIndices(e,t,n,i){return this.a.copy(e[t]),this.b.copy(e[n]),this.c.copy(e[i]),this}setFromAttributeAndIndices(e,t,n,i){return this.a.fromBufferAttribute(e,t),this.b.fromBufferAttribute(e,n),this.c.fromBufferAttribute(e,i),this}clone(){return new this.constructor().copy(this)}copy(e){return this.a.copy(e.a),this.b.copy(e.b),this.c.copy(e.c),this}getArea(){return pn.subVectors(this.c,this.b),kn.subVectors(this.a,this.b),pn.cross(kn).length()*.5}getMidpoint(e){return e.addVectors(this.a,this.b).add(this.c).multiplyScalar(1/3)}getNormal(e){return In.getNormal(this.a,this.b,this.c,e)}getPlane(e){return e.setFromCoplanarPoints(this.a,this.b,this.c)}getBarycoord(e,t){return In.getBarycoord(e,this.a,this.b,this.c,t)}getUV(e,t,n,i,s){return In.getUV(e,this.a,this.b,this.c,t,n,i,s)}containsPoint(e){return In.containsPoint(e,this.a,this.b,this.c)}isFrontFacing(e){return In.isFrontFacing(this.a,this.b,this.c,e)}intersectsBox(e){return e.intersectsTriangle(this)}closestPointToPoint(e,t){const n=this.a,i=this.b,s=this.c;let a,o;Si.subVectors(i,n),Ci.subVectors(s,n),Ws.subVectors(e,n);const l=Si.dot(Ws),c=Ci.dot(Ws);if(l<=0&&c<=0)return t.copy(n);Xs.subVectors(e,i);const u=Si.dot(Xs),f=Ci.dot(Xs);if(u>=0&&f<=u)return t.copy(i);const d=l*f-u*c;if(d<=0&&l>=0&&u<=0)return a=l/(l-u),t.copy(n).addScaledVector(Si,a);js.subVectors(e,s);const m=Si.dot(js),h=Ci.dot(js);if(h>=0&&m<=h)return t.copy(s);const p=m*c-l*h;if(p<=0&&c>=0&&h<=0)return o=c/(c-h),t.copy(n).addScaledVector(Ci,o);const _=u*h-m*f;if(_<=0&&f-u>=0&&m-h>=0)return Xl.subVectors(s,i),o=(f-u)/(f-u+(m-h)),t.copy(i).addScaledVector(Xl,o);const g=1/(_+p+d);return a=p*g,o=d*g,t.copy(n).addScaledVector(Si,a).addScaledVector(Ci,o)}equals(e){return e.a.equals(this.a)&&e.b.equals(this.b)&&e.c.equals(this.c)}}let z_=0;class Er extends Xi{constructor(){super(),this.isMaterial=!0,Object.defineProperty(this,"id",{value:z_++}),this.uuid=ji(),this.name="",this.type="Material",this.blending=zi,this.side=Zn,this.vertexColors=!1,this.opacity=1,this.transparent=!1,this.blendSrc=Wc,this.blendDst=Xc,this.blendEquation=Di,this.blendSrcAlpha=null,this.blendDstAlpha=null,this.blendEquationAlpha=null,this.depthFunc=la,this.depthTest=!0,this.depthWrite=!0,this.stencilWriteMask=255,this.stencilFunc=a_,this.stencilRef=0,this.stencilFuncMask=255,this.stencilFail=ks,this.stencilZFail=ks,this.stencilZPass=ks,this.stencilWrite=!1,this.clippingPlanes=null,this.clipIntersection=!1,this.clipShadows=!1,this.shadowSide=null,this.colorWrite=!0,this.precision=null,this.polygonOffset=!1,this.polygonOffsetFactor=0,this.polygonOffsetUnits=0,this.dithering=!1,this.alphaToCoverage=!1,this.premultipliedAlpha=!1,this.forceSinglePass=!1,this.visible=!0,this.toneMapped=!0,this.userData={},this.version=0,this._alphaTest=0}get alphaTest(){return this._alphaTest}set alphaTest(e){this._alphaTest>0!=e>0&&this.version++,this._alphaTest=e}onBuild(){}onBeforeRender(){}onBeforeCompile(){}customProgramCacheKey(){return this.onBeforeCompile.toString()}setValues(e){if(e!==void 0)for(const t in e){const n=e[t];if(n===void 0){console.warn("THREE.Material: '"+t+"' parameter is undefined.");continue}const i=this[t];if(i===void 0){console.warn("THREE."+this.type+": '"+t+"' is not a property of this material.");continue}i&&i.isColor?i.set(n):i&&i.isVector3&&n&&n.isVector3?i.copy(n):this[t]=n}}toJSON(e){const t=e===void 0||typeof e=="string";t&&(e={textures:{},images:{}});const n={metadata:{version:4.5,type:"Material",generator:"Material.toJSON"}};n.uuid=this.uuid,n.type=this.type,this.name!==""&&(n.name=this.name),this.color&&this.color.isColor&&(n.color=this.color.getHex()),this.roughness!==void 0&&(n.roughness=this.roughness),this.metalness!==void 0&&(n.metalness=this.metalness),this.sheen!==void 0&&(n.sheen=this.sheen),this.sheenColor&&this.sheenColor.isColor&&(n.sheenColor=this.sheenColor.getHex()),this.sheenRoughness!==void 0&&(n.sheenRoughness=this.sheenRoughness),this.emissive&&this.emissive.isColor&&(n.emissive=this.emissive.getHex()),this.emissiveIntensity&&this.emissiveIntensity!==1&&(n.emissiveIntensity=this.emissiveIntensity),this.specular&&this.specular.isColor&&(n.specular=this.specular.getHex()),this.specularIntensity!==void 0&&(n.specularIntensity=this.specularIntensity),this.specularColor&&this.specularColor.isColor&&(n.specularColor=this.specularColor.getHex()),this.shininess!==void 0&&(n.shininess=this.shininess),this.clearcoat!==void 0&&(n.clearcoat=this.clearcoat),this.clearcoatRoughness!==void 0&&(n.clearcoatRoughness=this.clearcoatRoughness),this.clearcoatMap&&this.clearcoatMap.isTexture&&(n.clearcoatMap=this.clearcoatMap.toJSON(e).uuid),this.clearcoatRoughnessMap&&this.clearcoatRoughnessMap.isTexture&&(n.clearcoatRoughnessMap=this.clearcoatRoughnessMap.toJSON(e).uuid),this.clearcoatNormalMap&&this.clearcoatNormalMap.isTexture&&(n.clearcoatNormalMap=this.clearcoatNormalMap.toJSON(e).uuid,n.clearcoatNormalScale=this.clearcoatNormalScale.toArray()),this.iridescence!==void 0&&(n.iridescence=this.iridescence),this.iridescenceIOR!==void 0&&(n.iridescenceIOR=this.iridescenceIOR),this.iridescenceThicknessRange!==void 0&&(n.iridescenceThicknessRange=this.iridescenceThicknessRange),this.iridescenceMap&&this.iridescenceMap.isTexture&&(n.iridescenceMap=this.iridescenceMap.toJSON(e).uuid),this.iridescenceThicknessMap&&this.iridescenceThicknessMap.isTexture&&(n.iridescenceThicknessMap=this.iridescenceThicknessMap.toJSON(e).uuid),this.map&&this.map.isTexture&&(n.map=this.map.toJSON(e).uuid),this.matcap&&this.matcap.isTexture&&(n.matcap=this.matcap.toJSON(e).uuid),this.alphaMap&&this.alphaMap.isTexture&&(n.alphaMap=this.alphaMap.toJSON(e).uuid),this.lightMap&&this.lightMap.isTexture&&(n.lightMap=this.lightMap.toJSON(e).uuid,n.lightMapIntensity=this.lightMapIntensity),this.aoMap&&this.aoMap.isTexture&&(n.aoMap=this.aoMap.toJSON(e).uuid,n.aoMapIntensity=this.aoMapIntensity),this.bumpMap&&this.bumpMap.isTexture&&(n.bumpMap=this.bumpMap.toJSON(e).uuid,n.bumpScale=this.bumpScale),this.normalMap&&this.normalMap.isTexture&&(n.normalMap=this.normalMap.toJSON(e).uuid,n.normalMapType=this.normalMapType,n.normalScale=this.normalScale.toArray()),this.displacementMap&&this.displacementMap.isTexture&&(n.displacementMap=this.displacementMap.toJSON(e).uuid,n.displacementScale=this.displacementScale,n.displacementBias=this.displacementBias),this.roughnessMap&&this.roughnessMap.isTexture&&(n.roughnessMap=this.roughnessMap.toJSON(e).uuid),this.metalnessMap&&this.metalnessMap.isTexture&&(n.metalnessMap=this.metalnessMap.toJSON(e).uuid),this.emissiveMap&&this.emissiveMap.isTexture&&(n.emissiveMap=this.emissiveMap.toJSON(e).uuid),this.specularMap&&this.specularMap.isTexture&&(n.specularMap=this.specularMap.toJSON(e).uuid),this.specularIntensityMap&&this.specularIntensityMap.isTexture&&(n.specularIntensityMap=this.specularIntensityMap.toJSON(e).uuid),this.specularColorMap&&this.specularColorMap.isTexture&&(n.specularColorMap=this.specularColorMap.toJSON(e).uuid),this.envMap&&this.envMap.isTexture&&(n.envMap=this.envMap.toJSON(e).uuid,this.combine!==void 0&&(n.combine=this.combine)),this.envMapIntensity!==void 0&&(n.envMapIntensity=this.envMapIntensity),this.reflectivity!==void 0&&(n.reflectivity=this.reflectivity),this.refractionRatio!==void 0&&(n.refractionRatio=this.refractionRatio),this.gradientMap&&this.gradientMap.isTexture&&(n.gradientMap=this.gradientMap.toJSON(e).uuid),this.transmission!==void 0&&(n.transmission=this.transmission),this.transmissionMap&&this.transmissionMap.isTexture&&(n.transmissionMap=this.transmissionMap.toJSON(e).uuid),this.thickness!==void 0&&(n.thickness=this.thickness),this.thicknessMap&&this.thicknessMap.isTexture&&(n.thicknessMap=this.thicknessMap.toJSON(e).uuid),this.attenuationDistance!==void 0&&this.attenuationDistance!==1/0&&(n.attenuationDistance=this.attenuationDistance),this.attenuationColor!==void 0&&(n.attenuationColor=this.attenuationColor.getHex()),this.size!==void 0&&(n.size=this.size),this.shadowSide!==null&&(n.shadowSide=this.shadowSide),this.sizeAttenuation!==void 0&&(n.sizeAttenuation=this.sizeAttenuation),this.blending!==zi&&(n.blending=this.blending),this.side!==Zn&&(n.side=this.side),this.vertexColors&&(n.vertexColors=!0),this.opacity<1&&(n.opacity=this.opacity),this.transparent===!0&&(n.transparent=this.transparent),n.depthFunc=this.depthFunc,n.depthTest=this.depthTest,n.depthWrite=this.depthWrite,n.colorWrite=this.colorWrite,n.stencilWrite=this.stencilWrite,n.stencilWriteMask=this.stencilWriteMask,n.stencilFunc=this.stencilFunc,n.stencilRef=this.stencilRef,n.stencilFuncMask=this.stencilFuncMask,n.stencilFail=this.stencilFail,n.stencilZFail=this.stencilZFail,n.stencilZPass=this.stencilZPass,this.rotation!==void 0&&this.rotation!==0&&(n.rotation=this.rotation),this.polygonOffset===!0&&(n.polygonOffset=!0),this.polygonOffsetFactor!==0&&(n.polygonOffsetFactor=this.polygonOffsetFactor),this.polygonOffsetUnits!==0&&(n.polygonOffsetUnits=this.polygonOffsetUnits),this.linewidth!==void 0&&this.linewidth!==1&&(n.linewidth=this.linewidth),this.dashSize!==void 0&&(n.dashSize=this.dashSize),this.gapSize!==void 0&&(n.gapSize=this.gapSize),this.scale!==void 0&&(n.scale=this.scale),this.dithering===!0&&(n.dithering=!0),this.alphaTest>0&&(n.alphaTest=this.alphaTest),this.alphaToCoverage===!0&&(n.alphaToCoverage=this.alphaToCoverage),this.premultipliedAlpha===!0&&(n.premultipliedAlpha=this.premultipliedAlpha),this.forceSinglePass===!0&&(n.forceSinglePass=this.forceSinglePass),this.wireframe===!0&&(n.wireframe=this.wireframe),this.wireframeLinewidth>1&&(n.wireframeLinewidth=this.wireframeLinewidth),this.wireframeLinecap!=="round"&&(n.wireframeLinecap=this.wireframeLinecap),this.wireframeLinejoin!=="round"&&(n.wireframeLinejoin=this.wireframeLinejoin),this.flatShading===!0&&(n.flatShading=this.flatShading),this.visible===!1&&(n.visible=!1),this.toneMapped===!1&&(n.toneMapped=!1),this.fog===!1&&(n.fog=!1),Object.keys(this.userData).length>0&&(n.userData=this.userData);function i(s){const a=[];for(const o in s){const l=s[o];delete l.metadata,a.push(l)}return a}if(t){const s=i(e.textures),a=i(e.images);s.length>0&&(n.textures=s),a.length>0&&(n.images=a)}return n}clone(){return new this.constructor().copy(this)}copy(e){this.name=e.name,this.blending=e.blending,this.side=e.side,this.vertexColors=e.vertexColors,this.opacity=e.opacity,this.transparent=e.transparent,this.blendSrc=e.blendSrc,this.blendDst=e.blendDst,this.blendEquation=e.blendEquation,this.blendSrcAlpha=e.blendSrcAlpha,this.blendDstAlpha=e.blendDstAlpha,this.blendEquationAlpha=e.blendEquationAlpha,this.depthFunc=e.depthFunc,this.depthTest=e.depthTest,this.depthWrite=e.depthWrite,this.stencilWriteMask=e.stencilWriteMask,this.stencilFunc=e.stencilFunc,this.stencilRef=e.stencilRef,this.stencilFuncMask=e.stencilFuncMask,this.stencilFail=e.stencilFail,this.stencilZFail=e.stencilZFail,this.stencilZPass=e.stencilZPass,this.stencilWrite=e.stencilWrite;const t=e.clippingPlanes;let n=null;if(t!==null){const i=t.length;n=new Array(i);for(let s=0;s!==i;++s)n[s]=t[s].clone()}return this.clippingPlanes=n,this.clipIntersection=e.clipIntersection,this.clipShadows=e.clipShadows,this.shadowSide=e.shadowSide,this.colorWrite=e.colorWrite,this.precision=e.precision,this.polygonOffset=e.polygonOffset,this.polygonOffsetFactor=e.polygonOffsetFactor,this.polygonOffsetUnits=e.polygonOffsetUnits,this.dithering=e.dithering,this.alphaTest=e.alphaTest,this.alphaToCoverage=e.alphaToCoverage,this.premultipliedAlpha=e.premultipliedAlpha,this.forceSinglePass=e.forceSinglePass,this.visible=e.visible,this.toneMapped=e.toneMapped,this.userData=JSON.parse(JSON.stringify(e.userData)),this}dispose(){this.dispatchEvent({type:"dispose"})}set needsUpdate(e){e===!0&&this.version++}}const tu={aliceblue:15792383,antiquewhite:16444375,aqua:65535,aquamarine:8388564,azure:15794175,beige:16119260,bisque:16770244,black:0,blanchedalmond:16772045,blue:255,blueviolet:9055202,brown:10824234,burlywood:14596231,cadetblue:6266528,chartreuse:8388352,chocolate:13789470,coral:16744272,cornflowerblue:6591981,cornsilk:16775388,crimson:14423100,cyan:65535,darkblue:139,darkcyan:35723,darkgoldenrod:12092939,darkgray:11119017,darkgreen:25600,darkgrey:11119017,darkkhaki:12433259,darkmagenta:9109643,darkolivegreen:5597999,darkorange:16747520,darkorchid:10040012,darkred:9109504,darksalmon:15308410,darkseagreen:9419919,darkslateblue:4734347,darkslategray:3100495,darkslategrey:3100495,darkturquoise:52945,darkviolet:9699539,deeppink:16716947,deepskyblue:49151,dimgray:6908265,dimgrey:6908265,dodgerblue:2003199,firebrick:11674146,floralwhite:16775920,forestgreen:2263842,fuchsia:16711935,gainsboro:14474460,ghostwhite:16316671,gold:16766720,goldenrod:14329120,gray:8421504,green:32768,greenyellow:11403055,grey:8421504,honeydew:15794160,hotpink:16738740,indianred:13458524,indigo:4915330,ivory:16777200,khaki:15787660,lavender:15132410,lavenderblush:16773365,lawngreen:8190976,lemonchiffon:16775885,lightblue:11393254,lightcoral:15761536,lightcyan:14745599,lightgoldenrodyellow:16448210,lightgray:13882323,lightgreen:9498256,lightgrey:13882323,lightpink:16758465,lightsalmon:16752762,lightseagreen:2142890,lightskyblue:8900346,lightslategray:7833753,lightslategrey:7833753,lightsteelblue:11584734,lightyellow:16777184,lime:65280,limegreen:3329330,linen:16445670,magenta:16711935,maroon:8388608,mediumaquamarine:6737322,mediumblue:205,mediumorchid:12211667,mediumpurple:9662683,mediumseagreen:3978097,mediumslateblue:8087790,mediumspringgreen:64154,mediumturquoise:4772300,mediumvioletred:13047173,midnightblue:1644912,mintcream:16121850,mistyrose:16770273,moccasin:16770229,navajowhite:16768685,navy:128,oldlace:16643558,olive:8421376,olivedrab:7048739,orange:16753920,orangered:16729344,orchid:14315734,palegoldenrod:15657130,palegreen:10025880,paleturquoise:11529966,palevioletred:14381203,papayawhip:16773077,peachpuff:16767673,peru:13468991,pink:16761035,plum:14524637,powderblue:11591910,purple:8388736,rebeccapurple:6697881,red:16711680,rosybrown:12357519,royalblue:4286945,saddlebrown:9127187,salmon:16416882,sandybrown:16032864,seagreen:3050327,seashell:16774638,sienna:10506797,silver:12632256,skyblue:8900331,slateblue:6970061,slategray:7372944,slategrey:7372944,snow:16775930,springgreen:65407,steelblue:4620980,tan:13808780,teal:32896,thistle:14204888,tomato:16737095,turquoise:4251856,violet:15631086,wheat:16113331,white:16777215,whitesmoke:16119285,yellow:16776960,yellowgreen:10145074},mn={h:0,s:0,l:0},zr={h:0,s:0,l:0};function qs(r,e,t){return t<0&&(t+=1),t>1&&(t-=1),t<1/6?r+(e-r)*6*t:t<1/2?e:t<2/3?r+(e-r)*6*(2/3-t):r}class pt{constructor(e,t,n){return this.isColor=!0,this.r=1,this.g=1,this.b=1,t===void 0&&n===void 0?this.set(e):this.setRGB(e,t,n)}set(e){return e&&e.isColor?this.copy(e):typeof e=="number"?this.setHex(e):typeof e=="string"&&this.setStyle(e),this}setScalar(e){return this.r=e,this.g=e,this.b=e,this}setHex(e,t=xn){return e=Math.floor(e),this.r=(e>>16&255)/255,this.g=(e>>8&255)/255,this.b=(e&255)/255,jt.toWorkingColorSpace(this,t),this}setRGB(e,t,n,i=jt.workingColorSpace){return this.r=e,this.g=t,this.b=n,jt.toWorkingColorSpace(this,i),this}setHSL(e,t,n,i=jt.workingColorSpace){if(e=wa(e,1),t=$t(t,0,1),n=$t(n,0,1),t===0)this.r=this.g=this.b=n;else{const s=n<=.5?n*(1+t):n+t-n*t,a=2*n-s;this.r=qs(a,s,e+1/3),this.g=qs(a,s,e),this.b=qs(a,s,e-1/3)}return jt.toWorkingColorSpace(this,i),this}setStyle(e,t=xn){function n(s){s!==void 0&&parseFloat(s)<1&&console.warn("THREE.Color: Alpha component of "+e+" will be ignored.")}let i;if(i=/^(\w+)\(([^\)]*)\)/.exec(e)){let s;const a=i[1],o=i[2];switch(a){case"rgb":case"rgba":if(s=/^\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*(?:,\s*(\d*\.?\d+)\s*)?$/.exec(o))return this.r=Math.min(255,parseInt(s[1],10))/255,this.g=Math.min(255,parseInt(s[2],10))/255,this.b=Math.min(255,parseInt(s[3],10))/255,jt.toWorkingColorSpace(this,t),n(s[4]),this;if(s=/^\s*(\d+)\%\s*,\s*(\d+)\%\s*,\s*(\d+)\%\s*(?:,\s*(\d*\.?\d+)\s*)?$/.exec(o))return this.r=Math.min(100,parseInt(s[1],10))/100,this.g=Math.min(100,parseInt(s[2],10))/100,this.b=Math.min(100,parseInt(s[3],10))/100,jt.toWorkingColorSpace(this,t),n(s[4]),this;break;case"hsl":case"hsla":if(s=/^\s*(\d*\.?\d+)\s*,\s*(\d*\.?\d+)\%\s*,\s*(\d*\.?\d+)\%\s*(?:,\s*(\d*\.?\d+)\s*)?$/.exec(o)){const l=parseFloat(s[1])/360,c=parseFloat(s[2])/100,u=parseFloat(s[3])/100;return n(s[4]),this.setHSL(l,c,u,t)}break;default:console.warn("THREE.Color: Unknown color model "+e)}}else if(i=/^\#([A-Fa-f\d]+)$/.exec(e)){const s=i[1],a=s.length;if(a===3)return this.r=parseInt(s.charAt(0)+s.charAt(0),16)/255,this.g=parseInt(s.charAt(1)+s.charAt(1),16)/255,this.b=parseInt(s.charAt(2)+s.charAt(2),16)/255,jt.toWorkingColorSpace(this,t),this;if(a===6)return this.r=parseInt(s.charAt(0)+s.charAt(1),16)/255,this.g=parseInt(s.charAt(2)+s.charAt(3),16)/255,this.b=parseInt(s.charAt(4)+s.charAt(5),16)/255,jt.toWorkingColorSpace(this,t),this;console.warn("THREE.Color: Invalid hex color "+e)}else if(e&&e.length>0)return this.setColorName(e,t);return this}setColorName(e,t=xn){const n=tu[e.toLowerCase()];return n!==void 0?this.setHex(n,t):console.warn("THREE.Color: Unknown color "+e),this}clone(){return new this.constructor(this.r,this.g,this.b)}copy(e){return this.r=e.r,this.g=e.g,this.b=e.b,this}copySRGBToLinear(e){return this.r=Oi(e.r),this.g=Oi(e.g),this.b=Oi(e.b),this}copyLinearToSRGB(e){return this.r=Ns(e.r),this.g=Ns(e.g),this.b=Ns(e.b),this}convertSRGBToLinear(){return this.copySRGBToLinear(this),this}convertLinearToSRGB(){return this.copyLinearToSRGB(this),this}getHex(e=xn){return jt.fromWorkingColorSpace(Vt.copy(this),e),$t(Vt.r*255,0,255)<<16^$t(Vt.g*255,0,255)<<8^$t(Vt.b*255,0,255)<<0}getHexString(e=xn){return("000000"+this.getHex(e).toString(16)).slice(-6)}getHSL(e,t=jt.workingColorSpace){jt.fromWorkingColorSpace(Vt.copy(this),t);const n=Vt.r,i=Vt.g,s=Vt.b,a=Math.max(n,i,s),o=Math.min(n,i,s);let l,c;const u=(o+a)/2;if(o===a)l=0,c=0;else{const f=a-o;switch(c=u<=.5?f/(a+o):f/(2-a-o),a){case n:l=(i-s)/f+(i<s?6:0);break;case i:l=(s-n)/f+2;break;case s:l=(n-i)/f+4;break}l/=6}return e.h=l,e.s=c,e.l=u,e}getRGB(e,t=jt.workingColorSpace){return jt.fromWorkingColorSpace(Vt.copy(this),t),e.r=Vt.r,e.g=Vt.g,e.b=Vt.b,e}getStyle(e=xn){jt.fromWorkingColorSpace(Vt.copy(this),e);const t=Vt.r,n=Vt.g,i=Vt.b;return e!==xn?`color(${e} ${t.toFixed(3)} ${n.toFixed(3)} ${i.toFixed(3)})`:`rgb(${t*255|0},${n*255|0},${i*255|0})`}offsetHSL(e,t,n){return this.getHSL(mn),mn.h+=e,mn.s+=t,mn.l+=n,this.setHSL(mn.h,mn.s,mn.l),this}add(e){return this.r+=e.r,this.g+=e.g,this.b+=e.b,this}addColors(e,t){return this.r=e.r+t.r,this.g=e.g+t.g,this.b=e.b+t.b,this}addScalar(e){return this.r+=e,this.g+=e,this.b+=e,this}sub(e){return this.r=Math.max(0,this.r-e.r),this.g=Math.max(0,this.g-e.g),this.b=Math.max(0,this.b-e.b),this}multiply(e){return this.r*=e.r,this.g*=e.g,this.b*=e.b,this}multiplyScalar(e){return this.r*=e,this.g*=e,this.b*=e,this}lerp(e,t){return this.r+=(e.r-this.r)*t,this.g+=(e.g-this.g)*t,this.b+=(e.b-this.b)*t,this}lerpColors(e,t,n){return this.r=e.r+(t.r-e.r)*n,this.g=e.g+(t.g-e.g)*n,this.b=e.b+(t.b-e.b)*n,this}lerpHSL(e,t){this.getHSL(mn),e.getHSL(zr);const n=pr(mn.h,zr.h,t),i=pr(mn.s,zr.s,t),s=pr(mn.l,zr.l,t);return this.setHSL(n,i,s),this}equals(e){return e.r===this.r&&e.g===this.g&&e.b===this.b}fromArray(e,t=0){return this.r=e[t],this.g=e[t+1],this.b=e[t+2],this}toArray(e=[],t=0){return e[t]=this.r,e[t+1]=this.g,e[t+2]=this.b,e}fromBufferAttribute(e,t){return this.r=e.getX(t),this.g=e.getY(t),this.b=e.getZ(t),this}toJSON(){return this.getHex()}*[Symbol.iterator](){yield this.r,yield this.g,yield this.b}}const Vt=new pt;pt.NAMES=tu;class gs extends Er{constructor(e){super(),this.isMeshBasicMaterial=!0,this.type="MeshBasicMaterial",this.color=new pt(16777215),this.map=null,this.lightMap=null,this.lightMapIntensity=1,this.aoMap=null,this.aoMapIntensity=1,this.specularMap=null,this.alphaMap=null,this.envMap=null,this.combine=jc,this.reflectivity=1,this.refractionRatio=.98,this.wireframe=!1,this.wireframeLinewidth=1,this.wireframeLinecap="round",this.wireframeLinejoin="round",this.fog=!0,this.setValues(e)}copy(e){return super.copy(e),this.color.copy(e.color),this.map=e.map,this.lightMap=e.lightMap,this.lightMapIntensity=e.lightMapIntensity,this.aoMap=e.aoMap,this.aoMapIntensity=e.aoMapIntensity,this.specularMap=e.specularMap,this.alphaMap=e.alphaMap,this.envMap=e.envMap,this.combine=e.combine,this.reflectivity=e.reflectivity,this.refractionRatio=e.refractionRatio,this.wireframe=e.wireframe,this.wireframeLinewidth=e.wireframeLinewidth,this.wireframeLinecap=e.wireframeLinecap,this.wireframeLinejoin=e.wireframeLinejoin,this.fog=e.fog,this}}const Ct=new G,Fr=new ot;class Cn{constructor(e,t,n=!1){if(Array.isArray(e))throw new TypeError("THREE.BufferAttribute: array should be a Typed Array.");this.isBufferAttribute=!0,this.name="",this.array=e,this.itemSize=t,this.count=e!==void 0?e.length/t:0,this.normalized=n,this.usage=Il,this.updateRange={offset:0,count:-1},this.version=0}onUploadCallback(){}set needsUpdate(e){e===!0&&this.version++}setUsage(e){return this.usage=e,this}copy(e){return this.name=e.name,this.array=new e.array.constructor(e.array),this.itemSize=e.itemSize,this.count=e.count,this.normalized=e.normalized,this.usage=e.usage,this}copyAt(e,t,n){e*=this.itemSize,n*=t.itemSize;for(let i=0,s=this.itemSize;i<s;i++)this.array[e+i]=t.array[n+i];return this}copyArray(e){return this.array.set(e),this}applyMatrix3(e){if(this.itemSize===2)for(let t=0,n=this.count;t<n;t++)Fr.fromBufferAttribute(this,t),Fr.applyMatrix3(e),this.setXY(t,Fr.x,Fr.y);else if(this.itemSize===3)for(let t=0,n=this.count;t<n;t++)Ct.fromBufferAttribute(this,t),Ct.applyMatrix3(e),this.setXYZ(t,Ct.x,Ct.y,Ct.z);return this}applyMatrix4(e){for(let t=0,n=this.count;t<n;t++)Ct.fromBufferAttribute(this,t),Ct.applyMatrix4(e),this.setXYZ(t,Ct.x,Ct.y,Ct.z);return this}applyNormalMatrix(e){for(let t=0,n=this.count;t<n;t++)Ct.fromBufferAttribute(this,t),Ct.applyNormalMatrix(e),this.setXYZ(t,Ct.x,Ct.y,Ct.z);return this}transformDirection(e){for(let t=0,n=this.count;t<n;t++)Ct.fromBufferAttribute(this,t),Ct.transformDirection(e),this.setXYZ(t,Ct.x,Ct.y,Ct.z);return this}set(e,t=0){return this.array.set(e,t),this}getX(e){let t=this.array[e*this.itemSize];return this.normalized&&(t=or(t,this.array)),t}setX(e,t){return this.normalized&&(t=Jt(t,this.array)),this.array[e*this.itemSize]=t,this}getY(e){let t=this.array[e*this.itemSize+1];return this.normalized&&(t=or(t,this.array)),t}setY(e,t){return this.normalized&&(t=Jt(t,this.array)),this.array[e*this.itemSize+1]=t,this}getZ(e){let t=this.array[e*this.itemSize+2];return this.normalized&&(t=or(t,this.array)),t}setZ(e,t){return this.normalized&&(t=Jt(t,this.array)),this.array[e*this.itemSize+2]=t,this}getW(e){let t=this.array[e*this.itemSize+3];return this.normalized&&(t=or(t,this.array)),t}setW(e,t){return this.normalized&&(t=Jt(t,this.array)),this.array[e*this.itemSize+3]=t,this}setXY(e,t,n){return e*=this.itemSize,this.normalized&&(t=Jt(t,this.array),n=Jt(n,this.array)),this.array[e+0]=t,this.array[e+1]=n,this}setXYZ(e,t,n,i){return e*=this.itemSize,this.normalized&&(t=Jt(t,this.array),n=Jt(n,this.array),i=Jt(i,this.array)),this.array[e+0]=t,this.array[e+1]=n,this.array[e+2]=i,this}setXYZW(e,t,n,i,s){return e*=this.itemSize,this.normalized&&(t=Jt(t,this.array),n=Jt(n,this.array),i=Jt(i,this.array),s=Jt(s,this.array)),this.array[e+0]=t,this.array[e+1]=n,this.array[e+2]=i,this.array[e+3]=s,this}onUpload(e){return this.onUploadCallback=e,this}clone(){return new this.constructor(this.array,this.itemSize).copy(this)}toJSON(){const e={itemSize:this.itemSize,type:this.array.constructor.name,array:Array.from(this.array),normalized:this.normalized};return this.name!==""&&(e.name=this.name),this.usage!==Il&&(e.usage=this.usage),(this.updateRange.offset!==0||this.updateRange.count!==-1)&&(e.updateRange=this.updateRange),e}copyColorsArray(){console.error("THREE.BufferAttribute: copyColorsArray() was removed in r144.")}copyVector2sArray(){console.error("THREE.BufferAttribute: copyVector2sArray() was removed in r144.")}copyVector3sArray(){console.error("THREE.BufferAttribute: copyVector3sArray() was removed in r144.")}copyVector4sArray(){console.error("THREE.BufferAttribute: copyVector4sArray() was removed in r144.")}}class nu extends Cn{constructor(e,t,n){super(new Uint16Array(e),t,n)}}class iu extends Cn{constructor(e,t,n){super(new Uint32Array(e),t,n)}}class bt extends Cn{constructor(e,t,n){super(new Float32Array(e),t,n)}}let F_=0;const un=new Et,Ys=new Ut,Ti=new G,sn=new Cr,$i=new Cr,Nt=new G;class en extends Xi{constructor(){super(),this.isBufferGeometry=!0,Object.defineProperty(this,"id",{value:F_++}),this.uuid=ji(),this.name="",this.type="BufferGeometry",this.index=null,this.attributes={},this.morphAttributes={},this.morphTargetsRelative=!1,this.groups=[],this.boundingBox=null,this.boundingSphere=null,this.drawRange={start:0,count:1/0},this.userData={}}getIndex(){return this.index}setIndex(e){return Array.isArray(e)?this.index=new(Jc(e)?iu:nu)(e,1):this.index=e,this}getAttribute(e){return this.attributes[e]}setAttribute(e,t){return this.attributes[e]=t,this}deleteAttribute(e){return delete this.attributes[e],this}hasAttribute(e){return this.attributes[e]!==void 0}addGroup(e,t,n=0){this.groups.push({start:e,count:t,materialIndex:n})}clearGroups(){this.groups=[]}setDrawRange(e,t){this.drawRange.start=e,this.drawRange.count=t}applyMatrix4(e){const t=this.attributes.position;t!==void 0&&(t.applyMatrix4(e),t.needsUpdate=!0);const n=this.attributes.normal;if(n!==void 0){const s=new Kt().getNormalMatrix(e);n.applyNormalMatrix(s),n.needsUpdate=!0}const i=this.attributes.tangent;return i!==void 0&&(i.transformDirection(e),i.needsUpdate=!0),this.boundingBox!==null&&this.computeBoundingBox(),this.boundingSphere!==null&&this.computeBoundingSphere(),this}applyQuaternion(e){return un.makeRotationFromQuaternion(e),this.applyMatrix4(un),this}rotateX(e){return un.makeRotationX(e),this.applyMatrix4(un),this}rotateY(e){return un.makeRotationY(e),this.applyMatrix4(un),this}rotateZ(e){return un.makeRotationZ(e),this.applyMatrix4(un),this}translate(e,t,n){return un.makeTranslation(e,t,n),this.applyMatrix4(un),this}scale(e,t,n){return un.makeScale(e,t,n),this.applyMatrix4(un),this}lookAt(e){return Ys.lookAt(e),Ys.updateMatrix(),this.applyMatrix4(Ys.matrix),this}center(){return this.computeBoundingBox(),this.boundingBox.getCenter(Ti).negate(),this.translate(Ti.x,Ti.y,Ti.z),this}setFromPoints(e){const t=[];for(let n=0,i=e.length;n<i;n++){const s=e[n];t.push(s.x,s.y,s.z||0)}return this.setAttribute("position",new bt(t,3)),this}computeBoundingBox(){this.boundingBox===null&&(this.boundingBox=new Cr);const e=this.attributes.position,t=this.morphAttributes.position;if(e&&e.isGLBufferAttribute){console.error('THREE.BufferGeometry.computeBoundingBox(): GLBufferAttribute requires a manual bounding box. Alternatively set "mesh.frustumCulled" to "false".',this),this.boundingBox.set(new G(-1/0,-1/0,-1/0),new G(1/0,1/0,1/0));return}if(e!==void 0){if(this.boundingBox.setFromBufferAttribute(e),t)for(let n=0,i=t.length;n<i;n++){const s=t[n];sn.setFromBufferAttribute(s),this.morphTargetsRelative?(Nt.addVectors(this.boundingBox.min,sn.min),this.boundingBox.expandByPoint(Nt),Nt.addVectors(this.boundingBox.max,sn.max),this.boundingBox.expandByPoint(Nt)):(this.boundingBox.expandByPoint(sn.min),this.boundingBox.expandByPoint(sn.max))}}else this.boundingBox.makeEmpty();(isNaN(this.boundingBox.min.x)||isNaN(this.boundingBox.min.y)||isNaN(this.boundingBox.min.z))&&console.error('THREE.BufferGeometry.computeBoundingBox(): Computed min/max have NaN values. The "position" attribute is likely to have NaN values.',this)}computeBoundingSphere(){this.boundingSphere===null&&(this.boundingSphere=new _s);const e=this.attributes.position,t=this.morphAttributes.position;if(e&&e.isGLBufferAttribute){console.error('THREE.BufferGeometry.computeBoundingSphere(): GLBufferAttribute requires a manual bounding sphere. Alternatively set "mesh.frustumCulled" to "false".',this),this.boundingSphere.set(new G,1/0);return}if(e){const n=this.boundingSphere.center;if(sn.setFromBufferAttribute(e),t)for(let s=0,a=t.length;s<a;s++){const o=t[s];$i.setFromBufferAttribute(o),this.morphTargetsRelative?(Nt.addVectors(sn.min,$i.min),sn.expandByPoint(Nt),Nt.addVectors(sn.max,$i.max),sn.expandByPoint(Nt)):(sn.expandByPoint($i.min),sn.expandByPoint($i.max))}sn.getCenter(n);let i=0;for(let s=0,a=e.count;s<a;s++)Nt.fromBufferAttribute(e,s),i=Math.max(i,n.distanceToSquared(Nt));if(t)for(let s=0,a=t.length;s<a;s++){const o=t[s],l=this.morphTargetsRelative;for(let c=0,u=o.count;c<u;c++)Nt.fromBufferAttribute(o,c),l&&(Ti.fromBufferAttribute(e,c),Nt.add(Ti)),i=Math.max(i,n.distanceToSquared(Nt))}this.boundingSphere.radius=Math.sqrt(i),isNaN(this.boundingSphere.radius)&&console.error('THREE.BufferGeometry.computeBoundingSphere(): Computed radius is NaN. The "position" attribute is likely to have NaN values.',this)}}computeTangents(){const e=this.index,t=this.attributes;if(e===null||t.position===void 0||t.normal===void 0||t.uv===void 0){console.error("THREE.BufferGeometry: .computeTangents() failed. Missing required attributes (index, position, normal or uv)");return}const n=e.array,i=t.position.array,s=t.normal.array,a=t.uv.array,o=i.length/3;this.hasAttribute("tangent")===!1&&this.setAttribute("tangent",new Cn(new Float32Array(4*o),4));const l=this.getAttribute("tangent").array,c=[],u=[];for(let P=0;P<o;P++)c[P]=new G,u[P]=new G;const f=new G,d=new G,m=new G,h=new ot,p=new ot,_=new ot,g=new G,v=new G;function b(P,k,H){f.fromArray(i,P*3),d.fromArray(i,k*3),m.fromArray(i,H*3),h.fromArray(a,P*2),p.fromArray(a,k*2),_.fromArray(a,H*2),d.sub(f),m.sub(f),p.sub(h),_.sub(h);const V=1/(p.x*_.y-_.x*p.y);!isFinite(V)||(g.copy(d).multiplyScalar(_.y).addScaledVector(m,-p.y).multiplyScalar(V),v.copy(m).multiplyScalar(p.x).addScaledVector(d,-_.x).multiplyScalar(V),c[P].add(g),c[k].add(g),c[H].add(g),u[P].add(v),u[k].add(v),u[H].add(v))}let w=this.groups;w.length===0&&(w=[{start:0,count:n.length}]);for(let P=0,k=w.length;P<k;++P){const H=w[P],V=H.start,F=H.count;for(let j=V,ce=V+F;j<ce;j+=3)b(n[j+0],n[j+1],n[j+2])}const y=new G,x=new G,E=new G,M=new G;function S(P){E.fromArray(s,P*3),M.copy(E);const k=c[P];y.copy(k),y.sub(E.multiplyScalar(E.dot(k))).normalize(),x.crossVectors(M,k);const V=x.dot(u[P])<0?-1:1;l[P*4]=y.x,l[P*4+1]=y.y,l[P*4+2]=y.z,l[P*4+3]=V}for(let P=0,k=w.length;P<k;++P){const H=w[P],V=H.start,F=H.count;for(let j=V,ce=V+F;j<ce;j+=3)S(n[j+0]),S(n[j+1]),S(n[j+2])}}computeVertexNormals(){const e=this.index,t=this.getAttribute("position");if(t!==void 0){let n=this.getAttribute("normal");if(n===void 0)n=new Cn(new Float32Array(t.count*3),3),this.setAttribute("normal",n);else for(let d=0,m=n.count;d<m;d++)n.setXYZ(d,0,0,0);const i=new G,s=new G,a=new G,o=new G,l=new G,c=new G,u=new G,f=new G;if(e)for(let d=0,m=e.count;d<m;d+=3){const h=e.getX(d+0),p=e.getX(d+1),_=e.getX(d+2);i.fromBufferAttribute(t,h),s.fromBufferAttribute(t,p),a.fromBufferAttribute(t,_),u.subVectors(a,s),f.subVectors(i,s),u.cross(f),o.fromBufferAttribute(n,h),l.fromBufferAttribute(n,p),c.fromBufferAttribute(n,_),o.add(u),l.add(u),c.add(u),n.setXYZ(h,o.x,o.y,o.z),n.setXYZ(p,l.x,l.y,l.z),n.setXYZ(_,c.x,c.y,c.z)}else for(let d=0,m=t.count;d<m;d+=3)i.fromBufferAttribute(t,d+0),s.fromBufferAttribute(t,d+1),a.fromBufferAttribute(t,d+2),u.subVectors(a,s),f.subVectors(i,s),u.cross(f),n.setXYZ(d+0,u.x,u.y,u.z),n.setXYZ(d+1,u.x,u.y,u.z),n.setXYZ(d+2,u.x,u.y,u.z);this.normalizeNormals(),n.needsUpdate=!0}}merge(){return console.error("THREE.BufferGeometry.merge() has been removed. Use THREE.BufferGeometryUtils.mergeBufferGeometries() instead."),this}normalizeNormals(){const e=this.attributes.normal;for(let t=0,n=e.count;t<n;t++)Nt.fromBufferAttribute(e,t),Nt.normalize(),e.setXYZ(t,Nt.x,Nt.y,Nt.z)}toNonIndexed(){function e(o,l){const c=o.array,u=o.itemSize,f=o.normalized,d=new c.constructor(l.length*u);let m=0,h=0;for(let p=0,_=l.length;p<_;p++){o.isInterleavedBufferAttribute?m=l[p]*o.data.stride+o.offset:m=l[p]*u;for(let g=0;g<u;g++)d[h++]=c[m++]}return new Cn(d,u,f)}if(this.index===null)return console.warn("THREE.BufferGeometry.toNonIndexed(): BufferGeometry is already non-indexed."),this;const t=new en,n=this.index.array,i=this.attributes;for(const o in i){const l=i[o],c=e(l,n);t.setAttribute(o,c)}const s=this.morphAttributes;for(const o in s){const l=[],c=s[o];for(let u=0,f=c.length;u<f;u++){const d=c[u],m=e(d,n);l.push(m)}t.morphAttributes[o]=l}t.morphTargetsRelative=this.morphTargetsRelative;const a=this.groups;for(let o=0,l=a.length;o<l;o++){const c=a[o];t.addGroup(c.start,c.count,c.materialIndex)}return t}toJSON(){const e={metadata:{version:4.5,type:"BufferGeometry",generator:"BufferGeometry.toJSON"}};if(e.uuid=this.uuid,e.type=this.type,this.name!==""&&(e.name=this.name),Object.keys(this.userData).length>0&&(e.userData=this.userData),this.parameters!==void 0){const l=this.parameters;for(const c in l)l[c]!==void 0&&(e[c]=l[c]);return e}e.data={attributes:{}};const t=this.index;t!==null&&(e.data.index={type:t.array.constructor.name,array:Array.prototype.slice.call(t.array)});const n=this.attributes;for(const l in n){const c=n[l];e.data.attributes[l]=c.toJSON(e.data)}const i={};let s=!1;for(const l in this.morphAttributes){const c=this.morphAttributes[l],u=[];for(let f=0,d=c.length;f<d;f++){const m=c[f];u.push(m.toJSON(e.data))}u.length>0&&(i[l]=u,s=!0)}s&&(e.data.morphAttributes=i,e.data.morphTargetsRelative=this.morphTargetsRelative);const a=this.groups;a.length>0&&(e.data.groups=JSON.parse(JSON.stringify(a)));const o=this.boundingSphere;return o!==null&&(e.data.boundingSphere={center:o.center.toArray(),radius:o.radius}),e}clone(){return new this.constructor().copy(this)}copy(e){this.index=null,this.attributes={},this.morphAttributes={},this.groups=[],this.boundingBox=null,this.boundingSphere=null;const t={};this.name=e.name;const n=e.index;n!==null&&this.setIndex(n.clone(t));const i=e.attributes;for(const c in i){const u=i[c];this.setAttribute(c,u.clone(t))}const s=e.morphAttributes;for(const c in s){const u=[],f=s[c];for(let d=0,m=f.length;d<m;d++)u.push(f[d].clone(t));this.morphAttributes[c]=u}this.morphTargetsRelative=e.morphTargetsRelative;const a=e.groups;for(let c=0,u=a.length;c<u;c++){const f=a[c];this.addGroup(f.start,f.count,f.materialIndex)}const o=e.boundingBox;o!==null&&(this.boundingBox=o.clone());const l=e.boundingSphere;return l!==null&&(this.boundingSphere=l.clone()),this.drawRange.start=e.drawRange.start,this.drawRange.count=e.drawRange.count,this.userData=e.userData,this}dispose(){this.dispatchEvent({type:"dispose"})}}const jl=new Et,wn=new Ma,Or=new _s,ql=new G,er=new G,tr=new G,nr=new G,Zs=new G,Ur=new G,Br=new ot,Vr=new ot,Gr=new ot,Ks=new G,Hr=new G;class Ce extends Ut{constructor(e=new en,t=new gs){super(),this.isMesh=!0,this.type="Mesh",this.geometry=e,this.material=t,this.updateMorphTargets()}copy(e,t){return super.copy(e,t),e.morphTargetInfluences!==void 0&&(this.morphTargetInfluences=e.morphTargetInfluences.slice()),e.morphTargetDictionary!==void 0&&(this.morphTargetDictionary=Object.assign({},e.morphTargetDictionary)),this.material=e.material,this.geometry=e.geometry,this}updateMorphTargets(){const t=this.geometry.morphAttributes,n=Object.keys(t);if(n.length>0){const i=t[n[0]];if(i!==void 0){this.morphTargetInfluences=[],this.morphTargetDictionary={};for(let s=0,a=i.length;s<a;s++){const o=i[s].name||String(s);this.morphTargetInfluences.push(0),this.morphTargetDictionary[o]=s}}}}getVertexPosition(e,t){const n=this.geometry,i=n.attributes.position,s=n.morphAttributes.position,a=n.morphTargetsRelative;t.fromBufferAttribute(i,e);const o=this.morphTargetInfluences;if(s&&o){Ur.set(0,0,0);for(let l=0,c=s.length;l<c;l++){const u=o[l],f=s[l];u!==0&&(Zs.fromBufferAttribute(f,e),a?Ur.addScaledVector(Zs,u):Ur.addScaledVector(Zs.sub(t),u))}t.add(Ur)}return this.isSkinnedMesh&&this.boneTransform(e,t),t}raycast(e,t){const n=this.geometry,i=this.material,s=this.matrixWorld;if(i===void 0||(n.boundingSphere===null&&n.computeBoundingSphere(),Or.copy(n.boundingSphere),Or.applyMatrix4(s),wn.copy(e.ray).recast(e.near),Or.containsPoint(wn.origin)===!1&&(wn.intersectSphere(Or,ql)===null||wn.origin.distanceToSquared(ql)>(e.far-e.near)**2))||(jl.copy(s).invert(),wn.copy(e.ray).applyMatrix4(jl),n.boundingBox!==null&&wn.intersectsBox(n.boundingBox)===!1))return;let a;const o=n.index,l=n.attributes.position,c=n.attributes.uv,u=n.attributes.uv2,f=n.groups,d=n.drawRange;if(o!==null)if(Array.isArray(i))for(let m=0,h=f.length;m<h;m++){const p=f[m],_=i[p.materialIndex],g=Math.max(p.start,d.start),v=Math.min(o.count,Math.min(p.start+p.count,d.start+d.count));for(let b=g,w=v;b<w;b+=3){const y=o.getX(b),x=o.getX(b+1),E=o.getX(b+2);a=Wr(this,_,e,wn,c,u,y,x,E),a&&(a.faceIndex=Math.floor(b/3),a.face.materialIndex=p.materialIndex,t.push(a))}}else{const m=Math.max(0,d.start),h=Math.min(o.count,d.start+d.count);for(let p=m,_=h;p<_;p+=3){const g=o.getX(p),v=o.getX(p+1),b=o.getX(p+2);a=Wr(this,i,e,wn,c,u,g,v,b),a&&(a.faceIndex=Math.floor(p/3),t.push(a))}}else if(l!==void 0)if(Array.isArray(i))for(let m=0,h=f.length;m<h;m++){const p=f[m],_=i[p.materialIndex],g=Math.max(p.start,d.start),v=Math.min(l.count,Math.min(p.start+p.count,d.start+d.count));for(let b=g,w=v;b<w;b+=3){const y=b,x=b+1,E=b+2;a=Wr(this,_,e,wn,c,u,y,x,E),a&&(a.faceIndex=Math.floor(b/3),a.face.materialIndex=p.materialIndex,t.push(a))}}else{const m=Math.max(0,d.start),h=Math.min(l.count,d.start+d.count);for(let p=m,_=h;p<_;p+=3){const g=p,v=p+1,b=p+2;a=Wr(this,i,e,wn,c,u,g,v,b),a&&(a.faceIndex=Math.floor(p/3),t.push(a))}}}}function O_(r,e,t,n,i,s,a,o){let l;if(e.side===an?l=n.intersectTriangle(a,s,i,!0,o):l=n.intersectTriangle(i,s,a,e.side===Zn,o),l===null)return null;Hr.copy(o),Hr.applyMatrix4(r.matrixWorld);const c=t.ray.origin.distanceTo(Hr);return c<t.near||c>t.far?null:{distance:c,point:Hr.clone(),object:r}}function Wr(r,e,t,n,i,s,a,o,l){r.getVertexPosition(a,er),r.getVertexPosition(o,tr),r.getVertexPosition(l,nr);const c=O_(r,e,t,n,er,tr,nr,Ks);if(c){i&&(Br.fromBufferAttribute(i,a),Vr.fromBufferAttribute(i,o),Gr.fromBufferAttribute(i,l),c.uv=In.getUV(Ks,er,tr,nr,Br,Vr,Gr,new ot)),s&&(Br.fromBufferAttribute(s,a),Vr.fromBufferAttribute(s,o),Gr.fromBufferAttribute(s,l),c.uv2=In.getUV(Ks,er,tr,nr,Br,Vr,Gr,new ot));const u={a,b:o,c:l,normal:new G,materialIndex:0};In.getNormal(er,tr,nr,u.normal),c.face=u}return c}class Tt extends en{constructor(e=1,t=1,n=1,i=1,s=1,a=1){super(),this.type="BoxGeometry",this.parameters={width:e,height:t,depth:n,widthSegments:i,heightSegments:s,depthSegments:a};const o=this;i=Math.floor(i),s=Math.floor(s),a=Math.floor(a);const l=[],c=[],u=[],f=[];let d=0,m=0;h("z","y","x",-1,-1,n,t,e,a,s,0),h("z","y","x",1,-1,n,t,-e,a,s,1),h("x","z","y",1,1,e,n,t,i,a,2),h("x","z","y",1,-1,e,n,-t,i,a,3),h("x","y","z",1,-1,e,t,n,i,s,4),h("x","y","z",-1,-1,e,t,-n,i,s,5),this.setIndex(l),this.setAttribute("position",new bt(c,3)),this.setAttribute("normal",new bt(u,3)),this.setAttribute("uv",new bt(f,2));function h(p,_,g,v,b,w,y,x,E,M,S){const P=w/E,k=y/M,H=w/2,V=y/2,F=x/2,j=E+1,ce=M+1;let de=0,te=0;const re=new G;for(let fe=0;fe<ce;fe++){const be=fe*k-V;for(let Y=0;Y<j;Y++){const ue=Y*P-H;re[p]=ue*v,re[_]=be*b,re[g]=F,c.push(re.x,re.y,re.z),re[p]=0,re[_]=0,re[g]=x>0?1:-1,u.push(re.x,re.y,re.z),f.push(Y/E),f.push(1-fe/M),de+=1}}for(let fe=0;fe<M;fe++)for(let be=0;be<E;be++){const Y=d+be+j*fe,ue=d+be+j*(fe+1),pe=d+(be+1)+j*(fe+1),W=d+(be+1)+j*fe;l.push(Y,ue,W),l.push(ue,pe,W),te+=6}o.addGroup(m,te,S),m+=te,d+=de}}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Tt(e.width,e.height,e.depth,e.widthSegments,e.heightSegments,e.depthSegments)}}function Wi(r){const e={};for(const t in r){e[t]={};for(const n in r[t]){const i=r[t][n];i&&(i.isColor||i.isMatrix3||i.isMatrix4||i.isVector2||i.isVector3||i.isVector4||i.isTexture||i.isQuaternion)?e[t][n]=i.clone():Array.isArray(i)?e[t][n]=i.slice():e[t][n]=i}}return e}function qt(r){const e={};for(let t=0;t<r.length;t++){const n=Wi(r[t]);for(const i in n)e[i]=n[i]}return e}function U_(r){const e=[];for(let t=0;t<r.length;t++)e.push(r[t].clone());return e}function ru(r){return r.getRenderTarget()===null&&r.outputEncoding===ht?xn:yr}const B_={clone:Wi,merge:qt};var V_=`void main() {
	gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
}`,G_=`void main() {
	gl_FragColor = vec4( 1.0, 0.0, 0.0, 1.0 );
}`;class mi extends Er{constructor(e){super(),this.isShaderMaterial=!0,this.type="ShaderMaterial",this.defines={},this.uniforms={},this.uniformsGroups=[],this.vertexShader=V_,this.fragmentShader=G_,this.linewidth=1,this.wireframe=!1,this.wireframeLinewidth=1,this.fog=!1,this.lights=!1,this.clipping=!1,this.extensions={derivatives:!1,fragDepth:!1,drawBuffers:!1,shaderTextureLOD:!1},this.defaultAttributeValues={color:[1,1,1],uv:[0,0],uv2:[0,0]},this.index0AttributeName=void 0,this.uniformsNeedUpdate=!1,this.glslVersion=null,e!==void 0&&this.setValues(e)}copy(e){return super.copy(e),this.fragmentShader=e.fragmentShader,this.vertexShader=e.vertexShader,this.uniforms=Wi(e.uniforms),this.uniformsGroups=U_(e.uniformsGroups),this.defines=Object.assign({},e.defines),this.wireframe=e.wireframe,this.wireframeLinewidth=e.wireframeLinewidth,this.fog=e.fog,this.lights=e.lights,this.clipping=e.clipping,this.extensions=Object.assign({},e.extensions),this.glslVersion=e.glslVersion,this}toJSON(e){const t=super.toJSON(e);t.glslVersion=this.glslVersion,t.uniforms={};for(const i in this.uniforms){const a=this.uniforms[i].value;a&&a.isTexture?t.uniforms[i]={type:"t",value:a.toJSON(e).uuid}:a&&a.isColor?t.uniforms[i]={type:"c",value:a.getHex()}:a&&a.isVector2?t.uniforms[i]={type:"v2",value:a.toArray()}:a&&a.isVector3?t.uniforms[i]={type:"v3",value:a.toArray()}:a&&a.isVector4?t.uniforms[i]={type:"v4",value:a.toArray()}:a&&a.isMatrix3?t.uniforms[i]={type:"m3",value:a.toArray()}:a&&a.isMatrix4?t.uniforms[i]={type:"m4",value:a.toArray()}:t.uniforms[i]={value:a}}Object.keys(this.defines).length>0&&(t.defines=this.defines),t.vertexShader=this.vertexShader,t.fragmentShader=this.fragmentShader;const n={};for(const i in this.extensions)this.extensions[i]===!0&&(n[i]=!0);return Object.keys(n).length>0&&(t.extensions=n),t}}class su extends Ut{constructor(){super(),this.isCamera=!0,this.type="Camera",this.matrixWorldInverse=new Et,this.projectionMatrix=new Et,this.projectionMatrixInverse=new Et}copy(e,t){return super.copy(e,t),this.matrixWorldInverse.copy(e.matrixWorldInverse),this.projectionMatrix.copy(e.projectionMatrix),this.projectionMatrixInverse.copy(e.projectionMatrixInverse),this}getWorldDirection(e){this.updateWorldMatrix(!0,!1);const t=this.matrixWorld.elements;return e.set(-t[8],-t[9],-t[10]).normalize()}updateMatrixWorld(e){super.updateMatrixWorld(e),this.matrixWorldInverse.copy(this.matrixWorld).invert()}updateWorldMatrix(e,t){super.updateWorldMatrix(e,t),this.matrixWorldInverse.copy(this.matrixWorld).invert()}clone(){return new this.constructor().copy(this)}}class dn extends su{constructor(e=50,t=1,n=.1,i=2e3){super(),this.isPerspectiveCamera=!0,this.type="PerspectiveCamera",this.fov=e,this.zoom=1,this.near=n,this.far=i,this.focus=10,this.aspect=t,this.view=null,this.filmGauge=35,this.filmOffset=0,this.updateProjectionMatrix()}copy(e,t){return super.copy(e,t),this.fov=e.fov,this.zoom=e.zoom,this.near=e.near,this.far=e.far,this.focus=e.focus,this.aspect=e.aspect,this.view=e.view===null?null:Object.assign({},e.view),this.filmGauge=e.filmGauge,this.filmOffset=e.filmOffset,this}setFocalLength(e){const t=.5*this.getFilmHeight()/e;this.fov=fs*2*Math.atan(t),this.updateProjectionMatrix()}getFocalLength(){const e=Math.tan(hr*.5*this.fov);return .5*this.getFilmHeight()/e}getEffectiveFOV(){return fs*2*Math.atan(Math.tan(hr*.5*this.fov)/this.zoom)}getFilmWidth(){return this.filmGauge*Math.min(this.aspect,1)}getFilmHeight(){return this.filmGauge/Math.max(this.aspect,1)}setViewOffset(e,t,n,i,s,a){this.aspect=e/t,this.view===null&&(this.view={enabled:!0,fullWidth:1,fullHeight:1,offsetX:0,offsetY:0,width:1,height:1}),this.view.enabled=!0,this.view.fullWidth=e,this.view.fullHeight=t,this.view.offsetX=n,this.view.offsetY=i,this.view.width=s,this.view.height=a,this.updateProjectionMatrix()}clearViewOffset(){this.view!==null&&(this.view.enabled=!1),this.updateProjectionMatrix()}updateProjectionMatrix(){const e=this.near;let t=e*Math.tan(hr*.5*this.fov)/this.zoom,n=2*t,i=this.aspect*n,s=-.5*i;const a=this.view;if(this.view!==null&&this.view.enabled){const l=a.fullWidth,c=a.fullHeight;s+=a.offsetX*i/l,t-=a.offsetY*n/c,i*=a.width/l,n*=a.height/c}const o=this.filmOffset;o!==0&&(s+=e*o/this.getFilmWidth()),this.projectionMatrix.makePerspective(s,s+i,t,t-n,e,this.far),this.projectionMatrixInverse.copy(this.projectionMatrix).invert()}toJSON(e){const t=super.toJSON(e);return t.object.fov=this.fov,t.object.zoom=this.zoom,t.object.near=this.near,t.object.far=this.far,t.object.focus=this.focus,t.object.aspect=this.aspect,this.view!==null&&(t.object.view=Object.assign({},this.view)),t.object.filmGauge=this.filmGauge,t.object.filmOffset=this.filmOffset,t}}const Ei=-90,Li=1;class H_ extends Ut{constructor(e,t,n){super(),this.type="CubeCamera",this.renderTarget=n;const i=new dn(Ei,Li,e,t);i.layers=this.layers,i.up.set(0,1,0),i.lookAt(1,0,0),this.add(i);const s=new dn(Ei,Li,e,t);s.layers=this.layers,s.up.set(0,1,0),s.lookAt(-1,0,0),this.add(s);const a=new dn(Ei,Li,e,t);a.layers=this.layers,a.up.set(0,0,-1),a.lookAt(0,1,0),this.add(a);const o=new dn(Ei,Li,e,t);o.layers=this.layers,o.up.set(0,0,1),o.lookAt(0,-1,0),this.add(o);const l=new dn(Ei,Li,e,t);l.layers=this.layers,l.up.set(0,1,0),l.lookAt(0,0,1),this.add(l);const c=new dn(Ei,Li,e,t);c.layers=this.layers,c.up.set(0,1,0),c.lookAt(0,0,-1),this.add(c)}update(e,t){this.parent===null&&this.updateMatrixWorld();const n=this.renderTarget,[i,s,a,o,l,c]=this.children,u=e.getRenderTarget(),f=e.toneMapping,d=e.xr.enabled;e.toneMapping=Un,e.xr.enabled=!1;const m=n.texture.generateMipmaps;n.texture.generateMipmaps=!1,e.setRenderTarget(n,0),e.render(t,i),e.setRenderTarget(n,1),e.render(t,s),e.setRenderTarget(n,2),e.render(t,a),e.setRenderTarget(n,3),e.render(t,o),e.setRenderTarget(n,4),e.render(t,l),n.texture.generateMipmaps=m,e.setRenderTarget(n,5),e.render(t,c),e.setRenderTarget(u),e.toneMapping=f,e.xr.enabled=d,n.texture.needsPMREMUpdate=!0}}class au extends on{constructor(e,t,n,i,s,a,o,l,c,u){e=e!==void 0?e:[],t=t!==void 0?t:Vi,super(e,t,n,i,s,a,o,l,c,u),this.isCubeTexture=!0,this.flipY=!1}get images(){return this.image}set images(e){this.image=e}}class W_ extends pi{constructor(e=1,t={}){super(e,e,t),this.isWebGLCubeRenderTarget=!0;const n={width:e,height:e,depth:1},i=[n,n,n,n,n,n];this.texture=new au(i,t.mapping,t.wrapS,t.wrapT,t.magFilter,t.minFilter,t.format,t.type,t.anisotropy,t.encoding),this.texture.isRenderTargetTexture=!0,this.texture.generateMipmaps=t.generateMipmaps!==void 0?t.generateMipmaps:!1,this.texture.minFilter=t.minFilter!==void 0?t.minFilter:fn}fromEquirectangularTexture(e,t){this.texture.type=t.type,this.texture.encoding=t.encoding,this.texture.generateMipmaps=t.generateMipmaps,this.texture.minFilter=t.minFilter,this.texture.magFilter=t.magFilter;const n={uniforms:{tEquirect:{value:null}},vertexShader:`

				varying vec3 vWorldDirection;

				vec3 transformDirection( in vec3 dir, in mat4 matrix ) {

					return normalize( ( matrix * vec4( dir, 0.0 ) ).xyz );

				}

				void main() {

					vWorldDirection = transformDirection( position, modelMatrix );

					#include <begin_vertex>
					#include <project_vertex>

				}
			`,fragmentShader:`

				uniform sampler2D tEquirect;

				varying vec3 vWorldDirection;

				#include <common>

				void main() {

					vec3 direction = normalize( vWorldDirection );

					vec2 sampleUV = equirectUv( direction );

					gl_FragColor = texture2D( tEquirect, sampleUV );

				}
			`},i=new Tt(5,5,5),s=new mi({name:"CubemapFromEquirect",uniforms:Wi(n.uniforms),vertexShader:n.vertexShader,fragmentShader:n.fragmentShader,side:an,blending:Yn});s.uniforms.tEquirect.value=t;const a=new Ce(i,s),o=t.minFilter;return t.minFilter===br&&(t.minFilter=fn),new H_(1,10,this).update(e,a),t.minFilter=o,a.geometry.dispose(),a.material.dispose(),this}clear(e,t,n,i){const s=e.getRenderTarget();for(let a=0;a<6;a++)e.setRenderTarget(this,a),e.clear(t,n,i);e.setRenderTarget(s)}}const Js=new G,X_=new G,j_=new Kt;class ii{constructor(e=new G(1,0,0),t=0){this.isPlane=!0,this.normal=e,this.constant=t}set(e,t){return this.normal.copy(e),this.constant=t,this}setComponents(e,t,n,i){return this.normal.set(e,t,n),this.constant=i,this}setFromNormalAndCoplanarPoint(e,t){return this.normal.copy(e),this.constant=-t.dot(this.normal),this}setFromCoplanarPoints(e,t,n){const i=Js.subVectors(n,t).cross(X_.subVectors(e,t)).normalize();return this.setFromNormalAndCoplanarPoint(i,e),this}copy(e){return this.normal.copy(e.normal),this.constant=e.constant,this}normalize(){const e=1/this.normal.length();return this.normal.multiplyScalar(e),this.constant*=e,this}negate(){return this.constant*=-1,this.normal.negate(),this}distanceToPoint(e){return this.normal.dot(e)+this.constant}distanceToSphere(e){return this.distanceToPoint(e.center)-e.radius}projectPoint(e,t){return t.copy(e).addScaledVector(this.normal,-this.distanceToPoint(e))}intersectLine(e,t){const n=e.delta(Js),i=this.normal.dot(n);if(i===0)return this.distanceToPoint(e.start)===0?t.copy(e.start):null;const s=-(e.start.dot(this.normal)+this.constant)/i;return s<0||s>1?null:t.copy(e.start).addScaledVector(n,s)}intersectsLine(e){const t=this.distanceToPoint(e.start),n=this.distanceToPoint(e.end);return t<0&&n>0||n<0&&t>0}intersectsBox(e){return e.intersectsPlane(this)}intersectsSphere(e){return e.intersectsPlane(this)}coplanarPoint(e){return e.copy(this.normal).multiplyScalar(-this.constant)}applyMatrix4(e,t){const n=t||j_.getNormalMatrix(e),i=this.coplanarPoint(Js).applyMatrix4(e),s=this.normal.applyMatrix3(n).normalize();return this.constant=-i.dot(s),this}translate(e){return this.constant-=e.dot(this.normal),this}equals(e){return e.normal.equals(this.normal)&&e.constant===this.constant}clone(){return new this.constructor().copy(this)}}const Pi=new _s,Xr=new G;class ou{constructor(e=new ii,t=new ii,n=new ii,i=new ii,s=new ii,a=new ii){this.planes=[e,t,n,i,s,a]}set(e,t,n,i,s,a){const o=this.planes;return o[0].copy(e),o[1].copy(t),o[2].copy(n),o[3].copy(i),o[4].copy(s),o[5].copy(a),this}copy(e){const t=this.planes;for(let n=0;n<6;n++)t[n].copy(e.planes[n]);return this}setFromProjectionMatrix(e){const t=this.planes,n=e.elements,i=n[0],s=n[1],a=n[2],o=n[3],l=n[4],c=n[5],u=n[6],f=n[7],d=n[8],m=n[9],h=n[10],p=n[11],_=n[12],g=n[13],v=n[14],b=n[15];return t[0].setComponents(o-i,f-l,p-d,b-_).normalize(),t[1].setComponents(o+i,f+l,p+d,b+_).normalize(),t[2].setComponents(o+s,f+c,p+m,b+g).normalize(),t[3].setComponents(o-s,f-c,p-m,b-g).normalize(),t[4].setComponents(o-a,f-u,p-h,b-v).normalize(),t[5].setComponents(o+a,f+u,p+h,b+v).normalize(),this}intersectsObject(e){const t=e.geometry;return t.boundingSphere===null&&t.computeBoundingSphere(),Pi.copy(t.boundingSphere).applyMatrix4(e.matrixWorld),this.intersectsSphere(Pi)}intersectsSprite(e){return Pi.center.set(0,0,0),Pi.radius=.7071067811865476,Pi.applyMatrix4(e.matrixWorld),this.intersectsSphere(Pi)}intersectsSphere(e){const t=this.planes,n=e.center,i=-e.radius;for(let s=0;s<6;s++)if(t[s].distanceToPoint(n)<i)return!1;return!0}intersectsBox(e){const t=this.planes;for(let n=0;n<6;n++){const i=t[n];if(Xr.x=i.normal.x>0?e.max.x:e.min.x,Xr.y=i.normal.y>0?e.max.y:e.min.y,Xr.z=i.normal.z>0?e.max.z:e.min.z,i.distanceToPoint(Xr)<0)return!1}return!0}containsPoint(e){const t=this.planes;for(let n=0;n<6;n++)if(t[n].distanceToPoint(e)<0)return!1;return!0}clone(){return new this.constructor().copy(this)}}function lu(){let r=null,e=!1,t=null,n=null;function i(s,a){t(s,a),n=r.requestAnimationFrame(i)}return{start:function(){e!==!0&&t!==null&&(n=r.requestAnimationFrame(i),e=!0)},stop:function(){r.cancelAnimationFrame(n),e=!1},setAnimationLoop:function(s){t=s},setContext:function(s){r=s}}}function q_(r,e){const t=e.isWebGL2,n=new WeakMap;function i(c,u){const f=c.array,d=c.usage,m=r.createBuffer();r.bindBuffer(u,m),r.bufferData(u,f,d),c.onUploadCallback();let h;if(f instanceof Float32Array)h=5126;else if(f instanceof Uint16Array)if(c.isFloat16BufferAttribute)if(t)h=5131;else throw new Error("THREE.WebGLAttributes: Usage of Float16BufferAttribute requires WebGL2.");else h=5123;else if(f instanceof Int16Array)h=5122;else if(f instanceof Uint32Array)h=5125;else if(f instanceof Int32Array)h=5124;else if(f instanceof Int8Array)h=5120;else if(f instanceof Uint8Array)h=5121;else if(f instanceof Uint8ClampedArray)h=5121;else throw new Error("THREE.WebGLAttributes: Unsupported buffer data format: "+f);return{buffer:m,type:h,bytesPerElement:f.BYTES_PER_ELEMENT,version:c.version}}function s(c,u,f){const d=u.array,m=u.updateRange;r.bindBuffer(f,c),m.count===-1?r.bufferSubData(f,0,d):(t?r.bufferSubData(f,m.offset*d.BYTES_PER_ELEMENT,d,m.offset,m.count):r.bufferSubData(f,m.offset*d.BYTES_PER_ELEMENT,d.subarray(m.offset,m.offset+m.count)),m.count=-1),u.onUploadCallback()}function a(c){return c.isInterleavedBufferAttribute&&(c=c.data),n.get(c)}function o(c){c.isInterleavedBufferAttribute&&(c=c.data);const u=n.get(c);u&&(r.deleteBuffer(u.buffer),n.delete(c))}function l(c,u){if(c.isGLBufferAttribute){const d=n.get(c);(!d||d.version<c.version)&&n.set(c,{buffer:c.buffer,type:c.type,bytesPerElement:c.elementSize,version:c.version});return}c.isInterleavedBufferAttribute&&(c=c.data);const f=n.get(c);f===void 0?n.set(c,i(c,u)):f.version<c.version&&(s(f.buffer,c,u),f.version=c.version)}return{get:a,remove:o,update:l}}class bs extends en{constructor(e=1,t=1,n=1,i=1){super(),this.type="PlaneGeometry",this.parameters={width:e,height:t,widthSegments:n,heightSegments:i};const s=e/2,a=t/2,o=Math.floor(n),l=Math.floor(i),c=o+1,u=l+1,f=e/o,d=t/l,m=[],h=[],p=[],_=[];for(let g=0;g<u;g++){const v=g*d-a;for(let b=0;b<c;b++){const w=b*f-s;h.push(w,-v,0),p.push(0,0,1),_.push(b/o),_.push(1-g/l)}}for(let g=0;g<l;g++)for(let v=0;v<o;v++){const b=v+c*g,w=v+c*(g+1),y=v+1+c*(g+1),x=v+1+c*g;m.push(b,w,x),m.push(w,y,x)}this.setIndex(m),this.setAttribute("position",new bt(h,3)),this.setAttribute("normal",new bt(p,3)),this.setAttribute("uv",new bt(_,2))}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new bs(e.width,e.height,e.widthSegments,e.heightSegments)}}var Y_=`#ifdef USE_ALPHAMAP
	diffuseColor.a *= texture2D( alphaMap, vUv ).g;
#endif`,Z_=`#ifdef USE_ALPHAMAP
	uniform sampler2D alphaMap;
#endif`,K_=`#ifdef USE_ALPHATEST
	if ( diffuseColor.a < alphaTest ) discard;
#endif`,J_=`#ifdef USE_ALPHATEST
	uniform float alphaTest;
#endif`,Q_=`#ifdef USE_AOMAP
	float ambientOcclusion = ( texture2D( aoMap, vUv2 ).r - 1.0 ) * aoMapIntensity + 1.0;
	reflectedLight.indirectDiffuse *= ambientOcclusion;
	#if defined( USE_ENVMAP ) && defined( STANDARD )
		float dotNV = saturate( dot( geometry.normal, geometry.viewDir ) );
		reflectedLight.indirectSpecular *= computeSpecularOcclusion( dotNV, ambientOcclusion, material.roughness );
	#endif
#endif`,$_=`#ifdef USE_AOMAP
	uniform sampler2D aoMap;
	uniform float aoMapIntensity;
#endif`,eg="vec3 transformed = vec3( position );",tg=`vec3 objectNormal = vec3( normal );
#ifdef USE_TANGENT
	vec3 objectTangent = vec3( tangent.xyz );
#endif`,ng=`vec3 BRDF_Lambert( const in vec3 diffuseColor ) {
	return RECIPROCAL_PI * diffuseColor;
}
vec3 F_Schlick( const in vec3 f0, const in float f90, const in float dotVH ) {
	float fresnel = exp2( ( - 5.55473 * dotVH - 6.98316 ) * dotVH );
	return f0 * ( 1.0 - fresnel ) + ( f90 * fresnel );
}
float F_Schlick( const in float f0, const in float f90, const in float dotVH ) {
	float fresnel = exp2( ( - 5.55473 * dotVH - 6.98316 ) * dotVH );
	return f0 * ( 1.0 - fresnel ) + ( f90 * fresnel );
}
vec3 Schlick_to_F0( const in vec3 f, const in float f90, const in float dotVH ) {
    float x = clamp( 1.0 - dotVH, 0.0, 1.0 );
    float x2 = x * x;
    float x5 = clamp( x * x2 * x2, 0.0, 0.9999 );
    return ( f - vec3( f90 ) * x5 ) / ( 1.0 - x5 );
}
float V_GGX_SmithCorrelated( const in float alpha, const in float dotNL, const in float dotNV ) {
	float a2 = pow2( alpha );
	float gv = dotNL * sqrt( a2 + ( 1.0 - a2 ) * pow2( dotNV ) );
	float gl = dotNV * sqrt( a2 + ( 1.0 - a2 ) * pow2( dotNL ) );
	return 0.5 / max( gv + gl, EPSILON );
}
float D_GGX( const in float alpha, const in float dotNH ) {
	float a2 = pow2( alpha );
	float denom = pow2( dotNH ) * ( a2 - 1.0 ) + 1.0;
	return RECIPROCAL_PI * a2 / pow2( denom );
}
vec3 BRDF_GGX( const in vec3 lightDir, const in vec3 viewDir, const in vec3 normal, const in vec3 f0, const in float f90, const in float roughness ) {
	float alpha = pow2( roughness );
	vec3 halfDir = normalize( lightDir + viewDir );
	float dotNL = saturate( dot( normal, lightDir ) );
	float dotNV = saturate( dot( normal, viewDir ) );
	float dotNH = saturate( dot( normal, halfDir ) );
	float dotVH = saturate( dot( viewDir, halfDir ) );
	vec3 F = F_Schlick( f0, f90, dotVH );
	float V = V_GGX_SmithCorrelated( alpha, dotNL, dotNV );
	float D = D_GGX( alpha, dotNH );
	return F * ( V * D );
}
#ifdef USE_IRIDESCENCE
	vec3 BRDF_GGX_Iridescence( const in vec3 lightDir, const in vec3 viewDir, const in vec3 normal, const in vec3 f0, const in float f90, const in float iridescence, const in vec3 iridescenceFresnel, const in float roughness ) {
		float alpha = pow2( roughness );
		vec3 halfDir = normalize( lightDir + viewDir );
		float dotNL = saturate( dot( normal, lightDir ) );
		float dotNV = saturate( dot( normal, viewDir ) );
		float dotNH = saturate( dot( normal, halfDir ) );
		float dotVH = saturate( dot( viewDir, halfDir ) );
		vec3 F = mix( F_Schlick( f0, f90, dotVH ), iridescenceFresnel, iridescence );
		float V = V_GGX_SmithCorrelated( alpha, dotNL, dotNV );
		float D = D_GGX( alpha, dotNH );
		return F * ( V * D );
	}
#endif
vec2 LTC_Uv( const in vec3 N, const in vec3 V, const in float roughness ) {
	const float LUT_SIZE = 64.0;
	const float LUT_SCALE = ( LUT_SIZE - 1.0 ) / LUT_SIZE;
	const float LUT_BIAS = 0.5 / LUT_SIZE;
	float dotNV = saturate( dot( N, V ) );
	vec2 uv = vec2( roughness, sqrt( 1.0 - dotNV ) );
	uv = uv * LUT_SCALE + LUT_BIAS;
	return uv;
}
float LTC_ClippedSphereFormFactor( const in vec3 f ) {
	float l = length( f );
	return max( ( l * l + f.z ) / ( l + 1.0 ), 0.0 );
}
vec3 LTC_EdgeVectorFormFactor( const in vec3 v1, const in vec3 v2 ) {
	float x = dot( v1, v2 );
	float y = abs( x );
	float a = 0.8543985 + ( 0.4965155 + 0.0145206 * y ) * y;
	float b = 3.4175940 + ( 4.1616724 + y ) * y;
	float v = a / b;
	float theta_sintheta = ( x > 0.0 ) ? v : 0.5 * inversesqrt( max( 1.0 - x * x, 1e-7 ) ) - v;
	return cross( v1, v2 ) * theta_sintheta;
}
vec3 LTC_Evaluate( const in vec3 N, const in vec3 V, const in vec3 P, const in mat3 mInv, const in vec3 rectCoords[ 4 ] ) {
	vec3 v1 = rectCoords[ 1 ] - rectCoords[ 0 ];
	vec3 v2 = rectCoords[ 3 ] - rectCoords[ 0 ];
	vec3 lightNormal = cross( v1, v2 );
	if( dot( lightNormal, P - rectCoords[ 0 ] ) < 0.0 ) return vec3( 0.0 );
	vec3 T1, T2;
	T1 = normalize( V - N * dot( V, N ) );
	T2 = - cross( N, T1 );
	mat3 mat = mInv * transposeMat3( mat3( T1, T2, N ) );
	vec3 coords[ 4 ];
	coords[ 0 ] = mat * ( rectCoords[ 0 ] - P );
	coords[ 1 ] = mat * ( rectCoords[ 1 ] - P );
	coords[ 2 ] = mat * ( rectCoords[ 2 ] - P );
	coords[ 3 ] = mat * ( rectCoords[ 3 ] - P );
	coords[ 0 ] = normalize( coords[ 0 ] );
	coords[ 1 ] = normalize( coords[ 1 ] );
	coords[ 2 ] = normalize( coords[ 2 ] );
	coords[ 3 ] = normalize( coords[ 3 ] );
	vec3 vectorFormFactor = vec3( 0.0 );
	vectorFormFactor += LTC_EdgeVectorFormFactor( coords[ 0 ], coords[ 1 ] );
	vectorFormFactor += LTC_EdgeVectorFormFactor( coords[ 1 ], coords[ 2 ] );
	vectorFormFactor += LTC_EdgeVectorFormFactor( coords[ 2 ], coords[ 3 ] );
	vectorFormFactor += LTC_EdgeVectorFormFactor( coords[ 3 ], coords[ 0 ] );
	float result = LTC_ClippedSphereFormFactor( vectorFormFactor );
	return vec3( result );
}
float G_BlinnPhong_Implicit( ) {
	return 0.25;
}
float D_BlinnPhong( const in float shininess, const in float dotNH ) {
	return RECIPROCAL_PI * ( shininess * 0.5 + 1.0 ) * pow( dotNH, shininess );
}
vec3 BRDF_BlinnPhong( const in vec3 lightDir, const in vec3 viewDir, const in vec3 normal, const in vec3 specularColor, const in float shininess ) {
	vec3 halfDir = normalize( lightDir + viewDir );
	float dotNH = saturate( dot( normal, halfDir ) );
	float dotVH = saturate( dot( viewDir, halfDir ) );
	vec3 F = F_Schlick( specularColor, 1.0, dotVH );
	float G = G_BlinnPhong_Implicit( );
	float D = D_BlinnPhong( shininess, dotNH );
	return F * ( G * D );
}
#if defined( USE_SHEEN )
float D_Charlie( float roughness, float dotNH ) {
	float alpha = pow2( roughness );
	float invAlpha = 1.0 / alpha;
	float cos2h = dotNH * dotNH;
	float sin2h = max( 1.0 - cos2h, 0.0078125 );
	return ( 2.0 + invAlpha ) * pow( sin2h, invAlpha * 0.5 ) / ( 2.0 * PI );
}
float V_Neubelt( float dotNV, float dotNL ) {
	return saturate( 1.0 / ( 4.0 * ( dotNL + dotNV - dotNL * dotNV ) ) );
}
vec3 BRDF_Sheen( const in vec3 lightDir, const in vec3 viewDir, const in vec3 normal, vec3 sheenColor, const in float sheenRoughness ) {
	vec3 halfDir = normalize( lightDir + viewDir );
	float dotNL = saturate( dot( normal, lightDir ) );
	float dotNV = saturate( dot( normal, viewDir ) );
	float dotNH = saturate( dot( normal, halfDir ) );
	float D = D_Charlie( sheenRoughness, dotNH );
	float V = V_Neubelt( dotNV, dotNL );
	return sheenColor * ( D * V );
}
#endif`,ig=`#ifdef USE_IRIDESCENCE
	const mat3 XYZ_TO_REC709 = mat3(
		 3.2404542, -0.9692660,  0.0556434,
		-1.5371385,  1.8760108, -0.2040259,
		-0.4985314,  0.0415560,  1.0572252
	);
	vec3 Fresnel0ToIor( vec3 fresnel0 ) {
		vec3 sqrtF0 = sqrt( fresnel0 );
		return ( vec3( 1.0 ) + sqrtF0 ) / ( vec3( 1.0 ) - sqrtF0 );
	}
	vec3 IorToFresnel0( vec3 transmittedIor, float incidentIor ) {
		return pow2( ( transmittedIor - vec3( incidentIor ) ) / ( transmittedIor + vec3( incidentIor ) ) );
	}
	float IorToFresnel0( float transmittedIor, float incidentIor ) {
		return pow2( ( transmittedIor - incidentIor ) / ( transmittedIor + incidentIor ));
	}
	vec3 evalSensitivity( float OPD, vec3 shift ) {
		float phase = 2.0 * PI * OPD * 1.0e-9;
		vec3 val = vec3( 5.4856e-13, 4.4201e-13, 5.2481e-13 );
		vec3 pos = vec3( 1.6810e+06, 1.7953e+06, 2.2084e+06 );
		vec3 var = vec3( 4.3278e+09, 9.3046e+09, 6.6121e+09 );
		vec3 xyz = val * sqrt( 2.0 * PI * var ) * cos( pos * phase + shift ) * exp( - pow2( phase ) * var );
		xyz.x += 9.7470e-14 * sqrt( 2.0 * PI * 4.5282e+09 ) * cos( 2.2399e+06 * phase + shift[ 0 ] ) * exp( - 4.5282e+09 * pow2( phase ) );
		xyz /= 1.0685e-7;
		vec3 rgb = XYZ_TO_REC709 * xyz;
		return rgb;
	}
	vec3 evalIridescence( float outsideIOR, float eta2, float cosTheta1, float thinFilmThickness, vec3 baseF0 ) {
		vec3 I;
		float iridescenceIOR = mix( outsideIOR, eta2, smoothstep( 0.0, 0.03, thinFilmThickness ) );
		float sinTheta2Sq = pow2( outsideIOR / iridescenceIOR ) * ( 1.0 - pow2( cosTheta1 ) );
		float cosTheta2Sq = 1.0 - sinTheta2Sq;
		if ( cosTheta2Sq < 0.0 ) {
			 return vec3( 1.0 );
		}
		float cosTheta2 = sqrt( cosTheta2Sq );
		float R0 = IorToFresnel0( iridescenceIOR, outsideIOR );
		float R12 = F_Schlick( R0, 1.0, cosTheta1 );
		float R21 = R12;
		float T121 = 1.0 - R12;
		float phi12 = 0.0;
		if ( iridescenceIOR < outsideIOR ) phi12 = PI;
		float phi21 = PI - phi12;
		vec3 baseIOR = Fresnel0ToIor( clamp( baseF0, 0.0, 0.9999 ) );		vec3 R1 = IorToFresnel0( baseIOR, iridescenceIOR );
		vec3 R23 = F_Schlick( R1, 1.0, cosTheta2 );
		vec3 phi23 = vec3( 0.0 );
		if ( baseIOR[ 0 ] < iridescenceIOR ) phi23[ 0 ] = PI;
		if ( baseIOR[ 1 ] < iridescenceIOR ) phi23[ 1 ] = PI;
		if ( baseIOR[ 2 ] < iridescenceIOR ) phi23[ 2 ] = PI;
		float OPD = 2.0 * iridescenceIOR * thinFilmThickness * cosTheta2;
		vec3 phi = vec3( phi21 ) + phi23;
		vec3 R123 = clamp( R12 * R23, 1e-5, 0.9999 );
		vec3 r123 = sqrt( R123 );
		vec3 Rs = pow2( T121 ) * R23 / ( vec3( 1.0 ) - R123 );
		vec3 C0 = R12 + Rs;
		I = C0;
		vec3 Cm = Rs - T121;
		for ( int m = 1; m <= 2; ++ m ) {
			Cm *= r123;
			vec3 Sm = 2.0 * evalSensitivity( float( m ) * OPD, float( m ) * phi );
			I += Cm * Sm;
		}
		return max( I, vec3( 0.0 ) );
	}
#endif`,rg=`#ifdef USE_BUMPMAP
	uniform sampler2D bumpMap;
	uniform float bumpScale;
	vec2 dHdxy_fwd() {
		vec2 dSTdx = dFdx( vUv );
		vec2 dSTdy = dFdy( vUv );
		float Hll = bumpScale * texture2D( bumpMap, vUv ).x;
		float dBx = bumpScale * texture2D( bumpMap, vUv + dSTdx ).x - Hll;
		float dBy = bumpScale * texture2D( bumpMap, vUv + dSTdy ).x - Hll;
		return vec2( dBx, dBy );
	}
	vec3 perturbNormalArb( vec3 surf_pos, vec3 surf_norm, vec2 dHdxy, float faceDirection ) {
		vec3 vSigmaX = dFdx( surf_pos.xyz );
		vec3 vSigmaY = dFdy( surf_pos.xyz );
		vec3 vN = surf_norm;
		vec3 R1 = cross( vSigmaY, vN );
		vec3 R2 = cross( vN, vSigmaX );
		float fDet = dot( vSigmaX, R1 ) * faceDirection;
		vec3 vGrad = sign( fDet ) * ( dHdxy.x * R1 + dHdxy.y * R2 );
		return normalize( abs( fDet ) * surf_norm - vGrad );
	}
#endif`,sg=`#if NUM_CLIPPING_PLANES > 0
	vec4 plane;
	#pragma unroll_loop_start
	for ( int i = 0; i < UNION_CLIPPING_PLANES; i ++ ) {
		plane = clippingPlanes[ i ];
		if ( dot( vClipPosition, plane.xyz ) > plane.w ) discard;
	}
	#pragma unroll_loop_end
	#if UNION_CLIPPING_PLANES < NUM_CLIPPING_PLANES
		bool clipped = true;
		#pragma unroll_loop_start
		for ( int i = UNION_CLIPPING_PLANES; i < NUM_CLIPPING_PLANES; i ++ ) {
			plane = clippingPlanes[ i ];
			clipped = ( dot( vClipPosition, plane.xyz ) > plane.w ) && clipped;
		}
		#pragma unroll_loop_end
		if ( clipped ) discard;
	#endif
#endif`,ag=`#if NUM_CLIPPING_PLANES > 0
	varying vec3 vClipPosition;
	uniform vec4 clippingPlanes[ NUM_CLIPPING_PLANES ];
#endif`,og=`#if NUM_CLIPPING_PLANES > 0
	varying vec3 vClipPosition;
#endif`,lg=`#if NUM_CLIPPING_PLANES > 0
	vClipPosition = - mvPosition.xyz;
#endif`,cg=`#if defined( USE_COLOR_ALPHA )
	diffuseColor *= vColor;
#elif defined( USE_COLOR )
	diffuseColor.rgb *= vColor;
#endif`,ug=`#if defined( USE_COLOR_ALPHA )
	varying vec4 vColor;
#elif defined( USE_COLOR )
	varying vec3 vColor;
#endif`,fg=`#if defined( USE_COLOR_ALPHA )
	varying vec4 vColor;
#elif defined( USE_COLOR ) || defined( USE_INSTANCING_COLOR )
	varying vec3 vColor;
#endif`,dg=`#if defined( USE_COLOR_ALPHA )
	vColor = vec4( 1.0 );
#elif defined( USE_COLOR ) || defined( USE_INSTANCING_COLOR )
	vColor = vec3( 1.0 );
#endif
#ifdef USE_COLOR
	vColor *= color;
#endif
#ifdef USE_INSTANCING_COLOR
	vColor.xyz *= instanceColor.xyz;
#endif`,hg=`#define PI 3.141592653589793
#define PI2 6.283185307179586
#define PI_HALF 1.5707963267948966
#define RECIPROCAL_PI 0.3183098861837907
#define RECIPROCAL_PI2 0.15915494309189535
#define EPSILON 1e-6
#ifndef saturate
#define saturate( a ) clamp( a, 0.0, 1.0 )
#endif
#define whiteComplement( a ) ( 1.0 - saturate( a ) )
float pow2( const in float x ) { return x*x; }
vec3 pow2( const in vec3 x ) { return x*x; }
float pow3( const in float x ) { return x*x*x; }
float pow4( const in float x ) { float x2 = x*x; return x2*x2; }
float max3( const in vec3 v ) { return max( max( v.x, v.y ), v.z ); }
float average( const in vec3 v ) { return dot( v, vec3( 0.3333333 ) ); }
highp float rand( const in vec2 uv ) {
	const highp float a = 12.9898, b = 78.233, c = 43758.5453;
	highp float dt = dot( uv.xy, vec2( a,b ) ), sn = mod( dt, PI );
	return fract( sin( sn ) * c );
}
#ifdef HIGH_PRECISION
	float precisionSafeLength( vec3 v ) { return length( v ); }
#else
	float precisionSafeLength( vec3 v ) {
		float maxComponent = max3( abs( v ) );
		return length( v / maxComponent ) * maxComponent;
	}
#endif
struct IncidentLight {
	vec3 color;
	vec3 direction;
	bool visible;
};
struct ReflectedLight {
	vec3 directDiffuse;
	vec3 directSpecular;
	vec3 indirectDiffuse;
	vec3 indirectSpecular;
};
struct GeometricContext {
	vec3 position;
	vec3 normal;
	vec3 viewDir;
#ifdef USE_CLEARCOAT
	vec3 clearcoatNormal;
#endif
};
vec3 transformDirection( in vec3 dir, in mat4 matrix ) {
	return normalize( ( matrix * vec4( dir, 0.0 ) ).xyz );
}
vec3 inverseTransformDirection( in vec3 dir, in mat4 matrix ) {
	return normalize( ( vec4( dir, 0.0 ) * matrix ).xyz );
}
mat3 transposeMat3( const in mat3 m ) {
	mat3 tmp;
	tmp[ 0 ] = vec3( m[ 0 ].x, m[ 1 ].x, m[ 2 ].x );
	tmp[ 1 ] = vec3( m[ 0 ].y, m[ 1 ].y, m[ 2 ].y );
	tmp[ 2 ] = vec3( m[ 0 ].z, m[ 1 ].z, m[ 2 ].z );
	return tmp;
}
float luminance( const in vec3 rgb ) {
	const vec3 weights = vec3( 0.2126729, 0.7151522, 0.0721750 );
	return dot( weights, rgb );
}
bool isPerspectiveMatrix( mat4 m ) {
	return m[ 2 ][ 3 ] == - 1.0;
}
vec2 equirectUv( in vec3 dir ) {
	float u = atan( dir.z, dir.x ) * RECIPROCAL_PI2 + 0.5;
	float v = asin( clamp( dir.y, - 1.0, 1.0 ) ) * RECIPROCAL_PI + 0.5;
	return vec2( u, v );
}`,pg=`#ifdef ENVMAP_TYPE_CUBE_UV
	#define cubeUV_minMipLevel 4.0
	#define cubeUV_minTileSize 16.0
	float getFace( vec3 direction ) {
		vec3 absDirection = abs( direction );
		float face = - 1.0;
		if ( absDirection.x > absDirection.z ) {
			if ( absDirection.x > absDirection.y )
				face = direction.x > 0.0 ? 0.0 : 3.0;
			else
				face = direction.y > 0.0 ? 1.0 : 4.0;
		} else {
			if ( absDirection.z > absDirection.y )
				face = direction.z > 0.0 ? 2.0 : 5.0;
			else
				face = direction.y > 0.0 ? 1.0 : 4.0;
		}
		return face;
	}
	vec2 getUV( vec3 direction, float face ) {
		vec2 uv;
		if ( face == 0.0 ) {
			uv = vec2( direction.z, direction.y ) / abs( direction.x );
		} else if ( face == 1.0 ) {
			uv = vec2( - direction.x, - direction.z ) / abs( direction.y );
		} else if ( face == 2.0 ) {
			uv = vec2( - direction.x, direction.y ) / abs( direction.z );
		} else if ( face == 3.0 ) {
			uv = vec2( - direction.z, direction.y ) / abs( direction.x );
		} else if ( face == 4.0 ) {
			uv = vec2( - direction.x, direction.z ) / abs( direction.y );
		} else {
			uv = vec2( direction.x, direction.y ) / abs( direction.z );
		}
		return 0.5 * ( uv + 1.0 );
	}
	vec3 bilinearCubeUV( sampler2D envMap, vec3 direction, float mipInt ) {
		float face = getFace( direction );
		float filterInt = max( cubeUV_minMipLevel - mipInt, 0.0 );
		mipInt = max( mipInt, cubeUV_minMipLevel );
		float faceSize = exp2( mipInt );
		highp vec2 uv = getUV( direction, face ) * ( faceSize - 2.0 ) + 1.0;
		if ( face > 2.0 ) {
			uv.y += faceSize;
			face -= 3.0;
		}
		uv.x += face * faceSize;
		uv.x += filterInt * 3.0 * cubeUV_minTileSize;
		uv.y += 4.0 * ( exp2( CUBEUV_MAX_MIP ) - faceSize );
		uv.x *= CUBEUV_TEXEL_WIDTH;
		uv.y *= CUBEUV_TEXEL_HEIGHT;
		#ifdef texture2DGradEXT
			return texture2DGradEXT( envMap, uv, vec2( 0.0 ), vec2( 0.0 ) ).rgb;
		#else
			return texture2D( envMap, uv ).rgb;
		#endif
	}
	#define cubeUV_r0 1.0
	#define cubeUV_v0 0.339
	#define cubeUV_m0 - 2.0
	#define cubeUV_r1 0.8
	#define cubeUV_v1 0.276
	#define cubeUV_m1 - 1.0
	#define cubeUV_r4 0.4
	#define cubeUV_v4 0.046
	#define cubeUV_m4 2.0
	#define cubeUV_r5 0.305
	#define cubeUV_v5 0.016
	#define cubeUV_m5 3.0
	#define cubeUV_r6 0.21
	#define cubeUV_v6 0.0038
	#define cubeUV_m6 4.0
	float roughnessToMip( float roughness ) {
		float mip = 0.0;
		if ( roughness >= cubeUV_r1 ) {
			mip = ( cubeUV_r0 - roughness ) * ( cubeUV_m1 - cubeUV_m0 ) / ( cubeUV_r0 - cubeUV_r1 ) + cubeUV_m0;
		} else if ( roughness >= cubeUV_r4 ) {
			mip = ( cubeUV_r1 - roughness ) * ( cubeUV_m4 - cubeUV_m1 ) / ( cubeUV_r1 - cubeUV_r4 ) + cubeUV_m1;
		} else if ( roughness >= cubeUV_r5 ) {
			mip = ( cubeUV_r4 - roughness ) * ( cubeUV_m5 - cubeUV_m4 ) / ( cubeUV_r4 - cubeUV_r5 ) + cubeUV_m4;
		} else if ( roughness >= cubeUV_r6 ) {
			mip = ( cubeUV_r5 - roughness ) * ( cubeUV_m6 - cubeUV_m5 ) / ( cubeUV_r5 - cubeUV_r6 ) + cubeUV_m5;
		} else {
			mip = - 2.0 * log2( 1.16 * roughness );		}
		return mip;
	}
	vec4 textureCubeUV( sampler2D envMap, vec3 sampleDir, float roughness ) {
		float mip = clamp( roughnessToMip( roughness ), cubeUV_m0, CUBEUV_MAX_MIP );
		float mipF = fract( mip );
		float mipInt = floor( mip );
		vec3 color0 = bilinearCubeUV( envMap, sampleDir, mipInt );
		if ( mipF == 0.0 ) {
			return vec4( color0, 1.0 );
		} else {
			vec3 color1 = bilinearCubeUV( envMap, sampleDir, mipInt + 1.0 );
			return vec4( mix( color0, color1, mipF ), 1.0 );
		}
	}
#endif`,mg=`vec3 transformedNormal = objectNormal;
#ifdef USE_INSTANCING
	mat3 m = mat3( instanceMatrix );
	transformedNormal /= vec3( dot( m[ 0 ], m[ 0 ] ), dot( m[ 1 ], m[ 1 ] ), dot( m[ 2 ], m[ 2 ] ) );
	transformedNormal = m * transformedNormal;
#endif
transformedNormal = normalMatrix * transformedNormal;
#ifdef FLIP_SIDED
	transformedNormal = - transformedNormal;
#endif
#ifdef USE_TANGENT
	vec3 transformedTangent = ( modelViewMatrix * vec4( objectTangent, 0.0 ) ).xyz;
	#ifdef FLIP_SIDED
		transformedTangent = - transformedTangent;
	#endif
#endif`,_g=`#ifdef USE_DISPLACEMENTMAP
	uniform sampler2D displacementMap;
	uniform float displacementScale;
	uniform float displacementBias;
#endif`,gg=`#ifdef USE_DISPLACEMENTMAP
	transformed += normalize( objectNormal ) * ( texture2D( displacementMap, vUv ).x * displacementScale + displacementBias );
#endif`,bg=`#ifdef USE_EMISSIVEMAP
	vec4 emissiveColor = texture2D( emissiveMap, vUv );
	totalEmissiveRadiance *= emissiveColor.rgb;
#endif`,vg=`#ifdef USE_EMISSIVEMAP
	uniform sampler2D emissiveMap;
#endif`,yg="gl_FragColor = linearToOutputTexel( gl_FragColor );",wg=`vec4 LinearToLinear( in vec4 value ) {
	return value;
}
vec4 LinearTosRGB( in vec4 value ) {
	return vec4( mix( pow( value.rgb, vec3( 0.41666 ) ) * 1.055 - vec3( 0.055 ), value.rgb * 12.92, vec3( lessThanEqual( value.rgb, vec3( 0.0031308 ) ) ) ), value.a );
}`,Mg=`#ifdef USE_ENVMAP
	#ifdef ENV_WORLDPOS
		vec3 cameraToFrag;
		if ( isOrthographic ) {
			cameraToFrag = normalize( vec3( - viewMatrix[ 0 ][ 2 ], - viewMatrix[ 1 ][ 2 ], - viewMatrix[ 2 ][ 2 ] ) );
		} else {
			cameraToFrag = normalize( vWorldPosition - cameraPosition );
		}
		vec3 worldNormal = inverseTransformDirection( normal, viewMatrix );
		#ifdef ENVMAP_MODE_REFLECTION
			vec3 reflectVec = reflect( cameraToFrag, worldNormal );
		#else
			vec3 reflectVec = refract( cameraToFrag, worldNormal, refractionRatio );
		#endif
	#else
		vec3 reflectVec = vReflect;
	#endif
	#ifdef ENVMAP_TYPE_CUBE
		vec4 envColor = textureCube( envMap, vec3( flipEnvMap * reflectVec.x, reflectVec.yz ) );
	#else
		vec4 envColor = vec4( 0.0 );
	#endif
	#ifdef ENVMAP_BLENDING_MULTIPLY
		outgoingLight = mix( outgoingLight, outgoingLight * envColor.xyz, specularStrength * reflectivity );
	#elif defined( ENVMAP_BLENDING_MIX )
		outgoingLight = mix( outgoingLight, envColor.xyz, specularStrength * reflectivity );
	#elif defined( ENVMAP_BLENDING_ADD )
		outgoingLight += envColor.xyz * specularStrength * reflectivity;
	#endif
#endif`,xg=`#ifdef USE_ENVMAP
	uniform float envMapIntensity;
	uniform float flipEnvMap;
	#ifdef ENVMAP_TYPE_CUBE
		uniform samplerCube envMap;
	#else
		uniform sampler2D envMap;
	#endif
	
#endif`,Sg=`#ifdef USE_ENVMAP
	uniform float reflectivity;
	#if defined( USE_BUMPMAP ) || defined( USE_NORMALMAP ) || defined( PHONG ) || defined( LAMBERT )
		#define ENV_WORLDPOS
	#endif
	#ifdef ENV_WORLDPOS
		varying vec3 vWorldPosition;
		uniform float refractionRatio;
	#else
		varying vec3 vReflect;
	#endif
#endif`,Cg=`#ifdef USE_ENVMAP
	#if defined( USE_BUMPMAP ) || defined( USE_NORMALMAP ) || defined( PHONG ) || defined( LAMBERT )
		#define ENV_WORLDPOS
	#endif
	#ifdef ENV_WORLDPOS
		
		varying vec3 vWorldPosition;
	#else
		varying vec3 vReflect;
		uniform float refractionRatio;
	#endif
#endif`,Tg=`#ifdef USE_ENVMAP
	#ifdef ENV_WORLDPOS
		vWorldPosition = worldPosition.xyz;
	#else
		vec3 cameraToVertex;
		if ( isOrthographic ) {
			cameraToVertex = normalize( vec3( - viewMatrix[ 0 ][ 2 ], - viewMatrix[ 1 ][ 2 ], - viewMatrix[ 2 ][ 2 ] ) );
		} else {
			cameraToVertex = normalize( worldPosition.xyz - cameraPosition );
		}
		vec3 worldNormal = inverseTransformDirection( transformedNormal, viewMatrix );
		#ifdef ENVMAP_MODE_REFLECTION
			vReflect = reflect( cameraToVertex, worldNormal );
		#else
			vReflect = refract( cameraToVertex, worldNormal, refractionRatio );
		#endif
	#endif
#endif`,Eg=`#ifdef USE_FOG
	vFogDepth = - mvPosition.z;
#endif`,Lg=`#ifdef USE_FOG
	varying float vFogDepth;
#endif`,Pg=`#ifdef USE_FOG
	#ifdef FOG_EXP2
		float fogFactor = 1.0 - exp( - fogDensity * fogDensity * vFogDepth * vFogDepth );
	#else
		float fogFactor = smoothstep( fogNear, fogFar, vFogDepth );
	#endif
	gl_FragColor.rgb = mix( gl_FragColor.rgb, fogColor, fogFactor );
#endif`,Ag=`#ifdef USE_FOG
	uniform vec3 fogColor;
	varying float vFogDepth;
	#ifdef FOG_EXP2
		uniform float fogDensity;
	#else
		uniform float fogNear;
		uniform float fogFar;
	#endif
#endif`,Dg=`#ifdef USE_GRADIENTMAP
	uniform sampler2D gradientMap;
#endif
vec3 getGradientIrradiance( vec3 normal, vec3 lightDirection ) {
	float dotNL = dot( normal, lightDirection );
	vec2 coord = vec2( dotNL * 0.5 + 0.5, 0.0 );
	#ifdef USE_GRADIENTMAP
		return vec3( texture2D( gradientMap, coord ).r );
	#else
		vec2 fw = fwidth( coord ) * 0.5;
		return mix( vec3( 0.7 ), vec3( 1.0 ), smoothstep( 0.7 - fw.x, 0.7 + fw.x, coord.x ) );
	#endif
}`,kg=`#ifdef USE_LIGHTMAP
	vec4 lightMapTexel = texture2D( lightMap, vUv2 );
	vec3 lightMapIrradiance = lightMapTexel.rgb * lightMapIntensity;
	reflectedLight.indirectDiffuse += lightMapIrradiance;
#endif`,Rg=`#ifdef USE_LIGHTMAP
	uniform sampler2D lightMap;
	uniform float lightMapIntensity;
#endif`,Ig=`LambertMaterial material;
material.diffuseColor = diffuseColor.rgb;
material.specularStrength = specularStrength;`,Ng=`varying vec3 vViewPosition;
struct LambertMaterial {
	vec3 diffuseColor;
	float specularStrength;
};
void RE_Direct_Lambert( const in IncidentLight directLight, const in GeometricContext geometry, const in LambertMaterial material, inout ReflectedLight reflectedLight ) {
	float dotNL = saturate( dot( geometry.normal, directLight.direction ) );
	vec3 irradiance = dotNL * directLight.color;
	reflectedLight.directDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
void RE_IndirectDiffuse_Lambert( const in vec3 irradiance, const in GeometricContext geometry, const in LambertMaterial material, inout ReflectedLight reflectedLight ) {
	reflectedLight.indirectDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
#define RE_Direct				RE_Direct_Lambert
#define RE_IndirectDiffuse		RE_IndirectDiffuse_Lambert`,zg=`uniform bool receiveShadow;
uniform vec3 ambientLightColor;
uniform vec3 lightProbe[ 9 ];
vec3 shGetIrradianceAt( in vec3 normal, in vec3 shCoefficients[ 9 ] ) {
	float x = normal.x, y = normal.y, z = normal.z;
	vec3 result = shCoefficients[ 0 ] * 0.886227;
	result += shCoefficients[ 1 ] * 2.0 * 0.511664 * y;
	result += shCoefficients[ 2 ] * 2.0 * 0.511664 * z;
	result += shCoefficients[ 3 ] * 2.0 * 0.511664 * x;
	result += shCoefficients[ 4 ] * 2.0 * 0.429043 * x * y;
	result += shCoefficients[ 5 ] * 2.0 * 0.429043 * y * z;
	result += shCoefficients[ 6 ] * ( 0.743125 * z * z - 0.247708 );
	result += shCoefficients[ 7 ] * 2.0 * 0.429043 * x * z;
	result += shCoefficients[ 8 ] * 0.429043 * ( x * x - y * y );
	return result;
}
vec3 getLightProbeIrradiance( const in vec3 lightProbe[ 9 ], const in vec3 normal ) {
	vec3 worldNormal = inverseTransformDirection( normal, viewMatrix );
	vec3 irradiance = shGetIrradianceAt( worldNormal, lightProbe );
	return irradiance;
}
vec3 getAmbientLightIrradiance( const in vec3 ambientLightColor ) {
	vec3 irradiance = ambientLightColor;
	return irradiance;
}
float getDistanceAttenuation( const in float lightDistance, const in float cutoffDistance, const in float decayExponent ) {
	#if defined ( LEGACY_LIGHTS )
		if ( cutoffDistance > 0.0 && decayExponent > 0.0 ) {
			return pow( saturate( - lightDistance / cutoffDistance + 1.0 ), decayExponent );
		}
		return 1.0;
	#else
		float distanceFalloff = 1.0 / max( pow( lightDistance, decayExponent ), 0.01 );
		if ( cutoffDistance > 0.0 ) {
			distanceFalloff *= pow2( saturate( 1.0 - pow4( lightDistance / cutoffDistance ) ) );
		}
		return distanceFalloff;
	#endif
}
float getSpotAttenuation( const in float coneCosine, const in float penumbraCosine, const in float angleCosine ) {
	return smoothstep( coneCosine, penumbraCosine, angleCosine );
}
#if NUM_DIR_LIGHTS > 0
	struct DirectionalLight {
		vec3 direction;
		vec3 color;
	};
	uniform DirectionalLight directionalLights[ NUM_DIR_LIGHTS ];
	void getDirectionalLightInfo( const in DirectionalLight directionalLight, const in GeometricContext geometry, out IncidentLight light ) {
		light.color = directionalLight.color;
		light.direction = directionalLight.direction;
		light.visible = true;
	}
#endif
#if NUM_POINT_LIGHTS > 0
	struct PointLight {
		vec3 position;
		vec3 color;
		float distance;
		float decay;
	};
	uniform PointLight pointLights[ NUM_POINT_LIGHTS ];
	void getPointLightInfo( const in PointLight pointLight, const in GeometricContext geometry, out IncidentLight light ) {
		vec3 lVector = pointLight.position - geometry.position;
		light.direction = normalize( lVector );
		float lightDistance = length( lVector );
		light.color = pointLight.color;
		light.color *= getDistanceAttenuation( lightDistance, pointLight.distance, pointLight.decay );
		light.visible = ( light.color != vec3( 0.0 ) );
	}
#endif
#if NUM_SPOT_LIGHTS > 0
	struct SpotLight {
		vec3 position;
		vec3 direction;
		vec3 color;
		float distance;
		float decay;
		float coneCos;
		float penumbraCos;
	};
	uniform SpotLight spotLights[ NUM_SPOT_LIGHTS ];
	void getSpotLightInfo( const in SpotLight spotLight, const in GeometricContext geometry, out IncidentLight light ) {
		vec3 lVector = spotLight.position - geometry.position;
		light.direction = normalize( lVector );
		float angleCos = dot( light.direction, spotLight.direction );
		float spotAttenuation = getSpotAttenuation( spotLight.coneCos, spotLight.penumbraCos, angleCos );
		if ( spotAttenuation > 0.0 ) {
			float lightDistance = length( lVector );
			light.color = spotLight.color * spotAttenuation;
			light.color *= getDistanceAttenuation( lightDistance, spotLight.distance, spotLight.decay );
			light.visible = ( light.color != vec3( 0.0 ) );
		} else {
			light.color = vec3( 0.0 );
			light.visible = false;
		}
	}
#endif
#if NUM_RECT_AREA_LIGHTS > 0
	struct RectAreaLight {
		vec3 color;
		vec3 position;
		vec3 halfWidth;
		vec3 halfHeight;
	};
	uniform sampler2D ltc_1;	uniform sampler2D ltc_2;
	uniform RectAreaLight rectAreaLights[ NUM_RECT_AREA_LIGHTS ];
#endif
#if NUM_HEMI_LIGHTS > 0
	struct HemisphereLight {
		vec3 direction;
		vec3 skyColor;
		vec3 groundColor;
	};
	uniform HemisphereLight hemisphereLights[ NUM_HEMI_LIGHTS ];
	vec3 getHemisphereLightIrradiance( const in HemisphereLight hemiLight, const in vec3 normal ) {
		float dotNL = dot( normal, hemiLight.direction );
		float hemiDiffuseWeight = 0.5 * dotNL + 0.5;
		vec3 irradiance = mix( hemiLight.groundColor, hemiLight.skyColor, hemiDiffuseWeight );
		return irradiance;
	}
#endif`,Fg=`#if defined( USE_ENVMAP )
	vec3 getIBLIrradiance( const in vec3 normal ) {
		#if defined( ENVMAP_TYPE_CUBE_UV )
			vec3 worldNormal = inverseTransformDirection( normal, viewMatrix );
			vec4 envMapColor = textureCubeUV( envMap, worldNormal, 1.0 );
			return PI * envMapColor.rgb * envMapIntensity;
		#else
			return vec3( 0.0 );
		#endif
	}
	vec3 getIBLRadiance( const in vec3 viewDir, const in vec3 normal, const in float roughness ) {
		#if defined( ENVMAP_TYPE_CUBE_UV )
			vec3 reflectVec = reflect( - viewDir, normal );
			reflectVec = normalize( mix( reflectVec, normal, roughness * roughness) );
			reflectVec = inverseTransformDirection( reflectVec, viewMatrix );
			vec4 envMapColor = textureCubeUV( envMap, reflectVec, roughness );
			return envMapColor.rgb * envMapIntensity;
		#else
			return vec3( 0.0 );
		#endif
	}
#endif`,Og=`ToonMaterial material;
material.diffuseColor = diffuseColor.rgb;`,Ug=`varying vec3 vViewPosition;
struct ToonMaterial {
	vec3 diffuseColor;
};
void RE_Direct_Toon( const in IncidentLight directLight, const in GeometricContext geometry, const in ToonMaterial material, inout ReflectedLight reflectedLight ) {
	vec3 irradiance = getGradientIrradiance( geometry.normal, directLight.direction ) * directLight.color;
	reflectedLight.directDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
void RE_IndirectDiffuse_Toon( const in vec3 irradiance, const in GeometricContext geometry, const in ToonMaterial material, inout ReflectedLight reflectedLight ) {
	reflectedLight.indirectDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
#define RE_Direct				RE_Direct_Toon
#define RE_IndirectDiffuse		RE_IndirectDiffuse_Toon`,Bg=`BlinnPhongMaterial material;
material.diffuseColor = diffuseColor.rgb;
material.specularColor = specular;
material.specularShininess = shininess;
material.specularStrength = specularStrength;`,Vg=`varying vec3 vViewPosition;
struct BlinnPhongMaterial {
	vec3 diffuseColor;
	vec3 specularColor;
	float specularShininess;
	float specularStrength;
};
void RE_Direct_BlinnPhong( const in IncidentLight directLight, const in GeometricContext geometry, const in BlinnPhongMaterial material, inout ReflectedLight reflectedLight ) {
	float dotNL = saturate( dot( geometry.normal, directLight.direction ) );
	vec3 irradiance = dotNL * directLight.color;
	reflectedLight.directDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
	reflectedLight.directSpecular += irradiance * BRDF_BlinnPhong( directLight.direction, geometry.viewDir, geometry.normal, material.specularColor, material.specularShininess ) * material.specularStrength;
}
void RE_IndirectDiffuse_BlinnPhong( const in vec3 irradiance, const in GeometricContext geometry, const in BlinnPhongMaterial material, inout ReflectedLight reflectedLight ) {
	reflectedLight.indirectDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
#define RE_Direct				RE_Direct_BlinnPhong
#define RE_IndirectDiffuse		RE_IndirectDiffuse_BlinnPhong`,Gg=`PhysicalMaterial material;
material.diffuseColor = diffuseColor.rgb * ( 1.0 - metalnessFactor );
vec3 dxy = max( abs( dFdx( geometryNormal ) ), abs( dFdy( geometryNormal ) ) );
float geometryRoughness = max( max( dxy.x, dxy.y ), dxy.z );
material.roughness = max( roughnessFactor, 0.0525 );material.roughness += geometryRoughness;
material.roughness = min( material.roughness, 1.0 );
#ifdef IOR
	material.ior = ior;
	#ifdef SPECULAR
		float specularIntensityFactor = specularIntensity;
		vec3 specularColorFactor = specularColor;
		#ifdef USE_SPECULARINTENSITYMAP
			specularIntensityFactor *= texture2D( specularIntensityMap, vUv ).a;
		#endif
		#ifdef USE_SPECULARCOLORMAP
			specularColorFactor *= texture2D( specularColorMap, vUv ).rgb;
		#endif
		material.specularF90 = mix( specularIntensityFactor, 1.0, metalnessFactor );
	#else
		float specularIntensityFactor = 1.0;
		vec3 specularColorFactor = vec3( 1.0 );
		material.specularF90 = 1.0;
	#endif
	material.specularColor = mix( min( pow2( ( material.ior - 1.0 ) / ( material.ior + 1.0 ) ) * specularColorFactor, vec3( 1.0 ) ) * specularIntensityFactor, diffuseColor.rgb, metalnessFactor );
#else
	material.specularColor = mix( vec3( 0.04 ), diffuseColor.rgb, metalnessFactor );
	material.specularF90 = 1.0;
#endif
#ifdef USE_CLEARCOAT
	material.clearcoat = clearcoat;
	material.clearcoatRoughness = clearcoatRoughness;
	material.clearcoatF0 = vec3( 0.04 );
	material.clearcoatF90 = 1.0;
	#ifdef USE_CLEARCOATMAP
		material.clearcoat *= texture2D( clearcoatMap, vUv ).x;
	#endif
	#ifdef USE_CLEARCOAT_ROUGHNESSMAP
		material.clearcoatRoughness *= texture2D( clearcoatRoughnessMap, vUv ).y;
	#endif
	material.clearcoat = saturate( material.clearcoat );	material.clearcoatRoughness = max( material.clearcoatRoughness, 0.0525 );
	material.clearcoatRoughness += geometryRoughness;
	material.clearcoatRoughness = min( material.clearcoatRoughness, 1.0 );
#endif
#ifdef USE_IRIDESCENCE
	material.iridescence = iridescence;
	material.iridescenceIOR = iridescenceIOR;
	#ifdef USE_IRIDESCENCEMAP
		material.iridescence *= texture2D( iridescenceMap, vUv ).r;
	#endif
	#ifdef USE_IRIDESCENCE_THICKNESSMAP
		material.iridescenceThickness = (iridescenceThicknessMaximum - iridescenceThicknessMinimum) * texture2D( iridescenceThicknessMap, vUv ).g + iridescenceThicknessMinimum;
	#else
		material.iridescenceThickness = iridescenceThicknessMaximum;
	#endif
#endif
#ifdef USE_SHEEN
	material.sheenColor = sheenColor;
	#ifdef USE_SHEENCOLORMAP
		material.sheenColor *= texture2D( sheenColorMap, vUv ).rgb;
	#endif
	material.sheenRoughness = clamp( sheenRoughness, 0.07, 1.0 );
	#ifdef USE_SHEENROUGHNESSMAP
		material.sheenRoughness *= texture2D( sheenRoughnessMap, vUv ).a;
	#endif
#endif`,Hg=`struct PhysicalMaterial {
	vec3 diffuseColor;
	float roughness;
	vec3 specularColor;
	float specularF90;
	#ifdef USE_CLEARCOAT
		float clearcoat;
		float clearcoatRoughness;
		vec3 clearcoatF0;
		float clearcoatF90;
	#endif
	#ifdef USE_IRIDESCENCE
		float iridescence;
		float iridescenceIOR;
		float iridescenceThickness;
		vec3 iridescenceFresnel;
		vec3 iridescenceF0;
	#endif
	#ifdef USE_SHEEN
		vec3 sheenColor;
		float sheenRoughness;
	#endif
	#ifdef IOR
		float ior;
	#endif
	#ifdef USE_TRANSMISSION
		float transmission;
		float transmissionAlpha;
		float thickness;
		float attenuationDistance;
		vec3 attenuationColor;
	#endif
};
vec3 clearcoatSpecular = vec3( 0.0 );
vec3 sheenSpecular = vec3( 0.0 );
float IBLSheenBRDF( const in vec3 normal, const in vec3 viewDir, const in float roughness ) {
	float dotNV = saturate( dot( normal, viewDir ) );
	float r2 = roughness * roughness;
	float a = roughness < 0.25 ? -339.2 * r2 + 161.4 * roughness - 25.9 : -8.48 * r2 + 14.3 * roughness - 9.95;
	float b = roughness < 0.25 ? 44.0 * r2 - 23.7 * roughness + 3.26 : 1.97 * r2 - 3.27 * roughness + 0.72;
	float DG = exp( a * dotNV + b ) + ( roughness < 0.25 ? 0.0 : 0.1 * ( roughness - 0.25 ) );
	return saturate( DG * RECIPROCAL_PI );
}
vec2 DFGApprox( const in vec3 normal, const in vec3 viewDir, const in float roughness ) {
	float dotNV = saturate( dot( normal, viewDir ) );
	const vec4 c0 = vec4( - 1, - 0.0275, - 0.572, 0.022 );
	const vec4 c1 = vec4( 1, 0.0425, 1.04, - 0.04 );
	vec4 r = roughness * c0 + c1;
	float a004 = min( r.x * r.x, exp2( - 9.28 * dotNV ) ) * r.x + r.y;
	vec2 fab = vec2( - 1.04, 1.04 ) * a004 + r.zw;
	return fab;
}
vec3 EnvironmentBRDF( const in vec3 normal, const in vec3 viewDir, const in vec3 specularColor, const in float specularF90, const in float roughness ) {
	vec2 fab = DFGApprox( normal, viewDir, roughness );
	return specularColor * fab.x + specularF90 * fab.y;
}
#ifdef USE_IRIDESCENCE
void computeMultiscatteringIridescence( const in vec3 normal, const in vec3 viewDir, const in vec3 specularColor, const in float specularF90, const in float iridescence, const in vec3 iridescenceF0, const in float roughness, inout vec3 singleScatter, inout vec3 multiScatter ) {
#else
void computeMultiscattering( const in vec3 normal, const in vec3 viewDir, const in vec3 specularColor, const in float specularF90, const in float roughness, inout vec3 singleScatter, inout vec3 multiScatter ) {
#endif
	vec2 fab = DFGApprox( normal, viewDir, roughness );
	#ifdef USE_IRIDESCENCE
		vec3 Fr = mix( specularColor, iridescenceF0, iridescence );
	#else
		vec3 Fr = specularColor;
	#endif
	vec3 FssEss = Fr * fab.x + specularF90 * fab.y;
	float Ess = fab.x + fab.y;
	float Ems = 1.0 - Ess;
	vec3 Favg = Fr + ( 1.0 - Fr ) * 0.047619;	vec3 Fms = FssEss * Favg / ( 1.0 - Ems * Favg );
	singleScatter += FssEss;
	multiScatter += Fms * Ems;
}
#if NUM_RECT_AREA_LIGHTS > 0
	void RE_Direct_RectArea_Physical( const in RectAreaLight rectAreaLight, const in GeometricContext geometry, const in PhysicalMaterial material, inout ReflectedLight reflectedLight ) {
		vec3 normal = geometry.normal;
		vec3 viewDir = geometry.viewDir;
		vec3 position = geometry.position;
		vec3 lightPos = rectAreaLight.position;
		vec3 halfWidth = rectAreaLight.halfWidth;
		vec3 halfHeight = rectAreaLight.halfHeight;
		vec3 lightColor = rectAreaLight.color;
		float roughness = material.roughness;
		vec3 rectCoords[ 4 ];
		rectCoords[ 0 ] = lightPos + halfWidth - halfHeight;		rectCoords[ 1 ] = lightPos - halfWidth - halfHeight;
		rectCoords[ 2 ] = lightPos - halfWidth + halfHeight;
		rectCoords[ 3 ] = lightPos + halfWidth + halfHeight;
		vec2 uv = LTC_Uv( normal, viewDir, roughness );
		vec4 t1 = texture2D( ltc_1, uv );
		vec4 t2 = texture2D( ltc_2, uv );
		mat3 mInv = mat3(
			vec3( t1.x, 0, t1.y ),
			vec3(    0, 1,    0 ),
			vec3( t1.z, 0, t1.w )
		);
		vec3 fresnel = ( material.specularColor * t2.x + ( vec3( 1.0 ) - material.specularColor ) * t2.y );
		reflectedLight.directSpecular += lightColor * fresnel * LTC_Evaluate( normal, viewDir, position, mInv, rectCoords );
		reflectedLight.directDiffuse += lightColor * material.diffuseColor * LTC_Evaluate( normal, viewDir, position, mat3( 1.0 ), rectCoords );
	}
#endif
void RE_Direct_Physical( const in IncidentLight directLight, const in GeometricContext geometry, const in PhysicalMaterial material, inout ReflectedLight reflectedLight ) {
	float dotNL = saturate( dot( geometry.normal, directLight.direction ) );
	vec3 irradiance = dotNL * directLight.color;
	#ifdef USE_CLEARCOAT
		float dotNLcc = saturate( dot( geometry.clearcoatNormal, directLight.direction ) );
		vec3 ccIrradiance = dotNLcc * directLight.color;
		clearcoatSpecular += ccIrradiance * BRDF_GGX( directLight.direction, geometry.viewDir, geometry.clearcoatNormal, material.clearcoatF0, material.clearcoatF90, material.clearcoatRoughness );
	#endif
	#ifdef USE_SHEEN
		sheenSpecular += irradiance * BRDF_Sheen( directLight.direction, geometry.viewDir, geometry.normal, material.sheenColor, material.sheenRoughness );
	#endif
	#ifdef USE_IRIDESCENCE
		reflectedLight.directSpecular += irradiance * BRDF_GGX_Iridescence( directLight.direction, geometry.viewDir, geometry.normal, material.specularColor, material.specularF90, material.iridescence, material.iridescenceFresnel, material.roughness );
	#else
		reflectedLight.directSpecular += irradiance * BRDF_GGX( directLight.direction, geometry.viewDir, geometry.normal, material.specularColor, material.specularF90, material.roughness );
	#endif
	reflectedLight.directDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
void RE_IndirectDiffuse_Physical( const in vec3 irradiance, const in GeometricContext geometry, const in PhysicalMaterial material, inout ReflectedLight reflectedLight ) {
	reflectedLight.indirectDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
void RE_IndirectSpecular_Physical( const in vec3 radiance, const in vec3 irradiance, const in vec3 clearcoatRadiance, const in GeometricContext geometry, const in PhysicalMaterial material, inout ReflectedLight reflectedLight) {
	#ifdef USE_CLEARCOAT
		clearcoatSpecular += clearcoatRadiance * EnvironmentBRDF( geometry.clearcoatNormal, geometry.viewDir, material.clearcoatF0, material.clearcoatF90, material.clearcoatRoughness );
	#endif
	#ifdef USE_SHEEN
		sheenSpecular += irradiance * material.sheenColor * IBLSheenBRDF( geometry.normal, geometry.viewDir, material.sheenRoughness );
	#endif
	vec3 singleScattering = vec3( 0.0 );
	vec3 multiScattering = vec3( 0.0 );
	vec3 cosineWeightedIrradiance = irradiance * RECIPROCAL_PI;
	#ifdef USE_IRIDESCENCE
		computeMultiscatteringIridescence( geometry.normal, geometry.viewDir, material.specularColor, material.specularF90, material.iridescence, material.iridescenceFresnel, material.roughness, singleScattering, multiScattering );
	#else
		computeMultiscattering( geometry.normal, geometry.viewDir, material.specularColor, material.specularF90, material.roughness, singleScattering, multiScattering );
	#endif
	vec3 totalScattering = singleScattering + multiScattering;
	vec3 diffuse = material.diffuseColor * ( 1.0 - max( max( totalScattering.r, totalScattering.g ), totalScattering.b ) );
	reflectedLight.indirectSpecular += radiance * singleScattering;
	reflectedLight.indirectSpecular += multiScattering * cosineWeightedIrradiance;
	reflectedLight.indirectDiffuse += diffuse * cosineWeightedIrradiance;
}
#define RE_Direct				RE_Direct_Physical
#define RE_Direct_RectArea		RE_Direct_RectArea_Physical
#define RE_IndirectDiffuse		RE_IndirectDiffuse_Physical
#define RE_IndirectSpecular		RE_IndirectSpecular_Physical
float computeSpecularOcclusion( const in float dotNV, const in float ambientOcclusion, const in float roughness ) {
	return saturate( pow( dotNV + ambientOcclusion, exp2( - 16.0 * roughness - 1.0 ) ) - 1.0 + ambientOcclusion );
}`,Wg=`
GeometricContext geometry;
geometry.position = - vViewPosition;
geometry.normal = normal;
geometry.viewDir = ( isOrthographic ) ? vec3( 0, 0, 1 ) : normalize( vViewPosition );
#ifdef USE_CLEARCOAT
	geometry.clearcoatNormal = clearcoatNormal;
#endif
#ifdef USE_IRIDESCENCE
	float dotNVi = saturate( dot( normal, geometry.viewDir ) );
	if ( material.iridescenceThickness == 0.0 ) {
		material.iridescence = 0.0;
	} else {
		material.iridescence = saturate( material.iridescence );
	}
	if ( material.iridescence > 0.0 ) {
		material.iridescenceFresnel = evalIridescence( 1.0, material.iridescenceIOR, dotNVi, material.iridescenceThickness, material.specularColor );
		material.iridescenceF0 = Schlick_to_F0( material.iridescenceFresnel, 1.0, dotNVi );
	}
#endif
IncidentLight directLight;
#if ( NUM_POINT_LIGHTS > 0 ) && defined( RE_Direct )
	PointLight pointLight;
	#if defined( USE_SHADOWMAP ) && NUM_POINT_LIGHT_SHADOWS > 0
	PointLightShadow pointLightShadow;
	#endif
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_POINT_LIGHTS; i ++ ) {
		pointLight = pointLights[ i ];
		getPointLightInfo( pointLight, geometry, directLight );
		#if defined( USE_SHADOWMAP ) && ( UNROLLED_LOOP_INDEX < NUM_POINT_LIGHT_SHADOWS )
		pointLightShadow = pointLightShadows[ i ];
		directLight.color *= ( directLight.visible && receiveShadow ) ? getPointShadow( pointShadowMap[ i ], pointLightShadow.shadowMapSize, pointLightShadow.shadowBias, pointLightShadow.shadowRadius, vPointShadowCoord[ i ], pointLightShadow.shadowCameraNear, pointLightShadow.shadowCameraFar ) : 1.0;
		#endif
		RE_Direct( directLight, geometry, material, reflectedLight );
	}
	#pragma unroll_loop_end
#endif
#if ( NUM_SPOT_LIGHTS > 0 ) && defined( RE_Direct )
	SpotLight spotLight;
	vec4 spotColor;
	vec3 spotLightCoord;
	bool inSpotLightMap;
	#if defined( USE_SHADOWMAP ) && NUM_SPOT_LIGHT_SHADOWS > 0
	SpotLightShadow spotLightShadow;
	#endif
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_SPOT_LIGHTS; i ++ ) {
		spotLight = spotLights[ i ];
		getSpotLightInfo( spotLight, geometry, directLight );
		#if ( UNROLLED_LOOP_INDEX < NUM_SPOT_LIGHT_SHADOWS_WITH_MAPS )
		#define SPOT_LIGHT_MAP_INDEX UNROLLED_LOOP_INDEX
		#elif ( UNROLLED_LOOP_INDEX < NUM_SPOT_LIGHT_SHADOWS )
		#define SPOT_LIGHT_MAP_INDEX NUM_SPOT_LIGHT_MAPS
		#else
		#define SPOT_LIGHT_MAP_INDEX ( UNROLLED_LOOP_INDEX - NUM_SPOT_LIGHT_SHADOWS + NUM_SPOT_LIGHT_SHADOWS_WITH_MAPS )
		#endif
		#if ( SPOT_LIGHT_MAP_INDEX < NUM_SPOT_LIGHT_MAPS )
			spotLightCoord = vSpotLightCoord[ i ].xyz / vSpotLightCoord[ i ].w;
			inSpotLightMap = all( lessThan( abs( spotLightCoord * 2. - 1. ), vec3( 1.0 ) ) );
			spotColor = texture2D( spotLightMap[ SPOT_LIGHT_MAP_INDEX ], spotLightCoord.xy );
			directLight.color = inSpotLightMap ? directLight.color * spotColor.rgb : directLight.color;
		#endif
		#undef SPOT_LIGHT_MAP_INDEX
		#if defined( USE_SHADOWMAP ) && ( UNROLLED_LOOP_INDEX < NUM_SPOT_LIGHT_SHADOWS )
		spotLightShadow = spotLightShadows[ i ];
		directLight.color *= ( directLight.visible && receiveShadow ) ? getShadow( spotShadowMap[ i ], spotLightShadow.shadowMapSize, spotLightShadow.shadowBias, spotLightShadow.shadowRadius, vSpotLightCoord[ i ] ) : 1.0;
		#endif
		RE_Direct( directLight, geometry, material, reflectedLight );
	}
	#pragma unroll_loop_end
#endif
#if ( NUM_DIR_LIGHTS > 0 ) && defined( RE_Direct )
	DirectionalLight directionalLight;
	#if defined( USE_SHADOWMAP ) && NUM_DIR_LIGHT_SHADOWS > 0
	DirectionalLightShadow directionalLightShadow;
	#endif
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_DIR_LIGHTS; i ++ ) {
		directionalLight = directionalLights[ i ];
		getDirectionalLightInfo( directionalLight, geometry, directLight );
		#if defined( USE_SHADOWMAP ) && ( UNROLLED_LOOP_INDEX < NUM_DIR_LIGHT_SHADOWS )
		directionalLightShadow = directionalLightShadows[ i ];
		directLight.color *= ( directLight.visible && receiveShadow ) ? getShadow( directionalShadowMap[ i ], directionalLightShadow.shadowMapSize, directionalLightShadow.shadowBias, directionalLightShadow.shadowRadius, vDirectionalShadowCoord[ i ] ) : 1.0;
		#endif
		RE_Direct( directLight, geometry, material, reflectedLight );
	}
	#pragma unroll_loop_end
#endif
#if ( NUM_RECT_AREA_LIGHTS > 0 ) && defined( RE_Direct_RectArea )
	RectAreaLight rectAreaLight;
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_RECT_AREA_LIGHTS; i ++ ) {
		rectAreaLight = rectAreaLights[ i ];
		RE_Direct_RectArea( rectAreaLight, geometry, material, reflectedLight );
	}
	#pragma unroll_loop_end
#endif
#if defined( RE_IndirectDiffuse )
	vec3 iblIrradiance = vec3( 0.0 );
	vec3 irradiance = getAmbientLightIrradiance( ambientLightColor );
	irradiance += getLightProbeIrradiance( lightProbe, geometry.normal );
	#if ( NUM_HEMI_LIGHTS > 0 )
		#pragma unroll_loop_start
		for ( int i = 0; i < NUM_HEMI_LIGHTS; i ++ ) {
			irradiance += getHemisphereLightIrradiance( hemisphereLights[ i ], geometry.normal );
		}
		#pragma unroll_loop_end
	#endif
#endif
#if defined( RE_IndirectSpecular )
	vec3 radiance = vec3( 0.0 );
	vec3 clearcoatRadiance = vec3( 0.0 );
#endif`,Xg=`#if defined( RE_IndirectDiffuse )
	#ifdef USE_LIGHTMAP
		vec4 lightMapTexel = texture2D( lightMap, vUv2 );
		vec3 lightMapIrradiance = lightMapTexel.rgb * lightMapIntensity;
		irradiance += lightMapIrradiance;
	#endif
	#if defined( USE_ENVMAP ) && defined( STANDARD ) && defined( ENVMAP_TYPE_CUBE_UV )
		iblIrradiance += getIBLIrradiance( geometry.normal );
	#endif
#endif
#if defined( USE_ENVMAP ) && defined( RE_IndirectSpecular )
	radiance += getIBLRadiance( geometry.viewDir, geometry.normal, material.roughness );
	#ifdef USE_CLEARCOAT
		clearcoatRadiance += getIBLRadiance( geometry.viewDir, geometry.clearcoatNormal, material.clearcoatRoughness );
	#endif
#endif`,jg=`#if defined( RE_IndirectDiffuse )
	RE_IndirectDiffuse( irradiance, geometry, material, reflectedLight );
#endif
#if defined( RE_IndirectSpecular )
	RE_IndirectSpecular( radiance, iblIrradiance, clearcoatRadiance, geometry, material, reflectedLight );
#endif`,qg=`#if defined( USE_LOGDEPTHBUF ) && defined( USE_LOGDEPTHBUF_EXT )
	gl_FragDepthEXT = vIsPerspective == 0.0 ? gl_FragCoord.z : log2( vFragDepth ) * logDepthBufFC * 0.5;
#endif`,Yg=`#if defined( USE_LOGDEPTHBUF ) && defined( USE_LOGDEPTHBUF_EXT )
	uniform float logDepthBufFC;
	varying float vFragDepth;
	varying float vIsPerspective;
#endif`,Zg=`#ifdef USE_LOGDEPTHBUF
	#ifdef USE_LOGDEPTHBUF_EXT
		varying float vFragDepth;
		varying float vIsPerspective;
	#else
		uniform float logDepthBufFC;
	#endif
#endif`,Kg=`#ifdef USE_LOGDEPTHBUF
	#ifdef USE_LOGDEPTHBUF_EXT
		vFragDepth = 1.0 + gl_Position.w;
		vIsPerspective = float( isPerspectiveMatrix( projectionMatrix ) );
	#else
		if ( isPerspectiveMatrix( projectionMatrix ) ) {
			gl_Position.z = log2( max( EPSILON, gl_Position.w + 1.0 ) ) * logDepthBufFC - 1.0;
			gl_Position.z *= gl_Position.w;
		}
	#endif
#endif`,Jg=`#ifdef USE_MAP
	vec4 sampledDiffuseColor = texture2D( map, vUv );
	#ifdef DECODE_VIDEO_TEXTURE
		sampledDiffuseColor = vec4( mix( pow( sampledDiffuseColor.rgb * 0.9478672986 + vec3( 0.0521327014 ), vec3( 2.4 ) ), sampledDiffuseColor.rgb * 0.0773993808, vec3( lessThanEqual( sampledDiffuseColor.rgb, vec3( 0.04045 ) ) ) ), sampledDiffuseColor.w );
	#endif
	diffuseColor *= sampledDiffuseColor;
#endif`,Qg=`#ifdef USE_MAP
	uniform sampler2D map;
#endif`,$g=`#if defined( USE_MAP ) || defined( USE_ALPHAMAP )
	vec2 uv = ( uvTransform * vec3( gl_PointCoord.x, 1.0 - gl_PointCoord.y, 1 ) ).xy;
#endif
#ifdef USE_MAP
	diffuseColor *= texture2D( map, uv );
#endif
#ifdef USE_ALPHAMAP
	diffuseColor.a *= texture2D( alphaMap, uv ).g;
#endif`,e0=`#if defined( USE_MAP ) || defined( USE_ALPHAMAP )
	uniform mat3 uvTransform;
#endif
#ifdef USE_MAP
	uniform sampler2D map;
#endif
#ifdef USE_ALPHAMAP
	uniform sampler2D alphaMap;
#endif`,t0=`float metalnessFactor = metalness;
#ifdef USE_METALNESSMAP
	vec4 texelMetalness = texture2D( metalnessMap, vUv );
	metalnessFactor *= texelMetalness.b;
#endif`,n0=`#ifdef USE_METALNESSMAP
	uniform sampler2D metalnessMap;
#endif`,i0=`#if defined( USE_MORPHCOLORS ) && defined( MORPHTARGETS_TEXTURE )
	vColor *= morphTargetBaseInfluence;
	for ( int i = 0; i < MORPHTARGETS_COUNT; i ++ ) {
		#if defined( USE_COLOR_ALPHA )
			if ( morphTargetInfluences[ i ] != 0.0 ) vColor += getMorph( gl_VertexID, i, 2 ) * morphTargetInfluences[ i ];
		#elif defined( USE_COLOR )
			if ( morphTargetInfluences[ i ] != 0.0 ) vColor += getMorph( gl_VertexID, i, 2 ).rgb * morphTargetInfluences[ i ];
		#endif
	}
#endif`,r0=`#ifdef USE_MORPHNORMALS
	objectNormal *= morphTargetBaseInfluence;
	#ifdef MORPHTARGETS_TEXTURE
		for ( int i = 0; i < MORPHTARGETS_COUNT; i ++ ) {
			if ( morphTargetInfluences[ i ] != 0.0 ) objectNormal += getMorph( gl_VertexID, i, 1 ).xyz * morphTargetInfluences[ i ];
		}
	#else
		objectNormal += morphNormal0 * morphTargetInfluences[ 0 ];
		objectNormal += morphNormal1 * morphTargetInfluences[ 1 ];
		objectNormal += morphNormal2 * morphTargetInfluences[ 2 ];
		objectNormal += morphNormal3 * morphTargetInfluences[ 3 ];
	#endif
#endif`,s0=`#ifdef USE_MORPHTARGETS
	uniform float morphTargetBaseInfluence;
	#ifdef MORPHTARGETS_TEXTURE
		uniform float morphTargetInfluences[ MORPHTARGETS_COUNT ];
		uniform sampler2DArray morphTargetsTexture;
		uniform ivec2 morphTargetsTextureSize;
		vec4 getMorph( const in int vertexIndex, const in int morphTargetIndex, const in int offset ) {
			int texelIndex = vertexIndex * MORPHTARGETS_TEXTURE_STRIDE + offset;
			int y = texelIndex / morphTargetsTextureSize.x;
			int x = texelIndex - y * morphTargetsTextureSize.x;
			ivec3 morphUV = ivec3( x, y, morphTargetIndex );
			return texelFetch( morphTargetsTexture, morphUV, 0 );
		}
	#else
		#ifndef USE_MORPHNORMALS
			uniform float morphTargetInfluences[ 8 ];
		#else
			uniform float morphTargetInfluences[ 4 ];
		#endif
	#endif
#endif`,a0=`#ifdef USE_MORPHTARGETS
	transformed *= morphTargetBaseInfluence;
	#ifdef MORPHTARGETS_TEXTURE
		for ( int i = 0; i < MORPHTARGETS_COUNT; i ++ ) {
			if ( morphTargetInfluences[ i ] != 0.0 ) transformed += getMorph( gl_VertexID, i, 0 ).xyz * morphTargetInfluences[ i ];
		}
	#else
		transformed += morphTarget0 * morphTargetInfluences[ 0 ];
		transformed += morphTarget1 * morphTargetInfluences[ 1 ];
		transformed += morphTarget2 * morphTargetInfluences[ 2 ];
		transformed += morphTarget3 * morphTargetInfluences[ 3 ];
		#ifndef USE_MORPHNORMALS
			transformed += morphTarget4 * morphTargetInfluences[ 4 ];
			transformed += morphTarget5 * morphTargetInfluences[ 5 ];
			transformed += morphTarget6 * morphTargetInfluences[ 6 ];
			transformed += morphTarget7 * morphTargetInfluences[ 7 ];
		#endif
	#endif
#endif`,o0=`float faceDirection = gl_FrontFacing ? 1.0 : - 1.0;
#ifdef FLAT_SHADED
	vec3 fdx = dFdx( vViewPosition );
	vec3 fdy = dFdy( vViewPosition );
	vec3 normal = normalize( cross( fdx, fdy ) );
#else
	vec3 normal = normalize( vNormal );
	#ifdef DOUBLE_SIDED
		normal = normal * faceDirection;
	#endif
	#ifdef USE_TANGENT
		vec3 tangent = normalize( vTangent );
		vec3 bitangent = normalize( vBitangent );
		#ifdef DOUBLE_SIDED
			tangent = tangent * faceDirection;
			bitangent = bitangent * faceDirection;
		#endif
		#if defined( TANGENTSPACE_NORMALMAP ) || defined( USE_CLEARCOAT_NORMALMAP )
			mat3 vTBN = mat3( tangent, bitangent, normal );
		#endif
	#endif
#endif
vec3 geometryNormal = normal;`,l0=`#ifdef OBJECTSPACE_NORMALMAP
	normal = texture2D( normalMap, vUv ).xyz * 2.0 - 1.0;
	#ifdef FLIP_SIDED
		normal = - normal;
	#endif
	#ifdef DOUBLE_SIDED
		normal = normal * faceDirection;
	#endif
	normal = normalize( normalMatrix * normal );
#elif defined( TANGENTSPACE_NORMALMAP )
	vec3 mapN = texture2D( normalMap, vUv ).xyz * 2.0 - 1.0;
	mapN.xy *= normalScale;
	#ifdef USE_TANGENT
		normal = normalize( vTBN * mapN );
	#else
		normal = perturbNormal2Arb( - vViewPosition, normal, mapN, faceDirection );
	#endif
#elif defined( USE_BUMPMAP )
	normal = perturbNormalArb( - vViewPosition, normal, dHdxy_fwd(), faceDirection );
#endif`,c0=`#ifndef FLAT_SHADED
	varying vec3 vNormal;
	#ifdef USE_TANGENT
		varying vec3 vTangent;
		varying vec3 vBitangent;
	#endif
#endif`,u0=`#ifndef FLAT_SHADED
	varying vec3 vNormal;
	#ifdef USE_TANGENT
		varying vec3 vTangent;
		varying vec3 vBitangent;
	#endif
#endif`,f0=`#ifndef FLAT_SHADED
	vNormal = normalize( transformedNormal );
	#ifdef USE_TANGENT
		vTangent = normalize( transformedTangent );
		vBitangent = normalize( cross( vNormal, vTangent ) * tangent.w );
	#endif
#endif`,d0=`#ifdef USE_NORMALMAP
	uniform sampler2D normalMap;
	uniform vec2 normalScale;
#endif
#ifdef OBJECTSPACE_NORMALMAP
	uniform mat3 normalMatrix;
#endif
#if ! defined ( USE_TANGENT ) && ( defined ( TANGENTSPACE_NORMALMAP ) || defined ( USE_CLEARCOAT_NORMALMAP ) )
	vec3 perturbNormal2Arb( vec3 eye_pos, vec3 surf_norm, vec3 mapN, float faceDirection ) {
		vec3 q0 = dFdx( eye_pos.xyz );
		vec3 q1 = dFdy( eye_pos.xyz );
		vec2 st0 = dFdx( vUv.st );
		vec2 st1 = dFdy( vUv.st );
		vec3 N = surf_norm;
		vec3 q1perp = cross( q1, N );
		vec3 q0perp = cross( N, q0 );
		vec3 T = q1perp * st0.x + q0perp * st1.x;
		vec3 B = q1perp * st0.y + q0perp * st1.y;
		float det = max( dot( T, T ), dot( B, B ) );
		float scale = ( det == 0.0 ) ? 0.0 : faceDirection * inversesqrt( det );
		return normalize( T * ( mapN.x * scale ) + B * ( mapN.y * scale ) + N * mapN.z );
	}
#endif`,h0=`#ifdef USE_CLEARCOAT
	vec3 clearcoatNormal = geometryNormal;
#endif`,p0=`#ifdef USE_CLEARCOAT_NORMALMAP
	vec3 clearcoatMapN = texture2D( clearcoatNormalMap, vUv ).xyz * 2.0 - 1.0;
	clearcoatMapN.xy *= clearcoatNormalScale;
	#ifdef USE_TANGENT
		clearcoatNormal = normalize( vTBN * clearcoatMapN );
	#else
		clearcoatNormal = perturbNormal2Arb( - vViewPosition, clearcoatNormal, clearcoatMapN, faceDirection );
	#endif
#endif`,m0=`#ifdef USE_CLEARCOATMAP
	uniform sampler2D clearcoatMap;
#endif
#ifdef USE_CLEARCOAT_ROUGHNESSMAP
	uniform sampler2D clearcoatRoughnessMap;
#endif
#ifdef USE_CLEARCOAT_NORMALMAP
	uniform sampler2D clearcoatNormalMap;
	uniform vec2 clearcoatNormalScale;
#endif`,_0=`#ifdef USE_IRIDESCENCEMAP
	uniform sampler2D iridescenceMap;
#endif
#ifdef USE_IRIDESCENCE_THICKNESSMAP
	uniform sampler2D iridescenceThicknessMap;
#endif`,g0=`#ifdef OPAQUE
diffuseColor.a = 1.0;
#endif
#ifdef USE_TRANSMISSION
diffuseColor.a *= material.transmissionAlpha + 0.1;
#endif
gl_FragColor = vec4( outgoingLight, diffuseColor.a );`,b0=`vec3 packNormalToRGB( const in vec3 normal ) {
	return normalize( normal ) * 0.5 + 0.5;
}
vec3 unpackRGBToNormal( const in vec3 rgb ) {
	return 2.0 * rgb.xyz - 1.0;
}
const float PackUpscale = 256. / 255.;const float UnpackDownscale = 255. / 256.;
const vec3 PackFactors = vec3( 256. * 256. * 256., 256. * 256., 256. );
const vec4 UnpackFactors = UnpackDownscale / vec4( PackFactors, 1. );
const float ShiftRight8 = 1. / 256.;
vec4 packDepthToRGBA( const in float v ) {
	vec4 r = vec4( fract( v * PackFactors ), v );
	r.yzw -= r.xyz * ShiftRight8;	return r * PackUpscale;
}
float unpackRGBAToDepth( const in vec4 v ) {
	return dot( v, UnpackFactors );
}
vec2 packDepthToRG( in highp float v ) {
	return packDepthToRGBA( v ).yx;
}
float unpackRGToDepth( const in highp vec2 v ) {
	return unpackRGBAToDepth( vec4( v.xy, 0.0, 0.0 ) );
}
vec4 pack2HalfToRGBA( vec2 v ) {
	vec4 r = vec4( v.x, fract( v.x * 255.0 ), v.y, fract( v.y * 255.0 ) );
	return vec4( r.x - r.y / 255.0, r.y, r.z - r.w / 255.0, r.w );
}
vec2 unpackRGBATo2Half( vec4 v ) {
	return vec2( v.x + ( v.y / 255.0 ), v.z + ( v.w / 255.0 ) );
}
float viewZToOrthographicDepth( const in float viewZ, const in float near, const in float far ) {
	return ( viewZ + near ) / ( near - far );
}
float orthographicDepthToViewZ( const in float linearClipZ, const in float near, const in float far ) {
	return linearClipZ * ( near - far ) - near;
}
float viewZToPerspectiveDepth( const in float viewZ, const in float near, const in float far ) {
	return ( ( near + viewZ ) * far ) / ( ( far - near ) * viewZ );
}
float perspectiveDepthToViewZ( const in float invClipZ, const in float near, const in float far ) {
	return ( near * far ) / ( ( far - near ) * invClipZ - far );
}`,v0=`#ifdef PREMULTIPLIED_ALPHA
	gl_FragColor.rgb *= gl_FragColor.a;
#endif`,y0=`vec4 mvPosition = vec4( transformed, 1.0 );
#ifdef USE_INSTANCING
	mvPosition = instanceMatrix * mvPosition;
#endif
mvPosition = modelViewMatrix * mvPosition;
gl_Position = projectionMatrix * mvPosition;`,w0=`#ifdef DITHERING
	gl_FragColor.rgb = dithering( gl_FragColor.rgb );
#endif`,M0=`#ifdef DITHERING
	vec3 dithering( vec3 color ) {
		float grid_position = rand( gl_FragCoord.xy );
		vec3 dither_shift_RGB = vec3( 0.25 / 255.0, -0.25 / 255.0, 0.25 / 255.0 );
		dither_shift_RGB = mix( 2.0 * dither_shift_RGB, -2.0 * dither_shift_RGB, grid_position );
		return color + dither_shift_RGB;
	}
#endif`,x0=`float roughnessFactor = roughness;
#ifdef USE_ROUGHNESSMAP
	vec4 texelRoughness = texture2D( roughnessMap, vUv );
	roughnessFactor *= texelRoughness.g;
#endif`,S0=`#ifdef USE_ROUGHNESSMAP
	uniform sampler2D roughnessMap;
#endif`,C0=`#if NUM_SPOT_LIGHT_COORDS > 0
	varying vec4 vSpotLightCoord[ NUM_SPOT_LIGHT_COORDS ];
#endif
#if NUM_SPOT_LIGHT_MAPS > 0
	uniform sampler2D spotLightMap[ NUM_SPOT_LIGHT_MAPS ];
#endif
#ifdef USE_SHADOWMAP
	#if NUM_DIR_LIGHT_SHADOWS > 0
		uniform sampler2D directionalShadowMap[ NUM_DIR_LIGHT_SHADOWS ];
		varying vec4 vDirectionalShadowCoord[ NUM_DIR_LIGHT_SHADOWS ];
		struct DirectionalLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
		};
		uniform DirectionalLightShadow directionalLightShadows[ NUM_DIR_LIGHT_SHADOWS ];
	#endif
	#if NUM_SPOT_LIGHT_SHADOWS > 0
		uniform sampler2D spotShadowMap[ NUM_SPOT_LIGHT_SHADOWS ];
		struct SpotLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
		};
		uniform SpotLightShadow spotLightShadows[ NUM_SPOT_LIGHT_SHADOWS ];
	#endif
	#if NUM_POINT_LIGHT_SHADOWS > 0
		uniform sampler2D pointShadowMap[ NUM_POINT_LIGHT_SHADOWS ];
		varying vec4 vPointShadowCoord[ NUM_POINT_LIGHT_SHADOWS ];
		struct PointLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
			float shadowCameraNear;
			float shadowCameraFar;
		};
		uniform PointLightShadow pointLightShadows[ NUM_POINT_LIGHT_SHADOWS ];
	#endif
	float texture2DCompare( sampler2D depths, vec2 uv, float compare ) {
		return step( compare, unpackRGBAToDepth( texture2D( depths, uv ) ) );
	}
	vec2 texture2DDistribution( sampler2D shadow, vec2 uv ) {
		return unpackRGBATo2Half( texture2D( shadow, uv ) );
	}
	float VSMShadow (sampler2D shadow, vec2 uv, float compare ){
		float occlusion = 1.0;
		vec2 distribution = texture2DDistribution( shadow, uv );
		float hard_shadow = step( compare , distribution.x );
		if (hard_shadow != 1.0 ) {
			float distance = compare - distribution.x ;
			float variance = max( 0.00000, distribution.y * distribution.y );
			float softness_probability = variance / (variance + distance * distance );			softness_probability = clamp( ( softness_probability - 0.3 ) / ( 0.95 - 0.3 ), 0.0, 1.0 );			occlusion = clamp( max( hard_shadow, softness_probability ), 0.0, 1.0 );
		}
		return occlusion;
	}
	float getShadow( sampler2D shadowMap, vec2 shadowMapSize, float shadowBias, float shadowRadius, vec4 shadowCoord ) {
		float shadow = 1.0;
		shadowCoord.xyz /= shadowCoord.w;
		shadowCoord.z += shadowBias;
		bool inFrustum = shadowCoord.x >= 0.0 && shadowCoord.x <= 1.0 && shadowCoord.y >= 0.0 && shadowCoord.y <= 1.0;
		bool frustumTest = inFrustum && shadowCoord.z <= 1.0;
		if ( frustumTest ) {
		#if defined( SHADOWMAP_TYPE_PCF )
			vec2 texelSize = vec2( 1.0 ) / shadowMapSize;
			float dx0 = - texelSize.x * shadowRadius;
			float dy0 = - texelSize.y * shadowRadius;
			float dx1 = + texelSize.x * shadowRadius;
			float dy1 = + texelSize.y * shadowRadius;
			float dx2 = dx0 / 2.0;
			float dy2 = dy0 / 2.0;
			float dx3 = dx1 / 2.0;
			float dy3 = dy1 / 2.0;
			shadow = (
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx0, dy0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( 0.0, dy0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx1, dy0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx2, dy2 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( 0.0, dy2 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx3, dy2 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx0, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx2, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy, shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx3, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx1, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx2, dy3 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( 0.0, dy3 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx3, dy3 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx0, dy1 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( 0.0, dy1 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx1, dy1 ), shadowCoord.z )
			) * ( 1.0 / 17.0 );
		#elif defined( SHADOWMAP_TYPE_PCF_SOFT )
			vec2 texelSize = vec2( 1.0 ) / shadowMapSize;
			float dx = texelSize.x;
			float dy = texelSize.y;
			vec2 uv = shadowCoord.xy;
			vec2 f = fract( uv * shadowMapSize + 0.5 );
			uv -= f * texelSize;
			shadow = (
				texture2DCompare( shadowMap, uv, shadowCoord.z ) +
				texture2DCompare( shadowMap, uv + vec2( dx, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, uv + vec2( 0.0, dy ), shadowCoord.z ) +
				texture2DCompare( shadowMap, uv + texelSize, shadowCoord.z ) +
				mix( texture2DCompare( shadowMap, uv + vec2( -dx, 0.0 ), shadowCoord.z ),
					 texture2DCompare( shadowMap, uv + vec2( 2.0 * dx, 0.0 ), shadowCoord.z ),
					 f.x ) +
				mix( texture2DCompare( shadowMap, uv + vec2( -dx, dy ), shadowCoord.z ),
					 texture2DCompare( shadowMap, uv + vec2( 2.0 * dx, dy ), shadowCoord.z ),
					 f.x ) +
				mix( texture2DCompare( shadowMap, uv + vec2( 0.0, -dy ), shadowCoord.z ),
					 texture2DCompare( shadowMap, uv + vec2( 0.0, 2.0 * dy ), shadowCoord.z ),
					 f.y ) +
				mix( texture2DCompare( shadowMap, uv + vec2( dx, -dy ), shadowCoord.z ),
					 texture2DCompare( shadowMap, uv + vec2( dx, 2.0 * dy ), shadowCoord.z ),
					 f.y ) +
				mix( mix( texture2DCompare( shadowMap, uv + vec2( -dx, -dy ), shadowCoord.z ),
						  texture2DCompare( shadowMap, uv + vec2( 2.0 * dx, -dy ), shadowCoord.z ),
						  f.x ),
					 mix( texture2DCompare( shadowMap, uv + vec2( -dx, 2.0 * dy ), shadowCoord.z ),
						  texture2DCompare( shadowMap, uv + vec2( 2.0 * dx, 2.0 * dy ), shadowCoord.z ),
						  f.x ),
					 f.y )
			) * ( 1.0 / 9.0 );
		#elif defined( SHADOWMAP_TYPE_VSM )
			shadow = VSMShadow( shadowMap, shadowCoord.xy, shadowCoord.z );
		#else
			shadow = texture2DCompare( shadowMap, shadowCoord.xy, shadowCoord.z );
		#endif
		}
		return shadow;
	}
	vec2 cubeToUV( vec3 v, float texelSizeY ) {
		vec3 absV = abs( v );
		float scaleToCube = 1.0 / max( absV.x, max( absV.y, absV.z ) );
		absV *= scaleToCube;
		v *= scaleToCube * ( 1.0 - 2.0 * texelSizeY );
		vec2 planar = v.xy;
		float almostATexel = 1.5 * texelSizeY;
		float almostOne = 1.0 - almostATexel;
		if ( absV.z >= almostOne ) {
			if ( v.z > 0.0 )
				planar.x = 4.0 - v.x;
		} else if ( absV.x >= almostOne ) {
			float signX = sign( v.x );
			planar.x = v.z * signX + 2.0 * signX;
		} else if ( absV.y >= almostOne ) {
			float signY = sign( v.y );
			planar.x = v.x + 2.0 * signY + 2.0;
			planar.y = v.z * signY - 2.0;
		}
		return vec2( 0.125, 0.25 ) * planar + vec2( 0.375, 0.75 );
	}
	float getPointShadow( sampler2D shadowMap, vec2 shadowMapSize, float shadowBias, float shadowRadius, vec4 shadowCoord, float shadowCameraNear, float shadowCameraFar ) {
		vec2 texelSize = vec2( 1.0 ) / ( shadowMapSize * vec2( 4.0, 2.0 ) );
		vec3 lightToPosition = shadowCoord.xyz;
		float dp = ( length( lightToPosition ) - shadowCameraNear ) / ( shadowCameraFar - shadowCameraNear );		dp += shadowBias;
		vec3 bd3D = normalize( lightToPosition );
		#if defined( SHADOWMAP_TYPE_PCF ) || defined( SHADOWMAP_TYPE_PCF_SOFT ) || defined( SHADOWMAP_TYPE_VSM )
			vec2 offset = vec2( - 1, 1 ) * shadowRadius * texelSize.y;
			return (
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.xyy, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.yyy, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.xyx, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.yyx, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.xxy, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.yxy, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.xxx, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.yxx, texelSize.y ), dp )
			) * ( 1.0 / 9.0 );
		#else
			return texture2DCompare( shadowMap, cubeToUV( bd3D, texelSize.y ), dp );
		#endif
	}
#endif`,T0=`#if NUM_SPOT_LIGHT_COORDS > 0
	uniform mat4 spotLightMatrix[ NUM_SPOT_LIGHT_COORDS ];
	varying vec4 vSpotLightCoord[ NUM_SPOT_LIGHT_COORDS ];
#endif
#ifdef USE_SHADOWMAP
	#if NUM_DIR_LIGHT_SHADOWS > 0
		uniform mat4 directionalShadowMatrix[ NUM_DIR_LIGHT_SHADOWS ];
		varying vec4 vDirectionalShadowCoord[ NUM_DIR_LIGHT_SHADOWS ];
		struct DirectionalLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
		};
		uniform DirectionalLightShadow directionalLightShadows[ NUM_DIR_LIGHT_SHADOWS ];
	#endif
	#if NUM_SPOT_LIGHT_SHADOWS > 0
		struct SpotLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
		};
		uniform SpotLightShadow spotLightShadows[ NUM_SPOT_LIGHT_SHADOWS ];
	#endif
	#if NUM_POINT_LIGHT_SHADOWS > 0
		uniform mat4 pointShadowMatrix[ NUM_POINT_LIGHT_SHADOWS ];
		varying vec4 vPointShadowCoord[ NUM_POINT_LIGHT_SHADOWS ];
		struct PointLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
			float shadowCameraNear;
			float shadowCameraFar;
		};
		uniform PointLightShadow pointLightShadows[ NUM_POINT_LIGHT_SHADOWS ];
	#endif
#endif`,E0=`#if ( defined( USE_SHADOWMAP ) && ( NUM_DIR_LIGHT_SHADOWS > 0 || NUM_POINT_LIGHT_SHADOWS > 0 ) ) || ( NUM_SPOT_LIGHT_COORDS > 0 )
	vec3 shadowWorldNormal = inverseTransformDirection( transformedNormal, viewMatrix );
	vec4 shadowWorldPosition;
#endif
#if defined( USE_SHADOWMAP )
	#if NUM_DIR_LIGHT_SHADOWS > 0
		#pragma unroll_loop_start
		for ( int i = 0; i < NUM_DIR_LIGHT_SHADOWS; i ++ ) {
			shadowWorldPosition = worldPosition + vec4( shadowWorldNormal * directionalLightShadows[ i ].shadowNormalBias, 0 );
			vDirectionalShadowCoord[ i ] = directionalShadowMatrix[ i ] * shadowWorldPosition;
		}
		#pragma unroll_loop_end
	#endif
	#if NUM_POINT_LIGHT_SHADOWS > 0
		#pragma unroll_loop_start
		for ( int i = 0; i < NUM_POINT_LIGHT_SHADOWS; i ++ ) {
			shadowWorldPosition = worldPosition + vec4( shadowWorldNormal * pointLightShadows[ i ].shadowNormalBias, 0 );
			vPointShadowCoord[ i ] = pointShadowMatrix[ i ] * shadowWorldPosition;
		}
		#pragma unroll_loop_end
	#endif
#endif
#if NUM_SPOT_LIGHT_COORDS > 0
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_SPOT_LIGHT_COORDS; i ++ ) {
		shadowWorldPosition = worldPosition;
		#if ( defined( USE_SHADOWMAP ) && UNROLLED_LOOP_INDEX < NUM_SPOT_LIGHT_SHADOWS )
			shadowWorldPosition.xyz += shadowWorldNormal * spotLightShadows[ i ].shadowNormalBias;
		#endif
		vSpotLightCoord[ i ] = spotLightMatrix[ i ] * shadowWorldPosition;
	}
	#pragma unroll_loop_end
#endif`,L0=`float getShadowMask() {
	float shadow = 1.0;
	#ifdef USE_SHADOWMAP
	#if NUM_DIR_LIGHT_SHADOWS > 0
	DirectionalLightShadow directionalLight;
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_DIR_LIGHT_SHADOWS; i ++ ) {
		directionalLight = directionalLightShadows[ i ];
		shadow *= receiveShadow ? getShadow( directionalShadowMap[ i ], directionalLight.shadowMapSize, directionalLight.shadowBias, directionalLight.shadowRadius, vDirectionalShadowCoord[ i ] ) : 1.0;
	}
	#pragma unroll_loop_end
	#endif
	#if NUM_SPOT_LIGHT_SHADOWS > 0
	SpotLightShadow spotLight;
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_SPOT_LIGHT_SHADOWS; i ++ ) {
		spotLight = spotLightShadows[ i ];
		shadow *= receiveShadow ? getShadow( spotShadowMap[ i ], spotLight.shadowMapSize, spotLight.shadowBias, spotLight.shadowRadius, vSpotLightCoord[ i ] ) : 1.0;
	}
	#pragma unroll_loop_end
	#endif
	#if NUM_POINT_LIGHT_SHADOWS > 0
	PointLightShadow pointLight;
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_POINT_LIGHT_SHADOWS; i ++ ) {
		pointLight = pointLightShadows[ i ];
		shadow *= receiveShadow ? getPointShadow( pointShadowMap[ i ], pointLight.shadowMapSize, pointLight.shadowBias, pointLight.shadowRadius, vPointShadowCoord[ i ], pointLight.shadowCameraNear, pointLight.shadowCameraFar ) : 1.0;
	}
	#pragma unroll_loop_end
	#endif
	#endif
	return shadow;
}`,P0=`#ifdef USE_SKINNING
	mat4 boneMatX = getBoneMatrix( skinIndex.x );
	mat4 boneMatY = getBoneMatrix( skinIndex.y );
	mat4 boneMatZ = getBoneMatrix( skinIndex.z );
	mat4 boneMatW = getBoneMatrix( skinIndex.w );
#endif`,A0=`#ifdef USE_SKINNING
	uniform mat4 bindMatrix;
	uniform mat4 bindMatrixInverse;
	uniform highp sampler2D boneTexture;
	uniform int boneTextureSize;
	mat4 getBoneMatrix( const in float i ) {
		float j = i * 4.0;
		float x = mod( j, float( boneTextureSize ) );
		float y = floor( j / float( boneTextureSize ) );
		float dx = 1.0 / float( boneTextureSize );
		float dy = 1.0 / float( boneTextureSize );
		y = dy * ( y + 0.5 );
		vec4 v1 = texture2D( boneTexture, vec2( dx * ( x + 0.5 ), y ) );
		vec4 v2 = texture2D( boneTexture, vec2( dx * ( x + 1.5 ), y ) );
		vec4 v3 = texture2D( boneTexture, vec2( dx * ( x + 2.5 ), y ) );
		vec4 v4 = texture2D( boneTexture, vec2( dx * ( x + 3.5 ), y ) );
		mat4 bone = mat4( v1, v2, v3, v4 );
		return bone;
	}
#endif`,D0=`#ifdef USE_SKINNING
	vec4 skinVertex = bindMatrix * vec4( transformed, 1.0 );
	vec4 skinned = vec4( 0.0 );
	skinned += boneMatX * skinVertex * skinWeight.x;
	skinned += boneMatY * skinVertex * skinWeight.y;
	skinned += boneMatZ * skinVertex * skinWeight.z;
	skinned += boneMatW * skinVertex * skinWeight.w;
	transformed = ( bindMatrixInverse * skinned ).xyz;
#endif`,k0=`#ifdef USE_SKINNING
	mat4 skinMatrix = mat4( 0.0 );
	skinMatrix += skinWeight.x * boneMatX;
	skinMatrix += skinWeight.y * boneMatY;
	skinMatrix += skinWeight.z * boneMatZ;
	skinMatrix += skinWeight.w * boneMatW;
	skinMatrix = bindMatrixInverse * skinMatrix * bindMatrix;
	objectNormal = vec4( skinMatrix * vec4( objectNormal, 0.0 ) ).xyz;
	#ifdef USE_TANGENT
		objectTangent = vec4( skinMatrix * vec4( objectTangent, 0.0 ) ).xyz;
	#endif
#endif`,R0=`float specularStrength;
#ifdef USE_SPECULARMAP
	vec4 texelSpecular = texture2D( specularMap, vUv );
	specularStrength = texelSpecular.r;
#else
	specularStrength = 1.0;
#endif`,I0=`#ifdef USE_SPECULARMAP
	uniform sampler2D specularMap;
#endif`,N0=`#if defined( TONE_MAPPING )
	gl_FragColor.rgb = toneMapping( gl_FragColor.rgb );
#endif`,z0=`#ifndef saturate
#define saturate( a ) clamp( a, 0.0, 1.0 )
#endif
uniform float toneMappingExposure;
vec3 LinearToneMapping( vec3 color ) {
	return toneMappingExposure * color;
}
vec3 ReinhardToneMapping( vec3 color ) {
	color *= toneMappingExposure;
	return saturate( color / ( vec3( 1.0 ) + color ) );
}
vec3 OptimizedCineonToneMapping( vec3 color ) {
	color *= toneMappingExposure;
	color = max( vec3( 0.0 ), color - 0.004 );
	return pow( ( color * ( 6.2 * color + 0.5 ) ) / ( color * ( 6.2 * color + 1.7 ) + 0.06 ), vec3( 2.2 ) );
}
vec3 RRTAndODTFit( vec3 v ) {
	vec3 a = v * ( v + 0.0245786 ) - 0.000090537;
	vec3 b = v * ( 0.983729 * v + 0.4329510 ) + 0.238081;
	return a / b;
}
vec3 ACESFilmicToneMapping( vec3 color ) {
	const mat3 ACESInputMat = mat3(
		vec3( 0.59719, 0.07600, 0.02840 ),		vec3( 0.35458, 0.90834, 0.13383 ),
		vec3( 0.04823, 0.01566, 0.83777 )
	);
	const mat3 ACESOutputMat = mat3(
		vec3(  1.60475, -0.10208, -0.00327 ),		vec3( -0.53108,  1.10813, -0.07276 ),
		vec3( -0.07367, -0.00605,  1.07602 )
	);
	color *= toneMappingExposure / 0.6;
	color = ACESInputMat * color;
	color = RRTAndODTFit( color );
	color = ACESOutputMat * color;
	return saturate( color );
}
vec3 CustomToneMapping( vec3 color ) { return color; }`,F0=`#ifdef USE_TRANSMISSION
	material.transmission = transmission;
	material.transmissionAlpha = 1.0;
	material.thickness = thickness;
	material.attenuationDistance = attenuationDistance;
	material.attenuationColor = attenuationColor;
	#ifdef USE_TRANSMISSIONMAP
		material.transmission *= texture2D( transmissionMap, vUv ).r;
	#endif
	#ifdef USE_THICKNESSMAP
		material.thickness *= texture2D( thicknessMap, vUv ).g;
	#endif
	vec3 pos = vWorldPosition;
	vec3 v = normalize( cameraPosition - pos );
	vec3 n = inverseTransformDirection( normal, viewMatrix );
	vec4 transmission = getIBLVolumeRefraction(
		n, v, material.roughness, material.diffuseColor, material.specularColor, material.specularF90,
		pos, modelMatrix, viewMatrix, projectionMatrix, material.ior, material.thickness,
		material.attenuationColor, material.attenuationDistance );
	material.transmissionAlpha = mix( material.transmissionAlpha, transmission.a, material.transmission );
	totalDiffuse = mix( totalDiffuse, transmission.rgb, material.transmission );
#endif`,O0=`#ifdef USE_TRANSMISSION
	uniform float transmission;
	uniform float thickness;
	uniform float attenuationDistance;
	uniform vec3 attenuationColor;
	#ifdef USE_TRANSMISSIONMAP
		uniform sampler2D transmissionMap;
	#endif
	#ifdef USE_THICKNESSMAP
		uniform sampler2D thicknessMap;
	#endif
	uniform vec2 transmissionSamplerSize;
	uniform sampler2D transmissionSamplerMap;
	uniform mat4 modelMatrix;
	uniform mat4 projectionMatrix;
	varying vec3 vWorldPosition;
	float w0( float a ) {
		return ( 1.0 / 6.0 ) * ( a * ( a * ( - a + 3.0 ) - 3.0 ) + 1.0 );
	}
	float w1( float a ) {
		return ( 1.0 / 6.0 ) * ( a *  a * ( 3.0 * a - 6.0 ) + 4.0 );
	}
	float w2( float a ){
		return ( 1.0 / 6.0 ) * ( a * ( a * ( - 3.0 * a + 3.0 ) + 3.0 ) + 1.0 );
	}
	float w3( float a ) {
		return ( 1.0 / 6.0 ) * ( a * a * a );
	}
	float g0( float a ) {
		return w0( a ) + w1( a );
	}
	float g1( float a ) {
		return w2( a ) + w3( a );
	}
	float h0( float a ) {
		return - 1.0 + w1( a ) / ( w0( a ) + w1( a ) );
	}
	float h1( float a ) {
		return 1.0 + w3( a ) / ( w2( a ) + w3( a ) );
	}
	vec4 bicubic( sampler2D tex, vec2 uv, vec4 texelSize, vec2 fullSize, float lod ) {
		uv = uv * texelSize.zw + 0.5;
		vec2 iuv = floor( uv );
		vec2 fuv = fract( uv );
		float g0x = g0( fuv.x );
		float g1x = g1( fuv.x );
		float h0x = h0( fuv.x );
		float h1x = h1( fuv.x );
		float h0y = h0( fuv.y );
		float h1y = h1( fuv.y );
		vec2 p0 = ( vec2( iuv.x + h0x, iuv.y + h0y ) - 0.5 ) * texelSize.xy;
		vec2 p1 = ( vec2( iuv.x + h1x, iuv.y + h0y ) - 0.5 ) * texelSize.xy;
		vec2 p2 = ( vec2( iuv.x + h0x, iuv.y + h1y ) - 0.5 ) * texelSize.xy;
		vec2 p3 = ( vec2( iuv.x + h1x, iuv.y + h1y ) - 0.5 ) * texelSize.xy;
		
		vec2 lodFudge = pow( 1.95, lod ) / fullSize;
		return g0( fuv.y ) * ( g0x * textureLod( tex, p0, lod ) + g1x * textureLod( tex, p1, lod ) ) +
			g1( fuv.y ) * ( g0x * textureLod( tex, p2, lod ) + g1x * textureLod( tex, p3, lod ) );
	}
	vec4 textureBicubic( sampler2D sampler, vec2 uv, float lod ) {
		vec2 fLodSize = vec2( textureSize( sampler, int( lod ) ) );
		vec2 cLodSize = vec2( textureSize( sampler, int( lod + 1.0 ) ) );
		vec2 fLodSizeInv = 1.0 / fLodSize;
		vec2 cLodSizeInv = 1.0 / cLodSize;
		vec2 fullSize = vec2( textureSize( sampler, 0 ) );
		vec4 fSample = bicubic( sampler, uv, vec4( fLodSizeInv, fLodSize ), fullSize, floor( lod ) );
		vec4 cSample = bicubic( sampler, uv, vec4( cLodSizeInv, cLodSize ), fullSize, ceil( lod ) );
		return mix( fSample, cSample, fract( lod ) );
	}
	vec3 getVolumeTransmissionRay( const in vec3 n, const in vec3 v, const in float thickness, const in float ior, const in mat4 modelMatrix ) {
		vec3 refractionVector = refract( - v, normalize( n ), 1.0 / ior );
		vec3 modelScale;
		modelScale.x = length( vec3( modelMatrix[ 0 ].xyz ) );
		modelScale.y = length( vec3( modelMatrix[ 1 ].xyz ) );
		modelScale.z = length( vec3( modelMatrix[ 2 ].xyz ) );
		return normalize( refractionVector ) * thickness * modelScale;
	}
	float applyIorToRoughness( const in float roughness, const in float ior ) {
		return roughness * clamp( ior * 2.0 - 2.0, 0.0, 1.0 );
	}
	vec4 getTransmissionSample( const in vec2 fragCoord, const in float roughness, const in float ior ) {
		float lod = log2( transmissionSamplerSize.x ) * applyIorToRoughness( roughness, ior );
		return textureBicubic( transmissionSamplerMap, fragCoord.xy, lod );
	}
	vec3 applyVolumeAttenuation( const in vec3 radiance, const in float transmissionDistance, const in vec3 attenuationColor, const in float attenuationDistance ) {
		if ( isinf( attenuationDistance ) ) {
			return radiance;
		} else {
			vec3 attenuationCoefficient = -log( attenuationColor ) / attenuationDistance;
			vec3 transmittance = exp( - attenuationCoefficient * transmissionDistance );			return transmittance * radiance;
		}
	}
	vec4 getIBLVolumeRefraction( const in vec3 n, const in vec3 v, const in float roughness, const in vec3 diffuseColor,
		const in vec3 specularColor, const in float specularF90, const in vec3 position, const in mat4 modelMatrix,
		const in mat4 viewMatrix, const in mat4 projMatrix, const in float ior, const in float thickness,
		const in vec3 attenuationColor, const in float attenuationDistance ) {
		vec3 transmissionRay = getVolumeTransmissionRay( n, v, thickness, ior, modelMatrix );
		vec3 refractedRayExit = position + transmissionRay;
		vec4 ndcPos = projMatrix * viewMatrix * vec4( refractedRayExit, 1.0 );
		vec2 refractionCoords = ndcPos.xy / ndcPos.w;
		refractionCoords += 1.0;
		refractionCoords /= 2.0;
		vec4 transmittedLight = getTransmissionSample( refractionCoords, roughness, ior );
		vec3 attenuatedColor = applyVolumeAttenuation( transmittedLight.rgb, length( transmissionRay ), attenuationColor, attenuationDistance );
		vec3 F = EnvironmentBRDF( n, v, specularColor, specularF90, roughness );
		return vec4( ( 1.0 - F ) * attenuatedColor * diffuseColor, transmittedLight.a );
	}
#endif`,U0=`#if ( defined( USE_UV ) && ! defined( UVS_VERTEX_ONLY ) )
	varying vec2 vUv;
#endif`,B0=`#ifdef USE_UV
	#ifdef UVS_VERTEX_ONLY
		vec2 vUv;
	#else
		varying vec2 vUv;
	#endif
	uniform mat3 uvTransform;
#endif`,V0=`#ifdef USE_UV
	vUv = ( uvTransform * vec3( uv, 1 ) ).xy;
#endif`,G0=`#if defined( USE_LIGHTMAP ) || defined( USE_AOMAP )
	varying vec2 vUv2;
#endif`,H0=`#if defined( USE_LIGHTMAP ) || defined( USE_AOMAP )
	attribute vec2 uv2;
	varying vec2 vUv2;
	uniform mat3 uv2Transform;
#endif`,W0=`#if defined( USE_LIGHTMAP ) || defined( USE_AOMAP )
	vUv2 = ( uv2Transform * vec3( uv2, 1 ) ).xy;
#endif`,X0=`#if defined( USE_ENVMAP ) || defined( DISTANCE ) || defined ( USE_SHADOWMAP ) || defined ( USE_TRANSMISSION ) || NUM_SPOT_LIGHT_COORDS > 0
	vec4 worldPosition = vec4( transformed, 1.0 );
	#ifdef USE_INSTANCING
		worldPosition = instanceMatrix * worldPosition;
	#endif
	worldPosition = modelMatrix * worldPosition;
#endif`;const j0=`varying vec2 vUv;
uniform mat3 uvTransform;
void main() {
	vUv = ( uvTransform * vec3( uv, 1 ) ).xy;
	gl_Position = vec4( position.xy, 1.0, 1.0 );
}`,q0=`uniform sampler2D t2D;
uniform float backgroundIntensity;
varying vec2 vUv;
void main() {
	vec4 texColor = texture2D( t2D, vUv );
	#ifdef DECODE_VIDEO_TEXTURE
		texColor = vec4( mix( pow( texColor.rgb * 0.9478672986 + vec3( 0.0521327014 ), vec3( 2.4 ) ), texColor.rgb * 0.0773993808, vec3( lessThanEqual( texColor.rgb, vec3( 0.04045 ) ) ) ), texColor.w );
	#endif
	texColor.rgb *= backgroundIntensity;
	gl_FragColor = texColor;
	#include <tonemapping_fragment>
	#include <encodings_fragment>
}`,Y0=`varying vec3 vWorldDirection;
#include <common>
void main() {
	vWorldDirection = transformDirection( position, modelMatrix );
	#include <begin_vertex>
	#include <project_vertex>
	gl_Position.z = gl_Position.w;
}`,Z0=`#ifdef ENVMAP_TYPE_CUBE
	uniform samplerCube envMap;
#elif defined( ENVMAP_TYPE_CUBE_UV )
	uniform sampler2D envMap;
#endif
uniform float flipEnvMap;
uniform float backgroundBlurriness;
uniform float backgroundIntensity;
varying vec3 vWorldDirection;
#include <cube_uv_reflection_fragment>
void main() {
	#ifdef ENVMAP_TYPE_CUBE
		vec4 texColor = textureCube( envMap, vec3( flipEnvMap * vWorldDirection.x, vWorldDirection.yz ) );
	#elif defined( ENVMAP_TYPE_CUBE_UV )
		vec4 texColor = textureCubeUV( envMap, vWorldDirection, backgroundBlurriness );
	#else
		vec4 texColor = vec4( 0.0, 0.0, 0.0, 1.0 );
	#endif
	texColor.rgb *= backgroundIntensity;
	gl_FragColor = texColor;
	#include <tonemapping_fragment>
	#include <encodings_fragment>
}`,K0=`varying vec3 vWorldDirection;
#include <common>
void main() {
	vWorldDirection = transformDirection( position, modelMatrix );
	#include <begin_vertex>
	#include <project_vertex>
	gl_Position.z = gl_Position.w;
}`,J0=`uniform samplerCube tCube;
uniform float tFlip;
uniform float opacity;
varying vec3 vWorldDirection;
void main() {
	vec4 texColor = textureCube( tCube, vec3( tFlip * vWorldDirection.x, vWorldDirection.yz ) );
	gl_FragColor = texColor;
	gl_FragColor.a *= opacity;
	#include <tonemapping_fragment>
	#include <encodings_fragment>
}`,Q0=`#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
varying vec2 vHighPrecisionZW;
void main() {
	#include <uv_vertex>
	#include <skinbase_vertex>
	#ifdef USE_DISPLACEMENTMAP
		#include <beginnormal_vertex>
		#include <morphnormal_vertex>
		#include <skinnormal_vertex>
	#endif
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vHighPrecisionZW = gl_Position.zw;
}`,$0=`#if DEPTH_PACKING == 3200
	uniform float opacity;
#endif
#include <common>
#include <packing>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
varying vec2 vHighPrecisionZW;
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( 1.0 );
	#if DEPTH_PACKING == 3200
		diffuseColor.a = opacity;
	#endif
	#include <map_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <logdepthbuf_fragment>
	float fragCoordZ = 0.5 * vHighPrecisionZW[0] / vHighPrecisionZW[1] + 0.5;
	#if DEPTH_PACKING == 3200
		gl_FragColor = vec4( vec3( 1.0 - fragCoordZ ), opacity );
	#elif DEPTH_PACKING == 3201
		gl_FragColor = packDepthToRGBA( fragCoordZ );
	#endif
}`,e1=`#define DISTANCE
varying vec3 vWorldPosition;
#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <skinbase_vertex>
	#ifdef USE_DISPLACEMENTMAP
		#include <beginnormal_vertex>
		#include <morphnormal_vertex>
		#include <skinnormal_vertex>
	#endif
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <worldpos_vertex>
	#include <clipping_planes_vertex>
	vWorldPosition = worldPosition.xyz;
}`,t1=`#define DISTANCE
uniform vec3 referencePosition;
uniform float nearDistance;
uniform float farDistance;
varying vec3 vWorldPosition;
#include <common>
#include <packing>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <clipping_planes_pars_fragment>
void main () {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( 1.0 );
	#include <map_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	float dist = length( vWorldPosition - referencePosition );
	dist = ( dist - nearDistance ) / ( farDistance - nearDistance );
	dist = saturate( dist );
	gl_FragColor = packDepthToRGBA( dist );
}`,n1=`varying vec3 vWorldDirection;
#include <common>
void main() {
	vWorldDirection = transformDirection( position, modelMatrix );
	#include <begin_vertex>
	#include <project_vertex>
}`,i1=`uniform sampler2D tEquirect;
varying vec3 vWorldDirection;
#include <common>
void main() {
	vec3 direction = normalize( vWorldDirection );
	vec2 sampleUV = equirectUv( direction );
	gl_FragColor = texture2D( tEquirect, sampleUV );
	#include <tonemapping_fragment>
	#include <encodings_fragment>
}`,r1=`uniform float scale;
attribute float lineDistance;
varying float vLineDistance;
#include <common>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	vLineDistance = scale * lineDistance;
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <fog_vertex>
}`,s1=`uniform vec3 diffuse;
uniform float opacity;
uniform float dashSize;
uniform float totalSize;
varying float vLineDistance;
#include <common>
#include <color_pars_fragment>
#include <fog_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	if ( mod( vLineDistance, totalSize ) > dashSize ) {
		discard;
	}
	vec3 outgoingLight = vec3( 0.0 );
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <color_fragment>
	outgoingLight = diffuseColor.rgb;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
}`,a1=`#include <common>
#include <uv_pars_vertex>
#include <uv2_pars_vertex>
#include <envmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <uv2_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#if defined ( USE_ENVMAP ) || defined ( USE_SKINNING )
		#include <beginnormal_vertex>
		#include <morphnormal_vertex>
		#include <skinbase_vertex>
		#include <skinnormal_vertex>
		#include <defaultnormal_vertex>
	#endif
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <worldpos_vertex>
	#include <envmap_vertex>
	#include <fog_vertex>
}`,o1=`uniform vec3 diffuse;
uniform float opacity;
#ifndef FLAT_SHADED
	varying vec3 vNormal;
#endif
#include <common>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <uv2_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_pars_fragment>
#include <fog_pars_fragment>
#include <specularmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <specularmap_fragment>
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	#ifdef USE_LIGHTMAP
		vec4 lightMapTexel = texture2D( lightMap, vUv2 );
		reflectedLight.indirectDiffuse += lightMapTexel.rgb * lightMapIntensity * RECIPROCAL_PI;
	#else
		reflectedLight.indirectDiffuse += vec3( 1.0 );
	#endif
	#include <aomap_fragment>
	reflectedLight.indirectDiffuse *= diffuseColor.rgb;
	vec3 outgoingLight = reflectedLight.indirectDiffuse;
	#include <envmap_fragment>
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,l1=`#define LAMBERT
varying vec3 vViewPosition;
#include <common>
#include <uv_pars_vertex>
#include <uv2_pars_vertex>
#include <displacementmap_pars_vertex>
#include <envmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <uv2_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vViewPosition = - mvPosition.xyz;
	#include <worldpos_vertex>
	#include <envmap_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
}`,c1=`#define LAMBERT
uniform vec3 diffuse;
uniform vec3 emissive;
uniform float opacity;
#include <common>
#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <uv2_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_pars_fragment>
#include <fog_pars_fragment>
#include <bsdfs>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_lambert_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <specularmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <specularmap_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_lambert_fragment>
	#include <lights_fragment_begin>
	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 outgoingLight = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse + totalEmissiveRadiance;
	#include <envmap_fragment>
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,u1=`#define MATCAP
varying vec3 vViewPosition;
#include <common>
#include <uv_pars_vertex>
#include <color_pars_vertex>
#include <displacementmap_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <fog_vertex>
	vViewPosition = - mvPosition.xyz;
}`,f1=`#define MATCAP
uniform vec3 diffuse;
uniform float opacity;
uniform sampler2D matcap;
varying vec3 vViewPosition;
#include <common>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <fog_pars_fragment>
#include <normal_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	vec3 viewDir = normalize( vViewPosition );
	vec3 x = normalize( vec3( viewDir.z, 0.0, - viewDir.x ) );
	vec3 y = cross( viewDir, x );
	vec2 uv = vec2( dot( x, normal ), dot( y, normal ) ) * 0.495 + 0.5;
	#ifdef USE_MATCAP
		vec4 matcapColor = texture2D( matcap, uv );
	#else
		vec4 matcapColor = vec4( vec3( mix( 0.2, 0.8, uv.y ) ), 1.0 );
	#endif
	vec3 outgoingLight = diffuseColor.rgb * matcapColor.rgb;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,d1=`#define NORMAL
#if defined( FLAT_SHADED ) || defined( USE_BUMPMAP ) || defined( TANGENTSPACE_NORMALMAP )
	varying vec3 vViewPosition;
#endif
#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
#if defined( FLAT_SHADED ) || defined( USE_BUMPMAP ) || defined( TANGENTSPACE_NORMALMAP )
	vViewPosition = - mvPosition.xyz;
#endif
}`,h1=`#define NORMAL
uniform float opacity;
#if defined( FLAT_SHADED ) || defined( USE_BUMPMAP ) || defined( TANGENTSPACE_NORMALMAP )
	varying vec3 vViewPosition;
#endif
#include <packing>
#include <uv_pars_fragment>
#include <normal_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	#include <logdepthbuf_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	gl_FragColor = vec4( packNormalToRGB( normal ), opacity );
	#ifdef OPAQUE
		gl_FragColor.a = 1.0;
	#endif
}`,p1=`#define PHONG
varying vec3 vViewPosition;
#include <common>
#include <uv_pars_vertex>
#include <uv2_pars_vertex>
#include <displacementmap_pars_vertex>
#include <envmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <uv2_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vViewPosition = - mvPosition.xyz;
	#include <worldpos_vertex>
	#include <envmap_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
}`,m1=`#define PHONG
uniform vec3 diffuse;
uniform vec3 emissive;
uniform vec3 specular;
uniform float shininess;
uniform float opacity;
#include <common>
#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <uv2_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_pars_fragment>
#include <fog_pars_fragment>
#include <bsdfs>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_phong_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <specularmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <specularmap_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_phong_fragment>
	#include <lights_fragment_begin>
	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 outgoingLight = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse + reflectedLight.directSpecular + reflectedLight.indirectSpecular + totalEmissiveRadiance;
	#include <envmap_fragment>
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,_1=`#define STANDARD
varying vec3 vViewPosition;
#ifdef USE_TRANSMISSION
	varying vec3 vWorldPosition;
#endif
#include <common>
#include <uv_pars_vertex>
#include <uv2_pars_vertex>
#include <displacementmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <uv2_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vViewPosition = - mvPosition.xyz;
	#include <worldpos_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
#ifdef USE_TRANSMISSION
	vWorldPosition = worldPosition.xyz;
#endif
}`,g1=`#define STANDARD
#ifdef PHYSICAL
	#define IOR
	#define SPECULAR
#endif
uniform vec3 diffuse;
uniform vec3 emissive;
uniform float roughness;
uniform float metalness;
uniform float opacity;
#ifdef IOR
	uniform float ior;
#endif
#ifdef SPECULAR
	uniform float specularIntensity;
	uniform vec3 specularColor;
	#ifdef USE_SPECULARINTENSITYMAP
		uniform sampler2D specularIntensityMap;
	#endif
	#ifdef USE_SPECULARCOLORMAP
		uniform sampler2D specularColorMap;
	#endif
#endif
#ifdef USE_CLEARCOAT
	uniform float clearcoat;
	uniform float clearcoatRoughness;
#endif
#ifdef USE_IRIDESCENCE
	uniform float iridescence;
	uniform float iridescenceIOR;
	uniform float iridescenceThicknessMinimum;
	uniform float iridescenceThicknessMaximum;
#endif
#ifdef USE_SHEEN
	uniform vec3 sheenColor;
	uniform float sheenRoughness;
	#ifdef USE_SHEENCOLORMAP
		uniform sampler2D sheenColorMap;
	#endif
	#ifdef USE_SHEENROUGHNESSMAP
		uniform sampler2D sheenRoughnessMap;
	#endif
#endif
varying vec3 vViewPosition;
#include <common>
#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <uv2_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <bsdfs>
#include <iridescence_fragment>
#include <cube_uv_reflection_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_physical_pars_fragment>
#include <fog_pars_fragment>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_physical_pars_fragment>
#include <transmission_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <clearcoat_pars_fragment>
#include <iridescence_pars_fragment>
#include <roughnessmap_pars_fragment>
#include <metalnessmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <roughnessmap_fragment>
	#include <metalnessmap_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <clearcoat_normal_fragment_begin>
	#include <clearcoat_normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_physical_fragment>
	#include <lights_fragment_begin>
	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 totalDiffuse = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse;
	vec3 totalSpecular = reflectedLight.directSpecular + reflectedLight.indirectSpecular;
	#include <transmission_fragment>
	vec3 outgoingLight = totalDiffuse + totalSpecular + totalEmissiveRadiance;
	#ifdef USE_SHEEN
		float sheenEnergyComp = 1.0 - 0.157 * max3( material.sheenColor );
		outgoingLight = outgoingLight * sheenEnergyComp + sheenSpecular;
	#endif
	#ifdef USE_CLEARCOAT
		float dotNVcc = saturate( dot( geometry.clearcoatNormal, geometry.viewDir ) );
		vec3 Fcc = F_Schlick( material.clearcoatF0, material.clearcoatF90, dotNVcc );
		outgoingLight = outgoingLight * ( 1.0 - material.clearcoat * Fcc ) + clearcoatSpecular * material.clearcoat;
	#endif
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,b1=`#define TOON
varying vec3 vViewPosition;
#include <common>
#include <uv_pars_vertex>
#include <uv2_pars_vertex>
#include <displacementmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <uv2_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vViewPosition = - mvPosition.xyz;
	#include <worldpos_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
}`,v1=`#define TOON
uniform vec3 diffuse;
uniform vec3 emissive;
uniform float opacity;
#include <common>
#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <uv2_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <gradientmap_pars_fragment>
#include <fog_pars_fragment>
#include <bsdfs>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_toon_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_toon_fragment>
	#include <lights_fragment_begin>
	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 outgoingLight = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse + totalEmissiveRadiance;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,y1=`uniform float size;
uniform float scale;
#include <common>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <project_vertex>
	gl_PointSize = size;
	#ifdef USE_SIZEATTENUATION
		bool isPerspective = isPerspectiveMatrix( projectionMatrix );
		if ( isPerspective ) gl_PointSize *= ( scale / - mvPosition.z );
	#endif
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <worldpos_vertex>
	#include <fog_vertex>
}`,w1=`uniform vec3 diffuse;
uniform float opacity;
#include <common>
#include <color_pars_fragment>
#include <map_particle_pars_fragment>
#include <alphatest_pars_fragment>
#include <fog_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec3 outgoingLight = vec3( 0.0 );
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_particle_fragment>
	#include <color_fragment>
	#include <alphatest_fragment>
	outgoingLight = diffuseColor.rgb;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
}`,M1=`#include <common>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <shadowmap_pars_vertex>
void main() {
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <worldpos_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
}`,x1=`uniform vec3 color;
uniform float opacity;
#include <common>
#include <packing>
#include <fog_pars_fragment>
#include <bsdfs>
#include <lights_pars_begin>
#include <logdepthbuf_pars_fragment>
#include <shadowmap_pars_fragment>
#include <shadowmask_pars_fragment>
void main() {
	#include <logdepthbuf_fragment>
	gl_FragColor = vec4( color, opacity * ( 1.0 - getShadowMask() ) );
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
}`,S1=`uniform float rotation;
uniform vec2 center;
#include <common>
#include <uv_pars_vertex>
#include <fog_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	vec4 mvPosition = modelViewMatrix * vec4( 0.0, 0.0, 0.0, 1.0 );
	vec2 scale;
	scale.x = length( vec3( modelMatrix[ 0 ].x, modelMatrix[ 0 ].y, modelMatrix[ 0 ].z ) );
	scale.y = length( vec3( modelMatrix[ 1 ].x, modelMatrix[ 1 ].y, modelMatrix[ 1 ].z ) );
	#ifndef USE_SIZEATTENUATION
		bool isPerspective = isPerspectiveMatrix( projectionMatrix );
		if ( isPerspective ) scale *= - mvPosition.z;
	#endif
	vec2 alignedPosition = ( position.xy - ( center - vec2( 0.5 ) ) ) * scale;
	vec2 rotatedPosition;
	rotatedPosition.x = cos( rotation ) * alignedPosition.x - sin( rotation ) * alignedPosition.y;
	rotatedPosition.y = sin( rotation ) * alignedPosition.x + cos( rotation ) * alignedPosition.y;
	mvPosition.xy += rotatedPosition;
	gl_Position = projectionMatrix * mvPosition;
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <fog_vertex>
}`,C1=`uniform vec3 diffuse;
uniform float opacity;
#include <common>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <fog_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec3 outgoingLight = vec3( 0.0 );
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	outgoingLight = diffuseColor.rgb;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
}`,Ye={alphamap_fragment:Y_,alphamap_pars_fragment:Z_,alphatest_fragment:K_,alphatest_pars_fragment:J_,aomap_fragment:Q_,aomap_pars_fragment:$_,begin_vertex:eg,beginnormal_vertex:tg,bsdfs:ng,iridescence_fragment:ig,bumpmap_pars_fragment:rg,clipping_planes_fragment:sg,clipping_planes_pars_fragment:ag,clipping_planes_pars_vertex:og,clipping_planes_vertex:lg,color_fragment:cg,color_pars_fragment:ug,color_pars_vertex:fg,color_vertex:dg,common:hg,cube_uv_reflection_fragment:pg,defaultnormal_vertex:mg,displacementmap_pars_vertex:_g,displacementmap_vertex:gg,emissivemap_fragment:bg,emissivemap_pars_fragment:vg,encodings_fragment:yg,encodings_pars_fragment:wg,envmap_fragment:Mg,envmap_common_pars_fragment:xg,envmap_pars_fragment:Sg,envmap_pars_vertex:Cg,envmap_physical_pars_fragment:Fg,envmap_vertex:Tg,fog_vertex:Eg,fog_pars_vertex:Lg,fog_fragment:Pg,fog_pars_fragment:Ag,gradientmap_pars_fragment:Dg,lightmap_fragment:kg,lightmap_pars_fragment:Rg,lights_lambert_fragment:Ig,lights_lambert_pars_fragment:Ng,lights_pars_begin:zg,lights_toon_fragment:Og,lights_toon_pars_fragment:Ug,lights_phong_fragment:Bg,lights_phong_pars_fragment:Vg,lights_physical_fragment:Gg,lights_physical_pars_fragment:Hg,lights_fragment_begin:Wg,lights_fragment_maps:Xg,lights_fragment_end:jg,logdepthbuf_fragment:qg,logdepthbuf_pars_fragment:Yg,logdepthbuf_pars_vertex:Zg,logdepthbuf_vertex:Kg,map_fragment:Jg,map_pars_fragment:Qg,map_particle_fragment:$g,map_particle_pars_fragment:e0,metalnessmap_fragment:t0,metalnessmap_pars_fragment:n0,morphcolor_vertex:i0,morphnormal_vertex:r0,morphtarget_pars_vertex:s0,morphtarget_vertex:a0,normal_fragment_begin:o0,normal_fragment_maps:l0,normal_pars_fragment:c0,normal_pars_vertex:u0,normal_vertex:f0,normalmap_pars_fragment:d0,clearcoat_normal_fragment_begin:h0,clearcoat_normal_fragment_maps:p0,clearcoat_pars_fragment:m0,iridescence_pars_fragment:_0,output_fragment:g0,packing:b0,premultiplied_alpha_fragment:v0,project_vertex:y0,dithering_fragment:w0,dithering_pars_fragment:M0,roughnessmap_fragment:x0,roughnessmap_pars_fragment:S0,shadowmap_pars_fragment:C0,shadowmap_pars_vertex:T0,shadowmap_vertex:E0,shadowmask_pars_fragment:L0,skinbase_vertex:P0,skinning_pars_vertex:A0,skinning_vertex:D0,skinnormal_vertex:k0,specularmap_fragment:R0,specularmap_pars_fragment:I0,tonemapping_fragment:N0,tonemapping_pars_fragment:z0,transmission_fragment:F0,transmission_pars_fragment:O0,uv_pars_fragment:U0,uv_pars_vertex:B0,uv_vertex:V0,uv2_pars_fragment:G0,uv2_pars_vertex:H0,uv2_vertex:W0,worldpos_vertex:X0,background_vert:j0,background_frag:q0,backgroundCube_vert:Y0,backgroundCube_frag:Z0,cube_vert:K0,cube_frag:J0,depth_vert:Q0,depth_frag:$0,distanceRGBA_vert:e1,distanceRGBA_frag:t1,equirect_vert:n1,equirect_frag:i1,linedashed_vert:r1,linedashed_frag:s1,meshbasic_vert:a1,meshbasic_frag:o1,meshlambert_vert:l1,meshlambert_frag:c1,meshmatcap_vert:u1,meshmatcap_frag:f1,meshnormal_vert:d1,meshnormal_frag:h1,meshphong_vert:p1,meshphong_frag:m1,meshphysical_vert:_1,meshphysical_frag:g1,meshtoon_vert:b1,meshtoon_frag:v1,points_vert:y1,points_frag:w1,shadow_vert:M1,shadow_frag:x1,sprite_vert:S1,sprite_frag:C1},ge={common:{diffuse:{value:new pt(16777215)},opacity:{value:1},map:{value:null},uvTransform:{value:new Kt},uv2Transform:{value:new Kt},alphaMap:{value:null},alphaTest:{value:0}},specularmap:{specularMap:{value:null}},envmap:{envMap:{value:null},flipEnvMap:{value:-1},reflectivity:{value:1},ior:{value:1.5},refractionRatio:{value:.98}},aomap:{aoMap:{value:null},aoMapIntensity:{value:1}},lightmap:{lightMap:{value:null},lightMapIntensity:{value:1}},emissivemap:{emissiveMap:{value:null}},bumpmap:{bumpMap:{value:null},bumpScale:{value:1}},normalmap:{normalMap:{value:null},normalScale:{value:new ot(1,1)}},displacementmap:{displacementMap:{value:null},displacementScale:{value:1},displacementBias:{value:0}},roughnessmap:{roughnessMap:{value:null}},metalnessmap:{metalnessMap:{value:null}},gradientmap:{gradientMap:{value:null}},fog:{fogDensity:{value:25e-5},fogNear:{value:1},fogFar:{value:2e3},fogColor:{value:new pt(16777215)}},lights:{ambientLightColor:{value:[]},lightProbe:{value:[]},directionalLights:{value:[],properties:{direction:{},color:{}}},directionalLightShadows:{value:[],properties:{shadowBias:{},shadowNormalBias:{},shadowRadius:{},shadowMapSize:{}}},directionalShadowMap:{value:[]},directionalShadowMatrix:{value:[]},spotLights:{value:[],properties:{color:{},position:{},direction:{},distance:{},coneCos:{},penumbraCos:{},decay:{}}},spotLightShadows:{value:[],properties:{shadowBias:{},shadowNormalBias:{},shadowRadius:{},shadowMapSize:{}}},spotLightMap:{value:[]},spotShadowMap:{value:[]},spotLightMatrix:{value:[]},pointLights:{value:[],properties:{color:{},position:{},decay:{},distance:{}}},pointLightShadows:{value:[],properties:{shadowBias:{},shadowNormalBias:{},shadowRadius:{},shadowMapSize:{},shadowCameraNear:{},shadowCameraFar:{}}},pointShadowMap:{value:[]},pointShadowMatrix:{value:[]},hemisphereLights:{value:[],properties:{direction:{},skyColor:{},groundColor:{}}},rectAreaLights:{value:[],properties:{color:{},position:{},width:{},height:{}}},ltc_1:{value:null},ltc_2:{value:null}},points:{diffuse:{value:new pt(16777215)},opacity:{value:1},size:{value:1},scale:{value:1},map:{value:null},alphaMap:{value:null},alphaTest:{value:0},uvTransform:{value:new Kt}},sprite:{diffuse:{value:new pt(16777215)},opacity:{value:1},center:{value:new ot(.5,.5)},rotation:{value:0},map:{value:null},alphaMap:{value:null},alphaTest:{value:0},uvTransform:{value:new Kt}}},Sn={basic:{uniforms:qt([ge.common,ge.specularmap,ge.envmap,ge.aomap,ge.lightmap,ge.fog]),vertexShader:Ye.meshbasic_vert,fragmentShader:Ye.meshbasic_frag},lambert:{uniforms:qt([ge.common,ge.specularmap,ge.envmap,ge.aomap,ge.lightmap,ge.emissivemap,ge.bumpmap,ge.normalmap,ge.displacementmap,ge.fog,ge.lights,{emissive:{value:new pt(0)}}]),vertexShader:Ye.meshlambert_vert,fragmentShader:Ye.meshlambert_frag},phong:{uniforms:qt([ge.common,ge.specularmap,ge.envmap,ge.aomap,ge.lightmap,ge.emissivemap,ge.bumpmap,ge.normalmap,ge.displacementmap,ge.fog,ge.lights,{emissive:{value:new pt(0)},specular:{value:new pt(1118481)},shininess:{value:30}}]),vertexShader:Ye.meshphong_vert,fragmentShader:Ye.meshphong_frag},standard:{uniforms:qt([ge.common,ge.envmap,ge.aomap,ge.lightmap,ge.emissivemap,ge.bumpmap,ge.normalmap,ge.displacementmap,ge.roughnessmap,ge.metalnessmap,ge.fog,ge.lights,{emissive:{value:new pt(0)},roughness:{value:1},metalness:{value:0},envMapIntensity:{value:1}}]),vertexShader:Ye.meshphysical_vert,fragmentShader:Ye.meshphysical_frag},toon:{uniforms:qt([ge.common,ge.aomap,ge.lightmap,ge.emissivemap,ge.bumpmap,ge.normalmap,ge.displacementmap,ge.gradientmap,ge.fog,ge.lights,{emissive:{value:new pt(0)}}]),vertexShader:Ye.meshtoon_vert,fragmentShader:Ye.meshtoon_frag},matcap:{uniforms:qt([ge.common,ge.bumpmap,ge.normalmap,ge.displacementmap,ge.fog,{matcap:{value:null}}]),vertexShader:Ye.meshmatcap_vert,fragmentShader:Ye.meshmatcap_frag},points:{uniforms:qt([ge.points,ge.fog]),vertexShader:Ye.points_vert,fragmentShader:Ye.points_frag},dashed:{uniforms:qt([ge.common,ge.fog,{scale:{value:1},dashSize:{value:1},totalSize:{value:2}}]),vertexShader:Ye.linedashed_vert,fragmentShader:Ye.linedashed_frag},depth:{uniforms:qt([ge.common,ge.displacementmap]),vertexShader:Ye.depth_vert,fragmentShader:Ye.depth_frag},normal:{uniforms:qt([ge.common,ge.bumpmap,ge.normalmap,ge.displacementmap,{opacity:{value:1}}]),vertexShader:Ye.meshnormal_vert,fragmentShader:Ye.meshnormal_frag},sprite:{uniforms:qt([ge.sprite,ge.fog]),vertexShader:Ye.sprite_vert,fragmentShader:Ye.sprite_frag},background:{uniforms:{uvTransform:{value:new Kt},t2D:{value:null},backgroundIntensity:{value:1}},vertexShader:Ye.background_vert,fragmentShader:Ye.background_frag},backgroundCube:{uniforms:{envMap:{value:null},flipEnvMap:{value:-1},backgroundBlurriness:{value:0},backgroundIntensity:{value:1}},vertexShader:Ye.backgroundCube_vert,fragmentShader:Ye.backgroundCube_frag},cube:{uniforms:{tCube:{value:null},tFlip:{value:-1},opacity:{value:1}},vertexShader:Ye.cube_vert,fragmentShader:Ye.cube_frag},equirect:{uniforms:{tEquirect:{value:null}},vertexShader:Ye.equirect_vert,fragmentShader:Ye.equirect_frag},distanceRGBA:{uniforms:qt([ge.common,ge.displacementmap,{referencePosition:{value:new G},nearDistance:{value:1},farDistance:{value:1e3}}]),vertexShader:Ye.distanceRGBA_vert,fragmentShader:Ye.distanceRGBA_frag},shadow:{uniforms:qt([ge.lights,ge.fog,{color:{value:new pt(0)},opacity:{value:1}}]),vertexShader:Ye.shadow_vert,fragmentShader:Ye.shadow_frag}};Sn.physical={uniforms:qt([Sn.standard.uniforms,{clearcoat:{value:0},clearcoatMap:{value:null},clearcoatRoughness:{value:0},clearcoatRoughnessMap:{value:null},clearcoatNormalScale:{value:new ot(1,1)},clearcoatNormalMap:{value:null},iridescence:{value:0},iridescenceMap:{value:null},iridescenceIOR:{value:1.3},iridescenceThicknessMinimum:{value:100},iridescenceThicknessMaximum:{value:400},iridescenceThicknessMap:{value:null},sheen:{value:0},sheenColor:{value:new pt(0)},sheenColorMap:{value:null},sheenRoughness:{value:1},sheenRoughnessMap:{value:null},transmission:{value:0},transmissionMap:{value:null},transmissionSamplerSize:{value:new ot},transmissionSamplerMap:{value:null},thickness:{value:0},thicknessMap:{value:null},attenuationDistance:{value:0},attenuationColor:{value:new pt(0)},specularIntensity:{value:1},specularIntensityMap:{value:null},specularColor:{value:new pt(1,1,1)},specularColorMap:{value:null}}]),vertexShader:Ye.meshphysical_vert,fragmentShader:Ye.meshphysical_frag};const jr={r:0,b:0,g:0};function T1(r,e,t,n,i,s,a){const o=new pt(0);let l=s===!0?0:1,c,u,f=null,d=0,m=null;function h(_,g){let v=!1,b=g.isScene===!0?g.background:null;b&&b.isTexture&&(b=(g.backgroundBlurriness>0?t:e).get(b));const w=r.xr,y=w.getSession&&w.getSession();y&&y.environmentBlendMode==="additive"&&(b=null),b===null?p(o,l):b&&b.isColor&&(p(b,1),v=!0),(r.autoClear||v)&&r.clear(r.autoClearColor,r.autoClearDepth,r.autoClearStencil),b&&(b.isCubeTexture||b.mapping===ms)?(u===void 0&&(u=new Ce(new Tt(1,1,1),new mi({name:"BackgroundCubeMaterial",uniforms:Wi(Sn.backgroundCube.uniforms),vertexShader:Sn.backgroundCube.vertexShader,fragmentShader:Sn.backgroundCube.fragmentShader,side:an,depthTest:!1,depthWrite:!1,fog:!1})),u.geometry.deleteAttribute("normal"),u.geometry.deleteAttribute("uv"),u.onBeforeRender=function(x,E,M){this.matrixWorld.copyPosition(M.matrixWorld)},Object.defineProperty(u.material,"envMap",{get:function(){return this.uniforms.envMap.value}}),i.update(u)),u.material.uniforms.envMap.value=b,u.material.uniforms.flipEnvMap.value=b.isCubeTexture&&b.isRenderTargetTexture===!1?-1:1,u.material.uniforms.backgroundBlurriness.value=g.backgroundBlurriness,u.material.uniforms.backgroundIntensity.value=g.backgroundIntensity,u.material.toneMapped=b.encoding!==ht,(f!==b||d!==b.version||m!==r.toneMapping)&&(u.material.needsUpdate=!0,f=b,d=b.version,m=r.toneMapping),u.layers.enableAll(),_.unshift(u,u.geometry,u.material,0,0,null)):b&&b.isTexture&&(c===void 0&&(c=new Ce(new bs(2,2),new mi({name:"BackgroundMaterial",uniforms:Wi(Sn.background.uniforms),vertexShader:Sn.background.vertexShader,fragmentShader:Sn.background.fragmentShader,side:Zn,depthTest:!1,depthWrite:!1,fog:!1})),c.geometry.deleteAttribute("normal"),Object.defineProperty(c.material,"map",{get:function(){return this.uniforms.t2D.value}}),i.update(c)),c.material.uniforms.t2D.value=b,c.material.uniforms.backgroundIntensity.value=g.backgroundIntensity,c.material.toneMapped=b.encoding!==ht,b.matrixAutoUpdate===!0&&b.updateMatrix(),c.material.uniforms.uvTransform.value.copy(b.matrix),(f!==b||d!==b.version||m!==r.toneMapping)&&(c.material.needsUpdate=!0,f=b,d=b.version,m=r.toneMapping),c.layers.enableAll(),_.unshift(c,c.geometry,c.material,0,0,null))}function p(_,g){_.getRGB(jr,ru(r)),n.buffers.color.setClear(jr.r,jr.g,jr.b,g,a)}return{getClearColor:function(){return o},setClearColor:function(_,g=1){o.set(_),l=g,p(o,l)},getClearAlpha:function(){return l},setClearAlpha:function(_){l=_,p(o,l)},render:h}}function E1(r,e,t,n){const i=r.getParameter(34921),s=n.isWebGL2?null:e.get("OES_vertex_array_object"),a=n.isWebGL2||s!==null,o={},l=_(null);let c=l,u=!1;function f(F,j,ce,de,te){let re=!1;if(a){const fe=p(de,ce,j);c!==fe&&(c=fe,m(c.object)),re=g(F,de,ce,te),re&&v(F,de,ce,te)}else{const fe=j.wireframe===!0;(c.geometry!==de.id||c.program!==ce.id||c.wireframe!==fe)&&(c.geometry=de.id,c.program=ce.id,c.wireframe=fe,re=!0)}te!==null&&t.update(te,34963),(re||u)&&(u=!1,M(F,j,ce,de),te!==null&&r.bindBuffer(34963,t.get(te).buffer))}function d(){return n.isWebGL2?r.createVertexArray():s.createVertexArrayOES()}function m(F){return n.isWebGL2?r.bindVertexArray(F):s.bindVertexArrayOES(F)}function h(F){return n.isWebGL2?r.deleteVertexArray(F):s.deleteVertexArrayOES(F)}function p(F,j,ce){const de=ce.wireframe===!0;let te=o[F.id];te===void 0&&(te={},o[F.id]=te);let re=te[j.id];re===void 0&&(re={},te[j.id]=re);let fe=re[de];return fe===void 0&&(fe=_(d()),re[de]=fe),fe}function _(F){const j=[],ce=[],de=[];for(let te=0;te<i;te++)j[te]=0,ce[te]=0,de[te]=0;return{geometry:null,program:null,wireframe:!1,newAttributes:j,enabledAttributes:ce,attributeDivisors:de,object:F,attributes:{},index:null}}function g(F,j,ce,de){const te=c.attributes,re=j.attributes;let fe=0;const be=ce.getAttributes();for(const Y in be)if(be[Y].location>=0){const pe=te[Y];let W=re[Y];if(W===void 0&&(Y==="instanceMatrix"&&F.instanceMatrix&&(W=F.instanceMatrix),Y==="instanceColor"&&F.instanceColor&&(W=F.instanceColor)),pe===void 0||pe.attribute!==W||W&&pe.data!==W.data)return!0;fe++}return c.attributesNum!==fe||c.index!==de}function v(F,j,ce,de){const te={},re=j.attributes;let fe=0;const be=ce.getAttributes();for(const Y in be)if(be[Y].location>=0){let pe=re[Y];pe===void 0&&(Y==="instanceMatrix"&&F.instanceMatrix&&(pe=F.instanceMatrix),Y==="instanceColor"&&F.instanceColor&&(pe=F.instanceColor));const W={};W.attribute=pe,pe&&pe.data&&(W.data=pe.data),te[Y]=W,fe++}c.attributes=te,c.attributesNum=fe,c.index=de}function b(){const F=c.newAttributes;for(let j=0,ce=F.length;j<ce;j++)F[j]=0}function w(F){y(F,0)}function y(F,j){const ce=c.newAttributes,de=c.enabledAttributes,te=c.attributeDivisors;ce[F]=1,de[F]===0&&(r.enableVertexAttribArray(F),de[F]=1),te[F]!==j&&((n.isWebGL2?r:e.get("ANGLE_instanced_arrays"))[n.isWebGL2?"vertexAttribDivisor":"vertexAttribDivisorANGLE"](F,j),te[F]=j)}function x(){const F=c.newAttributes,j=c.enabledAttributes;for(let ce=0,de=j.length;ce<de;ce++)j[ce]!==F[ce]&&(r.disableVertexAttribArray(ce),j[ce]=0)}function E(F,j,ce,de,te,re){n.isWebGL2===!0&&(ce===5124||ce===5125)?r.vertexAttribIPointer(F,j,ce,te,re):r.vertexAttribPointer(F,j,ce,de,te,re)}function M(F,j,ce,de){if(n.isWebGL2===!1&&(F.isInstancedMesh||de.isInstancedBufferGeometry)&&e.get("ANGLE_instanced_arrays")===null)return;b();const te=de.attributes,re=ce.getAttributes(),fe=j.defaultAttributeValues;for(const be in re){const Y=re[be];if(Y.location>=0){let ue=te[be];if(ue===void 0&&(be==="instanceMatrix"&&F.instanceMatrix&&(ue=F.instanceMatrix),be==="instanceColor"&&F.instanceColor&&(ue=F.instanceColor)),ue!==void 0){const pe=ue.normalized,W=ue.itemSize,Me=t.get(ue);if(Me===void 0)continue;const ye=Me.buffer,Te=Me.type,Se=Me.bytesPerElement;if(ue.isInterleavedBufferAttribute){const Ne=ue.data,Re=Ne.stride,Ve=ue.offset;if(Ne.isInstancedInterleavedBuffer){for(let je=0;je<Y.locationSize;je++)y(Y.location+je,Ne.meshPerAttribute);F.isInstancedMesh!==!0&&de._maxInstanceCount===void 0&&(de._maxInstanceCount=Ne.meshPerAttribute*Ne.count)}else for(let je=0;je<Y.locationSize;je++)w(Y.location+je);r.bindBuffer(34962,ye);for(let je=0;je<Y.locationSize;je++)E(Y.location+je,W/Y.locationSize,Te,pe,Re*Se,(Ve+W/Y.locationSize*je)*Se)}else{if(ue.isInstancedBufferAttribute){for(let Ne=0;Ne<Y.locationSize;Ne++)y(Y.location+Ne,ue.meshPerAttribute);F.isInstancedMesh!==!0&&de._maxInstanceCount===void 0&&(de._maxInstanceCount=ue.meshPerAttribute*ue.count)}else for(let Ne=0;Ne<Y.locationSize;Ne++)w(Y.location+Ne);r.bindBuffer(34962,ye);for(let Ne=0;Ne<Y.locationSize;Ne++)E(Y.location+Ne,W/Y.locationSize,Te,pe,W*Se,W/Y.locationSize*Ne*Se)}}else if(fe!==void 0){const pe=fe[be];if(pe!==void 0)switch(pe.length){case 2:r.vertexAttrib2fv(Y.location,pe);break;case 3:r.vertexAttrib3fv(Y.location,pe);break;case 4:r.vertexAttrib4fv(Y.location,pe);break;default:r.vertexAttrib1fv(Y.location,pe)}}}}x()}function S(){H();for(const F in o){const j=o[F];for(const ce in j){const de=j[ce];for(const te in de)h(de[te].object),delete de[te];delete j[ce]}delete o[F]}}function P(F){if(o[F.id]===void 0)return;const j=o[F.id];for(const ce in j){const de=j[ce];for(const te in de)h(de[te].object),delete de[te];delete j[ce]}delete o[F.id]}function k(F){for(const j in o){const ce=o[j];if(ce[F.id]===void 0)continue;const de=ce[F.id];for(const te in de)h(de[te].object),delete de[te];delete ce[F.id]}}function H(){V(),u=!0,c!==l&&(c=l,m(c.object))}function V(){l.geometry=null,l.program=null,l.wireframe=!1}return{setup:f,reset:H,resetDefaultState:V,dispose:S,releaseStatesOfGeometry:P,releaseStatesOfProgram:k,initAttributes:b,enableAttribute:w,disableUnusedAttributes:x}}function L1(r,e,t,n){const i=n.isWebGL2;let s;function a(c){s=c}function o(c,u){r.drawArrays(s,c,u),t.update(u,s,1)}function l(c,u,f){if(f===0)return;let d,m;if(i)d=r,m="drawArraysInstanced";else if(d=e.get("ANGLE_instanced_arrays"),m="drawArraysInstancedANGLE",d===null){console.error("THREE.WebGLBufferRenderer: using THREE.InstancedBufferGeometry but hardware does not support extension ANGLE_instanced_arrays.");return}d[m](s,c,u,f),t.update(u,s,f)}this.setMode=a,this.render=o,this.renderInstances=l}function P1(r,e,t){let n;function i(){if(n!==void 0)return n;if(e.has("EXT_texture_filter_anisotropic")===!0){const E=e.get("EXT_texture_filter_anisotropic");n=r.getParameter(E.MAX_TEXTURE_MAX_ANISOTROPY_EXT)}else n=0;return n}function s(E){if(E==="highp"){if(r.getShaderPrecisionFormat(35633,36338).precision>0&&r.getShaderPrecisionFormat(35632,36338).precision>0)return"highp";E="mediump"}return E==="mediump"&&r.getShaderPrecisionFormat(35633,36337).precision>0&&r.getShaderPrecisionFormat(35632,36337).precision>0?"mediump":"lowp"}const a=typeof WebGL2RenderingContext<"u"&&r instanceof WebGL2RenderingContext;let o=t.precision!==void 0?t.precision:"highp";const l=s(o);l!==o&&(console.warn("THREE.WebGLRenderer:",o,"not supported, using",l,"instead."),o=l);const c=a||e.has("WEBGL_draw_buffers"),u=t.logarithmicDepthBuffer===!0,f=r.getParameter(34930),d=r.getParameter(35660),m=r.getParameter(3379),h=r.getParameter(34076),p=r.getParameter(34921),_=r.getParameter(36347),g=r.getParameter(36348),v=r.getParameter(36349),b=d>0,w=a||e.has("OES_texture_float"),y=b&&w,x=a?r.getParameter(36183):0;return{isWebGL2:a,drawBuffers:c,getMaxAnisotropy:i,getMaxPrecision:s,precision:o,logarithmicDepthBuffer:u,maxTextures:f,maxVertexTextures:d,maxTextureSize:m,maxCubemapSize:h,maxAttributes:p,maxVertexUniforms:_,maxVaryings:g,maxFragmentUniforms:v,vertexTextures:b,floatFragmentTextures:w,floatVertexTextures:y,maxSamples:x}}function A1(r){const e=this;let t=null,n=0,i=!1,s=!1;const a=new ii,o=new Kt,l={value:null,needsUpdate:!1};this.uniform=l,this.numPlanes=0,this.numIntersection=0,this.init=function(f,d){const m=f.length!==0||d||n!==0||i;return i=d,n=f.length,m},this.beginShadows=function(){s=!0,u(null)},this.endShadows=function(){s=!1},this.setGlobalState=function(f,d){t=u(f,d,0)},this.setState=function(f,d,m){const h=f.clippingPlanes,p=f.clipIntersection,_=f.clipShadows,g=r.get(f);if(!i||h===null||h.length===0||s&&!_)s?u(null):c();else{const v=s?0:n,b=v*4;let w=g.clippingState||null;l.value=w,w=u(h,d,b,m);for(let y=0;y!==b;++y)w[y]=t[y];g.clippingState=w,this.numIntersection=p?this.numPlanes:0,this.numPlanes+=v}};function c(){l.value!==t&&(l.value=t,l.needsUpdate=n>0),e.numPlanes=n,e.numIntersection=0}function u(f,d,m,h){const p=f!==null?f.length:0;let _=null;if(p!==0){if(_=l.value,h!==!0||_===null){const g=m+p*4,v=d.matrixWorldInverse;o.getNormalMatrix(v),(_===null||_.length<g)&&(_=new Float32Array(g));for(let b=0,w=m;b!==p;++b,w+=4)a.copy(f[b]).applyMatrix4(v,o),a.normal.toArray(_,w),_[w+3]=a.constant}l.value=_,l.needsUpdate=!0}return e.numPlanes=p,e.numIntersection=0,_}}function D1(r){let e=new WeakMap;function t(a,o){return o===ca?a.mapping=Vi:o===ua&&(a.mapping=Gi),a}function n(a){if(a&&a.isTexture&&a.isRenderTargetTexture===!1){const o=a.mapping;if(o===ca||o===ua)if(e.has(a)){const l=e.get(a).texture;return t(l,a.mapping)}else{const l=a.image;if(l&&l.height>0){const c=new W_(l.height/2);return c.fromEquirectangularTexture(r,a),e.set(a,c),a.addEventListener("dispose",i),t(c.texture,a.mapping)}else return null}}return a}function i(a){const o=a.target;o.removeEventListener("dispose",i);const l=e.get(o);l!==void 0&&(e.delete(o),l.dispose())}function s(){e=new WeakMap}return{get:n,dispose:s}}class k1 extends su{constructor(e=-1,t=1,n=1,i=-1,s=.1,a=2e3){super(),this.isOrthographicCamera=!0,this.type="OrthographicCamera",this.zoom=1,this.view=null,this.left=e,this.right=t,this.top=n,this.bottom=i,this.near=s,this.far=a,this.updateProjectionMatrix()}copy(e,t){return super.copy(e,t),this.left=e.left,this.right=e.right,this.top=e.top,this.bottom=e.bottom,this.near=e.near,this.far=e.far,this.zoom=e.zoom,this.view=e.view===null?null:Object.assign({},e.view),this}setViewOffset(e,t,n,i,s,a){this.view===null&&(this.view={enabled:!0,fullWidth:1,fullHeight:1,offsetX:0,offsetY:0,width:1,height:1}),this.view.enabled=!0,this.view.fullWidth=e,this.view.fullHeight=t,this.view.offsetX=n,this.view.offsetY=i,this.view.width=s,this.view.height=a,this.updateProjectionMatrix()}clearViewOffset(){this.view!==null&&(this.view.enabled=!1),this.updateProjectionMatrix()}updateProjectionMatrix(){const e=(this.right-this.left)/(2*this.zoom),t=(this.top-this.bottom)/(2*this.zoom),n=(this.right+this.left)/2,i=(this.top+this.bottom)/2;let s=n-e,a=n+e,o=i+t,l=i-t;if(this.view!==null&&this.view.enabled){const c=(this.right-this.left)/this.view.fullWidth/this.zoom,u=(this.top-this.bottom)/this.view.fullHeight/this.zoom;s+=c*this.view.offsetX,a=s+c*this.view.width,o-=u*this.view.offsetY,l=o-u*this.view.height}this.projectionMatrix.makeOrthographic(s,a,o,l,this.near,this.far),this.projectionMatrixInverse.copy(this.projectionMatrix).invert()}toJSON(e){const t=super.toJSON(e);return t.object.zoom=this.zoom,t.object.left=this.left,t.object.right=this.right,t.object.top=this.top,t.object.bottom=this.bottom,t.object.near=this.near,t.object.far=this.far,this.view!==null&&(t.object.view=Object.assign({},this.view)),t}}const ki=4,Yl=[.125,.215,.35,.446,.526,.582],ai=20,Qs=new k1,Zl=new pt;let $s=null;const ri=(1+Math.sqrt(5))/2,Ai=1/ri,Kl=[new G(1,1,1),new G(-1,1,1),new G(1,1,-1),new G(-1,1,-1),new G(0,ri,Ai),new G(0,ri,-Ai),new G(Ai,0,ri),new G(-Ai,0,ri),new G(ri,Ai,0),new G(-ri,Ai,0)];class Jl{constructor(e){this._renderer=e,this._pingPongRenderTarget=null,this._lodMax=0,this._cubeSize=0,this._lodPlanes=[],this._sizeLods=[],this._sigmas=[],this._blurMaterial=null,this._cubemapMaterial=null,this._equirectMaterial=null,this._compileMaterial(this._blurMaterial)}fromScene(e,t=0,n=.1,i=100){$s=this._renderer.getRenderTarget(),this._setSize(256);const s=this._allocateTargets();return s.depthBuffer=!0,this._sceneToCubeUV(e,n,i,s),t>0&&this._blur(s,0,0,t),this._applyPMREM(s),this._cleanup(s),s}fromEquirectangular(e,t=null){return this._fromTexture(e,t)}fromCubemap(e,t=null){return this._fromTexture(e,t)}compileCubemapShader(){this._cubemapMaterial===null&&(this._cubemapMaterial=ec(),this._compileMaterial(this._cubemapMaterial))}compileEquirectangularShader(){this._equirectMaterial===null&&(this._equirectMaterial=$l(),this._compileMaterial(this._equirectMaterial))}dispose(){this._dispose(),this._cubemapMaterial!==null&&this._cubemapMaterial.dispose(),this._equirectMaterial!==null&&this._equirectMaterial.dispose()}_setSize(e){this._lodMax=Math.floor(Math.log2(e)),this._cubeSize=Math.pow(2,this._lodMax)}_dispose(){this._blurMaterial!==null&&this._blurMaterial.dispose(),this._pingPongRenderTarget!==null&&this._pingPongRenderTarget.dispose();for(let e=0;e<this._lodPlanes.length;e++)this._lodPlanes[e].dispose()}_cleanup(e){this._renderer.setRenderTarget($s),e.scissorTest=!1,qr(e,0,0,e.width,e.height)}_fromTexture(e,t){e.mapping===Vi||e.mapping===Gi?this._setSize(e.image.length===0?16:e.image[0].width||e.image[0].image.width):this._setSize(e.image.width/4),$s=this._renderer.getRenderTarget();const n=t||this._allocateTargets();return this._textureToCubeUV(e,n),this._applyPMREM(n),this._cleanup(n),n}_allocateTargets(){const e=3*Math.max(this._cubeSize,112),t=4*this._cubeSize,n={magFilter:fn,minFilter:fn,generateMipmaps:!1,type:vr,format:gn,encoding:hi,depthBuffer:!1},i=Ql(e,t,n);if(this._pingPongRenderTarget===null||this._pingPongRenderTarget.width!==e||this._pingPongRenderTarget.height!==t){this._pingPongRenderTarget!==null&&this._dispose(),this._pingPongRenderTarget=Ql(e,t,n);const{_lodMax:s}=this;({sizeLods:this._sizeLods,lodPlanes:this._lodPlanes,sigmas:this._sigmas}=R1(s)),this._blurMaterial=I1(s,e,t)}return i}_compileMaterial(e){const t=new Ce(this._lodPlanes[0],e);this._renderer.compile(t,Qs)}_sceneToCubeUV(e,t,n,i){const o=new dn(90,1,t,n),l=[1,-1,1,1,1,1],c=[1,1,1,-1,-1,-1],u=this._renderer,f=u.autoClear,d=u.toneMapping;u.getClearColor(Zl),u.toneMapping=Un,u.autoClear=!1;const m=new gs({name:"PMREM.Background",side:an,depthWrite:!1,depthTest:!1}),h=new Ce(new Tt,m);let p=!1;const _=e.background;_?_.isColor&&(m.color.copy(_),e.background=null,p=!0):(m.color.copy(Zl),p=!0);for(let g=0;g<6;g++){const v=g%3;v===0?(o.up.set(0,l[g],0),o.lookAt(c[g],0,0)):v===1?(o.up.set(0,0,l[g]),o.lookAt(0,c[g],0)):(o.up.set(0,l[g],0),o.lookAt(0,0,c[g]));const b=this._cubeSize;qr(i,v*b,g>2?b:0,b,b),u.setRenderTarget(i),p&&u.render(h,o),u.render(e,o)}h.geometry.dispose(),h.material.dispose(),u.toneMapping=d,u.autoClear=f,e.background=_}_textureToCubeUV(e,t){const n=this._renderer,i=e.mapping===Vi||e.mapping===Gi;i?(this._cubemapMaterial===null&&(this._cubemapMaterial=ec()),this._cubemapMaterial.uniforms.flipEnvMap.value=e.isRenderTargetTexture===!1?-1:1):this._equirectMaterial===null&&(this._equirectMaterial=$l());const s=i?this._cubemapMaterial:this._equirectMaterial,a=new Ce(this._lodPlanes[0],s),o=s.uniforms;o.envMap.value=e;const l=this._cubeSize;qr(t,0,0,3*l,2*l),n.setRenderTarget(t),n.render(a,Qs)}_applyPMREM(e){const t=this._renderer,n=t.autoClear;t.autoClear=!1;for(let i=1;i<this._lodPlanes.length;i++){const s=Math.sqrt(this._sigmas[i]*this._sigmas[i]-this._sigmas[i-1]*this._sigmas[i-1]),a=Kl[(i-1)%Kl.length];this._blur(e,i-1,i,s,a)}t.autoClear=n}_blur(e,t,n,i,s){const a=this._pingPongRenderTarget;this._halfBlur(e,a,t,n,i,"latitudinal",s),this._halfBlur(a,e,n,n,i,"longitudinal",s)}_halfBlur(e,t,n,i,s,a,o){const l=this._renderer,c=this._blurMaterial;a!=="latitudinal"&&a!=="longitudinal"&&console.error("blur direction must be either latitudinal or longitudinal!");const u=3,f=new Ce(this._lodPlanes[i],c),d=c.uniforms,m=this._sizeLods[n]-1,h=isFinite(s)?Math.PI/(2*m):2*Math.PI/(2*ai-1),p=s/h,_=isFinite(s)?1+Math.floor(u*p):ai;_>ai&&console.warn(`sigmaRadians, ${s}, is too large and will clip, as it requested ${_} samples when the maximum is set to ${ai}`);const g=[];let v=0;for(let E=0;E<ai;++E){const M=E/p,S=Math.exp(-M*M/2);g.push(S),E===0?v+=S:E<_&&(v+=2*S)}for(let E=0;E<g.length;E++)g[E]=g[E]/v;d.envMap.value=e.texture,d.samples.value=_,d.weights.value=g,d.latitudinal.value=a==="latitudinal",o&&(d.poleAxis.value=o);const{_lodMax:b}=this;d.dTheta.value=h,d.mipInt.value=b-n;const w=this._sizeLods[i],y=3*w*(i>b-ki?i-b+ki:0),x=4*(this._cubeSize-w);qr(t,y,x,3*w,2*w),l.setRenderTarget(t),l.render(f,Qs)}}function R1(r){const e=[],t=[],n=[];let i=r;const s=r-ki+1+Yl.length;for(let a=0;a<s;a++){const o=Math.pow(2,i);t.push(o);let l=1/o;a>r-ki?l=Yl[a-r+ki-1]:a===0&&(l=0),n.push(l);const c=1/(o-2),u=-c,f=1+c,d=[u,u,f,u,f,f,u,u,f,f,u,f],m=6,h=6,p=3,_=2,g=1,v=new Float32Array(p*h*m),b=new Float32Array(_*h*m),w=new Float32Array(g*h*m);for(let x=0;x<m;x++){const E=x%3*2/3-1,M=x>2?0:-1,S=[E,M,0,E+2/3,M,0,E+2/3,M+1,0,E,M,0,E+2/3,M+1,0,E,M+1,0];v.set(S,p*h*x),b.set(d,_*h*x);const P=[x,x,x,x,x,x];w.set(P,g*h*x)}const y=new en;y.setAttribute("position",new Cn(v,p)),y.setAttribute("uv",new Cn(b,_)),y.setAttribute("faceIndex",new Cn(w,g)),e.push(y),i>ki&&i--}return{lodPlanes:e,sizeLods:t,sigmas:n}}function Ql(r,e,t){const n=new pi(r,e,t);return n.texture.mapping=ms,n.texture.name="PMREM.cubeUv",n.scissorTest=!0,n}function qr(r,e,t,n,i){r.viewport.set(e,t,n,i),r.scissor.set(e,t,n,i)}function I1(r,e,t){const n=new Float32Array(ai),i=new G(0,1,0);return new mi({name:"SphericalGaussianBlur",defines:{n:ai,CUBEUV_TEXEL_WIDTH:1/e,CUBEUV_TEXEL_HEIGHT:1/t,CUBEUV_MAX_MIP:`${r}.0`},uniforms:{envMap:{value:null},samples:{value:1},weights:{value:n},latitudinal:{value:!1},dTheta:{value:0},mipInt:{value:0},poleAxis:{value:i}},vertexShader:Sa(),fragmentShader:`

			precision mediump float;
			precision mediump int;

			varying vec3 vOutputDirection;

			uniform sampler2D envMap;
			uniform int samples;
			uniform float weights[ n ];
			uniform bool latitudinal;
			uniform float dTheta;
			uniform float mipInt;
			uniform vec3 poleAxis;

			#define ENVMAP_TYPE_CUBE_UV
			#include <cube_uv_reflection_fragment>

			vec3 getSample( float theta, vec3 axis ) {

				float cosTheta = cos( theta );
				// Rodrigues' axis-angle rotation
				vec3 sampleDirection = vOutputDirection * cosTheta
					+ cross( axis, vOutputDirection ) * sin( theta )
					+ axis * dot( axis, vOutputDirection ) * ( 1.0 - cosTheta );

				return bilinearCubeUV( envMap, sampleDirection, mipInt );

			}

			void main() {

				vec3 axis = latitudinal ? poleAxis : cross( poleAxis, vOutputDirection );

				if ( all( equal( axis, vec3( 0.0 ) ) ) ) {

					axis = vec3( vOutputDirection.z, 0.0, - vOutputDirection.x );

				}

				axis = normalize( axis );

				gl_FragColor = vec4( 0.0, 0.0, 0.0, 1.0 );
				gl_FragColor.rgb += weights[ 0 ] * getSample( 0.0, axis );

				for ( int i = 1; i < n; i++ ) {

					if ( i >= samples ) {

						break;

					}

					float theta = dTheta * float( i );
					gl_FragColor.rgb += weights[ i ] * getSample( -1.0 * theta, axis );
					gl_FragColor.rgb += weights[ i ] * getSample( theta, axis );

				}

			}
		`,blending:Yn,depthTest:!1,depthWrite:!1})}function $l(){return new mi({name:"EquirectangularToCubeUV",uniforms:{envMap:{value:null}},vertexShader:Sa(),fragmentShader:`

			precision mediump float;
			precision mediump int;

			varying vec3 vOutputDirection;

			uniform sampler2D envMap;

			#include <common>

			void main() {

				vec3 outputDirection = normalize( vOutputDirection );
				vec2 uv = equirectUv( outputDirection );

				gl_FragColor = vec4( texture2D ( envMap, uv ).rgb, 1.0 );

			}
		`,blending:Yn,depthTest:!1,depthWrite:!1})}function ec(){return new mi({name:"CubemapToCubeUV",uniforms:{envMap:{value:null},flipEnvMap:{value:-1}},vertexShader:Sa(),fragmentShader:`

			precision mediump float;
			precision mediump int;

			uniform float flipEnvMap;

			varying vec3 vOutputDirection;

			uniform samplerCube envMap;

			void main() {

				gl_FragColor = textureCube( envMap, vec3( flipEnvMap * vOutputDirection.x, vOutputDirection.yz ) );

			}
		`,blending:Yn,depthTest:!1,depthWrite:!1})}function Sa(){return`

		precision mediump float;
		precision mediump int;

		attribute float faceIndex;

		varying vec3 vOutputDirection;

		// RH coordinate system; PMREM face-indexing convention
		vec3 getDirection( vec2 uv, float face ) {

			uv = 2.0 * uv - 1.0;

			vec3 direction = vec3( uv, 1.0 );

			if ( face == 0.0 ) {

				direction = direction.zyx; // ( 1, v, u ) pos x

			} else if ( face == 1.0 ) {

				direction = direction.xzy;
				direction.xz *= -1.0; // ( -u, 1, -v ) pos y

			} else if ( face == 2.0 ) {

				direction.x *= -1.0; // ( -u, v, 1 ) pos z

			} else if ( face == 3.0 ) {

				direction = direction.zyx;
				direction.xz *= -1.0; // ( -1, v, -u ) neg x

			} else if ( face == 4.0 ) {

				direction = direction.xzy;
				direction.xy *= -1.0; // ( -u, -1, v ) neg y

			} else if ( face == 5.0 ) {

				direction.z *= -1.0; // ( u, v, -1 ) neg z

			}

			return direction;

		}

		void main() {

			vOutputDirection = getDirection( uv, faceIndex );
			gl_Position = vec4( position, 1.0 );

		}
	`}function N1(r){let e=new WeakMap,t=null;function n(o){if(o&&o.isTexture){const l=o.mapping,c=l===ca||l===ua,u=l===Vi||l===Gi;if(c||u)if(o.isRenderTargetTexture&&o.needsPMREMUpdate===!0){o.needsPMREMUpdate=!1;let f=e.get(o);return t===null&&(t=new Jl(r)),f=c?t.fromEquirectangular(o,f):t.fromCubemap(o,f),e.set(o,f),f.texture}else{if(e.has(o))return e.get(o).texture;{const f=o.image;if(c&&f&&f.height>0||u&&f&&i(f)){t===null&&(t=new Jl(r));const d=c?t.fromEquirectangular(o):t.fromCubemap(o);return e.set(o,d),o.addEventListener("dispose",s),d.texture}else return null}}}return o}function i(o){let l=0;const c=6;for(let u=0;u<c;u++)o[u]!==void 0&&l++;return l===c}function s(o){const l=o.target;l.removeEventListener("dispose",s);const c=e.get(l);c!==void 0&&(e.delete(l),c.dispose())}function a(){e=new WeakMap,t!==null&&(t.dispose(),t=null)}return{get:n,dispose:a}}function z1(r){const e={};function t(n){if(e[n]!==void 0)return e[n];let i;switch(n){case"WEBGL_depth_texture":i=r.getExtension("WEBGL_depth_texture")||r.getExtension("MOZ_WEBGL_depth_texture")||r.getExtension("WEBKIT_WEBGL_depth_texture");break;case"EXT_texture_filter_anisotropic":i=r.getExtension("EXT_texture_filter_anisotropic")||r.getExtension("MOZ_EXT_texture_filter_anisotropic")||r.getExtension("WEBKIT_EXT_texture_filter_anisotropic");break;case"WEBGL_compressed_texture_s3tc":i=r.getExtension("WEBGL_compressed_texture_s3tc")||r.getExtension("MOZ_WEBGL_compressed_texture_s3tc")||r.getExtension("WEBKIT_WEBGL_compressed_texture_s3tc");break;case"WEBGL_compressed_texture_pvrtc":i=r.getExtension("WEBGL_compressed_texture_pvrtc")||r.getExtension("WEBKIT_WEBGL_compressed_texture_pvrtc");break;default:i=r.getExtension(n)}return e[n]=i,i}return{has:function(n){return t(n)!==null},init:function(n){n.isWebGL2?t("EXT_color_buffer_float"):(t("WEBGL_depth_texture"),t("OES_texture_float"),t("OES_texture_half_float"),t("OES_texture_half_float_linear"),t("OES_standard_derivatives"),t("OES_element_index_uint"),t("OES_vertex_array_object"),t("ANGLE_instanced_arrays")),t("OES_texture_float_linear"),t("EXT_color_buffer_half_float"),t("WEBGL_multisampled_render_to_texture")},get:function(n){const i=t(n);return i===null&&console.warn("THREE.WebGLRenderer: "+n+" extension not supported."),i}}}function F1(r,e,t,n){const i={},s=new WeakMap;function a(f){const d=f.target;d.index!==null&&e.remove(d.index);for(const h in d.attributes)e.remove(d.attributes[h]);d.removeEventListener("dispose",a),delete i[d.id];const m=s.get(d);m&&(e.remove(m),s.delete(d)),n.releaseStatesOfGeometry(d),d.isInstancedBufferGeometry===!0&&delete d._maxInstanceCount,t.memory.geometries--}function o(f,d){return i[d.id]===!0||(d.addEventListener("dispose",a),i[d.id]=!0,t.memory.geometries++),d}function l(f){const d=f.attributes;for(const h in d)e.update(d[h],34962);const m=f.morphAttributes;for(const h in m){const p=m[h];for(let _=0,g=p.length;_<g;_++)e.update(p[_],34962)}}function c(f){const d=[],m=f.index,h=f.attributes.position;let p=0;if(m!==null){const v=m.array;p=m.version;for(let b=0,w=v.length;b<w;b+=3){const y=v[b+0],x=v[b+1],E=v[b+2];d.push(y,x,x,E,E,y)}}else{const v=h.array;p=h.version;for(let b=0,w=v.length/3-1;b<w;b+=3){const y=b+0,x=b+1,E=b+2;d.push(y,x,x,E,E,y)}}const _=new(Jc(d)?iu:nu)(d,1);_.version=p;const g=s.get(f);g&&e.remove(g),s.set(f,_)}function u(f){const d=s.get(f);if(d){const m=f.index;m!==null&&d.version<m.version&&c(f)}else c(f);return s.get(f)}return{get:o,update:l,getWireframeAttribute:u}}function O1(r,e,t,n){const i=n.isWebGL2;let s;function a(d){s=d}let o,l;function c(d){o=d.type,l=d.bytesPerElement}function u(d,m){r.drawElements(s,m,o,d*l),t.update(m,s,1)}function f(d,m,h){if(h===0)return;let p,_;if(i)p=r,_="drawElementsInstanced";else if(p=e.get("ANGLE_instanced_arrays"),_="drawElementsInstancedANGLE",p===null){console.error("THREE.WebGLIndexedBufferRenderer: using THREE.InstancedBufferGeometry but hardware does not support extension ANGLE_instanced_arrays.");return}p[_](s,m,o,d*l,h),t.update(m,s,h)}this.setMode=a,this.setIndex=c,this.render=u,this.renderInstances=f}function U1(r){const e={geometries:0,textures:0},t={frame:0,calls:0,triangles:0,points:0,lines:0};function n(s,a,o){switch(t.calls++,a){case 4:t.triangles+=o*(s/3);break;case 1:t.lines+=o*(s/2);break;case 3:t.lines+=o*(s-1);break;case 2:t.lines+=o*s;break;case 0:t.points+=o*s;break;default:console.error("THREE.WebGLInfo: Unknown draw mode:",a);break}}function i(){t.frame++,t.calls=0,t.triangles=0,t.points=0,t.lines=0}return{memory:e,render:t,programs:null,autoReset:!0,reset:i,update:n}}function B1(r,e){return r[0]-e[0]}function V1(r,e){return Math.abs(e[1])-Math.abs(r[1])}function G1(r,e,t){const n={},i=new Float32Array(8),s=new WeakMap,a=new Ot,o=[];for(let c=0;c<8;c++)o[c]=[c,0];function l(c,u,f){const d=c.morphTargetInfluences;if(e.isWebGL2===!0){const m=u.morphAttributes.position||u.morphAttributes.normal||u.morphAttributes.color,h=m!==void 0?m.length:0;let p=s.get(u);if(p===void 0||p.count!==h){let F=function(){H.dispose(),s.delete(u),u.removeEventListener("dispose",F)};p!==void 0&&p.texture.dispose();const v=u.morphAttributes.position!==void 0,b=u.morphAttributes.normal!==void 0,w=u.morphAttributes.color!==void 0,y=u.morphAttributes.position||[],x=u.morphAttributes.normal||[],E=u.morphAttributes.color||[];let M=0;v===!0&&(M=1),b===!0&&(M=2),w===!0&&(M=3);let S=u.attributes.position.count*M,P=1;S>e.maxTextureSize&&(P=Math.ceil(S/e.maxTextureSize),S=e.maxTextureSize);const k=new Float32Array(S*P*4*h),H=new eu(k,S,P,h);H.type=ci,H.needsUpdate=!0;const V=M*4;for(let j=0;j<h;j++){const ce=y[j],de=x[j],te=E[j],re=S*P*4*j;for(let fe=0;fe<ce.count;fe++){const be=fe*V;v===!0&&(a.fromBufferAttribute(ce,fe),k[re+be+0]=a.x,k[re+be+1]=a.y,k[re+be+2]=a.z,k[re+be+3]=0),b===!0&&(a.fromBufferAttribute(de,fe),k[re+be+4]=a.x,k[re+be+5]=a.y,k[re+be+6]=a.z,k[re+be+7]=0),w===!0&&(a.fromBufferAttribute(te,fe),k[re+be+8]=a.x,k[re+be+9]=a.y,k[re+be+10]=a.z,k[re+be+11]=te.itemSize===4?a.w:1)}}p={count:h,texture:H,size:new ot(S,P)},s.set(u,p),u.addEventListener("dispose",F)}let _=0;for(let v=0;v<d.length;v++)_+=d[v];const g=u.morphTargetsRelative?1:1-_;f.getUniforms().setValue(r,"morphTargetBaseInfluence",g),f.getUniforms().setValue(r,"morphTargetInfluences",d),f.getUniforms().setValue(r,"morphTargetsTexture",p.texture,t),f.getUniforms().setValue(r,"morphTargetsTextureSize",p.size)}else{const m=d===void 0?0:d.length;let h=n[u.id];if(h===void 0||h.length!==m){h=[];for(let b=0;b<m;b++)h[b]=[b,0];n[u.id]=h}for(let b=0;b<m;b++){const w=h[b];w[0]=b,w[1]=d[b]}h.sort(V1);for(let b=0;b<8;b++)b<m&&h[b][1]?(o[b][0]=h[b][0],o[b][1]=h[b][1]):(o[b][0]=Number.MAX_SAFE_INTEGER,o[b][1]=0);o.sort(B1);const p=u.morphAttributes.position,_=u.morphAttributes.normal;let g=0;for(let b=0;b<8;b++){const w=o[b],y=w[0],x=w[1];y!==Number.MAX_SAFE_INTEGER&&x?(p&&u.getAttribute("morphTarget"+b)!==p[y]&&u.setAttribute("morphTarget"+b,p[y]),_&&u.getAttribute("morphNormal"+b)!==_[y]&&u.setAttribute("morphNormal"+b,_[y]),i[b]=x,g+=x):(p&&u.hasAttribute("morphTarget"+b)===!0&&u.deleteAttribute("morphTarget"+b),_&&u.hasAttribute("morphNormal"+b)===!0&&u.deleteAttribute("morphNormal"+b),i[b]=0)}const v=u.morphTargetsRelative?1:1-g;f.getUniforms().setValue(r,"morphTargetBaseInfluence",v),f.getUniforms().setValue(r,"morphTargetInfluences",i)}}return{update:l}}function H1(r,e,t,n){let i=new WeakMap;function s(l){const c=n.render.frame,u=l.geometry,f=e.get(l,u);return i.get(f)!==c&&(e.update(f),i.set(f,c)),l.isInstancedMesh&&(l.hasEventListener("dispose",o)===!1&&l.addEventListener("dispose",o),t.update(l.instanceMatrix,34962),l.instanceColor!==null&&t.update(l.instanceColor,34962)),f}function a(){i=new WeakMap}function o(l){const c=l.target;c.removeEventListener("dispose",o),t.remove(c.instanceMatrix),c.instanceColor!==null&&t.remove(c.instanceColor)}return{update:s,dispose:a}}const cu=new on,uu=new eu,fu=new L_,du=new au,tc=[],nc=[],ic=new Float32Array(16),rc=new Float32Array(9),sc=new Float32Array(4);function qi(r,e,t){const n=r[0];if(n<=0||n>0)return r;const i=e*t;let s=tc[i];if(s===void 0&&(s=new Float32Array(i),tc[i]=s),e!==0){n.toArray(s,0);for(let a=1,o=0;a!==e;++a)o+=t,r[a].toArray(s,o)}return s}function Pt(r,e){if(r.length!==e.length)return!1;for(let t=0,n=r.length;t<n;t++)if(r[t]!==e[t])return!1;return!0}function At(r,e){for(let t=0,n=e.length;t<n;t++)r[t]=e[t]}function vs(r,e){let t=nc[e];t===void 0&&(t=new Int32Array(e),nc[e]=t);for(let n=0;n!==e;++n)t[n]=r.allocateTextureUnit();return t}function W1(r,e){const t=this.cache;t[0]!==e&&(r.uniform1f(this.addr,e),t[0]=e)}function X1(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y)&&(r.uniform2f(this.addr,e.x,e.y),t[0]=e.x,t[1]=e.y);else{if(Pt(t,e))return;r.uniform2fv(this.addr,e),At(t,e)}}function j1(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z)&&(r.uniform3f(this.addr,e.x,e.y,e.z),t[0]=e.x,t[1]=e.y,t[2]=e.z);else if(e.r!==void 0)(t[0]!==e.r||t[1]!==e.g||t[2]!==e.b)&&(r.uniform3f(this.addr,e.r,e.g,e.b),t[0]=e.r,t[1]=e.g,t[2]=e.b);else{if(Pt(t,e))return;r.uniform3fv(this.addr,e),At(t,e)}}function q1(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z||t[3]!==e.w)&&(r.uniform4f(this.addr,e.x,e.y,e.z,e.w),t[0]=e.x,t[1]=e.y,t[2]=e.z,t[3]=e.w);else{if(Pt(t,e))return;r.uniform4fv(this.addr,e),At(t,e)}}function Y1(r,e){const t=this.cache,n=e.elements;if(n===void 0){if(Pt(t,e))return;r.uniformMatrix2fv(this.addr,!1,e),At(t,e)}else{if(Pt(t,n))return;sc.set(n),r.uniformMatrix2fv(this.addr,!1,sc),At(t,n)}}function Z1(r,e){const t=this.cache,n=e.elements;if(n===void 0){if(Pt(t,e))return;r.uniformMatrix3fv(this.addr,!1,e),At(t,e)}else{if(Pt(t,n))return;rc.set(n),r.uniformMatrix3fv(this.addr,!1,rc),At(t,n)}}function K1(r,e){const t=this.cache,n=e.elements;if(n===void 0){if(Pt(t,e))return;r.uniformMatrix4fv(this.addr,!1,e),At(t,e)}else{if(Pt(t,n))return;ic.set(n),r.uniformMatrix4fv(this.addr,!1,ic),At(t,n)}}function J1(r,e){const t=this.cache;t[0]!==e&&(r.uniform1i(this.addr,e),t[0]=e)}function Q1(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y)&&(r.uniform2i(this.addr,e.x,e.y),t[0]=e.x,t[1]=e.y);else{if(Pt(t,e))return;r.uniform2iv(this.addr,e),At(t,e)}}function $1(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z)&&(r.uniform3i(this.addr,e.x,e.y,e.z),t[0]=e.x,t[1]=e.y,t[2]=e.z);else{if(Pt(t,e))return;r.uniform3iv(this.addr,e),At(t,e)}}function eb(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z||t[3]!==e.w)&&(r.uniform4i(this.addr,e.x,e.y,e.z,e.w),t[0]=e.x,t[1]=e.y,t[2]=e.z,t[3]=e.w);else{if(Pt(t,e))return;r.uniform4iv(this.addr,e),At(t,e)}}function tb(r,e){const t=this.cache;t[0]!==e&&(r.uniform1ui(this.addr,e),t[0]=e)}function nb(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y)&&(r.uniform2ui(this.addr,e.x,e.y),t[0]=e.x,t[1]=e.y);else{if(Pt(t,e))return;r.uniform2uiv(this.addr,e),At(t,e)}}function ib(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z)&&(r.uniform3ui(this.addr,e.x,e.y,e.z),t[0]=e.x,t[1]=e.y,t[2]=e.z);else{if(Pt(t,e))return;r.uniform3uiv(this.addr,e),At(t,e)}}function rb(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z||t[3]!==e.w)&&(r.uniform4ui(this.addr,e.x,e.y,e.z,e.w),t[0]=e.x,t[1]=e.y,t[2]=e.z,t[3]=e.w);else{if(Pt(t,e))return;r.uniform4uiv(this.addr,e),At(t,e)}}function sb(r,e,t){const n=this.cache,i=t.allocateTextureUnit();n[0]!==i&&(r.uniform1i(this.addr,i),n[0]=i),t.setTexture2D(e||cu,i)}function ab(r,e,t){const n=this.cache,i=t.allocateTextureUnit();n[0]!==i&&(r.uniform1i(this.addr,i),n[0]=i),t.setTexture3D(e||fu,i)}function ob(r,e,t){const n=this.cache,i=t.allocateTextureUnit();n[0]!==i&&(r.uniform1i(this.addr,i),n[0]=i),t.setTextureCube(e||du,i)}function lb(r,e,t){const n=this.cache,i=t.allocateTextureUnit();n[0]!==i&&(r.uniform1i(this.addr,i),n[0]=i),t.setTexture2DArray(e||uu,i)}function cb(r){switch(r){case 5126:return W1;case 35664:return X1;case 35665:return j1;case 35666:return q1;case 35674:return Y1;case 35675:return Z1;case 35676:return K1;case 5124:case 35670:return J1;case 35667:case 35671:return Q1;case 35668:case 35672:return $1;case 35669:case 35673:return eb;case 5125:return tb;case 36294:return nb;case 36295:return ib;case 36296:return rb;case 35678:case 36198:case 36298:case 36306:case 35682:return sb;case 35679:case 36299:case 36307:return ab;case 35680:case 36300:case 36308:case 36293:return ob;case 36289:case 36303:case 36311:case 36292:return lb}}function ub(r,e){r.uniform1fv(this.addr,e)}function fb(r,e){const t=qi(e,this.size,2);r.uniform2fv(this.addr,t)}function db(r,e){const t=qi(e,this.size,3);r.uniform3fv(this.addr,t)}function hb(r,e){const t=qi(e,this.size,4);r.uniform4fv(this.addr,t)}function pb(r,e){const t=qi(e,this.size,4);r.uniformMatrix2fv(this.addr,!1,t)}function mb(r,e){const t=qi(e,this.size,9);r.uniformMatrix3fv(this.addr,!1,t)}function _b(r,e){const t=qi(e,this.size,16);r.uniformMatrix4fv(this.addr,!1,t)}function gb(r,e){r.uniform1iv(this.addr,e)}function bb(r,e){r.uniform2iv(this.addr,e)}function vb(r,e){r.uniform3iv(this.addr,e)}function yb(r,e){r.uniform4iv(this.addr,e)}function wb(r,e){r.uniform1uiv(this.addr,e)}function Mb(r,e){r.uniform2uiv(this.addr,e)}function xb(r,e){r.uniform3uiv(this.addr,e)}function Sb(r,e){r.uniform4uiv(this.addr,e)}function Cb(r,e,t){const n=this.cache,i=e.length,s=vs(t,i);Pt(n,s)||(r.uniform1iv(this.addr,s),At(n,s));for(let a=0;a!==i;++a)t.setTexture2D(e[a]||cu,s[a])}function Tb(r,e,t){const n=this.cache,i=e.length,s=vs(t,i);Pt(n,s)||(r.uniform1iv(this.addr,s),At(n,s));for(let a=0;a!==i;++a)t.setTexture3D(e[a]||fu,s[a])}function Eb(r,e,t){const n=this.cache,i=e.length,s=vs(t,i);Pt(n,s)||(r.uniform1iv(this.addr,s),At(n,s));for(let a=0;a!==i;++a)t.setTextureCube(e[a]||du,s[a])}function Lb(r,e,t){const n=this.cache,i=e.length,s=vs(t,i);Pt(n,s)||(r.uniform1iv(this.addr,s),At(n,s));for(let a=0;a!==i;++a)t.setTexture2DArray(e[a]||uu,s[a])}function Pb(r){switch(r){case 5126:return ub;case 35664:return fb;case 35665:return db;case 35666:return hb;case 35674:return pb;case 35675:return mb;case 35676:return _b;case 5124:case 35670:return gb;case 35667:case 35671:return bb;case 35668:case 35672:return vb;case 35669:case 35673:return yb;case 5125:return wb;case 36294:return Mb;case 36295:return xb;case 36296:return Sb;case 35678:case 36198:case 36298:case 36306:case 35682:return Cb;case 35679:case 36299:case 36307:return Tb;case 35680:case 36300:case 36308:case 36293:return Eb;case 36289:case 36303:case 36311:case 36292:return Lb}}class Ab{constructor(e,t,n){this.id=e,this.addr=n,this.cache=[],this.setValue=cb(t.type)}}class Db{constructor(e,t,n){this.id=e,this.addr=n,this.cache=[],this.size=t.size,this.setValue=Pb(t.type)}}class kb{constructor(e){this.id=e,this.seq=[],this.map={}}setValue(e,t,n){const i=this.seq;for(let s=0,a=i.length;s!==a;++s){const o=i[s];o.setValue(e,t[o.id],n)}}}const ea=/(\w+)(\])?(\[|\.)?/g;function ac(r,e){r.seq.push(e),r.map[e.id]=e}function Rb(r,e,t){const n=r.name,i=n.length;for(ea.lastIndex=0;;){const s=ea.exec(n),a=ea.lastIndex;let o=s[1];const l=s[2]==="]",c=s[3];if(l&&(o=o|0),c===void 0||c==="["&&a+2===i){ac(t,c===void 0?new Ab(o,r,e):new Db(o,r,e));break}else{let f=t.map[o];f===void 0&&(f=new kb(o),ac(t,f)),t=f}}}class ts{constructor(e,t){this.seq=[],this.map={};const n=e.getProgramParameter(t,35718);for(let i=0;i<n;++i){const s=e.getActiveUniform(t,i),a=e.getUniformLocation(t,s.name);Rb(s,a,this)}}setValue(e,t,n,i){const s=this.map[t];s!==void 0&&s.setValue(e,n,i)}setOptional(e,t,n){const i=t[n];i!==void 0&&this.setValue(e,n,i)}static upload(e,t,n,i){for(let s=0,a=t.length;s!==a;++s){const o=t[s],l=n[o.id];l.needsUpdate!==!1&&o.setValue(e,l.value,i)}}static seqWithValue(e,t){const n=[];for(let i=0,s=e.length;i!==s;++i){const a=e[i];a.id in t&&n.push(a)}return n}}function oc(r,e,t){const n=r.createShader(e);return r.shaderSource(n,t),r.compileShader(n),n}let Ib=0;function Nb(r,e){const t=r.split(`
`),n=[],i=Math.max(e-6,0),s=Math.min(e+6,t.length);for(let a=i;a<s;a++){const o=a+1;n.push(`${o===e?">":" "} ${o}: ${t[a]}`)}return n.join(`
`)}function zb(r){switch(r){case hi:return["Linear","( value )"];case ht:return["sRGB","( value )"];default:return console.warn("THREE.WebGLProgram: Unsupported encoding:",r),["Linear","( value )"]}}function lc(r,e,t){const n=r.getShaderParameter(e,35713),i=r.getShaderInfoLog(e).trim();if(n&&i==="")return"";const s=/ERROR: 0:(\d+)/.exec(i);if(s){const a=parseInt(s[1]);return t.toUpperCase()+`

`+i+`

`+Nb(r.getShaderSource(e),a)}else return i}function Fb(r,e){const t=zb(e);return"vec4 "+r+"( vec4 value ) { return LinearTo"+t[0]+t[1]+"; }"}function Ob(r,e){let t;switch(e){case Nm:t="Linear";break;case zm:t="Reinhard";break;case Fm:t="OptimizedCineon";break;case Om:t="ACESFilmic";break;case Um:t="Custom";break;default:console.warn("THREE.WebGLProgram: Unsupported toneMapping:",e),t="Linear"}return"vec3 "+r+"( vec3 color ) { return "+t+"ToneMapping( color ); }"}function Ub(r){return[r.extensionDerivatives||!!r.envMapCubeUVHeight||r.bumpMap||r.tangentSpaceNormalMap||r.clearcoatNormalMap||r.flatShading||r.shaderID==="physical"?"#extension GL_OES_standard_derivatives : enable":"",(r.extensionFragDepth||r.logarithmicDepthBuffer)&&r.rendererExtensionFragDepth?"#extension GL_EXT_frag_depth : enable":"",r.extensionDrawBuffers&&r.rendererExtensionDrawBuffers?"#extension GL_EXT_draw_buffers : require":"",(r.extensionShaderTextureLOD||r.envMap||r.transmission)&&r.rendererExtensionShaderTextureLod?"#extension GL_EXT_shader_texture_lod : enable":""].filter(lr).join(`
`)}function Bb(r){const e=[];for(const t in r){const n=r[t];n!==!1&&e.push("#define "+t+" "+n)}return e.join(`
`)}function Vb(r,e){const t={},n=r.getProgramParameter(e,35721);for(let i=0;i<n;i++){const s=r.getActiveAttrib(e,i),a=s.name;let o=1;s.type===35674&&(o=2),s.type===35675&&(o=3),s.type===35676&&(o=4),t[a]={type:s.type,location:r.getAttribLocation(e,a),locationSize:o}}return t}function lr(r){return r!==""}function cc(r,e){const t=e.numSpotLightShadows+e.numSpotLightMaps-e.numSpotLightShadowsWithMaps;return r.replace(/NUM_DIR_LIGHTS/g,e.numDirLights).replace(/NUM_SPOT_LIGHTS/g,e.numSpotLights).replace(/NUM_SPOT_LIGHT_MAPS/g,e.numSpotLightMaps).replace(/NUM_SPOT_LIGHT_COORDS/g,t).replace(/NUM_RECT_AREA_LIGHTS/g,e.numRectAreaLights).replace(/NUM_POINT_LIGHTS/g,e.numPointLights).replace(/NUM_HEMI_LIGHTS/g,e.numHemiLights).replace(/NUM_DIR_LIGHT_SHADOWS/g,e.numDirLightShadows).replace(/NUM_SPOT_LIGHT_SHADOWS_WITH_MAPS/g,e.numSpotLightShadowsWithMaps).replace(/NUM_SPOT_LIGHT_SHADOWS/g,e.numSpotLightShadows).replace(/NUM_POINT_LIGHT_SHADOWS/g,e.numPointLightShadows)}function uc(r,e){return r.replace(/NUM_CLIPPING_PLANES/g,e.numClippingPlanes).replace(/UNION_CLIPPING_PLANES/g,e.numClippingPlanes-e.numClipIntersection)}const Gb=/^[ \t]*#include +<([\w\d./]+)>/gm;function ma(r){return r.replace(Gb,Hb)}function Hb(r,e){const t=Ye[e];if(t===void 0)throw new Error("Can not resolve #include <"+e+">");return ma(t)}const Wb=/#pragma unroll_loop_start\s+for\s*\(\s*int\s+i\s*=\s*(\d+)\s*;\s*i\s*<\s*(\d+)\s*;\s*i\s*\+\+\s*\)\s*{([\s\S]+?)}\s+#pragma unroll_loop_end/g;function fc(r){return r.replace(Wb,Xb)}function Xb(r,e,t,n){let i="";for(let s=parseInt(e);s<parseInt(t);s++)i+=n.replace(/\[\s*i\s*\]/g,"[ "+s+" ]").replace(/UNROLLED_LOOP_INDEX/g,s);return i}function dc(r){let e="precision "+r.precision+` float;
precision `+r.precision+" int;";return r.precision==="highp"?e+=`
#define HIGH_PRECISION`:r.precision==="mediump"?e+=`
#define MEDIUM_PRECISION`:r.precision==="lowp"&&(e+=`
#define LOW_PRECISION`),e}function jb(r){let e="SHADOWMAP_TYPE_BASIC";return r.shadowMapType===Hc?e="SHADOWMAP_TYPE_PCF":r.shadowMapType===hm?e="SHADOWMAP_TYPE_PCF_SOFT":r.shadowMapType===ar&&(e="SHADOWMAP_TYPE_VSM"),e}function qb(r){let e="ENVMAP_TYPE_CUBE";if(r.envMap)switch(r.envMapMode){case Vi:case Gi:e="ENVMAP_TYPE_CUBE";break;case ms:e="ENVMAP_TYPE_CUBE_UV";break}return e}function Yb(r){let e="ENVMAP_MODE_REFLECTION";if(r.envMap)switch(r.envMapMode){case Gi:e="ENVMAP_MODE_REFRACTION";break}return e}function Zb(r){let e="ENVMAP_BLENDING_NONE";if(r.envMap)switch(r.combine){case jc:e="ENVMAP_BLENDING_MULTIPLY";break;case Rm:e="ENVMAP_BLENDING_MIX";break;case Im:e="ENVMAP_BLENDING_ADD";break}return e}function Kb(r){const e=r.envMapCubeUVHeight;if(e===null)return null;const t=Math.log2(e)-2,n=1/e;return{texelWidth:1/(3*Math.max(Math.pow(2,t),7*16)),texelHeight:n,maxMip:t}}function Jb(r,e,t,n){const i=r.getContext(),s=t.defines;let a=t.vertexShader,o=t.fragmentShader;const l=jb(t),c=qb(t),u=Yb(t),f=Zb(t),d=Kb(t),m=t.isWebGL2?"":Ub(t),h=Bb(s),p=i.createProgram();let _,g,v=t.glslVersion?"#version "+t.glslVersion+`
`:"";t.isRawShaderMaterial?(_=[h].filter(lr).join(`
`),_.length>0&&(_+=`
`),g=[m,h].filter(lr).join(`
`),g.length>0&&(g+=`
`)):(_=[dc(t),"#define SHADER_NAME "+t.shaderName,h,t.instancing?"#define USE_INSTANCING":"",t.instancingColor?"#define USE_INSTANCING_COLOR":"",t.supportsVertexTextures?"#define VERTEX_TEXTURES":"",t.useFog&&t.fog?"#define USE_FOG":"",t.useFog&&t.fogExp2?"#define FOG_EXP2":"",t.map?"#define USE_MAP":"",t.envMap?"#define USE_ENVMAP":"",t.envMap?"#define "+u:"",t.lightMap?"#define USE_LIGHTMAP":"",t.aoMap?"#define USE_AOMAP":"",t.emissiveMap?"#define USE_EMISSIVEMAP":"",t.bumpMap?"#define USE_BUMPMAP":"",t.normalMap?"#define USE_NORMALMAP":"",t.normalMap&&t.objectSpaceNormalMap?"#define OBJECTSPACE_NORMALMAP":"",t.normalMap&&t.tangentSpaceNormalMap?"#define TANGENTSPACE_NORMALMAP":"",t.clearcoatMap?"#define USE_CLEARCOATMAP":"",t.clearcoatRoughnessMap?"#define USE_CLEARCOAT_ROUGHNESSMAP":"",t.clearcoatNormalMap?"#define USE_CLEARCOAT_NORMALMAP":"",t.iridescenceMap?"#define USE_IRIDESCENCEMAP":"",t.iridescenceThicknessMap?"#define USE_IRIDESCENCE_THICKNESSMAP":"",t.displacementMap&&t.supportsVertexTextures?"#define USE_DISPLACEMENTMAP":"",t.specularMap?"#define USE_SPECULARMAP":"",t.specularIntensityMap?"#define USE_SPECULARINTENSITYMAP":"",t.specularColorMap?"#define USE_SPECULARCOLORMAP":"",t.roughnessMap?"#define USE_ROUGHNESSMAP":"",t.metalnessMap?"#define USE_METALNESSMAP":"",t.alphaMap?"#define USE_ALPHAMAP":"",t.transmission?"#define USE_TRANSMISSION":"",t.transmissionMap?"#define USE_TRANSMISSIONMAP":"",t.thicknessMap?"#define USE_THICKNESSMAP":"",t.sheenColorMap?"#define USE_SHEENCOLORMAP":"",t.sheenRoughnessMap?"#define USE_SHEENROUGHNESSMAP":"",t.vertexTangents?"#define USE_TANGENT":"",t.vertexColors?"#define USE_COLOR":"",t.vertexAlphas?"#define USE_COLOR_ALPHA":"",t.vertexUvs?"#define USE_UV":"",t.uvsVertexOnly?"#define UVS_VERTEX_ONLY":"",t.flatShading?"#define FLAT_SHADED":"",t.skinning?"#define USE_SKINNING":"",t.morphTargets?"#define USE_MORPHTARGETS":"",t.morphNormals&&t.flatShading===!1?"#define USE_MORPHNORMALS":"",t.morphColors&&t.isWebGL2?"#define USE_MORPHCOLORS":"",t.morphTargetsCount>0&&t.isWebGL2?"#define MORPHTARGETS_TEXTURE":"",t.morphTargetsCount>0&&t.isWebGL2?"#define MORPHTARGETS_TEXTURE_STRIDE "+t.morphTextureStride:"",t.morphTargetsCount>0&&t.isWebGL2?"#define MORPHTARGETS_COUNT "+t.morphTargetsCount:"",t.doubleSided?"#define DOUBLE_SIDED":"",t.flipSided?"#define FLIP_SIDED":"",t.shadowMapEnabled?"#define USE_SHADOWMAP":"",t.shadowMapEnabled?"#define "+l:"",t.sizeAttenuation?"#define USE_SIZEATTENUATION":"",t.logarithmicDepthBuffer?"#define USE_LOGDEPTHBUF":"",t.logarithmicDepthBuffer&&t.rendererExtensionFragDepth?"#define USE_LOGDEPTHBUF_EXT":"","uniform mat4 modelMatrix;","uniform mat4 modelViewMatrix;","uniform mat4 projectionMatrix;","uniform mat4 viewMatrix;","uniform mat3 normalMatrix;","uniform vec3 cameraPosition;","uniform bool isOrthographic;","#ifdef USE_INSTANCING","	attribute mat4 instanceMatrix;","#endif","#ifdef USE_INSTANCING_COLOR","	attribute vec3 instanceColor;","#endif","attribute vec3 position;","attribute vec3 normal;","attribute vec2 uv;","#ifdef USE_TANGENT","	attribute vec4 tangent;","#endif","#if defined( USE_COLOR_ALPHA )","	attribute vec4 color;","#elif defined( USE_COLOR )","	attribute vec3 color;","#endif","#if ( defined( USE_MORPHTARGETS ) && ! defined( MORPHTARGETS_TEXTURE ) )","	attribute vec3 morphTarget0;","	attribute vec3 morphTarget1;","	attribute vec3 morphTarget2;","	attribute vec3 morphTarget3;","	#ifdef USE_MORPHNORMALS","		attribute vec3 morphNormal0;","		attribute vec3 morphNormal1;","		attribute vec3 morphNormal2;","		attribute vec3 morphNormal3;","	#else","		attribute vec3 morphTarget4;","		attribute vec3 morphTarget5;","		attribute vec3 morphTarget6;","		attribute vec3 morphTarget7;","	#endif","#endif","#ifdef USE_SKINNING","	attribute vec4 skinIndex;","	attribute vec4 skinWeight;","#endif",`
`].filter(lr).join(`
`),g=[m,dc(t),"#define SHADER_NAME "+t.shaderName,h,t.useFog&&t.fog?"#define USE_FOG":"",t.useFog&&t.fogExp2?"#define FOG_EXP2":"",t.map?"#define USE_MAP":"",t.matcap?"#define USE_MATCAP":"",t.envMap?"#define USE_ENVMAP":"",t.envMap?"#define "+c:"",t.envMap?"#define "+u:"",t.envMap?"#define "+f:"",d?"#define CUBEUV_TEXEL_WIDTH "+d.texelWidth:"",d?"#define CUBEUV_TEXEL_HEIGHT "+d.texelHeight:"",d?"#define CUBEUV_MAX_MIP "+d.maxMip+".0":"",t.lightMap?"#define USE_LIGHTMAP":"",t.aoMap?"#define USE_AOMAP":"",t.emissiveMap?"#define USE_EMISSIVEMAP":"",t.bumpMap?"#define USE_BUMPMAP":"",t.normalMap?"#define USE_NORMALMAP":"",t.normalMap&&t.objectSpaceNormalMap?"#define OBJECTSPACE_NORMALMAP":"",t.normalMap&&t.tangentSpaceNormalMap?"#define TANGENTSPACE_NORMALMAP":"",t.clearcoat?"#define USE_CLEARCOAT":"",t.clearcoatMap?"#define USE_CLEARCOATMAP":"",t.clearcoatRoughnessMap?"#define USE_CLEARCOAT_ROUGHNESSMAP":"",t.clearcoatNormalMap?"#define USE_CLEARCOAT_NORMALMAP":"",t.iridescence?"#define USE_IRIDESCENCE":"",t.iridescenceMap?"#define USE_IRIDESCENCEMAP":"",t.iridescenceThicknessMap?"#define USE_IRIDESCENCE_THICKNESSMAP":"",t.specularMap?"#define USE_SPECULARMAP":"",t.specularIntensityMap?"#define USE_SPECULARINTENSITYMAP":"",t.specularColorMap?"#define USE_SPECULARCOLORMAP":"",t.roughnessMap?"#define USE_ROUGHNESSMAP":"",t.metalnessMap?"#define USE_METALNESSMAP":"",t.alphaMap?"#define USE_ALPHAMAP":"",t.alphaTest?"#define USE_ALPHATEST":"",t.sheen?"#define USE_SHEEN":"",t.sheenColorMap?"#define USE_SHEENCOLORMAP":"",t.sheenRoughnessMap?"#define USE_SHEENROUGHNESSMAP":"",t.transmission?"#define USE_TRANSMISSION":"",t.transmissionMap?"#define USE_TRANSMISSIONMAP":"",t.thicknessMap?"#define USE_THICKNESSMAP":"",t.decodeVideoTexture?"#define DECODE_VIDEO_TEXTURE":"",t.vertexTangents?"#define USE_TANGENT":"",t.vertexColors||t.instancingColor?"#define USE_COLOR":"",t.vertexAlphas?"#define USE_COLOR_ALPHA":"",t.vertexUvs?"#define USE_UV":"",t.uvsVertexOnly?"#define UVS_VERTEX_ONLY":"",t.gradientMap?"#define USE_GRADIENTMAP":"",t.flatShading?"#define FLAT_SHADED":"",t.doubleSided?"#define DOUBLE_SIDED":"",t.flipSided?"#define FLIP_SIDED":"",t.shadowMapEnabled?"#define USE_SHADOWMAP":"",t.shadowMapEnabled?"#define "+l:"",t.premultipliedAlpha?"#define PREMULTIPLIED_ALPHA":"",t.useLegacyLights?"#define LEGACY_LIGHTS":"",t.logarithmicDepthBuffer?"#define USE_LOGDEPTHBUF":"",t.logarithmicDepthBuffer&&t.rendererExtensionFragDepth?"#define USE_LOGDEPTHBUF_EXT":"","uniform mat4 viewMatrix;","uniform vec3 cameraPosition;","uniform bool isOrthographic;",t.toneMapping!==Un?"#define TONE_MAPPING":"",t.toneMapping!==Un?Ye.tonemapping_pars_fragment:"",t.toneMapping!==Un?Ob("toneMapping",t.toneMapping):"",t.dithering?"#define DITHERING":"",t.opaque?"#define OPAQUE":"",Ye.encodings_pars_fragment,Fb("linearToOutputTexel",t.outputEncoding),t.useDepthPacking?"#define DEPTH_PACKING "+t.depthPacking:"",`
`].filter(lr).join(`
`)),a=ma(a),a=cc(a,t),a=uc(a,t),o=ma(o),o=cc(o,t),o=uc(o,t),a=fc(a),o=fc(o),t.isWebGL2&&t.isRawShaderMaterial!==!0&&(v=`#version 300 es
`,_=["precision mediump sampler2DArray;","#define attribute in","#define varying out","#define texture2D texture"].join(`
`)+`
`+_,g=["#define varying in",t.glslVersion===Nl?"":"layout(location = 0) out highp vec4 pc_fragColor;",t.glslVersion===Nl?"":"#define gl_FragColor pc_fragColor","#define gl_FragDepthEXT gl_FragDepth","#define texture2D texture","#define textureCube texture","#define texture2DProj textureProj","#define texture2DLodEXT textureLod","#define texture2DProjLodEXT textureProjLod","#define textureCubeLodEXT textureLod","#define texture2DGradEXT textureGrad","#define texture2DProjGradEXT textureProjGrad","#define textureCubeGradEXT textureGrad"].join(`
`)+`
`+g);const b=v+_+a,w=v+g+o,y=oc(i,35633,b),x=oc(i,35632,w);if(i.attachShader(p,y),i.attachShader(p,x),t.index0AttributeName!==void 0?i.bindAttribLocation(p,0,t.index0AttributeName):t.morphTargets===!0&&i.bindAttribLocation(p,0,"position"),i.linkProgram(p),r.debug.checkShaderErrors){const S=i.getProgramInfoLog(p).trim(),P=i.getShaderInfoLog(y).trim(),k=i.getShaderInfoLog(x).trim();let H=!0,V=!0;if(i.getProgramParameter(p,35714)===!1){H=!1;const F=lc(i,y,"vertex"),j=lc(i,x,"fragment");console.error("THREE.WebGLProgram: Shader Error "+i.getError()+" - VALIDATE_STATUS "+i.getProgramParameter(p,35715)+`

Program Info Log: `+S+`
`+F+`
`+j)}else S!==""?console.warn("THREE.WebGLProgram: Program Info Log:",S):(P===""||k==="")&&(V=!1);V&&(this.diagnostics={runnable:H,programLog:S,vertexShader:{log:P,prefix:_},fragmentShader:{log:k,prefix:g}})}i.deleteShader(y),i.deleteShader(x);let E;this.getUniforms=function(){return E===void 0&&(E=new ts(i,p)),E};let M;return this.getAttributes=function(){return M===void 0&&(M=Vb(i,p)),M},this.destroy=function(){n.releaseStatesOfProgram(this),i.deleteProgram(p),this.program=void 0},this.name=t.shaderName,this.id=Ib++,this.cacheKey=e,this.usedTimes=1,this.program=p,this.vertexShader=y,this.fragmentShader=x,this}let Qb=0;class $b{constructor(){this.shaderCache=new Map,this.materialCache=new Map}update(e){const t=e.vertexShader,n=e.fragmentShader,i=this._getShaderStage(t),s=this._getShaderStage(n),a=this._getShaderCacheForMaterial(e);return a.has(i)===!1&&(a.add(i),i.usedTimes++),a.has(s)===!1&&(a.add(s),s.usedTimes++),this}remove(e){const t=this.materialCache.get(e);for(const n of t)n.usedTimes--,n.usedTimes===0&&this.shaderCache.delete(n.code);return this.materialCache.delete(e),this}getVertexShaderID(e){return this._getShaderStage(e.vertexShader).id}getFragmentShaderID(e){return this._getShaderStage(e.fragmentShader).id}dispose(){this.shaderCache.clear(),this.materialCache.clear()}_getShaderCacheForMaterial(e){const t=this.materialCache;let n=t.get(e);return n===void 0&&(n=new Set,t.set(e,n)),n}_getShaderStage(e){const t=this.shaderCache;let n=t.get(e);return n===void 0&&(n=new e2(e),t.set(e,n)),n}}class e2{constructor(e){this.id=Qb++,this.code=e,this.usedTimes=0}}function t2(r,e,t,n,i,s,a){const o=new xa,l=new $b,c=[],u=i.isWebGL2,f=i.logarithmicDepthBuffer,d=i.vertexTextures;let m=i.precision;const h={MeshDepthMaterial:"depth",MeshDistanceMaterial:"distanceRGBA",MeshNormalMaterial:"normal",MeshBasicMaterial:"basic",MeshLambertMaterial:"lambert",MeshPhongMaterial:"phong",MeshToonMaterial:"toon",MeshStandardMaterial:"physical",MeshPhysicalMaterial:"physical",MeshMatcapMaterial:"matcap",LineBasicMaterial:"basic",LineDashedMaterial:"dashed",PointsMaterial:"points",ShadowMaterial:"shadow",SpriteMaterial:"sprite"};function p(M,S,P,k,H){const V=k.fog,F=H.geometry,j=M.isMeshStandardMaterial?k.environment:null,ce=(M.isMeshStandardMaterial?t:e).get(M.envMap||j),de=!!ce&&ce.mapping===ms?ce.image.height:null,te=h[M.type];M.precision!==null&&(m=i.getMaxPrecision(M.precision),m!==M.precision&&console.warn("THREE.WebGLProgram.getParameters:",M.precision,"not supported, using",m,"instead."));const re=F.morphAttributes.position||F.morphAttributes.normal||F.morphAttributes.color,fe=re!==void 0?re.length:0;let be=0;F.morphAttributes.position!==void 0&&(be=1),F.morphAttributes.normal!==void 0&&(be=2),F.morphAttributes.color!==void 0&&(be=3);let Y,ue,pe,W;if(te){const Re=Sn[te];Y=Re.vertexShader,ue=Re.fragmentShader}else Y=M.vertexShader,ue=M.fragmentShader,l.update(M),pe=l.getVertexShaderID(M),W=l.getFragmentShaderID(M);const Me=r.getRenderTarget(),ye=M.alphaTest>0,Te=M.clearcoat>0,Se=M.iridescence>0;return{isWebGL2:u,shaderID:te,shaderName:M.type,vertexShader:Y,fragmentShader:ue,defines:M.defines,customVertexShaderID:pe,customFragmentShaderID:W,isRawShaderMaterial:M.isRawShaderMaterial===!0,glslVersion:M.glslVersion,precision:m,instancing:H.isInstancedMesh===!0,instancingColor:H.isInstancedMesh===!0&&H.instanceColor!==null,supportsVertexTextures:d,outputEncoding:Me===null?r.outputEncoding:Me.isXRRenderTarget===!0?Me.texture.encoding:hi,map:!!M.map,matcap:!!M.matcap,envMap:!!ce,envMapMode:ce&&ce.mapping,envMapCubeUVHeight:de,lightMap:!!M.lightMap,aoMap:!!M.aoMap,emissiveMap:!!M.emissiveMap,bumpMap:!!M.bumpMap,normalMap:!!M.normalMap,objectSpaceNormalMap:M.normalMapType===s_,tangentSpaceNormalMap:M.normalMapType===r_,decodeVideoTexture:!!M.map&&M.map.isVideoTexture===!0&&M.map.encoding===ht,clearcoat:Te,clearcoatMap:Te&&!!M.clearcoatMap,clearcoatRoughnessMap:Te&&!!M.clearcoatRoughnessMap,clearcoatNormalMap:Te&&!!M.clearcoatNormalMap,iridescence:Se,iridescenceMap:Se&&!!M.iridescenceMap,iridescenceThicknessMap:Se&&!!M.iridescenceThicknessMap,displacementMap:!!M.displacementMap,roughnessMap:!!M.roughnessMap,metalnessMap:!!M.metalnessMap,specularMap:!!M.specularMap,specularIntensityMap:!!M.specularIntensityMap,specularColorMap:!!M.specularColorMap,opaque:M.transparent===!1&&M.blending===zi,alphaMap:!!M.alphaMap,alphaTest:ye,gradientMap:!!M.gradientMap,sheen:M.sheen>0,sheenColorMap:!!M.sheenColorMap,sheenRoughnessMap:!!M.sheenRoughnessMap,transmission:M.transmission>0,transmissionMap:!!M.transmissionMap,thicknessMap:!!M.thicknessMap,combine:M.combine,vertexTangents:!!M.normalMap&&!!F.attributes.tangent,vertexColors:M.vertexColors,vertexAlphas:M.vertexColors===!0&&!!F.attributes.color&&F.attributes.color.itemSize===4,vertexUvs:!!M.map||!!M.bumpMap||!!M.normalMap||!!M.specularMap||!!M.alphaMap||!!M.emissiveMap||!!M.roughnessMap||!!M.metalnessMap||!!M.clearcoatMap||!!M.clearcoatRoughnessMap||!!M.clearcoatNormalMap||!!M.iridescenceMap||!!M.iridescenceThicknessMap||!!M.displacementMap||!!M.transmissionMap||!!M.thicknessMap||!!M.specularIntensityMap||!!M.specularColorMap||!!M.sheenColorMap||!!M.sheenRoughnessMap,uvsVertexOnly:!(!!M.map||!!M.bumpMap||!!M.normalMap||!!M.specularMap||!!M.alphaMap||!!M.emissiveMap||!!M.roughnessMap||!!M.metalnessMap||!!M.clearcoatNormalMap||!!M.iridescenceMap||!!M.iridescenceThicknessMap||M.transmission>0||!!M.transmissionMap||!!M.thicknessMap||!!M.specularIntensityMap||!!M.specularColorMap||M.sheen>0||!!M.sheenColorMap||!!M.sheenRoughnessMap)&&!!M.displacementMap,fog:!!V,useFog:M.fog===!0,fogExp2:V&&V.isFogExp2,flatShading:!!M.flatShading,sizeAttenuation:M.sizeAttenuation,logarithmicDepthBuffer:f,skinning:H.isSkinnedMesh===!0,morphTargets:F.morphAttributes.position!==void 0,morphNormals:F.morphAttributes.normal!==void 0,morphColors:F.morphAttributes.color!==void 0,morphTargetsCount:fe,morphTextureStride:be,numDirLights:S.directional.length,numPointLights:S.point.length,numSpotLights:S.spot.length,numSpotLightMaps:S.spotLightMap.length,numRectAreaLights:S.rectArea.length,numHemiLights:S.hemi.length,numDirLightShadows:S.directionalShadowMap.length,numPointLightShadows:S.pointShadowMap.length,numSpotLightShadows:S.spotShadowMap.length,numSpotLightShadowsWithMaps:S.numSpotLightShadowsWithMaps,numClippingPlanes:a.numPlanes,numClipIntersection:a.numIntersection,dithering:M.dithering,shadowMapEnabled:r.shadowMap.enabled&&P.length>0,shadowMapType:r.shadowMap.type,toneMapping:M.toneMapped?r.toneMapping:Un,useLegacyLights:r.useLegacyLights,premultipliedAlpha:M.premultipliedAlpha,doubleSided:M.side===zn,flipSided:M.side===an,useDepthPacking:!!M.depthPacking,depthPacking:M.depthPacking||0,index0AttributeName:M.index0AttributeName,extensionDerivatives:M.extensions&&M.extensions.derivatives,extensionFragDepth:M.extensions&&M.extensions.fragDepth,extensionDrawBuffers:M.extensions&&M.extensions.drawBuffers,extensionShaderTextureLOD:M.extensions&&M.extensions.shaderTextureLOD,rendererExtensionFragDepth:u||n.has("EXT_frag_depth"),rendererExtensionDrawBuffers:u||n.has("WEBGL_draw_buffers"),rendererExtensionShaderTextureLod:u||n.has("EXT_shader_texture_lod"),customProgramCacheKey:M.customProgramCacheKey()}}function _(M){const S=[];if(M.shaderID?S.push(M.shaderID):(S.push(M.customVertexShaderID),S.push(M.customFragmentShaderID)),M.defines!==void 0)for(const P in M.defines)S.push(P),S.push(M.defines[P]);return M.isRawShaderMaterial===!1&&(g(S,M),v(S,M),S.push(r.outputEncoding)),S.push(M.customProgramCacheKey),S.join()}function g(M,S){M.push(S.precision),M.push(S.outputEncoding),M.push(S.envMapMode),M.push(S.envMapCubeUVHeight),M.push(S.combine),M.push(S.vertexUvs),M.push(S.fogExp2),M.push(S.sizeAttenuation),M.push(S.morphTargetsCount),M.push(S.morphAttributeCount),M.push(S.numDirLights),M.push(S.numPointLights),M.push(S.numSpotLights),M.push(S.numSpotLightMaps),M.push(S.numHemiLights),M.push(S.numRectAreaLights),M.push(S.numDirLightShadows),M.push(S.numPointLightShadows),M.push(S.numSpotLightShadows),M.push(S.numSpotLightShadowsWithMaps),M.push(S.shadowMapType),M.push(S.toneMapping),M.push(S.numClippingPlanes),M.push(S.numClipIntersection),M.push(S.depthPacking)}function v(M,S){o.disableAll(),S.isWebGL2&&o.enable(0),S.supportsVertexTextures&&o.enable(1),S.instancing&&o.enable(2),S.instancingColor&&o.enable(3),S.map&&o.enable(4),S.matcap&&o.enable(5),S.envMap&&o.enable(6),S.lightMap&&o.enable(7),S.aoMap&&o.enable(8),S.emissiveMap&&o.enable(9),S.bumpMap&&o.enable(10),S.normalMap&&o.enable(11),S.objectSpaceNormalMap&&o.enable(12),S.tangentSpaceNormalMap&&o.enable(13),S.clearcoat&&o.enable(14),S.clearcoatMap&&o.enable(15),S.clearcoatRoughnessMap&&o.enable(16),S.clearcoatNormalMap&&o.enable(17),S.iridescence&&o.enable(18),S.iridescenceMap&&o.enable(19),S.iridescenceThicknessMap&&o.enable(20),S.displacementMap&&o.enable(21),S.specularMap&&o.enable(22),S.roughnessMap&&o.enable(23),S.metalnessMap&&o.enable(24),S.gradientMap&&o.enable(25),S.alphaMap&&o.enable(26),S.alphaTest&&o.enable(27),S.vertexColors&&o.enable(28),S.vertexAlphas&&o.enable(29),S.vertexUvs&&o.enable(30),S.vertexTangents&&o.enable(31),S.uvsVertexOnly&&o.enable(32),M.push(o.mask),o.disableAll(),S.fog&&o.enable(0),S.useFog&&o.enable(1),S.flatShading&&o.enable(2),S.logarithmicDepthBuffer&&o.enable(3),S.skinning&&o.enable(4),S.morphTargets&&o.enable(5),S.morphNormals&&o.enable(6),S.morphColors&&o.enable(7),S.premultipliedAlpha&&o.enable(8),S.shadowMapEnabled&&o.enable(9),S.useLegacyLights&&o.enable(10),S.doubleSided&&o.enable(11),S.flipSided&&o.enable(12),S.useDepthPacking&&o.enable(13),S.dithering&&o.enable(14),S.specularIntensityMap&&o.enable(15),S.specularColorMap&&o.enable(16),S.transmission&&o.enable(17),S.transmissionMap&&o.enable(18),S.thicknessMap&&o.enable(19),S.sheen&&o.enable(20),S.sheenColorMap&&o.enable(21),S.sheenRoughnessMap&&o.enable(22),S.decodeVideoTexture&&o.enable(23),S.opaque&&o.enable(24),M.push(o.mask)}function b(M){const S=h[M.type];let P;if(S){const k=Sn[S];P=B_.clone(k.uniforms)}else P=M.uniforms;return P}function w(M,S){let P;for(let k=0,H=c.length;k<H;k++){const V=c[k];if(V.cacheKey===S){P=V,++P.usedTimes;break}}return P===void 0&&(P=new Jb(r,S,M,s),c.push(P)),P}function y(M){if(--M.usedTimes===0){const S=c.indexOf(M);c[S]=c[c.length-1],c.pop(),M.destroy()}}function x(M){l.remove(M)}function E(){l.dispose()}return{getParameters:p,getProgramCacheKey:_,getUniforms:b,acquireProgram:w,releaseProgram:y,releaseShaderCache:x,programs:c,dispose:E}}function n2(){let r=new WeakMap;function e(s){let a=r.get(s);return a===void 0&&(a={},r.set(s,a)),a}function t(s){r.delete(s)}function n(s,a,o){r.get(s)[a]=o}function i(){r=new WeakMap}return{get:e,remove:t,update:n,dispose:i}}function i2(r,e){return r.groupOrder!==e.groupOrder?r.groupOrder-e.groupOrder:r.renderOrder!==e.renderOrder?r.renderOrder-e.renderOrder:r.material.id!==e.material.id?r.material.id-e.material.id:r.z!==e.z?r.z-e.z:r.id-e.id}function hc(r,e){return r.groupOrder!==e.groupOrder?r.groupOrder-e.groupOrder:r.renderOrder!==e.renderOrder?r.renderOrder-e.renderOrder:r.z!==e.z?e.z-r.z:r.id-e.id}function pc(){const r=[];let e=0;const t=[],n=[],i=[];function s(){e=0,t.length=0,n.length=0,i.length=0}function a(f,d,m,h,p,_){let g=r[e];return g===void 0?(g={id:f.id,object:f,geometry:d,material:m,groupOrder:h,renderOrder:f.renderOrder,z:p,group:_},r[e]=g):(g.id=f.id,g.object=f,g.geometry=d,g.material=m,g.groupOrder=h,g.renderOrder=f.renderOrder,g.z=p,g.group=_),e++,g}function o(f,d,m,h,p,_){const g=a(f,d,m,h,p,_);m.transmission>0?n.push(g):m.transparent===!0?i.push(g):t.push(g)}function l(f,d,m,h,p,_){const g=a(f,d,m,h,p,_);m.transmission>0?n.unshift(g):m.transparent===!0?i.unshift(g):t.unshift(g)}function c(f,d){t.length>1&&t.sort(f||i2),n.length>1&&n.sort(d||hc),i.length>1&&i.sort(d||hc)}function u(){for(let f=e,d=r.length;f<d;f++){const m=r[f];if(m.id===null)break;m.id=null,m.object=null,m.geometry=null,m.material=null,m.group=null}}return{opaque:t,transmissive:n,transparent:i,init:s,push:o,unshift:l,finish:u,sort:c}}function r2(){let r=new WeakMap;function e(n,i){const s=r.get(n);let a;return s===void 0?(a=new pc,r.set(n,[a])):i>=s.length?(a=new pc,s.push(a)):a=s[i],a}function t(){r=new WeakMap}return{get:e,dispose:t}}function s2(){const r={};return{get:function(e){if(r[e.id]!==void 0)return r[e.id];let t;switch(e.type){case"DirectionalLight":t={direction:new G,color:new pt};break;case"SpotLight":t={position:new G,direction:new G,color:new pt,distance:0,coneCos:0,penumbraCos:0,decay:0};break;case"PointLight":t={position:new G,color:new pt,distance:0,decay:0};break;case"HemisphereLight":t={direction:new G,skyColor:new pt,groundColor:new pt};break;case"RectAreaLight":t={color:new pt,position:new G,halfWidth:new G,halfHeight:new G};break}return r[e.id]=t,t}}}function a2(){const r={};return{get:function(e){if(r[e.id]!==void 0)return r[e.id];let t;switch(e.type){case"DirectionalLight":t={shadowBias:0,shadowNormalBias:0,shadowRadius:1,shadowMapSize:new ot};break;case"SpotLight":t={shadowBias:0,shadowNormalBias:0,shadowRadius:1,shadowMapSize:new ot};break;case"PointLight":t={shadowBias:0,shadowNormalBias:0,shadowRadius:1,shadowMapSize:new ot,shadowCameraNear:1,shadowCameraFar:1e3};break}return r[e.id]=t,t}}}let o2=0;function l2(r,e){return(e.castShadow?2:0)-(r.castShadow?2:0)+(e.map?1:0)-(r.map?1:0)}function c2(r,e){const t=new s2,n=a2(),i={version:0,hash:{directionalLength:-1,pointLength:-1,spotLength:-1,rectAreaLength:-1,hemiLength:-1,numDirectionalShadows:-1,numPointShadows:-1,numSpotShadows:-1,numSpotMaps:-1},ambient:[0,0,0],probe:[],directional:[],directionalShadow:[],directionalShadowMap:[],directionalShadowMatrix:[],spot:[],spotLightMap:[],spotShadow:[],spotShadowMap:[],spotLightMatrix:[],rectArea:[],rectAreaLTC1:null,rectAreaLTC2:null,point:[],pointShadow:[],pointShadowMap:[],pointShadowMatrix:[],hemi:[],numSpotLightShadowsWithMaps:0};for(let u=0;u<9;u++)i.probe.push(new G);const s=new G,a=new Et,o=new Et;function l(u,f){let d=0,m=0,h=0;for(let k=0;k<9;k++)i.probe[k].set(0,0,0);let p=0,_=0,g=0,v=0,b=0,w=0,y=0,x=0,E=0,M=0;u.sort(l2);const S=f===!0?Math.PI:1;for(let k=0,H=u.length;k<H;k++){const V=u[k],F=V.color,j=V.intensity,ce=V.distance,de=V.shadow&&V.shadow.map?V.shadow.map.texture:null;if(V.isAmbientLight)d+=F.r*j*S,m+=F.g*j*S,h+=F.b*j*S;else if(V.isLightProbe)for(let te=0;te<9;te++)i.probe[te].addScaledVector(V.sh.coefficients[te],j);else if(V.isDirectionalLight){const te=t.get(V);if(te.color.copy(V.color).multiplyScalar(V.intensity*S),V.castShadow){const re=V.shadow,fe=n.get(V);fe.shadowBias=re.bias,fe.shadowNormalBias=re.normalBias,fe.shadowRadius=re.radius,fe.shadowMapSize=re.mapSize,i.directionalShadow[p]=fe,i.directionalShadowMap[p]=de,i.directionalShadowMatrix[p]=V.shadow.matrix,w++}i.directional[p]=te,p++}else if(V.isSpotLight){const te=t.get(V);te.position.setFromMatrixPosition(V.matrixWorld),te.color.copy(F).multiplyScalar(j*S),te.distance=ce,te.coneCos=Math.cos(V.angle),te.penumbraCos=Math.cos(V.angle*(1-V.penumbra)),te.decay=V.decay,i.spot[g]=te;const re=V.shadow;if(V.map&&(i.spotLightMap[E]=V.map,E++,re.updateMatrices(V),V.castShadow&&M++),i.spotLightMatrix[g]=re.matrix,V.castShadow){const fe=n.get(V);fe.shadowBias=re.bias,fe.shadowNormalBias=re.normalBias,fe.shadowRadius=re.radius,fe.shadowMapSize=re.mapSize,i.spotShadow[g]=fe,i.spotShadowMap[g]=de,x++}g++}else if(V.isRectAreaLight){const te=t.get(V);te.color.copy(F).multiplyScalar(j),te.halfWidth.set(V.width*.5,0,0),te.halfHeight.set(0,V.height*.5,0),i.rectArea[v]=te,v++}else if(V.isPointLight){const te=t.get(V);if(te.color.copy(V.color).multiplyScalar(V.intensity*S),te.distance=V.distance,te.decay=V.decay,V.castShadow){const re=V.shadow,fe=n.get(V);fe.shadowBias=re.bias,fe.shadowNormalBias=re.normalBias,fe.shadowRadius=re.radius,fe.shadowMapSize=re.mapSize,fe.shadowCameraNear=re.camera.near,fe.shadowCameraFar=re.camera.far,i.pointShadow[_]=fe,i.pointShadowMap[_]=de,i.pointShadowMatrix[_]=V.shadow.matrix,y++}i.point[_]=te,_++}else if(V.isHemisphereLight){const te=t.get(V);te.skyColor.copy(V.color).multiplyScalar(j*S),te.groundColor.copy(V.groundColor).multiplyScalar(j*S),i.hemi[b]=te,b++}}v>0&&(e.isWebGL2||r.has("OES_texture_float_linear")===!0?(i.rectAreaLTC1=ge.LTC_FLOAT_1,i.rectAreaLTC2=ge.LTC_FLOAT_2):r.has("OES_texture_half_float_linear")===!0?(i.rectAreaLTC1=ge.LTC_HALF_1,i.rectAreaLTC2=ge.LTC_HALF_2):console.error("THREE.WebGLRenderer: Unable to use RectAreaLight. Missing WebGL extensions.")),i.ambient[0]=d,i.ambient[1]=m,i.ambient[2]=h;const P=i.hash;(P.directionalLength!==p||P.pointLength!==_||P.spotLength!==g||P.rectAreaLength!==v||P.hemiLength!==b||P.numDirectionalShadows!==w||P.numPointShadows!==y||P.numSpotShadows!==x||P.numSpotMaps!==E)&&(i.directional.length=p,i.spot.length=g,i.rectArea.length=v,i.point.length=_,i.hemi.length=b,i.directionalShadow.length=w,i.directionalShadowMap.length=w,i.pointShadow.length=y,i.pointShadowMap.length=y,i.spotShadow.length=x,i.spotShadowMap.length=x,i.directionalShadowMatrix.length=w,i.pointShadowMatrix.length=y,i.spotLightMatrix.length=x+E-M,i.spotLightMap.length=E,i.numSpotLightShadowsWithMaps=M,P.directionalLength=p,P.pointLength=_,P.spotLength=g,P.rectAreaLength=v,P.hemiLength=b,P.numDirectionalShadows=w,P.numPointShadows=y,P.numSpotShadows=x,P.numSpotMaps=E,i.version=o2++)}function c(u,f){let d=0,m=0,h=0,p=0,_=0;const g=f.matrixWorldInverse;for(let v=0,b=u.length;v<b;v++){const w=u[v];if(w.isDirectionalLight){const y=i.directional[d];y.direction.setFromMatrixPosition(w.matrixWorld),s.setFromMatrixPosition(w.target.matrixWorld),y.direction.sub(s),y.direction.transformDirection(g),d++}else if(w.isSpotLight){const y=i.spot[h];y.position.setFromMatrixPosition(w.matrixWorld),y.position.applyMatrix4(g),y.direction.setFromMatrixPosition(w.matrixWorld),s.setFromMatrixPosition(w.target.matrixWorld),y.direction.sub(s),y.direction.transformDirection(g),h++}else if(w.isRectAreaLight){const y=i.rectArea[p];y.position.setFromMatrixPosition(w.matrixWorld),y.position.applyMatrix4(g),o.identity(),a.copy(w.matrixWorld),a.premultiply(g),o.extractRotation(a),y.halfWidth.set(w.width*.5,0,0),y.halfHeight.set(0,w.height*.5,0),y.halfWidth.applyMatrix4(o),y.halfHeight.applyMatrix4(o),p++}else if(w.isPointLight){const y=i.point[m];y.position.setFromMatrixPosition(w.matrixWorld),y.position.applyMatrix4(g),m++}else if(w.isHemisphereLight){const y=i.hemi[_];y.direction.setFromMatrixPosition(w.matrixWorld),y.direction.transformDirection(g),_++}}}return{setup:l,setupView:c,state:i}}function mc(r,e){const t=new c2(r,e),n=[],i=[];function s(){n.length=0,i.length=0}function a(f){n.push(f)}function o(f){i.push(f)}function l(f){t.setup(n,f)}function c(f){t.setupView(n,f)}return{init:s,state:{lightsArray:n,shadowsArray:i,lights:t},setupLights:l,setupLightsView:c,pushLight:a,pushShadow:o}}function u2(r,e){let t=new WeakMap;function n(s,a=0){const o=t.get(s);let l;return o===void 0?(l=new mc(r,e),t.set(s,[l])):a>=o.length?(l=new mc(r,e),o.push(l)):l=o[a],l}function i(){t=new WeakMap}return{get:n,dispose:i}}class f2 extends Er{constructor(e){super(),this.isMeshDepthMaterial=!0,this.type="MeshDepthMaterial",this.depthPacking=n_,this.map=null,this.alphaMap=null,this.displacementMap=null,this.displacementScale=1,this.displacementBias=0,this.wireframe=!1,this.wireframeLinewidth=1,this.setValues(e)}copy(e){return super.copy(e),this.depthPacking=e.depthPacking,this.map=e.map,this.alphaMap=e.alphaMap,this.displacementMap=e.displacementMap,this.displacementScale=e.displacementScale,this.displacementBias=e.displacementBias,this.wireframe=e.wireframe,this.wireframeLinewidth=e.wireframeLinewidth,this}}class d2 extends Er{constructor(e){super(),this.isMeshDistanceMaterial=!0,this.type="MeshDistanceMaterial",this.referencePosition=new G,this.nearDistance=1,this.farDistance=1e3,this.map=null,this.alphaMap=null,this.displacementMap=null,this.displacementScale=1,this.displacementBias=0,this.setValues(e)}copy(e){return super.copy(e),this.referencePosition.copy(e.referencePosition),this.nearDistance=e.nearDistance,this.farDistance=e.farDistance,this.map=e.map,this.alphaMap=e.alphaMap,this.displacementMap=e.displacementMap,this.displacementScale=e.displacementScale,this.displacementBias=e.displacementBias,this}}const h2=`void main() {
	gl_Position = vec4( position, 1.0 );
}`,p2=`uniform sampler2D shadow_pass;
uniform vec2 resolution;
uniform float radius;
#include <packing>
void main() {
	const float samples = float( VSM_SAMPLES );
	float mean = 0.0;
	float squared_mean = 0.0;
	float uvStride = samples <= 1.0 ? 0.0 : 2.0 / ( samples - 1.0 );
	float uvStart = samples <= 1.0 ? 0.0 : - 1.0;
	for ( float i = 0.0; i < samples; i ++ ) {
		float uvOffset = uvStart + i * uvStride;
		#ifdef HORIZONTAL_PASS
			vec2 distribution = unpackRGBATo2Half( texture2D( shadow_pass, ( gl_FragCoord.xy + vec2( uvOffset, 0.0 ) * radius ) / resolution ) );
			mean += distribution.x;
			squared_mean += distribution.y * distribution.y + distribution.x * distribution.x;
		#else
			float depth = unpackRGBAToDepth( texture2D( shadow_pass, ( gl_FragCoord.xy + vec2( 0.0, uvOffset ) * radius ) / resolution ) );
			mean += depth;
			squared_mean += depth * depth;
		#endif
	}
	mean = mean / samples;
	squared_mean = squared_mean / samples;
	float std_dev = sqrt( squared_mean - mean * mean );
	gl_FragColor = pack2HalfToRGBA( vec2( mean, std_dev ) );
}`;function m2(r,e,t){let n=new ou;const i=new ot,s=new ot,a=new Ot,o=new f2({depthPacking:i_}),l=new d2,c={},u=t.maxTextureSize,f={[Zn]:an,[an]:Zn,[zn]:zn},d=new mi({defines:{VSM_SAMPLES:8},uniforms:{shadow_pass:{value:null},resolution:{value:new ot},radius:{value:4}},vertexShader:h2,fragmentShader:p2}),m=d.clone();m.defines.HORIZONTAL_PASS=1;const h=new en;h.setAttribute("position",new Cn(new Float32Array([-1,-1,.5,3,-1,.5,-1,3,.5]),3));const p=new Ce(h,d),_=this;this.enabled=!1,this.autoUpdate=!0,this.needsUpdate=!1,this.type=Hc,this.render=function(w,y,x){if(_.enabled===!1||_.autoUpdate===!1&&_.needsUpdate===!1||w.length===0)return;const E=r.getRenderTarget(),M=r.getActiveCubeFace(),S=r.getActiveMipmapLevel(),P=r.state;P.setBlending(Yn),P.buffers.color.setClear(1,1,1,1),P.buffers.depth.setTest(!0),P.setScissorTest(!1);for(let k=0,H=w.length;k<H;k++){const V=w[k],F=V.shadow;if(F===void 0){console.warn("THREE.WebGLShadowMap:",V,"has no shadow.");continue}if(F.autoUpdate===!1&&F.needsUpdate===!1)continue;i.copy(F.mapSize);const j=F.getFrameExtents();if(i.multiply(j),s.copy(F.mapSize),(i.x>u||i.y>u)&&(i.x>u&&(s.x=Math.floor(u/j.x),i.x=s.x*j.x,F.mapSize.x=s.x),i.y>u&&(s.y=Math.floor(u/j.y),i.y=s.y*j.y,F.mapSize.y=s.y)),F.map===null){const de=this.type!==ar?{minFilter:Yt,magFilter:Yt}:{};F.map=new pi(i.x,i.y,de),F.map.texture.name=V.name+".shadowMap",F.camera.updateProjectionMatrix()}r.setRenderTarget(F.map),r.clear();const ce=F.getViewportCount();for(let de=0;de<ce;de++){const te=F.getViewport(de);a.set(s.x*te.x,s.y*te.y,s.x*te.z,s.y*te.w),P.viewport(a),F.updateMatrices(V,de),n=F.getFrustum(),b(y,x,F.camera,V,this.type)}F.isPointLightShadow!==!0&&this.type===ar&&g(F,x),F.needsUpdate=!1}_.needsUpdate=!1,r.setRenderTarget(E,M,S)};function g(w,y){const x=e.update(p);d.defines.VSM_SAMPLES!==w.blurSamples&&(d.defines.VSM_SAMPLES=w.blurSamples,m.defines.VSM_SAMPLES=w.blurSamples,d.needsUpdate=!0,m.needsUpdate=!0),w.mapPass===null&&(w.mapPass=new pi(i.x,i.y)),d.uniforms.shadow_pass.value=w.map.texture,d.uniforms.resolution.value=w.mapSize,d.uniforms.radius.value=w.radius,r.setRenderTarget(w.mapPass),r.clear(),r.renderBufferDirect(y,null,x,d,p,null),m.uniforms.shadow_pass.value=w.mapPass.texture,m.uniforms.resolution.value=w.mapSize,m.uniforms.radius.value=w.radius,r.setRenderTarget(w.map),r.clear(),r.renderBufferDirect(y,null,x,m,p,null)}function v(w,y,x,E,M,S){let P=null;const k=x.isPointLight===!0?w.customDistanceMaterial:w.customDepthMaterial;if(k!==void 0)P=k;else if(P=x.isPointLight===!0?l:o,r.localClippingEnabled&&y.clipShadows===!0&&Array.isArray(y.clippingPlanes)&&y.clippingPlanes.length!==0||y.displacementMap&&y.displacementScale!==0||y.alphaMap&&y.alphaTest>0||y.map&&y.alphaTest>0){const H=P.uuid,V=y.uuid;let F=c[H];F===void 0&&(F={},c[H]=F);let j=F[V];j===void 0&&(j=P.clone(),F[V]=j),P=j}return P.visible=y.visible,P.wireframe=y.wireframe,S===ar?P.side=y.shadowSide!==null?y.shadowSide:y.side:P.side=y.shadowSide!==null?y.shadowSide:f[y.side],P.alphaMap=y.alphaMap,P.alphaTest=y.alphaTest,P.map=y.map,P.clipShadows=y.clipShadows,P.clippingPlanes=y.clippingPlanes,P.clipIntersection=y.clipIntersection,P.displacementMap=y.displacementMap,P.displacementScale=y.displacementScale,P.displacementBias=y.displacementBias,P.wireframeLinewidth=y.wireframeLinewidth,P.linewidth=y.linewidth,x.isPointLight===!0&&P.isMeshDistanceMaterial===!0&&(P.referencePosition.setFromMatrixPosition(x.matrixWorld),P.nearDistance=E,P.farDistance=M),P}function b(w,y,x,E,M){if(w.visible===!1)return;if(w.layers.test(y.layers)&&(w.isMesh||w.isLine||w.isPoints)&&(w.castShadow||w.receiveShadow&&M===ar)&&(!w.frustumCulled||n.intersectsObject(w))){w.modelViewMatrix.multiplyMatrices(x.matrixWorldInverse,w.matrixWorld);const k=e.update(w),H=w.material;if(Array.isArray(H)){const V=k.groups;for(let F=0,j=V.length;F<j;F++){const ce=V[F],de=H[ce.materialIndex];if(de&&de.visible){const te=v(w,de,E,x.near,x.far,M);r.renderBufferDirect(x,null,k,te,w,ce)}}}else if(H.visible){const V=v(w,H,E,x.near,x.far,M);r.renderBufferDirect(x,null,k,V,w,null)}}const P=w.children;for(let k=0,H=P.length;k<H;k++)b(P[k],y,x,E,M)}}function _2(r,e,t){const n=t.isWebGL2;function i(){let N=!1;const Z=new Ot;let ne=null;const ve=new Ot(0,0,0,0);return{setMask:function(ke){ne!==ke&&!N&&(r.colorMask(ke,ke,ke,ke),ne=ke)},setLocked:function(ke){N=ke},setClear:function(ke,dt,Rt,Wt,vn){vn===!0&&(ke*=Wt,dt*=Wt,Rt*=Wt),Z.set(ke,dt,Rt,Wt),ve.equals(Z)===!1&&(r.clearColor(ke,dt,Rt,Wt),ve.copy(Z))},reset:function(){N=!1,ne=null,ve.set(-1,0,0,0)}}}function s(){let N=!1,Z=null,ne=null,ve=null;return{setTest:function(ke){ke?ye(2929):Te(2929)},setMask:function(ke){Z!==ke&&!N&&(r.depthMask(ke),Z=ke)},setFunc:function(ke){if(ne!==ke){switch(ke){case Tm:r.depthFunc(512);break;case Em:r.depthFunc(519);break;case Lm:r.depthFunc(513);break;case la:r.depthFunc(515);break;case Pm:r.depthFunc(514);break;case Am:r.depthFunc(518);break;case Dm:r.depthFunc(516);break;case km:r.depthFunc(517);break;default:r.depthFunc(515)}ne=ke}},setLocked:function(ke){N=ke},setClear:function(ke){ve!==ke&&(r.clearDepth(ke),ve=ke)},reset:function(){N=!1,Z=null,ne=null,ve=null}}}function a(){let N=!1,Z=null,ne=null,ve=null,ke=null,dt=null,Rt=null,Wt=null,vn=null;return{setTest:function(wt){N||(wt?ye(2960):Te(2960))},setMask:function(wt){Z!==wt&&!N&&(r.stencilMask(wt),Z=wt)},setFunc:function(wt,cn,yn){(ne!==wt||ve!==cn||ke!==yn)&&(r.stencilFunc(wt,cn,yn),ne=wt,ve=cn,ke=yn)},setOp:function(wt,cn,yn){(dt!==wt||Rt!==cn||Wt!==yn)&&(r.stencilOp(wt,cn,yn),dt=wt,Rt=cn,Wt=yn)},setLocked:function(wt){N=wt},setClear:function(wt){vn!==wt&&(r.clearStencil(wt),vn=wt)},reset:function(){N=!1,Z=null,ne=null,ve=null,ke=null,dt=null,Rt=null,Wt=null,vn=null}}}const o=new i,l=new s,c=new a,u=new WeakMap,f=new WeakMap;let d={},m={},h=new WeakMap,p=[],_=null,g=!1,v=null,b=null,w=null,y=null,x=null,E=null,M=null,S=!1,P=null,k=null,H=null,V=null,F=null;const j=r.getParameter(35661);let ce=!1,de=0;const te=r.getParameter(7938);te.indexOf("WebGL")!==-1?(de=parseFloat(/^WebGL (\d)/.exec(te)[1]),ce=de>=1):te.indexOf("OpenGL ES")!==-1&&(de=parseFloat(/^OpenGL ES (\d)/.exec(te)[1]),ce=de>=2);let re=null,fe={};const be=r.getParameter(3088),Y=r.getParameter(2978),ue=new Ot().fromArray(be),pe=new Ot().fromArray(Y);function W(N,Z,ne){const ve=new Uint8Array(4),ke=r.createTexture();r.bindTexture(N,ke),r.texParameteri(N,10241,9728),r.texParameteri(N,10240,9728);for(let dt=0;dt<ne;dt++)r.texImage2D(Z+dt,0,6408,1,1,0,6408,5121,ve);return ke}const Me={};Me[3553]=W(3553,3553,1),Me[34067]=W(34067,34069,6),o.setClear(0,0,0,1),l.setClear(1),c.setClear(0),ye(2929),l.setFunc(la),yt(!1),_t(rl),ye(2884),qe(Yn);function ye(N){d[N]!==!0&&(r.enable(N),d[N]=!0)}function Te(N){d[N]!==!1&&(r.disable(N),d[N]=!1)}function Se(N,Z){return m[N]!==Z?(r.bindFramebuffer(N,Z),m[N]=Z,n&&(N===36009&&(m[36160]=Z),N===36160&&(m[36009]=Z)),!0):!1}function Ne(N,Z){let ne=p,ve=!1;if(N)if(ne=h.get(Z),ne===void 0&&(ne=[],h.set(Z,ne)),N.isWebGLMultipleRenderTargets){const ke=N.texture;if(ne.length!==ke.length||ne[0]!==36064){for(let dt=0,Rt=ke.length;dt<Rt;dt++)ne[dt]=36064+dt;ne.length=ke.length,ve=!0}}else ne[0]!==36064&&(ne[0]=36064,ve=!0);else ne[0]!==1029&&(ne[0]=1029,ve=!0);ve&&(t.isWebGL2?r.drawBuffers(ne):e.get("WEBGL_draw_buffers").drawBuffersWEBGL(ne))}function Re(N){return _!==N?(r.useProgram(N),_=N,!0):!1}const Ve={[Di]:32774,[mm]:32778,[_m]:32779};if(n)Ve[ll]=32775,Ve[cl]=32776;else{const N=e.get("EXT_blend_minmax");N!==null&&(Ve[ll]=N.MIN_EXT,Ve[cl]=N.MAX_EXT)}const je={[gm]:0,[bm]:1,[vm]:768,[Wc]:770,[Cm]:776,[xm]:774,[wm]:772,[ym]:769,[Xc]:771,[Sm]:775,[Mm]:773};function qe(N,Z,ne,ve,ke,dt,Rt,Wt){if(N===Yn){g===!0&&(Te(3042),g=!1);return}if(g===!1&&(ye(3042),g=!0),N!==pm){if(N!==v||Wt!==S){if((b!==Di||x!==Di)&&(r.blendEquation(32774),b=Di,x=Di),Wt)switch(N){case zi:r.blendFuncSeparate(1,771,1,771);break;case sl:r.blendFunc(1,1);break;case al:r.blendFuncSeparate(0,769,0,1);break;case ol:r.blendFuncSeparate(0,768,0,770);break;default:console.error("THREE.WebGLState: Invalid blending: ",N);break}else switch(N){case zi:r.blendFuncSeparate(770,771,1,771);break;case sl:r.blendFunc(770,1);break;case al:r.blendFuncSeparate(0,769,0,1);break;case ol:r.blendFunc(0,768);break;default:console.error("THREE.WebGLState: Invalid blending: ",N);break}w=null,y=null,E=null,M=null,v=N,S=Wt}return}ke=ke||Z,dt=dt||ne,Rt=Rt||ve,(Z!==b||ke!==x)&&(r.blendEquationSeparate(Ve[Z],Ve[ke]),b=Z,x=ke),(ne!==w||ve!==y||dt!==E||Rt!==M)&&(r.blendFuncSeparate(je[ne],je[ve],je[dt],je[Rt]),w=ne,y=ve,E=dt,M=Rt),v=N,S=!1}function it(N,Z){N.side===zn?Te(2884):ye(2884);let ne=N.side===an;Z&&(ne=!ne),yt(ne),N.blending===zi&&N.transparent===!1?qe(Yn):qe(N.blending,N.blendEquation,N.blendSrc,N.blendDst,N.blendEquationAlpha,N.blendSrcAlpha,N.blendDstAlpha,N.premultipliedAlpha),l.setFunc(N.depthFunc),l.setTest(N.depthTest),l.setMask(N.depthWrite),o.setMask(N.colorWrite);const ve=N.stencilWrite;c.setTest(ve),ve&&(c.setMask(N.stencilWriteMask),c.setFunc(N.stencilFunc,N.stencilRef,N.stencilFuncMask),c.setOp(N.stencilFail,N.stencilZFail,N.stencilZPass)),at(N.polygonOffset,N.polygonOffsetFactor,N.polygonOffsetUnits),N.alphaToCoverage===!0?ye(32926):Te(32926)}function yt(N){P!==N&&(N?r.frontFace(2304):r.frontFace(2305),P=N)}function _t(N){N!==fm?(ye(2884),N!==k&&(N===rl?r.cullFace(1029):N===dm?r.cullFace(1028):r.cullFace(1032))):Te(2884),k=N}function st(N){N!==H&&(ce&&r.lineWidth(N),H=N)}function at(N,Z,ne){N?(ye(32823),(V!==Z||F!==ne)&&(r.polygonOffset(Z,ne),V=Z,F=ne)):Te(32823)}function Ht(N){N?ye(3089):Te(3089)}function kt(N){N===void 0&&(N=33984+j-1),re!==N&&(r.activeTexture(N),re=N)}function R(N,Z,ne){ne===void 0&&(re===null?ne=33984+j-1:ne=re);let ve=fe[ne];ve===void 0&&(ve={type:void 0,texture:void 0},fe[ne]=ve),(ve.type!==N||ve.texture!==Z)&&(re!==ne&&(r.activeTexture(ne),re=ne),r.bindTexture(N,Z||Me[N]),ve.type=N,ve.texture=Z)}function T(){const N=fe[re];N!==void 0&&N.type!==void 0&&(r.bindTexture(N.type,null),N.type=void 0,N.texture=void 0)}function O(){try{r.compressedTexImage2D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function se(){try{r.compressedTexImage3D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function oe(){try{r.texSubImage2D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function me(){try{r.texSubImage3D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function Le(){try{r.compressedTexSubImage2D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function xe(){try{r.compressedTexSubImage3D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function le(){try{r.texStorage2D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function Ue(){try{r.texStorage3D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function Ee(){try{r.texImage2D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function Fe(){try{r.texImage3D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function we(N){ue.equals(N)===!1&&(r.scissor(N.x,N.y,N.z,N.w),ue.copy(N))}function Ie(N){pe.equals(N)===!1&&(r.viewport(N.x,N.y,N.z,N.w),pe.copy(N))}function Be(N,Z){let ne=f.get(Z);ne===void 0&&(ne=new WeakMap,f.set(Z,ne));let ve=ne.get(N);ve===void 0&&(ve=r.getUniformBlockIndex(Z,N.name),ne.set(N,ve))}function rt(N,Z){const ve=f.get(Z).get(N);u.get(Z)!==ve&&(r.uniformBlockBinding(Z,ve,N.__bindingPointIndex),u.set(Z,ve))}function tt(){r.disable(3042),r.disable(2884),r.disable(2929),r.disable(32823),r.disable(3089),r.disable(2960),r.disable(32926),r.blendEquation(32774),r.blendFunc(1,0),r.blendFuncSeparate(1,0,1,0),r.colorMask(!0,!0,!0,!0),r.clearColor(0,0,0,0),r.depthMask(!0),r.depthFunc(513),r.clearDepth(1),r.stencilMask(4294967295),r.stencilFunc(519,0,4294967295),r.stencilOp(7680,7680,7680),r.clearStencil(0),r.cullFace(1029),r.frontFace(2305),r.polygonOffset(0,0),r.activeTexture(33984),r.bindFramebuffer(36160,null),n===!0&&(r.bindFramebuffer(36009,null),r.bindFramebuffer(36008,null)),r.useProgram(null),r.lineWidth(1),r.scissor(0,0,r.canvas.width,r.canvas.height),r.viewport(0,0,r.canvas.width,r.canvas.height),d={},re=null,fe={},m={},h=new WeakMap,p=[],_=null,g=!1,v=null,b=null,w=null,y=null,x=null,E=null,M=null,S=!1,P=null,k=null,H=null,V=null,F=null,ue.set(0,0,r.canvas.width,r.canvas.height),pe.set(0,0,r.canvas.width,r.canvas.height),o.reset(),l.reset(),c.reset()}return{buffers:{color:o,depth:l,stencil:c},enable:ye,disable:Te,bindFramebuffer:Se,drawBuffers:Ne,useProgram:Re,setBlending:qe,setMaterial:it,setFlipSided:yt,setCullFace:_t,setLineWidth:st,setPolygonOffset:at,setScissorTest:Ht,activeTexture:kt,bindTexture:R,unbindTexture:T,compressedTexImage2D:O,compressedTexImage3D:se,texImage2D:Ee,texImage3D:Fe,updateUBOMapping:Be,uniformBlockBinding:rt,texStorage2D:le,texStorage3D:Ue,texSubImage2D:oe,texSubImage3D:me,compressedTexSubImage2D:Le,compressedTexSubImage3D:xe,scissor:we,viewport:Ie,reset:tt}}function g2(r,e,t,n,i,s,a){const o=i.isWebGL2,l=i.maxTextures,c=i.maxCubemapSize,u=i.maxTextureSize,f=i.maxSamples,d=e.has("WEBGL_multisampled_render_to_texture")?e.get("WEBGL_multisampled_render_to_texture"):null,m=typeof navigator>"u"?!1:/OculusBrowser/g.test(navigator.userAgent),h=new WeakMap;let p;const _=new WeakMap;let g=!1;try{g=typeof OffscreenCanvas<"u"&&new OffscreenCanvas(1,1).getContext("2d")!==null}catch{}function v(R,T){return g?new OffscreenCanvas(R,T):ds("canvas")}function b(R,T,O,se){let oe=1;if((R.width>se||R.height>se)&&(oe=se/Math.max(R.width,R.height)),oe<1||T===!0)if(typeof HTMLImageElement<"u"&&R instanceof HTMLImageElement||typeof HTMLCanvasElement<"u"&&R instanceof HTMLCanvasElement||typeof ImageBitmap<"u"&&R instanceof ImageBitmap){const me=T?Kc:Math.floor,Le=me(oe*R.width),xe=me(oe*R.height);p===void 0&&(p=v(Le,xe));const le=O?v(Le,xe):p;return le.width=Le,le.height=xe,le.getContext("2d").drawImage(R,0,0,Le,xe),console.warn("THREE.WebGLRenderer: Texture has been resized from ("+R.width+"x"+R.height+") to ("+Le+"x"+xe+")."),le}else return"data"in R&&console.warn("THREE.WebGLRenderer: Image in DataTexture is too big ("+R.width+"x"+R.height+")."),R;return R}function w(R){return pa(R.width)&&pa(R.height)}function y(R){return o?!1:R.wrapS!==_n||R.wrapT!==_n||R.minFilter!==Yt&&R.minFilter!==fn}function x(R,T){return R.generateMipmaps&&T&&R.minFilter!==Yt&&R.minFilter!==fn}function E(R){r.generateMipmap(R)}function M(R,T,O,se,oe=!1){if(o===!1)return T;if(R!==null){if(r[R]!==void 0)return r[R];console.warn("THREE.WebGLRenderer: Attempt to use non-existing WebGL internal format '"+R+"'")}let me=T;return T===6403&&(O===5126&&(me=33326),O===5131&&(me=33325),O===5121&&(me=33321)),T===33319&&(O===5126&&(me=33328),O===5131&&(me=33327),O===5121&&(me=33323)),T===6408&&(O===5126&&(me=34836),O===5131&&(me=34842),O===5121&&(me=se===ht&&oe===!1?35907:32856),O===32819&&(me=32854),O===32820&&(me=32855)),(me===33325||me===33326||me===33327||me===33328||me===34842||me===34836)&&e.get("EXT_color_buffer_float"),me}function S(R,T,O){return x(R,O)===!0||R.isFramebufferTexture&&R.minFilter!==Yt&&R.minFilter!==fn?Math.log2(Math.max(T.width,T.height))+1:R.mipmaps!==void 0&&R.mipmaps.length>0?R.mipmaps.length:R.isCompressedTexture&&Array.isArray(R.image)?T.mipmaps.length:1}function P(R){return R===Yt||R===ul||R===Ts?9728:9729}function k(R){const T=R.target;T.removeEventListener("dispose",k),V(T),T.isVideoTexture&&h.delete(T)}function H(R){const T=R.target;T.removeEventListener("dispose",H),j(T)}function V(R){const T=n.get(R);if(T.__webglInit===void 0)return;const O=R.source,se=_.get(O);if(se){const oe=se[T.__cacheKey];oe.usedTimes--,oe.usedTimes===0&&F(R),Object.keys(se).length===0&&_.delete(O)}n.remove(R)}function F(R){const T=n.get(R);r.deleteTexture(T.__webglTexture);const O=R.source,se=_.get(O);delete se[T.__cacheKey],a.memory.textures--}function j(R){const T=R.texture,O=n.get(R),se=n.get(T);if(se.__webglTexture!==void 0&&(r.deleteTexture(se.__webglTexture),a.memory.textures--),R.depthTexture&&R.depthTexture.dispose(),R.isWebGLCubeRenderTarget)for(let oe=0;oe<6;oe++)r.deleteFramebuffer(O.__webglFramebuffer[oe]),O.__webglDepthbuffer&&r.deleteRenderbuffer(O.__webglDepthbuffer[oe]);else{if(r.deleteFramebuffer(O.__webglFramebuffer),O.__webglDepthbuffer&&r.deleteRenderbuffer(O.__webglDepthbuffer),O.__webglMultisampledFramebuffer&&r.deleteFramebuffer(O.__webglMultisampledFramebuffer),O.__webglColorRenderbuffer)for(let oe=0;oe<O.__webglColorRenderbuffer.length;oe++)O.__webglColorRenderbuffer[oe]&&r.deleteRenderbuffer(O.__webglColorRenderbuffer[oe]);O.__webglDepthRenderbuffer&&r.deleteRenderbuffer(O.__webglDepthRenderbuffer)}if(R.isWebGLMultipleRenderTargets)for(let oe=0,me=T.length;oe<me;oe++){const Le=n.get(T[oe]);Le.__webglTexture&&(r.deleteTexture(Le.__webglTexture),a.memory.textures--),n.remove(T[oe])}n.remove(T),n.remove(R)}let ce=0;function de(){ce=0}function te(){const R=ce;return R>=l&&console.warn("THREE.WebGLTextures: Trying to use "+R+" texture units while this GPU supports only "+l),ce+=1,R}function re(R){const T=[];return T.push(R.wrapS),T.push(R.wrapT),T.push(R.wrapR||0),T.push(R.magFilter),T.push(R.minFilter),T.push(R.anisotropy),T.push(R.internalFormat),T.push(R.format),T.push(R.type),T.push(R.generateMipmaps),T.push(R.premultiplyAlpha),T.push(R.flipY),T.push(R.unpackAlignment),T.push(R.encoding),T.join()}function fe(R,T){const O=n.get(R);if(R.isVideoTexture&&Ht(R),R.isRenderTargetTexture===!1&&R.version>0&&O.__version!==R.version){const se=R.image;if(se===null)console.warn("THREE.WebGLRenderer: Texture marked for update but no image data found.");else if(se.complete===!1)console.warn("THREE.WebGLRenderer: Texture marked for update but image is incomplete");else{Te(O,R,T);return}}t.bindTexture(3553,O.__webglTexture,33984+T)}function be(R,T){const O=n.get(R);if(R.version>0&&O.__version!==R.version){Te(O,R,T);return}t.bindTexture(35866,O.__webglTexture,33984+T)}function Y(R,T){const O=n.get(R);if(R.version>0&&O.__version!==R.version){Te(O,R,T);return}t.bindTexture(32879,O.__webglTexture,33984+T)}function ue(R,T){const O=n.get(R);if(R.version>0&&O.__version!==R.version){Se(O,R,T);return}t.bindTexture(34067,O.__webglTexture,33984+T)}const pe={[fa]:10497,[_n]:33071,[da]:33648},W={[Yt]:9728,[ul]:9984,[Ts]:9986,[fn]:9729,[Bm]:9985,[br]:9987};function Me(R,T,O){if(O?(r.texParameteri(R,10242,pe[T.wrapS]),r.texParameteri(R,10243,pe[T.wrapT]),(R===32879||R===35866)&&r.texParameteri(R,32882,pe[T.wrapR]),r.texParameteri(R,10240,W[T.magFilter]),r.texParameteri(R,10241,W[T.minFilter])):(r.texParameteri(R,10242,33071),r.texParameteri(R,10243,33071),(R===32879||R===35866)&&r.texParameteri(R,32882,33071),(T.wrapS!==_n||T.wrapT!==_n)&&console.warn("THREE.WebGLRenderer: Texture is not power of two. Texture.wrapS and Texture.wrapT should be set to THREE.ClampToEdgeWrapping."),r.texParameteri(R,10240,P(T.magFilter)),r.texParameteri(R,10241,P(T.minFilter)),T.minFilter!==Yt&&T.minFilter!==fn&&console.warn("THREE.WebGLRenderer: Texture is not power of two. Texture.minFilter should be set to THREE.NearestFilter or THREE.LinearFilter.")),e.has("EXT_texture_filter_anisotropic")===!0){const se=e.get("EXT_texture_filter_anisotropic");if(T.magFilter===Yt||T.minFilter!==Ts&&T.minFilter!==br||T.type===ci&&e.has("OES_texture_float_linear")===!1||o===!1&&T.type===vr&&e.has("OES_texture_half_float_linear")===!1)return;(T.anisotropy>1||n.get(T).__currentAnisotropy)&&(r.texParameterf(R,se.TEXTURE_MAX_ANISOTROPY_EXT,Math.min(T.anisotropy,i.getMaxAnisotropy())),n.get(T).__currentAnisotropy=T.anisotropy)}}function ye(R,T){let O=!1;R.__webglInit===void 0&&(R.__webglInit=!0,T.addEventListener("dispose",k));const se=T.source;let oe=_.get(se);oe===void 0&&(oe={},_.set(se,oe));const me=re(T);if(me!==R.__cacheKey){oe[me]===void 0&&(oe[me]={texture:r.createTexture(),usedTimes:0},a.memory.textures++,O=!0),oe[me].usedTimes++;const Le=oe[R.__cacheKey];Le!==void 0&&(oe[R.__cacheKey].usedTimes--,Le.usedTimes===0&&F(T)),R.__cacheKey=me,R.__webglTexture=oe[me].texture}return O}function Te(R,T,O){let se=3553;(T.isDataArrayTexture||T.isCompressedArrayTexture)&&(se=35866),T.isData3DTexture&&(se=32879);const oe=ye(R,T),me=T.source;t.bindTexture(se,R.__webglTexture,33984+O);const Le=n.get(me);if(me.version!==Le.__version||oe===!0){t.activeTexture(33984+O),r.pixelStorei(37440,T.flipY),r.pixelStorei(37441,T.premultiplyAlpha),r.pixelStorei(3317,T.unpackAlignment),r.pixelStorei(37443,0);const xe=y(T)&&w(T.image)===!1;let le=b(T.image,xe,!1,u);le=kt(T,le);const Ue=w(le)||o,Ee=s.convert(T.format,T.encoding);let Fe=s.convert(T.type),we=M(T.internalFormat,Ee,Fe,T.encoding,T.isVideoTexture);Me(se,T,Ue);let Ie;const Be=T.mipmaps,rt=o&&T.isVideoTexture!==!0,tt=Le.__version===void 0||oe===!0,N=S(T,le,Ue);if(T.isDepthTexture)we=6402,o?T.type===ci?we=36012:T.type===li?we=33190:T.type===Fi?we=35056:we=33189:T.type===ci&&console.error("WebGLRenderer: Floating point depth texture requires WebGL2."),T.format===ui&&we===6402&&T.type!==Yc&&T.type!==li&&(console.warn("THREE.WebGLRenderer: Use UnsignedShortType or UnsignedIntType for DepthFormat DepthTexture."),T.type=li,Fe=s.convert(T.type)),T.format===Hi&&we===6402&&(we=34041,T.type!==Fi&&(console.warn("THREE.WebGLRenderer: Use UnsignedInt248Type for DepthStencilFormat DepthTexture."),T.type=Fi,Fe=s.convert(T.type))),tt&&(rt?t.texStorage2D(3553,1,we,le.width,le.height):t.texImage2D(3553,0,we,le.width,le.height,0,Ee,Fe,null));else if(T.isDataTexture)if(Be.length>0&&Ue){rt&&tt&&t.texStorage2D(3553,N,we,Be[0].width,Be[0].height);for(let Z=0,ne=Be.length;Z<ne;Z++)Ie=Be[Z],rt?t.texSubImage2D(3553,Z,0,0,Ie.width,Ie.height,Ee,Fe,Ie.data):t.texImage2D(3553,Z,we,Ie.width,Ie.height,0,Ee,Fe,Ie.data);T.generateMipmaps=!1}else rt?(tt&&t.texStorage2D(3553,N,we,le.width,le.height),t.texSubImage2D(3553,0,0,0,le.width,le.height,Ee,Fe,le.data)):t.texImage2D(3553,0,we,le.width,le.height,0,Ee,Fe,le.data);else if(T.isCompressedTexture)if(T.isCompressedArrayTexture){rt&&tt&&t.texStorage3D(35866,N,we,Be[0].width,Be[0].height,le.depth);for(let Z=0,ne=Be.length;Z<ne;Z++)Ie=Be[Z],T.format!==gn?Ee!==null?rt?t.compressedTexSubImage3D(35866,Z,0,0,0,Ie.width,Ie.height,le.depth,Ee,Ie.data,0,0):t.compressedTexImage3D(35866,Z,we,Ie.width,Ie.height,le.depth,0,Ie.data,0,0):console.warn("THREE.WebGLRenderer: Attempt to load unsupported compressed texture format in .uploadTexture()"):rt?t.texSubImage3D(35866,Z,0,0,0,Ie.width,Ie.height,le.depth,Ee,Fe,Ie.data):t.texImage3D(35866,Z,we,Ie.width,Ie.height,le.depth,0,Ee,Fe,Ie.data)}else{rt&&tt&&t.texStorage2D(3553,N,we,Be[0].width,Be[0].height);for(let Z=0,ne=Be.length;Z<ne;Z++)Ie=Be[Z],T.format!==gn?Ee!==null?rt?t.compressedTexSubImage2D(3553,Z,0,0,Ie.width,Ie.height,Ee,Ie.data):t.compressedTexImage2D(3553,Z,we,Ie.width,Ie.height,0,Ie.data):console.warn("THREE.WebGLRenderer: Attempt to load unsupported compressed texture format in .uploadTexture()"):rt?t.texSubImage2D(3553,Z,0,0,Ie.width,Ie.height,Ee,Fe,Ie.data):t.texImage2D(3553,Z,we,Ie.width,Ie.height,0,Ee,Fe,Ie.data)}else if(T.isDataArrayTexture)rt?(tt&&t.texStorage3D(35866,N,we,le.width,le.height,le.depth),t.texSubImage3D(35866,0,0,0,0,le.width,le.height,le.depth,Ee,Fe,le.data)):t.texImage3D(35866,0,we,le.width,le.height,le.depth,0,Ee,Fe,le.data);else if(T.isData3DTexture)rt?(tt&&t.texStorage3D(32879,N,we,le.width,le.height,le.depth),t.texSubImage3D(32879,0,0,0,0,le.width,le.height,le.depth,Ee,Fe,le.data)):t.texImage3D(32879,0,we,le.width,le.height,le.depth,0,Ee,Fe,le.data);else if(T.isFramebufferTexture){if(tt)if(rt)t.texStorage2D(3553,N,we,le.width,le.height);else{let Z=le.width,ne=le.height;for(let ve=0;ve<N;ve++)t.texImage2D(3553,ve,we,Z,ne,0,Ee,Fe,null),Z>>=1,ne>>=1}}else if(Be.length>0&&Ue){rt&&tt&&t.texStorage2D(3553,N,we,Be[0].width,Be[0].height);for(let Z=0,ne=Be.length;Z<ne;Z++)Ie=Be[Z],rt?t.texSubImage2D(3553,Z,0,0,Ee,Fe,Ie):t.texImage2D(3553,Z,we,Ee,Fe,Ie);T.generateMipmaps=!1}else rt?(tt&&t.texStorage2D(3553,N,we,le.width,le.height),t.texSubImage2D(3553,0,0,0,Ee,Fe,le)):t.texImage2D(3553,0,we,Ee,Fe,le);x(T,Ue)&&E(se),Le.__version=me.version,T.onUpdate&&T.onUpdate(T)}R.__version=T.version}function Se(R,T,O){if(T.image.length!==6)return;const se=ye(R,T),oe=T.source;t.bindTexture(34067,R.__webglTexture,33984+O);const me=n.get(oe);if(oe.version!==me.__version||se===!0){t.activeTexture(33984+O),r.pixelStorei(37440,T.flipY),r.pixelStorei(37441,T.premultiplyAlpha),r.pixelStorei(3317,T.unpackAlignment),r.pixelStorei(37443,0);const Le=T.isCompressedTexture||T.image[0].isCompressedTexture,xe=T.image[0]&&T.image[0].isDataTexture,le=[];for(let Z=0;Z<6;Z++)!Le&&!xe?le[Z]=b(T.image[Z],!1,!0,c):le[Z]=xe?T.image[Z].image:T.image[Z],le[Z]=kt(T,le[Z]);const Ue=le[0],Ee=w(Ue)||o,Fe=s.convert(T.format,T.encoding),we=s.convert(T.type),Ie=M(T.internalFormat,Fe,we,T.encoding),Be=o&&T.isVideoTexture!==!0,rt=me.__version===void 0||se===!0;let tt=S(T,Ue,Ee);Me(34067,T,Ee);let N;if(Le){Be&&rt&&t.texStorage2D(34067,tt,Ie,Ue.width,Ue.height);for(let Z=0;Z<6;Z++){N=le[Z].mipmaps;for(let ne=0;ne<N.length;ne++){const ve=N[ne];T.format!==gn?Fe!==null?Be?t.compressedTexSubImage2D(34069+Z,ne,0,0,ve.width,ve.height,Fe,ve.data):t.compressedTexImage2D(34069+Z,ne,Ie,ve.width,ve.height,0,ve.data):console.warn("THREE.WebGLRenderer: Attempt to load unsupported compressed texture format in .setTextureCube()"):Be?t.texSubImage2D(34069+Z,ne,0,0,ve.width,ve.height,Fe,we,ve.data):t.texImage2D(34069+Z,ne,Ie,ve.width,ve.height,0,Fe,we,ve.data)}}}else{N=T.mipmaps,Be&&rt&&(N.length>0&&tt++,t.texStorage2D(34067,tt,Ie,le[0].width,le[0].height));for(let Z=0;Z<6;Z++)if(xe){Be?t.texSubImage2D(34069+Z,0,0,0,le[Z].width,le[Z].height,Fe,we,le[Z].data):t.texImage2D(34069+Z,0,Ie,le[Z].width,le[Z].height,0,Fe,we,le[Z].data);for(let ne=0;ne<N.length;ne++){const ke=N[ne].image[Z].image;Be?t.texSubImage2D(34069+Z,ne+1,0,0,ke.width,ke.height,Fe,we,ke.data):t.texImage2D(34069+Z,ne+1,Ie,ke.width,ke.height,0,Fe,we,ke.data)}}else{Be?t.texSubImage2D(34069+Z,0,0,0,Fe,we,le[Z]):t.texImage2D(34069+Z,0,Ie,Fe,we,le[Z]);for(let ne=0;ne<N.length;ne++){const ve=N[ne];Be?t.texSubImage2D(34069+Z,ne+1,0,0,Fe,we,ve.image[Z]):t.texImage2D(34069+Z,ne+1,Ie,Fe,we,ve.image[Z])}}}x(T,Ee)&&E(34067),me.__version=oe.version,T.onUpdate&&T.onUpdate(T)}R.__version=T.version}function Ne(R,T,O,se,oe){const me=s.convert(O.format,O.encoding),Le=s.convert(O.type),xe=M(O.internalFormat,me,Le,O.encoding);n.get(T).__hasExternalTextures||(oe===32879||oe===35866?t.texImage3D(oe,0,xe,T.width,T.height,T.depth,0,me,Le,null):t.texImage2D(oe,0,xe,T.width,T.height,0,me,Le,null)),t.bindFramebuffer(36160,R),at(T)?d.framebufferTexture2DMultisampleEXT(36160,se,oe,n.get(O).__webglTexture,0,st(T)):(oe===3553||oe>=34069&&oe<=34074)&&r.framebufferTexture2D(36160,se,oe,n.get(O).__webglTexture,0),t.bindFramebuffer(36160,null)}function Re(R,T,O){if(r.bindRenderbuffer(36161,R),T.depthBuffer&&!T.stencilBuffer){let se=33189;if(O||at(T)){const oe=T.depthTexture;oe&&oe.isDepthTexture&&(oe.type===ci?se=36012:oe.type===li&&(se=33190));const me=st(T);at(T)?d.renderbufferStorageMultisampleEXT(36161,me,se,T.width,T.height):r.renderbufferStorageMultisample(36161,me,se,T.width,T.height)}else r.renderbufferStorage(36161,se,T.width,T.height);r.framebufferRenderbuffer(36160,36096,36161,R)}else if(T.depthBuffer&&T.stencilBuffer){const se=st(T);O&&at(T)===!1?r.renderbufferStorageMultisample(36161,se,35056,T.width,T.height):at(T)?d.renderbufferStorageMultisampleEXT(36161,se,35056,T.width,T.height):r.renderbufferStorage(36161,34041,T.width,T.height),r.framebufferRenderbuffer(36160,33306,36161,R)}else{const se=T.isWebGLMultipleRenderTargets===!0?T.texture:[T.texture];for(let oe=0;oe<se.length;oe++){const me=se[oe],Le=s.convert(me.format,me.encoding),xe=s.convert(me.type),le=M(me.internalFormat,Le,xe,me.encoding),Ue=st(T);O&&at(T)===!1?r.renderbufferStorageMultisample(36161,Ue,le,T.width,T.height):at(T)?d.renderbufferStorageMultisampleEXT(36161,Ue,le,T.width,T.height):r.renderbufferStorage(36161,le,T.width,T.height)}}r.bindRenderbuffer(36161,null)}function Ve(R,T){if(T&&T.isWebGLCubeRenderTarget)throw new Error("Depth Texture with cube render targets is not supported");if(t.bindFramebuffer(36160,R),!(T.depthTexture&&T.depthTexture.isDepthTexture))throw new Error("renderTarget.depthTexture must be an instance of THREE.DepthTexture");(!n.get(T.depthTexture).__webglTexture||T.depthTexture.image.width!==T.width||T.depthTexture.image.height!==T.height)&&(T.depthTexture.image.width=T.width,T.depthTexture.image.height=T.height,T.depthTexture.needsUpdate=!0),fe(T.depthTexture,0);const se=n.get(T.depthTexture).__webglTexture,oe=st(T);if(T.depthTexture.format===ui)at(T)?d.framebufferTexture2DMultisampleEXT(36160,36096,3553,se,0,oe):r.framebufferTexture2D(36160,36096,3553,se,0);else if(T.depthTexture.format===Hi)at(T)?d.framebufferTexture2DMultisampleEXT(36160,33306,3553,se,0,oe):r.framebufferTexture2D(36160,33306,3553,se,0);else throw new Error("Unknown depthTexture format")}function je(R){const T=n.get(R),O=R.isWebGLCubeRenderTarget===!0;if(R.depthTexture&&!T.__autoAllocateDepthBuffer){if(O)throw new Error("target.depthTexture not supported in Cube render targets");Ve(T.__webglFramebuffer,R)}else if(O){T.__webglDepthbuffer=[];for(let se=0;se<6;se++)t.bindFramebuffer(36160,T.__webglFramebuffer[se]),T.__webglDepthbuffer[se]=r.createRenderbuffer(),Re(T.__webglDepthbuffer[se],R,!1)}else t.bindFramebuffer(36160,T.__webglFramebuffer),T.__webglDepthbuffer=r.createRenderbuffer(),Re(T.__webglDepthbuffer,R,!1);t.bindFramebuffer(36160,null)}function qe(R,T,O){const se=n.get(R);T!==void 0&&Ne(se.__webglFramebuffer,R,R.texture,36064,3553),O!==void 0&&je(R)}function it(R){const T=R.texture,O=n.get(R),se=n.get(T);R.addEventListener("dispose",H),R.isWebGLMultipleRenderTargets!==!0&&(se.__webglTexture===void 0&&(se.__webglTexture=r.createTexture()),se.__version=T.version,a.memory.textures++);const oe=R.isWebGLCubeRenderTarget===!0,me=R.isWebGLMultipleRenderTargets===!0,Le=w(R)||o;if(oe){O.__webglFramebuffer=[];for(let xe=0;xe<6;xe++)O.__webglFramebuffer[xe]=r.createFramebuffer()}else{if(O.__webglFramebuffer=r.createFramebuffer(),me)if(i.drawBuffers){const xe=R.texture;for(let le=0,Ue=xe.length;le<Ue;le++){const Ee=n.get(xe[le]);Ee.__webglTexture===void 0&&(Ee.__webglTexture=r.createTexture(),a.memory.textures++)}}else console.warn("THREE.WebGLRenderer: WebGLMultipleRenderTargets can only be used with WebGL2 or WEBGL_draw_buffers extension.");if(o&&R.samples>0&&at(R)===!1){const xe=me?T:[T];O.__webglMultisampledFramebuffer=r.createFramebuffer(),O.__webglColorRenderbuffer=[],t.bindFramebuffer(36160,O.__webglMultisampledFramebuffer);for(let le=0;le<xe.length;le++){const Ue=xe[le];O.__webglColorRenderbuffer[le]=r.createRenderbuffer(),r.bindRenderbuffer(36161,O.__webglColorRenderbuffer[le]);const Ee=s.convert(Ue.format,Ue.encoding),Fe=s.convert(Ue.type),we=M(Ue.internalFormat,Ee,Fe,Ue.encoding,R.isXRRenderTarget===!0),Ie=st(R);r.renderbufferStorageMultisample(36161,Ie,we,R.width,R.height),r.framebufferRenderbuffer(36160,36064+le,36161,O.__webglColorRenderbuffer[le])}r.bindRenderbuffer(36161,null),R.depthBuffer&&(O.__webglDepthRenderbuffer=r.createRenderbuffer(),Re(O.__webglDepthRenderbuffer,R,!0)),t.bindFramebuffer(36160,null)}}if(oe){t.bindTexture(34067,se.__webglTexture),Me(34067,T,Le);for(let xe=0;xe<6;xe++)Ne(O.__webglFramebuffer[xe],R,T,36064,34069+xe);x(T,Le)&&E(34067),t.unbindTexture()}else if(me){const xe=R.texture;for(let le=0,Ue=xe.length;le<Ue;le++){const Ee=xe[le],Fe=n.get(Ee);t.bindTexture(3553,Fe.__webglTexture),Me(3553,Ee,Le),Ne(O.__webglFramebuffer,R,Ee,36064+le,3553),x(Ee,Le)&&E(3553)}t.unbindTexture()}else{let xe=3553;(R.isWebGL3DRenderTarget||R.isWebGLArrayRenderTarget)&&(o?xe=R.isWebGL3DRenderTarget?32879:35866:console.error("THREE.WebGLTextures: THREE.Data3DTexture and THREE.DataArrayTexture only supported with WebGL2.")),t.bindTexture(xe,se.__webglTexture),Me(xe,T,Le),Ne(O.__webglFramebuffer,R,T,36064,xe),x(T,Le)&&E(xe),t.unbindTexture()}R.depthBuffer&&je(R)}function yt(R){const T=w(R)||o,O=R.isWebGLMultipleRenderTargets===!0?R.texture:[R.texture];for(let se=0,oe=O.length;se<oe;se++){const me=O[se];if(x(me,T)){const Le=R.isWebGLCubeRenderTarget?34067:3553,xe=n.get(me).__webglTexture;t.bindTexture(Le,xe),E(Le),t.unbindTexture()}}}function _t(R){if(o&&R.samples>0&&at(R)===!1){const T=R.isWebGLMultipleRenderTargets?R.texture:[R.texture],O=R.width,se=R.height;let oe=16384;const me=[],Le=R.stencilBuffer?33306:36096,xe=n.get(R),le=R.isWebGLMultipleRenderTargets===!0;if(le)for(let Ue=0;Ue<T.length;Ue++)t.bindFramebuffer(36160,xe.__webglMultisampledFramebuffer),r.framebufferRenderbuffer(36160,36064+Ue,36161,null),t.bindFramebuffer(36160,xe.__webglFramebuffer),r.framebufferTexture2D(36009,36064+Ue,3553,null,0);t.bindFramebuffer(36008,xe.__webglMultisampledFramebuffer),t.bindFramebuffer(36009,xe.__webglFramebuffer);for(let Ue=0;Ue<T.length;Ue++){me.push(36064+Ue),R.depthBuffer&&me.push(Le);const Ee=xe.__ignoreDepthValues!==void 0?xe.__ignoreDepthValues:!1;if(Ee===!1&&(R.depthBuffer&&(oe|=256),R.stencilBuffer&&(oe|=1024)),le&&r.framebufferRenderbuffer(36008,36064,36161,xe.__webglColorRenderbuffer[Ue]),Ee===!0&&(r.invalidateFramebuffer(36008,[Le]),r.invalidateFramebuffer(36009,[Le])),le){const Fe=n.get(T[Ue]).__webglTexture;r.framebufferTexture2D(36009,36064,3553,Fe,0)}r.blitFramebuffer(0,0,O,se,0,0,O,se,oe,9728),m&&r.invalidateFramebuffer(36008,me)}if(t.bindFramebuffer(36008,null),t.bindFramebuffer(36009,null),le)for(let Ue=0;Ue<T.length;Ue++){t.bindFramebuffer(36160,xe.__webglMultisampledFramebuffer),r.framebufferRenderbuffer(36160,36064+Ue,36161,xe.__webglColorRenderbuffer[Ue]);const Ee=n.get(T[Ue]).__webglTexture;t.bindFramebuffer(36160,xe.__webglFramebuffer),r.framebufferTexture2D(36009,36064+Ue,3553,Ee,0)}t.bindFramebuffer(36009,xe.__webglMultisampledFramebuffer)}}function st(R){return Math.min(f,R.samples)}function at(R){const T=n.get(R);return o&&R.samples>0&&e.has("WEBGL_multisampled_render_to_texture")===!0&&T.__useRenderToTexture!==!1}function Ht(R){const T=a.render.frame;h.get(R)!==T&&(h.set(R,T),R.update())}function kt(R,T){const O=R.encoding,se=R.format,oe=R.type;return R.isCompressedTexture===!0||R.isVideoTexture===!0||R.format===ha||O!==hi&&(O===ht?o===!1?e.has("EXT_sRGB")===!0&&se===gn?(R.format=ha,R.minFilter=fn,R.generateMipmaps=!1):T=Qc.sRGBToLinear(T):(se!==gn||oe!==di)&&console.warn("THREE.WebGLTextures: sRGB encoded textures have to use RGBAFormat and UnsignedByteType."):console.error("THREE.WebGLTextures: Unsupported texture encoding:",O)),T}this.allocateTextureUnit=te,this.resetTextureUnits=de,this.setTexture2D=fe,this.setTexture2DArray=be,this.setTexture3D=Y,this.setTextureCube=ue,this.rebindTextures=qe,this.setupRenderTarget=it,this.updateRenderTargetMipmap=yt,this.updateMultisampleRenderTarget=_t,this.setupDepthRenderbuffer=je,this.setupFrameBufferTexture=Ne,this.useMultisampledRTT=at}function b2(r,e,t){const n=t.isWebGL2;function i(s,a=null){let o;if(s===di)return 5121;if(s===Wm)return 32819;if(s===Xm)return 32820;if(s===Vm)return 5120;if(s===Gm)return 5122;if(s===Yc)return 5123;if(s===Hm)return 5124;if(s===li)return 5125;if(s===ci)return 5126;if(s===vr)return n?5131:(o=e.get("OES_texture_half_float"),o!==null?o.HALF_FLOAT_OES:null);if(s===jm)return 6406;if(s===gn)return 6408;if(s===qm)return 6409;if(s===Ym)return 6410;if(s===ui)return 6402;if(s===Hi)return 34041;if(s===ha)return o=e.get("EXT_sRGB"),o!==null?o.SRGB_ALPHA_EXT:null;if(s===Zm)return 6403;if(s===Km)return 36244;if(s===Jm)return 33319;if(s===Qm)return 33320;if(s===$m)return 36249;if(s===Es||s===Ls||s===Ps||s===As)if(a===ht)if(o=e.get("WEBGL_compressed_texture_s3tc_srgb"),o!==null){if(s===Es)return o.COMPRESSED_SRGB_S3TC_DXT1_EXT;if(s===Ls)return o.COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT;if(s===Ps)return o.COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT;if(s===As)return o.COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT}else return null;else if(o=e.get("WEBGL_compressed_texture_s3tc"),o!==null){if(s===Es)return o.COMPRESSED_RGB_S3TC_DXT1_EXT;if(s===Ls)return o.COMPRESSED_RGBA_S3TC_DXT1_EXT;if(s===Ps)return o.COMPRESSED_RGBA_S3TC_DXT3_EXT;if(s===As)return o.COMPRESSED_RGBA_S3TC_DXT5_EXT}else return null;if(s===fl||s===dl||s===hl||s===pl)if(o=e.get("WEBGL_compressed_texture_pvrtc"),o!==null){if(s===fl)return o.COMPRESSED_RGB_PVRTC_4BPPV1_IMG;if(s===dl)return o.COMPRESSED_RGB_PVRTC_2BPPV1_IMG;if(s===hl)return o.COMPRESSED_RGBA_PVRTC_4BPPV1_IMG;if(s===pl)return o.COMPRESSED_RGBA_PVRTC_2BPPV1_IMG}else return null;if(s===e_)return o=e.get("WEBGL_compressed_texture_etc1"),o!==null?o.COMPRESSED_RGB_ETC1_WEBGL:null;if(s===ml||s===_l)if(o=e.get("WEBGL_compressed_texture_etc"),o!==null){if(s===ml)return a===ht?o.COMPRESSED_SRGB8_ETC2:o.COMPRESSED_RGB8_ETC2;if(s===_l)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ETC2_EAC:o.COMPRESSED_RGBA8_ETC2_EAC}else return null;if(s===gl||s===bl||s===vl||s===yl||s===wl||s===Ml||s===xl||s===Sl||s===Cl||s===Tl||s===El||s===Ll||s===Pl||s===Al)if(o=e.get("WEBGL_compressed_texture_astc"),o!==null){if(s===gl)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR:o.COMPRESSED_RGBA_ASTC_4x4_KHR;if(s===bl)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR:o.COMPRESSED_RGBA_ASTC_5x4_KHR;if(s===vl)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR:o.COMPRESSED_RGBA_ASTC_5x5_KHR;if(s===yl)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR:o.COMPRESSED_RGBA_ASTC_6x5_KHR;if(s===wl)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR:o.COMPRESSED_RGBA_ASTC_6x6_KHR;if(s===Ml)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR:o.COMPRESSED_RGBA_ASTC_8x5_KHR;if(s===xl)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR:o.COMPRESSED_RGBA_ASTC_8x6_KHR;if(s===Sl)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR:o.COMPRESSED_RGBA_ASTC_8x8_KHR;if(s===Cl)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR:o.COMPRESSED_RGBA_ASTC_10x5_KHR;if(s===Tl)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR:o.COMPRESSED_RGBA_ASTC_10x6_KHR;if(s===El)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR:o.COMPRESSED_RGBA_ASTC_10x8_KHR;if(s===Ll)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR:o.COMPRESSED_RGBA_ASTC_10x10_KHR;if(s===Pl)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR:o.COMPRESSED_RGBA_ASTC_12x10_KHR;if(s===Al)return a===ht?o.COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR:o.COMPRESSED_RGBA_ASTC_12x12_KHR}else return null;if(s===Ds)if(o=e.get("EXT_texture_compression_bptc"),o!==null){if(s===Ds)return a===ht?o.COMPRESSED_SRGB_ALPHA_BPTC_UNORM_EXT:o.COMPRESSED_RGBA_BPTC_UNORM_EXT}else return null;if(s===t_||s===Dl||s===kl||s===Rl)if(o=e.get("EXT_texture_compression_rgtc"),o!==null){if(s===Ds)return o.COMPRESSED_RED_RGTC1_EXT;if(s===Dl)return o.COMPRESSED_SIGNED_RED_RGTC1_EXT;if(s===kl)return o.COMPRESSED_RED_GREEN_RGTC2_EXT;if(s===Rl)return o.COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT}else return null;return s===Fi?n?34042:(o=e.get("WEBGL_depth_texture"),o!==null?o.UNSIGNED_INT_24_8_WEBGL:null):r[s]!==void 0?r[s]:null}return{convert:i}}class v2 extends dn{constructor(e=[]){super(),this.isArrayCamera=!0,this.cameras=e}}class Yr extends Ut{constructor(){super(),this.isGroup=!0,this.type="Group"}}const y2={type:"move"};class ta{constructor(){this._targetRay=null,this._grip=null,this._hand=null}getHandSpace(){return this._hand===null&&(this._hand=new Yr,this._hand.matrixAutoUpdate=!1,this._hand.visible=!1,this._hand.joints={},this._hand.inputState={pinching:!1}),this._hand}getTargetRaySpace(){return this._targetRay===null&&(this._targetRay=new Yr,this._targetRay.matrixAutoUpdate=!1,this._targetRay.visible=!1,this._targetRay.hasLinearVelocity=!1,this._targetRay.linearVelocity=new G,this._targetRay.hasAngularVelocity=!1,this._targetRay.angularVelocity=new G),this._targetRay}getGripSpace(){return this._grip===null&&(this._grip=new Yr,this._grip.matrixAutoUpdate=!1,this._grip.visible=!1,this._grip.hasLinearVelocity=!1,this._grip.linearVelocity=new G,this._grip.hasAngularVelocity=!1,this._grip.angularVelocity=new G),this._grip}dispatchEvent(e){return this._targetRay!==null&&this._targetRay.dispatchEvent(e),this._grip!==null&&this._grip.dispatchEvent(e),this._hand!==null&&this._hand.dispatchEvent(e),this}connect(e){if(e&&e.hand){const t=this._hand;if(t)for(const n of e.hand.values())this._getHandJoint(t,n)}return this.dispatchEvent({type:"connected",data:e}),this}disconnect(e){return this.dispatchEvent({type:"disconnected",data:e}),this._targetRay!==null&&(this._targetRay.visible=!1),this._grip!==null&&(this._grip.visible=!1),this._hand!==null&&(this._hand.visible=!1),this}update(e,t,n){let i=null,s=null,a=null;const o=this._targetRay,l=this._grip,c=this._hand;if(e&&t.session.visibilityState!=="visible-blurred"){if(c&&e.hand){a=!0;for(const p of e.hand.values()){const _=t.getJointPose(p,n),g=this._getHandJoint(c,p);_!==null&&(g.matrix.fromArray(_.transform.matrix),g.matrix.decompose(g.position,g.rotation,g.scale),g.jointRadius=_.radius),g.visible=_!==null}const u=c.joints["index-finger-tip"],f=c.joints["thumb-tip"],d=u.position.distanceTo(f.position),m=.02,h=.005;c.inputState.pinching&&d>m+h?(c.inputState.pinching=!1,this.dispatchEvent({type:"pinchend",handedness:e.handedness,target:this})):!c.inputState.pinching&&d<=m-h&&(c.inputState.pinching=!0,this.dispatchEvent({type:"pinchstart",handedness:e.handedness,target:this}))}else l!==null&&e.gripSpace&&(s=t.getPose(e.gripSpace,n),s!==null&&(l.matrix.fromArray(s.transform.matrix),l.matrix.decompose(l.position,l.rotation,l.scale),s.linearVelocity?(l.hasLinearVelocity=!0,l.linearVelocity.copy(s.linearVelocity)):l.hasLinearVelocity=!1,s.angularVelocity?(l.hasAngularVelocity=!0,l.angularVelocity.copy(s.angularVelocity)):l.hasAngularVelocity=!1));o!==null&&(i=t.getPose(e.targetRaySpace,n),i===null&&s!==null&&(i=s),i!==null&&(o.matrix.fromArray(i.transform.matrix),o.matrix.decompose(o.position,o.rotation,o.scale),i.linearVelocity?(o.hasLinearVelocity=!0,o.linearVelocity.copy(i.linearVelocity)):o.hasLinearVelocity=!1,i.angularVelocity?(o.hasAngularVelocity=!0,o.angularVelocity.copy(i.angularVelocity)):o.hasAngularVelocity=!1,this.dispatchEvent(y2)))}return o!==null&&(o.visible=i!==null),l!==null&&(l.visible=s!==null),c!==null&&(c.visible=a!==null),this}_getHandJoint(e,t){if(e.joints[t.jointName]===void 0){const n=new Yr;n.matrixAutoUpdate=!1,n.visible=!1,e.joints[t.jointName]=n,e.add(n)}return e.joints[t.jointName]}}class w2 extends on{constructor(e,t,n,i,s,a,o,l,c,u){if(u=u!==void 0?u:ui,u!==ui&&u!==Hi)throw new Error("DepthTexture format must be either THREE.DepthFormat or THREE.DepthStencilFormat");n===void 0&&u===ui&&(n=li),n===void 0&&u===Hi&&(n=Fi),super(null,i,s,a,o,l,u,n,c),this.isDepthTexture=!0,this.image={width:e,height:t},this.magFilter=o!==void 0?o:Yt,this.minFilter=l!==void 0?l:Yt,this.flipY=!1,this.generateMipmaps=!1}}class M2 extends Xi{constructor(e,t){super();const n=this;let i=null,s=1,a=null,o="local-floor",l=1,c=null,u=null,f=null,d=null,m=null,h=null;const p=t.getContextAttributes();let _=null,g=null;const v=[],b=[],w=new Set,y=new Map,x=new dn;x.layers.enable(1),x.viewport=new Ot;const E=new dn;E.layers.enable(2),E.viewport=new Ot;const M=[x,E],S=new v2;S.layers.enable(1),S.layers.enable(2);let P=null,k=null;this.cameraAutoUpdate=!0,this.enabled=!1,this.isPresenting=!1,this.getController=function(Y){let ue=v[Y];return ue===void 0&&(ue=new ta,v[Y]=ue),ue.getTargetRaySpace()},this.getControllerGrip=function(Y){let ue=v[Y];return ue===void 0&&(ue=new ta,v[Y]=ue),ue.getGripSpace()},this.getHand=function(Y){let ue=v[Y];return ue===void 0&&(ue=new ta,v[Y]=ue),ue.getHandSpace()};function H(Y){const ue=b.indexOf(Y.inputSource);if(ue===-1)return;const pe=v[ue];pe!==void 0&&pe.dispatchEvent({type:Y.type,data:Y.inputSource})}function V(){i.removeEventListener("select",H),i.removeEventListener("selectstart",H),i.removeEventListener("selectend",H),i.removeEventListener("squeeze",H),i.removeEventListener("squeezestart",H),i.removeEventListener("squeezeend",H),i.removeEventListener("end",V),i.removeEventListener("inputsourceschange",F);for(let Y=0;Y<v.length;Y++){const ue=b[Y];ue!==null&&(b[Y]=null,v[Y].disconnect(ue))}P=null,k=null,e.setRenderTarget(_),m=null,d=null,f=null,i=null,g=null,be.stop(),n.isPresenting=!1,n.dispatchEvent({type:"sessionend"})}this.setFramebufferScaleFactor=function(Y){s=Y,n.isPresenting===!0&&console.warn("THREE.WebXRManager: Cannot change framebuffer scale while presenting.")},this.setReferenceSpaceType=function(Y){o=Y,n.isPresenting===!0&&console.warn("THREE.WebXRManager: Cannot change reference space type while presenting.")},this.getReferenceSpace=function(){return c||a},this.setReferenceSpace=function(Y){c=Y},this.getBaseLayer=function(){return d!==null?d:m},this.getBinding=function(){return f},this.getFrame=function(){return h},this.getSession=function(){return i},this.setSession=async function(Y){if(i=Y,i!==null){if(_=e.getRenderTarget(),i.addEventListener("select",H),i.addEventListener("selectstart",H),i.addEventListener("selectend",H),i.addEventListener("squeeze",H),i.addEventListener("squeezestart",H),i.addEventListener("squeezeend",H),i.addEventListener("end",V),i.addEventListener("inputsourceschange",F),p.xrCompatible!==!0&&await t.makeXRCompatible(),i.renderState.layers===void 0||e.capabilities.isWebGL2===!1){const ue={antialias:i.renderState.layers===void 0?p.antialias:!0,alpha:p.alpha,depth:p.depth,stencil:p.stencil,framebufferScaleFactor:s};m=new XRWebGLLayer(i,t,ue),i.updateRenderState({baseLayer:m}),g=new pi(m.framebufferWidth,m.framebufferHeight,{format:gn,type:di,encoding:e.outputEncoding,stencilBuffer:p.stencil})}else{let ue=null,pe=null,W=null;p.depth&&(W=p.stencil?35056:33190,ue=p.stencil?Hi:ui,pe=p.stencil?Fi:li);const Me={colorFormat:32856,depthFormat:W,scaleFactor:s};f=new XRWebGLBinding(i,t),d=f.createProjectionLayer(Me),i.updateRenderState({layers:[d]}),g=new pi(d.textureWidth,d.textureHeight,{format:gn,type:di,depthTexture:new w2(d.textureWidth,d.textureHeight,pe,void 0,void 0,void 0,void 0,void 0,void 0,ue),stencilBuffer:p.stencil,encoding:e.outputEncoding,samples:p.antialias?4:0});const ye=e.properties.get(g);ye.__ignoreDepthValues=d.ignoreDepthValues}g.isXRRenderTarget=!0,this.setFoveation(l),c=null,a=await i.requestReferenceSpace(o),be.setContext(i),be.start(),n.isPresenting=!0,n.dispatchEvent({type:"sessionstart"})}};function F(Y){for(let ue=0;ue<Y.removed.length;ue++){const pe=Y.removed[ue],W=b.indexOf(pe);W>=0&&(b[W]=null,v[W].disconnect(pe))}for(let ue=0;ue<Y.added.length;ue++){const pe=Y.added[ue];let W=b.indexOf(pe);if(W===-1){for(let ye=0;ye<v.length;ye++)if(ye>=b.length){b.push(pe),W=ye;break}else if(b[ye]===null){b[ye]=pe,W=ye;break}if(W===-1)break}const Me=v[W];Me&&Me.connect(pe)}}const j=new G,ce=new G;function de(Y,ue,pe){j.setFromMatrixPosition(ue.matrixWorld),ce.setFromMatrixPosition(pe.matrixWorld);const W=j.distanceTo(ce),Me=ue.projectionMatrix.elements,ye=pe.projectionMatrix.elements,Te=Me[14]/(Me[10]-1),Se=Me[14]/(Me[10]+1),Ne=(Me[9]+1)/Me[5],Re=(Me[9]-1)/Me[5],Ve=(Me[8]-1)/Me[0],je=(ye[8]+1)/ye[0],qe=Te*Ve,it=Te*je,yt=W/(-Ve+je),_t=yt*-Ve;ue.matrixWorld.decompose(Y.position,Y.quaternion,Y.scale),Y.translateX(_t),Y.translateZ(yt),Y.matrixWorld.compose(Y.position,Y.quaternion,Y.scale),Y.matrixWorldInverse.copy(Y.matrixWorld).invert();const st=Te+yt,at=Se+yt,Ht=qe-_t,kt=it+(W-_t),R=Ne*Se/at*st,T=Re*Se/at*st;Y.projectionMatrix.makePerspective(Ht,kt,R,T,st,at)}function te(Y,ue){ue===null?Y.matrixWorld.copy(Y.matrix):Y.matrixWorld.multiplyMatrices(ue.matrixWorld,Y.matrix),Y.matrixWorldInverse.copy(Y.matrixWorld).invert()}this.updateCamera=function(Y){if(i===null)return;S.near=E.near=x.near=Y.near,S.far=E.far=x.far=Y.far,(P!==S.near||k!==S.far)&&(i.updateRenderState({depthNear:S.near,depthFar:S.far}),P=S.near,k=S.far);const ue=Y.parent,pe=S.cameras;te(S,ue);for(let Me=0;Me<pe.length;Me++)te(pe[Me],ue);S.matrixWorld.decompose(S.position,S.quaternion,S.scale),Y.matrix.copy(S.matrix),Y.matrix.decompose(Y.position,Y.quaternion,Y.scale);const W=Y.children;for(let Me=0,ye=W.length;Me<ye;Me++)W[Me].updateMatrixWorld(!0);pe.length===2?de(S,x,E):S.projectionMatrix.copy(x.projectionMatrix)},this.getCamera=function(){return S},this.getFoveation=function(){if(!(d===null&&m===null))return l},this.setFoveation=function(Y){l=Y,d!==null&&(d.fixedFoveation=Y),m!==null&&m.fixedFoveation!==void 0&&(m.fixedFoveation=Y)},this.getPlanes=function(){return w};let re=null;function fe(Y,ue){if(u=ue.getViewerPose(c||a),h=ue,u!==null){const pe=u.views;m!==null&&(e.setRenderTargetFramebuffer(g,m.framebuffer),e.setRenderTarget(g));let W=!1;pe.length!==S.cameras.length&&(S.cameras.length=0,W=!0);for(let Me=0;Me<pe.length;Me++){const ye=pe[Me];let Te=null;if(m!==null)Te=m.getViewport(ye);else{const Ne=f.getViewSubImage(d,ye);Te=Ne.viewport,Me===0&&(e.setRenderTargetTextures(g,Ne.colorTexture,d.ignoreDepthValues?void 0:Ne.depthStencilTexture),e.setRenderTarget(g))}let Se=M[Me];Se===void 0&&(Se=new dn,Se.layers.enable(Me),Se.viewport=new Ot,M[Me]=Se),Se.matrix.fromArray(ye.transform.matrix),Se.projectionMatrix.fromArray(ye.projectionMatrix),Se.viewport.set(Te.x,Te.y,Te.width,Te.height),Me===0&&S.matrix.copy(Se.matrix),W===!0&&S.cameras.push(Se)}}for(let pe=0;pe<v.length;pe++){const W=b[pe],Me=v[pe];W!==null&&Me!==void 0&&Me.update(W,ue,c||a)}if(re&&re(Y,ue),ue.detectedPlanes){n.dispatchEvent({type:"planesdetected",data:ue.detectedPlanes});let pe=null;for(const W of w)ue.detectedPlanes.has(W)||(pe===null&&(pe=[]),pe.push(W));if(pe!==null)for(const W of pe)w.delete(W),y.delete(W),n.dispatchEvent({type:"planeremoved",data:W});for(const W of ue.detectedPlanes)if(!w.has(W))w.add(W),y.set(W,ue.lastChangedTime),n.dispatchEvent({type:"planeadded",data:W});else{const Me=y.get(W);W.lastChangedTime>Me&&(y.set(W,W.lastChangedTime),n.dispatchEvent({type:"planechanged",data:W}))}}h=null}const be=new lu;be.setAnimationLoop(fe),this.setAnimationLoop=function(Y){re=Y},this.dispose=function(){}}}function x2(r,e){function t(p,_){_.color.getRGB(p.fogColor.value,ru(r)),_.isFog?(p.fogNear.value=_.near,p.fogFar.value=_.far):_.isFogExp2&&(p.fogDensity.value=_.density)}function n(p,_,g,v,b){_.isMeshBasicMaterial||_.isMeshLambertMaterial?i(p,_):_.isMeshToonMaterial?(i(p,_),u(p,_)):_.isMeshPhongMaterial?(i(p,_),c(p,_)):_.isMeshStandardMaterial?(i(p,_),f(p,_),_.isMeshPhysicalMaterial&&d(p,_,b)):_.isMeshMatcapMaterial?(i(p,_),m(p,_)):_.isMeshDepthMaterial?i(p,_):_.isMeshDistanceMaterial?(i(p,_),h(p,_)):_.isMeshNormalMaterial?i(p,_):_.isLineBasicMaterial?(s(p,_),_.isLineDashedMaterial&&a(p,_)):_.isPointsMaterial?o(p,_,g,v):_.isSpriteMaterial?l(p,_):_.isShadowMaterial?(p.color.value.copy(_.color),p.opacity.value=_.opacity):_.isShaderMaterial&&(_.uniformsNeedUpdate=!1)}function i(p,_){p.opacity.value=_.opacity,_.color&&p.diffuse.value.copy(_.color),_.emissive&&p.emissive.value.copy(_.emissive).multiplyScalar(_.emissiveIntensity),_.map&&(p.map.value=_.map),_.alphaMap&&(p.alphaMap.value=_.alphaMap),_.bumpMap&&(p.bumpMap.value=_.bumpMap,p.bumpScale.value=_.bumpScale,_.side===an&&(p.bumpScale.value*=-1)),_.displacementMap&&(p.displacementMap.value=_.displacementMap,p.displacementScale.value=_.displacementScale,p.displacementBias.value=_.displacementBias),_.emissiveMap&&(p.emissiveMap.value=_.emissiveMap),_.normalMap&&(p.normalMap.value=_.normalMap,p.normalScale.value.copy(_.normalScale),_.side===an&&p.normalScale.value.negate()),_.specularMap&&(p.specularMap.value=_.specularMap),_.alphaTest>0&&(p.alphaTest.value=_.alphaTest);const g=e.get(_).envMap;if(g&&(p.envMap.value=g,p.flipEnvMap.value=g.isCubeTexture&&g.isRenderTargetTexture===!1?-1:1,p.reflectivity.value=_.reflectivity,p.ior.value=_.ior,p.refractionRatio.value=_.refractionRatio),_.lightMap){p.lightMap.value=_.lightMap;const w=r.useLegacyLights===!0?Math.PI:1;p.lightMapIntensity.value=_.lightMapIntensity*w}_.aoMap&&(p.aoMap.value=_.aoMap,p.aoMapIntensity.value=_.aoMapIntensity);let v;_.map?v=_.map:_.specularMap?v=_.specularMap:_.displacementMap?v=_.displacementMap:_.normalMap?v=_.normalMap:_.bumpMap?v=_.bumpMap:_.roughnessMap?v=_.roughnessMap:_.metalnessMap?v=_.metalnessMap:_.alphaMap?v=_.alphaMap:_.emissiveMap?v=_.emissiveMap:_.clearcoatMap?v=_.clearcoatMap:_.clearcoatNormalMap?v=_.clearcoatNormalMap:_.clearcoatRoughnessMap?v=_.clearcoatRoughnessMap:_.iridescenceMap?v=_.iridescenceMap:_.iridescenceThicknessMap?v=_.iridescenceThicknessMap:_.specularIntensityMap?v=_.specularIntensityMap:_.specularColorMap?v=_.specularColorMap:_.transmissionMap?v=_.transmissionMap:_.thicknessMap?v=_.thicknessMap:_.sheenColorMap?v=_.sheenColorMap:_.sheenRoughnessMap&&(v=_.sheenRoughnessMap),v!==void 0&&(v.isWebGLRenderTarget&&(v=v.texture),v.matrixAutoUpdate===!0&&v.updateMatrix(),p.uvTransform.value.copy(v.matrix));let b;_.aoMap?b=_.aoMap:_.lightMap&&(b=_.lightMap),b!==void 0&&(b.isWebGLRenderTarget&&(b=b.texture),b.matrixAutoUpdate===!0&&b.updateMatrix(),p.uv2Transform.value.copy(b.matrix))}function s(p,_){p.diffuse.value.copy(_.color),p.opacity.value=_.opacity}function a(p,_){p.dashSize.value=_.dashSize,p.totalSize.value=_.dashSize+_.gapSize,p.scale.value=_.scale}function o(p,_,g,v){p.diffuse.value.copy(_.color),p.opacity.value=_.opacity,p.size.value=_.size*g,p.scale.value=v*.5,_.map&&(p.map.value=_.map),_.alphaMap&&(p.alphaMap.value=_.alphaMap),_.alphaTest>0&&(p.alphaTest.value=_.alphaTest);let b;_.map?b=_.map:_.alphaMap&&(b=_.alphaMap),b!==void 0&&(b.matrixAutoUpdate===!0&&b.updateMatrix(),p.uvTransform.value.copy(b.matrix))}function l(p,_){p.diffuse.value.copy(_.color),p.opacity.value=_.opacity,p.rotation.value=_.rotation,_.map&&(p.map.value=_.map),_.alphaMap&&(p.alphaMap.value=_.alphaMap),_.alphaTest>0&&(p.alphaTest.value=_.alphaTest);let g;_.map?g=_.map:_.alphaMap&&(g=_.alphaMap),g!==void 0&&(g.matrixAutoUpdate===!0&&g.updateMatrix(),p.uvTransform.value.copy(g.matrix))}function c(p,_){p.specular.value.copy(_.specular),p.shininess.value=Math.max(_.shininess,1e-4)}function u(p,_){_.gradientMap&&(p.gradientMap.value=_.gradientMap)}function f(p,_){p.roughness.value=_.roughness,p.metalness.value=_.metalness,_.roughnessMap&&(p.roughnessMap.value=_.roughnessMap),_.metalnessMap&&(p.metalnessMap.value=_.metalnessMap),e.get(_).envMap&&(p.envMapIntensity.value=_.envMapIntensity)}function d(p,_,g){p.ior.value=_.ior,_.sheen>0&&(p.sheenColor.value.copy(_.sheenColor).multiplyScalar(_.sheen),p.sheenRoughness.value=_.sheenRoughness,_.sheenColorMap&&(p.sheenColorMap.value=_.sheenColorMap),_.sheenRoughnessMap&&(p.sheenRoughnessMap.value=_.sheenRoughnessMap)),_.clearcoat>0&&(p.clearcoat.value=_.clearcoat,p.clearcoatRoughness.value=_.clearcoatRoughness,_.clearcoatMap&&(p.clearcoatMap.value=_.clearcoatMap),_.clearcoatRoughnessMap&&(p.clearcoatRoughnessMap.value=_.clearcoatRoughnessMap),_.clearcoatNormalMap&&(p.clearcoatNormalScale.value.copy(_.clearcoatNormalScale),p.clearcoatNormalMap.value=_.clearcoatNormalMap,_.side===an&&p.clearcoatNormalScale.value.negate())),_.iridescence>0&&(p.iridescence.value=_.iridescence,p.iridescenceIOR.value=_.iridescenceIOR,p.iridescenceThicknessMinimum.value=_.iridescenceThicknessRange[0],p.iridescenceThicknessMaximum.value=_.iridescenceThicknessRange[1],_.iridescenceMap&&(p.iridescenceMap.value=_.iridescenceMap),_.iridescenceThicknessMap&&(p.iridescenceThicknessMap.value=_.iridescenceThicknessMap)),_.transmission>0&&(p.transmission.value=_.transmission,p.transmissionSamplerMap.value=g.texture,p.transmissionSamplerSize.value.set(g.width,g.height),_.transmissionMap&&(p.transmissionMap.value=_.transmissionMap),p.thickness.value=_.thickness,_.thicknessMap&&(p.thicknessMap.value=_.thicknessMap),p.attenuationDistance.value=_.attenuationDistance,p.attenuationColor.value.copy(_.attenuationColor)),p.specularIntensity.value=_.specularIntensity,p.specularColor.value.copy(_.specularColor),_.specularIntensityMap&&(p.specularIntensityMap.value=_.specularIntensityMap),_.specularColorMap&&(p.specularColorMap.value=_.specularColorMap)}function m(p,_){_.matcap&&(p.matcap.value=_.matcap)}function h(p,_){p.referencePosition.value.copy(_.referencePosition),p.nearDistance.value=_.nearDistance,p.farDistance.value=_.farDistance}return{refreshFogUniforms:t,refreshMaterialUniforms:n}}function S2(r,e,t,n){let i={},s={},a=[];const o=t.isWebGL2?r.getParameter(35375):0;function l(v,b){const w=b.program;n.uniformBlockBinding(v,w)}function c(v,b){let w=i[v.id];w===void 0&&(h(v),w=u(v),i[v.id]=w,v.addEventListener("dispose",_));const y=b.program;n.updateUBOMapping(v,y);const x=e.render.frame;s[v.id]!==x&&(d(v),s[v.id]=x)}function u(v){const b=f();v.__bindingPointIndex=b;const w=r.createBuffer(),y=v.__size,x=v.usage;return r.bindBuffer(35345,w),r.bufferData(35345,y,x),r.bindBuffer(35345,null),r.bindBufferBase(35345,b,w),w}function f(){for(let v=0;v<o;v++)if(a.indexOf(v)===-1)return a.push(v),v;return console.error("THREE.WebGLRenderer: Maximum number of simultaneously usable uniforms groups reached."),0}function d(v){const b=i[v.id],w=v.uniforms,y=v.__cache;r.bindBuffer(35345,b);for(let x=0,E=w.length;x<E;x++){const M=w[x];if(m(M,x,y)===!0){const S=M.__offset,P=Array.isArray(M.value)?M.value:[M.value];let k=0;for(let H=0;H<P.length;H++){const V=P[H],F=p(V);typeof V=="number"?(M.__data[0]=V,r.bufferSubData(35345,S+k,M.__data)):V.isMatrix3?(M.__data[0]=V.elements[0],M.__data[1]=V.elements[1],M.__data[2]=V.elements[2],M.__data[3]=V.elements[0],M.__data[4]=V.elements[3],M.__data[5]=V.elements[4],M.__data[6]=V.elements[5],M.__data[7]=V.elements[0],M.__data[8]=V.elements[6],M.__data[9]=V.elements[7],M.__data[10]=V.elements[8],M.__data[11]=V.elements[0]):(V.toArray(M.__data,k),k+=F.storage/Float32Array.BYTES_PER_ELEMENT)}r.bufferSubData(35345,S,M.__data)}}r.bindBuffer(35345,null)}function m(v,b,w){const y=v.value;if(w[b]===void 0){if(typeof y=="number")w[b]=y;else{const x=Array.isArray(y)?y:[y],E=[];for(let M=0;M<x.length;M++)E.push(x[M].clone());w[b]=E}return!0}else if(typeof y=="number"){if(w[b]!==y)return w[b]=y,!0}else{const x=Array.isArray(w[b])?w[b]:[w[b]],E=Array.isArray(y)?y:[y];for(let M=0;M<x.length;M++){const S=x[M];if(S.equals(E[M])===!1)return S.copy(E[M]),!0}}return!1}function h(v){const b=v.uniforms;let w=0;const y=16;let x=0;for(let E=0,M=b.length;E<M;E++){const S=b[E],P={boundary:0,storage:0},k=Array.isArray(S.value)?S.value:[S.value];for(let H=0,V=k.length;H<V;H++){const F=k[H],j=p(F);P.boundary+=j.boundary,P.storage+=j.storage}if(S.__data=new Float32Array(P.storage/Float32Array.BYTES_PER_ELEMENT),S.__offset=w,E>0){x=w%y;const H=y-x;x!==0&&H-P.boundary<0&&(w+=y-x,S.__offset=w)}w+=P.storage}return x=w%y,x>0&&(w+=y-x),v.__size=w,v.__cache={},this}function p(v){const b={boundary:0,storage:0};return typeof v=="number"?(b.boundary=4,b.storage=4):v.isVector2?(b.boundary=8,b.storage=8):v.isVector3||v.isColor?(b.boundary=16,b.storage=12):v.isVector4?(b.boundary=16,b.storage=16):v.isMatrix3?(b.boundary=48,b.storage=48):v.isMatrix4?(b.boundary=64,b.storage=64):v.isTexture?console.warn("THREE.WebGLRenderer: Texture samplers can not be part of an uniforms group."):console.warn("THREE.WebGLRenderer: Unsupported uniform value type.",v),b}function _(v){const b=v.target;b.removeEventListener("dispose",_);const w=a.indexOf(b.__bindingPointIndex);a.splice(w,1),r.deleteBuffer(i[b.id]),delete i[b.id],delete s[b.id]}function g(){for(const v in i)r.deleteBuffer(i[v]);a=[],i={},s={}}return{bind:l,update:c,dispose:g}}function C2(){const r=ds("canvas");return r.style.display="block",r}function Ca(r={}){this.isWebGLRenderer=!0;const e=r.canvas!==void 0?r.canvas:C2(),t=r.context!==void 0?r.context:null,n=r.depth!==void 0?r.depth:!0,i=r.stencil!==void 0?r.stencil:!0,s=r.antialias!==void 0?r.antialias:!1,a=r.premultipliedAlpha!==void 0?r.premultipliedAlpha:!0,o=r.preserveDrawingBuffer!==void 0?r.preserveDrawingBuffer:!1,l=r.powerPreference!==void 0?r.powerPreference:"default",c=r.failIfMajorPerformanceCaveat!==void 0?r.failIfMajorPerformanceCaveat:!1;let u;t!==null?u=t.getContextAttributes().alpha:u=r.alpha!==void 0?r.alpha:!1;let f=null,d=null;const m=[],h=[];this.domElement=e,this.debug={checkShaderErrors:!0},this.autoClear=!0,this.autoClearColor=!0,this.autoClearDepth=!0,this.autoClearStencil=!0,this.sortObjects=!0,this.clippingPlanes=[],this.localClippingEnabled=!1,this.outputEncoding=hi,this.useLegacyLights=!0,this.toneMapping=Un,this.toneMappingExposure=1;const p=this;let _=!1,g=0,v=0,b=null,w=-1,y=null;const x=new Ot,E=new Ot;let M=null,S=e.width,P=e.height,k=1,H=null,V=null;const F=new Ot(0,0,S,P),j=new Ot(0,0,S,P);let ce=!1;const de=new ou;let te=!1,re=!1,fe=null;const be=new Et,Y=new G,ue={background:null,fog:null,environment:null,overrideMaterial:null,isScene:!0};function pe(){return b===null?k:1}let W=t;function Me(D,q){for(let ie=0;ie<D.length;ie++){const X=D[ie],ae=e.getContext(X,q);if(ae!==null)return ae}return null}try{const D={alpha:!0,depth:n,stencil:i,antialias:s,premultipliedAlpha:a,preserveDrawingBuffer:o,powerPreference:l,failIfMajorPerformanceCaveat:c};if("setAttribute"in e&&e.setAttribute("data-engine",`three.js r${ya}`),e.addEventListener("webglcontextlost",Fe,!1),e.addEventListener("webglcontextrestored",we,!1),e.addEventListener("webglcontextcreationerror",Ie,!1),W===null){const q=["webgl2","webgl","experimental-webgl"];if(p.isWebGL1Renderer===!0&&q.shift(),W=Me(q,D),W===null)throw Me(q)?new Error("Error creating WebGL context with your selected attributes."):new Error("Error creating WebGL context.")}W.getShaderPrecisionFormat===void 0&&(W.getShaderPrecisionFormat=function(){return{rangeMin:1,rangeMax:1,precision:1}})}catch(D){throw console.error("THREE.WebGLRenderer: "+D.message),D}let ye,Te,Se,Ne,Re,Ve,je,qe,it,yt,_t,st,at,Ht,kt,R,T,O,se,oe,me,Le,xe,le;function Ue(){ye=new z1(W),Te=new P1(W,ye,r),ye.init(Te),Le=new b2(W,ye,Te),Se=new _2(W,ye,Te),Ne=new U1,Re=new n2,Ve=new g2(W,ye,Se,Re,Te,Le,Ne),je=new D1(p),qe=new N1(p),it=new q_(W,Te),xe=new E1(W,ye,it,Te),yt=new F1(W,it,Ne,xe),_t=new H1(W,yt,it,Ne),se=new G1(W,Te,Ve),R=new A1(Re),st=new t2(p,je,qe,ye,Te,xe,R),at=new x2(p,Re),Ht=new r2,kt=new u2(ye,Te),O=new T1(p,je,qe,Se,_t,u,a),T=new m2(p,_t,Te),le=new S2(W,Ne,Te,Se),oe=new L1(W,ye,Ne,Te),me=new O1(W,ye,Ne,Te),Ne.programs=st.programs,p.capabilities=Te,p.extensions=ye,p.properties=Re,p.renderLists=Ht,p.shadowMap=T,p.state=Se,p.info=Ne}Ue();const Ee=new M2(p,W);this.xr=Ee,this.getContext=function(){return W},this.getContextAttributes=function(){return W.getContextAttributes()},this.forceContextLoss=function(){const D=ye.get("WEBGL_lose_context");D&&D.loseContext()},this.forceContextRestore=function(){const D=ye.get("WEBGL_lose_context");D&&D.restoreContext()},this.getPixelRatio=function(){return k},this.setPixelRatio=function(D){D!==void 0&&(k=D,this.setSize(S,P,!1))},this.getSize=function(D){return D.set(S,P)},this.setSize=function(D,q,ie=!0){if(Ee.isPresenting){console.warn("THREE.WebGLRenderer: Can't change size while VR device is presenting.");return}S=D,P=q,e.width=Math.floor(D*k),e.height=Math.floor(q*k),ie===!0&&(e.style.width=D+"px",e.style.height=q+"px"),this.setViewport(0,0,D,q)},this.getDrawingBufferSize=function(D){return D.set(S*k,P*k).floor()},this.setDrawingBufferSize=function(D,q,ie){S=D,P=q,k=ie,e.width=Math.floor(D*ie),e.height=Math.floor(q*ie),this.setViewport(0,0,D,q)},this.getCurrentViewport=function(D){return D.copy(x)},this.getViewport=function(D){return D.copy(F)},this.setViewport=function(D,q,ie,X){D.isVector4?F.set(D.x,D.y,D.z,D.w):F.set(D,q,ie,X),Se.viewport(x.copy(F).multiplyScalar(k).floor())},this.getScissor=function(D){return D.copy(j)},this.setScissor=function(D,q,ie,X){D.isVector4?j.set(D.x,D.y,D.z,D.w):j.set(D,q,ie,X),Se.scissor(E.copy(j).multiplyScalar(k).floor())},this.getScissorTest=function(){return ce},this.setScissorTest=function(D){Se.setScissorTest(ce=D)},this.setOpaqueSort=function(D){H=D},this.setTransparentSort=function(D){V=D},this.getClearColor=function(D){return D.copy(O.getClearColor())},this.setClearColor=function(){O.setClearColor.apply(O,arguments)},this.getClearAlpha=function(){return O.getClearAlpha()},this.setClearAlpha=function(){O.setClearAlpha.apply(O,arguments)},this.clear=function(D=!0,q=!0,ie=!0){let X=0;D&&(X|=16384),q&&(X|=256),ie&&(X|=1024),W.clear(X)},this.clearColor=function(){this.clear(!0,!1,!1)},this.clearDepth=function(){this.clear(!1,!0,!1)},this.clearStencil=function(){this.clear(!1,!1,!0)},this.dispose=function(){e.removeEventListener("webglcontextlost",Fe,!1),e.removeEventListener("webglcontextrestored",we,!1),e.removeEventListener("webglcontextcreationerror",Ie,!1),Ht.dispose(),kt.dispose(),Re.dispose(),je.dispose(),qe.dispose(),_t.dispose(),xe.dispose(),le.dispose(),st.dispose(),Ee.dispose(),Ee.removeEventListener("sessionstart",ne),Ee.removeEventListener("sessionend",ve),fe&&(fe.dispose(),fe=null),ke.stop()};function Fe(D){D.preventDefault(),console.log("THREE.WebGLRenderer: Context Lost."),_=!0}function we(){console.log("THREE.WebGLRenderer: Context Restored."),_=!1;const D=Ne.autoReset,q=T.enabled,ie=T.autoUpdate,X=T.needsUpdate,ae=T.type;Ue(),Ne.autoReset=D,T.enabled=q,T.autoUpdate=ie,T.needsUpdate=X,T.type=ae}function Ie(D){console.error("THREE.WebGLRenderer: A WebGL context could not be created. Reason: ",D.statusMessage)}function Be(D){const q=D.target;q.removeEventListener("dispose",Be),rt(q)}function rt(D){tt(D),Re.remove(D)}function tt(D){const q=Re.get(D).programs;q!==void 0&&(q.forEach(function(ie){st.releaseProgram(ie)}),D.isShaderMaterial&&st.releaseShaderCache(D))}this.renderBufferDirect=function(D,q,ie,X,ae,Oe){q===null&&(q=ue);const Xe=ae.isMesh&&ae.matrixWorld.determinant()<0,Ze=pu(D,q,ie,X,ae);Se.setMaterial(X,Xe);let Ke=ie.index,nt=1;X.wireframe===!0&&(Ke=yt.getWireframeAttribute(ie),nt=2);const Je=ie.drawRange,Qe=ie.attributes.position;let xt=Je.start*nt,tn=(Je.start+Je.count)*nt;Oe!==null&&(xt=Math.max(xt,Oe.start*nt),tn=Math.min(tn,(Oe.start+Oe.count)*nt)),Ke!==null?(xt=Math.max(xt,0),tn=Math.min(tn,Ke.count)):Qe!=null&&(xt=Math.max(xt,0),tn=Math.min(tn,Qe.count));const En=tn-xt;if(En<0||En===1/0)return;xe.setup(ae,X,Ze,ie,Ke);let Kn,St=oe;if(Ke!==null&&(Kn=it.get(Ke),St=me,St.setIndex(Kn)),ae.isMesh)X.wireframe===!0?(Se.setLineWidth(X.wireframeLinewidth*pe()),St.setMode(1)):St.setMode(4);else if(ae.isLine){let $e=X.linewidth;$e===void 0&&($e=1),Se.setLineWidth($e*pe()),ae.isLineSegments?St.setMode(1):ae.isLineLoop?St.setMode(2):St.setMode(3)}else ae.isPoints?St.setMode(0):ae.isSprite&&St.setMode(4);if(ae.isInstancedMesh)St.renderInstances(xt,En,ae.count);else if(ie.isInstancedBufferGeometry){const $e=ie._maxInstanceCount!==void 0?ie._maxInstanceCount:1/0,ys=Math.min(ie.instanceCount,$e);St.renderInstances(xt,En,ys)}else St.render(xt,En)},this.compile=function(D,q){function ie(X,ae,Oe){X.transparent===!0&&X.side===zn&&X.forceSinglePass===!1?(X.side=an,X.needsUpdate=!0,cn(X,ae,Oe),X.side=Zn,X.needsUpdate=!0,cn(X,ae,Oe),X.side=zn):cn(X,ae,Oe)}d=kt.get(D),d.init(),h.push(d),D.traverseVisible(function(X){X.isLight&&X.layers.test(q.layers)&&(d.pushLight(X),X.castShadow&&d.pushShadow(X))}),d.setupLights(p.useLegacyLights),D.traverse(function(X){const ae=X.material;if(ae)if(Array.isArray(ae))for(let Oe=0;Oe<ae.length;Oe++){const Xe=ae[Oe];ie(Xe,D,X)}else ie(ae,D,X)}),h.pop(),d=null};let N=null;function Z(D){N&&N(D)}function ne(){ke.stop()}function ve(){ke.start()}const ke=new lu;ke.setAnimationLoop(Z),typeof self<"u"&&ke.setContext(self),this.setAnimationLoop=function(D){N=D,Ee.setAnimationLoop(D),D===null?ke.stop():ke.start()},Ee.addEventListener("sessionstart",ne),Ee.addEventListener("sessionend",ve),this.render=function(D,q){if(q!==void 0&&q.isCamera!==!0){console.error("THREE.WebGLRenderer.render: camera is not an instance of THREE.Camera.");return}if(_===!0)return;D.matrixWorldAutoUpdate===!0&&D.updateMatrixWorld(),q.parent===null&&q.matrixWorldAutoUpdate===!0&&q.updateMatrixWorld(),Ee.enabled===!0&&Ee.isPresenting===!0&&(Ee.cameraAutoUpdate===!0&&Ee.updateCamera(q),q=Ee.getCamera()),D.isScene===!0&&D.onBeforeRender(p,D,q,b),d=kt.get(D,h.length),d.init(),h.push(d),be.multiplyMatrices(q.projectionMatrix,q.matrixWorldInverse),de.setFromProjectionMatrix(be),re=this.localClippingEnabled,te=R.init(this.clippingPlanes,re),f=Ht.get(D,m.length),f.init(),m.push(f),dt(D,q,0,p.sortObjects),f.finish(),p.sortObjects===!0&&f.sort(H,V),te===!0&&R.beginShadows();const ie=d.state.shadowsArray;if(T.render(ie,D,q),te===!0&&R.endShadows(),this.info.autoReset===!0&&this.info.reset(),O.render(f,D),d.setupLights(p.useLegacyLights),q.isArrayCamera){const X=q.cameras;for(let ae=0,Oe=X.length;ae<Oe;ae++){const Xe=X[ae];Rt(f,D,Xe,Xe.viewport)}}else Rt(f,D,q);b!==null&&(Ve.updateMultisampleRenderTarget(b),Ve.updateRenderTargetMipmap(b)),D.isScene===!0&&D.onAfterRender(p,D,q),xe.resetDefaultState(),w=-1,y=null,h.pop(),h.length>0?d=h[h.length-1]:d=null,m.pop(),m.length>0?f=m[m.length-1]:f=null};function dt(D,q,ie,X){if(D.visible===!1)return;if(D.layers.test(q.layers)){if(D.isGroup)ie=D.renderOrder;else if(D.isLOD)D.autoUpdate===!0&&D.update(q);else if(D.isLight)d.pushLight(D),D.castShadow&&d.pushShadow(D);else if(D.isSprite){if(!D.frustumCulled||de.intersectsSprite(D)){X&&Y.setFromMatrixPosition(D.matrixWorld).applyMatrix4(be);const Xe=_t.update(D),Ze=D.material;Ze.visible&&f.push(D,Xe,Ze,ie,Y.z,null)}}else if((D.isMesh||D.isLine||D.isPoints)&&(D.isSkinnedMesh&&D.skeleton.frame!==Ne.render.frame&&(D.skeleton.update(),D.skeleton.frame=Ne.render.frame),!D.frustumCulled||de.intersectsObject(D))){X&&Y.setFromMatrixPosition(D.matrixWorld).applyMatrix4(be);const Xe=_t.update(D),Ze=D.material;if(Array.isArray(Ze)){const Ke=Xe.groups;for(let nt=0,Je=Ke.length;nt<Je;nt++){const Qe=Ke[nt],xt=Ze[Qe.materialIndex];xt&&xt.visible&&f.push(D,Xe,xt,ie,Y.z,Qe)}}else Ze.visible&&f.push(D,Xe,Ze,ie,Y.z,null)}}const Oe=D.children;for(let Xe=0,Ze=Oe.length;Xe<Ze;Xe++)dt(Oe[Xe],q,ie,X)}function Rt(D,q,ie,X){const ae=D.opaque,Oe=D.transmissive,Xe=D.transparent;d.setupLightsView(ie),te===!0&&R.setGlobalState(p.clippingPlanes,ie),Oe.length>0&&Wt(ae,q,ie),X&&Se.viewport(x.copy(X)),ae.length>0&&vn(ae,q,ie),Oe.length>0&&vn(Oe,q,ie),Xe.length>0&&vn(Xe,q,ie),Se.buffers.depth.setTest(!0),Se.buffers.depth.setMask(!0),Se.buffers.color.setMask(!0),Se.setPolygonOffset(!1)}function Wt(D,q,ie){const X=Te.isWebGL2;fe===null&&(fe=new pi(1024,1024,{generateMipmaps:!0,type:ye.has("EXT_color_buffer_half_float")?vr:di,minFilter:br,samples:X&&s===!0?4:0}));const ae=p.getRenderTarget();p.setRenderTarget(fe),p.clear();const Oe=p.toneMapping;p.toneMapping=Un,vn(D,q,ie),p.toneMapping=Oe,Ve.updateMultisampleRenderTarget(fe),Ve.updateRenderTargetMipmap(fe),p.setRenderTarget(ae)}function vn(D,q,ie){const X=q.isScene===!0?q.overrideMaterial:null;for(let ae=0,Oe=D.length;ae<Oe;ae++){const Xe=D[ae],Ze=Xe.object,Ke=Xe.geometry,nt=X===null?Xe.material:X,Je=Xe.group;Ze.layers.test(ie.layers)&&wt(Ze,q,ie,Ke,nt,Je)}}function wt(D,q,ie,X,ae,Oe){D.onBeforeRender(p,q,ie,X,ae,Oe),D.modelViewMatrix.multiplyMatrices(ie.matrixWorldInverse,D.matrixWorld),D.normalMatrix.getNormalMatrix(D.modelViewMatrix),ae.onBeforeRender(p,q,ie,X,D,Oe),ae.transparent===!0&&ae.side===zn&&ae.forceSinglePass===!1?(ae.side=an,ae.needsUpdate=!0,p.renderBufferDirect(ie,q,X,ae,D,Oe),ae.side=Zn,ae.needsUpdate=!0,p.renderBufferDirect(ie,q,X,ae,D,Oe),ae.side=zn):p.renderBufferDirect(ie,q,X,ae,D,Oe),D.onAfterRender(p,q,ie,X,ae,Oe)}function cn(D,q,ie){q.isScene!==!0&&(q=ue);const X=Re.get(D),ae=d.state.lights,Oe=d.state.shadowsArray,Xe=ae.state.version,Ze=st.getParameters(D,ae.state,Oe,q,ie),Ke=st.getProgramCacheKey(Ze);let nt=X.programs;X.environment=D.isMeshStandardMaterial?q.environment:null,X.fog=q.fog,X.envMap=(D.isMeshStandardMaterial?qe:je).get(D.envMap||X.environment),nt===void 0&&(D.addEventListener("dispose",Be),nt=new Map,X.programs=nt);let Je=nt.get(Ke);if(Je!==void 0){if(X.currentProgram===Je&&X.lightsStateVersion===Xe)return yn(D,Ze),Je}else Ze.uniforms=st.getUniforms(D),D.onBuild(ie,Ze,p),D.onBeforeCompile(Ze,p),Je=st.acquireProgram(Ze,Ke),nt.set(Ke,Je),X.uniforms=Ze.uniforms;const Qe=X.uniforms;(!D.isShaderMaterial&&!D.isRawShaderMaterial||D.clipping===!0)&&(Qe.clippingPlanes=R.uniform),yn(D,Ze),X.needsLights=_u(D),X.lightsStateVersion=Xe,X.needsLights&&(Qe.ambientLightColor.value=ae.state.ambient,Qe.lightProbe.value=ae.state.probe,Qe.directionalLights.value=ae.state.directional,Qe.directionalLightShadows.value=ae.state.directionalShadow,Qe.spotLights.value=ae.state.spot,Qe.spotLightShadows.value=ae.state.spotShadow,Qe.rectAreaLights.value=ae.state.rectArea,Qe.ltc_1.value=ae.state.rectAreaLTC1,Qe.ltc_2.value=ae.state.rectAreaLTC2,Qe.pointLights.value=ae.state.point,Qe.pointLightShadows.value=ae.state.pointShadow,Qe.hemisphereLights.value=ae.state.hemi,Qe.directionalShadowMap.value=ae.state.directionalShadowMap,Qe.directionalShadowMatrix.value=ae.state.directionalShadowMatrix,Qe.spotShadowMap.value=ae.state.spotShadowMap,Qe.spotLightMatrix.value=ae.state.spotLightMatrix,Qe.spotLightMap.value=ae.state.spotLightMap,Qe.pointShadowMap.value=ae.state.pointShadowMap,Qe.pointShadowMatrix.value=ae.state.pointShadowMatrix);const xt=Je.getUniforms(),tn=ts.seqWithValue(xt.seq,Qe);return X.currentProgram=Je,X.uniformsList=tn,Je}function yn(D,q){const ie=Re.get(D);ie.outputEncoding=q.outputEncoding,ie.instancing=q.instancing,ie.skinning=q.skinning,ie.morphTargets=q.morphTargets,ie.morphNormals=q.morphNormals,ie.morphColors=q.morphColors,ie.morphTargetsCount=q.morphTargetsCount,ie.numClippingPlanes=q.numClippingPlanes,ie.numIntersection=q.numClipIntersection,ie.vertexAlphas=q.vertexAlphas,ie.vertexTangents=q.vertexTangents,ie.toneMapping=q.toneMapping}function pu(D,q,ie,X,ae){q.isScene!==!0&&(q=ue),Ve.resetTextureUnits();const Oe=q.fog,Xe=X.isMeshStandardMaterial?q.environment:null,Ze=b===null?p.outputEncoding:b.isXRRenderTarget===!0?b.texture.encoding:hi,Ke=(X.isMeshStandardMaterial?qe:je).get(X.envMap||Xe),nt=X.vertexColors===!0&&!!ie.attributes.color&&ie.attributes.color.itemSize===4,Je=!!X.normalMap&&!!ie.attributes.tangent,Qe=!!ie.morphAttributes.position,xt=!!ie.morphAttributes.normal,tn=!!ie.morphAttributes.color,En=X.toneMapped?p.toneMapping:Un,Kn=ie.morphAttributes.position||ie.morphAttributes.normal||ie.morphAttributes.color,St=Kn!==void 0?Kn.length:0,$e=Re.get(X),ys=d.state.lights;if(te===!0&&(re===!0||D!==y)){const nn=D===y&&X.id===w;R.setState(X,D,nn)}let It=!1;X.version===$e.__version?($e.needsLights&&$e.lightsStateVersion!==ys.state.version||$e.outputEncoding!==Ze||ae.isInstancedMesh&&$e.instancing===!1||!ae.isInstancedMesh&&$e.instancing===!0||ae.isSkinnedMesh&&$e.skinning===!1||!ae.isSkinnedMesh&&$e.skinning===!0||$e.envMap!==Ke||X.fog===!0&&$e.fog!==Oe||$e.numClippingPlanes!==void 0&&($e.numClippingPlanes!==R.numPlanes||$e.numIntersection!==R.numIntersection)||$e.vertexAlphas!==nt||$e.vertexTangents!==Je||$e.morphTargets!==Qe||$e.morphNormals!==xt||$e.morphColors!==tn||$e.toneMapping!==En||Te.isWebGL2===!0&&$e.morphTargetsCount!==St)&&(It=!0):(It=!0,$e.__version=X.version);let Jn=$e.currentProgram;It===!0&&(Jn=cn(X,q,ae));let La=!1,Yi=!1,ws=!1;const Xt=Jn.getUniforms(),Qn=$e.uniforms;if(Se.useProgram(Jn.program)&&(La=!0,Yi=!0,ws=!0),X.id!==w&&(w=X.id,Yi=!0),La||y!==D){if(Xt.setValue(W,"projectionMatrix",D.projectionMatrix),Te.logarithmicDepthBuffer&&Xt.setValue(W,"logDepthBufFC",2/(Math.log(D.far+1)/Math.LN2)),y!==D&&(y=D,Yi=!0,ws=!0),X.isShaderMaterial||X.isMeshPhongMaterial||X.isMeshToonMaterial||X.isMeshStandardMaterial||X.envMap){const nn=Xt.map.cameraPosition;nn!==void 0&&nn.setValue(W,Y.setFromMatrixPosition(D.matrixWorld))}(X.isMeshPhongMaterial||X.isMeshToonMaterial||X.isMeshLambertMaterial||X.isMeshBasicMaterial||X.isMeshStandardMaterial||X.isShaderMaterial)&&Xt.setValue(W,"isOrthographic",D.isOrthographicCamera===!0),(X.isMeshPhongMaterial||X.isMeshToonMaterial||X.isMeshLambertMaterial||X.isMeshBasicMaterial||X.isMeshStandardMaterial||X.isShaderMaterial||X.isShadowMaterial||ae.isSkinnedMesh)&&Xt.setValue(W,"viewMatrix",D.matrixWorldInverse)}if(ae.isSkinnedMesh){Xt.setOptional(W,ae,"bindMatrix"),Xt.setOptional(W,ae,"bindMatrixInverse");const nn=ae.skeleton;nn&&(Te.floatVertexTextures?(nn.boneTexture===null&&nn.computeBoneTexture(),Xt.setValue(W,"boneTexture",nn.boneTexture,Ve),Xt.setValue(W,"boneTextureSize",nn.boneTextureSize)):console.warn("THREE.WebGLRenderer: SkinnedMesh can only be used with WebGL 2. With WebGL 1 OES_texture_float and vertex textures support is required."))}const Ms=ie.morphAttributes;if((Ms.position!==void 0||Ms.normal!==void 0||Ms.color!==void 0&&Te.isWebGL2===!0)&&se.update(ae,ie,Jn),(Yi||$e.receiveShadow!==ae.receiveShadow)&&($e.receiveShadow=ae.receiveShadow,Xt.setValue(W,"receiveShadow",ae.receiveShadow)),X.isMeshGouraudMaterial&&X.envMap!==null&&(Qn.envMap.value=Ke,Qn.flipEnvMap.value=Ke.isCubeTexture&&Ke.isRenderTargetTexture===!1?-1:1),Yi&&(Xt.setValue(W,"toneMappingExposure",p.toneMappingExposure),$e.needsLights&&mu(Qn,ws),Oe&&X.fog===!0&&at.refreshFogUniforms(Qn,Oe),at.refreshMaterialUniforms(Qn,X,k,P,fe),ts.upload(W,$e.uniformsList,Qn,Ve)),X.isShaderMaterial&&X.uniformsNeedUpdate===!0&&(ts.upload(W,$e.uniformsList,Qn,Ve),X.uniformsNeedUpdate=!1),X.isSpriteMaterial&&Xt.setValue(W,"center",ae.center),Xt.setValue(W,"modelViewMatrix",ae.modelViewMatrix),Xt.setValue(W,"normalMatrix",ae.normalMatrix),Xt.setValue(W,"modelMatrix",ae.matrixWorld),X.isShaderMaterial||X.isRawShaderMaterial){const nn=X.uniformsGroups;for(let xs=0,gu=nn.length;xs<gu;xs++)if(Te.isWebGL2){const Pa=nn[xs];le.update(Pa,Jn),le.bind(Pa,Jn)}else console.warn("THREE.WebGLRenderer: Uniform Buffer Objects can only be used with WebGL 2.")}return Jn}function mu(D,q){D.ambientLightColor.needsUpdate=q,D.lightProbe.needsUpdate=q,D.directionalLights.needsUpdate=q,D.directionalLightShadows.needsUpdate=q,D.pointLights.needsUpdate=q,D.pointLightShadows.needsUpdate=q,D.spotLights.needsUpdate=q,D.spotLightShadows.needsUpdate=q,D.rectAreaLights.needsUpdate=q,D.hemisphereLights.needsUpdate=q}function _u(D){return D.isMeshLambertMaterial||D.isMeshToonMaterial||D.isMeshPhongMaterial||D.isMeshStandardMaterial||D.isShadowMaterial||D.isShaderMaterial&&D.lights===!0}this.getActiveCubeFace=function(){return g},this.getActiveMipmapLevel=function(){return v},this.getRenderTarget=function(){return b},this.setRenderTargetTextures=function(D,q,ie){Re.get(D.texture).__webglTexture=q,Re.get(D.depthTexture).__webglTexture=ie;const X=Re.get(D);X.__hasExternalTextures=!0,X.__hasExternalTextures&&(X.__autoAllocateDepthBuffer=ie===void 0,X.__autoAllocateDepthBuffer||ye.has("WEBGL_multisampled_render_to_texture")===!0&&(console.warn("THREE.WebGLRenderer: Render-to-texture extension was disabled because an external texture was provided"),X.__useRenderToTexture=!1))},this.setRenderTargetFramebuffer=function(D,q){const ie=Re.get(D);ie.__webglFramebuffer=q,ie.__useDefaultFramebuffer=q===void 0},this.setRenderTarget=function(D,q=0,ie=0){b=D,g=q,v=ie;let X=!0,ae=null,Oe=!1,Xe=!1;if(D){const Ke=Re.get(D);Ke.__useDefaultFramebuffer!==void 0?(Se.bindFramebuffer(36160,null),X=!1):Ke.__webglFramebuffer===void 0?Ve.setupRenderTarget(D):Ke.__hasExternalTextures&&Ve.rebindTextures(D,Re.get(D.texture).__webglTexture,Re.get(D.depthTexture).__webglTexture);const nt=D.texture;(nt.isData3DTexture||nt.isDataArrayTexture||nt.isCompressedArrayTexture)&&(Xe=!0);const Je=Re.get(D).__webglFramebuffer;D.isWebGLCubeRenderTarget?(ae=Je[q],Oe=!0):Te.isWebGL2&&D.samples>0&&Ve.useMultisampledRTT(D)===!1?ae=Re.get(D).__webglMultisampledFramebuffer:ae=Je,x.copy(D.viewport),E.copy(D.scissor),M=D.scissorTest}else x.copy(F).multiplyScalar(k).floor(),E.copy(j).multiplyScalar(k).floor(),M=ce;if(Se.bindFramebuffer(36160,ae)&&Te.drawBuffers&&X&&Se.drawBuffers(D,ae),Se.viewport(x),Se.scissor(E),Se.setScissorTest(M),Oe){const Ke=Re.get(D.texture);W.framebufferTexture2D(36160,36064,34069+q,Ke.__webglTexture,ie)}else if(Xe){const Ke=Re.get(D.texture),nt=q||0;W.framebufferTextureLayer(36160,36064,Ke.__webglTexture,ie||0,nt)}w=-1},this.readRenderTargetPixels=function(D,q,ie,X,ae,Oe,Xe){if(!(D&&D.isWebGLRenderTarget)){console.error("THREE.WebGLRenderer.readRenderTargetPixels: renderTarget is not THREE.WebGLRenderTarget.");return}let Ze=Re.get(D).__webglFramebuffer;if(D.isWebGLCubeRenderTarget&&Xe!==void 0&&(Ze=Ze[Xe]),Ze){Se.bindFramebuffer(36160,Ze);try{const Ke=D.texture,nt=Ke.format,Je=Ke.type;if(nt!==gn&&Le.convert(nt)!==W.getParameter(35739)){console.error("THREE.WebGLRenderer.readRenderTargetPixels: renderTarget is not in RGBA or implementation defined format.");return}const Qe=Je===vr&&(ye.has("EXT_color_buffer_half_float")||Te.isWebGL2&&ye.has("EXT_color_buffer_float"));if(Je!==di&&Le.convert(Je)!==W.getParameter(35738)&&!(Je===ci&&(Te.isWebGL2||ye.has("OES_texture_float")||ye.has("WEBGL_color_buffer_float")))&&!Qe){console.error("THREE.WebGLRenderer.readRenderTargetPixels: renderTarget is not in UnsignedByteType or implementation defined type.");return}q>=0&&q<=D.width-X&&ie>=0&&ie<=D.height-ae&&W.readPixels(q,ie,X,ae,Le.convert(nt),Le.convert(Je),Oe)}finally{const Ke=b!==null?Re.get(b).__webglFramebuffer:null;Se.bindFramebuffer(36160,Ke)}}},this.copyFramebufferToTexture=function(D,q,ie=0){const X=Math.pow(2,-ie),ae=Math.floor(q.image.width*X),Oe=Math.floor(q.image.height*X);Ve.setTexture2D(q,0),W.copyTexSubImage2D(3553,ie,0,0,D.x,D.y,ae,Oe),Se.unbindTexture()},this.copyTextureToTexture=function(D,q,ie,X=0){const ae=q.image.width,Oe=q.image.height,Xe=Le.convert(ie.format),Ze=Le.convert(ie.type);Ve.setTexture2D(ie,0),W.pixelStorei(37440,ie.flipY),W.pixelStorei(37441,ie.premultiplyAlpha),W.pixelStorei(3317,ie.unpackAlignment),q.isDataTexture?W.texSubImage2D(3553,X,D.x,D.y,ae,Oe,Xe,Ze,q.image.data):q.isCompressedTexture?W.compressedTexSubImage2D(3553,X,D.x,D.y,q.mipmaps[0].width,q.mipmaps[0].height,Xe,q.mipmaps[0].data):W.texSubImage2D(3553,X,D.x,D.y,Xe,Ze,q.image),X===0&&ie.generateMipmaps&&W.generateMipmap(3553),Se.unbindTexture()},this.copyTextureToTexture3D=function(D,q,ie,X,ae=0){if(p.isWebGL1Renderer){console.warn("THREE.WebGLRenderer.copyTextureToTexture3D: can only be used with WebGL2.");return}const Oe=D.max.x-D.min.x+1,Xe=D.max.y-D.min.y+1,Ze=D.max.z-D.min.z+1,Ke=Le.convert(X.format),nt=Le.convert(X.type);let Je;if(X.isData3DTexture)Ve.setTexture3D(X,0),Je=32879;else if(X.isDataArrayTexture)Ve.setTexture2DArray(X,0),Je=35866;else{console.warn("THREE.WebGLRenderer.copyTextureToTexture3D: only supports THREE.DataTexture3D and THREE.DataTexture2DArray.");return}W.pixelStorei(37440,X.flipY),W.pixelStorei(37441,X.premultiplyAlpha),W.pixelStorei(3317,X.unpackAlignment);const Qe=W.getParameter(3314),xt=W.getParameter(32878),tn=W.getParameter(3316),En=W.getParameter(3315),Kn=W.getParameter(32877),St=ie.isCompressedTexture?ie.mipmaps[0]:ie.image;W.pixelStorei(3314,St.width),W.pixelStorei(32878,St.height),W.pixelStorei(3316,D.min.x),W.pixelStorei(3315,D.min.y),W.pixelStorei(32877,D.min.z),ie.isDataTexture||ie.isData3DTexture?W.texSubImage3D(Je,ae,q.x,q.y,q.z,Oe,Xe,Ze,Ke,nt,St.data):ie.isCompressedArrayTexture?(console.warn("THREE.WebGLRenderer.copyTextureToTexture3D: untested support for compressed srcTexture."),W.compressedTexSubImage3D(Je,ae,q.x,q.y,q.z,Oe,Xe,Ze,Ke,St.data)):W.texSubImage3D(Je,ae,q.x,q.y,q.z,Oe,Xe,Ze,Ke,nt,St),W.pixelStorei(3314,Qe),W.pixelStorei(32878,xt),W.pixelStorei(3316,tn),W.pixelStorei(3315,En),W.pixelStorei(32877,Kn),ae===0&&X.generateMipmaps&&W.generateMipmap(Je),Se.unbindTexture()},this.initTexture=function(D){D.isCubeTexture?Ve.setTextureCube(D,0):D.isData3DTexture?Ve.setTexture3D(D,0):D.isDataArrayTexture||D.isCompressedArrayTexture?Ve.setTexture2DArray(D,0):Ve.setTexture2D(D,0),Se.unbindTexture()},this.resetState=function(){g=0,v=0,b=null,Se.reset(),xe.reset()},typeof __THREE_DEVTOOLS__<"u"&&__THREE_DEVTOOLS__.dispatchEvent(new CustomEvent("observe",{detail:this}))}Object.defineProperties(Ca.prototype,{physicallyCorrectLights:{get:function(){return console.warn("THREE.WebGLRenderer: the property .physicallyCorrectLights has been removed. Set renderer.useLegacyLights instead."),!this.useLegacyLights},set:function(r){console.warn("THREE.WebGLRenderer: the property .physicallyCorrectLights has been removed. Set renderer.useLegacyLights instead."),this.useLegacyLights=!r}}});class T2 extends Ca{}T2.prototype.isWebGL1Renderer=!0;class E2 extends Ut{constructor(){super(),this.isScene=!0,this.type="Scene",this.background=null,this.environment=null,this.fog=null,this.backgroundBlurriness=0,this.backgroundIntensity=1,this.overrideMaterial=null,typeof __THREE_DEVTOOLS__<"u"&&__THREE_DEVTOOLS__.dispatchEvent(new CustomEvent("observe",{detail:this}))}copy(e,t){return super.copy(e,t),e.background!==null&&(this.background=e.background.clone()),e.environment!==null&&(this.environment=e.environment.clone()),e.fog!==null&&(this.fog=e.fog.clone()),this.backgroundBlurriness=e.backgroundBlurriness,this.backgroundIntensity=e.backgroundIntensity,e.overrideMaterial!==null&&(this.overrideMaterial=e.overrideMaterial.clone()),this.matrixAutoUpdate=e.matrixAutoUpdate,this}toJSON(e){const t=super.toJSON(e);return this.fog!==null&&(t.object.fog=this.fog.toJSON()),this.backgroundBlurriness>0&&(t.object.backgroundBlurriness=this.backgroundBlurriness),this.backgroundIntensity!==1&&(t.object.backgroundIntensity=this.backgroundIntensity),t}get autoUpdate(){return console.warn("THREE.Scene: autoUpdate was renamed to matrixWorldAutoUpdate in r144."),this.matrixWorldAutoUpdate}set autoUpdate(e){console.warn("THREE.Scene: autoUpdate was renamed to matrixWorldAutoUpdate in r144."),this.matrixWorldAutoUpdate=e}}class hu extends Er{constructor(e){super(),this.isLineBasicMaterial=!0,this.type="LineBasicMaterial",this.color=new pt(16777215),this.linewidth=1,this.linecap="round",this.linejoin="round",this.fog=!0,this.setValues(e)}copy(e){return super.copy(e),this.color.copy(e.color),this.linewidth=e.linewidth,this.linecap=e.linecap,this.linejoin=e.linejoin,this.fog=e.fog,this}}const _c=new G,gc=new G,bc=new Et,na=new Ma,Zr=new _s;class Xn extends Ut{constructor(e=new en,t=new hu){super(),this.isLine=!0,this.type="Line",this.geometry=e,this.material=t,this.updateMorphTargets()}copy(e,t){return super.copy(e,t),this.material=e.material,this.geometry=e.geometry,this}computeLineDistances(){const e=this.geometry;if(e.index===null){const t=e.attributes.position,n=[0];for(let i=1,s=t.count;i<s;i++)_c.fromBufferAttribute(t,i-1),gc.fromBufferAttribute(t,i),n[i]=n[i-1],n[i]+=_c.distanceTo(gc);e.setAttribute("lineDistance",new bt(n,1))}else console.warn("THREE.Line.computeLineDistances(): Computation only possible with non-indexed BufferGeometry.");return this}raycast(e,t){const n=this.geometry,i=this.matrixWorld,s=e.params.Line.threshold,a=n.drawRange;if(n.boundingSphere===null&&n.computeBoundingSphere(),Zr.copy(n.boundingSphere),Zr.applyMatrix4(i),Zr.radius+=s,e.ray.intersectsSphere(Zr)===!1)return;bc.copy(i).invert(),na.copy(e.ray).applyMatrix4(bc);const o=s/((this.scale.x+this.scale.y+this.scale.z)/3),l=o*o,c=new G,u=new G,f=new G,d=new G,m=this.isLineSegments?2:1,h=n.index,_=n.attributes.position;if(h!==null){const g=Math.max(0,a.start),v=Math.min(h.count,a.start+a.count);for(let b=g,w=v-1;b<w;b+=m){const y=h.getX(b),x=h.getX(b+1);if(c.fromBufferAttribute(_,y),u.fromBufferAttribute(_,x),na.distanceSqToSegment(c,u,d,f)>l)continue;d.applyMatrix4(this.matrixWorld);const M=e.ray.origin.distanceTo(d);M<e.near||M>e.far||t.push({distance:M,point:f.clone().applyMatrix4(this.matrixWorld),index:b,face:null,faceIndex:null,object:this})}}else{const g=Math.max(0,a.start),v=Math.min(_.count,a.start+a.count);for(let b=g,w=v-1;b<w;b+=m){if(c.fromBufferAttribute(_,b),u.fromBufferAttribute(_,b+1),na.distanceSqToSegment(c,u,d,f)>l)continue;d.applyMatrix4(this.matrixWorld);const x=e.ray.origin.distanceTo(d);x<e.near||x>e.far||t.push({distance:x,point:f.clone().applyMatrix4(this.matrixWorld),index:b,face:null,faceIndex:null,object:this})}}}updateMorphTargets(){const t=this.geometry.morphAttributes,n=Object.keys(t);if(n.length>0){const i=t[n[0]];if(i!==void 0){this.morphTargetInfluences=[],this.morphTargetDictionary={};for(let s=0,a=i.length;s<a;s++){const o=i[s].name||String(s);this.morphTargetInfluences.push(0),this.morphTargetDictionary[o]=s}}}}}class Gt extends en{constructor(e=1,t=1,n=1,i=32,s=1,a=!1,o=0,l=Math.PI*2){super(),this.type="CylinderGeometry",this.parameters={radiusTop:e,radiusBottom:t,height:n,radialSegments:i,heightSegments:s,openEnded:a,thetaStart:o,thetaLength:l};const c=this;i=Math.floor(i),s=Math.floor(s);const u=[],f=[],d=[],m=[];let h=0;const p=[],_=n/2;let g=0;v(),a===!1&&(e>0&&b(!0),t>0&&b(!1)),this.setIndex(u),this.setAttribute("position",new bt(f,3)),this.setAttribute("normal",new bt(d,3)),this.setAttribute("uv",new bt(m,2));function v(){const w=new G,y=new G;let x=0;const E=(t-e)/n;for(let M=0;M<=s;M++){const S=[],P=M/s,k=P*(t-e)+e;for(let H=0;H<=i;H++){const V=H/i,F=V*l+o,j=Math.sin(F),ce=Math.cos(F);y.x=k*j,y.y=-P*n+_,y.z=k*ce,f.push(y.x,y.y,y.z),w.set(j,E,ce).normalize(),d.push(w.x,w.y,w.z),m.push(V,1-P),S.push(h++)}p.push(S)}for(let M=0;M<i;M++)for(let S=0;S<s;S++){const P=p[S][M],k=p[S+1][M],H=p[S+1][M+1],V=p[S][M+1];u.push(P,k,V),u.push(k,H,V),x+=6}c.addGroup(g,x,0),g+=x}function b(w){const y=h,x=new ot,E=new G;let M=0;const S=w===!0?e:t,P=w===!0?1:-1;for(let H=1;H<=i;H++)f.push(0,_*P,0),d.push(0,P,0),m.push(.5,.5),h++;const k=h;for(let H=0;H<=i;H++){const F=H/i*l+o,j=Math.cos(F),ce=Math.sin(F);E.x=S*ce,E.y=_*P,E.z=S*j,f.push(E.x,E.y,E.z),d.push(0,P,0),x.x=j*.5+.5,x.y=ce*.5*P+.5,m.push(x.x,x.y),h++}for(let H=0;H<i;H++){const V=y+H,F=k+H;w===!0?u.push(F,F+1,V):u.push(F+1,F,V),M+=3}c.addGroup(g,M,w===!0?1:2),g+=M}}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Gt(e.radiusTop,e.radiusBottom,e.height,e.radialSegments,e.heightSegments,e.openEnded,e.thetaStart,e.thetaLength)}}class Ta extends en{constructor(e=[],t=[],n=1,i=0){super(),this.type="PolyhedronGeometry",this.parameters={vertices:e,indices:t,radius:n,detail:i};const s=[],a=[];o(i),c(n),u(),this.setAttribute("position",new bt(s,3)),this.setAttribute("normal",new bt(s.slice(),3)),this.setAttribute("uv",new bt(a,2)),i===0?this.computeVertexNormals():this.normalizeNormals();function o(v){const b=new G,w=new G,y=new G;for(let x=0;x<t.length;x+=3)m(t[x+0],b),m(t[x+1],w),m(t[x+2],y),l(b,w,y,v)}function l(v,b,w,y){const x=y+1,E=[];for(let M=0;M<=x;M++){E[M]=[];const S=v.clone().lerp(w,M/x),P=b.clone().lerp(w,M/x),k=x-M;for(let H=0;H<=k;H++)H===0&&M===x?E[M][H]=S:E[M][H]=S.clone().lerp(P,H/k)}for(let M=0;M<x;M++)for(let S=0;S<2*(x-M)-1;S++){const P=Math.floor(S/2);S%2===0?(d(E[M][P+1]),d(E[M+1][P]),d(E[M][P])):(d(E[M][P+1]),d(E[M+1][P+1]),d(E[M+1][P]))}}function c(v){const b=new G;for(let w=0;w<s.length;w+=3)b.x=s[w+0],b.y=s[w+1],b.z=s[w+2],b.normalize().multiplyScalar(v),s[w+0]=b.x,s[w+1]=b.y,s[w+2]=b.z}function u(){const v=new G;for(let b=0;b<s.length;b+=3){v.x=s[b+0],v.y=s[b+1],v.z=s[b+2];const w=_(v)/2/Math.PI+.5,y=g(v)/Math.PI+.5;a.push(w,1-y)}h(),f()}function f(){for(let v=0;v<a.length;v+=6){const b=a[v+0],w=a[v+2],y=a[v+4],x=Math.max(b,w,y),E=Math.min(b,w,y);x>.9&&E<.1&&(b<.2&&(a[v+0]+=1),w<.2&&(a[v+2]+=1),y<.2&&(a[v+4]+=1))}}function d(v){s.push(v.x,v.y,v.z)}function m(v,b){const w=v*3;b.x=e[w+0],b.y=e[w+1],b.z=e[w+2]}function h(){const v=new G,b=new G,w=new G,y=new G,x=new ot,E=new ot,M=new ot;for(let S=0,P=0;S<s.length;S+=9,P+=6){v.set(s[S+0],s[S+1],s[S+2]),b.set(s[S+3],s[S+4],s[S+5]),w.set(s[S+6],s[S+7],s[S+8]),x.set(a[P+0],a[P+1]),E.set(a[P+2],a[P+3]),M.set(a[P+4],a[P+5]),y.copy(v).add(b).add(w).divideScalar(3);const k=_(y);p(x,P+0,v,k),p(E,P+2,b,k),p(M,P+4,w,k)}}function p(v,b,w,y){y<0&&v.x===1&&(a[b]=v.x-1),w.x===0&&w.z===0&&(a[b]=y/2/Math.PI+.5)}function _(v){return Math.atan2(v.z,-v.x)}function g(v){return Math.atan2(-v.y,Math.sqrt(v.x*v.x+v.z*v.z))}}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Ta(e.vertices,e.indices,e.radius,e.details)}}class Ri extends Ta{constructor(e=1,t=0){const n=[1,0,0,-1,0,0,0,1,0,0,-1,0,0,0,1,0,0,-1],i=[0,2,4,0,4,3,0,3,5,0,5,2,1,2,5,1,5,3,1,3,4,1,4,2];super(n,i,e,t),this.type="OctahedronGeometry",this.parameters={radius:e,detail:t}}static fromJSON(e){return new Ri(e.radius,e.detail)}}class Ea extends en{constructor(e=1,t=32,n=16,i=0,s=Math.PI*2,a=0,o=Math.PI){super(),this.type="SphereGeometry",this.parameters={radius:e,widthSegments:t,heightSegments:n,phiStart:i,phiLength:s,thetaStart:a,thetaLength:o},t=Math.max(3,Math.floor(t)),n=Math.max(2,Math.floor(n));const l=Math.min(a+o,Math.PI);let c=0;const u=[],f=new G,d=new G,m=[],h=[],p=[],_=[];for(let g=0;g<=n;g++){const v=[],b=g/n;let w=0;g==0&&a==0?w=.5/t:g==n&&l==Math.PI&&(w=-.5/t);for(let y=0;y<=t;y++){const x=y/t;f.x=-e*Math.cos(i+x*s)*Math.sin(a+b*o),f.y=e*Math.cos(a+b*o),f.z=e*Math.sin(i+x*s)*Math.sin(a+b*o),h.push(f.x,f.y,f.z),d.copy(f).normalize(),p.push(d.x,d.y,d.z),_.push(x+w,1-b),v.push(c++)}u.push(v)}for(let g=0;g<n;g++)for(let v=0;v<t;v++){const b=u[g][v+1],w=u[g][v],y=u[g+1][v],x=u[g+1][v+1];(g!==0||a>0)&&m.push(b,w,x),(g!==n-1||l<Math.PI)&&m.push(w,y,x)}this.setIndex(m),this.setAttribute("position",new bt(h,3)),this.setAttribute("normal",new bt(p,3)),this.setAttribute("uv",new bt(_,2))}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Ea(e.radius,e.widthSegments,e.heightSegments,e.phiStart,e.phiLength,e.thetaStart,e.thetaLength)}}class oi extends en{constructor(e=1,t=.4,n=12,i=48,s=Math.PI*2){super(),this.type="TorusGeometry",this.parameters={radius:e,tube:t,radialSegments:n,tubularSegments:i,arc:s},n=Math.floor(n),i=Math.floor(i);const a=[],o=[],l=[],c=[],u=new G,f=new G,d=new G;for(let m=0;m<=n;m++)for(let h=0;h<=i;h++){const p=h/i*s,_=m/n*Math.PI*2;f.x=(e+t*Math.cos(_))*Math.cos(p),f.y=(e+t*Math.cos(_))*Math.sin(p),f.z=t*Math.sin(_),o.push(f.x,f.y,f.z),u.x=e*Math.cos(p),u.y=e*Math.sin(p),d.subVectors(f,u).normalize(),l.push(d.x,d.y,d.z),c.push(h/i),c.push(m/n)}for(let m=1;m<=n;m++)for(let h=1;h<=i;h++){const p=(i+1)*m+h-1,_=(i+1)*(m-1)+h-1,g=(i+1)*(m-1)+h,v=(i+1)*m+h;a.push(p,_,v),a.push(_,g,v)}this.setIndex(a),this.setAttribute("position",new bt(o,3)),this.setAttribute("normal",new bt(l,3)),this.setAttribute("uv",new bt(c,2))}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new oi(e.radius,e.tube,e.radialSegments,e.tubularSegments,e.arc)}}class L2{constructor(e,t,n=0,i=1/0){this.ray=new Ma(e,t),this.near=n,this.far=i,this.camera=null,this.layers=new xa,this.params={Mesh:{},Line:{threshold:1},LOD:{},Points:{threshold:1},Sprite:{}}}set(e,t){this.ray.set(e,t)}setFromCamera(e,t){t.isPerspectiveCamera?(this.ray.origin.setFromMatrixPosition(t.matrixWorld),this.ray.direction.set(e.x,e.y,.5).unproject(t).sub(this.ray.origin).normalize(),this.camera=t):t.isOrthographicCamera?(this.ray.origin.set(e.x,e.y,(t.near+t.far)/(t.near-t.far)).unproject(t),this.ray.direction.set(0,0,-1).transformDirection(t.matrixWorld),this.camera=t):console.error("THREE.Raycaster: Unsupported camera type: "+t.type)}intersectObject(e,t=!0,n=[]){return _a(e,this,n,t),n.sort(vc),n}intersectObjects(e,t=!0,n=[]){for(let i=0,s=e.length;i<s;i++)_a(e[i],this,n,t);return n.sort(vc),n}}function vc(r,e){return r.distance-e.distance}function _a(r,e,t,n){if(r.layers.test(e.layers)&&r.raycast(e,t),n===!0){const i=r.children;for(let s=0,a=i.length;s<a;s++)_a(i[s],e,t,!0)}}typeof __THREE_DEVTOOLS__<"u"&&__THREE_DEVTOOLS__.dispatchEvent(new CustomEvent("register",{detail:{revision:ya}}));typeof window<"u"&&(window.__THREE__?console.warn("WARNING: Multiple instances of Three.js being imported."):window.__THREE__=ya);const ni=new L2,Qt=new G,jn=new G,mt=new Zt,yc={X:new G(1,0,0),Y:new G(0,1,0),Z:new G(0,0,1)},ia={type:"change"},wc={type:"mouseDown"},Mc={type:"mouseUp",mode:null},xc={type:"objectChange"};class P2 extends Ut{constructor(e,t){super(),t===void 0&&(console.warn('THREE.TransformControls: The second parameter "domElement" is now mandatory.'),t=document),this.isTransformControls=!0,this.visible=!1,this.domElement=t,this.domElement.style.touchAction="none";const n=new N2;this._gizmo=n,this.add(n);const i=new z2;this._plane=i,this.add(i);const s=this;function a(v,b){let w=b;Object.defineProperty(s,v,{get:function(){return w!==void 0?w:b},set:function(y){w!==y&&(w=y,i[v]=y,n[v]=y,s.dispatchEvent({type:v+"-changed",value:y}),s.dispatchEvent(ia))}}),s[v]=b,i[v]=b,n[v]=b}a("camera",e),a("object",void 0),a("enabled",!0),a("axis",null),a("mode","translate"),a("translationSnap",null),a("rotationSnap",null),a("scaleSnap",null),a("space","world"),a("size",1),a("dragging",!1),a("showX",!0),a("showY",!0),a("showZ",!0);const o=new G,l=new G,c=new Zt,u=new Zt,f=new G,d=new Zt,m=new G,h=new G,p=new G,_=0,g=new G;a("worldPosition",o),a("worldPositionStart",l),a("worldQuaternion",c),a("worldQuaternionStart",u),a("cameraPosition",f),a("cameraQuaternion",d),a("pointStart",m),a("pointEnd",h),a("rotationAxis",p),a("rotationAngle",_),a("eye",g),this._offset=new G,this._startNorm=new G,this._endNorm=new G,this._cameraScale=new G,this._parentPosition=new G,this._parentQuaternion=new Zt,this._parentQuaternionInv=new Zt,this._parentScale=new G,this._worldScaleStart=new G,this._worldQuaternionInv=new Zt,this._worldScale=new G,this._positionStart=new G,this._quaternionStart=new Zt,this._scaleStart=new G,this._getPointer=A2.bind(this),this._onPointerDown=k2.bind(this),this._onPointerHover=D2.bind(this),this._onPointerMove=R2.bind(this),this._onPointerUp=I2.bind(this),this.domElement.addEventListener("pointerdown",this._onPointerDown),this.domElement.addEventListener("pointermove",this._onPointerHover),this.domElement.addEventListener("pointerup",this._onPointerUp)}updateMatrixWorld(){this.object!==void 0&&(this.object.updateMatrixWorld(),this.object.parent===null?console.error("TransformControls: The attached 3D object must be a part of the scene graph."):this.object.parent.matrixWorld.decompose(this._parentPosition,this._parentQuaternion,this._parentScale),this.object.matrixWorld.decompose(this.worldPosition,this.worldQuaternion,this._worldScale),this._parentQuaternionInv.copy(this._parentQuaternion).invert(),this._worldQuaternionInv.copy(this.worldQuaternion).invert()),this.camera.updateMatrixWorld(),this.camera.matrixWorld.decompose(this.cameraPosition,this.cameraQuaternion,this._cameraScale),this.camera.isOrthographicCamera?this.camera.getWorldDirection(this.eye).negate():this.eye.copy(this.cameraPosition).sub(this.worldPosition).normalize(),super.updateMatrixWorld(this)}pointerHover(e){if(this.object===void 0||this.dragging===!0)return;ni.setFromCamera(e,this.camera);const t=ra(this._gizmo.picker[this.mode],ni);t?this.axis=t.object.name:this.axis=null}pointerDown(e){if(!(this.object===void 0||this.dragging===!0||e.button!==0)&&this.axis!==null){ni.setFromCamera(e,this.camera);const t=ra(this._plane,ni,!0);t&&(this.object.updateMatrixWorld(),this.object.parent.updateMatrixWorld(),this._positionStart.copy(this.object.position),this._quaternionStart.copy(this.object.quaternion),this._scaleStart.copy(this.object.scale),this.object.matrixWorld.decompose(this.worldPositionStart,this.worldQuaternionStart,this._worldScaleStart),this.pointStart.copy(t.point).sub(this.worldPositionStart)),this.dragging=!0,wc.mode=this.mode,this.dispatchEvent(wc)}}pointerMove(e){const t=this.axis,n=this.mode,i=this.object;let s=this.space;if(n==="scale"?s="local":(t==="E"||t==="XYZE"||t==="XYZ")&&(s="world"),i===void 0||t===null||this.dragging===!1||e.button!==-1)return;ni.setFromCamera(e,this.camera);const a=ra(this._plane,ni,!0);if(!!a){if(this.pointEnd.copy(a.point).sub(this.worldPositionStart),n==="translate")this._offset.copy(this.pointEnd).sub(this.pointStart),s==="local"&&t!=="XYZ"&&this._offset.applyQuaternion(this._worldQuaternionInv),t.indexOf("X")===-1&&(this._offset.x=0),t.indexOf("Y")===-1&&(this._offset.y=0),t.indexOf("Z")===-1&&(this._offset.z=0),s==="local"&&t!=="XYZ"?this._offset.applyQuaternion(this._quaternionStart).divide(this._parentScale):this._offset.applyQuaternion(this._parentQuaternionInv).divide(this._parentScale),i.position.copy(this._offset).add(this._positionStart),this.translationSnap&&(s==="local"&&(i.position.applyQuaternion(mt.copy(this._quaternionStart).invert()),t.search("X")!==-1&&(i.position.x=Math.round(i.position.x/this.translationSnap)*this.translationSnap),t.search("Y")!==-1&&(i.position.y=Math.round(i.position.y/this.translationSnap)*this.translationSnap),t.search("Z")!==-1&&(i.position.z=Math.round(i.position.z/this.translationSnap)*this.translationSnap),i.position.applyQuaternion(this._quaternionStart)),s==="world"&&(i.parent&&i.position.add(Qt.setFromMatrixPosition(i.parent.matrixWorld)),t.search("X")!==-1&&(i.position.x=Math.round(i.position.x/this.translationSnap)*this.translationSnap),t.search("Y")!==-1&&(i.position.y=Math.round(i.position.y/this.translationSnap)*this.translationSnap),t.search("Z")!==-1&&(i.position.z=Math.round(i.position.z/this.translationSnap)*this.translationSnap),i.parent&&i.position.sub(Qt.setFromMatrixPosition(i.parent.matrixWorld))));else if(n==="scale"){if(t.search("XYZ")!==-1){let o=this.pointEnd.length()/this.pointStart.length();this.pointEnd.dot(this.pointStart)<0&&(o*=-1),jn.set(o,o,o)}else Qt.copy(this.pointStart),jn.copy(this.pointEnd),Qt.applyQuaternion(this._worldQuaternionInv),jn.applyQuaternion(this._worldQuaternionInv),jn.divide(Qt),t.search("X")===-1&&(jn.x=1),t.search("Y")===-1&&(jn.y=1),t.search("Z")===-1&&(jn.z=1);i.scale.copy(this._scaleStart).multiply(jn),this.scaleSnap&&(t.search("X")!==-1&&(i.scale.x=Math.round(i.scale.x/this.scaleSnap)*this.scaleSnap||this.scaleSnap),t.search("Y")!==-1&&(i.scale.y=Math.round(i.scale.y/this.scaleSnap)*this.scaleSnap||this.scaleSnap),t.search("Z")!==-1&&(i.scale.z=Math.round(i.scale.z/this.scaleSnap)*this.scaleSnap||this.scaleSnap))}else if(n==="rotate"){this._offset.copy(this.pointEnd).sub(this.pointStart);const o=20/this.worldPosition.distanceTo(Qt.setFromMatrixPosition(this.camera.matrixWorld));t==="E"?(this.rotationAxis.copy(this.eye),this.rotationAngle=this.pointEnd.angleTo(this.pointStart),this._startNorm.copy(this.pointStart).normalize(),this._endNorm.copy(this.pointEnd).normalize(),this.rotationAngle*=this._endNorm.cross(this._startNorm).dot(this.eye)<0?1:-1):t==="XYZE"?(this.rotationAxis.copy(this._offset).cross(this.eye).normalize(),this.rotationAngle=this._offset.dot(Qt.copy(this.rotationAxis).cross(this.eye))*o):(t==="X"||t==="Y"||t==="Z")&&(this.rotationAxis.copy(yc[t]),Qt.copy(yc[t]),s==="local"&&Qt.applyQuaternion(this.worldQuaternion),this.rotationAngle=this._offset.dot(Qt.cross(this.eye).normalize())*o),this.rotationSnap&&(this.rotationAngle=Math.round(this.rotationAngle/this.rotationSnap)*this.rotationSnap),s==="local"&&t!=="E"&&t!=="XYZE"?(i.quaternion.copy(this._quaternionStart),i.quaternion.multiply(mt.setFromAxisAngle(this.rotationAxis,this.rotationAngle)).normalize()):(this.rotationAxis.applyQuaternion(this._parentQuaternionInv),i.quaternion.copy(mt.setFromAxisAngle(this.rotationAxis,this.rotationAngle)),i.quaternion.multiply(this._quaternionStart).normalize())}this.dispatchEvent(ia),this.dispatchEvent(xc)}}pointerUp(e){e.button===0&&(this.dragging&&this.axis!==null&&(Mc.mode=this.mode,this.dispatchEvent(Mc)),this.dragging=!1,this.axis=null)}dispose(){this.domElement.removeEventListener("pointerdown",this._onPointerDown),this.domElement.removeEventListener("pointermove",this._onPointerHover),this.domElement.removeEventListener("pointermove",this._onPointerMove),this.domElement.removeEventListener("pointerup",this._onPointerUp),this.traverse(function(e){e.geometry&&e.geometry.dispose(),e.material&&e.material.dispose()})}attach(e){return this.object=e,this.visible=!0,this}detach(){return this.object=void 0,this.visible=!1,this.axis=null,this}reset(){!this.enabled||this.dragging&&(this.object.position.copy(this._positionStart),this.object.quaternion.copy(this._quaternionStart),this.object.scale.copy(this._scaleStart),this.dispatchEvent(ia),this.dispatchEvent(xc),this.pointStart.copy(this.pointEnd))}getRaycaster(){return ni}getMode(){return this.mode}setMode(e){this.mode=e}setTranslationSnap(e){this.translationSnap=e}setRotationSnap(e){this.rotationSnap=e}setScaleSnap(e){this.scaleSnap=e}setSize(e){this.size=e}setSpace(e){this.space=e}}function A2(r){if(this.domElement.ownerDocument.pointerLockElement)return{x:0,y:0,button:r.button};{const e=this.domElement.getBoundingClientRect();return{x:(r.clientX-e.left)/e.width*2-1,y:-(r.clientY-e.top)/e.height*2+1,button:r.button}}}function D2(r){if(!!this.enabled)switch(r.pointerType){case"mouse":case"pen":this.pointerHover(this._getPointer(r));break}}function k2(r){!this.enabled||(document.pointerLockElement||this.domElement.setPointerCapture(r.pointerId),this.domElement.addEventListener("pointermove",this._onPointerMove),this.pointerHover(this._getPointer(r)),this.pointerDown(this._getPointer(r)))}function R2(r){!this.enabled||this.pointerMove(this._getPointer(r))}function I2(r){!this.enabled||(this.domElement.releasePointerCapture(r.pointerId),this.domElement.removeEventListener("pointermove",this._onPointerMove),this.pointerUp(this._getPointer(r)))}function ra(r,e,t){const n=e.intersectObject(r,!0);for(let i=0;i<n.length;i++)if(n[i].object.visible||t)return n[i];return!1}const Kr=new Tr,ct=new G(0,1,0),Sc=new G(0,0,0),Cc=new Et,Jr=new Zt,ns=new Zt,Mn=new G,Tc=new Et,cr=new G(1,0,0),si=new G(0,1,0),ur=new G(0,0,1),Qr=new G,ir=new G,rr=new G;class N2 extends Ut{constructor(){super(),this.isTransformControlsGizmo=!0,this.type="TransformControlsGizmo";const e=new gs({depthTest:!1,depthWrite:!1,fog:!1,toneMapped:!1,transparent:!0}),t=new hu({depthTest:!1,depthWrite:!1,fog:!1,toneMapped:!1,transparent:!0}),n=e.clone();n.opacity=.15;const i=t.clone();i.opacity=.5;const s=e.clone();s.color.setHex(16711680);const a=e.clone();a.color.setHex(65280);const o=e.clone();o.color.setHex(255);const l=e.clone();l.color.setHex(16711680),l.opacity=.5;const c=e.clone();c.color.setHex(65280),c.opacity=.5;const u=e.clone();u.color.setHex(255),u.opacity=.5;const f=e.clone();f.opacity=.25;const d=e.clone();d.color.setHex(16776960),d.opacity=.25,e.clone().color.setHex(16776960);const h=e.clone();h.color.setHex(7895160);const p=new Gt(0,.04,.1,12);p.translate(0,.05,0);const _=new Tt(.08,.08,.08);_.translate(0,.04,0);const g=new en;g.setAttribute("position",new bt([0,0,0,1,0,0],3));const v=new Gt(.0075,.0075,.5,3);v.translate(0,.25,0);function b(j,ce){const de=new oi(j,.0075,3,64,ce*Math.PI*2);return de.rotateY(Math.PI/2),de.rotateX(Math.PI/2),de}function w(){const j=new en;return j.setAttribute("position",new bt([0,0,0,1,1,1],3)),j}const y={X:[[new Ce(p,s),[.5,0,0],[0,0,-Math.PI/2]],[new Ce(p,s),[-.5,0,0],[0,0,Math.PI/2]],[new Ce(v,s),[0,0,0],[0,0,-Math.PI/2]]],Y:[[new Ce(p,a),[0,.5,0]],[new Ce(p,a),[0,-.5,0],[Math.PI,0,0]],[new Ce(v,a)]],Z:[[new Ce(p,o),[0,0,.5],[Math.PI/2,0,0]],[new Ce(p,o),[0,0,-.5],[-Math.PI/2,0,0]],[new Ce(v,o),null,[Math.PI/2,0,0]]],XYZ:[[new Ce(new Ri(.1,0),f.clone()),[0,0,0]]],XY:[[new Ce(new Tt(.15,.15,.01),u.clone()),[.15,.15,0]]],YZ:[[new Ce(new Tt(.15,.15,.01),l.clone()),[0,.15,.15],[0,Math.PI/2,0]]],XZ:[[new Ce(new Tt(.15,.15,.01),c.clone()),[.15,0,.15],[-Math.PI/2,0,0]]]},x={X:[[new Ce(new Gt(.2,0,.6,4),n),[.3,0,0],[0,0,-Math.PI/2]],[new Ce(new Gt(.2,0,.6,4),n),[-.3,0,0],[0,0,Math.PI/2]]],Y:[[new Ce(new Gt(.2,0,.6,4),n),[0,.3,0]],[new Ce(new Gt(.2,0,.6,4),n),[0,-.3,0],[0,0,Math.PI]]],Z:[[new Ce(new Gt(.2,0,.6,4),n),[0,0,.3],[Math.PI/2,0,0]],[new Ce(new Gt(.2,0,.6,4),n),[0,0,-.3],[-Math.PI/2,0,0]]],XYZ:[[new Ce(new Ri(.2,0),n)]],XY:[[new Ce(new Tt(.2,.2,.01),n),[.15,.15,0]]],YZ:[[new Ce(new Tt(.2,.2,.01),n),[0,.15,.15],[0,Math.PI/2,0]]],XZ:[[new Ce(new Tt(.2,.2,.01),n),[.15,0,.15],[-Math.PI/2,0,0]]]},E={START:[[new Ce(new Ri(.01,2),i),null,null,null,"helper"]],END:[[new Ce(new Ri(.01,2),i),null,null,null,"helper"]],DELTA:[[new Xn(w(),i),null,null,null,"helper"]],X:[[new Xn(g,i.clone()),[-1e3,0,0],null,[1e6,1,1],"helper"]],Y:[[new Xn(g,i.clone()),[0,-1e3,0],[0,0,Math.PI/2],[1e6,1,1],"helper"]],Z:[[new Xn(g,i.clone()),[0,0,-1e3],[0,-Math.PI/2,0],[1e6,1,1],"helper"]]},M={XYZE:[[new Ce(b(.5,1),h),null,[0,Math.PI/2,0]]],X:[[new Ce(b(.5,.5),s)]],Y:[[new Ce(b(.5,.5),a),null,[0,0,-Math.PI/2]]],Z:[[new Ce(b(.5,.5),o),null,[0,Math.PI/2,0]]],E:[[new Ce(b(.75,1),d),null,[0,Math.PI/2,0]]]},S={AXIS:[[new Xn(g,i.clone()),[-1e3,0,0],null,[1e6,1,1],"helper"]]},P={XYZE:[[new Ce(new Ea(.25,10,8),n)]],X:[[new Ce(new oi(.5,.1,4,24),n),[0,0,0],[0,-Math.PI/2,-Math.PI/2]]],Y:[[new Ce(new oi(.5,.1,4,24),n),[0,0,0],[Math.PI/2,0,0]]],Z:[[new Ce(new oi(.5,.1,4,24),n),[0,0,0],[0,0,-Math.PI/2]]],E:[[new Ce(new oi(.75,.1,2,24),n)]]},k={X:[[new Ce(_,s),[.5,0,0],[0,0,-Math.PI/2]],[new Ce(v,s),[0,0,0],[0,0,-Math.PI/2]],[new Ce(_,s),[-.5,0,0],[0,0,Math.PI/2]]],Y:[[new Ce(_,a),[0,.5,0]],[new Ce(v,a)],[new Ce(_,a),[0,-.5,0],[0,0,Math.PI]]],Z:[[new Ce(_,o),[0,0,.5],[Math.PI/2,0,0]],[new Ce(v,o),[0,0,0],[Math.PI/2,0,0]],[new Ce(_,o),[0,0,-.5],[-Math.PI/2,0,0]]],XY:[[new Ce(new Tt(.15,.15,.01),u),[.15,.15,0]]],YZ:[[new Ce(new Tt(.15,.15,.01),l),[0,.15,.15],[0,Math.PI/2,0]]],XZ:[[new Ce(new Tt(.15,.15,.01),c),[.15,0,.15],[-Math.PI/2,0,0]]],XYZ:[[new Ce(new Tt(.1,.1,.1),f.clone())]]},H={X:[[new Ce(new Gt(.2,0,.6,4),n),[.3,0,0],[0,0,-Math.PI/2]],[new Ce(new Gt(.2,0,.6,4),n),[-.3,0,0],[0,0,Math.PI/2]]],Y:[[new Ce(new Gt(.2,0,.6,4),n),[0,.3,0]],[new Ce(new Gt(.2,0,.6,4),n),[0,-.3,0],[0,0,Math.PI]]],Z:[[new Ce(new Gt(.2,0,.6,4),n),[0,0,.3],[Math.PI/2,0,0]],[new Ce(new Gt(.2,0,.6,4),n),[0,0,-.3],[-Math.PI/2,0,0]]],XY:[[new Ce(new Tt(.2,.2,.01),n),[.15,.15,0]]],YZ:[[new Ce(new Tt(.2,.2,.01),n),[0,.15,.15],[0,Math.PI/2,0]]],XZ:[[new Ce(new Tt(.2,.2,.01),n),[.15,0,.15],[-Math.PI/2,0,0]]],XYZ:[[new Ce(new Tt(.2,.2,.2),n),[0,0,0]]]},V={X:[[new Xn(g,i.clone()),[-1e3,0,0],null,[1e6,1,1],"helper"]],Y:[[new Xn(g,i.clone()),[0,-1e3,0],[0,0,Math.PI/2],[1e6,1,1],"helper"]],Z:[[new Xn(g,i.clone()),[0,0,-1e3],[0,-Math.PI/2,0],[1e6,1,1],"helper"]]};function F(j){const ce=new Ut;for(const de in j)for(let te=j[de].length;te--;){const re=j[de][te][0].clone(),fe=j[de][te][1],be=j[de][te][2],Y=j[de][te][3],ue=j[de][te][4];re.name=de,re.tag=ue,fe&&re.position.set(fe[0],fe[1],fe[2]),be&&re.rotation.set(be[0],be[1],be[2]),Y&&re.scale.set(Y[0],Y[1],Y[2]),re.updateMatrix();const pe=re.geometry.clone();pe.applyMatrix4(re.matrix),re.geometry=pe,re.renderOrder=1/0,re.position.set(0,0,0),re.rotation.set(0,0,0),re.scale.set(1,1,1),ce.add(re)}return ce}this.gizmo={},this.picker={},this.helper={},this.add(this.gizmo.translate=F(y)),this.add(this.gizmo.rotate=F(M)),this.add(this.gizmo.scale=F(k)),this.add(this.picker.translate=F(x)),this.add(this.picker.rotate=F(P)),this.add(this.picker.scale=F(H)),this.add(this.helper.translate=F(E)),this.add(this.helper.rotate=F(S)),this.add(this.helper.scale=F(V)),this.picker.translate.visible=!1,this.picker.rotate.visible=!1,this.picker.scale.visible=!1}updateMatrixWorld(e){const n=(this.mode==="scale"?"local":this.space)==="local"?this.worldQuaternion:ns;this.gizmo.translate.visible=this.mode==="translate",this.gizmo.rotate.visible=this.mode==="rotate",this.gizmo.scale.visible=this.mode==="scale",this.helper.translate.visible=this.mode==="translate",this.helper.rotate.visible=this.mode==="rotate",this.helper.scale.visible=this.mode==="scale";let i=[];i=i.concat(this.picker[this.mode].children),i=i.concat(this.gizmo[this.mode].children),i=i.concat(this.helper[this.mode].children);for(let s=0;s<i.length;s++){const a=i[s];a.visible=!0,a.rotation.set(0,0,0),a.position.copy(this.worldPosition);let o;if(this.camera.isOrthographicCamera?o=(this.camera.top-this.camera.bottom)/this.camera.zoom:o=this.worldPosition.distanceTo(this.cameraPosition)*Math.min(1.9*Math.tan(Math.PI*this.camera.fov/360)/this.camera.zoom,7),a.scale.set(1,1,1).multiplyScalar(o*this.size/4),a.tag==="helper"){a.visible=!1,a.name==="AXIS"?(a.visible=!!this.axis,this.axis==="X"&&(mt.setFromEuler(Kr.set(0,0,0)),a.quaternion.copy(n).multiply(mt),Math.abs(ct.copy(cr).applyQuaternion(n).dot(this.eye))>.9&&(a.visible=!1)),this.axis==="Y"&&(mt.setFromEuler(Kr.set(0,0,Math.PI/2)),a.quaternion.copy(n).multiply(mt),Math.abs(ct.copy(si).applyQuaternion(n).dot(this.eye))>.9&&(a.visible=!1)),this.axis==="Z"&&(mt.setFromEuler(Kr.set(0,Math.PI/2,0)),a.quaternion.copy(n).multiply(mt),Math.abs(ct.copy(ur).applyQuaternion(n).dot(this.eye))>.9&&(a.visible=!1)),this.axis==="XYZE"&&(mt.setFromEuler(Kr.set(0,Math.PI/2,0)),ct.copy(this.rotationAxis),a.quaternion.setFromRotationMatrix(Cc.lookAt(Sc,ct,si)),a.quaternion.multiply(mt),a.visible=this.dragging),this.axis==="E"&&(a.visible=!1)):a.name==="START"?(a.position.copy(this.worldPositionStart),a.visible=this.dragging):a.name==="END"?(a.position.copy(this.worldPosition),a.visible=this.dragging):a.name==="DELTA"?(a.position.copy(this.worldPositionStart),a.quaternion.copy(this.worldQuaternionStart),Qt.set(1e-10,1e-10,1e-10).add(this.worldPositionStart).sub(this.worldPosition).multiplyScalar(-1),Qt.applyQuaternion(this.worldQuaternionStart.clone().invert()),a.scale.copy(Qt),a.visible=this.dragging):(a.quaternion.copy(n),this.dragging?a.position.copy(this.worldPositionStart):a.position.copy(this.worldPosition),this.axis&&(a.visible=this.axis.search(a.name)!==-1));continue}a.quaternion.copy(n),this.mode==="translate"||this.mode==="scale"?(a.name==="X"&&Math.abs(ct.copy(cr).applyQuaternion(n).dot(this.eye))>.99&&(a.scale.set(1e-10,1e-10,1e-10),a.visible=!1),a.name==="Y"&&Math.abs(ct.copy(si).applyQuaternion(n).dot(this.eye))>.99&&(a.scale.set(1e-10,1e-10,1e-10),a.visible=!1),a.name==="Z"&&Math.abs(ct.copy(ur).applyQuaternion(n).dot(this.eye))>.99&&(a.scale.set(1e-10,1e-10,1e-10),a.visible=!1),a.name==="XY"&&Math.abs(ct.copy(ur).applyQuaternion(n).dot(this.eye))<.2&&(a.scale.set(1e-10,1e-10,1e-10),a.visible=!1),a.name==="YZ"&&Math.abs(ct.copy(cr).applyQuaternion(n).dot(this.eye))<.2&&(a.scale.set(1e-10,1e-10,1e-10),a.visible=!1),a.name==="XZ"&&Math.abs(ct.copy(si).applyQuaternion(n).dot(this.eye))<.2&&(a.scale.set(1e-10,1e-10,1e-10),a.visible=!1)):this.mode==="rotate"&&(Jr.copy(n),ct.copy(this.eye).applyQuaternion(mt.copy(n).invert()),a.name.search("E")!==-1&&a.quaternion.setFromRotationMatrix(Cc.lookAt(this.eye,Sc,si)),a.name==="X"&&(mt.setFromAxisAngle(cr,Math.atan2(-ct.y,ct.z)),mt.multiplyQuaternions(Jr,mt),a.quaternion.copy(mt)),a.name==="Y"&&(mt.setFromAxisAngle(si,Math.atan2(ct.x,ct.z)),mt.multiplyQuaternions(Jr,mt),a.quaternion.copy(mt)),a.name==="Z"&&(mt.setFromAxisAngle(ur,Math.atan2(ct.y,ct.x)),mt.multiplyQuaternions(Jr,mt),a.quaternion.copy(mt))),a.visible=a.visible&&(a.name.indexOf("X")===-1||this.showX),a.visible=a.visible&&(a.name.indexOf("Y")===-1||this.showY),a.visible=a.visible&&(a.name.indexOf("Z")===-1||this.showZ),a.visible=a.visible&&(a.name.indexOf("E")===-1||this.showX&&this.showY&&this.showZ),a.material._color=a.material._color||a.material.color.clone(),a.material._opacity=a.material._opacity||a.material.opacity,a.material.color.copy(a.material._color),a.material.opacity=a.material._opacity,this.enabled&&this.axis&&(a.name===this.axis||this.axis.split("").some(function(l){return a.name===l}))&&(a.material.color.setHex(16776960),a.material.opacity=1)}super.updateMatrixWorld(e)}}class z2 extends Ce{constructor(){super(new bs(1e5,1e5,2,2),new gs({visible:!1,wireframe:!0,side:zn,transparent:!0,opacity:.1,toneMapped:!1})),this.isTransformControlsPlane=!0,this.type="TransformControlsPlane"}updateMatrixWorld(e){let t=this.space;switch(this.position.copy(this.worldPosition),this.mode==="scale"&&(t="local"),Qr.copy(cr).applyQuaternion(t==="local"?this.worldQuaternion:ns),ir.copy(si).applyQuaternion(t==="local"?this.worldQuaternion:ns),rr.copy(ur).applyQuaternion(t==="local"?this.worldQuaternion:ns),ct.copy(ir),this.mode){case"translate":case"scale":switch(this.axis){case"X":ct.copy(this.eye).cross(Qr),Mn.copy(Qr).cross(ct);break;case"Y":ct.copy(this.eye).cross(ir),Mn.copy(ir).cross(ct);break;case"Z":ct.copy(this.eye).cross(rr),Mn.copy(rr).cross(ct);break;case"XY":Mn.copy(rr);break;case"YZ":Mn.copy(Qr);break;case"XZ":ct.copy(rr),Mn.copy(ir);break;case"XYZ":case"E":Mn.set(0,0,0);break}break;case"rotate":default:Mn.set(0,0,0)}Mn.length()===0?this.quaternion.copy(this.cameraQuaternion):(Tc.lookAt(Qt.set(0,0,0),Mn,ct),this.quaternion.setFromRotationMatrix(Tc)),super.updateMatrixWorld(e)}}function Ec(r){let e;return{c(){e=z("div"),L(e,"class","gizmo")},m(t,n){B(t,e,n)},d(t){t&&U(e)}}}function F2(r){let e,t=r[0].handle&&Ec();return{c(){t&&t.c(),e=Dt()},m(n,i){t&&t.m(n,i),B(n,e,i)},p(n,[i]){n[0].handle?t||(t=Ec(),t.c(),t.m(e.parentNode,e)):t&&(t.d(1),t=null)},i:_e,o:_e,d(n){t&&t.d(n),n&&U(e)}}}function Lc(r,e){return r>0&&r<90?e:r>-180&&r<-90||r>0?-e:e}function O2(r,e,t){let n,i,{gizmoData:s,gizmoCamData:a}=dr;ut(r,s,E=>t(0,i=E)),ut(r,a,E=>t(5,n=E)),lt(()=>{i.handle&&(w(i),v(),x(),g())});let o,l,c,u,f,d,m,h,p,_=!1;function g(){f&&f.render(u,l)}function v(){f=new Ca({alpha:!0}),f.setPixelRatio(window.devicePixelRatio),f.setSize(window.innerWidth,window.innerHeight),document.body.appendChild(f.domElement);const E=window.innerWidth/window.innerHeight;o=new dn(45,E,.01),l=o,l.lookAt(0,200,0),d=new P2(l,f.domElement),d.addEventListener("change",g),d.addEventListener("objectChange",M=>{_||b()}),d.attach(c),d.showX=!0,d.showY=!0,d.showZ=!0,d.size=.5,u.add(d),window.addEventListener("keydown",async function(M){if(!_)switch(M.keyCode){case 90:d.setMode("translate");break;case 82:d.setMode("rotate");break;case 27:await De("closeGizmo"),y();break;case 69:await De("placeObject"),await De("closeGizmo"),y();break}})}function b(){const E={handle:m,position:{x:c.position.x,y:-c.position.z,z:c.position.y},rotation:{x:Ln.radToDeg(c.rotation.x),y:Ln.radToDeg(-c.rotation.z),z:Ln.radToDeg(c.rotation.y)}};De("gizmo-object-update",E)}function w(E){!E.handle||(u=new E2,c=new Ce,u.add(c),t(3,m=E.handle),c.position.set(E.position.x,E.position.z,-E.position.y),c.rotation.order="YZX",c.rotation.set(Ln.degToRad(E.rotation.x),Ln.degToRad(Lc(E.rotation.x,E.rotation.z)),Ln.degToRad(E.rotation.y)))}function y(){_=!0,f.domElement.remove(),t(3,m=null),u.remove(c),f=null,c=null,t(4,h=null),p=null,l=null,d=null}function x(){_||(t(4,h=n.camCords),p=n.camRot,l.position.set(h.x,h.z,-h.y),l.rotation.order="YZX",l.rotation.set(Ln.degToRad(p.x),Ln.degToRad(Lc(p.x,p.z)),Ln.degToRad(p.y)))}return r.$$.update=()=>{r.$$.dirty&56&&n.camCords!==h&&m&&x()},[i,s,a,m,h,n]}class U2 extends We{constructor(e){super(),He(this,e,O2,F2,Ge,{})}}function B2(r){let e,t,n,i,s,a,o,l,c,u,f,d,m;return{c(){e=z("div"),t=z("div"),t.textContent="Key Binds",n=K(),i=z("div"),s=z("p"),s.textContent=`${r[1].press_Z_gizmo_helper}`,a=K(),o=z("p"),o.textContent=`${r[1].press_R_gizmo_helper}`,l=K(),c=z("p"),c.textContent=`${r[1].press_E_gizmo_helper}`,u=K(),f=z("p"),f.textContent=`${r[1].press_esc_gizmo_helper}`,d=K(),m=z("p"),m.textContent=`${r[1].press_alt_gizmo_helper}`,L(t,"class","heading"),L(i,"class","body"),L(e,"class","gizmo-helper-main")},m(h,p){B(h,e,p),C(e,t),C(e,n),C(e,i),C(i,s),C(i,a),C(i,o),C(i,l),C(i,c),C(i,u),C(i,f),C(i,d),C(i,m)},p:_e,i:_e,o:_e,d(h){h&&U(e)}}}function V2(r,e,t){let n,{locales:i}=vt;return ut(r,i,a=>t(2,n=a)),[i,n]}class G2 extends We{constructor(e){super(),He(this,e,V2,B2,Ge,{})}}function H2(r){let e,t,n,i;return e=new U2({}),n=new G2({}),{c(){ee(e.$$.fragment),t=K(),ee(n.$$.fragment)},m(s,a){Q(e,s,a),B(s,t,a),Q(n,s,a),i=!0},i(s){i||(A(e.$$.fragment,s),A(n.$$.fragment,s),i=!0)},o(s){I(e.$$.fragment,s),I(n.$$.fragment,s),i=!1},d(s){$(e,s),s&&U(t),$(n,s)}}}function W2(r){let e,t;return e=new lm({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function X2(r){let e,t;return e=new im({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Pc(r){let e,t;return e=new um({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},i(n){t||(A(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function j2(r){let e,t,n,i,s;const a=[X2,W2,H2],o=[];function l(u,f){return u[0]?0:u[1]?1:u[2]?2:-1}~(e=l(r))&&(t=o[e]=a[e](r));let c=r[3]&&Pc();return{c(){t&&t.c(),n=K(),c&&c.c(),i=Dt()},m(u,f){~e&&o[e].m(u,f),B(u,n,f),c&&c.m(u,f),B(u,i,f),s=!0},p(u,[f]){let d=e;e=l(u),e!==d&&(t&&(Pe(),I(o[d],1,1,()=>{o[d]=null}),Ae()),~e?(t=o[e],t||(t=o[e]=a[e](u),t.c()),A(t,1),t.m(n.parentNode,n)):t=null),u[3]?c?f&8&&A(c,1):(c=Pc(),c.c(),A(c,1),c.m(i.parentNode,i)):c&&(Pe(),I(c,1,1,()=>{c=null}),Ae())},i(u){s||(A(t),A(c),s=!0)},o(u){I(t),I(c),s=!1},d(u){~e&&o[e].d(u),u&&U(n),c&&c.d(u),u&&U(i)}}}function q2(r,e,t){let n,i,s,a;Ku();let{show:o}=vt;ut(r,o,f=>t(0,n=f));let{showReport:l}=_r;ut(r,l,f=>t(1,i=f));let{unreadReport:c}=oa;ut(r,c,f=>t(3,a=f));let{showObject:u}=dr;return ut(r,u,f=>t(2,s=f)),document.onkeyup=vt.handleKeyUp,[n,i,s,a,o,l,c,u]}class Y2 extends We{constructor(e){super(),He(this,e,q2,j2,Ge,{})}}new Y2({target:document.getElementById("app")});
