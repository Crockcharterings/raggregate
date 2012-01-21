<%inherit file="atom_base.mak" />

<%block name="feed_metadata">
        <title>${feed_title}</title>
        <subtitle>${feed_subtitle}</subtitle>
        <link href="${request.route_url(route)}" rel="self" />
        <id>${feed_title}+${feed_subtitle}+${site_name}</id>
</%block>

% for s in stories:
    <entry>
        <title>${s.title}</title>
        <author>
            <name>${s.submitter.display_name()}</name>
        </author>
        <link href="${request.route_url('full', sub_id=template_filters.get_submission_identifier_for_url(s))}" />
        <id>urn:uuid:${s.id}</id>
        <updated>${s.added_on.isoformat()}</updated>
        <summary>${s.description}</summary>
    </entry>
% endfor

