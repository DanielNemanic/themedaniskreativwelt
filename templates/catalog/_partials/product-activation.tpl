{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $page.admin_notifications}
    <div class="uk-alert-warning" uk-alert>
        <a class="uk-alert-close" uk-close></a>
        {foreach $page.admin_notifications as $notif}
            <span uk-icon="icon: warning"></span>
            <p>{$notif.message}</p>
        {/foreach}
    </div>
{/if}
