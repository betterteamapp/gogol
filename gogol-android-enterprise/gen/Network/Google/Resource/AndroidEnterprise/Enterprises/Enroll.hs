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
-- Module      : Network.Google.Resource.AndroidEnterprise.Enterprises.Enroll
-- Copyright   : (c) 2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- | Enrolls an enterprise with the calling MDM.
--
-- /See:/ <https://developers.google.com/play/enterprise Google Play EMM API Reference> for @AndroidEnterpriseEnterprisesEnroll@.
module Network.Google.Resource.AndroidEnterprise.Enterprises.Enroll
    (
    -- * REST Resource
      EnterprisesEnrollResource

    -- * Creating a Request
    , enterprisesEnroll'
    , EnterprisesEnroll'

    -- * Request Lenses
    , eeQuotaUser
    , eePrettyPrint
    , eeUserIP
    , eeToken
    , eeKey
    , eeEnterprise
    , eeOAuthToken
    , eeFields
    ) where

import           Network.Google.AndroidEnterprise.Types
import           Network.Google.Prelude

-- | A resource alias for @AndroidEnterpriseEnterprisesEnroll@ which the
-- 'EnterprisesEnroll'' request conforms to.
type EnterprisesEnrollResource =
     "enterprises" :>
       "enroll" :>
         QueryParam "quotaUser" Text :>
           QueryParam "prettyPrint" Bool :>
             QueryParam "userIp" Text :>
               QueryParam "token" Text :>
                 QueryParam "key" Key :>
                   QueryParam "oauth_token" OAuthToken :>
                     QueryParam "fields" Text :>
                       QueryParam "alt" AltJSON :>
                         ReqBody '[JSON] Enterprise :> Post '[JSON] Enterprise

-- | Enrolls an enterprise with the calling MDM.
--
-- /See:/ 'enterprisesEnroll'' smart constructor.
data EnterprisesEnroll' = EnterprisesEnroll'
    { _eeQuotaUser   :: !(Maybe Text)
    , _eePrettyPrint :: !Bool
    , _eeUserIP      :: !(Maybe Text)
    , _eeToken       :: !Text
    , _eeKey         :: !(Maybe Key)
    , _eeEnterprise  :: !Enterprise
    , _eeOAuthToken  :: !(Maybe OAuthToken)
    , _eeFields      :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'EnterprisesEnroll'' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'eeQuotaUser'
--
-- * 'eePrettyPrint'
--
-- * 'eeUserIP'
--
-- * 'eeToken'
--
-- * 'eeKey'
--
-- * 'eeEnterprise'
--
-- * 'eeOAuthToken'
--
-- * 'eeFields'
enterprisesEnroll'
    :: Text -- ^ 'token'
    -> Enterprise -- ^ 'Enterprise'
    -> EnterprisesEnroll'
enterprisesEnroll' pEeToken_ pEeEnterprise_ =
    EnterprisesEnroll'
    { _eeQuotaUser = Nothing
    , _eePrettyPrint = True
    , _eeUserIP = Nothing
    , _eeToken = pEeToken_
    , _eeKey = Nothing
    , _eeEnterprise = pEeEnterprise_
    , _eeOAuthToken = Nothing
    , _eeFields = Nothing
    }

-- | Available to use for quota purposes for server-side applications. Can be
-- any arbitrary string assigned to a user, but should not exceed 40
-- characters. Overrides userIp if both are provided.
eeQuotaUser :: Lens' EnterprisesEnroll' (Maybe Text)
eeQuotaUser
  = lens _eeQuotaUser (\ s a -> s{_eeQuotaUser = a})

-- | Returns response with indentations and line breaks.
eePrettyPrint :: Lens' EnterprisesEnroll' Bool
eePrettyPrint
  = lens _eePrettyPrint
      (\ s a -> s{_eePrettyPrint = a})

-- | IP address of the site where the request originates. Use this if you
-- want to enforce per-user limits.
eeUserIP :: Lens' EnterprisesEnroll' (Maybe Text)
eeUserIP = lens _eeUserIP (\ s a -> s{_eeUserIP = a})

-- | The token provided by the enterprise to register the MDM.
eeToken :: Lens' EnterprisesEnroll' Text
eeToken = lens _eeToken (\ s a -> s{_eeToken = a})

-- | API key. Your API key identifies your project and provides you with API
-- access, quota, and reports. Required unless you provide an OAuth 2.0
-- token.
eeKey :: Lens' EnterprisesEnroll' (Maybe Key)
eeKey = lens _eeKey (\ s a -> s{_eeKey = a})

-- | Multipart request metadata.
eeEnterprise :: Lens' EnterprisesEnroll' Enterprise
eeEnterprise
  = lens _eeEnterprise (\ s a -> s{_eeEnterprise = a})

-- | OAuth 2.0 token for the current user.
eeOAuthToken :: Lens' EnterprisesEnroll' (Maybe OAuthToken)
eeOAuthToken
  = lens _eeOAuthToken (\ s a -> s{_eeOAuthToken = a})

-- | Selector specifying which fields to include in a partial response.
eeFields :: Lens' EnterprisesEnroll' (Maybe Text)
eeFields = lens _eeFields (\ s a -> s{_eeFields = a})

instance GoogleAuth EnterprisesEnroll' where
        authKey = eeKey . _Just
        authToken = eeOAuthToken . _Just

instance GoogleRequest EnterprisesEnroll' where
        type Rs EnterprisesEnroll' = Enterprise
        request
          = requestWithRoute defReq androidEnterpriseURL
        requestWithRoute r u EnterprisesEnroll'{..}
          = go _eeQuotaUser (Just _eePrettyPrint) _eeUserIP
              (Just _eeToken)
              _eeKey
              _eeOAuthToken
              _eeFields
              (Just AltJSON)
              _eeEnterprise
          where go
                  = clientWithRoute
                      (Proxy :: Proxy EnterprisesEnrollResource)
                      r
                      u