// This file is part of the ACTS project.
//
// Copyright (C) 2016 ACTS project team
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

#ifndef ACTS_OBSERVER_LIST_HPP
#define ACTS_OBSERVER_LIST_HPP

#include "ACTS/Propagator/detail/Extendable.hpp"
#include "ACTS/Propagator/detail/observer_list_implementation.hpp"
#include "ACTS/Propagator/detail/observer_signature_check.hpp"
#include "ACTS/Utilities/detail/MPL/all_of.hpp"
#include "ACTS/Utilities/detail/MPL/has_duplicates.hpp"
#include "ACTS/Utilities/detail/MPL/type_collector.hpp"

namespace Acts {

template <typename... observers>
struct ObserverList : private detail::Extendable<observers...>
{
private:
  static_assert(not detail::has_duplicates_v<observers...>,
                "same observer type specified several times");

  // clang-format off
  typedef detail::type_collector_t<detail::result_type_extractor, observers...> results;
  // clang-format on

  using detail::Extendable<observers...>::tuple;

public:
  template <template <typename...> class R>
  using result_type = detail::boost_set_as_tparams_t<R, results>;

  using detail::Extendable<observers...>::get;

  template <typename input, typename result_t>
  void
  operator()(const input& cache, result_t& result) const
  {
    // clang-format off
    static_assert(detail::all_of_v<detail::observer_signature_check_v<observers, input>...>,
                  "not all observers support the specified input");
    // clang-format on

    typedef detail::observer_list_impl<observers...> impl;
    impl::observe(tuple(), cache, result);
  }
};

}  // namespace Acts

#endif  // ACTS_OBSERVER_LIST_HPP