{**
 * Daniel Nemanic
 * https://daniel-nemanic.de
 * dn@daniel-nemanic.de
 *}
{if $category.is_root_category == 0}
	<div class="uk-card uk-card-default uk-grid-collapse uk-child-width-1-2@s uk-margin" uk-grid>
		<div class="uk-flex-last@s uk-card-media-right uk-cover-container">
        {if $category.image.large.url}
					<img src="{$category.image.large.url}"
					     alt="{if !empty($category.image.legend)}{$category.image.legend}{else}{$category.name}{/if}"
					     loading="lazy"
					     uk-cover>
					<canvas width="600" height="400"></canvas>
        {/if}
		</div>
		<div>
			<div class="uk-card-body">
				<h3 class="uk-card-title">{$category.name}</h3>
          {if $category.description}
						<p>{$category.description nofilter}</p>
          {/if}
			</div>
		</div>
	</div>
{/if}