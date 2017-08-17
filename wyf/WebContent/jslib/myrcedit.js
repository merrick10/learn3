/**
 * 
 */
document.write('<script type="text/javascript"  charset="utf-8" src="jslib/reditor/kindeditor-all-min.js"><\/script>');
document.write('<script type="text/javascript"  charset="utf-8" src="jslib/reditor/lang/zh-CN.js"><\/script>');
function initMyEditor1(txaid,uploadurl,themesPath,pluginsPath) {
    KindEditor.ready(function (K) {
    
        	 K.create('#'+txaid, {
	        	themesPath:themesPath,//'css/reditor/themes/',        	
	            themeType: 'default',
	            pluginsPath:pluginsPath,//'js/reditor/plugins/',            
	            resizeType: 0,
	            pasteType: 2,
	            syncType: "",//同步数据的方式，可设置''、'form'，值为form时提交form时自动同步，空时不会自动同步
	            filterMode: true,  //true时根据 htmlTags 过滤HTML代码，false时允许输入任何代码
	            shadowMode:true,  //true时弹出层(dialog)显示阴影
	            dialogAlignType:'',      //设置弹出框(dialog)的对齐类型，可设置”“、”page”，指定page时按当前页面居中，指定空时按编辑器居中      
	            allowPreviewEmoticons: false,//true时鼠标放在表情上可以预览表情     
	            allowImageUpload:true,//true时显示图片上传按钮(Tab,是弹出框第二页)
	            uploadJson :uploadurl,//指定上传文件的服务器端程序//'objupload!addarticlepic.do',
	            fileManagerJson : '',//指定浏览远程图片的服务器端程序(未开启浏览)
	            allowFileManager : false,//true时显示浏览远程服务器按钮(不显示)
	            fillDescAfterUploadImage:false,//true时图片上传成功后切换到图片编辑标签，false时插入图片后关闭弹出框
	            items: [
	                   'source', 'undo', 'redo', 'plainpaste', 'wordpaste', 'clearhtml', 
	                   'selectall',   'fontsize', '|', 'forecolor', 'hilitecolor',
	                   'bold', 'italic', 'underline',   '|', 'justifyleft', 'justifycenter',
	                   'justifyright', 'insertorderedlist', 'insertunorderedlist', '|', 'link', 'image',
	                   'unlink'
	               ],
	            afterCreate: function () {
	                this.sync();
	            },
	            afterBlur: function () {
	                this.sync();
	            },
	            afterChange: function () {               
					//方法有问题，不准确，会多次调用	 
// 					this.sync();
// 	            	if(this.isEmpty()){
// 	            		alert("EMPTY");
// 	            		return false;
// 	            	}
	            },
	            afterUpload:function(a,b,c){//上传文件后执行的回调函数   url/object/type       
	            	
				//	alert(a);
				//	alert(b);//b.error ,b.url, b.message
				//	alert(c);
					if(b.error==0){
						//alert("[SUCCESS]"+b.url);
					}else{
						alert("[ERROR]"+b.message);
					}
	            
	            }           
        });
       
        
    });
}


function initMyEditor2(txaid,uploadurl) {
    KindEditor.ready(function (K) {
    
        	 K.create('#'+txaid, {
	        	themesPath:'css/reditor/themes/',        	
	            themeType: 'default',
	            pluginsPath:'js/reditor/plugins/',            
	            resizeType: 0,
	            pasteType: 2,
	            syncType: "",//同步数据的方式，可设置''、'form'，值为form时提交form时自动同步，空时不会自动同步
	            filterMode: true,  //true时根据 htmlTags 过滤HTML代码，false时允许输入任何代码
	            shadowMode:true,  //true时弹出层(dialog)显示阴影
	            dialogAlignType:'',      //设置弹出框(dialog)的对齐类型，可设置”“、”page”，指定page时按当前页面居中，指定空时按编辑器居中      
	            allowPreviewEmoticons: false,//true时鼠标放在表情上可以预览表情     
	            allowImageUpload:true,//true时显示图片上传按钮(Tab,是弹出框第二页)
	            uploadJson : uploadurl,//指定上传文件的服务器端程序//'objupload!addarticlepic.do',
	            fileManagerJson : '',//指定浏览远程图片的服务器端程序(未开启浏览)
	            allowFileManager : false,//true时显示浏览远程服务器按钮(不显示)
	            fillDescAfterUploadImage:false,//true时图片上传成功后切换到图片编辑标签，false时插入图片后关闭弹出框
	            items: [
	                   'fontsize', '|', 'forecolor', 'hilitecolor',
	                   'bold', 'italic', 'underline',   '|', 'justifyleft', 'justifycenter',
	                   'justifyright', 'insertorderedlist', 'insertunorderedlist', '|', 'link',
	                   'unlink','emoticons'
	               ],
	            afterCreate: function () {
	                this.sync();
	            },
	            afterBlur: function () {
	                this.sync();
	            },
	            afterChange: function () {               
					//方法有问题，不准确，会多次调用	 
// 					this.sync();
// 	            	if(this.isEmpty()){
// 	            		alert("EMPTY");
// 	            		return false;
// 	            	}
	            },
	            afterUpload:function(a,b,c){//上传文件后执行的回调函数   url/object/type       
	            	
				//	alert(a);
				//	alert(b);//b.error ,b.url, b.message
				//	alert(c);
					if(b.error==0){
						//alert("[SUCCESS]"+b.url);
					}else{
						alert("[ERROR]"+b.message);
					}
	            
	            }           
        });
       
        
    });
}


function initMyEditor3(txaid,uploadurl) {
    KindEditor.ready(function (K) {
    
        	 K.create('#'+txaid, {
	        	themesPath:'css/reditor/themes/',        	
	            themeType: 'default',
	            pluginsPath:'js/reditor/plugins/',            
	            resizeType: 0,
	            pasteType: 2,
	            syncType: "",//同步数据的方式，可设置''、'form'，值为form时提交form时自动同步，空时不会自动同步
	            filterMode: true,  //true时根据 htmlTags 过滤HTML代码，false时允许输入任何代码
	            shadowMode:true,  //true时弹出层(dialog)显示阴影
	            dialogAlignType:'',      //设置弹出框(dialog)的对齐类型，可设置”“、”page”，指定page时按当前页面居中，指定空时按编辑器居中      
	            allowPreviewEmoticons: false,//true时鼠标放在表情上可以预览表情     
	            allowImageUpload:true,//true时显示图片上传按钮(Tab,是弹出框第二页)
	            uploadJson : uploadurl,//'objupload!addarticlepic.do',//指定上传文件的服务器端程序
	            fileManagerJson : '',//指定浏览远程图片的服务器端程序(未开启浏览)
	            allowFileManager : false,//true时显示浏览远程服务器按钮(不显示)
	            fillDescAfterUploadImage:false,//true时图片上传成功后切换到图片编辑标签，false时插入图片后关闭弹出框
	            items: [
	                   'fontsize', '|', 'forecolor', 'hilitecolor',
	                   'bold', 'italic', 'underline',   '|', 'justifyleft', 'justifycenter',
	                   'justifyright', 'insertorderedlist', 'insertunorderedlist', '|', 'link',
	                   'unlink'
	               ],
	            afterCreate: function () {
	                this.sync();
	            },
	            afterBlur: function () {
	                this.sync();
	            },
	            afterChange: function () {               
					//方法有问题，不准确，会多次调用	 
// 					this.sync();
// 	            	if(this.isEmpty()){
// 	            		alert("EMPTY");
// 	            		return false;
// 	            	}
	            },
	            afterUpload:function(a,b,c){//上传文件后执行的回调函数   url/object/type       
	            	
				//	alert(a);
				//	alert(b);//b.error ,b.url, b.message
				//	alert(c);
					if(b.error==0){
						//alert("[SUCCESS]"+b.url);
					}else{
						alert("[ERROR]"+b.message);
					}
	            
	            }           
        });
       
        
    });
}

