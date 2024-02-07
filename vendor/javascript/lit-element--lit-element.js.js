import{ReactiveElement as e}from"@lit/reactive-element";export*from"@lit/reactive-element";import{render as t,noChange as n}from"lit-html";export*from"lit-html";
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */class s extends e{constructor(){super(...arguments),this.renderOptions={host:this},this._$Do=void 0}createRenderRoot(){const e=super.createRenderRoot();return this.renderOptions.renderBefore??=e.firstChild,e}update(e){const n=this.render();this.hasUpdated||(this.renderOptions.isConnected=this.isConnected),super.update(e),this._$Do=t(n,this.renderRoot,this.renderOptions)}connectedCallback(){super.connectedCallback(),this._$Do?.setConnected(!0)}disconnectedCallback(){super.disconnectedCallback(),this._$Do?.setConnected(!1)}render(){return n}}s._$litElement$=!0,s[("finalized","finalized")]=!0,globalThis.litElementHydrateSupport?.({LitElement:s});const i=globalThis.litElementPolyfillSupport;i?.({LitElement:s});const r={_$AK:(e,t,n)=>{e._$AK(t,n)},_$AL:e=>e._$AL};(globalThis.litElementVersions??=[]).push("4.0.3");export{s as LitElement,r as _$LE};

