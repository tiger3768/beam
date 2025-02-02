/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import '../sdk.dart';
import 'example_loading_descriptor.dart';

const _key = 'empty';

/// Indicates that an empty content should be loaded for the [sdk].
class EmptyExampleLoadingDescriptor extends ExampleLoadingDescriptor {
  final Sdk sdk;

  const EmptyExampleLoadingDescriptor({
    required this.sdk,
  });

  @override
  List<Object> get props => [sdk.id];

  @override
  EmptyExampleLoadingDescriptor copyWithoutViewOptions() => this;

  @override
  Map<String, dynamic> toJson() => {
        _key: true,
        'sdk': sdk.id,
      };

  static EmptyExampleLoadingDescriptor? tryParse(
    Map<String, dynamic> map,
  ) {
    if (!map.containsKey(_key)) {
      return null;
    }

    return EmptyExampleLoadingDescriptor(
      sdk: Sdk.parseOrCreate(map['sdk']),
    );
  }
}
