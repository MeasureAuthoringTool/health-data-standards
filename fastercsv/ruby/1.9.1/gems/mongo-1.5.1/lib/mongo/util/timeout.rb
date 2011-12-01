# encoding: UTF-8

# --
# Copyright (C) 2008-2011 10gen Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ++
module Mongo #:nodoc:
  module TimeoutWrapper
    extend self

    def timeout_lib=(lib)
      @@timeout_lib = lib
    end

    def timeout_lib
      @@timeout_lib
    end

    def timeout(delay, &block)
      if timeout_lib
        begin
        timeout_lib.timeout(delay, &block)
        rescue ::Timeout::Error
          raise Mongo::OperationTimeout
        end
      else
        yield
      end
    end
  end
end
