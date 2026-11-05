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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture3d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ESmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _449 = false;
    bool _499 = false;
    bool _1283 = false;
    bool _1183 = false;
    bool _1081 = false;
    bool _267 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_44.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_44.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _54;
    float _70 = _68 * _60;
    float _72 = _68 * _66;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float2 _1672 = float2(_72, _70);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1672, float2(0.0), isnan(_1672))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1672, float2(0.0), isnan(_1672))).x;
    float2 _1683 = float2(_72, _70);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1683, float2(0.0), isnan(_1683))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1683, float2(0.0), isnan(_1683))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = _72 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float2 _1703 = float2(_89, _74);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1703, float2(0.0), isnan(_1703))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1703, float2(0.0), isnan(_1703))).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    bool _103 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _111 = _107 || _109;
    float _113 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _115 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _113;
    float _117 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _119 = _70;
    float _121 = _115;
    if (!_111)
    {
        _119 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _123 = _119;
    float _125 = -_117;
    float _127 = fma(_76, _115, _125);
    float _129 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
    float _131 = _123;
    if (_111)
    {
        float _133 = _83 * 0.715200006961822509765625;
        _121 = _133;
    }
    float _135 = _121;
    float _137 = _129 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _139 = 1.0 / _127;
    float _141 = _135;
    if (_111)
    {
        float _143 = fma(_81, 0.2125999927520751953125, _135);
        _141 = _143;
    }
    float _145 = _141;
    float _147 = _145;
    if (_111)
    {
        float _149 = fma(_85, 0.072200000286102294921875, _145);
        _147 = _149;
    }
    float _151 = _147;
    float _153 = _151;
    if (_111)
    {
        float _155 = 1.0 / _151;
        _153 = _155;
    }
    float _157 = _153;
    float _159 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _161 = fma(_137, _139, _159);
    float _163 = precise::max(0.0, _161);
    float _165 = _163 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _167 = _163;
    if (_111)
    {
        float _169 = _157 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _171 = precise::clamp(_169, 0.0, 1.0);
        _167 = _171;
    }
    float _173 = _167;
    float _175 = _165 * (-1.44269502162933349609375);
    if (_111)
    {
        float _177 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _131 = _177;
    }
    float _179 = _131;
    float _181 = exp2(_175);
    float _183 = fma(_81, _179, _95);
    float _185 = fma(_83, _179, _97);
    float _187 = fma(_85, _179, _99);
    float _189 = _183 * 4.0;
    float _191 = _185 * 4.0;
    float _193 = _187 * 4.0;
    uint _196 = as_type<uint>(half2(float2(_189, _191)));
    uint _198 = as_type<uint>(half2(float2(_193, 0.0)));
    uint _200 = extract_bits(_196, 16u, 16u);
    float _202 = float(_200);
    float _204 = _181 + (-0.5);
    uint _206 = extract_bits(_198, 0u, 8u);
    int _209 = int(_206) & 255;
    uint _211 = extract_bits(_198, 8u, 8u);
    int _213 = int(_211) & 255;
    int _215 = _213 << 8;
    int _217 = _209 | _215;
    float _219 = fma(_204, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
    int _221 = int(_196) & 32767;
    float _223 = float(uint(_217));
    float _225 = precise::max(_219, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _227 = float(uint(_221));
    float _229 = fma(_223, 6.103515625e-05, -0.3125);
    bool _231 = _225 > 0.999000012874603271484375;
    float _233 = fma(_202, 6.103515625e-05, -0.3125);
    float _235 = fma(_227, 6.103515625e-05, -0.3125);
    float _237 = fma(_233, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _239 = fma(_229, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _241 = fma(_235, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _243 = !_231;
    float _245 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _247 = _235;
    float _249 = _233;
    float _251 = _241;
    float _261;
    float _263;
    float _265;
    if (!_243)
    {
        float3 _1960 = float3(_241, _237, _239);
        float3 _253 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1960, float3(0.0), isnan(_1960))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1960, float3(0.0), isnan(_1960))).xyz;
        float _255 = _253.x;
        float _257 = _253.y;
        float _259 = _253.z;
        _261 = _255;
        _263 = _257;
        _265 = _259;
        _267 = true;
    }
    else
    {
        float3 _1982 = float3(_241, _237, _239);
        float3 _269 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1982, float3(0.0), isnan(_1982))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1982, float3(0.0), isnan(_1982))).xyz;
        float _271 = _269.x;
        float _273 = _269.y;
        float _275 = _269.z;
        float3 _1997 = float3(_241, _237, _239);
        float3 _277 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1997, float3(0.0), isnan(_1997))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1997, float3(0.0), isnan(_1997))).xyz;
        float _279 = _277.x;
        float _281 = _277.y;
        float _283 = _277.z;
        bool _285 = _225 >= 0.001000000047497451305389404296875;
        bool _287 = isnan(_225);
        bool _289 = _285 || _287;
        bool _291 = isnan(0.001000000047497451305389404296875);
        bool _293 = _289 || _291;
        _261 = _271;
        _263 = _273;
        _245 = _275;
        _247 = _283;
        if (!_293)
        {
            _265 = _275;
            _267 = true;
        }
        else
        {
            float3 _2033 = float3(_241, _237, _239);
            float3 _295 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2033, float3(0.0), isnan(_2033))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2033, float3(0.0), isnan(_2033))).xyz;
            float _297 = _295.x;
            float _299 = _295.y;
            float _301 = _295.z;
            float _303 = -_279;
            float _305 = _297 + _303;
            float _307 = -_281;
            float _309 = _299 + _307;
            float _311 = -_283;
            float _313 = _301 + _311;
            float _315 = fma(_225, _305, _279);
            float _317 = fma(_225, _309, _281);
            float _319 = fma(_225, _313, _283);
            _261 = _315;
            _263 = _317;
            _265 = _319;
            _245 = _309;
            _249 = _313;
        }
    }
    _267 = false;
    float _321 = _261;
    float _323 = _263;
    float _325 = _265;
    float _327 = _245;
    float _329 = _247;
    float _331 = _249;
    bool _333 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _335 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _337 = _333 || _335;
    bool _339 = isnan(6.0);
    bool _341 = _337 || _339;
    float _343 = _329;
    float _345 = _331;
    float _347 = _327;
    float _349 = _329;
    float _351 = _331;
    float _353 = _321;
    float _355 = _323;
    float _357 = _325;
    float _443;
    float _445;
    float _447;
    if (!_341)
    {
        float _359 = -_321;
        float _361 = _359 + 1.0;
        float _363 = -_323;
        float _365 = _363 + 1.0;
        float _367 = -_325;
        float _369 = _367 + 1.0;
        float _371 = abs(_361);
        float _373 = log2(_371);
        float _375 = abs(_365);
        float _377 = log2(_375);
        float _379 = abs(_369);
        float _381 = log2(_379);
        float _383 = _373 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _385 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _387 = _377 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _389 = exp2(_383);
        float _391 = _381 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _393 = exp2(_387);
        float _395 = exp2(_391);
        float _397 = fma(_385, _389, 1.0);
        float _399 = fma(_385, _393, 1.0);
        float _401 = 1.0 / _397;
        float _403 = fma(_385, _395, 1.0);
        float _405 = 1.0 / _399;
        float _407 = 1.0 / _403;
        float _409 = _401 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _411 = _405 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _413 = precise::max(_409, _411);
        float _415 = _407 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _417 = precise::max(_415, _413);
        float _419 = -_409;
        float _421 = _419 + _417;
        float _423 = -_411;
        float _425 = _423 + _417;
        float _427 = -_415;
        float _429 = _427 + _417;
        float _431 = fma(_421, (*spvDescriptorSet0.fp_c3)._m0[6].w, _409);
        float _433 = fma(_425, (*spvDescriptorSet0.fp_c3)._m0[6].w, _411);
        float _435 = fma(_429, (*spvDescriptorSet0.fp_c3)._m0[6].w, _415);
        float _437 = _431 * _321;
        float _439 = _433 * _323;
        float _441 = _435 * _325;
        _443 = _437;
        _445 = _439;
        _447 = _441;
        _449 = true;
    }
    else
    {
        bool _451 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_451)
        {
            _251 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _453 = _251;
        bool _455 = !_451;
        float _457 = _453;
        float _487;
        float _489;
        float _497;
        if (!_455)
        {
            float _459 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _461 = _72 + _459;
            float _463 = abs(_461);
            float _465 = _463 * 2560.0;
            bool _467 = _465 >= 2.0;
            bool _469 = isnan(_465);
            bool _471 = _467 || _469;
            bool _473 = isnan(2.0);
            bool _475 = _471 || _473;
            float _477 = _465;
            if (!_475)
            {
                _477 = 0.0;
                _343 = 0.0;
            }
            float _479 = _477;
            float _481 = _343;
            float _483 = _479;
            float _485 = _481;
            _487 = _479;
            _489 = _481;
            if (!_475)
            {
                _345 = 0.0;
            }
            float _491 = _345;
            bool _493 = !_475;
            float _495 = _491;
            _497 = _491;
            _499 = _493;
            if (!_499)
            {
                bool _501 = _72 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_501)
                {
                    _483 = _321;
                }
                float _503 = _483;
                _347 = _503;
                _487 = _503;
                if (_501)
                {
                    _485 = _323;
                }
                float _505 = _485;
                _349 = _505;
                _489 = _505;
                if (_501)
                {
                    _495 = _325;
                }
                float _507 = _495;
                _351 = _507;
                _497 = _507;
                _499 = _501;
                if (!_499)
                {
                    float _509 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _457 = _509;
                }
            }
        }
        if (!_499)
        {
            float _511 = _457;
            float _513 = _347;
            float _515 = _349;
            float _517 = _351;
            bool _519 = _511 != 0.0;
            bool _521 = isnan(_511);
            bool _523 = _519 || _521;
            bool _525 = isnan(0.0);
            bool _527 = _523 || _525;
            float _529 = _513;
            float _531 = _513;
            float _533 = _515;
            float _535 = _517;
            if (!_527)
            {
                float _537 = _323 * 0.586600005626678466796875;
                float _539 = fma(_321, 0.29890000820159912109375, _537);
                float _541 = fma(_325, 0.1143999993801116943359375, _539);
                float _543 = _541 * (-1.44269502162933349609375);
                float _545 = exp2(_543);
                float _547 = -_545;
                float _549 = _547 + 1.0;
                bool _551 = _549 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _553 = isnan(_549);
                bool _555 = _551 || _553;
                bool _557 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _559 = _555 || _557;
                float _561 = _539;
                if (!_559)
                {
                    _561 = _549;
                }
                float _563 = _561;
                bool _565 = !_559;
                float _567 = _563;
                if (!_565)
                {
                    float _569 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _571 = _549 + _569;
                    float _573 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _575 = spvFAdd(_573, 1.00000095367431640625);
                    float _577 = 1.0 / _575;
                    float _579 = _571 * _577;
                    float _581 = -_579;
                    float _583 = _581 + 1.0;
                    float _585 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _587 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _585;
                    float _589 = abs(_583);
                    float _591 = log2(_589);
                    float _593 = _587 * _577;
                    float _595 = _593 + (-1.0);
                    float _597 = _593 * _579;
                    float _599 = _591 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _601 = exp2(_599);
                    float _603 = fma(_595, _601, 1.0);
                    float _605 = 1.0 / _603;
                    float _607 = _597 * _605;
                    float _609 = fma(_575, _607, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _567 = _609;
                }
                float _611 = _567;
                float _613 = -_549;
                float _615 = _613 + _611;
                float _617 = spvFAdd(_541, 9.9999999747524270787835121154785e-07);
                float _619 = _615 + 1.0;
                float _621 = 1.0 / _617;
                float _623 = abs(_619);
                float _625 = log2(_623);
                float _627 = fma(_621, _321, -1.0);
                float _629 = fma(_621, _323, -1.0);
                float _631 = fma(_621, _325, -1.0);
                float _633 = _625 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _635 = exp2(_633);
                float _637 = fma(_635, _627, 1.0);
                float _639 = fma(_635, _629, 1.0);
                float _641 = fma(_635, _631, 1.0);
                float _643 = _637 * _611;
                float _645 = _639 * _611;
                float _647 = _641 * _611;
                float _649 = precise::max(0.0, _643);
                float _651 = precise::max(0.0, _645);
                float _653 = precise::max(0.0, _647);
                float _655 = precise::min(_649, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _657 = precise::min(_651, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _659 = precise::min(_653, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _487 = _655;
                _489 = _657;
                _497 = _659;
                _499 = true;
            }
            else
            {
                bool _661 = _511 != 1.0;
                bool _663 = isnan(_511);
                bool _665 = _661 || _663;
                bool _667 = isnan(1.0);
                bool _669 = _665 || _667;
                if (!_669)
                {
                    bool _671 = _321 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _673 = isnan(_321);
                    bool _675 = _671 || _673;
                    bool _677 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _679 = _675 || _677;
                    float _681 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _683 = spvFAdd(_681, 1.00000095367431640625);
                    bool _685 = _323 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _687 = isnan(_323);
                    bool _689 = _685 || _687;
                    bool _691 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _693 = _689 || _691;
                    bool _695 = _325 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _697 = isnan(_325);
                    bool _699 = _695 || _697;
                    bool _701 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _703 = _699 || _701;
                    float _705 = 1.0 / _683;
                    float _707 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _709 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _707;
                    float _711 = _709 * _705;
                    bool _713 = !_679;
                    if (!_713)
                    {
                        float _715 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _717 = _321 + _715;
                        float _719 = _711 + (-1.0);
                        float _721 = _717 * _705;
                        float _723 = -_721;
                        float _725 = _723 + 1.0;
                        float _727 = _711 * _721;
                        float _729 = abs(_725);
                        float _731 = log2(_729);
                        float _733 = _731 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _735 = exp2(_733);
                        float _737 = fma(_719, _735, 1.0);
                        float _739 = 1.0 / _737;
                        float _741 = _727 * _739;
                        float _743 = fma(_683, _741, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _353 = _743;
                    }
                    float _745 = _353;
                    bool _747 = !_693;
                    if (!_747)
                    {
                        float _749 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _751 = _323 + _749;
                        float _753 = _711 + (-1.0);
                        float _755 = _751 * _705;
                        float _757 = -_755;
                        float _759 = _757 + 1.0;
                        float _761 = _711 * _755;
                        float _763 = abs(_759);
                        float _765 = log2(_763);
                        float _767 = _765 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _769 = exp2(_767);
                        float _771 = fma(_753, _769, 1.0);
                        float _773 = 1.0 / _771;
                        float _775 = _761 * _773;
                        float _777 = fma(_683, _775, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _355 = _777;
                    }
                    float _779 = _355;
                    bool _781 = !_703;
                    if (!_781)
                    {
                        float _783 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _785 = _325 + _783;
                        float _787 = _711 + (-1.0);
                        float _789 = _785 * _705;
                        float _791 = -_789;
                        float _793 = _791 + 1.0;
                        float _795 = _711 * _789;
                        float _797 = abs(_793);
                        float _799 = log2(_797);
                        float _801 = _799 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _803 = exp2(_801);
                        float _805 = fma(_787, _803, 1.0);
                        float _807 = 1.0 / _805;
                        float _809 = _795 * _807;
                        float _811 = fma(_683, _809, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _357 = _811;
                    }
                    float _813 = _357;
                    float _815 = precise::max(0.0, _813);
                    float _817 = precise::max(0.0, _745);
                    float _819 = precise::max(0.0, _779);
                    float _821 = precise::min(_815, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _823 = precise::min(_817, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _825 = precise::min(_819, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _487 = _823;
                    _489 = _825;
                    _497 = _821;
                    _499 = true;
                }
                else
                {
                    bool _827 = _511 != 2.0;
                    bool _829 = isnan(_511);
                    bool _831 = _827 || _829;
                    bool _833 = isnan(2.0);
                    bool _835 = _831 || _833;
                    if (!_835)
                    {
                        float _837 = _323 * 0.715200006961822509765625;
                        float _839 = fma(_321, 0.2125999927520751953125, _837);
                        float _841 = fma(_325, 0.072200000286102294921875, _839);
                        float _843 = spvFAdd(_841, 9.9999999747524270787835121154785e-07);
                        bool _845 = _841 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _847 = isnan(_841);
                        bool _849 = _845 || _847;
                        bool _851 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _853 = _849 || _851;
                        float _855 = 1.0 / _843;
                        bool _857 = !_853;
                        float _859 = _841;
                        if (!_857)
                        {
                            float _861 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _863 = _841 + _861;
                            float _865 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _867 = spvFAdd(_865, 1.00000095367431640625);
                            float _869 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _871 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _869;
                            float _873 = 1.0 / _867;
                            float _875 = _863 * _873;
                            float _877 = _871 * _873;
                            float _879 = -_875;
                            float _881 = _879 + 1.0;
                            float _883 = _877 + (-1.0);
                            float _885 = _877 * _875;
                            float _887 = abs(_881);
                            float _889 = log2(_887);
                            float _891 = _889 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _893 = exp2(_891);
                            float _895 = fma(_883, _893, 1.0);
                            float _897 = 1.0 / _895;
                            float _899 = _885 * _897;
                            float _901 = fma(_867, _899, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _859 = _901;
                        }
                        float _903 = _859;
                        float _905 = precise::max(0.0, _903);
                        float _907 = precise::min(_905, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _909 = _907 * _855;
                        float _911 = _321 * _909;
                        float _913 = _323 * _909;
                        float _915 = _325 * _909;
                        float _917 = precise::max(0.0, _911);
                        float _919 = precise::max(0.0, _913);
                        float _921 = precise::max(0.0, _915);
                        float _923 = precise::min(_917, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _925 = precise::min(_919, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _927 = precise::min(_921, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _487 = _923;
                        _489 = _925;
                        _497 = _927;
                        _499 = true;
                    }
                    else
                    {
                        bool _929 = _511 != 3.0;
                        bool _931 = isnan(_511);
                        bool _933 = _929 || _931;
                        bool _935 = isnan(3.0);
                        bool _937 = _933 || _935;
                        if (!_937)
                        {
                            float _939 = -_321;
                            float _941 = _939 + 1.0;
                            float _943 = -_323;
                            float _945 = _943 + 1.0;
                            float _947 = -_325;
                            float _949 = _947 + 1.0;
                            float _951 = abs(_941);
                            float _953 = log2(_951);
                            float _955 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _957 = abs(_945);
                            float _959 = log2(_957);
                            float _961 = abs(_949);
                            float _963 = log2(_961);
                            float _965 = _953 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _967 = _959 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _969 = exp2(_965);
                            float _971 = _963 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _973 = exp2(_967);
                            float _975 = exp2(_971);
                            float _977 = fma(_955, _969, 1.0);
                            float _979 = fma(_955, _973, 1.0);
                            float _981 = 1.0 / _977;
                            float _983 = fma(_955, _975, 1.0);
                            float _985 = 1.0 / _979;
                            float _987 = 1.0 / _983;
                            float _989 = _981 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _991 = _981 + _985;
                            float _993 = _985 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _995 = _987 + _991;
                            float _997 = _987 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _999 = precise::max(_989, _993);
                            float _1001 = _995 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1003 = precise::max(_997, _999);
                            float _1005 = _1001 * 0.3333333432674407958984375;
                            float _1007 = -_1005;
                            float _1009 = _1003 + _1007;
                            float _1011 = fma(_1009, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1005);
                            float _1013 = -_989;
                            float _1015 = _1013 + _1011;
                            float _1017 = -_993;
                            float _1019 = _1017 + _1011;
                            float _1021 = -_997;
                            float _1023 = _1021 + _1011;
                            float _1025 = fma(_1015, (*spvDescriptorSet0.fp_c3)._m0[6].w, _989);
                            float _1027 = fma(_1019, (*spvDescriptorSet0.fp_c3)._m0[6].w, _993);
                            float _1029 = fma(_1023, (*spvDescriptorSet0.fp_c3)._m0[6].w, _997);
                            float _1031 = _1025 * _321;
                            float _1033 = _1027 * _323;
                            float _1035 = _1029 * _325;
                            _487 = _1031;
                            _489 = _1033;
                            _497 = _1035;
                            _499 = true;
                        }
                        else
                        {
                            bool _1037 = _511 != 4.0;
                            bool _1039 = isnan(_511);
                            bool _1041 = _1037 || _1039;
                            bool _1043 = isnan(4.0);
                            bool _1045 = _1041 || _1043;
                            if (!_1045)
                            {
                                bool _1047 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1049 = isnan(0.0);
                                bool _1051 = _1047 || _1049;
                                bool _1053 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1055 = _1051 || _1053;
                                float _1077;
                                float _1079;
                                if (!_1055)
                                {
                                    float _1057 = -_321;
                                    float _1059 = _1057 + 1.0;
                                    float _1061 = abs(_1059);
                                    float _1063 = log2(_1061);
                                    float _1065 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1067 = _1063 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1069 = exp2(_1067);
                                    float _1071 = fma(_1065, _1069, 1.0);
                                    float _1073 = 1.0 / _1071;
                                    float _1075 = _1073 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1077 = _1063;
                                    _1079 = _1075;
                                    _1081 = true;
                                }
                                else
                                {
                                    float _1083 = spvFAdd(_321, 9.9999999747524270787835121154785e-07);
                                    bool _1085 = _321 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1087 = isnan(_321);
                                    bool _1089 = _1085 || _1087;
                                    bool _1091 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1093 = _1089 || _1091;
                                    float _1095 = 1.0 / _1083;
                                    if (!_1093)
                                    {
                                        _529 = _321;
                                    }
                                    float _1097 = _529;
                                    bool _1099 = !_1093;
                                    float _1101 = _1097;
                                    _1077 = _1095;
                                    if (!_1099)
                                    {
                                        float _1103 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1105 = _321 + _1103;
                                        float _1107 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1109 = spvFAdd(_1107, 1.00000095367431640625);
                                        float _1111 = 1.0 / _1109;
                                        float _1113 = _1105 * _1111;
                                        float _1115 = -_1113;
                                        float _1117 = _1115 + 1.0;
                                        float _1119 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1121 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1119;
                                        float _1123 = abs(_1117);
                                        float _1125 = log2(_1123);
                                        float _1127 = _1121 * _1111;
                                        float _1129 = _1127 + (-1.0);
                                        float _1131 = _1127 * _1113;
                                        float _1133 = _1125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1135 = exp2(_1133);
                                        float _1137 = fma(_1129, _1135, 1.0);
                                        float _1139 = 1.0 / _1137;
                                        float _1141 = _1131 * _1139;
                                        float _1143 = fma(_1109, _1141, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1101 = _1143;
                                    }
                                    float _1145 = _1101;
                                    float _1147 = precise::max(0.0, _1145);
                                    float _1149 = precise::min(_1147, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1151 = _1149 * _1095;
                                    _1079 = _1151;
                                }
                                _1081 = false;
                                float _1153 = _1077;
                                float _1155 = _1079;
                                float _1157 = _1153;
                                float _1179;
                                float _1181;
                                if (!_1055)
                                {
                                    float _1159 = -_323;
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
                                    float _1185 = spvFAdd(_323, 9.9999999747524270787835121154785e-07);
                                    bool _1187 = _323 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1189 = isnan(_323);
                                    bool _1191 = _1187 || _1189;
                                    bool _1193 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1195 = _1191 || _1193;
                                    float _1197 = 1.0 / _1185;
                                    if (!_1195)
                                    {
                                        _1157 = _323;
                                    }
                                    float _1199 = _1157;
                                    bool _1201 = !_1195;
                                    float _1203 = _1199;
                                    _1179 = _1197;
                                    if (!_1201)
                                    {
                                        float _1205 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1207 = _323 + _1205;
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
                                if (!_1055)
                                {
                                    float _1261 = -_325;
                                    float _1263 = _1261 + 1.0;
                                    float _1265 = abs(_1263);
                                    float _1267 = log2(_1265);
                                    float _1269 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1271 = _1267 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1273 = exp2(_1271);
                                    float _1275 = fma(_1269, _1273, 1.0);
                                    float _1277 = 1.0 / _1275;
                                    float _1279 = _1277 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1281 = _1279;
                                    _1283 = true;
                                }
                                else
                                {
                                    float _1285 = spvFAdd(_325, 9.9999999747524270787835121154785e-07);
                                    bool _1287 = _325 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1289 = isnan(_325);
                                    bool _1291 = _1287 || _1289;
                                    bool _1293 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1295 = _1291 || _1293;
                                    float _1297 = 1.0 / _1285;
                                    if (!_1295)
                                    {
                                        _1259 = _325;
                                    }
                                    float _1299 = _1259;
                                    bool _1301 = !_1295;
                                    float _1303 = _1299;
                                    if (!_1301)
                                    {
                                        float _1305 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1307 = _325 + _1305;
                                        float _1309 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1311 = spvFAdd(_1309, 1.00000095367431640625);
                                        float _1313 = 1.0 / _1311;
                                        float _1315 = _1307 * _1313;
                                        float _1317 = -_1315;
                                        float _1319 = _1317 + 1.0;
                                        float _1321 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1323 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1321;
                                        float _1325 = abs(_1319);
                                        float _1327 = log2(_1325);
                                        float _1329 = _1323 * _1313;
                                        float _1331 = _1329 + (-1.0);
                                        float _1333 = _1329 * _1315;
                                        float _1335 = _1327 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1337 = exp2(_1335);
                                        float _1339 = fma(_1331, _1337, 1.0);
                                        float _1341 = 1.0 / _1339;
                                        float _1343 = _1333 * _1341;
                                        float _1345 = fma(_1311, _1343, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1303 = _1345;
                                    }
                                    float _1347 = _1303;
                                    float _1349 = precise::max(0.0, _1347);
                                    float _1351 = precise::min(_1349, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1353 = _1351 * _1297;
                                    _1281 = _1353;
                                }
                                _1283 = false;
                                float _1355 = _1281;
                                float _1357 = precise::max(_1155, _1257);
                                float _1359 = precise::max(_1357, _1355);
                                float _1361 = -_1155;
                                float _1363 = _1359 + _1361;
                                float _1365 = -_1257;
                                float _1367 = _1359 + _1365;
                                float _1369 = -_1355;
                                float _1371 = _1359 + _1369;
                                float _1373 = fma(_1363, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1155);
                                float _1375 = fma(_1367, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1257);
                                float _1377 = fma(_1371, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1355);
                                float _1379 = _1373 * _321;
                                float _1381 = _1375 * _323;
                                float _1383 = _1377 * _325;
                                _487 = _1379;
                                _489 = _1381;
                                _497 = _1383;
                                _499 = true;
                            }
                            else
                            {
                                bool _1385 = _511 != 5.0;
                                bool _1387 = isnan(_511);
                                bool _1389 = _1385 || _1387;
                                bool _1391 = isnan(5.0);
                                bool _1393 = _1389 || _1391;
                                if (!_1393)
                                {
                                    _531 = _321;
                                }
                                float _1395 = _531;
                                float _1397 = _1395;
                                _487 = _1395;
                                if (!_1393)
                                {
                                    _533 = _323;
                                }
                                float _1399 = _533;
                                float _1401 = _1399;
                                _489 = _1399;
                                if (!_1393)
                                {
                                    _535 = _325;
                                }
                                float _1403 = _535;
                                bool _1405 = !_1393;
                                float _1407 = _1403;
                                _497 = _1403;
                                if (!_1405)
                                {
                                    bool _1409 = _511 != 6.0;
                                    bool _1411 = isnan(_511);
                                    bool _1413 = _1409 || _1411;
                                    bool _1415 = isnan(6.0);
                                    bool _1417 = _1413 || _1415;
                                    if (!_1417)
                                    {
                                        float _1419 = -_321;
                                        float _1421 = _1419 + 1.0;
                                        float _1423 = -_323;
                                        float _1425 = _1423 + 1.0;
                                        float _1427 = -_325;
                                        float _1429 = _1427 + 1.0;
                                        float _1431 = abs(_1421);
                                        float _1433 = log2(_1431);
                                        float _1435 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1437 = abs(_1425);
                                        float _1439 = log2(_1437);
                                        float _1441 = abs(_1429);
                                        float _1443 = log2(_1441);
                                        float _1445 = _1433 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1447 = _1439 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1449 = exp2(_1445);
                                        float _1451 = _1443 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1453 = exp2(_1447);
                                        float _1455 = exp2(_1451);
                                        float _1457 = fma(_1435, _1449, 1.0);
                                        float _1459 = fma(_1435, _1453, 1.0);
                                        float _1461 = 1.0 / _1457;
                                        float _1463 = fma(_1435, _1455, 1.0);
                                        float _1465 = 1.0 / _1459;
                                        float _1467 = 1.0 / _1463;
                                        float _1469 = _1461 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1471 = _1465 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1473 = precise::max(_1469, _1471);
                                        float _1475 = _1467 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1477 = precise::max(_1475, _1473);
                                        float _1479 = -_1469;
                                        float _1481 = _1479 + _1477;
                                        float _1483 = -_1471;
                                        float _1485 = _1483 + _1477;
                                        float _1487 = -_1475;
                                        float _1489 = _1487 + _1477;
                                        float _1491 = fma(_1481, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1469);
                                        float _1493 = fma(_1485, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1471);
                                        float _1495 = fma(_1489, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1475);
                                        float _1497 = _1491 * _321;
                                        float _1499 = _1493 * _323;
                                        float _1501 = _1495 * _325;
                                        _487 = _1497;
                                        _489 = _1499;
                                        _497 = _1501;
                                        _499 = true;
                                    }
                                    else
                                    {
                                        bool _1503 = _511 != 7.0;
                                        bool _1505 = isnan(_511);
                                        bool _1507 = _1503 || _1505;
                                        bool _1509 = isnan(7.0);
                                        bool _1511 = _1507 || _1509;
                                        if (_1511)
                                        {
                                            _1397 = 0.0;
                                            _1401 = 0.0;
                                        }
                                        float _1513 = _1397;
                                        float _1515 = _1401;
                                        _487 = _1513;
                                        _489 = _1515;
                                        if (_1511)
                                        {
                                            _1407 = 0.0;
                                        }
                                        float _1517 = _1407;
                                        _497 = _1517;
                                        if (!_1511)
                                        {
                                            float _1519 = -_321;
                                            float _1521 = _1519 + 1.0;
                                            float _1523 = -_323;
                                            float _1525 = _1523 + 1.0;
                                            float _1527 = -_325;
                                            float _1529 = _1527 + 1.0;
                                            float _1531 = abs(_1521);
                                            float _1533 = log2(_1531);
                                            float _1535 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1537 = abs(_1525);
                                            float _1539 = log2(_1537);
                                            float _1541 = abs(_1529);
                                            float _1543 = log2(_1541);
                                            float _1545 = _1533 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1547 = _1539 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1549 = exp2(_1545);
                                            float _1551 = _1543 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1553 = exp2(_1547);
                                            float _1555 = exp2(_1551);
                                            float _1557 = fma(_1535, _1549, 1.0);
                                            float _1559 = fma(_1535, _1553, 1.0);
                                            float _1561 = 1.0 / _1557;
                                            float _1563 = fma(_1535, _1555, 1.0);
                                            float _1565 = 1.0 / _1559;
                                            float _1567 = 1.0 / _1563;
                                            float _1569 = _1561 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1571 = -_321;
                                            float _1573 = fma(_1569, _321, _1571);
                                            float _1575 = _1565 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1577 = -_323;
                                            float _1579 = fma(_1575, _323, _1577);
                                            float _1581 = _1567 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1583 = _1573 + _1579;
                                            float _1585 = -_325;
                                            float _1587 = fma(_1581, _325, _1585);
                                            float _1589 = _1587 + _1583;
                                            float _1591 = -_1573;
                                            float _1593 = fma(_1589, 0.3333333432674407958984375, _1591);
                                            float _1595 = -_1579;
                                            float _1597 = fma(_1589, 0.3333333432674407958984375, _1595);
                                            float _1599 = -_1587;
                                            float _1601 = fma(_1589, 0.3333333432674407958984375, _1599);
                                            float _1603 = fma(_1593, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1573);
                                            float _1605 = fma(_1597, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1579);
                                            float _1607 = fma(_1601, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1587);
                                            float _1609 = _1603 + _321;
                                            float _1611 = _1605 + _323;
                                            float _1613 = _1607 + _325;
                                            _487 = _1609;
                                            _489 = _1611;
                                            _497 = _1613;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _499 = false;
        float _1615 = _487;
        float _1617 = _489;
        float _1619 = _497;
        _443 = _1615;
        _445 = _1617;
        _447 = _1619;
    }
    _449 = false;
    float _1621 = _443;
    float _1623 = _445;
    float _1625 = _447;
    float _1627 = _1621 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1629 = _1623 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1631 = _1625 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_47.x = _1627;
    out.m_47.y = _1629;
    out.m_47.z = _1631;
    out.m_47.w = _87;
    return out;
}

