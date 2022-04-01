{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}

<script>
    {literal}
    function setcook() {
        var nazwa = 'cookie_ue';
        var wartosc = '1';
        var expire = new Date();
        expire.setMonth(expire.getMonth() + 12);
        document.cookie = nazwa + "=" + escape(wartosc) + ";path=/;" + ((expire == null) ? "" : ("; expires=" + expire.toGMTString()))
    }
    {/literal}
</script>
<div id="coookieModal" class="uk-flex-top" uk-modal="bg-close:false;esc-close:false;">
	<div class="uk-modal-dialog uk-modal-body uk-margin-auto-vertical">

		<button class="uk-modal-close-default" type="button" uk-close onclick="setcook();"></button>

		<p>{$uecookie nofilter}</p>

	</div>
</div>