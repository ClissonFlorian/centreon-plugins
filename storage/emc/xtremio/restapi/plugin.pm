#
# Copyright 2015 Centreon (http://www.centreon.com/)
#
# Centreon is a full-fledged industry-strength solution that meets
# the needs in IT infrastructure and application monitoring for
# service performance.
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
#

package storage::emc::xtremio::restapi::plugin;

use strict;
use warnings;
use base qw(centreon::plugins::script_custom);

sub new {
    my ($class, %options) = @_;
    my $self = $class->SUPER::new(package => __PACKAGE__, %options);
    bless $self, $class;
    # $options->{options} = options object

    $self->{version} = '1.0';
    %{$self->{modes}} = (
                         'xenvs-cpu'        => 'storage::emc::xtremio::restapi::mode::xenvscpu',
                         'xenvs-state'      => 'storage::emc::xtremio::restapi::mode::xenvsstate',
                         'ssds-endurance'   => 'storage::emc::xtremio::restapi::mode::ssdendurance',
                         'ssds-iops'        => 'storage::emc::xtremio::restapi::mode::ssdiops',
                         'cluster-health'   => 'storage::emc::xtremio::restapi::mode::clusterhealth',
                         );

    $self->{custom_modes}{xtremioapi} = 'storage::emc::xtremio::restapi::custom::xtremioapi';
    return $self;
}

sub init {
    my ($self, %options) = @_;

    $self->SUPER::init(%options);
}

1;

__END__

=head1 PLUGIN DESCRIPTION

Check EMC Xtremio through HTTP/REST API.