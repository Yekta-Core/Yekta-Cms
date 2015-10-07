<article class="gallery-page">
    <h1 class="top">گالری</h1>
    <section class="body">
        <a href="{$url}gallery/upload" class="nice_button">آپلود تصویر</a>
        <div class="gallery-image-list" id="image-gallery">
            {foreach from=$images item=image}
                <div class="thumb" id="thumb-{$image.id}">
                    <a href="#{$image.id}" data-id="{$image.id}" data-image="{$image.file}">
                        <img src="{$url}{$upload_path}/{$image.thumb}">
                    </a>
                </div>
            {/foreach}
            <div class="clearfix"></div>
            <div class="pages-links">
                {$pages}
            </div>
        </div>
    </section>
</article>

<script>
    window.gallery = {
        uploadPath: '{$upload_path}'
    }
</script>


{if isset($fb_app_id)}
    <div id="fb-root"></div>
    <script>(function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId={$fb_app_id}";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>
{/if}
