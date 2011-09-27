from raggregate import queries
from pyramid.view import view_config

@view_config(renderer='search.mak', route_name='search')
def search(request):
    r = request
    ses = r.session
    try:
        sc = request.registry.solr_conn
    except AttributeError:
        r.session['message'] = 'I could not find the search engine.'
        return {'code': 'ENOSOLR', 'success': False}
    search_term = r.params['term']
    q = sc.query()
    for term in search_term.split():
        q = q.query(term)
    res = q.execute()
    stories = []
    vds = []
    vote_dict = {}
    for r in res:
        stories.append(queries.get_story_by_id(r['id']))
        if 'users.id' in ses:
            vds.append(queries.get_user_votes_on_submission(ses['users.id'], r['id']))
    for vd in vds:
        if type(vd) == dict:
            vote_dict.update(vd)
    #queries.update_story_vote_tally(stories)
    return {'res': res, 'stories': stories, 'vote_dict': vote_dict}