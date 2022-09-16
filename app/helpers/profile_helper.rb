module ProfileHelper
    include ActionView::RecordIdentifier

    def following?(user)
        current_user&.followings&.include?(user)
    end

    def dom_id_for_follower(follower)
        dom_id(follower)
    end
end
