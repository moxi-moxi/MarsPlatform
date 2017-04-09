$(function () {
    $("#jqGrid").jqGrid({
        url: '../../proj/xmjbxx/list',
        datatype: "json",
        colNames:['序号','项目名称','项目类型','项目性质', '预计合同额', '负责人','起始日期','截止日期','项目描述'],
        colModel: [			
			{ index: 'id', name: 'id', width: 50, key: true },
			{ index: 'xmmc', name: 'xmmc', width: 80 }, 			
			{ index: 'xmlx', name: 'xmlx', width: 80 }, 			
			{ index: 'xmxz', name: 'xmxz', width: 80 }, 			
			{ index: 'yjhte', name: 'yjhte', width: 80 }, 			
			{ index: 'fzrId', name: 'fzrId', width: 80 }, 			
			{ index: 'qsrq', name: 'qsrq', width: 80 }, 			
			{ index: 'jzrq', name: 'jzrq', width: 80 }, 			
			{ index: 'xmms', name: 'xmms', width: 80 }			
        ],
		viewrecords: true,
        //height: 330,
        rowNum: 10,
		rowList: [10,30,50],
        rownumbers: true, 
        rownumWidth: 25, 
        shrinkToFit: false,
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
        	//$("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" }); 
        	$("#jqGrid").setGridHeight($(window).height() - 126);
        }
    });
});

$(window).on("resize", function() {
	$("#jqGrid").setGridHeight($(window).height() - 126);  
}).resize();


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