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
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture3d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _421 = false;
    bool _471 = false;
    bool _1255 = false;
    bool _1155 = false;
    bool _1053 = false;
    bool _221 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_40.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_40.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _1638 = float2(_68, _66);
    float4 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1638, float2(0.0), isnan(_1638))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1638, float2(0.0), isnan(_1638))).xyzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _71.w;
    bool _83 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _85 = isnan(0.0);
    bool _87 = _83 || _85;
    bool _89 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _91 = _87 || _89;
    float _93 = _56;
    float _95 = _64;
    float _97 = (*spvDescriptorSet0.fp_c4)._m0[5].z;
    if (_91)
    {
        float _99 = _75 * 0.715200006961822509765625;
        _93 = _99;
    }
    float _101 = _93;
    float _103 = _101;
    if (_91)
    {
        float _105 = fma(_73, 0.2125999927520751953125, _101);
        _103 = _105;
    }
    float _107 = _103;
    float _109 = 0.0;
    float _111 = _107;
    if (_91)
    {
        float _113 = fma(_77, 0.072200000286102294921875, _107);
        _109 = _113;
    }
    float _115 = _109;
    if (!_91)
    {
        _111 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _117 = _111;
    float _119 = _115;
    float _121 = _117;
    if (_91)
    {
        float _123 = 1.0 / _115;
        _119 = _123;
    }
    float _125 = _119;
    if (_91)
    {
        float _127 = _125 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _129 = precise::clamp(_127, 0.0, 1.0);
        _95 = _129;
    }
    float _131 = _95;
    if (_91)
    {
        float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _121 = _133;
    }
    float _135 = _121;
    bool _137 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
    float _139 = _73 * _135;
    float _141 = _139 * 4.0;
    float _143 = _75 * _135;
    float _145 = _143 * 4.0;
    float _147 = _77 * _135;
    float _149 = _147 * 4.0;
    uint _152 = as_type<uint>(half2(float2(_141, _145)));
    uint _154 = as_type<uint>(half2(float2(_149, 0.0)));
    uint _156 = extract_bits(_152, 16u, 16u);
    float _158 = float(_156);
    int _161 = int(_152) & 32767;
    uint _163 = extract_bits(_154, 0u, 8u);
    int _165 = int(_163) & 255;
    uint _167 = extract_bits(_154, 8u, 8u);
    int _169 = int(_167) & 255;
    int _171 = _169 << 8;
    int _173 = _165 | _171;
    float _175 = float(uint(_161));
    float _177 = float(uint(_173));
    float _179 = fma(_175, 6.103515625e-05, -0.3125);
    float _181 = fma(_177, 6.103515625e-05, -0.3125);
    float _183 = fma(_179, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _185 = fma(_158, 6.103515625e-05, -0.3125);
    float _187 = fma(_181, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _189 = fma(_185, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _191 = !_137;
    float _193 = _179;
    float _195 = _181;
    float _197 = _179;
    float _199 = _181;
    float _201 = _187;
    float _203 = _187;
    float _215;
    float _217;
    float _219;
    if (!_191)
    {
        float3 _1843 = float3(_183, _189, _187);
        float3 _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1843, float3(0.0), isnan(_1843))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1843, float3(0.0), isnan(_1843))).xyz;
        float _209 = _207.x;
        float _211 = _207.y;
        float _213 = _207.z;
        _215 = _209;
        _217 = _211;
        _219 = _213;
        _221 = true;
    }
    else
    {
        bool _223 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
        bool _225 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
        bool _227 = _223 || _225;
        bool _229 = isnan(0.001000000047497451305389404296875);
        bool _231 = _227 || _229;
        float3 _1879 = float3(_183, _189, _187);
        float3 _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1879, float3(0.0), isnan(_1879))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1879, float3(0.0), isnan(_1879))).xyz;
        float _235 = _233.x;
        float _237 = _233.y;
        float _239 = _233.z;
        float _241 = (*spvDescriptorSet0.fp_c4)._m0[5].z;
        float _243 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
        float _245 = 0.0;
        float _247 = _237;
        float _249 = _235;
        _219 = _239;
        if (_231)
        {
            float3 _1903 = float3(_183, _189, _187);
            float3 _251 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1903, float3(0.0), isnan(_1903))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1903, float3(0.0), isnan(_1903))).xyz;
            float _253 = _251.x;
            float _255 = _251.y;
            float _257 = _251.z;
            _241 = _253;
            _243 = _255;
            _245 = _257;
        }
        float _259 = _241;
        float _261 = _243;
        float _263 = _245;
        float _265 = _261;
        _97 = _259;
        if (_231)
        {
            float _267 = -_237;
            float _269 = _267 + _261;
            _193 = _269;
        }
        float _271 = _193;
        _197 = _271;
        if (_231)
        {
            float _273 = -_235;
            float _275 = _273 + _259;
            _195 = _275;
        }
        float _277 = _195;
        _199 = _277;
        if (_231)
        {
            float _279 = -_239;
            float _281 = _279 + _263;
            _265 = _281;
        }
        float _283 = _265;
        if (_231)
        {
            float _285 = fma(_271, (*spvDescriptorSet0.fp_c4)._m0[5].z, _237);
            _247 = _285;
        }
        float _287 = _247;
        _217 = _287;
        if (_231)
        {
            float _289 = fma(_277, (*spvDescriptorSet0.fp_c4)._m0[5].z, _235);
            _249 = _289;
        }
        float _291 = _249;
        _215 = _291;
        if (_231)
        {
            float _293 = fma(_283, (*spvDescriptorSet0.fp_c4)._m0[5].z, _239);
            _219 = _293;
        }
    }
    _221 = false;
    float _295 = _215;
    float _297 = _217;
    float _299 = _219;
    float _301 = _97;
    float _303 = _197;
    float _305 = _199;
    bool _307 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _309 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _311 = _307 || _309;
    bool _313 = isnan(6.0);
    bool _315 = _311 || _313;
    float _317 = _301;
    float _319 = _305;
    float _321 = _303;
    float _323 = _305;
    float _325 = _295;
    float _327 = _297;
    float _329 = _299;
    float _415;
    float _417;
    float _419;
    if (!_315)
    {
        float _331 = -_295;
        float _333 = _331 + 1.0;
        float _335 = -_297;
        float _337 = _335 + 1.0;
        float _339 = -_299;
        float _341 = _339 + 1.0;
        float _343 = abs(_333);
        float _345 = log2(_343);
        float _347 = abs(_337);
        float _349 = log2(_347);
        float _351 = abs(_341);
        float _353 = log2(_351);
        float _355 = _345 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _357 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _359 = _349 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _361 = exp2(_355);
        float _363 = _353 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _365 = exp2(_359);
        float _367 = exp2(_363);
        float _369 = fma(_357, _361, 1.0);
        float _371 = fma(_357, _365, 1.0);
        float _373 = 1.0 / _369;
        float _375 = fma(_357, _367, 1.0);
        float _377 = 1.0 / _371;
        float _379 = 1.0 / _375;
        float _381 = _373 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _383 = _377 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _385 = precise::max(_381, _383);
        float _387 = _379 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _389 = precise::max(_387, _385);
        float _391 = -_381;
        float _393 = _391 + _389;
        float _395 = -_383;
        float _397 = _395 + _389;
        float _399 = -_387;
        float _401 = _399 + _389;
        float _403 = fma(_393, (*spvDescriptorSet0.fp_c3)._m0[6].w, _381);
        float _405 = fma(_397, (*spvDescriptorSet0.fp_c3)._m0[6].w, _383);
        float _407 = fma(_401, (*spvDescriptorSet0.fp_c3)._m0[6].w, _387);
        float _409 = _403 * _295;
        float _411 = _405 * _297;
        float _413 = _407 * _299;
        _415 = _409;
        _417 = _411;
        _419 = _413;
        _421 = true;
    }
    else
    {
        bool _423 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_423)
        {
            _317 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _425 = _317;
        bool _427 = !_423;
        float _429 = _425;
        float _459;
        float _461;
        float _469;
        if (!_427)
        {
            float _431 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _433 = _68 + _431;
            float _435 = abs(_433);
            float _437 = _435 * 2560.0;
            bool _439 = _437 >= 2.0;
            bool _441 = isnan(_437);
            bool _443 = _439 || _441;
            bool _445 = isnan(2.0);
            bool _447 = _443 || _445;
            float _449 = _437;
            if (!_447)
            {
                _449 = 0.0;
                _319 = 0.0;
            }
            float _451 = _449;
            float _453 = _319;
            float _455 = _451;
            float _457 = _453;
            _459 = _451;
            _461 = _453;
            if (!_447)
            {
                _201 = 0.0;
            }
            float _463 = _201;
            bool _465 = !_447;
            float _467 = _463;
            _469 = _463;
            _471 = _465;
            if (!_471)
            {
                bool _473 = _68 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_473)
                {
                    _455 = _295;
                }
                float _475 = _455;
                _321 = _475;
                _459 = _475;
                if (_473)
                {
                    _457 = _297;
                }
                float _477 = _457;
                _323 = _477;
                _461 = _477;
                if (_473)
                {
                    _467 = _299;
                }
                float _479 = _467;
                _203 = _479;
                _469 = _479;
                _471 = _473;
                if (!_471)
                {
                    float _481 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _429 = _481;
                }
            }
        }
        if (!_471)
        {
            float _483 = _429;
            float _485 = _321;
            float _487 = _323;
            float _489 = _203;
            bool _491 = _483 != 0.0;
            bool _493 = isnan(_483);
            bool _495 = _491 || _493;
            bool _497 = isnan(0.0);
            bool _499 = _495 || _497;
            float _501 = _485;
            float _503 = _485;
            float _505 = _485;
            float _507 = _487;
            float _509 = _489;
            if (!_499)
            {
                float _511 = _297 * 0.586600005626678466796875;
                float _513 = fma(_295, 0.29890000820159912109375, _511);
                float _515 = fma(_299, 0.1143999993801116943359375, _513);
                float _517 = _515 * (-1.44269502162933349609375);
                float _519 = exp2(_517);
                float _521 = -_519;
                float _523 = _521 + 1.0;
                bool _525 = _523 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _527 = isnan(_523);
                bool _529 = _525 || _527;
                bool _531 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _533 = _529 || _531;
                if (!_533)
                {
                    _501 = _523;
                }
                float _535 = _501;
                bool _537 = !_533;
                float _539 = _535;
                if (!_537)
                {
                    float _541 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _543 = _523 + _541;
                    float _545 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _547 = spvFAdd(_545, 1.00000095367431640625);
                    float _549 = 1.0 / _547;
                    float _551 = _543 * _549;
                    float _553 = -_551;
                    float _555 = _553 + 1.0;
                    float _557 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _559 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _557;
                    float _561 = abs(_555);
                    float _563 = log2(_561);
                    float _565 = _559 * _549;
                    float _567 = _565 + (-1.0);
                    float _569 = _565 * _551;
                    float _571 = _563 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _573 = exp2(_571);
                    float _575 = fma(_567, _573, 1.0);
                    float _577 = 1.0 / _575;
                    float _579 = _569 * _577;
                    float _581 = fma(_547, _579, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _539 = _581;
                }
                float _583 = _539;
                float _585 = -_523;
                float _587 = _585 + _583;
                float _589 = spvFAdd(_515, 9.9999999747524270787835121154785e-07);
                float _591 = _587 + 1.0;
                float _593 = 1.0 / _589;
                float _595 = abs(_591);
                float _597 = log2(_595);
                float _599 = fma(_593, _295, -1.0);
                float _601 = fma(_593, _297, -1.0);
                float _603 = fma(_593, _299, -1.0);
                float _605 = _597 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _607 = exp2(_605);
                float _609 = fma(_607, _599, 1.0);
                float _611 = fma(_607, _601, 1.0);
                float _613 = fma(_607, _603, 1.0);
                float _615 = _609 * _583;
                float _617 = _611 * _583;
                float _619 = _613 * _583;
                float _621 = precise::max(0.0, _615);
                float _623 = precise::max(0.0, _617);
                float _625 = precise::max(0.0, _619);
                float _627 = precise::min(_621, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _629 = precise::min(_623, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _631 = precise::min(_625, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _459 = _627;
                _461 = _629;
                _469 = _631;
                _471 = true;
            }
            else
            {
                bool _633 = _483 != 1.0;
                bool _635 = isnan(_483);
                bool _637 = _633 || _635;
                bool _639 = isnan(1.0);
                bool _641 = _637 || _639;
                if (!_641)
                {
                    bool _643 = _295 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _645 = isnan(_295);
                    bool _647 = _643 || _645;
                    bool _649 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _651 = _647 || _649;
                    float _653 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _655 = spvFAdd(_653, 1.00000095367431640625);
                    bool _657 = _297 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _659 = isnan(_297);
                    bool _661 = _657 || _659;
                    bool _663 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _665 = _661 || _663;
                    bool _667 = _299 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _669 = isnan(_299);
                    bool _671 = _667 || _669;
                    bool _673 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _675 = _671 || _673;
                    float _677 = 1.0 / _655;
                    float _679 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _681 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _679;
                    float _683 = _681 * _677;
                    bool _685 = !_651;
                    if (!_685)
                    {
                        float _687 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _689 = _295 + _687;
                        float _691 = _683 + (-1.0);
                        float _693 = _689 * _677;
                        float _695 = -_693;
                        float _697 = _695 + 1.0;
                        float _699 = _683 * _693;
                        float _701 = abs(_697);
                        float _703 = log2(_701);
                        float _705 = _703 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _707 = exp2(_705);
                        float _709 = fma(_691, _707, 1.0);
                        float _711 = 1.0 / _709;
                        float _713 = _699 * _711;
                        float _715 = fma(_655, _713, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _325 = _715;
                    }
                    float _717 = _325;
                    bool _719 = !_665;
                    if (!_719)
                    {
                        float _721 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _723 = _297 + _721;
                        float _725 = _683 + (-1.0);
                        float _727 = _723 * _677;
                        float _729 = -_727;
                        float _731 = _729 + 1.0;
                        float _733 = _683 * _727;
                        float _735 = abs(_731);
                        float _737 = log2(_735);
                        float _739 = _737 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _741 = exp2(_739);
                        float _743 = fma(_725, _741, 1.0);
                        float _745 = 1.0 / _743;
                        float _747 = _733 * _745;
                        float _749 = fma(_655, _747, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _327 = _749;
                    }
                    float _751 = _327;
                    bool _753 = !_675;
                    if (!_753)
                    {
                        float _755 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _757 = _299 + _755;
                        float _759 = _683 + (-1.0);
                        float _761 = _757 * _677;
                        float _763 = -_761;
                        float _765 = _763 + 1.0;
                        float _767 = _683 * _761;
                        float _769 = abs(_765);
                        float _771 = log2(_769);
                        float _773 = _771 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _775 = exp2(_773);
                        float _777 = fma(_759, _775, 1.0);
                        float _779 = 1.0 / _777;
                        float _781 = _767 * _779;
                        float _783 = fma(_655, _781, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _329 = _783;
                    }
                    float _785 = _329;
                    float _787 = precise::max(0.0, _785);
                    float _789 = precise::max(0.0, _717);
                    float _791 = precise::max(0.0, _751);
                    float _793 = precise::min(_787, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _795 = precise::min(_789, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _797 = precise::min(_791, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _459 = _795;
                    _461 = _797;
                    _469 = _793;
                    _471 = true;
                }
                else
                {
                    bool _799 = _483 != 2.0;
                    bool _801 = isnan(_483);
                    bool _803 = _799 || _801;
                    bool _805 = isnan(2.0);
                    bool _807 = _803 || _805;
                    if (!_807)
                    {
                        float _809 = _297 * 0.715200006961822509765625;
                        float _811 = fma(_295, 0.2125999927520751953125, _809);
                        float _813 = fma(_299, 0.072200000286102294921875, _811);
                        float _815 = spvFAdd(_813, 9.9999999747524270787835121154785e-07);
                        bool _817 = _813 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _819 = isnan(_813);
                        bool _821 = _817 || _819;
                        bool _823 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _825 = _821 || _823;
                        float _827 = 1.0 / _815;
                        bool _829 = !_825;
                        float _831 = _813;
                        if (!_829)
                        {
                            float _833 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _835 = _813 + _833;
                            float _837 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _839 = spvFAdd(_837, 1.00000095367431640625);
                            float _841 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _843 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _841;
                            float _845 = 1.0 / _839;
                            float _847 = _835 * _845;
                            float _849 = _843 * _845;
                            float _851 = -_847;
                            float _853 = _851 + 1.0;
                            float _855 = _849 + (-1.0);
                            float _857 = _849 * _847;
                            float _859 = abs(_853);
                            float _861 = log2(_859);
                            float _863 = _861 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _865 = exp2(_863);
                            float _867 = fma(_855, _865, 1.0);
                            float _869 = 1.0 / _867;
                            float _871 = _857 * _869;
                            float _873 = fma(_839, _871, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _831 = _873;
                        }
                        float _875 = _831;
                        float _877 = precise::max(0.0, _875);
                        float _879 = precise::min(_877, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _881 = _879 * _827;
                        float _883 = _295 * _881;
                        float _885 = _297 * _881;
                        float _887 = _299 * _881;
                        float _889 = precise::max(0.0, _883);
                        float _891 = precise::max(0.0, _885);
                        float _893 = precise::max(0.0, _887);
                        float _895 = precise::min(_889, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _897 = precise::min(_891, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _899 = precise::min(_893, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _459 = _895;
                        _461 = _897;
                        _469 = _899;
                        _471 = true;
                    }
                    else
                    {
                        bool _901 = _483 != 3.0;
                        bool _903 = isnan(_483);
                        bool _905 = _901 || _903;
                        bool _907 = isnan(3.0);
                        bool _909 = _905 || _907;
                        if (!_909)
                        {
                            float _911 = -_295;
                            float _913 = _911 + 1.0;
                            float _915 = -_297;
                            float _917 = _915 + 1.0;
                            float _919 = -_299;
                            float _921 = _919 + 1.0;
                            float _923 = abs(_913);
                            float _925 = log2(_923);
                            float _927 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _929 = abs(_917);
                            float _931 = log2(_929);
                            float _933 = abs(_921);
                            float _935 = log2(_933);
                            float _937 = _925 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _939 = _931 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _941 = exp2(_937);
                            float _943 = _935 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _945 = exp2(_939);
                            float _947 = exp2(_943);
                            float _949 = fma(_927, _941, 1.0);
                            float _951 = fma(_927, _945, 1.0);
                            float _953 = 1.0 / _949;
                            float _955 = fma(_927, _947, 1.0);
                            float _957 = 1.0 / _951;
                            float _959 = 1.0 / _955;
                            float _961 = _953 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _963 = _953 + _957;
                            float _965 = _957 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _967 = _959 + _963;
                            float _969 = _959 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _971 = precise::max(_961, _965);
                            float _973 = _967 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _975 = precise::max(_969, _971);
                            float _977 = _973 * 0.3333333432674407958984375;
                            float _979 = -_977;
                            float _981 = _975 + _979;
                            float _983 = fma(_981, (*spvDescriptorSet0.fp_c3)._m0[7].z, _977);
                            float _985 = -_961;
                            float _987 = _985 + _983;
                            float _989 = -_965;
                            float _991 = _989 + _983;
                            float _993 = -_969;
                            float _995 = _993 + _983;
                            float _997 = fma(_987, (*spvDescriptorSet0.fp_c3)._m0[6].w, _961);
                            float _999 = fma(_991, (*spvDescriptorSet0.fp_c3)._m0[6].w, _965);
                            float _1001 = fma(_995, (*spvDescriptorSet0.fp_c3)._m0[6].w, _969);
                            float _1003 = _997 * _295;
                            float _1005 = _999 * _297;
                            float _1007 = _1001 * _299;
                            _459 = _1003;
                            _461 = _1005;
                            _469 = _1007;
                            _471 = true;
                        }
                        else
                        {
                            bool _1009 = _483 != 4.0;
                            bool _1011 = isnan(_483);
                            bool _1013 = _1009 || _1011;
                            bool _1015 = isnan(4.0);
                            bool _1017 = _1013 || _1015;
                            if (!_1017)
                            {
                                bool _1019 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1021 = isnan(0.0);
                                bool _1023 = _1019 || _1021;
                                bool _1025 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1027 = _1023 || _1025;
                                float _1049;
                                float _1051;
                                if (!_1027)
                                {
                                    float _1029 = -_295;
                                    float _1031 = _1029 + 1.0;
                                    float _1033 = abs(_1031);
                                    float _1035 = log2(_1033);
                                    float _1037 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1039 = _1035 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1041 = exp2(_1039);
                                    float _1043 = fma(_1037, _1041, 1.0);
                                    float _1045 = 1.0 / _1043;
                                    float _1047 = _1045 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1049 = _1035;
                                    _1051 = _1047;
                                    _1053 = true;
                                }
                                else
                                {
                                    float _1055 = spvFAdd(_295, 9.9999999747524270787835121154785e-07);
                                    bool _1057 = _295 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1059 = isnan(_295);
                                    bool _1061 = _1057 || _1059;
                                    bool _1063 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1065 = _1061 || _1063;
                                    float _1067 = 1.0 / _1055;
                                    if (!_1065)
                                    {
                                        _503 = _295;
                                    }
                                    float _1069 = _503;
                                    bool _1071 = !_1065;
                                    float _1073 = _1069;
                                    _1049 = _1067;
                                    if (!_1071)
                                    {
                                        float _1075 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1077 = _295 + _1075;
                                        float _1079 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1081 = spvFAdd(_1079, 1.00000095367431640625);
                                        float _1083 = 1.0 / _1081;
                                        float _1085 = _1077 * _1083;
                                        float _1087 = -_1085;
                                        float _1089 = _1087 + 1.0;
                                        float _1091 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1093 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1091;
                                        float _1095 = abs(_1089);
                                        float _1097 = log2(_1095);
                                        float _1099 = _1093 * _1083;
                                        float _1101 = _1099 + (-1.0);
                                        float _1103 = _1099 * _1085;
                                        float _1105 = _1097 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1107 = exp2(_1105);
                                        float _1109 = fma(_1101, _1107, 1.0);
                                        float _1111 = 1.0 / _1109;
                                        float _1113 = _1103 * _1111;
                                        float _1115 = fma(_1081, _1113, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1073 = _1115;
                                    }
                                    float _1117 = _1073;
                                    float _1119 = precise::max(0.0, _1117);
                                    float _1121 = precise::min(_1119, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1123 = _1121 * _1067;
                                    _1051 = _1123;
                                }
                                _1053 = false;
                                float _1125 = _1049;
                                float _1127 = _1051;
                                float _1129 = _1125;
                                float _1151;
                                float _1153;
                                if (!_1027)
                                {
                                    float _1131 = -_297;
                                    float _1133 = _1131 + 1.0;
                                    float _1135 = abs(_1133);
                                    float _1137 = log2(_1135);
                                    float _1139 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1141 = _1137 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1143 = exp2(_1141);
                                    float _1145 = fma(_1139, _1143, 1.0);
                                    float _1147 = 1.0 / _1145;
                                    float _1149 = _1147 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1151 = _1137;
                                    _1153 = _1149;
                                    _1155 = true;
                                }
                                else
                                {
                                    float _1157 = spvFAdd(_297, 9.9999999747524270787835121154785e-07);
                                    bool _1159 = _297 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1161 = isnan(_297);
                                    bool _1163 = _1159 || _1161;
                                    bool _1165 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1167 = _1163 || _1165;
                                    float _1169 = 1.0 / _1157;
                                    if (!_1167)
                                    {
                                        _1129 = _297;
                                    }
                                    float _1171 = _1129;
                                    bool _1173 = !_1167;
                                    float _1175 = _1171;
                                    _1151 = _1169;
                                    if (!_1173)
                                    {
                                        float _1177 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1179 = _297 + _1177;
                                        float _1181 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1183 = spvFAdd(_1181, 1.00000095367431640625);
                                        float _1185 = 1.0 / _1183;
                                        float _1187 = _1179 * _1185;
                                        float _1189 = -_1187;
                                        float _1191 = _1189 + 1.0;
                                        float _1193 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1195 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1193;
                                        float _1197 = abs(_1191);
                                        float _1199 = log2(_1197);
                                        float _1201 = _1195 * _1185;
                                        float _1203 = _1201 + (-1.0);
                                        float _1205 = _1201 * _1187;
                                        float _1207 = _1199 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1209 = exp2(_1207);
                                        float _1211 = fma(_1203, _1209, 1.0);
                                        float _1213 = 1.0 / _1211;
                                        float _1215 = _1205 * _1213;
                                        float _1217 = fma(_1183, _1215, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1175 = _1217;
                                    }
                                    float _1219 = _1175;
                                    float _1221 = precise::max(0.0, _1219);
                                    float _1223 = precise::min(_1221, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1225 = _1223 * _1169;
                                    _1153 = _1225;
                                }
                                _1155 = false;
                                float _1227 = _1151;
                                float _1229 = _1153;
                                float _1231 = _1227;
                                float _1253;
                                if (!_1027)
                                {
                                    float _1233 = -_299;
                                    float _1235 = _1233 + 1.0;
                                    float _1237 = abs(_1235);
                                    float _1239 = log2(_1237);
                                    float _1241 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1243 = _1239 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1245 = exp2(_1243);
                                    float _1247 = fma(_1241, _1245, 1.0);
                                    float _1249 = 1.0 / _1247;
                                    float _1251 = _1249 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1253 = _1251;
                                    _1255 = true;
                                }
                                else
                                {
                                    float _1257 = spvFAdd(_299, 9.9999999747524270787835121154785e-07);
                                    bool _1259 = _299 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1261 = isnan(_299);
                                    bool _1263 = _1259 || _1261;
                                    bool _1265 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1267 = _1263 || _1265;
                                    float _1269 = 1.0 / _1257;
                                    if (!_1267)
                                    {
                                        _1231 = _299;
                                    }
                                    float _1271 = _1231;
                                    bool _1273 = !_1267;
                                    float _1275 = _1271;
                                    if (!_1273)
                                    {
                                        float _1277 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1279 = _299 + _1277;
                                        float _1281 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1283 = spvFAdd(_1281, 1.00000095367431640625);
                                        float _1285 = 1.0 / _1283;
                                        float _1287 = _1279 * _1285;
                                        float _1289 = -_1287;
                                        float _1291 = _1289 + 1.0;
                                        float _1293 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1295 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1293;
                                        float _1297 = abs(_1291);
                                        float _1299 = log2(_1297);
                                        float _1301 = _1295 * _1285;
                                        float _1303 = _1301 + (-1.0);
                                        float _1305 = _1301 * _1287;
                                        float _1307 = _1299 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1309 = exp2(_1307);
                                        float _1311 = fma(_1303, _1309, 1.0);
                                        float _1313 = 1.0 / _1311;
                                        float _1315 = _1305 * _1313;
                                        float _1317 = fma(_1283, _1315, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1275 = _1317;
                                    }
                                    float _1319 = _1275;
                                    float _1321 = precise::max(0.0, _1319);
                                    float _1323 = precise::min(_1321, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1325 = _1323 * _1269;
                                    _1253 = _1325;
                                }
                                _1255 = false;
                                float _1327 = _1253;
                                float _1329 = precise::max(_1127, _1229);
                                float _1331 = precise::max(_1329, _1327);
                                float _1333 = -_1127;
                                float _1335 = _1331 + _1333;
                                float _1337 = -_1229;
                                float _1339 = _1331 + _1337;
                                float _1341 = -_1327;
                                float _1343 = _1331 + _1341;
                                float _1345 = fma(_1335, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1127);
                                float _1347 = fma(_1339, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1229);
                                float _1349 = fma(_1343, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1327);
                                float _1351 = _1345 * _295;
                                float _1353 = _1347 * _297;
                                float _1355 = _1349 * _299;
                                _459 = _1351;
                                _461 = _1353;
                                _469 = _1355;
                                _471 = true;
                            }
                            else
                            {
                                bool _1357 = _483 != 5.0;
                                bool _1359 = isnan(_483);
                                bool _1361 = _1357 || _1359;
                                bool _1363 = isnan(5.0);
                                bool _1365 = _1361 || _1363;
                                if (!_1365)
                                {
                                    _505 = _295;
                                }
                                float _1367 = _505;
                                float _1369 = _1367;
                                _459 = _1367;
                                if (!_1365)
                                {
                                    _507 = _297;
                                }
                                float _1371 = _507;
                                float _1373 = _1371;
                                _461 = _1371;
                                if (!_1365)
                                {
                                    _509 = _299;
                                }
                                float _1375 = _509;
                                bool _1377 = !_1365;
                                float _1379 = _1375;
                                _469 = _1375;
                                if (!_1377)
                                {
                                    bool _1381 = _483 != 6.0;
                                    bool _1383 = isnan(_483);
                                    bool _1385 = _1381 || _1383;
                                    bool _1387 = isnan(6.0);
                                    bool _1389 = _1385 || _1387;
                                    if (!_1389)
                                    {
                                        float _1391 = -_297;
                                        float _1393 = _1391 + 1.0;
                                        float _1395 = -_295;
                                        float _1397 = _1395 + 1.0;
                                        float _1399 = -_299;
                                        float _1401 = _1399 + 1.0;
                                        float _1403 = abs(_1393);
                                        float _1405 = log2(_1403);
                                        float _1407 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1409 = abs(_1397);
                                        float _1411 = log2(_1409);
                                        float _1413 = abs(_1401);
                                        float _1415 = log2(_1413);
                                        float _1417 = _1405 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1419 = _1411 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1421 = exp2(_1417);
                                        float _1423 = _1415 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1425 = exp2(_1419);
                                        float _1427 = exp2(_1423);
                                        float _1429 = fma(_1407, _1421, 1.0);
                                        float _1431 = fma(_1407, _1425, 1.0);
                                        float _1433 = 1.0 / _1429;
                                        float _1435 = fma(_1407, _1427, 1.0);
                                        float _1437 = 1.0 / _1431;
                                        float _1439 = 1.0 / _1435;
                                        float _1441 = _1433 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1443 = _1437 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1445 = precise::max(_1443, _1441);
                                        float _1447 = _1439 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1449 = precise::max(_1447, _1445);
                                        float _1451 = -_1443;
                                        float _1453 = _1451 + _1449;
                                        float _1455 = -_1441;
                                        float _1457 = _1455 + _1449;
                                        float _1459 = -_1447;
                                        float _1461 = _1459 + _1449;
                                        float _1463 = fma(_1453, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1443);
                                        float _1465 = fma(_1457, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1441);
                                        float _1467 = fma(_1461, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1447);
                                        float _1469 = _1463 * _295;
                                        float _1471 = _1465 * _297;
                                        float _1473 = _1467 * _299;
                                        _459 = _1469;
                                        _461 = _1471;
                                        _469 = _1473;
                                        _471 = true;
                                    }
                                    else
                                    {
                                        bool _1475 = _483 != 7.0;
                                        bool _1477 = isnan(_483);
                                        bool _1479 = _1475 || _1477;
                                        bool _1481 = isnan(7.0);
                                        bool _1483 = _1479 || _1481;
                                        if (_1483)
                                        {
                                            _1369 = 0.0;
                                            _1373 = 0.0;
                                        }
                                        float _1485 = _1369;
                                        float _1487 = _1373;
                                        _459 = _1485;
                                        _461 = _1487;
                                        if (_1483)
                                        {
                                            _1379 = 0.0;
                                        }
                                        float _1489 = _1379;
                                        _469 = _1489;
                                        if (!_1483)
                                        {
                                            float _1491 = -_297;
                                            float _1493 = _1491 + 1.0;
                                            float _1495 = -_295;
                                            float _1497 = _1495 + 1.0;
                                            float _1499 = -_299;
                                            float _1501 = _1499 + 1.0;
                                            float _1503 = abs(_1493);
                                            float _1505 = log2(_1503);
                                            float _1507 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1509 = abs(_1497);
                                            float _1511 = log2(_1509);
                                            float _1513 = abs(_1501);
                                            float _1515 = log2(_1513);
                                            float _1517 = _1505 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1519 = _1511 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1521 = exp2(_1517);
                                            float _1523 = _1515 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1525 = exp2(_1519);
                                            float _1527 = exp2(_1523);
                                            float _1529 = fma(_1507, _1521, 1.0);
                                            float _1531 = fma(_1507, _1525, 1.0);
                                            float _1533 = 1.0 / _1529;
                                            float _1535 = fma(_1507, _1527, 1.0);
                                            float _1537 = 1.0 / _1531;
                                            float _1539 = 1.0 / _1535;
                                            float _1541 = _1533 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1543 = _1537 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1545 = -_295;
                                            float _1547 = fma(_1543, _295, _1545);
                                            float _1549 = -_297;
                                            float _1551 = fma(_1541, _297, _1549);
                                            float _1553 = _1539 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1555 = _1547 + _1551;
                                            float _1557 = -_299;
                                            float _1559 = fma(_1553, _299, _1557);
                                            float _1561 = _1559 + _1555;
                                            float _1563 = -_1547;
                                            float _1565 = fma(_1561, 0.3333333432674407958984375, _1563);
                                            float _1567 = -_1551;
                                            float _1569 = fma(_1561, 0.3333333432674407958984375, _1567);
                                            float _1571 = -_1559;
                                            float _1573 = fma(_1561, 0.3333333432674407958984375, _1571);
                                            float _1575 = fma(_1565, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1547);
                                            float _1577 = fma(_1569, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1551);
                                            float _1579 = fma(_1573, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1559);
                                            float _1581 = _1575 + _295;
                                            float _1583 = _1577 + _297;
                                            float _1585 = _1579 + _299;
                                            _459 = _1581;
                                            _461 = _1583;
                                            _469 = _1585;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _471 = false;
        float _1587 = _459;
        float _1589 = _461;
        float _1591 = _469;
        _415 = _1587;
        _417 = _1589;
        _419 = _1591;
    }
    _421 = false;
    float _1593 = _415;
    float _1595 = _417;
    float _1597 = _419;
    float _1599 = _1593 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1601 = _1595 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1603 = _1597 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_43.x = _1599;
    out.m_43.y = _1601;
    out.m_43.z = _1603;
    out.m_43.w = _79;
    return out;
}

