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
    bool _491 = false;
    bool _541 = false;
    bool _1325 = false;
    bool _1225 = false;
    bool _1123 = false;
    bool _309 = false;
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
    float2 _1714 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1714, float2(0.0), isnan(_1714))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1714, float2(0.0), isnan(_1714))).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    float _85 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float2 _1737 = float2(_72, _85);
    float3 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1737, float2(0.0), isnan(_1737))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1737, float2(0.0), isnan(_1737))).xyz;
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
    if (!_119)
    {
        int _214 = ~_174;
        int _216 = _214 + 1;
        _212 = _216;
    }
    int _218 = _212;
    if (_117)
    {
        float _220 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _176 = _220;
    }
    float _222 = _176;
    float _224 = fma(_77, _222, _91);
    float _226 = fma(_79, _222, _93);
    float _228 = float(_218);
    float _230 = fma(_81, _222, _95);
    float _232 = _224 * 4.0;
    float _234 = _226 * 4.0;
    float _236 = fma(_171, _228, 0.5);
    float _238 = _230 * 4.0;
    uint _241 = as_type<uint>(half2(float2(_232, _234)));
    float _243 = precise::max(_236, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    uint _245 = extract_bits(_241, 16u, 16u);
    float _247 = float(_245);
    uint _249 = as_type<uint>(half2(float2(_238, 0.0)));
    bool _251 = _243 > 0.999000012874603271484375;
    int _253 = int(_241) & 32767;
    uint _255 = extract_bits(_249, 0u, 8u);
    int _257 = int(_255) & 255;
    uint _259 = extract_bits(_249, 8u, 8u);
    int _261 = int(_259) & 255;
    int _263 = _261 << 8;
    int _265 = _257 | _263;
    float _267 = float(uint(_253));
    float _269 = float(uint(_265));
    float _271 = fma(_267, 6.103515625e-05, -0.3125);
    float _273 = fma(_247, 6.103515625e-05, -0.3125);
    float _275 = fma(_269, 6.103515625e-05, -0.3125);
    float _277 = fma(_271, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _279 = fma(_273, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _281 = fma(_275, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _283 = !_251;
    float _285 = 6.103515625e-05;
    float _287 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _289 = _271;
    float _291 = _281;
    float _293 = _281;
    float _303;
    float _305;
    float _307;
    if (!_283)
    {
        float3 _2049 = float3(_277, _279, _281);
        float3 _295 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2049, float3(0.0), isnan(_2049))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2049, float3(0.0), isnan(_2049))).xyz;
        float _297 = _295.x;
        float _299 = _295.y;
        float _301 = _295.z;
        _303 = _297;
        _305 = _299;
        _307 = _301;
        _309 = true;
    }
    else
    {
        float3 _2071 = float3(_277, _279, _281);
        float3 _311 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2071, float3(0.0), isnan(_2071))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2071, float3(0.0), isnan(_2071))).xyz;
        float _313 = _311.x;
        float _315 = _311.y;
        float _317 = _311.z;
        float3 _2086 = float3(_277, _279, _281);
        float3 _319 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2086, float3(0.0), isnan(_2086))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2086, float3(0.0), isnan(_2086))).xyz;
        float _321 = _319.x;
        float _323 = _319.y;
        float _325 = _319.z;
        bool _327 = _243 >= 0.001000000047497451305389404296875;
        bool _329 = isnan(_243);
        bool _331 = _327 || _329;
        bool _333 = isnan(0.001000000047497451305389404296875);
        bool _335 = _331 || _333;
        bool _337 = !_335;
        _303 = _313;
        _305 = _315;
        _307 = _317;
        _285 = _325;
        if (!_337)
        {
            float3 _2122 = float3(_277, _279, _281);
            float3 _339 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2122, float3(0.0), isnan(_2122))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2122, float3(0.0), isnan(_2122))).xyz;
            float _341 = _339.x;
            float _343 = _339.y;
            float _345 = _339.z;
            float _347 = -_321;
            float _349 = _341 + _347;
            float _351 = -_323;
            float _353 = _343 + _351;
            float _355 = -_325;
            float _357 = _345 + _355;
            float _359 = fma(_243, _349, _321);
            float _361 = fma(_243, _353, _323);
            float _363 = fma(_243, _357, _325);
            _303 = _359;
            _305 = _361;
            _307 = _363;
            _287 = _353;
            _289 = _349;
        }
    }
    _309 = false;
    float _365 = _303;
    float _367 = _305;
    float _369 = _307;
    float _371 = _285;
    float _373 = _287;
    float _375 = _289;
    bool _377 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _379 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _381 = _377 || _379;
    bool _383 = isnan(6.0);
    bool _385 = _381 || _383;
    float _387 = _371;
    float _389 = _375;
    float _391 = _373;
    float _393 = _375;
    float _395 = _365;
    float _397 = _367;
    float _399 = _369;
    float _485;
    float _487;
    float _489;
    if (!_385)
    {
        float _401 = -_365;
        float _403 = _401 + 1.0;
        float _405 = -_367;
        float _407 = _405 + 1.0;
        float _409 = -_369;
        float _411 = _409 + 1.0;
        float _413 = abs(_403);
        float _415 = log2(_413);
        float _417 = abs(_407);
        float _419 = log2(_417);
        float _421 = abs(_411);
        float _423 = log2(_421);
        float _425 = _415 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _427 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _429 = _419 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _431 = exp2(_425);
        float _433 = _423 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _435 = exp2(_429);
        float _437 = exp2(_433);
        float _439 = fma(_427, _431, 1.0);
        float _441 = fma(_427, _435, 1.0);
        float _443 = 1.0 / _439;
        float _445 = fma(_427, _437, 1.0);
        float _447 = 1.0 / _441;
        float _449 = 1.0 / _445;
        float _451 = _443 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _453 = _447 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _455 = precise::max(_451, _453);
        float _457 = _449 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _459 = precise::max(_457, _455);
        float _461 = -_451;
        float _463 = _461 + _459;
        float _465 = -_453;
        float _467 = _465 + _459;
        float _469 = -_457;
        float _471 = _469 + _459;
        float _473 = fma(_463, (*spvDescriptorSet0.fp_c3)._m0[6].w, _451);
        float _475 = fma(_467, (*spvDescriptorSet0.fp_c3)._m0[6].w, _453);
        float _477 = fma(_471, (*spvDescriptorSet0.fp_c3)._m0[6].w, _457);
        float _479 = _473 * _365;
        float _481 = _475 * _367;
        float _483 = _477 * _369;
        _485 = _479;
        _487 = _481;
        _489 = _483;
        _491 = true;
    }
    else
    {
        bool _493 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_493)
        {
            _387 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _495 = _387;
        bool _497 = !_493;
        float _499 = _495;
        float _529;
        float _531;
        float _539;
        if (!_497)
        {
            float _501 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _503 = _68 + _501;
            float _505 = abs(_503);
            float _507 = _505 * 2560.0;
            bool _509 = _507 >= 2.0;
            bool _511 = isnan(_507);
            bool _513 = _509 || _511;
            bool _515 = isnan(2.0);
            bool _517 = _513 || _515;
            float _519 = _507;
            if (!_517)
            {
                _519 = 0.0;
                _389 = 0.0;
            }
            float _521 = _519;
            float _523 = _389;
            float _525 = _521;
            float _527 = _523;
            _529 = _521;
            _531 = _523;
            if (!_517)
            {
                _291 = 0.0;
            }
            float _533 = _291;
            bool _535 = !_517;
            float _537 = _533;
            _539 = _533;
            _541 = _535;
            if (!_541)
            {
                bool _543 = _68 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_543)
                {
                    _525 = _365;
                }
                float _545 = _525;
                _391 = _545;
                _529 = _545;
                if (_543)
                {
                    _527 = _367;
                }
                float _547 = _527;
                _393 = _547;
                _531 = _547;
                if (_543)
                {
                    _537 = _369;
                }
                float _549 = _537;
                _293 = _549;
                _539 = _549;
                _541 = _543;
                if (!_541)
                {
                    float _551 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _499 = _551;
                }
            }
        }
        if (!_541)
        {
            float _553 = _499;
            float _555 = _391;
            float _557 = _393;
            float _559 = _293;
            bool _561 = _553 != 0.0;
            bool _563 = isnan(_553);
            bool _565 = _561 || _563;
            bool _567 = isnan(0.0);
            bool _569 = _565 || _567;
            float _571 = _555;
            float _573 = _555;
            float _575 = _557;
            float _577 = _559;
            if (!_569)
            {
                float _579 = _367 * 0.586600005626678466796875;
                float _581 = fma(_365, 0.29890000820159912109375, _579);
                float _583 = fma(_369, 0.1143999993801116943359375, _581);
                float _585 = _583 * (-1.44269502162933349609375);
                float _587 = exp2(_585);
                float _589 = -_587;
                float _591 = _589 + 1.0;
                bool _593 = _591 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _595 = isnan(_591);
                bool _597 = _593 || _595;
                bool _599 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _601 = _597 || _599;
                float _603 = _581;
                if (!_601)
                {
                    _603 = _591;
                }
                float _605 = _603;
                bool _607 = !_601;
                float _609 = _605;
                if (!_607)
                {
                    float _611 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _613 = _591 + _611;
                    float _615 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _617 = spvFAdd(_615, 1.00000095367431640625);
                    float _619 = 1.0 / _617;
                    float _621 = _613 * _619;
                    float _623 = -_621;
                    float _625 = _623 + 1.0;
                    float _627 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _629 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _627;
                    float _631 = abs(_625);
                    float _633 = log2(_631);
                    float _635 = _629 * _619;
                    float _637 = _635 + (-1.0);
                    float _639 = _635 * _621;
                    float _641 = _633 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _643 = exp2(_641);
                    float _645 = fma(_637, _643, 1.0);
                    float _647 = 1.0 / _645;
                    float _649 = _639 * _647;
                    float _651 = fma(_617, _649, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _609 = _651;
                }
                float _653 = _609;
                float _655 = -_591;
                float _657 = _655 + _653;
                float _659 = spvFAdd(_583, 9.9999999747524270787835121154785e-07);
                float _661 = _657 + 1.0;
                float _663 = 1.0 / _659;
                float _665 = abs(_661);
                float _667 = log2(_665);
                float _669 = fma(_663, _365, -1.0);
                float _671 = fma(_663, _367, -1.0);
                float _673 = fma(_663, _369, -1.0);
                float _675 = _667 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _677 = exp2(_675);
                float _679 = fma(_677, _669, 1.0);
                float _681 = fma(_677, _671, 1.0);
                float _683 = fma(_677, _673, 1.0);
                float _685 = _679 * _653;
                float _687 = _681 * _653;
                float _689 = _683 * _653;
                float _691 = precise::max(0.0, _685);
                float _693 = precise::max(0.0, _687);
                float _695 = precise::max(0.0, _689);
                float _697 = precise::min(_691, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _699 = precise::min(_693, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _701 = precise::min(_695, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _529 = _697;
                _531 = _699;
                _539 = _701;
                _541 = true;
            }
            else
            {
                bool _703 = _553 != 1.0;
                bool _705 = isnan(_553);
                bool _707 = _703 || _705;
                bool _709 = isnan(1.0);
                bool _711 = _707 || _709;
                if (!_711)
                {
                    bool _713 = _365 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _715 = isnan(_365);
                    bool _717 = _713 || _715;
                    bool _719 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _721 = _717 || _719;
                    float _723 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _725 = spvFAdd(_723, 1.00000095367431640625);
                    bool _727 = _367 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _729 = isnan(_367);
                    bool _731 = _727 || _729;
                    bool _733 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _735 = _731 || _733;
                    bool _737 = _369 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _739 = isnan(_369);
                    bool _741 = _737 || _739;
                    bool _743 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _745 = _741 || _743;
                    float _747 = 1.0 / _725;
                    float _749 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _751 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _749;
                    float _753 = _751 * _747;
                    bool _755 = !_721;
                    if (!_755)
                    {
                        float _757 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _759 = _365 + _757;
                        float _761 = _753 + (-1.0);
                        float _763 = _759 * _747;
                        float _765 = -_763;
                        float _767 = _765 + 1.0;
                        float _769 = _753 * _763;
                        float _771 = abs(_767);
                        float _773 = log2(_771);
                        float _775 = _773 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _777 = exp2(_775);
                        float _779 = fma(_761, _777, 1.0);
                        float _781 = 1.0 / _779;
                        float _783 = _769 * _781;
                        float _785 = fma(_725, _783, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _395 = _785;
                    }
                    float _787 = _395;
                    bool _789 = !_735;
                    if (!_789)
                    {
                        float _791 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _793 = _367 + _791;
                        float _795 = _753 + (-1.0);
                        float _797 = _793 * _747;
                        float _799 = -_797;
                        float _801 = _799 + 1.0;
                        float _803 = _753 * _797;
                        float _805 = abs(_801);
                        float _807 = log2(_805);
                        float _809 = _807 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _811 = exp2(_809);
                        float _813 = fma(_795, _811, 1.0);
                        float _815 = 1.0 / _813;
                        float _817 = _803 * _815;
                        float _819 = fma(_725, _817, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _397 = _819;
                    }
                    float _821 = _397;
                    bool _823 = !_745;
                    if (!_823)
                    {
                        float _825 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _827 = _369 + _825;
                        float _829 = _753 + (-1.0);
                        float _831 = _827 * _747;
                        float _833 = -_831;
                        float _835 = _833 + 1.0;
                        float _837 = _753 * _831;
                        float _839 = abs(_835);
                        float _841 = log2(_839);
                        float _843 = _841 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _845 = exp2(_843);
                        float _847 = fma(_829, _845, 1.0);
                        float _849 = 1.0 / _847;
                        float _851 = _837 * _849;
                        float _853 = fma(_725, _851, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _399 = _853;
                    }
                    float _855 = _399;
                    float _857 = precise::max(0.0, _855);
                    float _859 = precise::max(0.0, _787);
                    float _861 = precise::max(0.0, _821);
                    float _863 = precise::min(_857, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _865 = precise::min(_859, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _867 = precise::min(_861, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _529 = _865;
                    _531 = _867;
                    _539 = _863;
                    _541 = true;
                }
                else
                {
                    bool _869 = _553 != 2.0;
                    bool _871 = isnan(_553);
                    bool _873 = _869 || _871;
                    bool _875 = isnan(2.0);
                    bool _877 = _873 || _875;
                    if (!_877)
                    {
                        float _879 = _367 * 0.715200006961822509765625;
                        float _881 = fma(_365, 0.2125999927520751953125, _879);
                        float _883 = fma(_369, 0.072200000286102294921875, _881);
                        float _885 = spvFAdd(_883, 9.9999999747524270787835121154785e-07);
                        bool _887 = _883 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _889 = isnan(_883);
                        bool _891 = _887 || _889;
                        bool _893 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _895 = _891 || _893;
                        float _897 = 1.0 / _885;
                        bool _899 = !_895;
                        float _901 = _883;
                        if (!_899)
                        {
                            float _903 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _905 = _883 + _903;
                            float _907 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _909 = spvFAdd(_907, 1.00000095367431640625);
                            float _911 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _913 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _911;
                            float _915 = 1.0 / _909;
                            float _917 = _905 * _915;
                            float _919 = _913 * _915;
                            float _921 = -_917;
                            float _923 = _921 + 1.0;
                            float _925 = _919 + (-1.0);
                            float _927 = _919 * _917;
                            float _929 = abs(_923);
                            float _931 = log2(_929);
                            float _933 = _931 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _935 = exp2(_933);
                            float _937 = fma(_925, _935, 1.0);
                            float _939 = 1.0 / _937;
                            float _941 = _927 * _939;
                            float _943 = fma(_909, _941, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _901 = _943;
                        }
                        float _945 = _901;
                        float _947 = precise::max(0.0, _945);
                        float _949 = precise::min(_947, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _951 = _949 * _897;
                        float _953 = _365 * _951;
                        float _955 = _367 * _951;
                        float _957 = _369 * _951;
                        float _959 = precise::max(0.0, _953);
                        float _961 = precise::max(0.0, _955);
                        float _963 = precise::max(0.0, _957);
                        float _965 = precise::min(_959, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _967 = precise::min(_961, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _969 = precise::min(_963, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _529 = _965;
                        _531 = _967;
                        _539 = _969;
                        _541 = true;
                    }
                    else
                    {
                        bool _971 = _553 != 3.0;
                        bool _973 = isnan(_553);
                        bool _975 = _971 || _973;
                        bool _977 = isnan(3.0);
                        bool _979 = _975 || _977;
                        if (!_979)
                        {
                            float _981 = -_365;
                            float _983 = _981 + 1.0;
                            float _985 = -_367;
                            float _987 = _985 + 1.0;
                            float _989 = -_369;
                            float _991 = _989 + 1.0;
                            float _993 = abs(_983);
                            float _995 = log2(_993);
                            float _997 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _999 = abs(_987);
                            float _1001 = log2(_999);
                            float _1003 = abs(_991);
                            float _1005 = log2(_1003);
                            float _1007 = _995 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1009 = _1001 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1011 = exp2(_1007);
                            float _1013 = _1005 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1015 = exp2(_1009);
                            float _1017 = exp2(_1013);
                            float _1019 = fma(_997, _1011, 1.0);
                            float _1021 = fma(_997, _1015, 1.0);
                            float _1023 = 1.0 / _1019;
                            float _1025 = fma(_997, _1017, 1.0);
                            float _1027 = 1.0 / _1021;
                            float _1029 = 1.0 / _1025;
                            float _1031 = _1023 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1033 = _1023 + _1027;
                            float _1035 = _1027 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1037 = _1029 + _1033;
                            float _1039 = _1029 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1041 = precise::max(_1031, _1035);
                            float _1043 = _1037 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1045 = precise::max(_1039, _1041);
                            float _1047 = _1043 * 0.3333333432674407958984375;
                            float _1049 = -_1047;
                            float _1051 = _1045 + _1049;
                            float _1053 = fma(_1051, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1047);
                            float _1055 = -_1031;
                            float _1057 = _1055 + _1053;
                            float _1059 = -_1035;
                            float _1061 = _1059 + _1053;
                            float _1063 = -_1039;
                            float _1065 = _1063 + _1053;
                            float _1067 = fma(_1057, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1031);
                            float _1069 = fma(_1061, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1035);
                            float _1071 = fma(_1065, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1039);
                            float _1073 = _1067 * _365;
                            float _1075 = _1069 * _367;
                            float _1077 = _1071 * _369;
                            _529 = _1073;
                            _531 = _1075;
                            _539 = _1077;
                            _541 = true;
                        }
                        else
                        {
                            bool _1079 = _553 != 4.0;
                            bool _1081 = isnan(_553);
                            bool _1083 = _1079 || _1081;
                            bool _1085 = isnan(4.0);
                            bool _1087 = _1083 || _1085;
                            if (!_1087)
                            {
                                bool _1089 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1091 = isnan(0.0);
                                bool _1093 = _1089 || _1091;
                                bool _1095 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1097 = _1093 || _1095;
                                float _1119;
                                float _1121;
                                if (!_1097)
                                {
                                    float _1099 = -_365;
                                    float _1101 = _1099 + 1.0;
                                    float _1103 = abs(_1101);
                                    float _1105 = log2(_1103);
                                    float _1107 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1109 = _1105 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1111 = exp2(_1109);
                                    float _1113 = fma(_1107, _1111, 1.0);
                                    float _1115 = 1.0 / _1113;
                                    float _1117 = _1115 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1119 = _1105;
                                    _1121 = _1117;
                                    _1123 = true;
                                }
                                else
                                {
                                    float _1125 = spvFAdd(_365, 9.9999999747524270787835121154785e-07);
                                    bool _1127 = _365 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1129 = isnan(_365);
                                    bool _1131 = _1127 || _1129;
                                    bool _1133 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1135 = _1131 || _1133;
                                    float _1137 = 1.0 / _1125;
                                    if (!_1135)
                                    {
                                        _571 = _365;
                                    }
                                    float _1139 = _571;
                                    bool _1141 = !_1135;
                                    float _1143 = _1139;
                                    _1119 = _1137;
                                    if (!_1141)
                                    {
                                        float _1145 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1147 = _365 + _1145;
                                        float _1149 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1151 = spvFAdd(_1149, 1.00000095367431640625);
                                        float _1153 = 1.0 / _1151;
                                        float _1155 = _1147 * _1153;
                                        float _1157 = -_1155;
                                        float _1159 = _1157 + 1.0;
                                        float _1161 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1163 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1161;
                                        float _1165 = abs(_1159);
                                        float _1167 = log2(_1165);
                                        float _1169 = _1163 * _1153;
                                        float _1171 = _1169 + (-1.0);
                                        float _1173 = _1169 * _1155;
                                        float _1175 = _1167 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1177 = exp2(_1175);
                                        float _1179 = fma(_1171, _1177, 1.0);
                                        float _1181 = 1.0 / _1179;
                                        float _1183 = _1173 * _1181;
                                        float _1185 = fma(_1151, _1183, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1143 = _1185;
                                    }
                                    float _1187 = _1143;
                                    float _1189 = precise::max(0.0, _1187);
                                    float _1191 = precise::min(_1189, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1193 = _1191 * _1137;
                                    _1121 = _1193;
                                }
                                _1123 = false;
                                float _1195 = _1119;
                                float _1197 = _1121;
                                float _1199 = _1195;
                                float _1221;
                                float _1223;
                                if (!_1097)
                                {
                                    float _1201 = -_367;
                                    float _1203 = _1201 + 1.0;
                                    float _1205 = abs(_1203);
                                    float _1207 = log2(_1205);
                                    float _1209 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1211 = _1207 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1213 = exp2(_1211);
                                    float _1215 = fma(_1209, _1213, 1.0);
                                    float _1217 = 1.0 / _1215;
                                    float _1219 = _1217 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1221 = _1207;
                                    _1223 = _1219;
                                    _1225 = true;
                                }
                                else
                                {
                                    float _1227 = spvFAdd(_367, 9.9999999747524270787835121154785e-07);
                                    bool _1229 = _367 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1231 = isnan(_367);
                                    bool _1233 = _1229 || _1231;
                                    bool _1235 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1237 = _1233 || _1235;
                                    float _1239 = 1.0 / _1227;
                                    if (!_1237)
                                    {
                                        _1199 = _367;
                                    }
                                    float _1241 = _1199;
                                    bool _1243 = !_1237;
                                    float _1245 = _1241;
                                    _1221 = _1239;
                                    if (!_1243)
                                    {
                                        float _1247 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1249 = _367 + _1247;
                                        float _1251 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1253 = spvFAdd(_1251, 1.00000095367431640625);
                                        float _1255 = 1.0 / _1253;
                                        float _1257 = _1249 * _1255;
                                        float _1259 = -_1257;
                                        float _1261 = _1259 + 1.0;
                                        float _1263 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1265 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1263;
                                        float _1267 = abs(_1261);
                                        float _1269 = log2(_1267);
                                        float _1271 = _1265 * _1255;
                                        float _1273 = _1271 + (-1.0);
                                        float _1275 = _1271 * _1257;
                                        float _1277 = _1269 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1279 = exp2(_1277);
                                        float _1281 = fma(_1273, _1279, 1.0);
                                        float _1283 = 1.0 / _1281;
                                        float _1285 = _1275 * _1283;
                                        float _1287 = fma(_1253, _1285, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1245 = _1287;
                                    }
                                    float _1289 = _1245;
                                    float _1291 = precise::max(0.0, _1289);
                                    float _1293 = precise::min(_1291, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1295 = _1293 * _1239;
                                    _1223 = _1295;
                                }
                                _1225 = false;
                                float _1297 = _1221;
                                float _1299 = _1223;
                                float _1301 = _1297;
                                float _1323;
                                if (!_1097)
                                {
                                    float _1303 = -_369;
                                    float _1305 = _1303 + 1.0;
                                    float _1307 = abs(_1305);
                                    float _1309 = log2(_1307);
                                    float _1311 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1313 = _1309 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1315 = exp2(_1313);
                                    float _1317 = fma(_1311, _1315, 1.0);
                                    float _1319 = 1.0 / _1317;
                                    float _1321 = _1319 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1323 = _1321;
                                    _1325 = true;
                                }
                                else
                                {
                                    float _1327 = spvFAdd(_369, 9.9999999747524270787835121154785e-07);
                                    bool _1329 = _369 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1331 = isnan(_369);
                                    bool _1333 = _1329 || _1331;
                                    bool _1335 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1337 = _1333 || _1335;
                                    float _1339 = 1.0 / _1327;
                                    if (!_1337)
                                    {
                                        _1301 = _369;
                                    }
                                    float _1341 = _1301;
                                    bool _1343 = !_1337;
                                    float _1345 = _1341;
                                    if (!_1343)
                                    {
                                        float _1347 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1349 = _369 + _1347;
                                        float _1351 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1353 = spvFAdd(_1351, 1.00000095367431640625);
                                        float _1355 = 1.0 / _1353;
                                        float _1357 = _1349 * _1355;
                                        float _1359 = -_1357;
                                        float _1361 = _1359 + 1.0;
                                        float _1363 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1365 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1363;
                                        float _1367 = abs(_1361);
                                        float _1369 = log2(_1367);
                                        float _1371 = _1365 * _1355;
                                        float _1373 = _1371 + (-1.0);
                                        float _1375 = _1371 * _1357;
                                        float _1377 = _1369 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1379 = exp2(_1377);
                                        float _1381 = fma(_1373, _1379, 1.0);
                                        float _1383 = 1.0 / _1381;
                                        float _1385 = _1375 * _1383;
                                        float _1387 = fma(_1353, _1385, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1345 = _1387;
                                    }
                                    float _1389 = _1345;
                                    float _1391 = precise::max(0.0, _1389);
                                    float _1393 = precise::min(_1391, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1395 = _1393 * _1339;
                                    _1323 = _1395;
                                }
                                _1325 = false;
                                float _1397 = _1323;
                                float _1399 = precise::max(_1197, _1299);
                                float _1401 = precise::max(_1399, _1397);
                                float _1403 = -_1197;
                                float _1405 = _1401 + _1403;
                                float _1407 = -_1299;
                                float _1409 = _1401 + _1407;
                                float _1411 = -_1397;
                                float _1413 = _1401 + _1411;
                                float _1415 = fma(_1405, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1197);
                                float _1417 = fma(_1409, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1299);
                                float _1419 = fma(_1413, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1397);
                                float _1421 = _1415 * _365;
                                float _1423 = _1417 * _367;
                                float _1425 = _1419 * _369;
                                _529 = _1421;
                                _531 = _1423;
                                _539 = _1425;
                                _541 = true;
                            }
                            else
                            {
                                bool _1427 = _553 != 5.0;
                                bool _1429 = isnan(_553);
                                bool _1431 = _1427 || _1429;
                                bool _1433 = isnan(5.0);
                                bool _1435 = _1431 || _1433;
                                if (!_1435)
                                {
                                    _573 = _365;
                                }
                                float _1437 = _573;
                                float _1439 = _1437;
                                _529 = _1437;
                                if (!_1435)
                                {
                                    _575 = _367;
                                }
                                float _1441 = _575;
                                float _1443 = _1441;
                                _531 = _1441;
                                if (!_1435)
                                {
                                    _577 = _369;
                                }
                                float _1445 = _577;
                                bool _1447 = !_1435;
                                float _1449 = _1445;
                                _539 = _1445;
                                if (!_1447)
                                {
                                    bool _1451 = _553 != 6.0;
                                    bool _1453 = isnan(_553);
                                    bool _1455 = _1451 || _1453;
                                    bool _1457 = isnan(6.0);
                                    bool _1459 = _1455 || _1457;
                                    if (!_1459)
                                    {
                                        float _1461 = -_365;
                                        float _1463 = _1461 + 1.0;
                                        float _1465 = -_367;
                                        float _1467 = _1465 + 1.0;
                                        float _1469 = -_369;
                                        float _1471 = _1469 + 1.0;
                                        float _1473 = abs(_1463);
                                        float _1475 = log2(_1473);
                                        float _1477 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1479 = abs(_1467);
                                        float _1481 = log2(_1479);
                                        float _1483 = abs(_1471);
                                        float _1485 = log2(_1483);
                                        float _1487 = _1475 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1489 = _1481 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1491 = exp2(_1487);
                                        float _1493 = _1485 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1495 = exp2(_1489);
                                        float _1497 = exp2(_1493);
                                        float _1499 = fma(_1477, _1491, 1.0);
                                        float _1501 = fma(_1477, _1495, 1.0);
                                        float _1503 = 1.0 / _1499;
                                        float _1505 = fma(_1477, _1497, 1.0);
                                        float _1507 = 1.0 / _1501;
                                        float _1509 = 1.0 / _1505;
                                        float _1511 = _1503 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1513 = _1507 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1515 = precise::max(_1511, _1513);
                                        float _1517 = _1509 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1519 = precise::max(_1517, _1515);
                                        float _1521 = -_1511;
                                        float _1523 = _1521 + _1519;
                                        float _1525 = -_1513;
                                        float _1527 = _1525 + _1519;
                                        float _1529 = -_1517;
                                        float _1531 = _1529 + _1519;
                                        float _1533 = fma(_1523, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1511);
                                        float _1535 = fma(_1527, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1513);
                                        float _1537 = fma(_1531, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1517);
                                        float _1539 = _1533 * _365;
                                        float _1541 = _1535 * _367;
                                        float _1543 = _1537 * _369;
                                        _529 = _1539;
                                        _531 = _1541;
                                        _539 = _1543;
                                        _541 = true;
                                    }
                                    else
                                    {
                                        bool _1545 = _553 != 7.0;
                                        bool _1547 = isnan(_553);
                                        bool _1549 = _1545 || _1547;
                                        bool _1551 = isnan(7.0);
                                        bool _1553 = _1549 || _1551;
                                        if (_1553)
                                        {
                                            _1439 = 0.0;
                                            _1443 = 0.0;
                                        }
                                        float _1555 = _1439;
                                        float _1557 = _1443;
                                        _529 = _1555;
                                        _531 = _1557;
                                        if (_1553)
                                        {
                                            _1449 = 0.0;
                                        }
                                        float _1559 = _1449;
                                        _539 = _1559;
                                        if (!_1553)
                                        {
                                            float _1561 = -_365;
                                            float _1563 = _1561 + 1.0;
                                            float _1565 = -_367;
                                            float _1567 = _1565 + 1.0;
                                            float _1569 = -_369;
                                            float _1571 = _1569 + 1.0;
                                            float _1573 = abs(_1563);
                                            float _1575 = log2(_1573);
                                            float _1577 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1579 = abs(_1567);
                                            float _1581 = log2(_1579);
                                            float _1583 = abs(_1571);
                                            float _1585 = log2(_1583);
                                            float _1587 = _1575 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1589 = _1581 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1591 = exp2(_1587);
                                            float _1593 = _1585 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1595 = exp2(_1589);
                                            float _1597 = exp2(_1593);
                                            float _1599 = fma(_1577, _1591, 1.0);
                                            float _1601 = fma(_1577, _1595, 1.0);
                                            float _1603 = 1.0 / _1599;
                                            float _1605 = fma(_1577, _1597, 1.0);
                                            float _1607 = 1.0 / _1601;
                                            float _1609 = 1.0 / _1605;
                                            float _1611 = _1603 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1613 = -_365;
                                            float _1615 = fma(_1611, _365, _1613);
                                            float _1617 = _1607 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1619 = -_367;
                                            float _1621 = fma(_1617, _367, _1619);
                                            float _1623 = _1609 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1625 = _1615 + _1621;
                                            float _1627 = -_369;
                                            float _1629 = fma(_1623, _369, _1627);
                                            float _1631 = _1629 + _1625;
                                            float _1633 = -_1615;
                                            float _1635 = fma(_1631, 0.3333333432674407958984375, _1633);
                                            float _1637 = -_1621;
                                            float _1639 = fma(_1631, 0.3333333432674407958984375, _1637);
                                            float _1641 = -_1629;
                                            float _1643 = fma(_1631, 0.3333333432674407958984375, _1641);
                                            float _1645 = fma(_1635, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1615);
                                            float _1647 = fma(_1639, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1621);
                                            float _1649 = fma(_1643, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1629);
                                            float _1651 = _1645 + _365;
                                            float _1653 = _1647 + _367;
                                            float _1655 = _1649 + _369;
                                            _529 = _1651;
                                            _531 = _1653;
                                            _539 = _1655;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _541 = false;
        float _1657 = _529;
        float _1659 = _531;
        float _1661 = _539;
        _485 = _1657;
        _487 = _1659;
        _489 = _1661;
    }
    _491 = false;
    float _1663 = _485;
    float _1665 = _487;
    float _1667 = _489;
    float _1669 = _1663 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1671 = _1665 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1673 = _1667 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_45.x = _1669;
    out.m_45.y = _1671;
    out.m_45.z = _1673;
    out.m_45.w = _83;
    return out;
}

