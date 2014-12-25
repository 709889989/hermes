<table class="table table-hover">
	<thead>
		<tr>
			<th width="25%"><@messages key="model.transaction.datetime" /></th>
			<th width="15%"><@messages key="model.transaction.type" /></th>
			<th width="15%" class="right"><@messages key="account.fund.detail.table.in" /></th>
			<th width="15%" class="right"><@messages key="account.fund.detail.table.out" /></th>
			<th width="30%"><@messages key="model.transaction.remark" /></th>
		</tr>
	</thead>
	<tbody>
		<#if transaction.numberOfElements == 0>
		<tr>
			<td colspan="5" style="text-align:center;"><@messages key="common.grid.no.record" /></td>
		</tr>
		</#if>
		<#list transaction.content as tx>
		<tr>
			<td>${tx.datetime?string('yyyy-MM-dd HH:mm:ss')}</td>
			<td>${tx.typeName}</td>
			<td class="right in" data-type="${tx.type}"><#if tx.amount gt 0>${tx.amount?string('#,##0.00')}<#else>-</#if></td>
			<td class="right out" data-type="${tx.type}"><#if tx.amount lt 0>${tx.amount?string('#,##0.00')}<#else>-</#if></td>
			<td>${tx.remark!'-'}</td>
		</tr>
		</#list>
	</tbody>
</table>

<ul class="pagination" data-number="${transaction.number}" data-total-pages="${transaction.totalPages}"></ul>

<script type="text/javascript">
<!--
jQuery(function($) {
	// ������
	$('table .right').addClass(function() {
		if ($(this).data().type == '${freeze}') {
			return 'gray';
		} else if ($(this).data().type == '${unfreeze}') {
			return 'gray';
		}
	}).formatNumber();
	
	// �����ҳ
	$('.pagination').each(function() {
		// ��ʼ��
		var _elem = $(this).empty(),
			_opts = $.extend({}, _elem.data()),
			_number = _opts.number,
			_pages = _opts.totalPages - 1,
			_begin = ((_number - 3) < 0) ? 0 : (_number - 3),
			_end = ((_number + 3) > _pages) ? _pages : (_number + 3),
			_tag = $('<li />').append($('<a />').attr('href', '#'));
			
		// ����ʼҳ�������ҳʱ������ҳҳ��
		if (_begin > 0) {
			_tag.clone().appendTo(_elem).find('a').attr('data-page', 0).text(1);
			_tag.clone().appendTo(_elem).addClass('disabled').find('a').text('...');
		}
		
		// ����ѭ������ҳ��
		for (var _idx = _begin; _idx <= _end; _idx++) {
			if (_idx === _number) {
				_tag.clone().appendTo(_elem).addClass('active').find('a').text(_idx + 1);
			} else {
				_tag.clone().appendTo(_elem).find('a').attr('data-page', _idx).text(_idx + 1);
			}
		}
		
		// ������ҳ��С����ҳ��ʱ����βҳҳ��
		if (_end < _pages) {
			_tag.clone().appendTo(_elem).addClass('disabled').find('a').text('...');
			_tag.clone().appendTo(_elem).find('a').attr('data-page', _pages).text(_pages + 1);
		}
		
		// ��ҳ�����¼�
		_elem.find('a').on('click', function() {
			$('#page').val($(this).data().page);
			$('#searchForm').trigger('submit');
		});
	});
});
//-->
</script>
