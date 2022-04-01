{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{foreach $linkBlocks as $linkBlock}
  <div>
    <ul class="uk-nav uk-nav-primary" >
      <li class="uk-parent">
        <a href="#">{$linkBlock.title}</a>
        <ul class="uk-nav-sub">
          {foreach $linkBlock.links as $link}
            <li>
              <a
                id="{$link.id}-{$linkBlock.id}"
                class="{$link.class}"
                href="{$link.url}"
                title="{$link.description}"
                {if !empty($link.target)} target="{$link.target}" {/if}
              >
                {$link.title}
              </a>
            </li>
          {/foreach}
        </ul>
      </li>
    </ul>
  </div>
{/foreach}