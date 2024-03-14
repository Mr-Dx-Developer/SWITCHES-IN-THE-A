import{f as Ue,A as f,au as yt,av as Ct,R as Ze,P as Je,l as i,a1 as Ot,aw as Ft,x as re,s as w,v as R,a4 as Ke,a2 as te,y as Te,k as ne,ax as Tt,h as z,ay as Oe,Q as Fe,a7 as St,aa as He,j as Xe,az as Rt,ak as Le,E as Mt,L as Pt,a3 as _t,g as It,aA as Bt,a6 as Ye,aB as zt,a5 as At,ab as $t,ac as Ne,V as kt,T as Et,U as Dt,Y as Wt,Z as Vt,aC as Lt,$ as qe,a0 as jt,ad as Nt,G as N,_ as Ut,o as Kt,c as Ht,I as Yt,u as qt}from"./index-1c6b3dd3.js";import{a as Gt,p as je,f as Qt,c as Zt}from"./utils-96123b18.js";import{u as Jt,c as Xt,N as en}from"./SelectMenu-49f9a701.js";import{u as tn}from"./use-locale-119c58a2.js";import{N as nn}from"./Suffix-067b8130.js";import{g as on}from"./attribute-2ee9e579.js";import{h as Ge}from"./FocusDetector-bd94bb6c.js";import"./VirtualList-e7fe5725.js";import"./Empty-168292b7.js";const Q="v-hidden",ln=Ft("[v-hidden]",{display:"none!important"}),Qe=Ue({name:"Overflow",props:{getCounter:Function,getTail:Function,updateCounter:Function,onUpdateOverflow:Function},setup(e,{slots:F}){const b=f(null),h=f(null);function g(){const{value:_}=b,{getCounter:a,getTail:I}=e;let v;if(a!==void 0?v=a():v=h.value,!_||!v)return;v.hasAttribute(Q)&&v.removeAttribute(Q);const{children:T}=_,B=_.offsetWidth,P=[],S=F.tail?I==null?void 0:I():null;let p=S?S.offsetWidth:0,y=!1;const k=_.children.length-(F.tail?1:0);for(let x=0;x<k-1;++x){if(x<0)continue;const D=T[x];if(y){D.hasAttribute(Q)||D.setAttribute(Q,"");continue}else D.hasAttribute(Q)&&D.removeAttribute(Q);const V=D.offsetWidth;if(p+=V,P[x]=V,p>B){const{updateCounter:W}=e;for(let O=x;O>=0;--O){const A=k-1-O;W!==void 0?W(A):v.textContent=`${A}`;const L=v.offsetWidth;if(p-=P[O],p+L<=B||O===0){y=!0,x=O-1,S&&(x===-1?(S.style.maxWidth=`${B-L}px`,S.style.boxSizing="border-box"):S.style.maxWidth="");break}}}}const{onUpdateOverflow:C}=e;y?C!==void 0&&C(!0):(C!==void 0&&C(!1),v.setAttribute(Q,""))}const E=yt();return ln.mount({id:"vueuc/overflow",head:!0,anchorMetaName:Ct,ssr:E}),Ze(g),{selfRef:b,counterRef:h,sync:g}},render(){const{$slots:e}=this;return Je(this.sync),i("div",{class:"v-overflow",ref:"selfRef"},[Ot(e,"default"),e.counter?e.counter():i("span",{style:{display:"inline-block"},ref:"counterRef"}),e.tail?e.tail():null])}}),an=re([w("base-selection",`
 position: relative;
 z-index: auto;
 box-shadow: none;
 width: 100%;
 max-width: 100%;
 display: inline-block;
 vertical-align: bottom;
 border-radius: var(--n-border-radius);
 min-height: var(--n-height);
 line-height: 1.5;
 font-size: var(--n-font-size);
 `,[w("base-loading",`
 color: var(--n-loading-color);
 `),w("base-selection-tags","min-height: var(--n-height);"),R("border, state-border",`
 position: absolute;
 left: 0;
 right: 0;
 top: 0;
 bottom: 0;
 pointer-events: none;
 border: var(--n-border);
 border-radius: inherit;
 transition:
 box-shadow .3s var(--n-bezier),
 border-color .3s var(--n-bezier);
 `),R("state-border",`
 z-index: 1;
 border-color: #0000;
 `),w("base-suffix",`
 cursor: pointer;
 position: absolute;
 top: 50%;
 transform: translateY(-50%);
 right: 10px;
 `,[R("arrow",`
 font-size: var(--n-arrow-size);
 color: var(--n-arrow-color);
 transition: color .3s var(--n-bezier);
 `)]),w("base-selection-overlay",`
 display: flex;
 align-items: center;
 white-space: nowrap;
 pointer-events: none;
 position: absolute;
 top: 0;
 right: 0;
 bottom: 0;
 left: 0;
 padding: var(--n-padding-single);
 transition: color .3s var(--n-bezier);
 `,[R("wrapper",`
 flex-basis: 0;
 flex-grow: 1;
 overflow: hidden;
 text-overflow: ellipsis;
 `)]),w("base-selection-placeholder",`
 color: var(--n-placeholder-color);
 `,[R("inner",`
 max-width: 100%;
 overflow: hidden;
 `)]),w("base-selection-tags",`
 cursor: pointer;
 outline: none;
 box-sizing: border-box;
 position: relative;
 z-index: auto;
 display: flex;
 padding: var(--n-padding-multiple);
 flex-wrap: wrap;
 align-items: center;
 width: 100%;
 vertical-align: bottom;
 background-color: var(--n-color);
 border-radius: inherit;
 transition:
 color .3s var(--n-bezier),
 box-shadow .3s var(--n-bezier),
 background-color .3s var(--n-bezier);
 `),w("base-selection-label",`
 height: var(--n-height);
 display: inline-flex;
 width: 100%;
 vertical-align: bottom;
 cursor: pointer;
 outline: none;
 z-index: auto;
 box-sizing: border-box;
 position: relative;
 transition:
 color .3s var(--n-bezier),
 box-shadow .3s var(--n-bezier),
 background-color .3s var(--n-bezier);
 border-radius: inherit;
 background-color: var(--n-color);
 align-items: center;
 `,[w("base-selection-input",`
 font-size: inherit;
 line-height: inherit;
 outline: none;
 cursor: pointer;
 box-sizing: border-box;
 border:none;
 width: 100%;
 padding: var(--n-padding-single);
 background-color: #0000;
 color: var(--n-text-color);
 transition: color .3s var(--n-bezier);
 caret-color: var(--n-caret-color);
 `,[R("content",`
 text-overflow: ellipsis;
 overflow: hidden;
 white-space: nowrap; 
 `)]),R("render-label",`
 color: var(--n-text-color);
 `)]),Ke("disabled",[re("&:hover",[R("state-border",`
 box-shadow: var(--n-box-shadow-hover);
 border: var(--n-border-hover);
 `)]),te("focus",[R("state-border",`
 box-shadow: var(--n-box-shadow-focus);
 border: var(--n-border-focus);
 `)]),te("active",[R("state-border",`
 box-shadow: var(--n-box-shadow-active);
 border: var(--n-border-active);
 `),w("base-selection-label","background-color: var(--n-color-active);"),w("base-selection-tags","background-color: var(--n-color-active);")])]),te("disabled","cursor: not-allowed;",[R("arrow",`
 color: var(--n-arrow-color-disabled);
 `),w("base-selection-label",`
 cursor: not-allowed;
 background-color: var(--n-color-disabled);
 `,[w("base-selection-input",`
 cursor: not-allowed;
 color: var(--n-text-color-disabled);
 `),R("render-label",`
 color: var(--n-text-color-disabled);
 `)]),w("base-selection-tags",`
 cursor: not-allowed;
 background-color: var(--n-color-disabled);
 `),w("base-selection-placeholder",`
 cursor: not-allowed;
 color: var(--n-placeholder-color-disabled);
 `)]),w("base-selection-input-tag",`
 height: calc(var(--n-height) - 6px);
 line-height: calc(var(--n-height) - 6px);
 outline: none;
 display: none;
 position: relative;
 margin-bottom: 3px;
 max-width: 100%;
 vertical-align: bottom;
 `,[R("input",`
 font-size: inherit;
 font-family: inherit;
 min-width: 1px;
 padding: 0;
 background-color: #0000;
 outline: none;
 border: none;
 max-width: 100%;
 overflow: hidden;
 width: 1em;
 line-height: inherit;
 cursor: pointer;
 color: var(--n-text-color);
 caret-color: var(--n-caret-color);
 `),R("mirror",`
 position: absolute;
 left: 0;
 top: 0;
 white-space: pre;
 visibility: hidden;
 user-select: none;
 -webkit-user-select: none;
 opacity: 0;
 `)]),["warning","error"].map(e=>te(`${e}-status`,[R("state-border",`border: var(--n-border-${e});`),Ke("disabled",[re("&:hover",[R("state-border",`
 box-shadow: var(--n-box-shadow-hover-${e});
 border: var(--n-border-hover-${e});
 `)]),te("active",[R("state-border",`
 box-shadow: var(--n-box-shadow-active-${e});
 border: var(--n-border-active-${e});
 `),w("base-selection-label",`background-color: var(--n-color-active-${e});`),w("base-selection-tags",`background-color: var(--n-color-active-${e});`)]),te("focus",[R("state-border",`
 box-shadow: var(--n-box-shadow-focus-${e});
 border: var(--n-border-focus-${e});
 `)])])]))]),w("base-selection-popover",`
 margin-bottom: -3px;
 display: flex;
 flex-wrap: wrap;
 margin-right: -8px;
 `),w("base-selection-tag-wrapper",`
 max-width: 100%;
 display: inline-flex;
 padding: 0 7px 3px 0;
 `,[re("&:last-child","padding-right: 0;"),w("tag",`
 font-size: 14px;
 max-width: 100%;
 `,[R("content",`
 line-height: 1.25;
 text-overflow: ellipsis;
 overflow: hidden;
 `)])])]),rn=Ue({name:"InternalSelection",props:Object.assign(Object.assign({},Te.props),{clsPrefix:{type:String,required:!0},bordered:{type:Boolean,default:void 0},active:Boolean,pattern:{type:String,default:""},placeholder:String,selectedOption:{type:Object,default:null},selectedOptions:{type:Array,default:null},labelField:{type:String,default:"label"},valueField:{type:String,default:"value"},multiple:Boolean,filterable:Boolean,clearable:Boolean,disabled:Boolean,size:{type:String,default:"medium"},loading:Boolean,autofocus:Boolean,showArrow:{type:Boolean,default:!0},inputProps:Object,focused:Boolean,renderTag:Function,onKeydown:Function,onClick:Function,onBlur:Function,onFocus:Function,onDeleteOption:Function,maxTagCount:[String,Number],onClear:Function,onPatternInput:Function,onPatternFocus:Function,onPatternBlur:Function,renderLabel:Function,status:String,inlineThemeDisabled:Boolean,ignoreComposition:{type:Boolean,default:!0},onResize:Function}),setup(e){const F=f(null),b=f(null),h=f(null),g=f(null),E=f(null),_=f(null),a=f(null),I=f(null),v=f(null),T=f(null),B=f(!1),P=f(!1),S=f(!1),p=Te("InternalSelection","-internal-selection",an,Tt,e,ne(e,"clsPrefix")),y=z(()=>e.clearable&&!e.disabled&&(S.value||e.active)),k=z(()=>e.selectedOption?e.renderTag?e.renderTag({option:e.selectedOption,handleClose:()=>{}}):e.renderLabel?e.renderLabel(e.selectedOption,!0):Oe(e.selectedOption[e.labelField],e.selectedOption,!0):e.placeholder),C=z(()=>{const n=e.selectedOption;if(n)return n[e.labelField]}),x=z(()=>e.multiple?!!(Array.isArray(e.selectedOptions)&&e.selectedOptions.length):e.selectedOption!==null);function D(){var n;const{value:l}=F;if(l){const{value:m}=b;m&&(m.style.width=`${l.offsetWidth}px`,e.maxTagCount!=="responsive"&&((n=v.value)===null||n===void 0||n.sync()))}}function V(){const{value:n}=T;n&&(n.style.display="none")}function W(){const{value:n}=T;n&&(n.style.display="inline-block")}Fe(ne(e,"active"),n=>{n||V()}),Fe(ne(e,"pattern"),()=>{e.multiple&&Je(D)});function O(n){const{onFocus:l}=e;l&&l(n)}function A(n){const{onBlur:l}=e;l&&l(n)}function L(n){const{onDeleteOption:l}=e;l&&l(n)}function oe(n){const{onClear:l}=e;l&&l(n)}function U(n){const{onPatternInput:l}=e;l&&l(n)}function Z(n){var l;(!n.relatedTarget||!(!((l=h.value)===null||l===void 0)&&l.contains(n.relatedTarget)))&&O(n)}function $(n){var l;!((l=h.value)===null||l===void 0)&&l.contains(n.relatedTarget)||A(n)}function le(n){oe(n)}function se(){S.value=!0}function ue(){S.value=!1}function J(n){!e.active||!e.filterable||n.target!==b.value&&n.preventDefault()}function de(n){L(n)}function X(n){if(n.key==="Backspace"&&!q.value&&!e.pattern.length){const{selectedOptions:l}=e;l!=null&&l.length&&de(l[l.length-1])}}const q=f(!1);let K=null;function ce(n){const{value:l}=F;if(l){const m=n.target.value;l.textContent=m,D()}e.ignoreComposition&&q.value?K=n:U(n)}function Se(){q.value=!0}function Re(){q.value=!1,e.ignoreComposition&&U(K),K=null}function Me(n){var l;P.value=!0,(l=e.onPatternFocus)===null||l===void 0||l.call(e,n)}function Pe(n){var l;P.value=!1,(l=e.onPatternBlur)===null||l===void 0||l.call(e,n)}function fe(){var n,l;if(e.filterable)P.value=!1,(n=_.value)===null||n===void 0||n.blur(),(l=b.value)===null||l===void 0||l.blur();else if(e.multiple){const{value:m}=g;m==null||m.blur()}else{const{value:m}=E;m==null||m.blur()}}function he(){var n,l,m;e.filterable?(P.value=!1,(n=_.value)===null||n===void 0||n.focus()):e.multiple?(l=g.value)===null||l===void 0||l.focus():(m=E.value)===null||m===void 0||m.focus()}function G(){const{value:n}=b;n&&(W(),n.focus())}function j(){const{value:n}=b;n&&n.blur()}function ve(n){const{value:l}=a;l&&l.setTextContent(`+${n}`)}function ee(){const{value:n}=I;return n}function _e(){return b.value}let ae=null;function ie(){ae!==null&&window.clearTimeout(ae)}function Ie(){e.disabled||e.active||(ie(),ae=window.setTimeout(()=>{x.value&&(B.value=!0)},100))}function Be(){ie()}function ze(n){n||(ie(),B.value=!1)}Fe(x,n=>{n||(B.value=!1)}),Ze(()=>{St(()=>{const n=_.value;n&&(n.tabIndex=e.disabled||P.value?-1:0)})}),Jt(h,e.onResize);const{inlineThemeDisabled:be}=e,ge=z(()=>{const{size:n}=e,{common:{cubicBezierEaseInOut:l},self:{borderRadius:m,color:pe,placeholderColor:Ae,textColor:$e,paddingSingle:ke,paddingMultiple:Ee,caretColor:me,colorDisabled:we,textColorDisabled:xe,placeholderColorDisabled:De,colorActive:We,boxShadowFocus:ye,boxShadowActive:Y,boxShadowHover:t,border:o,borderFocus:r,borderHover:c,borderActive:s,arrowColor:d,arrowColorDisabled:u,loadingColor:M,colorActiveWarning:Ce,boxShadowFocusWarning:Ve,boxShadowActiveWarning:et,boxShadowHoverWarning:tt,borderWarning:nt,borderFocusWarning:ot,borderHoverWarning:lt,borderActiveWarning:at,colorActiveError:it,boxShadowFocusError:rt,boxShadowActiveError:st,boxShadowHoverError:ut,borderError:dt,borderFocusError:ct,borderHoverError:ft,borderActiveError:ht,clearColor:vt,clearColorHover:bt,clearColorPressed:gt,clearSize:pt,arrowSize:mt,[He("height",n)]:wt,[He("fontSize",n)]:xt}}=p.value;return{"--n-bezier":l,"--n-border":o,"--n-border-active":s,"--n-border-focus":r,"--n-border-hover":c,"--n-border-radius":m,"--n-box-shadow-active":Y,"--n-box-shadow-focus":ye,"--n-box-shadow-hover":t,"--n-caret-color":me,"--n-color":pe,"--n-color-active":We,"--n-color-disabled":we,"--n-font-size":xt,"--n-height":wt,"--n-padding-single":ke,"--n-padding-multiple":Ee,"--n-placeholder-color":Ae,"--n-placeholder-color-disabled":De,"--n-text-color":$e,"--n-text-color-disabled":xe,"--n-arrow-color":d,"--n-arrow-color-disabled":u,"--n-loading-color":M,"--n-color-active-warning":Ce,"--n-box-shadow-focus-warning":Ve,"--n-box-shadow-active-warning":et,"--n-box-shadow-hover-warning":tt,"--n-border-warning":nt,"--n-border-focus-warning":ot,"--n-border-hover-warning":lt,"--n-border-active-warning":at,"--n-color-active-error":it,"--n-box-shadow-focus-error":rt,"--n-box-shadow-active-error":st,"--n-box-shadow-hover-error":ut,"--n-border-error":dt,"--n-border-focus-error":ct,"--n-border-hover-error":ft,"--n-border-active-error":ht,"--n-clear-size":pt,"--n-clear-color":vt,"--n-clear-color-hover":bt,"--n-clear-color-pressed":gt,"--n-arrow-size":mt}}),H=be?Xe("internal-selection",z(()=>e.size[0]),ge,e):void 0;return{mergedTheme:p,mergedClearable:y,patternInputFocused:P,filterablePlaceholder:k,label:C,selected:x,showTagsPanel:B,isComposing:q,counterRef:a,counterWrapperRef:I,patternInputMirrorRef:F,patternInputRef:b,selfRef:h,multipleElRef:g,singleElRef:E,patternInputWrapperRef:_,overflowRef:v,inputTagElRef:T,handleMouseDown:J,handleFocusin:Z,handleClear:le,handleMouseEnter:se,handleMouseLeave:ue,handleDeleteOption:de,handlePatternKeyDown:X,handlePatternInputInput:ce,handlePatternInputBlur:Pe,handlePatternInputFocus:Me,handleMouseEnterCounter:Ie,handleMouseLeaveCounter:Be,handleFocusout:$,handleCompositionEnd:Re,handleCompositionStart:Se,onPopoverUpdateShow:ze,focus:he,focusInput:G,blur:fe,blurInput:j,updateCounter:ve,getCounter:ee,getTail:_e,renderLabel:e.renderLabel,cssVars:be?void 0:ge,themeClass:H==null?void 0:H.themeClass,onRender:H==null?void 0:H.onRender}},render(){const{status:e,multiple:F,size:b,disabled:h,filterable:g,maxTagCount:E,bordered:_,clsPrefix:a,onRender:I,renderTag:v,renderLabel:T}=this;I==null||I();const B=E==="responsive",P=typeof E=="number",S=B||P,p=i(Rt,null,{default:()=>i(nn,{clsPrefix:a,loading:this.loading,showArrow:this.showArrow,showClear:this.mergedClearable&&this.selected,onClear:this.handleClear},{default:()=>{var k,C;return(C=(k=this.$slots).arrow)===null||C===void 0?void 0:C.call(k)}})});let y;if(F){const{labelField:k}=this,C=$=>i("div",{class:`${a}-base-selection-tag-wrapper`,key:$.value},v?v({option:$,handleClose:()=>{this.handleDeleteOption($)}}):i(Le,{size:b,closable:!$.disabled,disabled:h,onClose:()=>{this.handleDeleteOption($)},internalCloseIsButtonTag:!1,internalCloseFocusable:!1},{default:()=>T?T($,!0):Oe($[k],$,!0)})),x=()=>(P?this.selectedOptions.slice(0,E):this.selectedOptions).map(C),D=g?i("div",{class:`${a}-base-selection-input-tag`,ref:"inputTagElRef",key:"__input-tag__"},i("input",Object.assign({},this.inputProps,{ref:"patternInputRef",tabindex:-1,disabled:h,value:this.pattern,autofocus:this.autofocus,class:`${a}-base-selection-input-tag__input`,onBlur:this.handlePatternInputBlur,onFocus:this.handlePatternInputFocus,onKeydown:this.handlePatternKeyDown,onInput:this.handlePatternInputInput,onCompositionstart:this.handleCompositionStart,onCompositionend:this.handleCompositionEnd})),i("span",{ref:"patternInputMirrorRef",class:`${a}-base-selection-input-tag__mirror`},this.pattern)):null,V=B?()=>i("div",{class:`${a}-base-selection-tag-wrapper`,ref:"counterWrapperRef"},i(Le,{size:b,ref:"counterRef",onMouseenter:this.handleMouseEnterCounter,onMouseleave:this.handleMouseLeaveCounter,disabled:h})):void 0;let W;if(P){const $=this.selectedOptions.length-E;$>0&&(W=i("div",{class:`${a}-base-selection-tag-wrapper`,key:"__counter__"},i(Le,{size:b,ref:"counterRef",onMouseenter:this.handleMouseEnterCounter,disabled:h},{default:()=>`+${$}`})))}const O=B?g?i(Qe,{ref:"overflowRef",updateCounter:this.updateCounter,getCounter:this.getCounter,getTail:this.getTail,style:{width:"100%",display:"flex",overflow:"hidden"}},{default:x,counter:V,tail:()=>D}):i(Qe,{ref:"overflowRef",updateCounter:this.updateCounter,getCounter:this.getCounter,style:{width:"100%",display:"flex",overflow:"hidden"}},{default:x,counter:V}):P?x().concat(W):x(),A=S?()=>i("div",{class:`${a}-base-selection-popover`},B?x():this.selectedOptions.map(C)):void 0,L=S?{show:this.showTagsPanel,trigger:"hover",overlap:!0,placement:"top",width:"trigger",onUpdateShow:this.onPopoverUpdateShow,theme:this.mergedTheme.peers.Popover,themeOverrides:this.mergedTheme.peerOverrides.Popover}:null,U=(this.selected?!1:this.active?!this.pattern&&!this.isComposing:!0)?i("div",{class:`${a}-base-selection-placeholder ${a}-base-selection-overlay`},i("div",{class:`${a}-base-selection-placeholder__inner`},this.placeholder)):null,Z=g?i("div",{ref:"patternInputWrapperRef",class:`${a}-base-selection-tags`},O,B?null:D,p):i("div",{ref:"multipleElRef",class:`${a}-base-selection-tags`,tabindex:h?void 0:0},O,p);y=i(Pt,null,S?i(Mt,Object.assign({},L,{scrollable:!0,style:"max-height: calc(var(--v-target-height) * 6.6);"}),{trigger:()=>Z,default:A}):Z,U)}else if(g){const k=this.pattern||this.isComposing,C=this.active?!k:!this.selected,x=this.active?!1:this.selected;y=i("div",{ref:"patternInputWrapperRef",class:`${a}-base-selection-label`},i("input",Object.assign({},this.inputProps,{ref:"patternInputRef",class:`${a}-base-selection-input`,value:this.active?this.pattern:"",placeholder:"",readonly:h,disabled:h,tabindex:-1,autofocus:this.autofocus,onFocus:this.handlePatternInputFocus,onBlur:this.handlePatternInputBlur,onInput:this.handlePatternInputInput,onCompositionstart:this.handleCompositionStart,onCompositionend:this.handleCompositionEnd})),x?i("div",{class:`${a}-base-selection-label__render-label ${a}-base-selection-overlay`,key:"input"},i("div",{class:`${a}-base-selection-overlay__wrapper`},v?v({option:this.selectedOption,handleClose:()=>{}}):T?T(this.selectedOption,!0):Oe(this.label,this.selectedOption,!0))):null,C?i("div",{class:`${a}-base-selection-placeholder ${a}-base-selection-overlay`,key:"placeholder"},i("div",{class:`${a}-base-selection-overlay__wrapper`},this.filterablePlaceholder)):null,p)}else y=i("div",{ref:"singleElRef",class:`${a}-base-selection-label`,tabindex:this.disabled?void 0:0},this.label!==void 0?i("div",{class:`${a}-base-selection-input`,title:on(this.label),key:"input"},i("div",{class:`${a}-base-selection-input__content`},v?v({option:this.selectedOption,handleClose:()=>{}}):T?T(this.selectedOption,!0):Oe(this.label,this.selectedOption,!0))):i("div",{class:`${a}-base-selection-placeholder ${a}-base-selection-overlay`,key:"placeholder"},i("div",{class:`${a}-base-selection-placeholder__inner`},this.placeholder)),p);return i("div",{ref:"selfRef",class:[`${a}-base-selection`,this.themeClass,e&&`${a}-base-selection--${e}-status`,{[`${a}-base-selection--active`]:this.active,[`${a}-base-selection--selected`]:this.selected||this.active&&this.pattern,[`${a}-base-selection--disabled`]:this.disabled,[`${a}-base-selection--multiple`]:this.multiple,[`${a}-base-selection--focus`]:this.focused}],style:this.cssVars,onClick:this.onClick,onMouseenter:this.handleMouseEnter,onMouseleave:this.handleMouseLeave,onKeydown:this.onKeydown,onFocusin:this.handleFocusin,onFocusout:this.handleFocusout,onMousedown:this.handleMouseDown},y,_?i("div",{class:`${a}-base-selection__border`}):null,_?i("div",{class:`${a}-base-selection__state-border`}):null)}}),sn=re([w("select",`
 z-index: auto;
 outline: none;
 width: 100%;
 position: relative;
 `),w("select-menu",`
 margin: 4px 0;
 box-shadow: var(--n-menu-box-shadow);
 `,[_t({originalTransition:"background-color .3s var(--n-bezier), box-shadow .3s var(--n-bezier)"})])]),un=Object.assign(Object.assign({},Te.props),{to:Ne.propTo,bordered:{type:Boolean,default:void 0},clearable:Boolean,clearFilterAfterSelect:{type:Boolean,default:!0},options:{type:Array,default:()=>[]},defaultValue:{type:[String,Number,Array],default:null},keyboard:{type:Boolean,default:!0},value:[String,Number,Array],placeholder:String,menuProps:Object,multiple:Boolean,size:String,filterable:Boolean,disabled:{type:Boolean,default:void 0},remote:Boolean,loading:Boolean,filter:Function,placement:{type:String,default:"bottom-start"},widthMode:{type:String,default:"trigger"},tag:Boolean,onCreate:Function,fallbackOption:{type:[Function,Boolean],default:void 0},show:{type:Boolean,default:void 0},showArrow:{type:Boolean,default:!0},maxTagCount:[Number,String],consistentMenuWidth:{type:Boolean,default:!0},virtualScroll:{type:Boolean,default:!0},labelField:{type:String,default:"label"},valueField:{type:String,default:"value"},childrenField:{type:String,default:"children"},renderLabel:Function,renderOption:Function,renderTag:Function,"onUpdate:value":[Function,Array],inputProps:Object,nodeProps:Function,ignoreComposition:{type:Boolean,default:!0},showOnFocus:Boolean,onUpdateValue:[Function,Array],onBlur:[Function,Array],onClear:[Function,Array],onFocus:[Function,Array],onScroll:[Function,Array],onSearch:[Function,Array],onUpdateShow:[Function,Array],"onUpdate:show":[Function,Array],displayDirective:{type:String,default:"show"},resetMenuOnOptionsChange:{type:Boolean,default:!0},status:String,showCheckmark:{type:Boolean,default:!0},onChange:[Function,Array],items:Array}),dn=Ue({name:"Select",props:un,setup(e){const{mergedClsPrefixRef:F,mergedBorderedRef:b,namespaceRef:h,inlineThemeDisabled:g}=It(e),E=Te("Select","-select",sn,Bt,e,F),_=f(e.defaultValue),a=ne(e,"value"),I=Ye(a,_),v=f(!1),T=f(""),B=z(()=>{const{valueField:t,childrenField:o}=e,r=Zt(t,o);return Xt($.value,r)}),P=z(()=>Gt(U.value,e.valueField,e.childrenField)),S=f(!1),p=Ye(ne(e,"show"),S),y=f(null),k=f(null),C=f(null),{localeRef:x}=tn("Select"),D=z(()=>{var t;return(t=e.placeholder)!==null&&t!==void 0?t:x.value.placeholder}),V=zt(e,["items","options"]),W=[],O=f([]),A=f([]),L=f(new Map),oe=z(()=>{const{fallbackOption:t}=e;if(t===void 0){const{labelField:o,valueField:r}=e;return c=>({[o]:String(c),[r]:c})}return t===!1?!1:o=>Object.assign(t(o),{value:o})}),U=z(()=>A.value.concat(O.value).concat(V.value)),Z=z(()=>{const{filter:t}=e;if(t)return t;const{labelField:o,valueField:r}=e;return(c,s)=>{if(!s)return!1;const d=s[o];if(typeof d=="string")return je(c,d);const u=s[r];return typeof u=="string"?je(c,u):typeof u=="number"?je(c,String(u)):!1}}),$=z(()=>{if(e.remote)return V.value;{const{value:t}=U,{value:o}=T;return!o.length||!e.filterable?t:Qt(t,Z.value,o,e.childrenField)}});function le(t){const o=e.remote,{value:r}=L,{value:c}=P,{value:s}=oe,d=[];return t.forEach(u=>{if(c.has(u))d.push(c.get(u));else if(o&&r.has(u))d.push(r.get(u));else if(s){const M=s(u);M&&d.push(M)}}),d}const se=z(()=>{if(e.multiple){const{value:t}=I;return Array.isArray(t)?le(t):[]}return null}),ue=z(()=>{const{value:t}=I;return!e.multiple&&!Array.isArray(t)?t===null?null:le([t])[0]||null:null}),J=At(e),{mergedSizeRef:de,mergedDisabledRef:X,mergedStatusRef:q}=J;function K(t,o){const{onChange:r,"onUpdate:value":c,onUpdateValue:s}=e,{nTriggerFormChange:d,nTriggerFormInput:u}=J;r&&N(r,t,o),s&&N(s,t,o),c&&N(c,t,o),_.value=t,d(),u()}function ce(t){const{onBlur:o}=e,{nTriggerFormBlur:r}=J;o&&N(o,t),r()}function Se(){const{onClear:t}=e;t&&N(t)}function Re(t){const{onFocus:o,showOnFocus:r}=e,{nTriggerFormFocus:c}=J;o&&N(o,t),c(),r&&G()}function Me(t){const{onSearch:o}=e;o&&N(o,t)}function Pe(t){const{onScroll:o}=e;o&&N(o,t)}function fe(){var t;const{remote:o,multiple:r}=e;if(o){const{value:c}=L;if(r){const{valueField:s}=e;(t=se.value)===null||t===void 0||t.forEach(d=>{c.set(d[s],d)})}else{const s=ue.value;s&&c.set(s[e.valueField],s)}}}function he(t){const{onUpdateShow:o,"onUpdate:show":r}=e;o&&N(o,t),r&&N(r,t),S.value=t}function G(){X.value||(he(!0),S.value=!0,e.filterable&&xe())}function j(){he(!1)}function ve(){T.value="",A.value=W}const ee=f(!1);function _e(){e.filterable&&(ee.value=!0)}function ae(){e.filterable&&(ee.value=!1,p.value||ve())}function ie(){X.value||(p.value?e.filterable?xe():j():G())}function Ie(t){var o,r;!((r=(o=C.value)===null||o===void 0?void 0:o.selfRef)===null||r===void 0)&&r.contains(t.relatedTarget)||(v.value=!1,ce(t),j())}function Be(t){Re(t),v.value=!0}function ze(t){v.value=!0}function be(t){var o;!((o=y.value)===null||o===void 0)&&o.$el.contains(t.relatedTarget)||(v.value=!1,ce(t),j())}function ge(){var t;(t=y.value)===null||t===void 0||t.focus(),j()}function H(t){var o;p.value&&(!((o=y.value)===null||o===void 0)&&o.$el.contains(jt(t))||j())}function n(t){if(!Array.isArray(t))return[];if(oe.value)return Array.from(t);{const{remote:o}=e,{value:r}=P;if(o){const{value:c}=L;return t.filter(s=>r.has(s)||c.has(s))}else return t.filter(c=>r.has(c))}}function l(t){m(t.rawNode)}function m(t){if(X.value)return;const{tag:o,remote:r,clearFilterAfterSelect:c,valueField:s}=e;if(o&&!r){const{value:d}=A,u=d[0]||null;if(u){const M=O.value;M.length?M.push(u):O.value=[u],A.value=W}}if(r&&L.value.set(t[s],t),e.multiple){const d=n(I.value),u=d.findIndex(M=>M===t[s]);if(~u){if(d.splice(u,1),o&&!r){const M=pe(t[s]);~M&&(O.value.splice(M,1),c&&(T.value=""))}}else d.push(t[s]),c&&(T.value="");K(d,le(d))}else{if(o&&!r){const d=pe(t[s]);~d?O.value=[O.value[d]]:O.value=W}we(),j(),K(t[s],t)}}function pe(t){return O.value.findIndex(r=>r[e.valueField]===t)}function Ae(t){p.value||G();const{value:o}=t.target;T.value=o;const{tag:r,remote:c}=e;if(Me(o),r&&!c){if(!o){A.value=W;return}const{onCreate:s}=e,d=s?s(o):{[e.labelField]:o,[e.valueField]:o},{valueField:u}=e;V.value.some(M=>M[u]===d[u])||O.value.some(M=>M[u]===d[u])?A.value=W:A.value=[d]}}function $e(t){t.stopPropagation();const{multiple:o}=e;!o&&e.filterable&&j(),Se(),o?K([],[]):K(null,null)}function ke(t){!Ge(t,"action")&&!Ge(t,"empty")&&t.preventDefault()}function Ee(t){Pe(t)}function me(t){var o,r,c,s,d;if(!e.keyboard){t.preventDefault();return}switch(t.key){case" ":if(e.filterable)break;t.preventDefault();case"Enter":if(!(!((o=y.value)===null||o===void 0)&&o.isComposing)){if(p.value){const u=(r=C.value)===null||r===void 0?void 0:r.getPendingTmNode();u?l(u):e.filterable||(j(),we())}else if(G(),e.tag&&ee.value){const u=A.value[0];if(u){const M=u[e.valueField],{value:Ce}=I;e.multiple&&Array.isArray(Ce)&&Ce.some(Ve=>Ve===M)||m(u)}}}t.preventDefault();break;case"ArrowUp":if(t.preventDefault(),e.loading)return;p.value&&((c=C.value)===null||c===void 0||c.prev());break;case"ArrowDown":if(t.preventDefault(),e.loading)return;p.value?(s=C.value)===null||s===void 0||s.next():G();break;case"Escape":p.value&&(Nt(t),j()),(d=y.value)===null||d===void 0||d.focus();break}}function we(){var t;(t=y.value)===null||t===void 0||t.focus()}function xe(){var t;(t=y.value)===null||t===void 0||t.focusInput()}function De(){var t;p.value&&((t=k.value)===null||t===void 0||t.syncPosition())}fe(),Fe(ne(e,"options"),fe);const We={focus:()=>{var t;(t=y.value)===null||t===void 0||t.focus()},blur:()=>{var t;(t=y.value)===null||t===void 0||t.blur()}},ye=z(()=>{const{self:{menuBoxShadow:t}}=E.value;return{"--n-menu-box-shadow":t}}),Y=g?Xe("select",void 0,ye,e):void 0;return Object.assign(Object.assign({},We),{mergedStatus:q,mergedClsPrefix:F,mergedBordered:b,namespace:h,treeMate:B,isMounted:$t(),triggerRef:y,menuRef:C,pattern:T,uncontrolledShow:S,mergedShow:p,adjustedTo:Ne(e),uncontrolledValue:_,mergedValue:I,followerRef:k,localizedPlaceholder:D,selectedOption:ue,selectedOptions:se,mergedSize:de,mergedDisabled:X,focused:v,activeWithoutMenuOpen:ee,inlineThemeDisabled:g,onTriggerInputFocus:_e,onTriggerInputBlur:ae,handleTriggerOrMenuResize:De,handleMenuFocus:ze,handleMenuBlur:be,handleMenuTabOut:ge,handleTriggerClick:ie,handleToggle:l,handleDeleteOption:m,handlePatternInput:Ae,handleClear:$e,handleTriggerBlur:Ie,handleTriggerFocus:Be,handleKeydown:me,handleMenuAfterLeave:ve,handleMenuClickOutside:H,handleMenuScroll:Ee,handleMenuKeydown:me,handleMenuMousedown:ke,mergedTheme:E,cssVars:g?void 0:ye,themeClass:Y==null?void 0:Y.themeClass,onRender:Y==null?void 0:Y.onRender})},render(){return i("div",{class:`${this.mergedClsPrefix}-select`},i(kt,null,{default:()=>[i(Et,null,{default:()=>i(rn,{ref:"triggerRef",inlineThemeDisabled:this.inlineThemeDisabled,status:this.mergedStatus,inputProps:this.inputProps,clsPrefix:this.mergedClsPrefix,showArrow:this.showArrow,maxTagCount:this.maxTagCount,bordered:this.mergedBordered,active:this.activeWithoutMenuOpen||this.mergedShow,pattern:this.pattern,placeholder:this.localizedPlaceholder,selectedOption:this.selectedOption,selectedOptions:this.selectedOptions,multiple:this.multiple,renderTag:this.renderTag,renderLabel:this.renderLabel,filterable:this.filterable,clearable:this.clearable,disabled:this.mergedDisabled,size:this.mergedSize,theme:this.mergedTheme.peers.InternalSelection,labelField:this.labelField,valueField:this.valueField,themeOverrides:this.mergedTheme.peerOverrides.InternalSelection,loading:this.loading,focused:this.focused,onClick:this.handleTriggerClick,onDeleteOption:this.handleDeleteOption,onPatternInput:this.handlePatternInput,onClear:this.handleClear,onBlur:this.handleTriggerBlur,onFocus:this.handleTriggerFocus,onKeydown:this.handleKeydown,onPatternBlur:this.onTriggerInputBlur,onPatternFocus:this.onTriggerInputFocus,onResize:this.handleTriggerOrMenuResize,ignoreComposition:this.ignoreComposition},{arrow:()=>{var e,F;return[(F=(e=this.$slots).arrow)===null||F===void 0?void 0:F.call(e)]}})}),i(Dt,{ref:"followerRef",show:this.mergedShow,to:this.adjustedTo,teleportDisabled:this.adjustedTo===Ne.tdkey,containerClass:this.namespace,width:this.consistentMenuWidth?"target":void 0,minWidth:"target",placement:this.placement},{default:()=>i(Wt,{name:"fade-in-scale-up-transition",appear:this.isMounted,onAfterLeave:this.handleMenuAfterLeave},{default:()=>{var e,F,b;return this.mergedShow||this.displayDirective==="show"?((e=this.onRender)===null||e===void 0||e.call(this),Vt(i(en,Object.assign({},this.menuProps,{ref:"menuRef",onResize:this.handleTriggerOrMenuResize,inlineThemeDisabled:this.inlineThemeDisabled,virtualScroll:this.consistentMenuWidth&&this.virtualScroll,class:[`${this.mergedClsPrefix}-select-menu`,this.themeClass,(F=this.menuProps)===null||F===void 0?void 0:F.class],clsPrefix:this.mergedClsPrefix,focusable:!0,labelField:this.labelField,valueField:this.valueField,autoPending:!0,nodeProps:this.nodeProps,theme:this.mergedTheme.peers.InternalSelectMenu,themeOverrides:this.mergedTheme.peerOverrides.InternalSelectMenu,treeMate:this.treeMate,multiple:this.multiple,size:"medium",renderOption:this.renderOption,renderLabel:this.renderLabel,value:this.mergedValue,style:[(b=this.menuProps)===null||b===void 0?void 0:b.style,this.cssVars],onToggle:this.handleToggle,onScroll:this.handleMenuScroll,onFocus:this.handleMenuFocus,onBlur:this.handleMenuBlur,onKeydown:this.handleMenuKeydown,onTabOut:this.handleMenuTabOut,onMousedown:this.handleMenuMousedown,show:this.mergedShow,showCheckmark:this.showCheckmark,resetMenuOnOptionsChange:this.resetMenuOnOptionsChange}),{empty:()=>{var h,g;return[(g=(h=this.$slots).empty)===null||g===void 0?void 0:g.call(h)]},action:()=>{var h,g;return[(g=(h=this.$slots).action)===null||g===void 0?void 0:g.call(h)]}}),this.displayDirective==="show"?[[Lt,this.mergedShow],[qe,this.handleMenuClickOutside,void 0,{capture:!0}]]:[[qe,this.handleMenuClickOutside,void 0,{capture:!0}]])):null}})})]}))}});const cn={__name:"Select",props:{field:Object},setup(e){return(F,b)=>(Kt(),Ht("div",null,[Yt(qt(dn),{value:e.field.value,"onUpdate:value":b[0]||(b[0]=h=>e.field.value=h),filterable:e.field.filterable,placeholder:e.field.placeholder,options:e.field.options,multiple:e.field.multiple},null,8,["value","filterable","placeholder","options","multiple"])]))}},yn=Ut(cn,[["__scopeId","data-v-873e2c38"]]);export{yn as default};
