import{f as w,l as t,ae as Re,af as Te,aR as ze,aS as ye,ag as ke,aT as Fe,ah as Oe,aU as Le,aV as we,e as Pe,i as U,N as q,ao as Ve,aW as Ae,A as B,S as E,p as _e,a6 as Be,k as N,h as b,s as p,a2 as _,v as g,x as W,a4 as $e,g as Ie,y as J,a5 as Ne,aa as L,aG as Ue,B as De,ab as He,G as M,_ as Me,o as Ee,b as je,u as qe}from"./index-1c6b3dd3.js";import{u as We}from"./use-locale-119c58a2.js";import{g as Ke}from"./attribute-2ee9e579.js";import{N as Ge}from"./Checkbox-0b9880cf.js";import{N as Xe}from"./Empty-168292b7.js";import{V as Ye}from"./VirtualList-e7fe5725.js";import{N as Je}from"./Input-d45cf124.js";import"./Suffix-067b8130.js";const Qe=w({name:"Search",render(){return t("svg",{version:"1.1",xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 512 512",style:"enable-background: new 0 0 512 512"},t("path",{d:`M443.5,420.2L336.7,312.4c20.9-26.2,33.5-59.4,33.5-95.5c0-84.5-68.5-153-153.1-153S64,132.5,64,217s68.5,153,153.1,153
  c36.6,0,70.1-12.8,96.5-34.2l106.1,107.1c3.2,3.4,7.6,5.1,11.9,5.1c4.1,0,8.2-1.5,11.3-4.5C449.5,437.2,449.7,426.8,443.5,420.2z
   M217.1,337.1c-32.1,0-62.3-12.5-85-35.2c-22.7-22.7-35.2-52.9-35.2-84.9c0-32.1,12.5-62.3,35.2-84.9c22.7-22.7,52.9-35.2,85-35.2
  c32.1,0,62.3,12.5,85,35.2c22.7,22.7,35.2,52.9,35.2,84.9c0,32.1-12.5,62.3-35.2,84.9C279.4,324.6,249.2,337.1,217.1,337.1z`}))}}),Ze=e=>{const{fontWeight:o,fontSizeLarge:l,fontSizeMedium:i,fontSizeSmall:d,heightLarge:n,heightMedium:c,borderRadius:a,cardColor:u,tableHeaderColor:f,textColor1:x,textColorDisabled:m,textColor2:k,textColor3:C,borderColor:v,hoverColor:S,closeColorHover:z,closeColorPressed:y,closeIconColor:P,closeIconColorHover:V,closeIconColorPressed:r}=e;return Object.assign(Object.assign({},Le),{itemHeightSmall:c,itemHeightMedium:c,itemHeightLarge:n,fontSizeSmall:d,fontSizeMedium:i,fontSizeLarge:l,borderRadius:a,dividerColor:v,borderColor:v,listColor:u,headerColor:we(u,f),titleTextColor:x,titleTextColorDisabled:m,extraTextColor:C,extraTextColorDisabled:m,itemTextColor:k,itemTextColorDisabled:m,itemColorPending:S,titleFontWeight:o,closeColorHover:z,closeColorPressed:y,closeIconColor:P,closeIconColorHover:V,closeIconColorPressed:r})},er=Re({name:"Transfer",common:Te,peers:{Checkbox:ze,Scrollbar:ye,Input:ke,Empty:Fe,Button:Oe},self:Ze}),rr=er,$=Pe("n-transfer"),K=w({name:"TransferHeader",props:{size:{type:String,required:!0},source:Boolean,onCheckedAll:Function,onClearAll:Function,title:String},setup(e){const{targetOptionsRef:o,canNotSelectAnythingRef:l,canBeClearedRef:i,allCheckedRef:d,mergedThemeRef:n,disabledRef:c,mergedClsPrefixRef:a,srcOptionsLengthRef:u}=U($),{localeRef:f}=We("Transfer");return()=>{const{source:x,onClearAll:m,onCheckedAll:k}=e,{value:C}=n,{value:v}=a,{value:S}=f,z=e.size==="large"?"small":"tiny",{title:y}=e;return t("div",{class:`${v}-transfer-list-header`},y&&t("div",{class:`${v}-transfer-list-header__title`},y),x&&t(q,{class:`${v}-transfer-list-header__button`,theme:C.peers.Button,themeOverrides:C.peerOverrides.Button,size:z,tertiary:!0,onClick:d.value?m:k,disabled:l.value||c.value},{default:()=>d.value?S.unselectAll:S.selectAll}),!x&&i.value&&t(q,{class:`${v}-transfer-list-header__button`,theme:C.peers.Button,themeOverrides:C.peerOverrides.Button,size:z,tertiary:!0,onClick:m,disabled:c.value},{default:()=>S.clearAll}),t("div",{class:`${v}-transfer-list-header__extra`},x?S.total(u.value):S.selected(o.value.length)))}}}),G=w({name:"NTransferListItem",props:{source:Boolean,label:{type:String,required:!0},value:{type:[String,Number],required:!0},disabled:Boolean,option:{type:Object,required:!0}},setup(e){const{targetValueSetRef:o,mergedClsPrefixRef:l,mergedThemeRef:i,handleItemCheck:d,renderSourceLabelRef:n,renderTargetLabelRef:c,showSelectedRef:a}=U($),u=Ve(()=>o.value.has(e.value));function f(){e.disabled||d(!u.value,e.value)}return{mergedClsPrefix:l,mergedTheme:i,checked:u,showSelected:a,renderSourceLabel:n,renderTargetLabel:c,handleClick:f}},render(){const{disabled:e,mergedTheme:o,mergedClsPrefix:l,label:i,checked:d,source:n,renderSourceLabel:c,renderTargetLabel:a}=this;return t("div",{class:[`${l}-transfer-list-item`,e&&`${l}-transfer-list-item--disabled`,n?`${l}-transfer-list-item--source`:`${l}-transfer-list-item--target`],onClick:n?this.handleClick:void 0},t("div",{class:`${l}-transfer-list-item__background`}),n&&this.showSelected&&t("div",{class:`${l}-transfer-list-item__checkbox`},t(Ge,{theme:o.peers.Checkbox,themeOverrides:o.peerOverrides.Checkbox,disabled:e,checked:d})),t("div",{class:`${l}-transfer-list-item__label`,title:Ke(i)},n?c?c({option:this.option}):i:a?a({option:this.option}):i),!n&&!e&&t(Ae,{focusable:!1,class:`${l}-transfer-list-item__close`,clsPrefix:l,onClick:this.handleClick}))}}),X=w({name:"TransferList",props:{virtualScroll:{type:Boolean,required:!0},itemSize:{type:Number,required:!0},options:{type:Array,required:!0},disabled:{type:Boolean,required:!0},source:Boolean},setup(){const{mergedThemeRef:e,mergedClsPrefixRef:o}=U($),l=B(null),i=B(null);function d(){var a;(a=l.value)===null||a===void 0||a.sync()}function n(){const{value:a}=i;if(!a)return null;const{listElRef:u}=a;return u}function c(){const{value:a}=i;if(!a)return null;const{itemsElRef:u}=a;return u}return{mergedTheme:e,mergedClsPrefix:o,scrollerInstRef:l,vlInstRef:i,syncVLScroller:d,scrollContainer:n,scrollContent:c}},render(){const{mergedTheme:e,options:o}=this;if(o.length===0)return t(Xe,{theme:e.peers.Empty,themeOverrides:e.peerOverrides.Empty});const{mergedClsPrefix:l,virtualScroll:i,source:d,disabled:n,syncVLScroller:c}=this;return t(E,{ref:"scrollerInstRef",theme:e.peers.Scrollbar,themeOverrides:e.peerOverrides.Scrollbar,container:i?this.scrollContainer:void 0,content:i?this.scrollContent:void 0},{default:()=>i?t(Ye,{ref:"vlInstRef",style:{height:"100%"},class:`${l}-transfer-list-content`,items:this.options,itemSize:this.itemSize,showScrollbar:!1,onResize:c,onScroll:c,keyField:"value"},{default:({item:a})=>{const{source:u,disabled:f}=this;return t(G,{source:u,key:a.value,value:a.value,disabled:a.disabled||f,label:a.label,option:a})}}):t("div",{class:`${l}-transfer-list-content`},o.map(a=>t(G,{source:d,key:a.value,value:a.value,disabled:a.disabled||n,label:a.label,option:a})))})}}),Y=w({name:"TransferFilter",props:{value:String,placeholder:String,disabled:Boolean,onUpdateValue:{type:Function,required:!0}},setup(){const{mergedThemeRef:e,mergedClsPrefixRef:o}=U($);return{mergedClsPrefix:o,mergedTheme:e}},render(){const{mergedTheme:e,mergedClsPrefix:o}=this;return t("div",{class:`${o}-transfer-filter`},t(Je,{value:this.value,onUpdateValue:this.onUpdateValue,disabled:this.disabled,placeholder:this.placeholder,theme:e.peers.Input,themeOverrides:e.peerOverrides.Input,clearable:!0,size:"small"},{"clear-icon-placeholder":()=>t(_e,{clsPrefix:o},{default:()=>t(Qe,null)})}))}});function tr(e){const o=B(e.defaultValue),l=Be(N(e,"value"),o),i=b(()=>{const r=new Map;return(e.options||[]).forEach(s=>r.set(s.value,s)),r}),d=b(()=>new Set(l.value||[])),n=b(()=>{const r=i.value,s=[];return(l.value||[]).forEach(A=>{const R=r.get(A);R&&s.push(R)}),s}),c=B(""),a=B(""),u=b(()=>e.sourceFilterable||!!e.filterable),f=b(()=>{const{showSelected:r,options:s,filter:A}=e;return u.value?s.filter(R=>A(c.value,R,"source")&&(r||!d.value.has(R.value))):r?s:s.filter(R=>!d.value.has(R.value))}),x=b(()=>{if(!e.targetFilterable)return n.value;const{filter:r}=e;return n.value.filter(s=>r(a.value,s,"target"))}),m=b(()=>{const{value:r}=l;return r===null?new Set:new Set(r)}),k=b(()=>{const r=new Set(m.value);return f.value.forEach(s=>{!s.disabled&&!r.has(s.value)&&r.add(s.value)}),r}),C=b(()=>{const r=new Set(m.value);return f.value.forEach(s=>{!s.disabled&&r.has(s.value)&&r.delete(s.value)}),r}),v=b(()=>{const r=new Set(m.value);return x.value.forEach(s=>{s.disabled||r.delete(s.value)}),r}),S=b(()=>f.value.every(r=>r.disabled)),z=b(()=>{if(!f.value.length)return!1;const r=m.value;return f.value.every(s=>s.disabled||r.has(s.value))}),y=b(()=>x.value.some(r=>!r.disabled));function P(r){c.value=r??""}function V(r){a.value=r??""}return{uncontrolledValueRef:o,mergedValueRef:l,targetValueSetRef:d,valueSetForCheckAllRef:k,valueSetForUncheckAllRef:C,valueSetForClearRef:v,filteredTgtOptionsRef:x,filteredSrcOptionsRef:f,targetOptionsRef:n,canNotSelectAnythingRef:S,canBeClearedRef:y,allCheckedRef:z,srcPatternRef:c,tgtPatternRef:a,mergedSrcFilterableRef:u,handleSrcFilterUpdateValue:P,handleTgtFilterUpdateValue:V}}const lr=p("transfer",`
 width: 100%;
 font-size: var(--n-font-size);
 height: 300px;
 display: flex;
 flex-wrap: nowrap;
 word-break: break-word;
`,[_("disabled",[p("transfer-list",[p("transfer-list-header",[g("title",`
 color: var(--n-header-text-color-disabled);
 `),g("extra",`
 color: var(--n-header-extra-text-color-disabled);
 `)])])]),p("transfer-list",`
 flex: 1;
 min-width: 0;
 height: inherit;
 display: flex;
 flex-direction: column;
 background-clip: padding-box;
 position: relative;
 transition: background-color .3s var(--n-bezier);
 background-color: var(--n-list-color);
 `,[_("source",`
 border-top-left-radius: var(--n-border-radius);
 border-bottom-left-radius: var(--n-border-radius);
 `,[g("border","border-right: 1px solid var(--n-divider-color);")]),_("target",`
 border-top-right-radius: var(--n-border-radius);
 border-bottom-right-radius: var(--n-border-radius);
 `,[g("border","border-left: none;")]),g("border",`
 padding: 0 12px;
 border: 1px solid var(--n-border-color);
 transition: border-color .3s var(--n-bezier);
 pointer-events: none;
 border-radius: inherit;
 position: absolute;
 left: 0;
 right: 0;
 top: 0;
 bottom: 0;
 `),p("transfer-list-header",`
 min-height: var(--n-header-height);
 box-sizing: border-box;
 display: flex;
 padding: 12px 12px 10px 12px;
 align-items: center;
 background-clip: padding-box;
 border-radius: inherit;
 border-bottom-left-radius: 0;
 border-bottom-right-radius: 0;
 line-height: 1.5;
 transition:
 border-color .3s var(--n-bezier),
 background-color .3s var(--n-bezier);
 `,[W("> *:not(:first-child)",`
 margin-left: 8px;
 `),g("title",`
 flex: 1;
 min-width: 0;
 line-height: 1.5;
 font-size: var(--n-header-font-size);
 font-weight: var(--n-header-font-weight);
 transition: color .3s var(--n-bezier);
 color: var(--n-header-text-color);
 `),g("button",`
 position: relative;
 `),g("extra",`
 transition: color .3s var(--n-bezier);
 font-size: var(--n-extra-font-size);
 margin-right: 0;
 white-space: nowrap;
 color: var(--n-header-extra-text-color);
 `)]),p("transfer-list-body",`
 flex-basis: 0;
 flex-grow: 1;
 box-sizing: border-box;
 position: relative;
 display: flex;
 flex-direction: column;
 border-radius: inherit;
 border-top-left-radius: 0;
 border-top-right-radius: 0;
 `,[p("transfer-filter",`
 padding: 4px 12px 8px 12px;
 box-sizing: border-box;
 transition:
 border-color .3s var(--n-bezier),
 background-color .3s var(--n-bezier);
 `),p("transfer-list-flex-container",`
 flex: 1;
 position: relative;
 `,[p("scrollbar",`
 position: absolute;
 left: 0;
 right: 0;
 top: 0;
 bottom: 0;
 height: unset;
 `),p("empty",`
 position: absolute;
 left: 50%;
 top: 50%;
 transform: translateY(-50%) translateX(-50%);
 `),p("transfer-list-content",`
 padding: 0;
 margin: 0;
 position: relative;
 `,[p("transfer-list-item",`
 padding: 0 12px;
 min-height: var(--n-item-height);
 display: flex;
 align-items: center;
 color: var(--n-item-text-color);
 position: relative;
 transition: color .3s var(--n-bezier);
 `,[g("background",`
 position: absolute;
 left: 4px;
 right: 4px;
 top: 0;
 bottom: 0;
 border-radius: var(--n-border-radius);
 transition: background-color .3s var(--n-bezier);
 `),g("checkbox",`
 position: relative;
 margin-right: 8px;
 `),g("close",`
 opacity: 0;
 pointer-events: none;
 position: relative;
 transition:
 opacity .3s var(--n-bezier),
 background-color .3s var(--n-bezier),
 color .3s var(--n-bezier);
 `),g("label",`
 position: relative;
 min-width: 0;
 flex-grow: 1;
 `),_("source","cursor: pointer;"),_("disabled",`
 cursor: not-allowed;
 color: var(--n-item-text-color-disabled);
 `),$e("disabled",[W("&:hover",[g("background","background-color: var(--n-item-color-pending);"),g("close",`
 opacity: 1;
 pointer-events: all;
 `)])])])])])])])]),ar=Object.assign(Object.assign({},J.props),{value:Array,defaultValue:{type:Array,default:null},options:{type:Array,default:()=>[]},disabled:{type:Boolean,default:void 0},virtualScroll:Boolean,sourceTitle:String,targetTitle:String,filterable:{type:Boolean,default:void 0},sourceFilterable:Boolean,targetFilterable:Boolean,showSelected:{type:Boolean,default:!0},sourceFilterPlaceholder:String,targetFilterPlaceholder:String,filter:{type:Function,default:(e,o)=>e?~(""+o.label).toLowerCase().indexOf((""+e).toLowerCase()):!0},size:String,renderSourceLabel:Function,renderTargetLabel:Function,renderSourceList:Function,renderTargetList:Function,"onUpdate:value":[Function,Array],onUpdateValue:[Function,Array],onChange:[Function,Array]}),or=w({name:"Transfer",props:ar,setup(e){const{mergedClsPrefixRef:o}=Ie(e),l=J("Transfer","-transfer",lr,rr,e,o),i=Ne(e),{mergedSizeRef:d,mergedDisabledRef:n}=i,c=b(()=>{const{value:h}=d,{self:{[L("itemHeight",h)]:T}}=l.value;return Ue(T)}),{uncontrolledValueRef:a,mergedValueRef:u,targetValueSetRef:f,valueSetForCheckAllRef:x,valueSetForUncheckAllRef:m,valueSetForClearRef:k,filteredTgtOptionsRef:C,filteredSrcOptionsRef:v,targetOptionsRef:S,canNotSelectAnythingRef:z,canBeClearedRef:y,allCheckedRef:P,srcPatternRef:V,tgtPatternRef:r,mergedSrcFilterableRef:s,handleSrcFilterUpdateValue:A,handleTgtFilterUpdateValue:R}=tr(e);function F(h){const{onUpdateValue:T,"onUpdate:value":O,onChange:I}=e,{nTriggerFormInput:D,nTriggerFormChange:H}=i;T&&M(T,h),O&&M(O,h),I&&M(I,h),a.value=h,D(),H()}function Q(){F([...x.value])}function Z(){F([...m.value])}function ee(){F([...k.value])}function j(h,T){F(h?(u.value||[]).concat(T):(u.value||[]).filter(O=>O!==T))}function re(h){F(h)}return De($,{targetValueSetRef:f,mergedClsPrefixRef:o,disabledRef:n,mergedThemeRef:l,targetOptionsRef:S,canNotSelectAnythingRef:z,canBeClearedRef:y,allCheckedRef:P,srcOptionsLengthRef:b(()=>e.options.length),handleItemCheck:j,renderSourceLabelRef:N(e,"renderSourceLabel"),renderTargetLabelRef:N(e,"renderTargetLabel"),showSelectedRef:N(e,"showSelected")}),{mergedClsPrefix:o,mergedDisabled:n,itemSize:c,isMounted:He(),mergedTheme:l,filteredSrcOpts:v,filteredTgtOpts:C,srcPattern:V,tgtPattern:r,mergedSize:d,mergedSrcFilterable:s,handleSrcFilterUpdateValue:A,handleTgtFilterUpdateValue:R,handleSourceCheckAll:Q,handleSourceUncheckAll:Z,handleTargetClearAll:ee,handleItemCheck:j,handleChecked:re,cssVars:b(()=>{const{value:h}=d,{common:{cubicBezierEaseInOut:T},self:{borderRadius:O,borderColor:I,listColor:D,titleTextColor:H,titleTextColorDisabled:te,extraTextColor:le,itemTextColor:ae,itemColorPending:oe,itemTextColorDisabled:ie,titleFontWeight:se,closeColorHover:ne,closeColorPressed:de,closeIconColor:ce,closeIconColorHover:ue,closeIconColorPressed:fe,closeIconSize:he,closeSize:be,dividerColor:ge,extraTextColorDisabled:me,[L("extraFontSize",h)]:ve,[L("fontSize",h)]:pe,[L("titleFontSize",h)]:xe,[L("itemHeight",h)]:Se,[L("headerHeight",h)]:Ce}}=l.value;return{"--n-bezier":T,"--n-border-color":I,"--n-border-radius":O,"--n-extra-font-size":ve,"--n-font-size":pe,"--n-header-font-size":xe,"--n-header-extra-text-color":le,"--n-header-extra-text-color-disabled":me,"--n-header-font-weight":se,"--n-header-text-color":H,"--n-header-text-color-disabled":te,"--n-item-color-pending":oe,"--n-item-height":Se,"--n-item-text-color":ae,"--n-item-text-color-disabled":ie,"--n-list-color":D,"--n-header-height":Ce,"--n-close-size":be,"--n-close-icon-size":he,"--n-close-color-hover":ne,"--n-close-color-pressed":de,"--n-close-icon-color":ce,"--n-close-icon-color-hover":ue,"--n-close-icon-color-pressed":fe,"--n-divider-color":ge}})}},render(){const{mergedClsPrefix:e,renderSourceList:o,renderTargetList:l,mergedTheme:i,mergedSrcFilterable:d,targetFilterable:n}=this;return t("div",{class:[`${e}-transfer`,this.mergedDisabled&&`${e}-transfer--disabled`],style:this.cssVars},t("div",{class:`${e}-transfer-list ${e}-transfer-list--source`},t(K,{source:!0,title:this.sourceTitle,onCheckedAll:this.handleSourceCheckAll,onClearAll:this.handleSourceUncheckAll,size:this.mergedSize}),t("div",{class:`${e}-transfer-list-body`},d?t(Y,{onUpdateValue:this.handleSrcFilterUpdateValue,value:this.srcPattern,disabled:this.mergedDisabled,placeholder:this.sourceFilterPlaceholder}):null,t("div",{class:`${e}-transfer-list-flex-container`},o?t(E,{theme:i.peers.Scrollbar,themeOverrides:i.peerOverrides.Scrollbar},{default:()=>o({onCheck:this.handleChecked,checkedOptions:this.filteredTgtOpts,pattern:this.srcPattern})}):t(X,{source:!0,options:this.filteredSrcOpts,disabled:this.mergedDisabled,virtualScroll:this.virtualScroll,itemSize:this.itemSize}))),t("div",{class:`${e}-transfer-list__border`})),t("div",{class:`${e}-transfer-list ${e}-transfer-list--target`},t(K,{onClearAll:this.handleTargetClearAll,size:this.mergedSize,title:this.targetTitle}),t("div",{class:`${e}-transfer-list-body`},n?t(Y,{onUpdateValue:this.handleTgtFilterUpdateValue,value:this.tgtPattern,disabled:this.mergedDisabled,placeholder:this.sourceFilterPlaceholder}):null,t("div",{class:`${e}-transfer-list-flex-container`},l?t(E,{theme:i.peers.Scrollbar,themeOverrides:i.peerOverrides.Scrollbar},{default:()=>l({onCheck:this.handleChecked,checkedOptions:this.filteredTgtOpts,pattern:this.tgtPattern})}):t(X,{options:this.filteredTgtOpts,disabled:this.mergedDisabled,virtualScroll:this.virtualScroll,itemSize:this.itemSize}))),t("div",{class:`${e}-transfer-list__border`})))}});const ir={__name:"TransferSelect",props:{field:Object},setup(e){return(o,l)=>{var i,d;return Ee(),je(qe(or),{ref:"transfer",value:e.field.value,"onUpdate:value":l[0]||(l[0]=n=>e.field.value=n),"virtual-scroll":!0,options:e.field.options,"source-filterable":(i=e.field.filterable)==null?void 0:i.source,"target-filterable":(d=e.field.filterable)==null?void 0:d.target},null,8,["value","options","source-filterable","target-filterable"])}}},gr=Me(ir,[["__scopeId","data-v-5a72ab31"]]);export{gr as default};
