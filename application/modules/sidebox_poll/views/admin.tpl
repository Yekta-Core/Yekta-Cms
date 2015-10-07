<section class="box big" id="main_polls">
	<h2>
		<img src="{$url}application/themes/admin/images/icons/black16x16/ic_graph.png"/>
		نظر سنجی ها (<div style="display:inline;" id="polls_count">{if !$polls}0{else}{count($polls)}{/if}</div>)
	</h2>

	<span>
		<a class="nice_button" href="javascript:void(0)" onClick="Poll.add()">ساخت نظرسنجی</a>
	</span>

	<ul id="polls_list">
		{if $polls}
			{foreach from=$polls item=poll}
				<li>
					<table width="100%">
						<tr>
							<td width="80%">{if isset($poll.active)}<span style="padding:0px;display:inline;color:green;">کنونی:</span> {/if}<b>{$poll.question}</b></td>
							<td style="text-align:right;">
								<a href="javascript:void(0)" onClick="Poll.remove({$poll.questionid}, this)" data-tip="حذف"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>
							</td>
						</tr>
					</table>
					<table width="100%">
						{if $poll.answers}
							{foreach from=$poll.answers item=answer}
								<tr>
									<td width="17%" style="padding-left:20px;">
										<b>{$answer.votes} ({if $answer.votes != 0 && $poll.total != 0}{round(($answer.votes / $poll.total) * 100)}{else}0{/if}%)</b>
									</td>
									<td>
										{$answer.answer}
									</td>
								</tr>
							{/foreach}
						{/if}
					</table>
				</li>
			{/foreach}
		{/if}
	</ul>

	<span>
		<center>برای نمایش نظرسنجی، لطفا <b><a href="{$url}admin/sidebox">یک باکس نظرسنجی بسازید</a></b></center>
	</span>
</section>

<section class="box big" id="add_polls" style="display:none;">
	<h2><a href='javascript:void(0)' onClick="Poll.add()" data-tip="بازگشت به نظر سنجی ها">Polls</a> &rarr; نظرسنجی جدید</h2>

	<form onSubmit="Poll.create(this); return false" id="submit_form">

		<label for="question">سوال</label>
		<input type="text" name="question" id="question"/>

		<label>پاسخ ها (<a href="javascript:void(0)" onClick="Poll.addAnswer()"> افزودن بیشتر </a>)</label>
		<div id="answer_fields">
			<input type="text" name="answer_1" id="answer_1" placeholder="پاسخ 1"/>
			<input type="text" name="answer_2" id="answer_2" placeholder="پاسخ 2"/>
		</div>

		<input type="submit" value="ثبت نظرسنجی" />
	</form>
</section>