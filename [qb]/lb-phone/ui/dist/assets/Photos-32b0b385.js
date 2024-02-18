import{r as c,j as s,a as v,F as H}from"./jsx-runtime-f40812bf.js";import{f as N,L as m,C,t as B,B as U,g as X,b as x,N as A}from"./Phone-6f7ce284.js";import{ad as b,u as k,P as D,m as V,a0 as F,ax as G}from"./index.esm-3d32a72b.js";import{r as z}from"./number-28525126.js";import{C as _}from"./Check-0b024d45.js";function Q(){const h=c.useRef(null),[E,S]=c.useState(!1),[i,T]=c.useState([]),[d,P]=c.useState(null),[u,p]=c.useState([]),[g,y]=c.useState(0),[a,O]=c.useState(!1),[w,L]=c.useState(!1);c.useEffect(()=>{N("Camera",{action:"getImages",page:0,filter:{showVideos:!0,showPhotos:!0}}).then(r=>{r&&p(r.reverse())})},[]);const n=r=>{if(w||a)return;let l=document.querySelector("#last");if(!l)return;!B(l)&&(O(!0),N("Camera",{action:"getImages",page:g+1,filter:{showVideos:!0,showPhotos:!0}}).then(t=>{t&&t.length>0?(p([...t.reverse(),...u]),O(!1),t.length<25&&L(!0)):L(!0)}),y(t=>t+1))},f=r=>{if(r){let l=u.filter(e=>e.src===r)[0];N("Camera",{action:"deleteFromGallery",links:l.src}).then(()=>{p(u.filter(e=>e.src!==r)),P(null),window.postMessage({action:"phone:updateStorage",add:!1,size:l.size})})}else N("Camera",{action:"deleteFromGallery",links:i.map(l=>l.src)}).then(()=>{p(u.filter(e=>!i.find(t=>e.src===t.src))),T([]);let l=0;i.forEach(e=>{l+=e.size}),window.postMessage({action:"phone:updateStorage",add:!1,size:l})})};return s("div",{className:"photos-container",children:d?s(R,{image:d,images:u,setActiveImage:P,handleDelete:f}):v("div",{className:"zoomOut",children:[v("div",{className:"photos-header",children:[s("div",{}),s("div",{className:"title",children:m("APPS.PHOTOS.TITLE")}),s("div",{className:"select",onClick:()=>S(!E),children:E?m("APPS.PHOTOS.CANCEL"):m("APPS.PHOTOS.SELECT")})]}),v("div",{className:"photos-content",onScroll:n,children:[!E&&s("div",{className:"info",children:m("APPS.PHOTOS.PHOTO_COUNT").format({count:u.length})}),s("div",{className:"images",ref:h,children:u.map((r,l)=>{let e=l===u.length-1?"last":"";return v("div",{id:e,className:"image",onClick:()=>{if(E){const t=i.find(o=>o.src===r.src);T(t?i.filter(o=>o.src!==r.src):[...i,r])}else P(r)},children:[r.isVideo?s($,{src:r.src,editMode:E}):s("div",{className:"img",style:{backgroundImage:`url(${r.src})`}}),s("div",{className:"checkbox",children:E&&(i.find(t=>t.src===r.src)?s(_,{checked:!0}):s(_,{checked:!1}))})]},l)})})]}),E&&v("div",{className:"photos-bottom",children:[s("span",{}),s("div",{className:"selected",children:i.length>0?m("APPS.PHOTOS.SELECTED_COUNT").format({count:i.length}):m("APPS.PHOTOS.SELECT_ITEMS")}),i.length>0?s(b,{onClick:()=>{C.PopUp.set({title:m("APPS.PHOTOS.DELETE_TITLE").format({count:i.length}),description:m("APPS.PHOTOS.DELETE_TEXT").format({count:i.length}),buttons:[{title:m("APPS.PHOTOS.DELETE_BUTTON_CANCEL")},{title:m("APPS.PHOTOS.DELETE_BUTTON_DELETE"),color:"red",cb:()=>{f()}}]})}}):s("span",{})]})]})})}const R=h=>{var l;const E=k(X),S=k(x.Settings),[i,T]=c.useState(new Date(((l=h==null?void 0:h.image)==null?void 0:l.timestamp)/1e3)),[d,P]=c.useState(!0),[u,p]=c.useState(0),g=c.useRef(null),y=c.useRef(null),[a,O]=c.useState(h.image),[w,L]=c.useState([]);let n=h.images;c.useEffect(()=>{if(a&&a.isVideo){const e=document.getElementById(a.src);if(!e)return;e.volume=S.sound.volume}},[S.sound.volume]),c.useEffect(()=>{var t;let e=n.findIndex(o=>o.src===a.src);if(p(e),a.isVideo){const o=document.getElementById(a.src);if(!o)return;o.play(),o.volume=S.sound.volume}if(n.length>0){let o=[];e===0?o=n.slice(0,12):e===n.length-1?o=n.slice(n.length-12,n.length):e<6?o=n.slice(0,12):e>n.length-6?o=n.slice(n.length-12,n.length):o=n.slice(e-6,e+6),T(new Date(((t=n==null?void 0:n[e])==null?void 0:t.timestamp)/1e3)),L(o)}},[a]);const f={pos:{startLeft:0,startX:0},onMouseDown:e=>{f.pos={startLeft:g.current.scrollLeft,startX:e.clientX},g.current.style.userSelect="none",document.addEventListener("mouseup",f.onMouseUp),document.addEventListener("mousemove",f.onMove)},onMove:e=>{if(!g.current)return;const t=(e.clientX-f.pos.startX)/A();g.current.scrollLeft=f.pos.startLeft-t;const o=g.current.getBoundingClientRect();(o.left*A()-5>e.clientX||e.clientX>o.right*A()-5)&&f.onMouseUp()},onMouseUp:()=>{if(!g.current)return;g.current.style.removeProperty("user-select"),document.removeEventListener("mouseup",f.onMouseUp),document.removeEventListener("mousemove",f.onMove);const e=g.current.clientWidth;let t=u;const o=g.current.scrollLeft-f.pos.startLeft;if(o>e/2&&t<n.length?t++:o<-e/2&&t>0&&t--,a.src!==n[t].src&&a.isVideo){const M=document.getElementById(a.src);M&&(M.pause(),M.currentTime=0)}O(n[t]),document.getElementById(n[t].src).scrollIntoView({behavior:"smooth",block:"center"})}},r=e=>{a.isVideo&&document.getElementById(a.src).pause(),O(e),document.getElementById(e.src).scrollIntoView({behavior:"smooth",block:"center"})};return v("div",{className:"activephoto-container",children:[s(D,{children:d&&v(V.div,{className:"photo-top",initial:{opacity:0},animate:{opacity:1},exit:{opacity:0},transition:{duration:.2,ease:"easeInOut"},children:[s("div",{className:"back",onClick:()=>{C.Share.reset(),h.setActiveImage(null)},children:s(F,{})}),v("div",{className:"date",children:[i.toLocaleString([],{day:"2-digit",month:"long"}),s("span",{children:i.toLocaleTimeString(E.DateLocale,{hour:"numeric",minute:"numeric",hour12:S.time.twelveHourClock})})]}),s("div",{})]})}),s("div",{className:"image-overflow",ref:g,onMouseDown:f.onMouseDown,onClick:()=>P(!d),children:n.map((e,t)=>{const o=e.src===a.src;return e.isVideo?s("video",{src:e.src,className:o?"active":null,id:e.src,crossOrigin:"anonymous",loop:!0,onLoadedMetadata:I=>{o&&(I.target.scrollIntoView({block:"center"}),I.target.play())}},t):s(U,{ignoreStreamerMode:!0,id:e.src,src:e.src,className:o?"active":null,onLoad:I=>{o&&I.target.scrollIntoView({block:"center"})}},t)})}),s(D,{children:d&&v(V.div,{className:"photo-bottom-wrapper",initial:{opacity:0},animate:{opacity:1},exit:{opacity:0},transition:{duration:.2,ease:"easeInOut"},children:[s("div",{className:"photo-carousel",ref:y,children:w.map((e,t)=>e.isVideo?s("video",{src:e.src,"data-carousel":t,controls:!1,muted:!0,onClick:o=>r(e)},t):s("img",{src:e.src,"data-carousel":t,onClick:o=>r(e)},t))}),v("div",{className:"photo-bottom",children:[s(G,{onClick:()=>{C.Share.set({type:"image",data:{src:a.src,isVideo:a.isVideo}})}}),s(b,{onClick:()=>{C.PopUp.set({title:m("APPS.PHOTOS.DELETE_IMAGE_TITLE"),description:m("APPS.PHOTOS.DELETE_IMAGE_TEXT"),buttons:[{title:m("APPS.PHOTOS.DELETE_IMAGE_BUTTON_CANCEL")},{title:m("APPS.PHOTOS.DELETE_IMAGE_BUTTON_DELETE"),color:"red",cb:()=>{h.handleDelete(h.image.src)}}]})}})]})]})})]})},$=({src:h,editMode:E})=>{const[S,i]=c.useState(null);return v(H,{children:[s("video",{src:h,crossOrigin:"anonymous",controls:!1,onMouseOver:d=>d.currentTarget.play(),onMouseOut:d=>d.currentTarget.pause(),muted:!0,onLoadedMetadata:d=>{i(d.currentTarget.duration)}}),S&&!E&&s("div",{className:"video-duration",children:(d=>{const P=Math.floor(d/60),u=z(d-P*60,0);return`${P}:${u<10?"0"+u:u}`})(S)})]})};export{Q as default};
