<article class="gallery-page">
    <h1 class="top">
        <span style="cursor:pointer;" onclick="window.location='{$url}gallery'">گالری</span>
         → Upload
    </h1>
    <section class="body upload-gallery-image-form">
        {form_open_multipart('gallery/upload')}
        <div class="upload-field">
            <input type="file" name="userfile" size="40" />
        </div>
        <div class="description">
            <input name="title" placeholder="یک توضیح کوتاه بدهید" type="text">
        </div>
        <input type="submit" value="upload" /><br/>
        </form>

    </section>
</article>

{if isset($upload_error)}
    <script>
        setTimeout(function () {
            UI.alert('{$upload_error}');
        }, 500);
    </script>
{/if}

{if isset($success)}
    <script>
        setTimeout(function () {
            UI.alert('<span class="success-ui-alert">تصویر شما با موفقیت بارگزاری شد <br/>در حال بازگشت</span>', 5000);
            setTimeout(function () {
                window.location = Config.URL + 'gallery'
            }, 2000);
        }, 500);
    </script>
{/if}
