<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/tags.jsp"%>
<app:template title="我的应用" type="ace">
<jsp:attribute name="header"> 
</jsp:attribute>
<jsp:attribute name="footer">
<script src="plug-in/sino/ui/sino02/assets/js/jquery.dataTables.min.js"></script>
<script src="plug-in/sino/ui/sino02/assets/js/jquery.dataTables.bootstrap.js"></script>
<link rel="stylesheet" href="plug-in/sino/ui/sino02/assets/css/jquery-ui-1.10.3.full.min.css" />
<script src="plug-in/sino/ui/sino02/assets/js/jquery-ui-1.10.3.full.min.js"></script>
<script src="plug-in/sino/ui/sino02/assets/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript">
jQuery(function($) {
	var oTable1 = $('#sample-table-2').dataTable( {
	"aoColumns": [
      { "bSortable": false },
      null, null,null, null, null,
	  { "bSortable": false }
	] } );
	
	
	$('table th input:checkbox').on('click' , function(){
		var that = this;
		$(this).closest('table').find('tr > td:first-child input:checkbox')
		.each(function(){
			this.checked = that.checked;
			$(this).closest('tr').toggleClass('selected');
		});
			
	});


	$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
	function tooltip_placement(context, source) {
		var $source = $(source);
		var $parent = $source.closest('table')
		var off1 = $parent.offset();
		var w1 = $parent.width();

		var off2 = $source.offset();
		var w2 = $source.width();

		if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
		return 'left';
	}
	
	
	
	$( "#accordion" ).accordion({
		collapsible: true ,
		heightStyle: "content",
		animate: 250,
		header: ".accordion-header"
	}).sortable({
		axis: "y",
		handle: ".accordion-header",
		stop: function( event, ui ) {
			// IE doesn't register the blur when sorting
			// so trigger focusout handlers to remove .ui-state-focus
			ui.item.children( ".accordion-header" ).triggerHandler( "focusout" );
		}
	});
	
})
</script>
</jsp:attribute>
<jsp:body>


<div class="row">
	<div class="col-xs-12">
		<h3 class="header smaller lighter green">Application Buttons</h3>

		<p>
			<a href="#" class="btn btn-default btn-app radius-4">
				<i class="icon-cog bigger-230"></i>
				Default
				<span class="badge badge-pink">+3</span>
			</a>

			<a href="#" class="btn btn-app btn-primary no-radius">
				<i class="icon-edit bigger-230"></i>
				编辑
				<span class="badge badge-warning badge-left">11</span>
			</a>

			<a href="#" class="btn btn-app btn-success">
				<i class="icon-refresh bigger-230"></i>
				Reload
			</a>

			<button class="btn btn-app btn-warning">
				<i class="icon-undo bigger-230"></i>
				Undo
			</button>

			<a href="#" class="btn btn-app btn-info btn-sm no-radius">
				<i class="icon-envelope bigger-200"></i>
				Mailbox
				<span class="label label-inverse arrowed-in">6+</span>
			</a>

			<button class="btn btn-app btn-danger btn-sm">
				<i class="icon-trash bigger-200"></i>
				Delete
			</button>

			<button class="btn btn-app btn-purple btn-sm">
				<i class="icon-cloud-upload bigger-200"></i>
				Upload
			</button>

			<button class="btn btn-app btn-pink btn-sm">
				<i class="icon-share-alt bigger-200"></i>
				Share
			</button>

			<button class="btn btn-app btn-inverse btn-xs">
				<i class="icon-lock bigger-160"></i>
				Lock
			</button>

			<button class="btn btn-app btn-grey btn-xs radius-4">
				<i class="icon-save bigger-160"></i>

				Save
				<span class="badge badge-transparent">
					<i class="light-red icon-asterisk"></i>
				</span>
			</button>

			<button class="btn btn-app btn-light btn-xs">
				<i class="icon-print bigger-160"></i>
				Print
			</button>

			<a href="#" class="btn btn-app btn-yellow btn-xs">
				<i class="icon-shopping-cart bigger-160"></i>
				Shop
			</a>
		</p>
	</div>
</div>

<div class="hr hr-18 dotted hr-double"></div>

<div class="row">
	<div class="col-sm-6">
		<h3 class="header smaller lighter green">Lables & Badges</h3>

		<p>
			<span class="label">Default</span>
			<span class="label label-success arrowed">Success</span>

			<span class="label label-warning">
				<i class="icon-warning-sign bigger-120"></i>
				Warning
			</span>
			<span class="label label-danger arrowed-in">Danger</span>
			<span class="label label-info arrowed-in-right arrowed">Info</span>
			<span class="label label-inverse">Inverse</span>
		</p>

		<p>
			<span class="badge">1</span>
			<span class="badge badge-grey">1</span>
			<span class="badge badge-success">2</span>
			<span class="badge badge-warning">4</span>
			<span class="badge badge-danger">6</span>
			<span class="badge badge-info">8</span>
			<span class="badge badge-purple">3</span>
			<span class="badge badge-inverse">10</span>
			<span class="badge badge-pink">11</span>
			<span class="badge badge-yellow">2</span>
		</p>

		<p>
			<span class="label label-lg label-pink arrowed-right">Large</span>
			<span class="label label-lg label-yellow arrowed-in">Yellow</span>
			<span class="label label-lg label-purple arrowed">Purple</span>
		</p>

		<p>
			<span class="label label-xlg label-primary arrowed arrowed-right">Larger</span>
			<span class="label label-xlg label-grey arrowed-in-right arrowed-in">Grey</span>
			<span class="label label-xlg label-light arrowed-in-right">Light</span>
		</p>

		<p>
			<span class="label label-sm label-primary arrowed arrowed-right">Smaller</span>
		</p>
	</div><!-- /span -->

	<div class="col-sm-6">
		<h3 class="header smaller lighter red">Pagination</h3>

		<div>
			<ul class="pagination">
				<li class="disabled">
					<a href="#">
						<i class="icon-double-angle-left"></i>
					</a>
				</li>

				<li class="active">
					<a href="#">1</a>
				</li>

				<li>
					<a href="#">2</a>
				</li>

				<li>
					<a href="#">3</a>
				</li>

				<li>
					<a href="#">4</a>
				</li>

				<li>
					<a href="#">5</a>
				</li>

				<li>
					<a href="#">
						<i class="icon-double-angle-right"></i>
					</a>
				</li>
			</ul>
		</div>

		<p></p>
		<ul class="pager">
			<li class="previous">
				<a href="#">&larr; Older</a>
			</li>

			<li class="next">
				<a href="#">Newer &rarr;</a>
			</li>
		</ul>
		
	</div><!-- /span -->
</div><!-- /row -->


<div class="hr hr-18 dotted hr-double"></div>


<div class="row">
	<div class="col-sm-12">
		<div class="tabbable">
			<ul class="nav nav-tabs" id="myTab">
				<li class="active">
					<a data-toggle="tab" href="#home">
						<i class="green icon-home bigger-110"></i>
						Home
					</a>
				</li>
	
				<li>
					<a data-toggle="tab" href="#profile">
						Messages
						<span class="badge badge-danger">4</span>
					</a>
				</li>
	
				<li class="dropdown">
					<a data-toggle="dropdown" class="dropdown-toggle" href="#">
						Dropdown &nbsp;
						<i class="icon-caret-down bigger-110 width-auto"></i>
					</a>
	
					<ul class="dropdown-menu dropdown-info">
						<li>
							<a data-toggle="tab" href="#dropdown1">@fat</a>
						</li>
	
						<li>
							<a data-toggle="tab" href="#dropdown2">@mdo</a>
						</li>
					</ul>
				</li>
			</ul>
	
			<div class="tab-content">
				<div id="home" class="tab-pane in active">
					<p>Raw denim you probably haven't heard of them jean shorts Austin.</p>
				</div>
	
				<div id="profile" class="tab-pane">
					<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.</p>
				</div>
	
				<div id="dropdown1" class="tab-pane">
					<p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade.</p>
				</div>
	
				<div id="dropdown2" class="tab-pane">
					<p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin.</p>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="hr hr-18 dotted hr-double"></div>






















<div class="row">
	<div class="col-xs-12">
		<div class="table-responsive">
			<table id="sample-table-1" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</th>
						<th>Domain</th>
						<th>Price</th>
						<th class="hidden-480">Clicks</th>

						<th>
							<i class="icon-time bigger-110 hidden-480"></i>
							Update
						</th>
						<th class="hidden-480">Status</th>

						<th></th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">ace.com</a>
						</td>
						<td>$45</td>
						<td class="hidden-480">3,330</td>
						<td>Feb 12</td>

						<td class="hidden-480">
							<span class="label label-sm label-warning">Expiring</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
								<button class="btn btn-xs btn-success">
									<i class="icon-ok bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-info">
									<i class="icon-edit bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-danger">
									<i class="icon-trash bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-warning">
									<i class="icon-flag bigger-120"></i>
								</button>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
										<i class="icon-cog icon-only bigger-110"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">base.com</a>
						</td>
						<td>$35</td>
						<td class="hidden-480">2,595</td>
						<td>Feb 18</td>

						<td class="hidden-480">
							<span class="label label-sm label-success">Registered</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
								<button class="btn btn-xs btn-success">
									<i class="icon-ok bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-info">
									<i class="icon-edit bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-danger">
									<i class="icon-trash bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-warning">
									<i class="icon-flag bigger-120"></i>
								</button>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
										<i class="icon-cog icon-only bigger-110"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">max.com</a>
						</td>
						<td>$60</td>
						<td class="hidden-480">4,400</td>
						<td>Mar 11</td>

						<td class="hidden-480">
							<span class="label label-sm label-warning">Expiring</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
								<button class="btn btn-xs btn-success">
									<i class="icon-ok bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-info">
									<i class="icon-edit bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-danger">
									<i class="icon-trash bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-warning">
									<i class="icon-flag bigger-120"></i>
								</button>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
										<i class="icon-cog icon-only bigger-110"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">best.com</a>
						</td>
						<td>$75</td>
						<td class="hidden-480">6,500</td>
						<td>Apr 03</td>

						<td class="hidden-480">
							<span class="label label-sm label-inverse arrowed-in">Flagged</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
								<button class="btn btn-xs btn-success">
									<i class="icon-ok bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-info">
									<i class="icon-edit bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-danger">
									<i class="icon-trash bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-warning">
									<i class="icon-flag bigger-120"></i>
								</button>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
										<i class="icon-cog icon-only bigger-110"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">pro.com</a>
						</td>
						<td>$55</td>
						<td class="hidden-480">4,250</td>
						<td>Jan 21</td>

						<td class="hidden-480">
							<span class="label label-sm label-success">Registered</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
								<button class="btn btn-xs btn-success">
									<i class="icon-ok bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-info">
									<i class="icon-edit bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-danger">
									<i class="icon-trash bigger-120"></i>
								</button>

								<button class="btn btn-xs btn-warning">
									<i class="icon-flag bigger-120"></i>
								</button>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
										<i class="icon-cog icon-only bigger-110"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!-- /.table-responsive -->
	</div><!-- /span -->
</div><!-- /row -->




<div class="hr hr-18 dotted hr-double"></div>

<h4 class="pink">
	<i class="icon-hand-right icon-animated-hand-pointer blue"></i>
	<a href="#modal-table" role="button" class="green" data-toggle="modal"> Table Inside a Modal Box </a>
</h4>

<div class="hr hr-18 dotted hr-double"></div>





<div class="row">
	<div class="col-xs-12">
		<h3 class="header smaller lighter blue">jQuery dataTables</h3>
		<div class="table-header">
			Results for "Latest Registered Domains"
		</div>

		<div class="table-responsive">
			<table id="sample-table-2" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</th>
						<th>Domain</th>
						<th>Price</th>
						<th class="hidden-480">Clicks</th>

						<th>
							<i class="icon-time bigger-110 hidden-480"></i>
							Update
						</th>
						<th class="hidden-480">Status</th>

						<th></th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">app.com</a>
						</td>
						<td>$45</td>
						<td class="hidden-480">3,330</td>
						<td>Feb 12</td>

						<td class="hidden-480">
							<span class="label label-sm label-warning">Expiring</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">base.com</a>
						</td>
						<td>$35</td>
						<td class="hidden-480">2,595</td>
						<td>Feb 18</td>

						<td class="hidden-480">
							<span class="label label-sm label-success">Registered</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">max.com</a>
						</td>
						<td>$60</td>
						<td class="hidden-480">4,400</td>
						<td>Mar 11</td>

						<td class="hidden-480">
							<span class="label label-sm label-warning">Expiring</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">best.com</a>
						</td>
						<td>$75</td>
						<td class="hidden-480">6,500</td>
						<td>Apr 03</td>

						<td class="hidden-480">
							<span class="label label-sm label-inverse arrowed-in">Flagged</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">pro.com</a>
						</td>
						<td>$55</td>
						<td class="hidden-480">4,250</td>
						<td>Jan 21</td>

						<td class="hidden-480">
							<span class="label label-sm label-success">Registered</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">team.com</a>
						</td>
						<td>$40</td>
						<td class="hidden-480">3,200</td>
						<td>Feb 09</td>

						<td class="hidden-480">
							<span class="label label-sm label-inverse arrowed-in">Flagged</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">up.com</a>
						</td>
						<td>$95</td>
						<td class="hidden-480">8,520</td>
						<td>Feb 22</td>

						<td class="hidden-480">
							<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">view.com</a>
						</td>
						<td>$45</td>
						<td class="hidden-480">4,100</td>
						<td>Mar 12</td>

						<td class="hidden-480">
							<span class="label label-sm label-success">Registered</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">nice.com</a>
						</td>
						<td>$38</td>
						<td class="hidden-480">3,940</td>
						<td>Feb 12</td>

						<td class="hidden-480">
							<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">fine.com</a>
						</td>
						<td>$25</td>
						<td class="hidden-480">2,983</td>
						<td>Apr 01</td>

						<td class="hidden-480">
							<span class="label label-sm label-warning">Expiring</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">good.com</a>
						</td>
						<td>$50</td>
						<td class="hidden-480">6,500</td>
						<td>Feb 02</td>

						<td class="hidden-480">
							<span class="label label-sm label-inverse arrowed-in">Flagged</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">great.com</a>
						</td>
						<td>$55</td>
						<td class="hidden-480">6,400</td>
						<td>Feb 24</td>

						<td class="hidden-480">
							<span class="label label-sm label-success">Registered</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">shine.com</a>
						</td>
						<td>$25</td>
						<td class="hidden-480">2,200</td>
						<td>Apr 01</td>

						<td class="hidden-480">
							<span class="label label-sm label-inverse arrowed-in">Flagged</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">rise.com</a>
						</td>
						<td>$42</td>
						<td class="hidden-480">3,900</td>
						<td>Feb 01</td>

						<td class="hidden-480">
							<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">above.com</a>
						</td>
						<td>$35</td>
						<td class="hidden-480">3,420</td>
						<td>Mar 12</td>

						<td class="hidden-480">
							<span class="label label-sm label-warning">Expiring</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">share.com</a>
						</td>
						<td>$30</td>
						<td class="hidden-480">3,200</td>
						<td>Feb 11</td>

						<td class="hidden-480">
							<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">fair.com</a>
						</td>
						<td>$35</td>
						<td class="hidden-480">3,900</td>
						<td>Mar 26</td>

						<td class="hidden-480">
							<span class="label label-sm label-inverse arrowed-in">Flagged</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">year.com</a>
						</td>
						<td>$48</td>
						<td class="hidden-480">3,990</td>
						<td>Feb 15</td>

						<td class="hidden-480">
							<span class="label label-sm label-warning">Expiring</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">day.com</a>
						</td>
						<td>$55</td>
						<td class="hidden-480">5,600</td>
						<td>Jan 29</td>

						<td class="hidden-480">
							<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">light.com</a>
						</td>
						<td>$40</td>
						<td class="hidden-480">3,100</td>
						<td>Feb 17</td>

						<td class="hidden-480">
							<span class="label label-sm label-success">Registered</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">sight.com</a>
						</td>
						<td>$58</td>
						<td class="hidden-480">6,100</td>
						<td>Feb 19</td>

						<td class="hidden-480">
							<span class="label label-sm label-inverse arrowed-in">Flagged</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">right.com</a>
						</td>
						<td>$50</td>
						<td class="hidden-480">4,400</td>
						<td>Apr 01</td>

						<td class="hidden-480">
							<span class="label label-sm label-warning">Expiring</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>

					<tr>
						<td class="center">
							<label>
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</td>

						<td>
							<a href="#">once.com</a>
						</td>
						<td>$20</td>
						<td class="hidden-480">1,400</td>
						<td>Apr 04</td>

						<td class="hidden-480">
							<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
						</td>

						<td>
							<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
								<a class="blue" href="#">
									<i class="icon-zoom-in bigger-130"></i>
								</a>

								<a class="green" href="#">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="red" href="#">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>

							<div class="visible-xs visible-sm hidden-md hidden-lg">
								<div class="inline position-relative">
									<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
										<i class="icon-caret-down icon-only bigger-120"></i>
									</button>

									<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
										<li>
											<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
												<span class="blue">
													<i class="icon-zoom-in bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
												<span class="green">
													<i class="icon-edit bigger-120"></i>
												</span>
											</a>
										</li>

										<li>
											<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
												<span class="red">
													<i class="icon-trash bigger-120"></i>
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="hr hr-18 dotted hr-double"></div>




<div class="row">
	<div class="col-xs-12 col-sm-12 widget-container-span ui-sortable">
		<div class="widget-box">
			<div class="widget-header header-color-blue2">
				<h5>Default Widget Box</h5>
	
				<div class="widget-toolbar">
					<a href="#" data-action="settings">
						<i class="icon-cog"></i>
					</a>
	
					<a href="#" data-action="reload">
						<i class="icon-refresh"></i>
					</a>
	
					<a href="#" data-action="collapse">
						<i class="icon-chevron-up"></i>
					</a>
	
					<a href="#" data-action="close">
						<i class="icon-remove"></i>
					</a>
				</div>
			</div>
	
			<div class="widget-body">
				<div class="widget-main">
					<p class="alert alert-info">
						Nunc aliquam enim ut arcu aliquet adipiscing. Fusce dignissim volutpat justo non consectetur. Nulla fringilla eleifend consectetur.
					</p>
					<p class="alert alert-success">
						Raw denim you probably haven't heard of them jean shorts Austin.
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="hr hr-18 dotted hr-double"></div>





<div class="row">
	<div class="col-sm-12">
	
		<h3 class="header blue lighter smaller">
			<i class="icon-list smaller-90"></i>
			Sortable Accordion
		</h3>

		<div id="accordion" class="accordion-style2 ui-accordion ui-widget ui-helper-reset ui-sortable" role="tablist">
			<div class="group">
				<h3 class="accordion-header ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-corner-all" role="tab" id="ui-accordion-accordion-header-0" aria-controls="ui-accordion-accordion-panel-0" aria-selected="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>Section 1</h3>
	
				<div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-0" aria-labelledby="ui-accordion-accordion-header-0" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;">
					<p>
						Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer
						ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit
						amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut
						odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.
					</p>
				</div>
			</div>
	
			<div class="group">
				<h3 class="accordion-header ui-accordion-header ui-helper-reset ui-state-default ui-accordion-icons ui-accordion-header-active ui-state-active ui-corner-top" role="tab" id="ui-accordion-accordion-header-1" aria-controls="ui-accordion-accordion-panel-1" aria-selected="true" tabindex="0"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>Section 2</h3>
	
				<div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom ui-accordion-content-active" id="ui-accordion-accordion-panel-1" aria-labelledby="ui-accordion-accordion-header-1" role="tabpanel" aria-expanded="true" aria-hidden="false" style="display: block;">
					<p>
						Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
						purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
						velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
						suscipit faucibus urna.
					</p>
				</div>
			</div>
	
			<div class="group">
				<h3 class="accordion-header ui-accordion-header ui-helper-reset ui-state-default ui-corner-all ui-accordion-icons" role="tab" id="ui-accordion-accordion-header-2" aria-controls="ui-accordion-accordion-panel-2" aria-selected="false" tabindex="-1"><span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-e"></span>Section 3</h3>
	
				<div class="ui-accordion-content ui-helper-reset ui-widget-content ui-corner-bottom" id="ui-accordion-accordion-panel-2" aria-labelledby="ui-accordion-accordion-header-2" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;">
					<p>
						Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
						Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
						ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
						lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
					</p>
	
					<ul>
						<li>List item one</li>
						<li>List item two</li>
						<li>List item three</li>
					</ul>
				</div>
			</div>
		</div><!-- #accordion -->
	
	</div>
</div>

<div class="hr hr-18 dotted hr-double"></div>







<br><br><br><br><br>


</jsp:body>
</app:template>