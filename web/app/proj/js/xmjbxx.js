$(function () {
    $("#jqGrid").jqGrid({
        url: '../../proj/xmjbxx/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', width: 50, key: true },
			{ label: '项目名称', name: 'xmmc', width: 80 }, 			
			{ label: '项目类型  0：研制  1：集成  2：论证  99：其它', name: 'xmlx', width: 80 }, 			
			{ label: '项目性质  0：明确任务  1：前期跟踪', name: 'xmxz', width: 80 }, 			
			{ label: '预计合同额', name: 'yjhte', width: 80 }, 			
			{ label: '负责人  ref@sys_user.user_id', name: 'fzrId', width: 80 }, 			
			{ label: '起始日期', name: 'qsrq', width: 80 }, 			
			{ label: '截止日期', name: 'jzrq', width: 80 }, 			
			{ label: '项目描述', name: 'xmms', width: 80 }			
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
            page: "page.curPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"curPage", 
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
	el:'#app',
	data:{
		showList: true,
		title: null,
		xmjbxx: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.xmjbxx = {};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.xmjbxx.id == null ? "../../proj/xmjbxx/save" : "../../proj/xmjbxx/update";
			$.ajax({
				type: "POST",
			    url: url,
			    data: JSON.stringify(vm.xmjbxx),
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
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../../proj/xmjbxx/delete",
				    data: JSON.stringify(ids),
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
		getInfo: function(id){
			$.get("../../proj/xmjbxx/info/"+id, function(r){
                vm.xmjbxx = r.xmjbxx;
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