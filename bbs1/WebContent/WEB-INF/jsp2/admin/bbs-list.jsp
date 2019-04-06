<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="bbsList" title="bbs列表" 
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'bbs/list.action',method:'get',pageSize:30,toolbar:toolbar">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'id',width:60">帖子ID</th>
            <th data-options="field:'title',width:300">帖子标题</th>
            <th data-options="field:'authorid',width:60">作者ID</th>
            <th data-options="field:'categoryid',width:100">帖子类目</th>
            <th data-options="field:'createdat',width:130,align:'center',formatter:God.formatDateTime">创建日期</th>
        </tr>
    </thead>
</table>
<script>

    function getSelectionsIds(){
    	var bbsList = $("#bbsList");
    	var sels = bbsList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(",");
    	return ids;
    }
    
    var toolbar = [{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中帖子!');
        		return ;
        	}
        	$.messager.confirm('确认','确定删除ID为 '+ids+' 的帖子吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
                	$.post("delete.action",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','删除帖子成功!',undefined,function(){
            					$("#bbsList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    },'-'];
</script>