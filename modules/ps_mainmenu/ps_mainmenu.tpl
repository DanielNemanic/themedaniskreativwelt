{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{assign var=_counter value=0}
{function name="submenu" nodes=[] depth=0 parent=null}
    {if $parent === 0}
        <ul class="uk-nav uk-navbar-dropdown-nav">

        {else}
        <ul class="uk-nav-sub">

    {/if}
    {foreach from=$nodes item=node}
        <li class="uk-parent {if $node.current}uk-active{/if}" >
            <a href="{$node.url}" data-depth="{$depth}"
                    {if $node.open_in_new_window} target="_blank" {/if} >
                {$node.label}
            </a>
            {if $node.children|count}
                {submenu nodes=$node.children depth=$node.depth parent=1}
            {/if}
        </li>
    {/foreach}
        </ul>
{/function}
{function name="menu" nodes=[] depth=0 parent=null}
    {if $nodes|count}
        <ul class="uk-navbar-nav">
        {foreach from=$nodes item=node}
            <li class="{$node.type}{if $node.current} uk-active {/if}"
                id="{$node.page_identifier}" >
            {assign var=_counter value=$_counter+1}
              <a href="{$node.url}" data-depth="{$depth}"
                {if $node.open_in_new_window} target="_blank" {/if} >
                  {$node.label}
              </a>
                {if $node.children|count}
                    <div class="uk-navbar-dropdown">
                        {submenu nodes=$node.children depth=$node.depth parent=0}
                    </div>
                {/if}
            </li>
        {/foreach}
      </ul>
    {/if}
{/function}
{function name="offCanvas" nodes=[] depth=0 parent=null}
    {if $nodes|count}
        <ul class="uk-nav uk-nav-primary">
            {foreach from=$nodes item=node}
            <li class="uk-parent {if $node.current}uk-active{/if}" >
                <a href="{$node.url}" data-depth="{$depth}"
                        {if $node.open_in_new_window} target="_blank" {/if} >
                    {$node.label}
                </a>
                {if $node.children|count}
                    {submenu nodes=$node.children depth=$node.depth parent=1}
                {/if}
            </li>
            {/foreach}
        </ul>
    {/if}
{/function}

<div class="uk-margin-left uk-navbar-left uk-visible@s nav-overlay">
    {menu nodes=$menu.children}
</div>

<div id="sideBarMenu" uk-offcanvas="overlay: true">
    <div class="uk-offcanvas-bar">
        <button class="uk-offcanvas-close" type="button" uk-close></button>
        <div class="uk-margin-bottom" uk-grid>
            <div class="uk-width-1-1 uk-text-center">
                {if $shop.logo}
                    <a href="{$urls.base_url}" class="uk-logo">
                        <img loading="lazy" data-src="{$shop.logo}" alt="{$shop.name}" class="logo" uk-img>
                    </a>
                {else}
                    <a href="#" class="uk-logo"><h2 class="daniskreativwelt">Daniskreativwelt</h2></a>
                {/if}
            </div>
        </div>
        {offCanvas nodes=$menu.children}
        <hr>
        <ul class="uk-nav">
            <li>{hook h='displayNav1'}</li>
            <li>{hook h='displayNav2'}</li>
        </ul>
    </div>
</div>