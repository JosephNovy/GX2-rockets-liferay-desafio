<div class="row justify-content-center widget-mode-card p-1 p-sm-4 card-blog-container">
	<ul class="card-page d-flex justify-content-center mb-0 pl-0">
		<#if entries?has_content>
			<#list entries as curBlogEntry>
				<#if curBlogEntry.getCoverImageURL(themeDisplay)??>
					<#assign cardImage = true />
				<#else>
					<#assign cardImage = false />
				</#if>
				<li class="card-page-item card-page-item-asset card-case shadow-sm p-1 mb-2">
					<div class="img-box-card-case card-item-first">
						<a href="http://localhost:8080/blog/-/blogs/${curBlogEntry.getUrlTitle()}">
							<img alt="thumbnail" class="img-card-case w-100 h-50" src="${cardImage?then(curBlogEntry.getCoverImageURL(themeDisplay), portalUtil.getPathContext(renderRequest) + "/images/cover_image_placeholder.jpg")}">
						</a>
					</div>
					<div class="card-body widget-topbar card-description mx-auto d-flex flex-column">
						<div class="autofit-row card-title">
							<div class="autofit-col autofit-col-expand">
								<#assign viewEntryPortletURL = renderResponse.createRenderURL() />
								${viewEntryPortletURL.setParameter("mvcRenderCommandName", "/blogs/view_entry")}
								${viewEntryPortletURL.setParameter("redirect", currentURL)}
								<#if validator.isNotNull(curBlogEntry.getUrlTitle())>
									${viewEntryPortletURL.setParameter("urlTitle", curBlogEntry.getUrlTitle())}
								<#else>
									${viewEntryPortletURL.setParameter("entryId", curBlogEntry.getEntryId()?string)}
								</#if>
								<h3 class="title case-card-title">
									<a class="title-link text-decoration-none" href="http://localhost:8080/blog/-/blogs/${curBlogEntry.getUrlTitle()}">
									${htmlUtil.escape(blogsEntryUtil.getDisplayTitle(resourceBundle, curBlogEntry))}
									</a>
								</h3>
							</div>
							<div class="autofit-col">
								<@clay["dropdown-actions"]
								additionalProps=blogsEntryActionDropdownAdditionalProps
								dropdownItems=blogsEntryActionDropdownItemsProvider.getActionDropdownItems(curBlogEntry)
								propsTransformer="blogs_admin/js/ElementsPropsTransformer"
								propsTransformerServletContext=blogsEntryActionDropdownPropsTransformerServletContext
								/>
							</div>
						</div>
						<div class="autofit-row widget-metadata">
							<div class="autofit-col autofit-col-expand">
								<#if blogsPortletInstanceConfiguration.enableComments()>
									<div class="autofit-col">
										<#assign viewCommentsPortletURL = renderResponse.createRenderURL() />
										${viewCommentsPortletURL.setParameter("mvcRenderCommandName", "/blogs/view_entry")}
										${viewCommentsPortletURL.setParameter("scroll", renderResponse.getNamespace() + "discussionContainer")}
										<#if validator.isNotNull(curBlogEntry.getUrlTitle())>
											${viewCommentsPortletURL.setParameter("urlTitle", curBlogEntry.getUrlTitle())}
										<#else>
											${viewCommentsPortletURL.setParameter("entryId", curBlogEntry.getEntryId()?string)}
										</#if>
									</div>
								</#if>
							</div>
						</div>
						<#if validator.isNotNull(curBlogEntry.getDescription())>
							<#assign content = curBlogEntry.getDescription() />
						<#else>
							<#assign content = curBlogEntry.getContent() />
						</#if>
                   			<span class="inline-item inline-item-before h-100">
								<@clay["icon"] symbol="comments" />
								<span class="px-1 align-text-center mb-1">
									${commentManager.getCommentsCount("com.liferay.blogs.model.BlogsEntry", curBlogEntry.getEntryId())}
								</span>
							</span> 
					</div>	
				</li>
			</#list>
		</#if>
	</ul>
</div>