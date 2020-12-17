!function(t){t.add("plugin","handle",{init:function(t){this.app=t,this.opts=t.opts,this.$doc=t.$doc,this.$body=t.$body,this.editor=t.editor,this.marker=t.marker,this.keycodes=t.keycodes,this.container=t.container,this.selection=t.selection,this.handleTrigger=void 0!==this.opts.handleTrigger?this.opts.handleTrigger:"@",this.handleStart=void 0!==this.opts.handleStart?this.opts.handleStart:0,this.handleStr="",this.handleLen=this.handleStart},start:function(){this.opts.handle&&this.editor.getElement().on("keyup.redactor-plugin-handle",this._handle.bind(this))},stop:function(){this.editor.getElement().off(".redactor-plugin-handle"),this.$doc.off(".redactor-plugin-handle"),t.dom("#redactor-handle-list").remove()},_handle:function(t){var e=t.which,i=t.ctrlKey||t.metaKey;if(e===this.keycodes.BACKSPACE){if(!(this._isShown()&&this.handleLen>this.handleStart))return;this.handleLen=this.handleLen-2,this.handleLen<=this.handleStart&&this._hide()}if(e!==this.keycodes.DELETE&&e!==this.keycodes.ESC&&e!==this.keycodes.SHIFT&&!i&&-1===[37,38,39,40].indexOf(e)){var s=new RegExp("^"+this.handleTrigger);this.handleStr=this.selection.getTextBeforeCaret(this.handleLen+1),s.test(this.handleStr)&&(this.handleStr=this.handleStr.replace(this.handleTrigger,""),this.handleLen++,this._load())}},_load:function(){t.ajax.post({url:this.opts.handle,data:"handle="+this.handleStr,success:this._parse.bind(this)})},_parse:function(t){if(""!==t){var e="object"==typeof t?t:JSON.parse(t);this._build(),this._buildData(e)}},_build:function(){this.$list=t.dom("#redactor-handle-list"),0===this.$list.length&&(this.$list=t.dom('<div id="redactor-handle-list">'),this.$body.append(this.$list))},_buildData:function(t){this.data=t,this._update(),this._show()},_update:function(){for(var e in this.$list.html(""),this.data){var i=t.dom('<a href="#">');i.html(this.data[e].item),i.attr("data-key",e),i.on("click",this._replace.bind(this)),this.$list.append(i)}this.container.getElement().offset();var s=this.selection.getPosition();this.$list.css({top:s.top+s.height+this.$doc.scrollTop()+"px",left:s.left+"px"})},_isShown:function(){return this.$list&&this.$list.hasClass("open")},_show:function(){this.$list.addClass("open"),this.$list.show(),this.$doc.off(".redactor-plugin-handle"),this.$doc.on("click.redactor-plugin-handle keydown.redactor-plugin-handle",this._hide.bind(this))},_hide:function(t){var e=!1,i=t&&t.which;t&&"click"!==t.type&&i!==this.keycodes.ESC&&i!==this.keycodes.ENTER&&i!==this.keycodes.SPACE||(e=!0),e&&(this.$list.removeClass("open"),this.$list.hide(),this._reset())},_reset:function(){this.handleStr="",this.handleLen=this.handleStart},_replace:function(e){e.preventDefault();var i=t.dom(e.target).attr("data-key"),s=this.data[i].replacement,h=this.marker.insert("start"),n=t.dom(h),a=h.previousSibling,d=a.textContent,o=new RegExp("@"+this.handleStr+"$");d=d.replace(o,""),a.textContent=d,n.before(s),this.selection.restoreMarkers()}})}(Redactor);
//# sourceMappingURL=handle.js.map