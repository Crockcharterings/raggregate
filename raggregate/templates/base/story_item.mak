<%
s = pageargs['story_obj']
vote_dict = pageargs['vote_dict']
%>

              <div class="story-item" id="${s.id}">
                <%include file="vote_form.mak" args="id=s.id, direction='up', target='submission', jump_to=request.url"/>
                <%include file="vote_form.mak" args="id=s.id, direction='down', target='submission', jump_to=request.url"/>
                <div class="story-controls">
                    % if s.id in vote_dict and 1 in vote_dict[s.id]:
                        <div class="story-upvote active-vote"> <img id="upim-${s.id}" src="${static_base}images/arrow-up-active.png" style="padding-bottom: 2px;" /> </div>
                    % else:
                        <div class="story-upvote"> <img id="upim-${s.id}" src="${static_base}images/arrow-up-inactive.png" style="padding-bottom: 2px;" /> </div>
                    % endif
                    <div class="story-score" id="score-${s.id}"> ${s.points} </div>
                    % if s.id in vote_dict and -1 in vote_dict[s.id]:
                        <div class="story-downvote active-vote"> <img id="downim-${s.id}" src="${static_base}images/arrow-down-active.png" style="padding-top: 2px;" /> </div>
                    % else:
                        <div class="story-downvote"> <img id="downim-${s.id}" src="${static_base}images/arrow-down-inactive.png" style="padding-top: 2px;" /> </div>
                    % endif
                </div>
                <div class="story-thumb">
                </div>
                <div class="story-links">
                    % if s.self_post == True:
                        <span class="title"><a href="${request.route_url('full', sub_id=s.id)}">${s.title}</a></span><br />
                    % else:
                        <span class="title"><a href="${s.url}">${s.title}</a></span><br />
                    % endif
                    submitted ${fuzzify_date(s.added_on)} by <a href="${request.route_url('user_info', _query=[('user_id', s.submitter.id)])}">${s.submitter.display_name()}</a><br />
                    <%
                        saved_term = 'save'
                        if u and s in u.saved:
                            saved_term = 'unsave'
                    %>
                    <a href="${request.route_url('full', sub_id=s.id)}">${s.comment_tally} comments</a> &nbsp; | &nbsp; <a href="javascript:void(0)" class="save-link" id="save-${s.id}">${saved_term}</a>
                    % if str(s.submitter.id) == request.session['users.id'] or logged_in_admin:
                        &nbsp; | &nbsp; <a href="${request.route_url('post', _query=[('op', 'del'), ('sub_id', str(s.id))])}">delete</a>
                    % endif
                    <br />
                    % if request.route_url('full', sub_id = s.id) in request.url:
                        <a href="http://twitter.com/share" data-text="${s.title} on ${site_name}: " data-url="${request.route_url('full', sub_id=str(s.id))}" class="twitter-share-button" style="margin-top: 5px;">Tweet</a> <script src="http://connect.facebook.net/en_US/all.js#appId=114620985305159&amp;xfbml=1"></script><fb:like href="${request.route_url('full', sub_id=str(s.id))}" send="false" layout="button_count" width="450" show_faces="false" action="like" font="arial"></fb:like>
                    % endif
                </div>
            </div>
            <br />
 
