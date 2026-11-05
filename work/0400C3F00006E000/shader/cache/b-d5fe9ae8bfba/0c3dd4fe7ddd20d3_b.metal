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
    bool _545 = false;
    bool _595 = false;
    bool _1385 = false;
    bool _1285 = false;
    bool _1183 = false;
    bool _301 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_42.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_42.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _52;
    float _68 = _66 * _58;
    float _70 = _66 * _64;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float2 _1774 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1774, float2(0.0), isnan(_1774))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1774, float2(0.0), isnan(_1774))).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    float _85 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float2 _1797 = float2(_72, _85);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1797, float2(0.0), isnan(_1797))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1797, float2(0.0), isnan(_1797))).xyz;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _70 + (-0.5);
    float _99 = _68 + (-0.5);
    float _101 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[7].x, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _103 = _99 + (*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _105 = _101 * _101;
    bool _109 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _117 = _113 || _115;
    bool _119 = (*spvDescriptorSet0.fp_c4)._m0[6].w > (-1.0999999631167156621813774108887e-06);
    float _121 = fma(_103, _103, _105);
    float _123 = abs((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _125 = -_123;
    float _127 = fma(_125, 2.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _129 = precise::max(0.0, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    bool _131 = (*spvDescriptorSet0.fp_c4)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
    bool _133 = isnan((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _135 = _131 || _133;
    bool _137 = isnan(-1.0999999631167156621813774108887e-06);
    bool _139 = _135 || _137;
    float _141 = sqrt(_121);
    float _143 = precise::max(0.0, _127);
    float _145 = -_143;
    float _147 = _129 + _145;
    float _149 = 1.0 / _147;
    float _151 = -_143;
    float _153 = _141 + _151;
    float _155 = _153 * _149;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = fma(_157, -2.0, 3.0);
    float _161 = _157 * _157;
    float _163 = _157;
    float _165 = _143;
    float _167 = _147;
    if (!_117)
    {
        _163 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _169 = _163;
    float _171 = fma(_161, _159, -0.5);
    int _174 = _139 ? 0 : 1;
    float _176 = _169;
    if (_117)
    {
        float _178 = _79 * 0.715200006961822509765625;
        _165 = _178;
    }
    float _180 = _165;
    float _182 = _180;
    if (_117)
    {
        float _184 = fma(_77, 0.2125999927520751953125, _180);
        _182 = _184;
    }
    float _186 = _182;
    float _188 = _186;
    if (_117)
    {
        float _190 = fma(_81, 0.072200000286102294921875, _186);
        _188 = _190;
    }
    float _192 = _188;
    float _194 = _192;
    if (_117)
    {
        float _196 = 1.0 / _192;
        _194 = _196;
    }
    float _198 = _194;
    if (_117)
    {
        float _200 = _198 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _202 = precise::clamp(_200, 0.0, 1.0);
        _167 = _202;
    }
    float _204 = _167;
    int _206 = ~_174;
    int _208 = _206 + 1;
    int _210 = _208 + 1;
    int _212 = _210;
    float _214 = _204;
    if (!_119)
    {
        int _216 = ~_174;
        int _218 = _216 + 1;
        _212 = _218;
    }
    int _220 = _212;
    if (_117)
    {
        float _222 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _176 = _222;
    }
    float _224 = _176;
    float _226 = fma(_77, _224, _91);
    float _228 = fma(_79, _224, _93);
    float _230 = float(_220);
    float _232 = fma(_81, _224, _95);
    float _234 = _226 * 4.0;
    float _236 = _228 * 4.0;
    float _238 = fma(_171, _230, 0.5);
    float _240 = _232 * 4.0;
    uint _243 = as_type<uint>(half2(float2(_234, _236)));
    float _245 = precise::max(_238, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    uint _247 = extract_bits(_243, 16u, 16u);
    float _249 = float(_247);
    uint _251 = as_type<uint>(half2(float2(_240, 0.0)));
    bool _253 = _245 > 0.999000012874603271484375;
    int _255 = int(_243) & 32767;
    uint _257 = extract_bits(_251, 0u, 8u);
    int _259 = int(_257) & 255;
    uint _261 = extract_bits(_251, 8u, 8u);
    int _263 = int(_261) & 255;
    int _265 = _263 << 8;
    int _267 = _259 | _265;
    float _269 = float(uint(_255));
    float _271 = float(uint(_267));
    float _273 = fma(_269, 6.103515625e-05, -0.3125);
    float _275 = fma(_249, 6.103515625e-05, -0.3125);
    float _277 = fma(_271, 6.103515625e-05, -0.3125);
    float _279 = fma(_273, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _281 = fma(_275, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _283 = fma(_277, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _285 = !_253;
    float _295;
    float _297;
    float _299;
    if (!_285)
    {
        float3 _2105 = float3(_279, _281, _283);
        float3 _287 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2105, float3(0.0), isnan(_2105))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2105, float3(0.0), isnan(_2105))).xyz;
        float _289 = _287.x;
        float _291 = _287.y;
        float _293 = _287.z;
        _295 = _289;
        _297 = _291;
        _299 = _293;
        _301 = true;
    }
    else
    {
        float3 _2127 = float3(_279, _281, _283);
        float3 _303 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2127, float3(0.0), isnan(_2127))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2127, float3(0.0), isnan(_2127))).xyz;
        float _305 = _303.x;
        float _307 = _303.y;
        float _309 = _303.z;
        float3 _2142 = float3(_279, _281, _283);
        float3 _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2142, float3(0.0), isnan(_2142))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2142, float3(0.0), isnan(_2142))).xyz;
        float _313 = _311.x;
        float _315 = _311.y;
        float _317 = _311.z;
        bool _319 = _245 >= 0.001000000047497451305389404296875;
        bool _321 = isnan(_245);
        bool _323 = _319 || _321;
        bool _325 = isnan(0.001000000047497451305389404296875);
        bool _327 = _323 || _325;
        bool _329 = !_327;
        _295 = _305;
        _297 = _307;
        _299 = _309;
        if (!_329)
        {
            float3 _2177 = float3(_279, _281, _283);
            float3 _331 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2177, float3(0.0), isnan(_2177))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2177, float3(0.0), isnan(_2177))).xyz;
            float _333 = _331.x;
            float _335 = _331.y;
            float _337 = _331.z;
            float _339 = -_313;
            float _341 = _333 + _339;
            float _343 = -_315;
            float _345 = _335 + _343;
            float _347 = -_317;
            float _349 = _337 + _347;
            float _351 = fma(_245, _341, _313);
            float _353 = fma(_245, _345, _315);
            float _355 = fma(_245, _349, _317);
            _295 = _351;
            _297 = _353;
            _299 = _355;
        }
    }
    _301 = false;
    float _357 = _295;
    float _359 = _297;
    float _361 = _299;
    bool _363 = _357 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _365 = isnan(_357);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _371 = _367 || _369;
    float _373 = fma(_357, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _375 = fma(_359, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _377 = fma(_361, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _379 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _381 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _383 = _379 || _381;
    bool _385 = isnan(6.0);
    bool _387 = _383 || _385;
    bool _389 = _359 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _391 = isnan(_359);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _397 = _393 || _395;
    float _399 = exp2(_373);
    bool _401 = _361 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _403 = isnan(_361);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _409 = _405 || _407;
    float _411 = exp2(_375);
    float _413 = exp2(_377);
    float _415 = -_399;
    float _417 = _415 + 1.0;
    bool _419 = !_371;
    float _421 = _419 ? _357 : _417;
    float _423 = -_411;
    float _425 = _423 + 1.0;
    bool _427 = !_397;
    float _429 = _427 ? _359 : _425;
    float _431 = -_413;
    float _433 = _431 + 1.0;
    bool _435 = !_409;
    float _437 = _435 ? _361 : _433;
    float _439 = _411;
    float _441 = _413;
    float _443 = _433;
    float _445 = _411;
    float _447 = _413;
    float _449 = _421;
    float _451 = _429;
    float _453 = _437;
    float _539;
    float _541;
    float _543;
    if (!_387)
    {
        float _455 = -_421;
        float _457 = _455 + 1.0;
        float _459 = -_429;
        float _461 = _459 + 1.0;
        float _463 = -_437;
        float _465 = _463 + 1.0;
        float _467 = abs(_457);
        float _469 = log2(_467);
        float _471 = abs(_461);
        float _473 = log2(_471);
        float _475 = abs(_465);
        float _477 = log2(_475);
        float _479 = _469 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _481 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _483 = _473 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _485 = exp2(_479);
        float _487 = _477 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _489 = exp2(_483);
        float _491 = exp2(_487);
        float _493 = fma(_481, _485, 1.0);
        float _495 = fma(_481, _489, 1.0);
        float _497 = 1.0 / _493;
        float _499 = fma(_481, _491, 1.0);
        float _501 = 1.0 / _495;
        float _503 = 1.0 / _499;
        float _505 = _497 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _507 = _501 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _509 = precise::max(_505, _507);
        float _511 = _503 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _513 = precise::max(_511, _509);
        float _515 = -_505;
        float _517 = _515 + _513;
        float _519 = -_507;
        float _521 = _519 + _513;
        float _523 = -_511;
        float _525 = _523 + _513;
        float _527 = fma(_517, (*spvDescriptorSet0.fp_c3)._m0[6].w, _505);
        float _529 = fma(_521, (*spvDescriptorSet0.fp_c3)._m0[6].w, _507);
        float _531 = fma(_525, (*spvDescriptorSet0.fp_c3)._m0[6].w, _511);
        float _533 = _421 * _527;
        float _535 = _429 * _529;
        float _537 = _437 * _531;
        _539 = _533;
        _541 = _535;
        _543 = _537;
        _545 = true;
    }
    else
    {
        bool _547 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_547)
        {
            _214 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _549 = _214;
        bool _551 = !_547;
        float _553 = _549;
        float _583;
        float _585;
        float _593;
        if (!_551)
        {
            float _555 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _557 = _68 + _555;
            float _559 = abs(_557);
            float _561 = _559 * 2560.0;
            bool _563 = _561 >= 2.0;
            bool _565 = isnan(_561);
            bool _567 = _563 || _565;
            bool _569 = isnan(2.0);
            bool _571 = _567 || _569;
            float _573 = _561;
            if (!_571)
            {
                _573 = 0.0;
                _439 = 0.0;
            }
            float _575 = _573;
            float _577 = _439;
            float _579 = _575;
            float _581 = _577;
            _583 = _575;
            _585 = _577;
            if (!_571)
            {
                _441 = 0.0;
            }
            float _587 = _441;
            bool _589 = !_571;
            float _591 = _587;
            _593 = _587;
            _595 = _589;
            if (!_595)
            {
                bool _597 = _68 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_597)
                {
                    _579 = _421;
                }
                float _599 = _579;
                _443 = _599;
                _583 = _599;
                if (_597)
                {
                    _581 = _429;
                }
                float _601 = _581;
                _445 = _601;
                _585 = _601;
                if (_597)
                {
                    _591 = _437;
                }
                float _603 = _591;
                _447 = _603;
                _593 = _603;
                _595 = _597;
                if (!_595)
                {
                    float _605 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _553 = _605;
                }
            }
        }
        if (!_595)
        {
            float _607 = _553;
            float _609 = _443;
            float _611 = _445;
            float _613 = _447;
            bool _615 = _607 != 0.0;
            bool _617 = isnan(_607);
            bool _619 = _615 || _617;
            bool _621 = isnan(0.0);
            bool _623 = _619 || _621;
            float _625 = _609;
            float _627 = _609;
            float _629 = _609;
            float _631 = _611;
            float _633 = _613;
            if (!_623)
            {
                float _635 = _359 * 0.586600005626678466796875;
                float _637 = fma(_357, 0.29890000820159912109375, _635);
                float _639 = fma(_361, 0.1143999993801116943359375, _637);
                float _641 = _639 * (-1.44269502162933349609375);
                float _643 = exp2(_641);
                float _645 = -_643;
                float _647 = _645 + 1.0;
                bool _649 = _647 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _651 = isnan(_647);
                bool _653 = _649 || _651;
                bool _655 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _657 = _653 || _655;
                if (!_657)
                {
                    _625 = _647;
                }
                float _659 = _625;
                bool _661 = !_657;
                float _663 = _659;
                if (!_661)
                {
                    float _665 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _667 = _647 + _665;
                    float _669 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _671 = spvFAdd(_669, 1.00000095367431640625);
                    float _673 = 1.0 / _671;
                    float _675 = _667 * _673;
                    float _677 = -_675;
                    float _679 = _677 + 1.0;
                    float _681 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _683 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _681;
                    float _685 = abs(_679);
                    float _687 = log2(_685);
                    float _689 = _683 * _673;
                    float _691 = _689 + (-1.0);
                    float _693 = _689 * _675;
                    float _695 = _687 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _697 = exp2(_695);
                    float _699 = fma(_691, _697, 1.0);
                    float _701 = 1.0 / _699;
                    float _703 = _693 * _701;
                    float _705 = fma(_671, _703, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _663 = _705;
                }
                float _707 = _663;
                float _709 = -_647;
                float _711 = _709 + _707;
                float _713 = _429 * 0.586600005626678466796875;
                float _715 = _711 + 1.0;
                float _717 = fma(_421, 0.29890000820159912109375, _713);
                float _719 = fma(_437, 0.1143999993801116943359375, _717);
                float _721 = abs(_715);
                float _723 = log2(_721);
                float _725 = spvFAdd(_719, 9.9999999747524270787835121154785e-07);
                float _727 = 1.0 / _725;
                float _729 = _723 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _731 = exp2(_729);
                float _733 = fma(_421, _727, -1.0);
                float _735 = fma(_429, _727, -1.0);
                float _737 = fma(_437, _727, -1.0);
                float _739 = fma(_731, _733, 1.0);
                float _741 = fma(_731, _735, 1.0);
                float _743 = fma(_731, _737, 1.0);
                float _745 = _739 * _707;
                float _747 = _741 * _707;
                float _749 = _743 * _707;
                float _751 = precise::max(0.0, _745);
                float _753 = precise::max(0.0, _747);
                float _755 = precise::max(0.0, _749);
                float _757 = precise::min(_751, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _759 = precise::min(_753, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _761 = precise::min(_755, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _583 = _757;
                _585 = _759;
                _593 = _761;
                _595 = true;
            }
            else
            {
                bool _763 = _607 != 1.0;
                bool _765 = isnan(_607);
                bool _767 = _763 || _765;
                bool _769 = isnan(1.0);
                bool _771 = _767 || _769;
                if (!_771)
                {
                    bool _773 = _421 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _775 = isnan(_421);
                    bool _777 = _773 || _775;
                    bool _779 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _781 = _777 || _779;
                    float _783 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _785 = spvFAdd(_783, 1.00000095367431640625);
                    bool _787 = _429 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _789 = isnan(_429);
                    bool _791 = _787 || _789;
                    bool _793 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _795 = _791 || _793;
                    bool _797 = _437 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _799 = isnan(_437);
                    bool _801 = _797 || _799;
                    bool _803 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _805 = _801 || _803;
                    float _807 = 1.0 / _785;
                    float _809 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _811 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _809;
                    float _813 = _811 * _807;
                    bool _815 = !_781;
                    if (!_815)
                    {
                        float _817 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _819 = _421 + _817;
                        float _821 = _813 + (-1.0);
                        float _823 = _819 * _807;
                        float _825 = -_823;
                        float _827 = _825 + 1.0;
                        float _829 = _813 * _823;
                        float _831 = abs(_827);
                        float _833 = log2(_831);
                        float _835 = _833 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _837 = exp2(_835);
                        float _839 = fma(_821, _837, 1.0);
                        float _841 = 1.0 / _839;
                        float _843 = _829 * _841;
                        float _845 = fma(_785, _843, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _449 = _845;
                    }
                    float _847 = _449;
                    bool _849 = !_795;
                    if (!_849)
                    {
                        float _851 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _853 = _429 + _851;
                        float _855 = _813 + (-1.0);
                        float _857 = _853 * _807;
                        float _859 = -_857;
                        float _861 = _859 + 1.0;
                        float _863 = _813 * _857;
                        float _865 = abs(_861);
                        float _867 = log2(_865);
                        float _869 = _867 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _871 = exp2(_869);
                        float _873 = fma(_855, _871, 1.0);
                        float _875 = 1.0 / _873;
                        float _877 = _863 * _875;
                        float _879 = fma(_785, _877, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _451 = _879;
                    }
                    float _881 = _451;
                    bool _883 = !_805;
                    if (!_883)
                    {
                        float _885 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _887 = _437 + _885;
                        float _889 = _813 + (-1.0);
                        float _891 = _887 * _807;
                        float _893 = -_891;
                        float _895 = _893 + 1.0;
                        float _897 = _813 * _891;
                        float _899 = abs(_895);
                        float _901 = log2(_899);
                        float _903 = _901 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _905 = exp2(_903);
                        float _907 = fma(_889, _905, 1.0);
                        float _909 = 1.0 / _907;
                        float _911 = _897 * _909;
                        float _913 = fma(_785, _911, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _453 = _913;
                    }
                    float _915 = _453;
                    float _917 = precise::max(0.0, _915);
                    float _919 = precise::max(0.0, _847);
                    float _921 = precise::max(0.0, _881);
                    float _923 = precise::min(_917, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _925 = precise::min(_919, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _927 = precise::min(_921, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _583 = _925;
                    _585 = _927;
                    _593 = _923;
                    _595 = true;
                }
                else
                {
                    bool _929 = _607 != 2.0;
                    bool _931 = isnan(_607);
                    bool _933 = _929 || _931;
                    bool _935 = isnan(2.0);
                    bool _937 = _933 || _935;
                    if (!_937)
                    {
                        float _939 = _429 * 0.715200006961822509765625;
                        float _941 = fma(_421, 0.2125999927520751953125, _939);
                        float _943 = fma(_437, 0.072200000286102294921875, _941);
                        float _945 = spvFAdd(_943, 9.9999999747524270787835121154785e-07);
                        bool _947 = _943 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _949 = isnan(_943);
                        bool _951 = _947 || _949;
                        bool _953 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _955 = _951 || _953;
                        float _957 = 1.0 / _945;
                        bool _959 = !_955;
                        float _961 = _943;
                        if (!_959)
                        {
                            float _963 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _965 = _943 + _963;
                            float _967 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _969 = spvFAdd(_967, 1.00000095367431640625);
                            float _971 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _973 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _971;
                            float _975 = 1.0 / _969;
                            float _977 = _965 * _975;
                            float _979 = _973 * _975;
                            float _981 = -_977;
                            float _983 = _981 + 1.0;
                            float _985 = _979 + (-1.0);
                            float _987 = _979 * _977;
                            float _989 = abs(_983);
                            float _991 = log2(_989);
                            float _993 = _991 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _995 = exp2(_993);
                            float _997 = fma(_985, _995, 1.0);
                            float _999 = 1.0 / _997;
                            float _1001 = _987 * _999;
                            float _1003 = fma(_969, _1001, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _961 = _1003;
                        }
                        float _1005 = _961;
                        float _1007 = precise::max(0.0, _1005);
                        float _1009 = precise::min(_1007, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1011 = _1009 * _957;
                        float _1013 = _421 * _1011;
                        float _1015 = _429 * _1011;
                        float _1017 = _437 * _1011;
                        float _1019 = precise::max(0.0, _1013);
                        float _1021 = precise::max(0.0, _1015);
                        float _1023 = precise::max(0.0, _1017);
                        float _1025 = precise::min(_1019, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1027 = precise::min(_1021, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _1029 = precise::min(_1023, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _583 = _1025;
                        _585 = _1027;
                        _593 = _1029;
                        _595 = true;
                    }
                    else
                    {
                        bool _1031 = _607 != 3.0;
                        bool _1033 = isnan(_607);
                        bool _1035 = _1031 || _1033;
                        bool _1037 = isnan(3.0);
                        bool _1039 = _1035 || _1037;
                        if (!_1039)
                        {
                            float _1041 = -_421;
                            float _1043 = _1041 + 1.0;
                            float _1045 = -_429;
                            float _1047 = _1045 + 1.0;
                            float _1049 = -_437;
                            float _1051 = _1049 + 1.0;
                            float _1053 = abs(_1043);
                            float _1055 = log2(_1053);
                            float _1057 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _1059 = abs(_1047);
                            float _1061 = log2(_1059);
                            float _1063 = abs(_1051);
                            float _1065 = log2(_1063);
                            float _1067 = _1055 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1069 = _1061 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1071 = exp2(_1067);
                            float _1073 = _1065 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1075 = exp2(_1069);
                            float _1077 = exp2(_1073);
                            float _1079 = fma(_1057, _1071, 1.0);
                            float _1081 = fma(_1057, _1075, 1.0);
                            float _1083 = 1.0 / _1079;
                            float _1085 = fma(_1057, _1077, 1.0);
                            float _1087 = 1.0 / _1081;
                            float _1089 = 1.0 / _1085;
                            float _1091 = _1083 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1093 = _1083 + _1087;
                            float _1095 = _1087 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1097 = _1089 + _1093;
                            float _1099 = _1089 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1101 = precise::max(_1091, _1095);
                            float _1103 = _1097 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1105 = precise::max(_1099, _1101);
                            float _1107 = _1103 * 0.3333333432674407958984375;
                            float _1109 = -_1107;
                            float _1111 = _1105 + _1109;
                            float _1113 = fma(_1111, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1107);
                            float _1115 = -_1091;
                            float _1117 = _1115 + _1113;
                            float _1119 = -_1095;
                            float _1121 = _1119 + _1113;
                            float _1123 = -_1099;
                            float _1125 = _1123 + _1113;
                            float _1127 = fma(_1117, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1091);
                            float _1129 = fma(_1121, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1095);
                            float _1131 = fma(_1125, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1099);
                            float _1133 = _421 * _1127;
                            float _1135 = _429 * _1129;
                            float _1137 = _437 * _1131;
                            _583 = _1133;
                            _585 = _1135;
                            _593 = _1137;
                            _595 = true;
                        }
                        else
                        {
                            bool _1139 = _607 != 4.0;
                            bool _1141 = isnan(_607);
                            bool _1143 = _1139 || _1141;
                            bool _1145 = isnan(4.0);
                            bool _1147 = _1143 || _1145;
                            if (!_1147)
                            {
                                bool _1149 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1151 = isnan(0.0);
                                bool _1153 = _1149 || _1151;
                                bool _1155 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1157 = _1153 || _1155;
                                float _1179;
                                float _1181;
                                if (!_1157)
                                {
                                    float _1159 = -_421;
                                    float _1161 = _1159 + 1.0;
                                    float _1163 = abs(_1161);
                                    float _1165 = log2(_1163);
                                    float _1167 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1169 = _1165 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1171 = exp2(_1169);
                                    float _1173 = fma(_1167, _1171, 1.0);
                                    float _1175 = 1.0 / _1173;
                                    float _1177 = _1175 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1179 = _1165;
                                    _1181 = _1177;
                                    _1183 = true;
                                }
                                else
                                {
                                    float _1185 = spvFAdd(_421, 9.9999999747524270787835121154785e-07);
                                    bool _1187 = _421 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1189 = isnan(_421);
                                    bool _1191 = _1187 || _1189;
                                    bool _1193 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1195 = _1191 || _1193;
                                    float _1197 = 1.0 / _1185;
                                    if (!_1195)
                                    {
                                        _627 = _421;
                                    }
                                    float _1199 = _627;
                                    bool _1201 = !_1195;
                                    float _1203 = _1199;
                                    _1179 = _1197;
                                    if (!_1201)
                                    {
                                        float _1205 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1207 = _421 + _1205;
                                        float _1209 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1211 = spvFAdd(_1209, 1.00000095367431640625);
                                        float _1213 = 1.0 / _1211;
                                        float _1215 = _1207 * _1213;
                                        float _1217 = -_1215;
                                        float _1219 = _1217 + 1.0;
                                        float _1221 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1223 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1221;
                                        float _1225 = abs(_1219);
                                        float _1227 = log2(_1225);
                                        float _1229 = _1223 * _1213;
                                        float _1231 = _1229 + (-1.0);
                                        float _1233 = _1229 * _1215;
                                        float _1235 = _1227 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1237 = exp2(_1235);
                                        float _1239 = fma(_1231, _1237, 1.0);
                                        float _1241 = 1.0 / _1239;
                                        float _1243 = _1233 * _1241;
                                        float _1245 = fma(_1211, _1243, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1203 = _1245;
                                    }
                                    float _1247 = _1203;
                                    float _1249 = precise::max(0.0, _1247);
                                    float _1251 = precise::min(_1249, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1253 = _1251 * _1197;
                                    _1181 = _1253;
                                }
                                _1183 = false;
                                float _1255 = _1179;
                                float _1257 = _1181;
                                float _1259 = _1255;
                                float _1281;
                                float _1283;
                                if (!_1157)
                                {
                                    float _1261 = -_429;
                                    float _1263 = _1261 + 1.0;
                                    float _1265 = abs(_1263);
                                    float _1267 = log2(_1265);
                                    float _1269 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1271 = _1267 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1273 = exp2(_1271);
                                    float _1275 = fma(_1269, _1273, 1.0);
                                    float _1277 = 1.0 / _1275;
                                    float _1279 = _1277 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1281 = _1267;
                                    _1283 = _1279;
                                    _1285 = true;
                                }
                                else
                                {
                                    float _1287 = spvFAdd(_429, 9.9999999747524270787835121154785e-07);
                                    bool _1289 = _429 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1291 = isnan(_429);
                                    bool _1293 = _1289 || _1291;
                                    bool _1295 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1297 = _1293 || _1295;
                                    float _1299 = 1.0 / _1287;
                                    if (!_1297)
                                    {
                                        _1259 = _429;
                                    }
                                    float _1301 = _1259;
                                    bool _1303 = !_1297;
                                    float _1305 = _1301;
                                    _1281 = _1299;
                                    if (!_1303)
                                    {
                                        float _1307 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1309 = _429 + _1307;
                                        float _1311 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1313 = spvFAdd(_1311, 1.00000095367431640625);
                                        float _1315 = 1.0 / _1313;
                                        float _1317 = _1309 * _1315;
                                        float _1319 = -_1317;
                                        float _1321 = _1319 + 1.0;
                                        float _1323 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1325 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1323;
                                        float _1327 = abs(_1321);
                                        float _1329 = log2(_1327);
                                        float _1331 = _1325 * _1315;
                                        float _1333 = _1331 + (-1.0);
                                        float _1335 = _1331 * _1317;
                                        float _1337 = _1329 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1339 = exp2(_1337);
                                        float _1341 = fma(_1333, _1339, 1.0);
                                        float _1343 = 1.0 / _1341;
                                        float _1345 = _1335 * _1343;
                                        float _1347 = fma(_1313, _1345, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1305 = _1347;
                                    }
                                    float _1349 = _1305;
                                    float _1351 = precise::max(0.0, _1349);
                                    float _1353 = precise::min(_1351, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1355 = _1353 * _1299;
                                    _1283 = _1355;
                                }
                                _1285 = false;
                                float _1357 = _1281;
                                float _1359 = _1283;
                                float _1361 = _1357;
                                float _1383;
                                if (!_1157)
                                {
                                    float _1363 = -_437;
                                    float _1365 = _1363 + 1.0;
                                    float _1367 = abs(_1365);
                                    float _1369 = log2(_1367);
                                    float _1371 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1373 = _1369 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1375 = exp2(_1373);
                                    float _1377 = fma(_1371, _1375, 1.0);
                                    float _1379 = 1.0 / _1377;
                                    float _1381 = _1379 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1383 = _1381;
                                    _1385 = true;
                                }
                                else
                                {
                                    float _1387 = spvFAdd(_437, 9.9999999747524270787835121154785e-07);
                                    bool _1389 = _437 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1391 = isnan(_437);
                                    bool _1393 = _1389 || _1391;
                                    bool _1395 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1397 = _1393 || _1395;
                                    float _1399 = 1.0 / _1387;
                                    if (!_1397)
                                    {
                                        _1361 = _437;
                                    }
                                    float _1401 = _1361;
                                    bool _1403 = !_1397;
                                    float _1405 = _1401;
                                    if (!_1403)
                                    {
                                        float _1407 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1409 = _437 + _1407;
                                        float _1411 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1413 = spvFAdd(_1411, 1.00000095367431640625);
                                        float _1415 = 1.0 / _1413;
                                        float _1417 = _1409 * _1415;
                                        float _1419 = -_1417;
                                        float _1421 = _1419 + 1.0;
                                        float _1423 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1425 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1423;
                                        float _1427 = abs(_1421);
                                        float _1429 = log2(_1427);
                                        float _1431 = _1425 * _1415;
                                        float _1433 = _1431 + (-1.0);
                                        float _1435 = _1431 * _1417;
                                        float _1437 = _1429 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1439 = exp2(_1437);
                                        float _1441 = fma(_1433, _1439, 1.0);
                                        float _1443 = 1.0 / _1441;
                                        float _1445 = _1435 * _1443;
                                        float _1447 = fma(_1413, _1445, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1405 = _1447;
                                    }
                                    float _1449 = _1405;
                                    float _1451 = precise::max(0.0, _1449);
                                    float _1453 = precise::min(_1451, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1455 = _1453 * _1399;
                                    _1383 = _1455;
                                }
                                _1385 = false;
                                float _1457 = _1383;
                                float _1459 = precise::max(_1257, _1359);
                                float _1461 = precise::max(_1459, _1457);
                                float _1463 = -_1257;
                                float _1465 = _1461 + _1463;
                                float _1467 = -_1359;
                                float _1469 = _1461 + _1467;
                                float _1471 = -_1457;
                                float _1473 = _1461 + _1471;
                                float _1475 = fma(_1465, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1257);
                                float _1477 = fma(_1469, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1359);
                                float _1479 = fma(_1473, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1457);
                                float _1481 = _421 * _1475;
                                float _1483 = _429 * _1477;
                                float _1485 = _437 * _1479;
                                _583 = _1481;
                                _585 = _1483;
                                _593 = _1485;
                                _595 = true;
                            }
                            else
                            {
                                bool _1487 = _607 != 5.0;
                                bool _1489 = isnan(_607);
                                bool _1491 = _1487 || _1489;
                                bool _1493 = isnan(5.0);
                                bool _1495 = _1491 || _1493;
                                if (!_1495)
                                {
                                    _629 = _357;
                                }
                                float _1497 = _629;
                                float _1499 = _1497;
                                _583 = _1497;
                                if (!_1495)
                                {
                                    _631 = _359;
                                }
                                float _1501 = _631;
                                float _1503 = _1501;
                                _585 = _1501;
                                if (!_1495)
                                {
                                    _633 = _361;
                                }
                                float _1505 = _633;
                                bool _1507 = !_1495;
                                float _1509 = _1505;
                                _593 = _1505;
                                if (!_1507)
                                {
                                    bool _1511 = _607 != 6.0;
                                    bool _1513 = isnan(_607);
                                    bool _1515 = _1511 || _1513;
                                    bool _1517 = isnan(6.0);
                                    bool _1519 = _1515 || _1517;
                                    if (!_1519)
                                    {
                                        float _1521 = -_421;
                                        float _1523 = _1521 + 1.0;
                                        float _1525 = -_429;
                                        float _1527 = _1525 + 1.0;
                                        float _1529 = -_437;
                                        float _1531 = _1529 + 1.0;
                                        float _1533 = abs(_1523);
                                        float _1535 = log2(_1533);
                                        float _1537 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1539 = abs(_1527);
                                        float _1541 = log2(_1539);
                                        float _1543 = abs(_1531);
                                        float _1545 = log2(_1543);
                                        float _1547 = _1535 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1549 = _1541 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1551 = exp2(_1547);
                                        float _1553 = _1545 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1555 = exp2(_1549);
                                        float _1557 = exp2(_1553);
                                        float _1559 = fma(_1537, _1551, 1.0);
                                        float _1561 = fma(_1537, _1555, 1.0);
                                        float _1563 = 1.0 / _1559;
                                        float _1565 = fma(_1537, _1557, 1.0);
                                        float _1567 = 1.0 / _1561;
                                        float _1569 = 1.0 / _1565;
                                        float _1571 = _1563 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1573 = _1567 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1575 = precise::max(_1571, _1573);
                                        float _1577 = _1569 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1579 = precise::max(_1577, _1575);
                                        float _1581 = -_1571;
                                        float _1583 = _1581 + _1579;
                                        float _1585 = -_1573;
                                        float _1587 = _1585 + _1579;
                                        float _1589 = -_1577;
                                        float _1591 = _1589 + _1579;
                                        float _1593 = fma(_1583, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1571);
                                        float _1595 = fma(_1587, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1573);
                                        float _1597 = fma(_1591, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1577);
                                        float _1599 = _421 * _1593;
                                        float _1601 = _429 * _1595;
                                        float _1603 = _437 * _1597;
                                        _583 = _1599;
                                        _585 = _1601;
                                        _593 = _1603;
                                        _595 = true;
                                    }
                                    else
                                    {
                                        bool _1605 = _607 != 7.0;
                                        bool _1607 = isnan(_607);
                                        bool _1609 = _1605 || _1607;
                                        bool _1611 = isnan(7.0);
                                        bool _1613 = _1609 || _1611;
                                        if (_1613)
                                        {
                                            _1499 = 0.0;
                                            _1503 = 0.0;
                                        }
                                        float _1615 = _1499;
                                        float _1617 = _1503;
                                        _583 = _1615;
                                        _585 = _1617;
                                        if (_1613)
                                        {
                                            _1509 = 0.0;
                                        }
                                        float _1619 = _1509;
                                        _593 = _1619;
                                        if (!_1613)
                                        {
                                            float _1621 = -_421;
                                            float _1623 = _1621 + 1.0;
                                            float _1625 = -_429;
                                            float _1627 = _1625 + 1.0;
                                            float _1629 = -_437;
                                            float _1631 = _1629 + 1.0;
                                            float _1633 = abs(_1623);
                                            float _1635 = log2(_1633);
                                            float _1637 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1639 = abs(_1627);
                                            float _1641 = log2(_1639);
                                            float _1643 = abs(_1631);
                                            float _1645 = log2(_1643);
                                            float _1647 = _1635 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1649 = _1641 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1651 = exp2(_1647);
                                            float _1653 = _1645 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1655 = exp2(_1649);
                                            float _1657 = exp2(_1653);
                                            float _1659 = fma(_1637, _1651, 1.0);
                                            float _1661 = fma(_1637, _1655, 1.0);
                                            float _1663 = 1.0 / _1659;
                                            float _1665 = fma(_1637, _1657, 1.0);
                                            float _1667 = 1.0 / _1661;
                                            float _1669 = 1.0 / _1665;
                                            float _1671 = _1663 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1673 = -_421;
                                            float _1675 = fma(_421, _1671, _1673);
                                            float _1677 = _1667 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1679 = -_429;
                                            float _1681 = fma(_429, _1677, _1679);
                                            float _1683 = _1669 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1685 = _1675 + _1681;
                                            float _1687 = -_437;
                                            float _1689 = fma(_437, _1683, _1687);
                                            float _1691 = _1689 + _1685;
                                            float _1693 = -_1675;
                                            float _1695 = fma(_1691, 0.3333333432674407958984375, _1693);
                                            float _1697 = -_1681;
                                            float _1699 = fma(_1691, 0.3333333432674407958984375, _1697);
                                            float _1701 = -_1689;
                                            float _1703 = fma(_1691, 0.3333333432674407958984375, _1701);
                                            float _1705 = fma(_1695, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1675);
                                            float _1707 = fma(_1699, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1681);
                                            float _1709 = fma(_1703, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1689);
                                            float _1711 = _421 + _1705;
                                            float _1713 = _429 + _1707;
                                            float _1715 = _437 + _1709;
                                            _583 = _1711;
                                            _585 = _1713;
                                            _593 = _1715;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _595 = false;
        float _1717 = _583;
        float _1719 = _585;
        float _1721 = _593;
        _539 = _1717;
        _541 = _1719;
        _543 = _1721;
    }
    _545 = false;
    float _1723 = _539;
    float _1725 = _541;
    float _1727 = _543;
    float _1729 = _1723 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1731 = _1725 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1733 = _1727 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_45.x = _1729;
    out.m_45.y = _1731;
    out.m_45.z = _1733;
    out.m_45.w = _83;
    return out;
}

