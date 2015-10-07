<div class="gallery-overlay">
    <div class="image-container">
        <span rel="close"></span>
        <table>
            <tr>
                <td class="image">
                    <div class="actions">
                        <a href="{$url}{$upload_path}/{$image->file}" target="_blank" class="zoom" title="اندازه کامل"></a>
                        {if $staff}
                            <a href="#delete" class="delete" rel="delete" data-id="{$image->id}" data-url="{$url}gallery/delete/{$image->id}">حذف</a>
                        {/if}
                    </div>
                    <img src="{$url}{$upload_path}/{$image->file}" class="full-image">
                </td>
                <td class="info">
                    <div>
                        <div class="author">
                            <img src="{$avatar}">
                            <div class="name">{ucfirst($nickname)}</div>
                            <div class="date">{$image->created}</div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="description">
                            {$image->title}
                        </div>

                        <div class="fb-comments"
                            data-href="{$url}gallery/image/{$image->id}"
                            data-order-by="reverse_time"
                            data-width="320"
                            data-num-posts="10"></div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>


<script>
    setTimeout(function () {
        FB.XFBML.parse();
    }, 0)
</script>
