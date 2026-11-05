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
    bool _503 = false;
    bool _553 = false;
    bool _1343 = false;
    bool _1243 = false;
    bool _1141 = false;
    bool _261 = false;
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
    float2 _1732 = float2(_72, _70);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1732, float2(0.0), isnan(_1732))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1732, float2(0.0), isnan(_1732))).x;
    float2 _1743 = float2(_72, _70);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1743, float2(0.0), isnan(_1743))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1743, float2(0.0), isnan(_1743))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = _72 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float2 _1763 = float2(_89, _74);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1763, float2(0.0), isnan(_1763))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1763, float2(0.0), isnan(_1763))).xyz;
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
    uint _198 = extract_bits(_196, 16u, 16u);
    float _200 = float(_198);
    float _202 = _181 + (-0.5);
    int _205 = int(_196) & 32767;
    float _207 = fma(_202, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
    uint _209 = as_type<uint>(half2(float2(_193, 0.0)));
    float _211 = float(uint(_205));
    float _213 = precise::max(_207, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    uint _215 = extract_bits(_209, 0u, 8u);
    int _217 = int(_215) & 255;
    uint _219 = extract_bits(_209, 8u, 8u);
    int _221 = int(_219) & 255;
    int _223 = _221 << 8;
    int _225 = _217 | _223;
    float _227 = fma(_211, 6.103515625e-05, -0.3125);
    bool _229 = _213 > 0.999000012874603271484375;
    float _231 = float(uint(_225));
    float _233 = fma(_200, 6.103515625e-05, -0.3125);
    float _235 = fma(_231, 6.103515625e-05, -0.3125);
    float _237 = fma(_233, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _239 = fma(_227, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _241 = fma(_235, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _243 = !_229;
    float _245 = _181;
    float _255;
    float _257;
    float _259;
    if (!_243)
    {
        float3 _2016 = float3(_239, _237, _241);
        float3 _247 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2016, float3(0.0), isnan(_2016))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2016, float3(0.0), isnan(_2016))).xyz;
        float _249 = _247.x;
        float _251 = _247.y;
        float _253 = _247.z;
        _255 = _249;
        _257 = _251;
        _259 = _253;
        _261 = true;
    }
    else
    {
        float3 _2038 = float3(_239, _237, _241);
        float3 _263 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2038, float3(0.0), isnan(_2038))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2038, float3(0.0), isnan(_2038))).xyz;
        float _265 = _263.x;
        float _267 = _263.y;
        float _269 = _263.z;
        float3 _2053 = float3(_239, _237, _241);
        float3 _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2053, float3(0.0), isnan(_2053))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2053, float3(0.0), isnan(_2053))).xyz;
        float _273 = _271.x;
        float _275 = _271.y;
        float _277 = _271.z;
        bool _279 = _213 >= 0.001000000047497451305389404296875;
        bool _281 = isnan(_213);
        bool _283 = _279 || _281;
        bool _285 = isnan(0.001000000047497451305389404296875);
        bool _287 = _283 || _285;
        _255 = _265;
        _257 = _267;
        if (!_287)
        {
            _259 = _269;
            _261 = true;
        }
        else
        {
            float3 _2087 = float3(_239, _237, _241);
            float3 _289 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2087, float3(0.0), isnan(_2087))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2087, float3(0.0), isnan(_2087))).xyz;
            float _291 = _289.x;
            float _293 = _289.y;
            float _295 = _289.z;
            float _297 = -_273;
            float _299 = _291 + _297;
            float _301 = -_275;
            float _303 = _293 + _301;
            float _305 = -_277;
            float _307 = _295 + _305;
            float _309 = fma(_213, _299, _273);
            float _311 = fma(_213, _303, _275);
            float _313 = fma(_213, _307, _277);
            _255 = _309;
            _257 = _311;
            _259 = _313;
        }
    }
    _261 = false;
    float _315 = _255;
    float _317 = _257;
    float _319 = _259;
    bool _321 = _315 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _323 = isnan(_315);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _329 = _325 || _327;
    float _331 = fma(_315, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _333 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _335 = fma(_319, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _337 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _339 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _341 = _337 || _339;
    bool _343 = isnan(6.0);
    bool _345 = _341 || _343;
    bool _347 = _317 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _349 = isnan(_317);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _355 = _351 || _353;
    float _357 = exp2(_331);
    bool _359 = _319 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _361 = isnan(_319);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _367 = _363 || _365;
    float _369 = exp2(_333);
    float _371 = exp2(_335);
    float _373 = -_357;
    float _375 = _373 + 1.0;
    bool _377 = !_329;
    float _379 = _377 ? _315 : _375;
    float _381 = -_369;
    float _383 = _381 + 1.0;
    bool _385 = !_355;
    float _387 = _385 ? _317 : _383;
    float _389 = -_371;
    float _391 = _389 + 1.0;
    bool _393 = !_367;
    float _395 = _393 ? _319 : _391;
    float _397 = _369;
    float _399 = _371;
    float _401 = _391;
    float _403 = _369;
    float _405 = _371;
    float _407 = _379;
    float _409 = _387;
    float _411 = _395;
    float _497;
    float _499;
    float _501;
    if (!_345)
    {
        float _413 = -_379;
        float _415 = _413 + 1.0;
        float _417 = -_387;
        float _419 = _417 + 1.0;
        float _421 = -_395;
        float _423 = _421 + 1.0;
        float _425 = abs(_415);
        float _427 = log2(_425);
        float _429 = abs(_419);
        float _431 = log2(_429);
        float _433 = abs(_423);
        float _435 = log2(_433);
        float _437 = _427 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _439 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _441 = _431 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _443 = exp2(_437);
        float _445 = _435 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _447 = exp2(_441);
        float _449 = exp2(_445);
        float _451 = fma(_439, _443, 1.0);
        float _453 = fma(_439, _447, 1.0);
        float _455 = 1.0 / _451;
        float _457 = fma(_439, _449, 1.0);
        float _459 = 1.0 / _453;
        float _461 = 1.0 / _457;
        float _463 = _455 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _465 = _459 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _467 = precise::max(_463, _465);
        float _469 = _461 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _471 = precise::max(_469, _467);
        float _473 = -_463;
        float _475 = _473 + _471;
        float _477 = -_465;
        float _479 = _477 + _471;
        float _481 = -_469;
        float _483 = _481 + _471;
        float _485 = fma(_475, (*spvDescriptorSet0.fp_c3)._m0[6].w, _463);
        float _487 = fma(_479, (*spvDescriptorSet0.fp_c3)._m0[6].w, _465);
        float _489 = fma(_483, (*spvDescriptorSet0.fp_c3)._m0[6].w, _469);
        float _491 = _379 * _485;
        float _493 = _387 * _487;
        float _495 = _395 * _489;
        _497 = _491;
        _499 = _493;
        _501 = _495;
        _503 = true;
    }
    else
    {
        bool _505 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_505)
        {
            _245 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _507 = _245;
        bool _509 = !_505;
        float _511 = _507;
        float _541;
        float _543;
        float _551;
        if (!_509)
        {
            float _513 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _515 = _72 + _513;
            float _517 = abs(_515);
            float _519 = _517 * 2560.0;
            bool _521 = _519 >= 2.0;
            bool _523 = isnan(_519);
            bool _525 = _521 || _523;
            bool _527 = isnan(2.0);
            bool _529 = _525 || _527;
            float _531 = _519;
            if (!_529)
            {
                _531 = 0.0;
                _397 = 0.0;
            }
            float _533 = _531;
            float _535 = _397;
            float _537 = _533;
            float _539 = _535;
            _541 = _533;
            _543 = _535;
            if (!_529)
            {
                _399 = 0.0;
            }
            float _545 = _399;
            bool _547 = !_529;
            float _549 = _545;
            _551 = _545;
            _553 = _547;
            if (!_553)
            {
                bool _555 = _72 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_555)
                {
                    _537 = _379;
                }
                float _557 = _537;
                _401 = _557;
                _541 = _557;
                if (_555)
                {
                    _539 = _387;
                }
                float _559 = _539;
                _403 = _559;
                _543 = _559;
                if (_555)
                {
                    _549 = _395;
                }
                float _561 = _549;
                _405 = _561;
                _551 = _561;
                _553 = _555;
                if (!_553)
                {
                    float _563 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _511 = _563;
                }
            }
        }
        if (!_553)
        {
            float _565 = _511;
            float _567 = _401;
            float _569 = _403;
            float _571 = _405;
            bool _573 = _565 != 0.0;
            bool _575 = isnan(_565);
            bool _577 = _573 || _575;
            bool _579 = isnan(0.0);
            bool _581 = _577 || _579;
            float _583 = _567;
            float _585 = _567;
            float _587 = _567;
            float _589 = _569;
            float _591 = _571;
            if (!_581)
            {
                float _593 = _317 * 0.586600005626678466796875;
                float _595 = fma(_315, 0.29890000820159912109375, _593);
                float _597 = fma(_319, 0.1143999993801116943359375, _595);
                float _599 = _597 * (-1.44269502162933349609375);
                float _601 = exp2(_599);
                float _603 = -_601;
                float _605 = _603 + 1.0;
                bool _607 = _605 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _609 = isnan(_605);
                bool _611 = _607 || _609;
                bool _613 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _615 = _611 || _613;
                if (!_615)
                {
                    _583 = _605;
                }
                float _617 = _583;
                bool _619 = !_615;
                float _621 = _617;
                if (!_619)
                {
                    float _623 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _625 = _605 + _623;
                    float _627 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _629 = spvFAdd(_627, 1.00000095367431640625);
                    float _631 = 1.0 / _629;
                    float _633 = _625 * _631;
                    float _635 = -_633;
                    float _637 = _635 + 1.0;
                    float _639 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _641 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _639;
                    float _643 = abs(_637);
                    float _645 = log2(_643);
                    float _647 = _641 * _631;
                    float _649 = _647 + (-1.0);
                    float _651 = _647 * _633;
                    float _653 = _645 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _655 = exp2(_653);
                    float _657 = fma(_649, _655, 1.0);
                    float _659 = 1.0 / _657;
                    float _661 = _651 * _659;
                    float _663 = fma(_629, _661, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _621 = _663;
                }
                float _665 = _621;
                float _667 = -_605;
                float _669 = _667 + _665;
                float _671 = _387 * 0.586600005626678466796875;
                float _673 = _669 + 1.0;
                float _675 = fma(_379, 0.29890000820159912109375, _671);
                float _677 = fma(_395, 0.1143999993801116943359375, _675);
                float _679 = abs(_673);
                float _681 = log2(_679);
                float _683 = spvFAdd(_677, 9.9999999747524270787835121154785e-07);
                float _685 = 1.0 / _683;
                float _687 = _681 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _689 = exp2(_687);
                float _691 = fma(_379, _685, -1.0);
                float _693 = fma(_387, _685, -1.0);
                float _695 = fma(_395, _685, -1.0);
                float _697 = fma(_689, _691, 1.0);
                float _699 = fma(_689, _693, 1.0);
                float _701 = fma(_689, _695, 1.0);
                float _703 = _697 * _665;
                float _705 = _699 * _665;
                float _707 = _701 * _665;
                float _709 = precise::max(0.0, _703);
                float _711 = precise::max(0.0, _705);
                float _713 = precise::max(0.0, _707);
                float _715 = precise::min(_709, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _717 = precise::min(_711, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _719 = precise::min(_713, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _541 = _715;
                _543 = _717;
                _551 = _719;
                _553 = true;
            }
            else
            {
                bool _721 = _565 != 1.0;
                bool _723 = isnan(_565);
                bool _725 = _721 || _723;
                bool _727 = isnan(1.0);
                bool _729 = _725 || _727;
                if (!_729)
                {
                    bool _731 = _379 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _733 = isnan(_379);
                    bool _735 = _731 || _733;
                    bool _737 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _739 = _735 || _737;
                    float _741 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _743 = spvFAdd(_741, 1.00000095367431640625);
                    bool _745 = _387 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _747 = isnan(_387);
                    bool _749 = _745 || _747;
                    bool _751 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _753 = _749 || _751;
                    bool _755 = _395 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _757 = isnan(_395);
                    bool _759 = _755 || _757;
                    bool _761 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _763 = _759 || _761;
                    float _765 = 1.0 / _743;
                    float _767 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _769 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _767;
                    float _771 = _769 * _765;
                    bool _773 = !_739;
                    if (!_773)
                    {
                        float _775 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _777 = _379 + _775;
                        float _779 = _771 + (-1.0);
                        float _781 = _777 * _765;
                        float _783 = -_781;
                        float _785 = _783 + 1.0;
                        float _787 = _771 * _781;
                        float _789 = abs(_785);
                        float _791 = log2(_789);
                        float _793 = _791 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _795 = exp2(_793);
                        float _797 = fma(_779, _795, 1.0);
                        float _799 = 1.0 / _797;
                        float _801 = _787 * _799;
                        float _803 = fma(_743, _801, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _407 = _803;
                    }
                    float _805 = _407;
                    bool _807 = !_753;
                    if (!_807)
                    {
                        float _809 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _811 = _387 + _809;
                        float _813 = _771 + (-1.0);
                        float _815 = _811 * _765;
                        float _817 = -_815;
                        float _819 = _817 + 1.0;
                        float _821 = _771 * _815;
                        float _823 = abs(_819);
                        float _825 = log2(_823);
                        float _827 = _825 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _829 = exp2(_827);
                        float _831 = fma(_813, _829, 1.0);
                        float _833 = 1.0 / _831;
                        float _835 = _821 * _833;
                        float _837 = fma(_743, _835, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _409 = _837;
                    }
                    float _839 = _409;
                    bool _841 = !_763;
                    if (!_841)
                    {
                        float _843 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _845 = _395 + _843;
                        float _847 = _771 + (-1.0);
                        float _849 = _845 * _765;
                        float _851 = -_849;
                        float _853 = _851 + 1.0;
                        float _855 = _771 * _849;
                        float _857 = abs(_853);
                        float _859 = log2(_857);
                        float _861 = _859 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _863 = exp2(_861);
                        float _865 = fma(_847, _863, 1.0);
                        float _867 = 1.0 / _865;
                        float _869 = _855 * _867;
                        float _871 = fma(_743, _869, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _411 = _871;
                    }
                    float _873 = _411;
                    float _875 = precise::max(0.0, _873);
                    float _877 = precise::max(0.0, _805);
                    float _879 = precise::max(0.0, _839);
                    float _881 = precise::min(_875, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _883 = precise::min(_877, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _885 = precise::min(_879, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _541 = _883;
                    _543 = _885;
                    _551 = _881;
                    _553 = true;
                }
                else
                {
                    bool _887 = _565 != 2.0;
                    bool _889 = isnan(_565);
                    bool _891 = _887 || _889;
                    bool _893 = isnan(2.0);
                    bool _895 = _891 || _893;
                    if (!_895)
                    {
                        float _897 = _387 * 0.715200006961822509765625;
                        float _899 = fma(_379, 0.2125999927520751953125, _897);
                        float _901 = fma(_395, 0.072200000286102294921875, _899);
                        float _903 = spvFAdd(_901, 9.9999999747524270787835121154785e-07);
                        bool _905 = _901 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _907 = isnan(_901);
                        bool _909 = _905 || _907;
                        bool _911 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _913 = _909 || _911;
                        float _915 = 1.0 / _903;
                        bool _917 = !_913;
                        float _919 = _901;
                        if (!_917)
                        {
                            float _921 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _923 = _901 + _921;
                            float _925 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _927 = spvFAdd(_925, 1.00000095367431640625);
                            float _929 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _931 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _929;
                            float _933 = 1.0 / _927;
                            float _935 = _923 * _933;
                            float _937 = _931 * _933;
                            float _939 = -_935;
                            float _941 = _939 + 1.0;
                            float _943 = _937 + (-1.0);
                            float _945 = _937 * _935;
                            float _947 = abs(_941);
                            float _949 = log2(_947);
                            float _951 = _949 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _953 = exp2(_951);
                            float _955 = fma(_943, _953, 1.0);
                            float _957 = 1.0 / _955;
                            float _959 = _945 * _957;
                            float _961 = fma(_927, _959, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _919 = _961;
                        }
                        float _963 = _919;
                        float _965 = precise::max(0.0, _963);
                        float _967 = precise::min(_965, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _969 = _967 * _915;
                        float _971 = _379 * _969;
                        float _973 = _387 * _969;
                        float _975 = _395 * _969;
                        float _977 = precise::max(0.0, _971);
                        float _979 = precise::max(0.0, _973);
                        float _981 = precise::max(0.0, _975);
                        float _983 = precise::min(_977, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _985 = precise::min(_979, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _987 = precise::min(_981, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _541 = _983;
                        _543 = _985;
                        _551 = _987;
                        _553 = true;
                    }
                    else
                    {
                        bool _989 = _565 != 3.0;
                        bool _991 = isnan(_565);
                        bool _993 = _989 || _991;
                        bool _995 = isnan(3.0);
                        bool _997 = _993 || _995;
                        if (!_997)
                        {
                            float _999 = -_379;
                            float _1001 = _999 + 1.0;
                            float _1003 = -_387;
                            float _1005 = _1003 + 1.0;
                            float _1007 = -_395;
                            float _1009 = _1007 + 1.0;
                            float _1011 = abs(_1001);
                            float _1013 = log2(_1011);
                            float _1015 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _1017 = abs(_1005);
                            float _1019 = log2(_1017);
                            float _1021 = abs(_1009);
                            float _1023 = log2(_1021);
                            float _1025 = _1013 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1027 = _1019 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1029 = exp2(_1025);
                            float _1031 = _1023 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1033 = exp2(_1027);
                            float _1035 = exp2(_1031);
                            float _1037 = fma(_1015, _1029, 1.0);
                            float _1039 = fma(_1015, _1033, 1.0);
                            float _1041 = 1.0 / _1037;
                            float _1043 = fma(_1015, _1035, 1.0);
                            float _1045 = 1.0 / _1039;
                            float _1047 = 1.0 / _1043;
                            float _1049 = _1041 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1051 = _1041 + _1045;
                            float _1053 = _1045 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1055 = _1047 + _1051;
                            float _1057 = _1047 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1059 = precise::max(_1049, _1053);
                            float _1061 = _1055 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1063 = precise::max(_1057, _1059);
                            float _1065 = _1061 * 0.3333333432674407958984375;
                            float _1067 = -_1065;
                            float _1069 = _1063 + _1067;
                            float _1071 = fma(_1069, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1065);
                            float _1073 = -_1049;
                            float _1075 = _1073 + _1071;
                            float _1077 = -_1053;
                            float _1079 = _1077 + _1071;
                            float _1081 = -_1057;
                            float _1083 = _1081 + _1071;
                            float _1085 = fma(_1075, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1049);
                            float _1087 = fma(_1079, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1053);
                            float _1089 = fma(_1083, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1057);
                            float _1091 = _379 * _1085;
                            float _1093 = _387 * _1087;
                            float _1095 = _395 * _1089;
                            _541 = _1091;
                            _543 = _1093;
                            _551 = _1095;
                            _553 = true;
                        }
                        else
                        {
                            bool _1097 = _565 != 4.0;
                            bool _1099 = isnan(_565);
                            bool _1101 = _1097 || _1099;
                            bool _1103 = isnan(4.0);
                            bool _1105 = _1101 || _1103;
                            if (!_1105)
                            {
                                bool _1107 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1109 = isnan(0.0);
                                bool _1111 = _1107 || _1109;
                                bool _1113 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1115 = _1111 || _1113;
                                float _1137;
                                float _1139;
                                if (!_1115)
                                {
                                    float _1117 = -_379;
                                    float _1119 = _1117 + 1.0;
                                    float _1121 = abs(_1119);
                                    float _1123 = log2(_1121);
                                    float _1125 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1127 = _1123 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1129 = exp2(_1127);
                                    float _1131 = fma(_1125, _1129, 1.0);
                                    float _1133 = 1.0 / _1131;
                                    float _1135 = _1133 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1137 = _1123;
                                    _1139 = _1135;
                                    _1141 = true;
                                }
                                else
                                {
                                    float _1143 = spvFAdd(_379, 9.9999999747524270787835121154785e-07);
                                    bool _1145 = _379 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1147 = isnan(_379);
                                    bool _1149 = _1145 || _1147;
                                    bool _1151 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1153 = _1149 || _1151;
                                    float _1155 = 1.0 / _1143;
                                    if (!_1153)
                                    {
                                        _585 = _379;
                                    }
                                    float _1157 = _585;
                                    bool _1159 = !_1153;
                                    float _1161 = _1157;
                                    _1137 = _1155;
                                    if (!_1159)
                                    {
                                        float _1163 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1165 = _379 + _1163;
                                        float _1167 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1169 = spvFAdd(_1167, 1.00000095367431640625);
                                        float _1171 = 1.0 / _1169;
                                        float _1173 = _1165 * _1171;
                                        float _1175 = -_1173;
                                        float _1177 = _1175 + 1.0;
                                        float _1179 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1181 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1179;
                                        float _1183 = abs(_1177);
                                        float _1185 = log2(_1183);
                                        float _1187 = _1181 * _1171;
                                        float _1189 = _1187 + (-1.0);
                                        float _1191 = _1187 * _1173;
                                        float _1193 = _1185 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1195 = exp2(_1193);
                                        float _1197 = fma(_1189, _1195, 1.0);
                                        float _1199 = 1.0 / _1197;
                                        float _1201 = _1191 * _1199;
                                        float _1203 = fma(_1169, _1201, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1161 = _1203;
                                    }
                                    float _1205 = _1161;
                                    float _1207 = precise::max(0.0, _1205);
                                    float _1209 = precise::min(_1207, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1211 = _1209 * _1155;
                                    _1139 = _1211;
                                }
                                _1141 = false;
                                float _1213 = _1137;
                                float _1215 = _1139;
                                float _1217 = _1213;
                                float _1239;
                                float _1241;
                                if (!_1115)
                                {
                                    float _1219 = -_387;
                                    float _1221 = _1219 + 1.0;
                                    float _1223 = abs(_1221);
                                    float _1225 = log2(_1223);
                                    float _1227 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1229 = _1225 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1231 = exp2(_1229);
                                    float _1233 = fma(_1227, _1231, 1.0);
                                    float _1235 = 1.0 / _1233;
                                    float _1237 = _1235 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1239 = _1225;
                                    _1241 = _1237;
                                    _1243 = true;
                                }
                                else
                                {
                                    float _1245 = spvFAdd(_387, 9.9999999747524270787835121154785e-07);
                                    bool _1247 = _387 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1249 = isnan(_387);
                                    bool _1251 = _1247 || _1249;
                                    bool _1253 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1255 = _1251 || _1253;
                                    float _1257 = 1.0 / _1245;
                                    if (!_1255)
                                    {
                                        _1217 = _387;
                                    }
                                    float _1259 = _1217;
                                    bool _1261 = !_1255;
                                    float _1263 = _1259;
                                    _1239 = _1257;
                                    if (!_1261)
                                    {
                                        float _1265 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1267 = _387 + _1265;
                                        float _1269 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1271 = spvFAdd(_1269, 1.00000095367431640625);
                                        float _1273 = 1.0 / _1271;
                                        float _1275 = _1267 * _1273;
                                        float _1277 = -_1275;
                                        float _1279 = _1277 + 1.0;
                                        float _1281 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1283 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1281;
                                        float _1285 = abs(_1279);
                                        float _1287 = log2(_1285);
                                        float _1289 = _1283 * _1273;
                                        float _1291 = _1289 + (-1.0);
                                        float _1293 = _1289 * _1275;
                                        float _1295 = _1287 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1297 = exp2(_1295);
                                        float _1299 = fma(_1291, _1297, 1.0);
                                        float _1301 = 1.0 / _1299;
                                        float _1303 = _1293 * _1301;
                                        float _1305 = fma(_1271, _1303, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1263 = _1305;
                                    }
                                    float _1307 = _1263;
                                    float _1309 = precise::max(0.0, _1307);
                                    float _1311 = precise::min(_1309, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1313 = _1311 * _1257;
                                    _1241 = _1313;
                                }
                                _1243 = false;
                                float _1315 = _1239;
                                float _1317 = _1241;
                                float _1319 = _1315;
                                float _1341;
                                if (!_1115)
                                {
                                    float _1321 = -_395;
                                    float _1323 = _1321 + 1.0;
                                    float _1325 = abs(_1323);
                                    float _1327 = log2(_1325);
                                    float _1329 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1331 = _1327 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1333 = exp2(_1331);
                                    float _1335 = fma(_1329, _1333, 1.0);
                                    float _1337 = 1.0 / _1335;
                                    float _1339 = _1337 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1341 = _1339;
                                    _1343 = true;
                                }
                                else
                                {
                                    float _1345 = spvFAdd(_395, 9.9999999747524270787835121154785e-07);
                                    bool _1347 = _395 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1349 = isnan(_395);
                                    bool _1351 = _1347 || _1349;
                                    bool _1353 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1355 = _1351 || _1353;
                                    float _1357 = 1.0 / _1345;
                                    if (!_1355)
                                    {
                                        _1319 = _395;
                                    }
                                    float _1359 = _1319;
                                    bool _1361 = !_1355;
                                    float _1363 = _1359;
                                    if (!_1361)
                                    {
                                        float _1365 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1367 = _395 + _1365;
                                        float _1369 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1371 = spvFAdd(_1369, 1.00000095367431640625);
                                        float _1373 = 1.0 / _1371;
                                        float _1375 = _1367 * _1373;
                                        float _1377 = -_1375;
                                        float _1379 = _1377 + 1.0;
                                        float _1381 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1383 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1381;
                                        float _1385 = abs(_1379);
                                        float _1387 = log2(_1385);
                                        float _1389 = _1383 * _1373;
                                        float _1391 = _1389 + (-1.0);
                                        float _1393 = _1389 * _1375;
                                        float _1395 = _1387 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1397 = exp2(_1395);
                                        float _1399 = fma(_1391, _1397, 1.0);
                                        float _1401 = 1.0 / _1399;
                                        float _1403 = _1393 * _1401;
                                        float _1405 = fma(_1371, _1403, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1363 = _1405;
                                    }
                                    float _1407 = _1363;
                                    float _1409 = precise::max(0.0, _1407);
                                    float _1411 = precise::min(_1409, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1413 = _1411 * _1357;
                                    _1341 = _1413;
                                }
                                _1343 = false;
                                float _1415 = _1341;
                                float _1417 = precise::max(_1215, _1317);
                                float _1419 = precise::max(_1417, _1415);
                                float _1421 = -_1215;
                                float _1423 = _1419 + _1421;
                                float _1425 = -_1317;
                                float _1427 = _1419 + _1425;
                                float _1429 = -_1415;
                                float _1431 = _1419 + _1429;
                                float _1433 = fma(_1423, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1215);
                                float _1435 = fma(_1427, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1317);
                                float _1437 = fma(_1431, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1415);
                                float _1439 = _379 * _1433;
                                float _1441 = _387 * _1435;
                                float _1443 = _395 * _1437;
                                _541 = _1439;
                                _543 = _1441;
                                _551 = _1443;
                                _553 = true;
                            }
                            else
                            {
                                bool _1445 = _565 != 5.0;
                                bool _1447 = isnan(_565);
                                bool _1449 = _1445 || _1447;
                                bool _1451 = isnan(5.0);
                                bool _1453 = _1449 || _1451;
                                if (!_1453)
                                {
                                    _587 = _315;
                                }
                                float _1455 = _587;
                                float _1457 = _1455;
                                _541 = _1455;
                                if (!_1453)
                                {
                                    _589 = _317;
                                }
                                float _1459 = _589;
                                float _1461 = _1459;
                                _543 = _1459;
                                if (!_1453)
                                {
                                    _591 = _319;
                                }
                                float _1463 = _591;
                                bool _1465 = !_1453;
                                float _1467 = _1463;
                                _551 = _1463;
                                if (!_1465)
                                {
                                    bool _1469 = _565 != 6.0;
                                    bool _1471 = isnan(_565);
                                    bool _1473 = _1469 || _1471;
                                    bool _1475 = isnan(6.0);
                                    bool _1477 = _1473 || _1475;
                                    if (!_1477)
                                    {
                                        float _1479 = -_379;
                                        float _1481 = _1479 + 1.0;
                                        float _1483 = -_387;
                                        float _1485 = _1483 + 1.0;
                                        float _1487 = -_395;
                                        float _1489 = _1487 + 1.0;
                                        float _1491 = abs(_1481);
                                        float _1493 = log2(_1491);
                                        float _1495 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1497 = abs(_1485);
                                        float _1499 = log2(_1497);
                                        float _1501 = abs(_1489);
                                        float _1503 = log2(_1501);
                                        float _1505 = _1493 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1507 = _1499 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1509 = exp2(_1505);
                                        float _1511 = _1503 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1513 = exp2(_1507);
                                        float _1515 = exp2(_1511);
                                        float _1517 = fma(_1495, _1509, 1.0);
                                        float _1519 = fma(_1495, _1513, 1.0);
                                        float _1521 = 1.0 / _1517;
                                        float _1523 = fma(_1495, _1515, 1.0);
                                        float _1525 = 1.0 / _1519;
                                        float _1527 = 1.0 / _1523;
                                        float _1529 = _1521 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1531 = _1525 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1533 = precise::max(_1529, _1531);
                                        float _1535 = _1527 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1537 = precise::max(_1535, _1533);
                                        float _1539 = -_1529;
                                        float _1541 = _1539 + _1537;
                                        float _1543 = -_1531;
                                        float _1545 = _1543 + _1537;
                                        float _1547 = -_1535;
                                        float _1549 = _1547 + _1537;
                                        float _1551 = fma(_1541, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1529);
                                        float _1553 = fma(_1545, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1531);
                                        float _1555 = fma(_1549, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1535);
                                        float _1557 = _379 * _1551;
                                        float _1559 = _387 * _1553;
                                        float _1561 = _395 * _1555;
                                        _541 = _1557;
                                        _543 = _1559;
                                        _551 = _1561;
                                        _553 = true;
                                    }
                                    else
                                    {
                                        bool _1563 = _565 != 7.0;
                                        bool _1565 = isnan(_565);
                                        bool _1567 = _1563 || _1565;
                                        bool _1569 = isnan(7.0);
                                        bool _1571 = _1567 || _1569;
                                        if (_1571)
                                        {
                                            _1457 = 0.0;
                                            _1461 = 0.0;
                                        }
                                        float _1573 = _1457;
                                        float _1575 = _1461;
                                        _541 = _1573;
                                        _543 = _1575;
                                        if (_1571)
                                        {
                                            _1467 = 0.0;
                                        }
                                        float _1577 = _1467;
                                        _551 = _1577;
                                        if (!_1571)
                                        {
                                            float _1579 = -_379;
                                            float _1581 = _1579 + 1.0;
                                            float _1583 = -_387;
                                            float _1585 = _1583 + 1.0;
                                            float _1587 = -_395;
                                            float _1589 = _1587 + 1.0;
                                            float _1591 = abs(_1581);
                                            float _1593 = log2(_1591);
                                            float _1595 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1597 = abs(_1585);
                                            float _1599 = log2(_1597);
                                            float _1601 = abs(_1589);
                                            float _1603 = log2(_1601);
                                            float _1605 = _1593 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1607 = _1599 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1609 = exp2(_1605);
                                            float _1611 = _1603 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1613 = exp2(_1607);
                                            float _1615 = exp2(_1611);
                                            float _1617 = fma(_1595, _1609, 1.0);
                                            float _1619 = fma(_1595, _1613, 1.0);
                                            float _1621 = 1.0 / _1617;
                                            float _1623 = fma(_1595, _1615, 1.0);
                                            float _1625 = 1.0 / _1619;
                                            float _1627 = 1.0 / _1623;
                                            float _1629 = _1621 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1631 = -_379;
                                            float _1633 = fma(_379, _1629, _1631);
                                            float _1635 = _1625 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1637 = -_387;
                                            float _1639 = fma(_387, _1635, _1637);
                                            float _1641 = _1627 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1643 = _1633 + _1639;
                                            float _1645 = -_395;
                                            float _1647 = fma(_395, _1641, _1645);
                                            float _1649 = _1647 + _1643;
                                            float _1651 = -_1633;
                                            float _1653 = fma(_1649, 0.3333333432674407958984375, _1651);
                                            float _1655 = -_1639;
                                            float _1657 = fma(_1649, 0.3333333432674407958984375, _1655);
                                            float _1659 = -_1647;
                                            float _1661 = fma(_1649, 0.3333333432674407958984375, _1659);
                                            float _1663 = fma(_1653, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1633);
                                            float _1665 = fma(_1657, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1639);
                                            float _1667 = fma(_1661, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1647);
                                            float _1669 = _379 + _1663;
                                            float _1671 = _387 + _1665;
                                            float _1673 = _395 + _1667;
                                            _541 = _1669;
                                            _543 = _1671;
                                            _551 = _1673;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _553 = false;
        float _1675 = _541;
        float _1677 = _543;
        float _1679 = _551;
        _497 = _1675;
        _499 = _1677;
        _501 = _1679;
    }
    _503 = false;
    float _1681 = _497;
    float _1683 = _499;
    float _1685 = _501;
    float _1687 = _1681 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1689 = _1683 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1691 = _1685 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_47.x = _1687;
    out.m_47.y = _1689;
    out.m_47.z = _1691;
    out.m_47.w = _87;
    return out;
}

