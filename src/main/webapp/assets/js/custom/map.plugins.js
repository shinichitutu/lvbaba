function InfoBox(t){t=t||{},google.maps.OverlayView.apply(this,arguments),this.content_=t.content||"",this.disableAutoPan_=t.disableAutoPan||!1,this.maxWidth_=t.maxWidth||0,this.pixelOffset_=t.pixelOffset||new google.maps.Size(0,0),this.position_=t.position||new google.maps.LatLng(0,0),this.zIndex_=t.zIndex||null,this.boxClass_=t.boxClass||"infoBox",this.boxStyle_=t.boxStyle||{},this.closeBoxMargin_=t.closeBoxMargin||"2px",this.closeBoxURL_=t.closeBoxURL||"//www.google.com/intl/en_us/mapfiles/close.gif",""===t.closeBoxURL&&(this.closeBoxURL_=""),this.closeBoxTitle_=t.closeBoxTitle||" Close ",this.infoBoxClearance_=t.infoBoxClearance||new google.maps.Size(1,1),void 0===t.visible&&(void 0===t.isHidden?t.visible=!0:t.visible=!t.isHidden),this.isHidden_=!t.visible,this.alignBottom_=t.alignBottom||!1,this.pane_=t.pane||"floatPane",this.enableEventPropagation_=t.enableEventPropagation||!1,this.div_=null,this.closeListener_=null,this.moveListener_=null,this.contextListener_=null,this.eventListeners_=null,this.fixedWidthSet_=null}function MarkerClusterer(t,e,r){this.extend(MarkerClusterer,google.maps.OverlayView),this.map_=t,this.markers_=[],this.clusters_=[],this.sizes=[53,56,66,78,90],this.styles_=[],this.ready_=!1;var i=r||{};this.gridSize_=i.gridSize||60,this.minClusterSize_=i.minimumClusterSize||2,this.maxZoom_=i.maxZoom||null,this.styles_=i.styles||[],this.imagePath_=i.imagePath||this.MARKER_CLUSTER_IMAGE_PATH_,this.imageExtension_=i.imageExtension||this.MARKER_CLUSTER_IMAGE_EXTENSION_,this.zoomOnClick_=!0,null!=i.zoomOnClick&&(this.zoomOnClick_=i.zoomOnClick),this.averageCenter_=!1,null!=i.averageCenter&&(this.averageCenter_=i.averageCenter),this.setupStyles_(),this.setMap(t),this.prevZoom_=this.map_.getZoom();var s=this;google.maps.event.addListener(this.map_,"zoom_changed",function(){var t=s.map_.getZoom();s.prevZoom_!=t&&(s.prevZoom_=t,s.resetViewport())}),google.maps.event.addListener(this.map_,"idle",function(){s.redraw()}),e&&e.length&&this.addMarkers(e,!1)}function Cluster(t){this.markerClusterer_=t,this.map_=t.getMap(),this.gridSize_=t.getGridSize(),this.minClusterSize_=t.getMinClusterSize(),this.averageCenter_=t.isAverageCenter(),this.center_=null,this.markers_=[],this.bounds_=null,this.clusterIcon_=new ClusterIcon(this,t.getStyles(),t.getGridSize())}function ClusterIcon(t,e,r){t.getMarkerClusterer().extend(ClusterIcon,google.maps.OverlayView),this.styles_=e,this.padding_=r||0,this.cluster_=t,this.center_=null,this.map_=t.getMap(),this.div_=null,this.sums_=null,this.visible_=!1,this.setMap(this.map_)}InfoBox.prototype=new google.maps.OverlayView,InfoBox.prototype.createInfoBoxDiv_=function(){var t,e,r,i=this,s=function(t){t.cancelBubble=!0,t.stopPropagation&&t.stopPropagation()};if(!this.div_){if(this.div_=document.createElement("div"),this.setBoxStyle_(),void 0===this.content_.nodeType?this.div_.innerHTML=this.getCloseBoxImg_()+this.content_:(this.div_.innerHTML=this.getCloseBoxImg_(),this.div_.appendChild(this.content_)),this.getPanes()[this.pane_].appendChild(this.div_),this.addClickHandler_(),this.div_.style.width?this.fixedWidthSet_=!0:0!==this.maxWidth_&&this.div_.offsetWidth>this.maxWidth_?(this.div_.style.width=this.maxWidth_,this.div_.style.overflow="auto",this.fixedWidthSet_=!0):(r=this.getBoxWidths_(),this.div_.style.width=this.div_.offsetWidth-r.left-r.right+"px",this.fixedWidthSet_=!1),this.panBox_(this.disableAutoPan_),!this.enableEventPropagation_){for(this.eventListeners_=[],e=["mousedown","mouseover","mouseout","mouseup","click","dblclick","touchstart","touchend","touchmove"],t=0;t<e.length;t++)this.eventListeners_.push(google.maps.event.addDomListener(this.div_,e[t],s));this.eventListeners_.push(google.maps.event.addDomListener(this.div_,"mouseover",function(t){this.style.cursor="default"}))}this.contextListener_=google.maps.event.addDomListener(this.div_,"contextmenu",function(t){t.returnValue=!1,t.preventDefault&&t.preventDefault(),i.enableEventPropagation_||s(t)}),google.maps.event.trigger(this,"domready")}},InfoBox.prototype.getCloseBoxImg_=function(){var t="";return""!==this.closeBoxURL_&&(t="<img",t+=" src='"+this.closeBoxURL_+"'",t+=" align=right",t+=" title='"+this.closeBoxTitle_+"'",t+=" style='",t+=" position: relative;",t+=" cursor: pointer;",t+=" margin: "+this.closeBoxMargin_+";",t+="'>"),t},InfoBox.prototype.addClickHandler_=function(){var t;""!==this.closeBoxURL_?(t=this.div_.firstChild,this.closeListener_=google.maps.event.addDomListener(t,"click",this.getCloseClickHandler_())):this.closeListener_=null},InfoBox.prototype.getCloseClickHandler_=function(){var t=this;return function(e){e.cancelBubble=!0,e.stopPropagation&&e.stopPropagation(),google.maps.event.trigger(t,"closeclick"),t.close()}},InfoBox.prototype.panBox_=function(t){var e,r=0,i=0;if(!t&&(e=this.getMap())instanceof google.maps.Map){e.getBounds().contains(this.position_)||e.setCenter(this.position_);var s=this.pixelOffset_.width,o=this.pixelOffset_.height,n=this.div_.offsetWidth,a=this.div_.offsetHeight,h=this.infoBoxClearance_.width,l=this.infoBoxClearance_.height;if(2==e.panToBounds.length){var p={left:0,right:0,top:0,bottom:0};p.left=-s+h,p.right=s+n+h,this.alignBottom_?(p.top=-o+l+a,p.bottom=o+l):(p.top=-o+l,p.bottom=o+a+l),e.panToBounds(new google.maps.LatLngBounds(this.position_),p)}else{var u=e.getDiv(),d=u.offsetWidth,_=u.offsetHeight,c=this.getProjection().fromLatLngToContainerPixel(this.position_);if(c.x<-s+h?r=c.x+s-h:c.x+n+s+h>d&&(r=c.x+n+s+h-d),this.alignBottom_?c.y<-o+l+a?i=c.y+o-l-a:c.y+o+l>_&&(i=c.y+o+l-_):c.y<-o+l?i=c.y+o-l:c.y+a+o+l>_&&(i=c.y+a+o+l-_),0!==r||0!==i){e.getCenter();e.panBy(r,i)}}}},InfoBox.prototype.setBoxStyle_=function(){var t,e;if(this.div_){for(t in this.div_.className=this.boxClass_,this.div_.style.cssText="",e=this.boxStyle_)e.hasOwnProperty(t)&&(this.div_.style[t]=e[t]);(void 0===this.div_.style.WebkitTransform||-1===this.div_.style.WebkitTransform.indexOf("translateZ")&&-1===this.div_.style.WebkitTransform.indexOf("matrix"))&&(this.div_.style.WebkitTransform="translateZ(0)"),void 0!==this.div_.style.opacity&&""!==this.div_.style.opacity&&(this.div_.style.MsFilter='"progid:DXImageTransform.Microsoft.Alpha(Opacity='+100*this.div_.style.opacity+')"',this.div_.style.filter="alpha(opacity="+100*this.div_.style.opacity+")"),this.div_.style.position="absolute",this.div_.style.visibility="hidden",null!==this.zIndex_&&(this.div_.style.zIndex=this.zIndex_)}},InfoBox.prototype.getBoxWidths_=function(){var t,e={top:0,bottom:0,left:0,right:0},r=this.div_;return document.defaultView&&document.defaultView.getComputedStyle?(t=r.ownerDocument.defaultView.getComputedStyle(r,""))&&(e.top=parseInt(t.borderTopWidth,10)||0,e.bottom=parseInt(t.borderBottomWidth,10)||0,e.left=parseInt(t.borderLeftWidth,10)||0,e.right=parseInt(t.borderRightWidth,10)||0):document.documentElement.currentStyle&&r.currentStyle&&(e.top=parseInt(r.currentStyle.borderTopWidth,10)||0,e.bottom=parseInt(r.currentStyle.borderBottomWidth,10)||0,e.left=parseInt(r.currentStyle.borderLeftWidth,10)||0,e.right=parseInt(r.currentStyle.borderRightWidth,10)||0),e},InfoBox.prototype.onRemove=function(){this.div_&&(this.div_.parentNode.removeChild(this.div_),this.div_=null)},InfoBox.prototype.draw=function(){this.createInfoBoxDiv_();var t=this.getProjection().fromLatLngToDivPixel(this.position_);this.div_.style.left=t.x+this.pixelOffset_.width+"px",this.alignBottom_?this.div_.style.bottom=-(t.y+this.pixelOffset_.height)+"px":this.div_.style.top=t.y+this.pixelOffset_.height+"px",this.isHidden_?this.div_.style.visibility="hidden":this.div_.style.visibility="visible"},InfoBox.prototype.setOptions=function(t){void 0!==t.boxClass&&(this.boxClass_=t.boxClass,this.setBoxStyle_()),void 0!==t.boxStyle&&(this.boxStyle_=t.boxStyle,this.setBoxStyle_()),void 0!==t.content&&this.setContent(t.content),void 0!==t.disableAutoPan&&(this.disableAutoPan_=t.disableAutoPan),void 0!==t.maxWidth&&(this.maxWidth_=t.maxWidth),void 0!==t.pixelOffset&&(this.pixelOffset_=t.pixelOffset),void 0!==t.alignBottom&&(this.alignBottom_=t.alignBottom),void 0!==t.position&&this.setPosition(t.position),void 0!==t.zIndex&&this.setZIndex(t.zIndex),void 0!==t.closeBoxMargin&&(this.closeBoxMargin_=t.closeBoxMargin),void 0!==t.closeBoxURL&&(this.closeBoxURL_=t.closeBoxURL),void 0!==t.closeBoxTitle&&(this.closeBoxTitle_=t.closeBoxTitle),void 0!==t.infoBoxClearance&&(this.infoBoxClearance_=t.infoBoxClearance),void 0!==t.isHidden&&(this.isHidden_=t.isHidden),void 0!==t.visible&&(this.isHidden_=!t.visible),void 0!==t.enableEventPropagation&&(this.enableEventPropagation_=t.enableEventPropagation),this.div_&&this.draw()},InfoBox.prototype.setContent=function(t){this.content_=t,this.div_&&(this.closeListener_&&(google.maps.event.removeListener(this.closeListener_),this.closeListener_=null),this.fixedWidthSet_||(this.div_.style.width=""),void 0===t.nodeType?this.div_.innerHTML=this.getCloseBoxImg_()+t:(this.div_.innerHTML=this.getCloseBoxImg_(),this.div_.appendChild(t)),this.fixedWidthSet_||(this.div_.style.width=this.div_.offsetWidth+"px",void 0===t.nodeType?this.div_.innerHTML=this.getCloseBoxImg_()+t:(this.div_.innerHTML=this.getCloseBoxImg_(),this.div_.appendChild(t))),this.addClickHandler_()),google.maps.event.trigger(this,"content_changed")},InfoBox.prototype.setPosition=function(t){this.position_=t,this.div_&&this.draw(),google.maps.event.trigger(this,"position_changed")},InfoBox.prototype.setZIndex=function(t){this.zIndex_=t,this.div_&&(this.div_.style.zIndex=t),google.maps.event.trigger(this,"zindex_changed")},InfoBox.prototype.setVisible=function(t){this.isHidden_=!t,this.div_&&(this.div_.style.visibility=this.isHidden_?"hidden":"visible")},InfoBox.prototype.getContent=function(){return this.content_},InfoBox.prototype.getPosition=function(){return this.position_},InfoBox.prototype.getZIndex=function(){return this.zIndex_},InfoBox.prototype.getVisible=function(){return void 0!==this.getMap()&&null!==this.getMap()&&!this.isHidden_},InfoBox.prototype.getWidth=function(){var t=null;return this.div_&&(t=this.div_.offsetWidth),t},InfoBox.prototype.getHeight=function(){var t=null;return this.div_&&(t=this.div_.offsetHeight),t},InfoBox.prototype.show=function(){this.isHidden_=!1,this.div_&&(this.div_.style.visibility="visible")},InfoBox.prototype.hide=function(){this.isHidden_=!0,this.div_&&(this.div_.style.visibility="hidden")},InfoBox.prototype.open=function(t,e){var r=this;e&&(this.setPosition(e.getPosition()),this.moveListener_=google.maps.event.addListener(e,"position_changed",function(){r.setPosition(this.getPosition())})),this.setMap(t),this.div_&&this.panBox_(this.disableAutoPan_)},InfoBox.prototype.close=function(){var t;if(this.closeListener_&&(google.maps.event.removeListener(this.closeListener_),this.closeListener_=null),this.eventListeners_){for(t=0;t<this.eventListeners_.length;t++)google.maps.event.removeListener(this.eventListeners_[t]);this.eventListeners_=null}this.moveListener_&&(google.maps.event.removeListener(this.moveListener_),this.moveListener_=null),this.contextListener_&&(google.maps.event.removeListener(this.contextListener_),this.contextListener_=null),this.setMap(null)},MarkerClusterer.prototype.MARKER_CLUSTER_IMAGE_PATH_="../images/m",MarkerClusterer.prototype.MARKER_CLUSTER_IMAGE_EXTENSION_="png",MarkerClusterer.prototype.extend=function(t,e){return function(t){for(var e in t.prototype)this.prototype[e]=t.prototype[e];return this}.apply(t,[e])},MarkerClusterer.prototype.onAdd=function(){this.setReady_(!0)},MarkerClusterer.prototype.draw=function(){},MarkerClusterer.prototype.setupStyles_=function(){if(!this.styles_.length)for(var t,e=0;t=this.sizes[e];e++)this.styles_.push({url:this.imagePath_+(e+1)+"."+this.imageExtension_,height:t,width:t})},MarkerClusterer.prototype.fitMapToMarkers=function(){for(var t,e=this.getMarkers(),r=new google.maps.LatLngBounds,i=0;t=e[i];i++)r.extend(t.getPosition());this.map_.fitBounds(r)},MarkerClusterer.prototype.setStyles=function(t){this.styles_=t},MarkerClusterer.prototype.getStyles=function(){return this.styles_},MarkerClusterer.prototype.isZoomOnClick=function(){return this.zoomOnClick_},MarkerClusterer.prototype.isAverageCenter=function(){return this.averageCenter_},MarkerClusterer.prototype.getMarkers=function(){return this.markers_},MarkerClusterer.prototype.getTotalMarkers=function(){return this.markers_.length},MarkerClusterer.prototype.setMaxZoom=function(t){this.maxZoom_=t},MarkerClusterer.prototype.getMaxZoom=function(){return this.maxZoom_},MarkerClusterer.prototype.calculator_=function(t,e){for(var r=0,i=t.length,s=i;0!==s;)s=parseInt(s/10,10),r++;return{text:i,index:r=Math.min(r,e)}},MarkerClusterer.prototype.setCalculator=function(t){this.calculator_=t},MarkerClusterer.prototype.getCalculator=function(){return this.calculator_},MarkerClusterer.prototype.addMarkers=function(t,e){for(var r,i=0;r=t[i];i++)this.pushMarkerTo_(r);e||this.redraw()},MarkerClusterer.prototype.pushMarkerTo_=function(t){if(t.isAdded=!1,t.draggable){var e=this;google.maps.event.addListener(t,"dragend",function(){t.isAdded=!1,e.repaint()})}this.markers_.push(t)},MarkerClusterer.prototype.addMarker=function(t,e){this.pushMarkerTo_(t),e||this.redraw()},MarkerClusterer.prototype.removeMarker_=function(t){var e=-1;if(this.markers_.indexOf)e=this.markers_.indexOf(t);else for(var r,i=0;r=this.markers_[i];i++)if(r==t){e=i;break}return-1!=e&&(t.setMap(null),this.markers_.splice(e,1),!0)},MarkerClusterer.prototype.removeMarker=function(t,e){var r=this.removeMarker_(t);return!(e||!r)&&(this.resetViewport(),this.redraw(),!0)},MarkerClusterer.prototype.removeMarkers=function(t,e){for(var r,i=!1,s=0;r=t[s];s++){var o=this.removeMarker_(r);i=i||o}if(!e&&i)return this.resetViewport(),this.redraw(),!0},MarkerClusterer.prototype.setReady_=function(t){this.ready_||(this.ready_=t,this.createClusters_())},MarkerClusterer.prototype.getTotalClusters=function(){return this.clusters_.length},MarkerClusterer.prototype.getMap=function(){return this.map_},MarkerClusterer.prototype.setMap=function(t){this.map_=t},MarkerClusterer.prototype.getGridSize=function(){return this.gridSize_},MarkerClusterer.prototype.setGridSize=function(t){this.gridSize_=t},MarkerClusterer.prototype.getMinClusterSize=function(){return this.minClusterSize_},MarkerClusterer.prototype.setMinClusterSize=function(t){this.minClusterSize_=t},MarkerClusterer.prototype.getExtendedBounds=function(t){var e=this.getProjection(),r=new google.maps.LatLng(t.getNorthEast().lat(),t.getNorthEast().lng()),i=new google.maps.LatLng(t.getSouthWest().lat(),t.getSouthWest().lng()),s=e.fromLatLngToDivPixel(r);s.x+=this.gridSize_,s.y-=this.gridSize_;var o=e.fromLatLngToDivPixel(i);o.x-=this.gridSize_,o.y+=this.gridSize_;var n=e.fromDivPixelToLatLng(s),a=e.fromDivPixelToLatLng(o);return t.extend(n),t.extend(a),t},MarkerClusterer.prototype.isMarkerInBounds_=function(t,e){return e.contains(t.getPosition())},MarkerClusterer.prototype.clearMarkers=function(){this.resetViewport(!0),this.markers_=[]},MarkerClusterer.prototype.resetViewport=function(t){for(var e,r=0;e=this.clusters_[r];r++)e.remove();var i;for(r=0;i=this.markers_[r];r++)i.isAdded=!1,t&&i.setMap(null);this.clusters_=[]},MarkerClusterer.prototype.repaint=function(){var t=this.clusters_.slice();this.clusters_.length=0,this.resetViewport(),this.redraw(),window.setTimeout(function(){for(var e,r=0;e=t[r];r++)e.remove()},0)},MarkerClusterer.prototype.redraw=function(){this.createClusters_()},MarkerClusterer.prototype.distanceBetweenPoints_=function(t,e){if(!t||!e)return 0;var r=(e.lat()-t.lat())*Math.PI/180,i=(e.lng()-t.lng())*Math.PI/180,s=Math.sin(r/2)*Math.sin(r/2)+Math.cos(t.lat()*Math.PI/180)*Math.cos(e.lat()*Math.PI/180)*Math.sin(i/2)*Math.sin(i/2);return 6371*(2*Math.atan2(Math.sqrt(s),Math.sqrt(1-s)))},MarkerClusterer.prototype.addToClosestCluster_=function(t){for(var e,r=4e4,i=null,s=(t.getPosition(),0);e=this.clusters_[s];s++){var o=e.getCenter();if(o){var n=this.distanceBetweenPoints_(o,t.getPosition());n<r&&(r=n,i=e)}}i&&i.isMarkerInClusterBounds(t)?i.addMarker(t):((e=new Cluster(this)).addMarker(t),this.clusters_.push(e))},MarkerClusterer.prototype.createClusters_=function(){if(this.ready_)for(var t,e=new google.maps.LatLngBounds(this.map_.getBounds().getSouthWest(),this.map_.getBounds().getNorthEast()),r=this.getExtendedBounds(e),i=0;t=this.markers_[i];i++)!t.isAdded&&this.isMarkerInBounds_(t,r)&&this.addToClosestCluster_(t)},Cluster.prototype.isMarkerAlreadyAdded=function(t){if(this.markers_.indexOf)return-1!=this.markers_.indexOf(t);for(var e,r=0;e=this.markers_[r];r++)if(e==t)return!0;return!1},Cluster.prototype.addMarker=function(t){if(this.isMarkerAlreadyAdded(t))return!1;if(this.center_){if(this.averageCenter_){var e=this.markers_.length+1,r=(this.center_.lat()*(e-1)+t.getPosition().lat())/e,i=(this.center_.lng()*(e-1)+t.getPosition().lng())/e;this.center_=new google.maps.LatLng(r,i),this.calculateBounds_()}}else this.center_=t.getPosition(),this.calculateBounds_();t.isAdded=!0,this.markers_.push(t);var s=this.markers_.length;if(s<this.minClusterSize_&&t.getMap()!=this.map_&&t.setMap(this.map_),s==this.minClusterSize_)for(var o=0;o<s;o++)this.markers_[o].setMap(null);return s>=this.minClusterSize_&&t.setMap(null),this.updateIcon(),!0},Cluster.prototype.getMarkerClusterer=function(){return this.markerClusterer_},Cluster.prototype.getBounds=function(){for(var t,e=new google.maps.LatLngBounds(this.center_,this.center_),r=this.getMarkers(),i=0;t=r[i];i++)e.extend(t.getPosition());return e},Cluster.prototype.remove=function(){this.clusterIcon_.remove(),this.markers_.length=0,delete this.markers_},Cluster.prototype.getSize=function(){return this.markers_.length},Cluster.prototype.getMarkers=function(){return this.markers_},Cluster.prototype.getCenter=function(){return this.center_},Cluster.prototype.calculateBounds_=function(){var t=new google.maps.LatLngBounds(this.center_,this.center_);this.bounds_=this.markerClusterer_.getExtendedBounds(t)},Cluster.prototype.isMarkerInClusterBounds=function(t){return this.bounds_.contains(t.getPosition())},Cluster.prototype.getMap=function(){return this.map_},Cluster.prototype.updateIcon=function(){var t=this.map_.getZoom(),e=this.markerClusterer_.getMaxZoom();if(e&&t>e)for(var r,i=0;r=this.markers_[i];i++)r.setMap(this.map_);else if(this.markers_.length<this.minClusterSize_)this.clusterIcon_.hide();else{var s=this.markerClusterer_.getStyles().length,o=this.markerClusterer_.getCalculator()(this.markers_,s);this.clusterIcon_.setCenter(this.center_),this.clusterIcon_.setSums(o),this.clusterIcon_.show()}},ClusterIcon.prototype.triggerClusterClick=function(t){var e=this.cluster_.getMarkerClusterer();google.maps.event.trigger(e,"clusterclick",this.cluster_,t),e.isZoomOnClick()&&this.map_.fitBounds(this.cluster_.getBounds())},ClusterIcon.prototype.onAdd=function(){if(this.div_=document.createElement("DIV"),this.div_.className="cluster",this.visible_){var t=this.getPosFromLatLng_(this.center_);this.div_.style.cssText=this.createCss(t),this.div_.innerHTML=this.sums_.text,this.div_.className="cluster-visible"}this.getPanes().overlayMouseTarget.appendChild(this.div_);var e=this,r=!1;google.maps.event.addDomListener(this.div_,"click",function(t){r||e.triggerClusterClick(t)}),google.maps.event.addDomListener(this.div_,"mousedown",function(){r=!1}),google.maps.event.addDomListener(this.div_,"mousemove",function(){r=!0})},ClusterIcon.prototype.getPosFromLatLng_=function(t){var e=this.getProjection().fromLatLngToDivPixel(t);return"object"==typeof this.iconAnchor_&&2===this.iconAnchor_.length?(e.x-=this.iconAnchor_[0],e.y-=this.iconAnchor_[1]):(e.x-=parseInt(this.width_/2,10),e.y-=parseInt(this.height_/2,10)),e},ClusterIcon.prototype.draw=function(){if(this.visible_){var t=this.getPosFromLatLng_(this.center_);this.div_.style.top=t.y+"px",this.div_.style.left=t.x+"px"}},ClusterIcon.prototype.hide=function(){this.div_&&(this.div_.style.display="none"),this.visible_=!1},ClusterIcon.prototype.show=function(){if(this.div_){var t=this.getPosFromLatLng_(this.center_);this.div_.style.cssText=this.createCss(t),this.div_.style.display=""}this.visible_=!0},ClusterIcon.prototype.remove=function(){this.setMap(null)},ClusterIcon.prototype.onRemove=function(){this.div_&&this.div_.parentNode&&(this.hide(),this.div_.parentNode.removeChild(this.div_),this.div_=null)},ClusterIcon.prototype.setSums=function(t){this.sums_=t,this.text_=t.text,this.index_=t.index,this.div_&&(this.div_.innerHTML=t.text),this.useStyle()},ClusterIcon.prototype.useStyle=function(){var t=Math.max(0,this.sums_.index-1);t=Math.min(this.styles_.length-1,t);var e=this.styles_[t];this.url_=e.url,this.height_=e.height,this.width_=e.width,this.textColor_=e.textColor,this.anchor_=e.anchor,this.textSize_=e.textSize,this.backgroundPosition_=e.backgroundPosition,this.iconAnchor_=e.iconAnchor},ClusterIcon.prototype.setCenter=function(t){this.center_=t},ClusterIcon.prototype.createCss=function(t){var e=[];e.push("background-image:url("+this.url_+");");var r=this.backgroundPosition_?this.backgroundPosition_:"0 0";e.push("background-position:"+r+";"),"object"==typeof this.anchor_?("number"==typeof this.anchor_[0]&&this.anchor_[0]>0&&this.anchor_[0]<this.height_?e.push("height:"+(this.height_-this.anchor_[0])+"px; padding-top:"+this.anchor_[0]+"px;"):"number"==typeof this.anchor_[0]&&this.anchor_[0]<0&&-this.anchor_[0]<this.height_?e.push("height:"+this.height_+"px; line-height:"+(this.height_+this.anchor_[0])+"px;"):e.push("height:"+this.height_+"px; line-height:"+this.height_+"px;"),"number"==typeof this.anchor_[1]&&this.anchor_[1]>0&&this.anchor_[1]<this.width_?e.push("width:"+(this.width_-this.anchor_[1])+"px; padding-left:"+this.anchor_[1]+"px;"):e.push("width:"+this.width_+"px; text-align:center;")):e.push("height:"+this.height_+"px; line-height:"+this.height_+"px; width:"+this.width_+"px; text-align:center;");var i=this.textColor_?this.textColor_:"black",s=this.textSize_?this.textSize_:11;return e.push("cursor:pointer; top:"+t.y+"px; left:"+t.x+"px; color:"+i+"; position:absolute; font-size:"+s+"px; font-family:Arial,sans-serif; font-weight:bold"),e.join("")},window.MarkerClusterer=MarkerClusterer,MarkerClusterer.prototype.addMarker=MarkerClusterer.prototype.addMarker,MarkerClusterer.prototype.addMarkers=MarkerClusterer.prototype.addMarkers,MarkerClusterer.prototype.clearMarkers=MarkerClusterer.prototype.clearMarkers,MarkerClusterer.prototype.fitMapToMarkers=MarkerClusterer.prototype.fitMapToMarkers,MarkerClusterer.prototype.getCalculator=MarkerClusterer.prototype.getCalculator,MarkerClusterer.prototype.getGridSize=MarkerClusterer.prototype.getGridSize,MarkerClusterer.prototype.getExtendedBounds=MarkerClusterer.prototype.getExtendedBounds,MarkerClusterer.prototype.getMap=MarkerClusterer.prototype.getMap,MarkerClusterer.prototype.getMarkers=MarkerClusterer.prototype.getMarkers,MarkerClusterer.prototype.getMaxZoom=MarkerClusterer.prototype.getMaxZoom,MarkerClusterer.prototype.getStyles=MarkerClusterer.prototype.getStyles,MarkerClusterer.prototype.getTotalClusters=MarkerClusterer.prototype.getTotalClusters,MarkerClusterer.prototype.getTotalMarkers=MarkerClusterer.prototype.getTotalMarkers,MarkerClusterer.prototype.redraw=MarkerClusterer.prototype.redraw,MarkerClusterer.prototype.removeMarker=MarkerClusterer.prototype.removeMarker,MarkerClusterer.prototype.removeMarkers=MarkerClusterer.prototype.removeMarkers,MarkerClusterer.prototype.resetViewport=MarkerClusterer.prototype.resetViewport,MarkerClusterer.prototype.repaint=MarkerClusterer.prototype.repaint,MarkerClusterer.prototype.setCalculator=MarkerClusterer.prototype.setCalculator,MarkerClusterer.prototype.setGridSize=MarkerClusterer.prototype.setGridSize,MarkerClusterer.prototype.setMaxZoom=MarkerClusterer.prototype.setMaxZoom,MarkerClusterer.prototype.onAdd=MarkerClusterer.prototype.onAdd,MarkerClusterer.prototype.draw=MarkerClusterer.prototype.draw,Cluster.prototype.getCenter=Cluster.prototype.getCenter,Cluster.prototype.getSize=Cluster.prototype.getSize,Cluster.prototype.getMarkers=Cluster.prototype.getMarkers,ClusterIcon.prototype.onAdd=ClusterIcon.prototype.onAdd,ClusterIcon.prototype.draw=ClusterIcon.prototype.draw,ClusterIcon.prototype.onRemove=ClusterIcon.prototype.onRemove;
//# sourceMappingURL=map.plugins.js.map