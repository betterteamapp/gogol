{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-unused-imports    #-}
{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}

-- |
-- Module      : Network.Google.Resource.PlusDomains.Comments.Get
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Get a comment.
--
-- /See:/ <https://developers.google.com/+/domains/ Google+ Domains API Reference> for @PlusDomainsCommentsGet@.
module Network.Google.Resource.PlusDomains.Comments.Get
    (
    -- * REST Resource
      CommentsGetResource

    -- * Creating a Request
    , commentsGet'
    , CommentsGet'

    -- * Request Lenses
    , cQuotaUser
    , cPrettyPrint
    , cUserIp
    , cKey
    , cOauthToken
    , cCommentId
    , cFields
    , cAlt
    ) where

import           Network.Google.PlusDomains.Types
import           Network.Google.Prelude

-- | A resource alias for @PlusDomainsCommentsGet@ which the
-- 'CommentsGet'' request conforms to.
type CommentsGetResource =
     "comments" :>
       Capture "commentId" Text :>
         QueryParam "quotaUser" Text :>
           QueryParam "prettyPrint" Bool :>
             QueryParam "userIp" Text :>
               QueryParam "key" Text :>
                 QueryParam "oauth_token" Text :>
                   QueryParam "fields" Text :>
                     QueryParam "alt" Alt :> Get '[JSON] Comment

-- | Get a comment.
--
-- /See:/ 'commentsGet'' smart constructor.
data CommentsGet' = CommentsGet'
    { _cQuotaUser   :: !(Maybe Text)
    , _cPrettyPrint :: !Bool
    , _cUserIp      :: !(Maybe Text)
    , _cKey         :: !(Maybe Text)
    , _cOauthToken  :: !(Maybe Text)
    , _cCommentId   :: !Text
    , _cFields      :: !(Maybe Text)
    , _cAlt         :: !Alt
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CommentsGet'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'cQuotaUser'
--
-- * 'cPrettyPrint'
--
-- * 'cUserIp'
--
-- * 'cKey'
--
-- * 'cOauthToken'
--
-- * 'cCommentId'
--
-- * 'cFields'
--
-- * 'cAlt'
commentsGet'
    :: Text -- ^ 'commentId'
    -> CommentsGet'
commentsGet' pCCommentId_ =
    CommentsGet'
    { _cQuotaUser = Nothing
    , _cPrettyPrint = True
    , _cUserIp = Nothing
    , _cKey = Nothing
    , _cOauthToken = Nothing
    , _cCommentId = pCCommentId_
    , _cFields = Nothing
    , _cAlt = JSON
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
cQuotaUser :: Lens' CommentsGet' (Maybe Text)
cQuotaUser
  = lens _cQuotaUser (\ s a -> s{_cQuotaUser = a})

-- | Returns response with indentations and line breaks.
cPrettyPrint :: Lens' CommentsGet' Bool
cPrettyPrint
  = lens _cPrettyPrint (\ s a -> s{_cPrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
cUserIp :: Lens' CommentsGet' (Maybe Text)
cUserIp = lens _cUserIp (\ s a -> s{_cUserIp = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
cKey :: Lens' CommentsGet' (Maybe Text)
cKey = lens _cKey (\ s a -> s{_cKey = a})

-- | OAuth 2.0 token for the current user.
cOauthToken :: Lens' CommentsGet' (Maybe Text)
cOauthToken
  = lens _cOauthToken (\ s a -> s{_cOauthToken = a})

-- | The ID of the comment to get.
cCommentId :: Lens' CommentsGet' Text
cCommentId
  = lens _cCommentId (\ s a -> s{_cCommentId = a})

-- | Selector specifying which fields to include in a partial response.
cFields :: Lens' CommentsGet' (Maybe Text)
cFields = lens _cFields (\ s a -> s{_cFields = a})

-- | Data format for the response.
cAlt :: Lens' CommentsGet' Alt
cAlt = lens _cAlt (\ s a -> s{_cAlt = a})

instance GoogleRequest CommentsGet' where
        type Rs CommentsGet' = Comment
        request = requestWithRoute defReq plusDomainsURL
        requestWithRoute r u CommentsGet'{..}
          = go _cQuotaUser (Just _cPrettyPrint) _cUserIp _cKey
              _cOauthToken
              _cCommentId
              _cFields
              (Just _cAlt)
          where go
                  = clientWithRoute
                      (Proxy :: Proxy CommentsGetResource)
                      r
                      u