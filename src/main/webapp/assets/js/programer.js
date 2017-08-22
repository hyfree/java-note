$(function(){
	loadAllNode();
	initMDEditor("### Hello World .");
});

//递归


//加载树形节点
function loadAllNode(){
	$.ajax({
		type: "get",
        url: "type/list",
        dataType: "json",
        success: function (data) {//请求正确执行的方法（后台返回的结果）
        	zNodes = data.result;
        	$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$("#addParent").bind("click", {isParent:true}, add);
			$("#addLeaf").bind("click", {isParent:false}, add);
			$("#edit").bind("click", edit);
			$("#remove").bind("click", remove);
			$("#clearChildren").bind("click", clearChildren);
		}
	})
}

//保存笔记
$("#saveBtn").click(function(){
	//判断是否为空
	if($("#n_title").val()==""){
		$("#zTreeDialog").modal('close');
    	$("#alertTitle").addClass("am-btn-danger")
		$("#alertMsg").html("笔记标题不能为空");
		$("#infoDialog").modal('open');
		return false;
	}
	if(testEditor.getMarkdown()==""||testEditor.getHTML()==""){
		$("#zTreeDialog").modal('close');
    	$("#alertTitle").addClass("am-btn-danger")
		$("#alertMsg").html("笔记内容不能为空");
		$("#infoDialog").modal('open');
		return false;
	}
	
	if($("#nodeName").val()==""){
		$("#zTreeDialog").modal('close');
    	$("#alertTitle").addClass("am-btn-danger")
		$("#alertMsg").html("请选择笔记存放的文件夹");
		$("#infoDialog").modal('open');
		return false;
	}
	
	var mdtext = testEditor.getMarkdown();
	var mdhtml = testEditor.getHTML();
	var typeid = $("#nodeName").attr('data-id');
    $.ajax({
		type: "post",
	    url: "notes/add",
	    data: { title: $("#n_title").val(),mdtext:mdtext,content:mdhtml,typeid:typeid},
	    dataType: "json",
	    success: function (data) {//请求正确执行的方法（后台返回的结果）
	    	if(data.result=="success"){
	    		$("#zTreeDialog").modal('close');
		    	$("#alertTitle").addClass("am-btn-success")
				$("#alertMsg").html("添加成功");
				$("#infoDialog").modal('open');
	    	}else{
	    		$("#zTreeDialog").modal('close');
		    	$("#alertTitle").addClass("am-btn-success")
				$("#alertMsg").html(data.result);
				$("#infoDialog").modal('open');
	    	}
		}
	});
});

//节点选择弹框
$("#saveDialog").bind('click', function() {
	$("#zTreeDialog").modal('open');
});  

//节点更新
function updateNode(id,name){
	$.ajax({
		type: "post",
        url: "type/update",
        data:{id:id,name:name},
        dataType: "json",
        success: function (data) {//请求正确执行的方法（后台返回的结果）
        	
		}
	});
}


/*zTree func js start*/
var zNodes = [];
var setting = {
	view: {
		selectedMulti: false,
		showLine:true
	},
	edit: {
		enable: true,
		showRemoveBtn: false,
		showRenameBtn: false
	},
	data: {
		keep: {
			parent:true,
			leaf:true
		},
		simpleData: {
			enable: true
		}
	},
	callback: {
		beforeDrag: beforeDrag,
		beforeRemove: beforeRemove,
		beforeRename: beforeRename,
		onRemove: onRemove,
		onClick: zTreeOnClick
	}
};


var log, className = "dark";
function zTreeOnClick(event, treeId, treeNode) {
//    alert(treeNode.id +":"+treeNode.tId + ", " + treeNode.name);
    $("#nodeName").val(treeNode.name);
    $("#nodeName").attr('data-id',treeNode.id);
};

function beforeDrag(treeId, treeNodes) {
	return false;
}
function beforeRemove(treeId, treeNode) {
	className = (className === "dark" ? "":"dark");
	showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
	return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
}
function onRemove(e, treeId, treeNode) {
	showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
}
function beforeRename(treeId, treeNode, newName) {
	if (newName.length == 0) {
		alert("节点名称不能为空.");
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		setTimeout(function(){zTree.editName(treeNode)}, 10);
		return false;
	}
	updateNode(treeNode.id,newName);
	return true;
}
function showLog(str) {
	if (!log) log = $("#log");
	log.append("<li class='"+className+"'>"+str+"</li>");
	if(log.children("li").length > 8) {
		log.get(0).removeChild(log.children("li")[0]);
	}
}
function getTime() {
	var now= new Date(),
	h=now.getHours(),
	m=now.getMinutes(),
	s=now.getSeconds(),
	ms=now.getMilliseconds();
	return (h+":"+m+":"+s+ " " +ms);
}

var newCount = 1;
function add(e) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
	isParent = e.data.isParent,
	nodes = zTree.getSelectedNodes(),
	treeNode = nodes[0];
	if (treeNode) {
		$.ajax({
			type: "post",
	        url: "type/add",
	        data:{pid:treeNode.id,name:"新建文件夹"},
	        dataType: "json",
	        success: function (data,status) {//请求正确执行的方法（后台返回的结果）
	        	if(status=="success"){
	        		treeNode = zTree.addNodes(treeNode, {id:data.result, pId:treeNode.id, isParent:isParent, name:"新建文件夹"});
	    			//treeNode = zTree.addNodes(null, {id:data.result,isParent:true, pId:1, name:"新建文件夹" + (newCount++)});
					zTree.editName(treeNode[0]);
	        		
	        	}
			}
		});
		
	} else {
		$.ajax({
			type: "post",
	        url: "type/add",
	        data:{pid:treeNode.id,name:"新建文件夹"},
	        dataType: "json",
	        success: function (data,status) {//请求正确执行的方法（后台返回的结果）
	        	if(status=="success"){
	        		treeNode = zTree.addNodes(null, {id:data.result, pId:1, isParent:isParent, name:"新建文件夹"});
	        		//treeNode = zTree.addNodes(treeNode, {id:data.result, pId:treeNode.id, isParent:isParent, name:"新建文件夹"});
	    			//treeNode = zTree.addNodes(null, {id:data.result,isParent:true, pId:1, name:"新建文件夹" + (newCount++)});
					zTree.editName(treeNode[0]);
	        		
	        	}
			}
		});
		
	}
	if (treeNode) {
		zTree.editName(treeNode[0]);
	} else {
		alert("叶子节点被锁定，无法增加子节点");
	}
};
function edit() {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
	nodes = zTree.getSelectedNodes(),
	treeNode = nodes[0];
	if (nodes.length == 0) {
		alert("请先选择一个节点");
		return;
	}
	zTree.editName(treeNode);
	//alert(treeNode.name);
	$("#nodeName").val("");
};
function remove(e) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
	nodes = zTree.getSelectedNodes(),
	treeNode = nodes[0];
	if (nodes.length == 0) {
		alert("请先选择一个节点");
		return;
	}
	var callbackFlag = $("#callbackTrigger").attr("checked");
	//删除
	$.ajax({
		type: "post",
        url: "type/delete",
        data:{id:treeNode.id},
        dataType: "json",
        success: function (data) {//请求正确执行的方法（后台返回的结果）
        	if(data.result=="success"){
        		zTree.removeNode(treeNode, callbackFlag);
        		 $("#nodeName").val("");
        	}
		}
	});
	
};
function clearChildren(e) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
	nodes = zTree.getSelectedNodes(),
	treeNode = nodes[0];
	if (nodes.length == 0 || !nodes[0].isParent) {
		alert("请先选择一个父节点");
		return;
	}
	zTree.removeChildNodes(treeNode);
};

/*zTree func js end*/