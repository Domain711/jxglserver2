$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'tactics/tactics/list',
        datatype: "json",
        colModel: [			
			{ label: 'tacid', name: 'tacid', index: 'tacid', width: 50, key: true },
			{ label: '试卷名称', name: 'tacname', index: 'tacname', width: 80 }, 			
			{ label: '学院编号', name: 'collegenum', index: 'collegenum', width: 80 }, 			
			{ label: '学院', name: 'collegename', index: 'collegename', width: 80 }, 			
			{ label: '专业编号', name: 'majornum', index: 'majornum', width: 80 }, 			
			{ label: '专业名称', name: 'majorname', index: 'majorname', width: 80 }, 			
			{ label: '课程编号', name: 'coursenum', index: 'coursenum', width: 80 }, 			
			{ label: '课程名称', name: 'coursename', index: 'coursename', width: 80 }, 			
			{ label: '试卷内容', name: 'content', index: 'content', width: 80 }, 			
			{ label: '创建人', name: 'createid', index: 'createid', width: 80 }, 			
			{ label: '创建时间', name: 'createtime', index: 'createtime', width: 80 }, 			
			{ label: '题型', name: 'qtype', index: 'qtype', width: 80 }, 			
			{ label: '权重', name: 'weight', index: 'weight', width: 80 }			
        ],
		viewrecords: true,
        height: 385,
        rowNum: 10,
		rowList : [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page", 
            rows:"limit", 
            order: "order"
        },
        gridComplete:function(){
        	//隐藏grid底部滚动条
        	$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        }
    });
});

var vm = new Vue({
	el:'#rrapp',
	data:{
		showList: true,
		title: null,
		tactics: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.tactics = {};
		},
		update: function (event) {
			var tacid = getSelectedRow();
			if(tacid == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(tacid)
		},
		saveOrUpdate: function (event) {
			var url = vm.tactics.tacid == null ? "tactics/tactics/save" : "tactics/tactics/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.tactics),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
		del: function (event) {
			var tacids = getSelectedRows();
			if(tacids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "tactics/tactics/delete",
                    contentType: "application/json",
				    data: JSON.stringify(tacids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(tacid){
			$.get(baseURL + "tactics/tactics/info/"+tacid, function(r){
                vm.tactics = r.tactics;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		}
	}
});