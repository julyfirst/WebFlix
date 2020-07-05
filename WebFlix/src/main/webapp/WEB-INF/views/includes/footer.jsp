<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!-- Core Scripts - Include with every page -->
    <!-- <script src="/resources/js/jquery-1.10.2.js"></script> -->
    
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>

    <!-- Page-Level Plugin Scripts - Tables -->
    <script src="../resources/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="../resources/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- SB Admin Scripts - Include with every page -->
    <script src="../resources/js/sb-admin.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
        	responsive : true
        });
        
        $(".sidebar-nav")
        	.attr("class", "sidebar=nav navbar-collapse collapse")
	        .attr("aria-expanded", 'false')
	        .attr("style", "height:1px")
        
    });
    </script>
    
	<div class="mv-footer contentbox">
		<h4>웹플릭스</h4>
		<p>서울특별시 관안구 중앙정보처리학원 | 고객센터 010-5499-2825</p>
		<p>대표이사 : 이상현 | 사업자등록번호 123-123-12345</p>
	</div>
</body>

</html>
