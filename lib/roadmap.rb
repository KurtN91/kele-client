    
    def get_roadmap (roadmap_id)
        @roadmap_id = roadmap_id
        response = self.class.get(@base_uri, headers: {"authorization" => @auth_token}, body: {roadmap_id: @roadmap_id})
        return JSON.parse(response)
    end
    
    def get_checkpoint (checkpoint_id)
        @checkpoint_id = checkpoint_id
        response = self.class.get(@base_uri, headers: {"authorization" => @auth_token}, body: {checkpoint_id: @checkpoint_id})
        return JSON.parse(response)
    end
    