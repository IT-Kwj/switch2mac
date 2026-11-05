#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c5 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture3d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    texture3d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _435 = false;
    bool _485 = false;
    bool _1269 = false;
    bool _1169 = false;
    bool _1067 = false;
    bool _233 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_42.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_42.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _52;
    float _68 = _66 * _58;
    float _70 = _66 * _64;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float2 _1662 = float2(_70, _68);
    float4 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1662, float2(0.0), isnan(_1662))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1662, float2(0.0), isnan(_1662))).xyzw;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = _77.w;
    float2 _1681 = float2(_74, _72);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1681, float2(0.0), isnan(_1681))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1681, float2(0.0), isnan(_1681))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    bool _99 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _101 = isnan(0.0);
    bool _103 = _99 || _101;
    bool _105 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _107 = _103 || _105;
    float _109 = 0.0;
    float _111 = _58;
    float _113 = _66;
    if (_107)
    {
        float _115 = _81 * 0.715200006961822509765625;
        _109 = _115;
    }
    float _117 = _109;
    float _119 = _117;
    if (_107)
    {
        float _121 = fma(_79, 0.2125999927520751953125, _117);
        _119 = _121;
    }
    float _123 = _119;
    float _125 = _123;
    if (_107)
    {
        float _127 = fma(_83, 0.072200000286102294921875, _123);
        _111 = _127;
    }
    float _129 = _111;
    if (!_107)
    {
        _125 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _131 = _125;
    float _133 = _129;
    float _135 = _131;
    if (_107)
    {
        float _137 = 1.0 / _129;
        _133 = _137;
    }
    float _139 = _133;
    if (_107)
    {
        float _141 = _139 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _143 = precise::clamp(_141, 0.0, 1.0);
        _113 = _143;
    }
    float _145 = _113;
    if (_107)
    {
        float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _135 = _147;
    }
    float _149 = _135;
    float _151 = fma(_79, _149, _91);
    float _153 = fma(_81, _149, _93);
    float _155 = fma(_83, _149, _95);
    float _157 = _151 * 4.0;
    float _159 = _153 * 4.0;
    float _161 = _155 * 4.0;
    bool _163 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
    uint _166 = as_type<uint>(half2(float2(_157, _159)));
    uint _168 = as_type<uint>(half2(float2(_161, 0.0)));
    uint _170 = extract_bits(_166, 16u, 16u);
    float _172 = float(_170);
    int _175 = int(_166) & 32767;
    uint _177 = extract_bits(_168, 0u, 8u);
    int _179 = int(_177) & 255;
    uint _181 = extract_bits(_168, 8u, 8u);
    int _183 = int(_181) & 255;
    int _185 = _183 << 8;
    int _187 = _179 | _185;
    float _189 = float(uint(_175));
    float _191 = float(uint(_187));
    float _193 = fma(_189, 6.103515625e-05, -0.3125);
    float _195 = fma(_191, 6.103515625e-05, -0.3125);
    float _197 = fma(_172, 6.103515625e-05, -0.3125);
    float _199 = fma(_195, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _201 = fma(_197, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _203 = fma(_193, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _205 = !_163;
    float _207 = _197;
    float _209 = _193;
    float _211 = _193;
    float _213 = _197;
    float _215 = 6.103515625e-05;
    float _217 = _203;
    float _227;
    float _229;
    float _231;
    if (!_205)
    {
        float3 _1879 = float3(_203, _201, _199);
        float3 _219 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1879, float3(0.0), isnan(_1879))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1879, float3(0.0), isnan(_1879))).xyz;
        float _221 = _219.x;
        float _223 = _219.y;
        float _225 = _219.z;
        _227 = _221;
        _229 = _223;
        _231 = _225;
        _233 = true;
    }
    else
    {
        bool _235 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
        bool _237 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
        bool _239 = _235 || _237;
        bool _241 = isnan(0.001000000047497451305389404296875);
        bool _243 = _239 || _241;
        float3 _1915 = float3(_203, _201, _199);
        float3 _245 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1915, float3(0.0), isnan(_1915))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1915, float3(0.0), isnan(_1915))).xyz;
        float _247 = _245.x;
        float _249 = _245.y;
        float _251 = _245.z;
        float _253 = 0.0;
        float _255 = 0.0;
        float _257 = 6.103515625e-05;
        float _259 = _247;
        float _261 = _249;
        _231 = _251;
        if (_243)
        {
            float3 _1935 = float3(_203, _201, _199);
            float3 _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1935, float3(0.0), isnan(_1935))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1935, float3(0.0), isnan(_1935))).xyz;
            float _265 = _263.x;
            float _267 = _263.y;
            float _269 = _263.z;
            _253 = _265;
            _255 = _267;
            _257 = _269;
        }
        float _271 = _253;
        float _273 = _255;
        float _275 = _257;
        float _277 = _275;
        if (_243)
        {
            float _279 = -_247;
            float _281 = _279 + _271;
            _207 = _281;
        }
        float _283 = _207;
        _213 = _283;
        if (_243)
        {
            float _285 = -_249;
            float _287 = _285 + _273;
            _209 = _287;
        }
        float _289 = _209;
        _211 = _289;
        if (_243)
        {
            float _291 = -_251;
            float _293 = _291 + _275;
            _277 = _293;
        }
        float _295 = _277;
        _215 = _295;
        if (_243)
        {
            float _297 = fma(_283, (*spvDescriptorSet0.fp_c4)._m0[5].z, _247);
            _259 = _297;
        }
        float _299 = _259;
        _227 = _299;
        if (_243)
        {
            float _301 = fma(_289, (*spvDescriptorSet0.fp_c4)._m0[5].z, _249);
            _261 = _301;
        }
        float _303 = _261;
        _229 = _303;
        if (_243)
        {
            float _305 = fma(_295, (*spvDescriptorSet0.fp_c4)._m0[5].z, _251);
            _231 = _305;
        }
    }
    _233 = false;
    float _307 = _227;
    float _309 = _229;
    float _311 = _231;
    float _313 = _211;
    float _315 = _213;
    float _317 = _215;
    bool _319 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _321 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _323 = _319 || _321;
    bool _325 = isnan(6.0);
    bool _327 = _323 || _325;
    float _329 = _315;
    float _331 = _317;
    float _333 = _313;
    float _335 = _315;
    float _337 = _317;
    float _339 = _307;
    float _341 = _309;
    float _343 = _311;
    float _429;
    float _431;
    float _433;
    if (!_327)
    {
        float _345 = -_307;
        float _347 = _345 + 1.0;
        float _349 = -_309;
        float _351 = _349 + 1.0;
        float _353 = -_311;
        float _355 = _353 + 1.0;
        float _357 = abs(_347);
        float _359 = log2(_357);
        float _361 = abs(_351);
        float _363 = log2(_361);
        float _365 = abs(_355);
        float _367 = log2(_365);
        float _369 = _359 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _371 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _373 = _363 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _375 = exp2(_369);
        float _377 = _367 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _379 = exp2(_373);
        float _381 = exp2(_377);
        float _383 = fma(_371, _375, 1.0);
        float _385 = fma(_371, _379, 1.0);
        float _387 = 1.0 / _383;
        float _389 = fma(_371, _381, 1.0);
        float _391 = 1.0 / _385;
        float _393 = 1.0 / _389;
        float _395 = _387 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _397 = _391 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _399 = precise::max(_395, _397);
        float _401 = _393 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _403 = precise::max(_401, _399);
        float _405 = -_395;
        float _407 = _405 + _403;
        float _409 = -_397;
        float _411 = _409 + _403;
        float _413 = -_401;
        float _415 = _413 + _403;
        float _417 = fma(_407, (*spvDescriptorSet0.fp_c3)._m0[6].w, _395);
        float _419 = fma(_411, (*spvDescriptorSet0.fp_c3)._m0[6].w, _397);
        float _421 = fma(_415, (*spvDescriptorSet0.fp_c3)._m0[6].w, _401);
        float _423 = _417 * _307;
        float _425 = _419 * _309;
        float _427 = _421 * _311;
        _429 = _423;
        _431 = _425;
        _433 = _427;
        _435 = true;
    }
    else
    {
        bool _437 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_437)
        {
            _217 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _439 = _217;
        bool _441 = !_437;
        float _443 = _439;
        float _473;
        float _475;
        float _483;
        if (!_441)
        {
            float _445 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _447 = _70 + _445;
            float _449 = abs(_447);
            float _451 = _449 * 2560.0;
            bool _453 = _451 >= 2.0;
            bool _455 = isnan(_451);
            bool _457 = _453 || _455;
            bool _459 = isnan(2.0);
            bool _461 = _457 || _459;
            float _463 = _451;
            if (!_461)
            {
                _463 = 0.0;
                _329 = 0.0;
            }
            float _465 = _463;
            float _467 = _329;
            float _469 = _465;
            float _471 = _467;
            _473 = _465;
            _475 = _467;
            if (!_461)
            {
                _331 = 0.0;
            }
            float _477 = _331;
            bool _479 = !_461;
            float _481 = _477;
            _483 = _477;
            _485 = _479;
            if (!_485)
            {
                bool _487 = _70 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_487)
                {
                    _469 = _307;
                }
                float _489 = _469;
                _333 = _489;
                _473 = _489;
                if (_487)
                {
                    _471 = _309;
                }
                float _491 = _471;
                _335 = _491;
                _475 = _491;
                if (_487)
                {
                    _481 = _311;
                }
                float _493 = _481;
                _337 = _493;
                _483 = _493;
                _485 = _487;
                if (!_485)
                {
                    float _495 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _443 = _495;
                }
            }
        }
        if (!_485)
        {
            float _497 = _443;
            float _499 = _333;
            float _501 = _335;
            float _503 = _337;
            bool _505 = _497 != 0.0;
            bool _507 = isnan(_497);
            bool _509 = _505 || _507;
            bool _511 = isnan(0.0);
            bool _513 = _509 || _511;
            float _515 = _499;
            float _517 = _499;
            float _519 = _501;
            float _521 = _503;
            if (!_513)
            {
                float _523 = _309 * 0.586600005626678466796875;
                float _525 = fma(_307, 0.29890000820159912109375, _523);
                float _527 = fma(_311, 0.1143999993801116943359375, _525);
                float _529 = _527 * (-1.44269502162933349609375);
                float _531 = exp2(_529);
                float _533 = -_531;
                float _535 = _533 + 1.0;
                bool _537 = _535 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _539 = isnan(_535);
                bool _541 = _537 || _539;
                bool _543 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _545 = _541 || _543;
                float _547 = _525;
                if (!_545)
                {
                    _547 = _535;
                }
                float _549 = _547;
                bool _551 = !_545;
                float _553 = _549;
                if (!_551)
                {
                    float _555 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _557 = _535 + _555;
                    float _559 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _561 = spvFAdd(_559, 1.00000095367431640625);
                    float _563 = 1.0 / _561;
                    float _565 = _557 * _563;
                    float _567 = -_565;
                    float _569 = _567 + 1.0;
                    float _571 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _573 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _571;
                    float _575 = abs(_569);
                    float _577 = log2(_575);
                    float _579 = _573 * _563;
                    float _581 = _579 + (-1.0);
                    float _583 = _579 * _565;
                    float _585 = _577 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _587 = exp2(_585);
                    float _589 = fma(_581, _587, 1.0);
                    float _591 = 1.0 / _589;
                    float _593 = _583 * _591;
                    float _595 = fma(_561, _593, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _553 = _595;
                }
                float _597 = _553;
                float _599 = -_535;
                float _601 = _599 + _597;
                float _603 = spvFAdd(_527, 9.9999999747524270787835121154785e-07);
                float _605 = _601 + 1.0;
                float _607 = 1.0 / _603;
                float _609 = abs(_605);
                float _611 = log2(_609);
                float _613 = fma(_607, _307, -1.0);
                float _615 = fma(_607, _309, -1.0);
                float _617 = fma(_607, _311, -1.0);
                float _619 = _611 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _621 = exp2(_619);
                float _623 = fma(_621, _613, 1.0);
                float _625 = fma(_621, _615, 1.0);
                float _627 = fma(_621, _617, 1.0);
                float _629 = _623 * _597;
                float _631 = _625 * _597;
                float _633 = _627 * _597;
                float _635 = precise::max(0.0, _629);
                float _637 = precise::max(0.0, _631);
                float _639 = precise::max(0.0, _633);
                float _641 = precise::min(_635, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _643 = precise::min(_637, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _645 = precise::min(_639, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _473 = _641;
                _475 = _643;
                _483 = _645;
                _485 = true;
            }
            else
            {
                bool _647 = _497 != 1.0;
                bool _649 = isnan(_497);
                bool _651 = _647 || _649;
                bool _653 = isnan(1.0);
                bool _655 = _651 || _653;
                if (!_655)
                {
                    bool _657 = _307 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _659 = isnan(_307);
                    bool _661 = _657 || _659;
                    bool _663 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _665 = _661 || _663;
                    float _667 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _669 = spvFAdd(_667, 1.00000095367431640625);
                    bool _671 = _309 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _673 = isnan(_309);
                    bool _675 = _671 || _673;
                    bool _677 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _679 = _675 || _677;
                    bool _681 = _311 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _683 = isnan(_311);
                    bool _685 = _681 || _683;
                    bool _687 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _689 = _685 || _687;
                    float _691 = 1.0 / _669;
                    float _693 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _695 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _693;
                    float _697 = _695 * _691;
                    bool _699 = !_665;
                    if (!_699)
                    {
                        float _701 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _703 = _307 + _701;
                        float _705 = _697 + (-1.0);
                        float _707 = _703 * _691;
                        float _709 = -_707;
                        float _711 = _709 + 1.0;
                        float _713 = _697 * _707;
                        float _715 = abs(_711);
                        float _717 = log2(_715);
                        float _719 = _717 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _721 = exp2(_719);
                        float _723 = fma(_705, _721, 1.0);
                        float _725 = 1.0 / _723;
                        float _727 = _713 * _725;
                        float _729 = fma(_669, _727, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _339 = _729;
                    }
                    float _731 = _339;
                    bool _733 = !_679;
                    if (!_733)
                    {
                        float _735 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _737 = _309 + _735;
                        float _739 = _697 + (-1.0);
                        float _741 = _737 * _691;
                        float _743 = -_741;
                        float _745 = _743 + 1.0;
                        float _747 = _697 * _741;
                        float _749 = abs(_745);
                        float _751 = log2(_749);
                        float _753 = _751 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _755 = exp2(_753);
                        float _757 = fma(_739, _755, 1.0);
                        float _759 = 1.0 / _757;
                        float _761 = _747 * _759;
                        float _763 = fma(_669, _761, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _341 = _763;
                    }
                    float _765 = _341;
                    bool _767 = !_689;
                    if (!_767)
                    {
                        float _769 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _771 = _311 + _769;
                        float _773 = _697 + (-1.0);
                        float _775 = _771 * _691;
                        float _777 = -_775;
                        float _779 = _777 + 1.0;
                        float _781 = _697 * _775;
                        float _783 = abs(_779);
                        float _785 = log2(_783);
                        float _787 = _785 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _789 = exp2(_787);
                        float _791 = fma(_773, _789, 1.0);
                        float _793 = 1.0 / _791;
                        float _795 = _781 * _793;
                        float _797 = fma(_669, _795, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _343 = _797;
                    }
                    float _799 = _343;
                    float _801 = precise::max(0.0, _799);
                    float _803 = precise::max(0.0, _731);
                    float _805 = precise::max(0.0, _765);
                    float _807 = precise::min(_801, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _809 = precise::min(_803, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _811 = precise::min(_805, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _473 = _809;
                    _475 = _811;
                    _483 = _807;
                    _485 = true;
                }
                else
                {
                    bool _813 = _497 != 2.0;
                    bool _815 = isnan(_497);
                    bool _817 = _813 || _815;
                    bool _819 = isnan(2.0);
                    bool _821 = _817 || _819;
                    if (!_821)
                    {
                        float _823 = _309 * 0.715200006961822509765625;
                        float _825 = fma(_307, 0.2125999927520751953125, _823);
                        float _827 = fma(_311, 0.072200000286102294921875, _825);
                        float _829 = spvFAdd(_827, 9.9999999747524270787835121154785e-07);
                        bool _831 = _827 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _833 = isnan(_827);
                        bool _835 = _831 || _833;
                        bool _837 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _839 = _835 || _837;
                        float _841 = 1.0 / _829;
                        bool _843 = !_839;
                        float _845 = _827;
                        if (!_843)
                        {
                            float _847 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _849 = _827 + _847;
                            float _851 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _853 = spvFAdd(_851, 1.00000095367431640625);
                            float _855 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _857 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _855;
                            float _859 = 1.0 / _853;
                            float _861 = _849 * _859;
                            float _863 = _857 * _859;
                            float _865 = -_861;
                            float _867 = _865 + 1.0;
                            float _869 = _863 + (-1.0);
                            float _871 = _863 * _861;
                            float _873 = abs(_867);
                            float _875 = log2(_873);
                            float _877 = _875 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _879 = exp2(_877);
                            float _881 = fma(_869, _879, 1.0);
                            float _883 = 1.0 / _881;
                            float _885 = _871 * _883;
                            float _887 = fma(_853, _885, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _845 = _887;
                        }
                        float _889 = _845;
                        float _891 = precise::max(0.0, _889);
                        float _893 = precise::min(_891, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _895 = _893 * _841;
                        float _897 = _307 * _895;
                        float _899 = _309 * _895;
                        float _901 = _311 * _895;
                        float _903 = precise::max(0.0, _897);
                        float _905 = precise::max(0.0, _899);
                        float _907 = precise::max(0.0, _901);
                        float _909 = precise::min(_903, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _911 = precise::min(_905, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _913 = precise::min(_907, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _473 = _909;
                        _475 = _911;
                        _483 = _913;
                        _485 = true;
                    }
                    else
                    {
                        bool _915 = _497 != 3.0;
                        bool _917 = isnan(_497);
                        bool _919 = _915 || _917;
                        bool _921 = isnan(3.0);
                        bool _923 = _919 || _921;
                        if (!_923)
                        {
                            float _925 = -_307;
                            float _927 = _925 + 1.0;
                            float _929 = -_309;
                            float _931 = _929 + 1.0;
                            float _933 = -_311;
                            float _935 = _933 + 1.0;
                            float _937 = abs(_927);
                            float _939 = log2(_937);
                            float _941 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _943 = abs(_931);
                            float _945 = log2(_943);
                            float _947 = abs(_935);
                            float _949 = log2(_947);
                            float _951 = _939 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _953 = _945 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _955 = exp2(_951);
                            float _957 = _949 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _959 = exp2(_953);
                            float _961 = exp2(_957);
                            float _963 = fma(_941, _955, 1.0);
                            float _965 = fma(_941, _959, 1.0);
                            float _967 = 1.0 / _963;
                            float _969 = fma(_941, _961, 1.0);
                            float _971 = 1.0 / _965;
                            float _973 = 1.0 / _969;
                            float _975 = _967 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _977 = _967 + _971;
                            float _979 = _971 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _981 = _973 + _977;
                            float _983 = _973 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _985 = precise::max(_975, _979);
                            float _987 = _981 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _989 = precise::max(_983, _985);
                            float _991 = _987 * 0.3333333432674407958984375;
                            float _993 = -_991;
                            float _995 = _989 + _993;
                            float _997 = fma(_995, (*spvDescriptorSet0.fp_c3)._m0[7].z, _991);
                            float _999 = -_975;
                            float _1001 = _999 + _997;
                            float _1003 = -_979;
                            float _1005 = _1003 + _997;
                            float _1007 = -_983;
                            float _1009 = _1007 + _997;
                            float _1011 = fma(_1001, (*spvDescriptorSet0.fp_c3)._m0[6].w, _975);
                            float _1013 = fma(_1005, (*spvDescriptorSet0.fp_c3)._m0[6].w, _979);
                            float _1015 = fma(_1009, (*spvDescriptorSet0.fp_c3)._m0[6].w, _983);
                            float _1017 = _1011 * _307;
                            float _1019 = _1013 * _309;
                            float _1021 = _1015 * _311;
                            _473 = _1017;
                            _475 = _1019;
                            _483 = _1021;
                            _485 = true;
                        }
                        else
                        {
                            bool _1023 = _497 != 4.0;
                            bool _1025 = isnan(_497);
                            bool _1027 = _1023 || _1025;
                            bool _1029 = isnan(4.0);
                            bool _1031 = _1027 || _1029;
                            if (!_1031)
                            {
                                bool _1033 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1035 = isnan(0.0);
                                bool _1037 = _1033 || _1035;
                                bool _1039 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1041 = _1037 || _1039;
                                float _1063;
                                float _1065;
                                if (!_1041)
                                {
                                    float _1043 = -_307;
                                    float _1045 = _1043 + 1.0;
                                    float _1047 = abs(_1045);
                                    float _1049 = log2(_1047);
                                    float _1051 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1053 = _1049 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1055 = exp2(_1053);
                                    float _1057 = fma(_1051, _1055, 1.0);
                                    float _1059 = 1.0 / _1057;
                                    float _1061 = _1059 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1063 = _1049;
                                    _1065 = _1061;
                                    _1067 = true;
                                }
                                else
                                {
                                    float _1069 = spvFAdd(_307, 9.9999999747524270787835121154785e-07);
                                    bool _1071 = _307 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1073 = isnan(_307);
                                    bool _1075 = _1071 || _1073;
                                    bool _1077 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1079 = _1075 || _1077;
                                    float _1081 = 1.0 / _1069;
                                    if (!_1079)
                                    {
                                        _515 = _307;
                                    }
                                    float _1083 = _515;
                                    bool _1085 = !_1079;
                                    float _1087 = _1083;
                                    _1063 = _1081;
                                    if (!_1085)
                                    {
                                        float _1089 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1091 = _307 + _1089;
                                        float _1093 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1095 = spvFAdd(_1093, 1.00000095367431640625);
                                        float _1097 = 1.0 / _1095;
                                        float _1099 = _1091 * _1097;
                                        float _1101 = -_1099;
                                        float _1103 = _1101 + 1.0;
                                        float _1105 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1107 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1105;
                                        float _1109 = abs(_1103);
                                        float _1111 = log2(_1109);
                                        float _1113 = _1107 * _1097;
                                        float _1115 = _1113 + (-1.0);
                                        float _1117 = _1113 * _1099;
                                        float _1119 = _1111 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1121 = exp2(_1119);
                                        float _1123 = fma(_1115, _1121, 1.0);
                                        float _1125 = 1.0 / _1123;
                                        float _1127 = _1117 * _1125;
                                        float _1129 = fma(_1095, _1127, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1087 = _1129;
                                    }
                                    float _1131 = _1087;
                                    float _1133 = precise::max(0.0, _1131);
                                    float _1135 = precise::min(_1133, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1137 = _1135 * _1081;
                                    _1065 = _1137;
                                }
                                _1067 = false;
                                float _1139 = _1063;
                                float _1141 = _1065;
                                float _1143 = _1139;
                                float _1165;
                                float _1167;
                                if (!_1041)
                                {
                                    float _1145 = -_309;
                                    float _1147 = _1145 + 1.0;
                                    float _1149 = abs(_1147);
                                    float _1151 = log2(_1149);
                                    float _1153 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1155 = _1151 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1157 = exp2(_1155);
                                    float _1159 = fma(_1153, _1157, 1.0);
                                    float _1161 = 1.0 / _1159;
                                    float _1163 = _1161 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1165 = _1151;
                                    _1167 = _1163;
                                    _1169 = true;
                                }
                                else
                                {
                                    float _1171 = spvFAdd(_309, 9.9999999747524270787835121154785e-07);
                                    bool _1173 = _309 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1175 = isnan(_309);
                                    bool _1177 = _1173 || _1175;
                                    bool _1179 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1181 = _1177 || _1179;
                                    float _1183 = 1.0 / _1171;
                                    if (!_1181)
                                    {
                                        _1143 = _309;
                                    }
                                    float _1185 = _1143;
                                    bool _1187 = !_1181;
                                    float _1189 = _1185;
                                    _1165 = _1183;
                                    if (!_1187)
                                    {
                                        float _1191 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1193 = _309 + _1191;
                                        float _1195 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1197 = spvFAdd(_1195, 1.00000095367431640625);
                                        float _1199 = 1.0 / _1197;
                                        float _1201 = _1193 * _1199;
                                        float _1203 = -_1201;
                                        float _1205 = _1203 + 1.0;
                                        float _1207 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1209 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1207;
                                        float _1211 = abs(_1205);
                                        float _1213 = log2(_1211);
                                        float _1215 = _1209 * _1199;
                                        float _1217 = _1215 + (-1.0);
                                        float _1219 = _1215 * _1201;
                                        float _1221 = _1213 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1223 = exp2(_1221);
                                        float _1225 = fma(_1217, _1223, 1.0);
                                        float _1227 = 1.0 / _1225;
                                        float _1229 = _1219 * _1227;
                                        float _1231 = fma(_1197, _1229, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1189 = _1231;
                                    }
                                    float _1233 = _1189;
                                    float _1235 = precise::max(0.0, _1233);
                                    float _1237 = precise::min(_1235, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1239 = _1237 * _1183;
                                    _1167 = _1239;
                                }
                                _1169 = false;
                                float _1241 = _1165;
                                float _1243 = _1167;
                                float _1245 = _1241;
                                float _1267;
                                if (!_1041)
                                {
                                    float _1247 = -_311;
                                    float _1249 = _1247 + 1.0;
                                    float _1251 = abs(_1249);
                                    float _1253 = log2(_1251);
                                    float _1255 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1257 = _1253 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1259 = exp2(_1257);
                                    float _1261 = fma(_1255, _1259, 1.0);
                                    float _1263 = 1.0 / _1261;
                                    float _1265 = _1263 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1267 = _1265;
                                    _1269 = true;
                                }
                                else
                                {
                                    float _1271 = spvFAdd(_311, 9.9999999747524270787835121154785e-07);
                                    bool _1273 = _311 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1275 = isnan(_311);
                                    bool _1277 = _1273 || _1275;
                                    bool _1279 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1281 = _1277 || _1279;
                                    float _1283 = 1.0 / _1271;
                                    if (!_1281)
                                    {
                                        _1245 = _311;
                                    }
                                    float _1285 = _1245;
                                    bool _1287 = !_1281;
                                    float _1289 = _1285;
                                    if (!_1287)
                                    {
                                        float _1291 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1293 = _311 + _1291;
                                        float _1295 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1297 = spvFAdd(_1295, 1.00000095367431640625);
                                        float _1299 = 1.0 / _1297;
                                        float _1301 = _1293 * _1299;
                                        float _1303 = -_1301;
                                        float _1305 = _1303 + 1.0;
                                        float _1307 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1309 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1307;
                                        float _1311 = abs(_1305);
                                        float _1313 = log2(_1311);
                                        float _1315 = _1309 * _1299;
                                        float _1317 = _1315 + (-1.0);
                                        float _1319 = _1315 * _1301;
                                        float _1321 = _1313 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1323 = exp2(_1321);
                                        float _1325 = fma(_1317, _1323, 1.0);
                                        float _1327 = 1.0 / _1325;
                                        float _1329 = _1319 * _1327;
                                        float _1331 = fma(_1297, _1329, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1289 = _1331;
                                    }
                                    float _1333 = _1289;
                                    float _1335 = precise::max(0.0, _1333);
                                    float _1337 = precise::min(_1335, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1339 = _1337 * _1283;
                                    _1267 = _1339;
                                }
                                _1269 = false;
                                float _1341 = _1267;
                                float _1343 = precise::max(_1141, _1243);
                                float _1345 = precise::max(_1343, _1341);
                                float _1347 = -_1141;
                                float _1349 = _1345 + _1347;
                                float _1351 = -_1243;
                                float _1353 = _1345 + _1351;
                                float _1355 = -_1341;
                                float _1357 = _1345 + _1355;
                                float _1359 = fma(_1349, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1141);
                                float _1361 = fma(_1353, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1243);
                                float _1363 = fma(_1357, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1341);
                                float _1365 = _1359 * _307;
                                float _1367 = _1361 * _309;
                                float _1369 = _1363 * _311;
                                _473 = _1365;
                                _475 = _1367;
                                _483 = _1369;
                                _485 = true;
                            }
                            else
                            {
                                bool _1371 = _497 != 5.0;
                                bool _1373 = isnan(_497);
                                bool _1375 = _1371 || _1373;
                                bool _1377 = isnan(5.0);
                                bool _1379 = _1375 || _1377;
                                if (!_1379)
                                {
                                    _517 = _307;
                                }
                                float _1381 = _517;
                                float _1383 = _1381;
                                _473 = _1381;
                                if (!_1379)
                                {
                                    _519 = _309;
                                }
                                float _1385 = _519;
                                float _1387 = _1385;
                                _475 = _1385;
                                if (!_1379)
                                {
                                    _521 = _311;
                                }
                                float _1389 = _521;
                                bool _1391 = !_1379;
                                float _1393 = _1389;
                                _483 = _1389;
                                if (!_1391)
                                {
                                    bool _1395 = _497 != 6.0;
                                    bool _1397 = isnan(_497);
                                    bool _1399 = _1395 || _1397;
                                    bool _1401 = isnan(6.0);
                                    bool _1403 = _1399 || _1401;
                                    if (!_1403)
                                    {
                                        float _1405 = -_307;
                                        float _1407 = _1405 + 1.0;
                                        float _1409 = -_309;
                                        float _1411 = _1409 + 1.0;
                                        float _1413 = -_311;
                                        float _1415 = _1413 + 1.0;
                                        float _1417 = abs(_1407);
                                        float _1419 = log2(_1417);
                                        float _1421 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1423 = abs(_1411);
                                        float _1425 = log2(_1423);
                                        float _1427 = abs(_1415);
                                        float _1429 = log2(_1427);
                                        float _1431 = _1419 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1433 = _1425 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1435 = exp2(_1431);
                                        float _1437 = _1429 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1439 = exp2(_1433);
                                        float _1441 = exp2(_1437);
                                        float _1443 = fma(_1421, _1435, 1.0);
                                        float _1445 = fma(_1421, _1439, 1.0);
                                        float _1447 = 1.0 / _1443;
                                        float _1449 = fma(_1421, _1441, 1.0);
                                        float _1451 = 1.0 / _1445;
                                        float _1453 = 1.0 / _1449;
                                        float _1455 = _1447 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1457 = _1451 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1459 = precise::max(_1455, _1457);
                                        float _1461 = _1453 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1463 = precise::max(_1461, _1459);
                                        float _1465 = -_1455;
                                        float _1467 = _1465 + _1463;
                                        float _1469 = -_1457;
                                        float _1471 = _1469 + _1463;
                                        float _1473 = -_1461;
                                        float _1475 = _1473 + _1463;
                                        float _1477 = fma(_1467, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1455);
                                        float _1479 = fma(_1471, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1457);
                                        float _1481 = fma(_1475, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1461);
                                        float _1483 = _1477 * _307;
                                        float _1485 = _1479 * _309;
                                        float _1487 = _1481 * _311;
                                        _473 = _1483;
                                        _475 = _1485;
                                        _483 = _1487;
                                        _485 = true;
                                    }
                                    else
                                    {
                                        bool _1489 = _497 != 7.0;
                                        bool _1491 = isnan(_497);
                                        bool _1493 = _1489 || _1491;
                                        bool _1495 = isnan(7.0);
                                        bool _1497 = _1493 || _1495;
                                        if (_1497)
                                        {
                                            _1383 = 0.0;
                                            _1387 = 0.0;
                                        }
                                        float _1499 = _1383;
                                        float _1501 = _1387;
                                        _473 = _1499;
                                        _475 = _1501;
                                        if (_1497)
                                        {
                                            _1393 = 0.0;
                                        }
                                        float _1503 = _1393;
                                        _483 = _1503;
                                        if (!_1497)
                                        {
                                            float _1505 = -_307;
                                            float _1507 = _1505 + 1.0;
                                            float _1509 = -_309;
                                            float _1511 = _1509 + 1.0;
                                            float _1513 = -_311;
                                            float _1515 = _1513 + 1.0;
                                            float _1517 = abs(_1507);
                                            float _1519 = log2(_1517);
                                            float _1521 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1523 = abs(_1511);
                                            float _1525 = log2(_1523);
                                            float _1527 = abs(_1515);
                                            float _1529 = log2(_1527);
                                            float _1531 = _1519 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1533 = _1525 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1535 = exp2(_1531);
                                            float _1537 = _1529 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1539 = exp2(_1533);
                                            float _1541 = exp2(_1537);
                                            float _1543 = fma(_1521, _1535, 1.0);
                                            float _1545 = fma(_1521, _1539, 1.0);
                                            float _1547 = 1.0 / _1543;
                                            float _1549 = fma(_1521, _1541, 1.0);
                                            float _1551 = 1.0 / _1545;
                                            float _1553 = 1.0 / _1549;
                                            float _1555 = _1547 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1557 = -_307;
                                            float _1559 = fma(_1555, _307, _1557);
                                            float _1561 = _1551 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1563 = -_309;
                                            float _1565 = fma(_1561, _309, _1563);
                                            float _1567 = _1553 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1569 = _1559 + _1565;
                                            float _1571 = -_311;
                                            float _1573 = fma(_1567, _311, _1571);
                                            float _1575 = _1573 + _1569;
                                            float _1577 = -_1559;
                                            float _1579 = fma(_1575, 0.3333333432674407958984375, _1577);
                                            float _1581 = -_1565;
                                            float _1583 = fma(_1575, 0.3333333432674407958984375, _1581);
                                            float _1585 = -_1573;
                                            float _1587 = fma(_1575, 0.3333333432674407958984375, _1585);
                                            float _1589 = fma(_1579, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1559);
                                            float _1591 = fma(_1583, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1565);
                                            float _1593 = fma(_1587, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1573);
                                            float _1595 = _1589 + _307;
                                            float _1597 = _1591 + _309;
                                            float _1599 = _1593 + _311;
                                            _473 = _1595;
                                            _475 = _1597;
                                            _483 = _1599;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _485 = false;
        float _1601 = _473;
        float _1603 = _475;
        float _1605 = _483;
        _429 = _1601;
        _431 = _1603;
        _433 = _1605;
    }
    _435 = false;
    float _1607 = _429;
    float _1609 = _431;
    float _1611 = _433;
    float _1613 = _1607 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1615 = _1609 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1617 = _1611 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_45.x = _1613;
    out.m_45.y = _1615;
    out.m_45.z = _1617;
    out.m_45.w = _85;
    return out;
}

