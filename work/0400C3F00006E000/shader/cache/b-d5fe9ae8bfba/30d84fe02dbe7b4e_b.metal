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
    texture3d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ESmplr_w [[id(14)]];
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
    bool _489 = false;
    bool _539 = false;
    bool _1329 = false;
    bool _1229 = false;
    bool _1127 = false;
    bool _247 = false;
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
    float2 _1712 = float2(_68, _70);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1712, float2(0.0), isnan(_1712))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1712, float2(0.0), isnan(_1712))).x;
    float2 _1723 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1723, float2(0.0), isnan(_1723))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1723, float2(0.0), isnan(_1723))).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    bool _87 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _89 = isnan(0.0);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _95 = _91 || _93;
    float _97 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _99 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _97;
    float _101 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _103 = _70;
    float _105 = _99;
    if (!_95)
    {
        _103 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _107 = _103;
    float _109 = -_101;
    float _111 = fma(_72, _99, _109);
    float _113 = _107;
    if (_95)
    {
        float _115 = _79 * 0.715200006961822509765625;
        _105 = _115;
    }
    float _117 = _105;
    float _119 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
    float _121 = _117;
    if (_95)
    {
        float _123 = fma(_77, 0.2125999927520751953125, _117);
        _121 = _123;
    }
    float _125 = _121;
    float _127 = 1.0 / _111;
    float _129 = _119 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _131 = _125;
    if (_95)
    {
        float _133 = fma(_81, 0.072200000286102294921875, _125);
        _131 = _133;
    }
    float _135 = _131;
    float _137 = _135;
    if (_95)
    {
        float _139 = 1.0 / _135;
        _137 = _139;
    }
    float _141 = _137;
    float _143 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _145 = fma(_129, _127, _143);
    float _147 = precise::max(0.0, _145);
    float _149 = _147 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _151 = _147;
    if (_95)
    {
        float _153 = _141 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _155 = precise::clamp(_153, 0.0, 1.0);
        _151 = _155;
    }
    float _157 = _151;
    float _159 = _149 * (-1.44269502162933349609375);
    if (_95)
    {
        float _161 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _113 = _161;
    }
    float _163 = _113;
    float _165 = _77 * _163;
    float _167 = _165 * 4.0;
    float _169 = exp2(_159);
    float _171 = _79 * _163;
    float _173 = _171 * 4.0;
    float _175 = _81 * _163;
    float _177 = _175 * 4.0;
    uint _180 = as_type<uint>(half2(float2(_167, _173)));
    uint _182 = as_type<uint>(half2(float2(_177, 0.0)));
    uint _184 = extract_bits(_180, 16u, 16u);
    float _186 = float(_184);
    uint _188 = extract_bits(_182, 0u, 8u);
    int _191 = int(_188) & 255;
    uint _193 = extract_bits(_182, 8u, 8u);
    int _195 = int(_193) & 255;
    int _197 = _195 << 8;
    int _199 = _191 | _197;
    float _201 = _169 + (-0.5);
    float _203 = float(uint(_199));
    float _205 = fma(_201, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
    int _207 = int(_180) & 32767;
    float _209 = fma(_203, 6.103515625e-05, -0.3125);
    float _211 = precise::max(_205, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _213 = fma(_186, 6.103515625e-05, -0.3125);
    float _215 = float(uint(_207));
    float _217 = fma(_209, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _219 = _211 > 0.999000012874603271484375;
    float _221 = fma(_213, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _223 = fma(_215, 6.103515625e-05, -0.3125);
    float _225 = fma(_223, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _227 = !_219;
    float _229 = _217;
    float _241;
    float _243;
    float _245;
    if (!_227)
    {
        float3 _1977 = float3(_225, _221, _217);
        float3 _233 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1977, float3(0.0), isnan(_1977))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1977, float3(0.0), isnan(_1977))).xyz;
        float _235 = _233.x;
        float _237 = _233.y;
        float _239 = _233.z;
        _241 = _235;
        _243 = _237;
        _245 = _239;
        _247 = true;
    }
    else
    {
        float3 _1999 = float3(_225, _221, _217);
        float3 _249 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1999, float3(0.0), isnan(_1999))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1999, float3(0.0), isnan(_1999))).xyz;
        float _251 = _249.x;
        float _253 = _249.y;
        float _255 = _249.z;
        float3 _2014 = float3(_225, _221, _217);
        float3 _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2014, float3(0.0), isnan(_2014))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2014, float3(0.0), isnan(_2014))).xyz;
        float _259 = _257.x;
        float _261 = _257.y;
        float _263 = _257.z;
        bool _265 = _211 >= 0.001000000047497451305389404296875;
        bool _267 = isnan(_211);
        bool _269 = _265 || _267;
        bool _271 = isnan(0.001000000047497451305389404296875);
        bool _273 = _269 || _271;
        _241 = _251;
        _243 = _253;
        if (!_273)
        {
            _245 = _255;
            _247 = true;
        }
        else
        {
            float3 _2048 = float3(_225, _221, _217);
            float3 _275 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2048, float3(0.0), isnan(_2048))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2048, float3(0.0), isnan(_2048))).xyz;
            float _277 = _275.x;
            float _279 = _275.y;
            float _281 = _275.z;
            float _283 = -_259;
            float _285 = _277 + _283;
            float _287 = -_261;
            float _289 = _279 + _287;
            float _291 = -_263;
            float _293 = _281 + _291;
            float _295 = fma(_211, _285, _259);
            float _297 = fma(_211, _289, _261);
            float _299 = fma(_211, _293, _263);
            _241 = _295;
            _243 = _297;
            _245 = _299;
        }
    }
    _247 = false;
    float _301 = _241;
    float _303 = _243;
    float _305 = _245;
    bool _307 = _301 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _309 = isnan(_301);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _315 = _311 || _313;
    float _317 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _319 = fma(_303, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _321 = fma(_305, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _323 = (*spvDescriptorSet0.fp_c3)._m0[7].x != 6.0;
    bool _325 = isnan((*spvDescriptorSet0.fp_c3)._m0[7].x);
    bool _327 = _323 || _325;
    bool _329 = isnan(6.0);
    bool _331 = _327 || _329;
    bool _333 = _303 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _335 = isnan(_303);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _341 = _337 || _339;
    float _343 = exp2(_317);
    bool _345 = _305 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _347 = isnan(_305);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _353 = _349 || _351;
    float _355 = exp2(_319);
    float _357 = exp2(_321);
    float _359 = -_343;
    float _361 = _359 + 1.0;
    bool _363 = !_315;
    float _365 = _363 ? _301 : _361;
    float _367 = -_355;
    float _369 = _367 + 1.0;
    bool _371 = !_341;
    float _373 = _371 ? _303 : _369;
    float _375 = -_357;
    float _377 = _375 + 1.0;
    bool _379 = !_353;
    float _381 = _379 ? _305 : _377;
    float _383 = _355;
    float _385 = _357;
    float _387 = _377;
    float _389 = _355;
    float _391 = _357;
    float _393 = _365;
    float _395 = _373;
    float _397 = _381;
    float _483;
    float _485;
    float _487;
    if (!_331)
    {
        float _399 = -_365;
        float _401 = _399 + 1.0;
        float _403 = -_373;
        float _405 = _403 + 1.0;
        float _407 = -_381;
        float _409 = _407 + 1.0;
        float _411 = abs(_401);
        float _413 = log2(_411);
        float _415 = abs(_405);
        float _417 = log2(_415);
        float _419 = abs(_409);
        float _421 = log2(_419);
        float _423 = _413 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _425 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
        float _427 = _417 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _429 = exp2(_423);
        float _431 = _421 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
        float _433 = exp2(_427);
        float _435 = exp2(_431);
        float _437 = fma(_425, _429, 1.0);
        float _439 = fma(_425, _433, 1.0);
        float _441 = 1.0 / _437;
        float _443 = fma(_425, _435, 1.0);
        float _445 = 1.0 / _439;
        float _447 = 1.0 / _443;
        float _449 = _441 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _451 = _445 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _453 = precise::max(_449, _451);
        float _455 = _447 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
        float _457 = precise::max(_455, _453);
        float _459 = -_449;
        float _461 = _459 + _457;
        float _463 = -_451;
        float _465 = _463 + _457;
        float _467 = -_455;
        float _469 = _467 + _457;
        float _471 = fma(_461, (*spvDescriptorSet0.fp_c3)._m0[6].w, _449);
        float _473 = fma(_465, (*spvDescriptorSet0.fp_c3)._m0[6].w, _451);
        float _475 = fma(_469, (*spvDescriptorSet0.fp_c3)._m0[6].w, _455);
        float _477 = _365 * _471;
        float _479 = _373 * _473;
        float _481 = _381 * _475;
        _483 = _477;
        _485 = _479;
        _487 = _481;
        _489 = true;
    }
    else
    {
        bool _491 = (*spvDescriptorSet0.fp_c3)._m0[7].x >= 1000.0;
        if (!_491)
        {
            _229 = (*spvDescriptorSet0.fp_c3)._m0[7].x;
        }
        float _493 = _229;
        bool _495 = !_491;
        float _497 = _493;
        float _527;
        float _529;
        float _537;
        if (!_495)
        {
            float _499 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _501 = _68 + _499;
            float _503 = abs(_501);
            float _505 = _503 * 2560.0;
            bool _507 = _505 >= 2.0;
            bool _509 = isnan(_505);
            bool _511 = _507 || _509;
            bool _513 = isnan(2.0);
            bool _515 = _511 || _513;
            float _517 = _505;
            if (!_515)
            {
                _517 = 0.0;
                _383 = 0.0;
            }
            float _519 = _517;
            float _521 = _383;
            float _523 = _519;
            float _525 = _521;
            _527 = _519;
            _529 = _521;
            if (!_515)
            {
                _385 = 0.0;
            }
            float _531 = _385;
            bool _533 = !_515;
            float _535 = _531;
            _537 = _531;
            _539 = _533;
            if (!_539)
            {
                bool _541 = _68 > (*spvDescriptorSet0.fp_c3)._m0[7].y;
                if (_541)
                {
                    _523 = _365;
                }
                float _543 = _523;
                _387 = _543;
                _527 = _543;
                if (_541)
                {
                    _525 = _373;
                }
                float _545 = _525;
                _389 = _545;
                _529 = _545;
                if (_541)
                {
                    _535 = _381;
                }
                float _547 = _535;
                _391 = _547;
                _537 = _547;
                _539 = _541;
                if (!_539)
                {
                    float _549 = (*spvDescriptorSet0.fp_c3)._m0[7].x + (-1000.0);
                    _497 = _549;
                }
            }
        }
        if (!_539)
        {
            float _551 = _497;
            float _553 = _387;
            float _555 = _389;
            float _557 = _391;
            bool _559 = _551 != 0.0;
            bool _561 = isnan(_551);
            bool _563 = _559 || _561;
            bool _565 = isnan(0.0);
            bool _567 = _563 || _565;
            float _569 = _553;
            float _571 = _553;
            float _573 = _553;
            float _575 = _555;
            float _577 = _557;
            if (!_567)
            {
                float _579 = _303 * 0.586600005626678466796875;
                float _581 = fma(_301, 0.29890000820159912109375, _579);
                float _583 = fma(_305, 0.1143999993801116943359375, _581);
                float _585 = _583 * (-1.44269502162933349609375);
                float _587 = exp2(_585);
                float _589 = -_587;
                float _591 = _589 + 1.0;
                bool _593 = _591 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                bool _595 = isnan(_591);
                bool _597 = _593 || _595;
                bool _599 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                bool _601 = _597 || _599;
                if (!_601)
                {
                    _569 = _591;
                }
                float _603 = _569;
                bool _605 = !_601;
                float _607 = _603;
                if (!_605)
                {
                    float _609 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _611 = _591 + _609;
                    float _613 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _615 = spvFAdd(_613, 1.00000095367431640625);
                    float _617 = 1.0 / _615;
                    float _619 = _611 * _617;
                    float _621 = -_619;
                    float _623 = _621 + 1.0;
                    float _625 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _627 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _625;
                    float _629 = abs(_623);
                    float _631 = log2(_629);
                    float _633 = _627 * _617;
                    float _635 = _633 + (-1.0);
                    float _637 = _633 * _619;
                    float _639 = _631 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                    float _641 = exp2(_639);
                    float _643 = fma(_635, _641, 1.0);
                    float _645 = 1.0 / _643;
                    float _647 = _637 * _645;
                    float _649 = fma(_615, _647, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                    _607 = _649;
                }
                float _651 = _607;
                float _653 = -_591;
                float _655 = _653 + _651;
                float _657 = _373 * 0.586600005626678466796875;
                float _659 = _655 + 1.0;
                float _661 = fma(_365, 0.29890000820159912109375, _657);
                float _663 = fma(_381, 0.1143999993801116943359375, _661);
                float _665 = abs(_659);
                float _667 = log2(_665);
                float _669 = spvFAdd(_663, 9.9999999747524270787835121154785e-07);
                float _671 = 1.0 / _669;
                float _673 = _667 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
                float _675 = exp2(_673);
                float _677 = fma(_365, _671, -1.0);
                float _679 = fma(_373, _671, -1.0);
                float _681 = fma(_381, _671, -1.0);
                float _683 = fma(_675, _677, 1.0);
                float _685 = fma(_675, _679, 1.0);
                float _687 = fma(_675, _681, 1.0);
                float _689 = _683 * _651;
                float _691 = _685 * _651;
                float _693 = _687 * _651;
                float _695 = precise::max(0.0, _689);
                float _697 = precise::max(0.0, _691);
                float _699 = precise::max(0.0, _693);
                float _701 = precise::min(_695, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _703 = precise::min(_697, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                float _705 = precise::min(_699, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                _527 = _701;
                _529 = _703;
                _537 = _705;
                _539 = true;
            }
            else
            {
                bool _707 = _551 != 1.0;
                bool _709 = isnan(_551);
                bool _711 = _707 || _709;
                bool _713 = isnan(1.0);
                bool _715 = _711 || _713;
                if (!_715)
                {
                    bool _717 = _365 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _719 = isnan(_365);
                    bool _721 = _717 || _719;
                    bool _723 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _725 = _721 || _723;
                    float _727 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _729 = spvFAdd(_727, 1.00000095367431640625);
                    bool _731 = _373 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _733 = isnan(_373);
                    bool _735 = _731 || _733;
                    bool _737 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _739 = _735 || _737;
                    bool _741 = _381 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                    bool _743 = isnan(_381);
                    bool _745 = _741 || _743;
                    bool _747 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                    bool _749 = _745 || _747;
                    float _751 = 1.0 / _729;
                    float _753 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                    float _755 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _753;
                    float _757 = _755 * _751;
                    bool _759 = !_725;
                    if (!_759)
                    {
                        float _761 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _763 = _365 + _761;
                        float _765 = _757 + (-1.0);
                        float _767 = _763 * _751;
                        float _769 = -_767;
                        float _771 = _769 + 1.0;
                        float _773 = _757 * _767;
                        float _775 = abs(_771);
                        float _777 = log2(_775);
                        float _779 = _777 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _781 = exp2(_779);
                        float _783 = fma(_765, _781, 1.0);
                        float _785 = 1.0 / _783;
                        float _787 = _773 * _785;
                        float _789 = fma(_729, _787, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _393 = _789;
                    }
                    float _791 = _393;
                    bool _793 = !_739;
                    if (!_793)
                    {
                        float _795 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _797 = _373 + _795;
                        float _799 = _757 + (-1.0);
                        float _801 = _797 * _751;
                        float _803 = -_801;
                        float _805 = _803 + 1.0;
                        float _807 = _757 * _801;
                        float _809 = abs(_805);
                        float _811 = log2(_809);
                        float _813 = _811 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _815 = exp2(_813);
                        float _817 = fma(_799, _815, 1.0);
                        float _819 = 1.0 / _817;
                        float _821 = _807 * _819;
                        float _823 = fma(_729, _821, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _395 = _823;
                    }
                    float _825 = _395;
                    bool _827 = !_749;
                    if (!_827)
                    {
                        float _829 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                        float _831 = _381 + _829;
                        float _833 = _757 + (-1.0);
                        float _835 = _831 * _751;
                        float _837 = -_835;
                        float _839 = _837 + 1.0;
                        float _841 = _757 * _835;
                        float _843 = abs(_839);
                        float _845 = log2(_843);
                        float _847 = _845 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                        float _849 = exp2(_847);
                        float _851 = fma(_833, _849, 1.0);
                        float _853 = 1.0 / _851;
                        float _855 = _841 * _853;
                        float _857 = fma(_729, _855, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                        _397 = _857;
                    }
                    float _859 = _397;
                    float _861 = precise::max(0.0, _859);
                    float _863 = precise::max(0.0, _791);
                    float _865 = precise::max(0.0, _825);
                    float _867 = precise::min(_861, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _869 = precise::min(_863, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    float _871 = precise::min(_865, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                    _527 = _869;
                    _529 = _871;
                    _537 = _867;
                    _539 = true;
                }
                else
                {
                    bool _873 = _551 != 2.0;
                    bool _875 = isnan(_551);
                    bool _877 = _873 || _875;
                    bool _879 = isnan(2.0);
                    bool _881 = _877 || _879;
                    if (!_881)
                    {
                        float _883 = _373 * 0.715200006961822509765625;
                        float _885 = fma(_365, 0.2125999927520751953125, _883);
                        float _887 = fma(_381, 0.072200000286102294921875, _885);
                        float _889 = spvFAdd(_887, 9.9999999747524270787835121154785e-07);
                        bool _891 = _887 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                        bool _893 = isnan(_887);
                        bool _895 = _891 || _893;
                        bool _897 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                        bool _899 = _895 || _897;
                        float _901 = 1.0 / _889;
                        bool _903 = !_899;
                        float _905 = _887;
                        if (!_903)
                        {
                            float _907 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _909 = _887 + _907;
                            float _911 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _913 = spvFAdd(_911, 1.00000095367431640625);
                            float _915 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                            float _917 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _915;
                            float _919 = 1.0 / _913;
                            float _921 = _909 * _919;
                            float _923 = _917 * _919;
                            float _925 = -_921;
                            float _927 = _925 + 1.0;
                            float _929 = _923 + (-1.0);
                            float _931 = _923 * _921;
                            float _933 = abs(_927);
                            float _935 = log2(_933);
                            float _937 = _935 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _939 = exp2(_937);
                            float _941 = fma(_929, _939, 1.0);
                            float _943 = 1.0 / _941;
                            float _945 = _931 * _943;
                            float _947 = fma(_913, _945, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                            _905 = _947;
                        }
                        float _949 = _905;
                        float _951 = precise::max(0.0, _949);
                        float _953 = precise::min(_951, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _955 = _953 * _901;
                        float _957 = _365 * _955;
                        float _959 = _373 * _955;
                        float _961 = _381 * _955;
                        float _963 = precise::max(0.0, _957);
                        float _965 = precise::max(0.0, _959);
                        float _967 = precise::max(0.0, _961);
                        float _969 = precise::min(_963, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _971 = precise::min(_965, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        float _973 = precise::min(_967, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                        _527 = _969;
                        _529 = _971;
                        _537 = _973;
                        _539 = true;
                    }
                    else
                    {
                        bool _975 = _551 != 3.0;
                        bool _977 = isnan(_551);
                        bool _979 = _975 || _977;
                        bool _981 = isnan(3.0);
                        bool _983 = _979 || _981;
                        if (!_983)
                        {
                            float _985 = -_365;
                            float _987 = _985 + 1.0;
                            float _989 = -_373;
                            float _991 = _989 + 1.0;
                            float _993 = -_381;
                            float _995 = _993 + 1.0;
                            float _997 = abs(_987);
                            float _999 = log2(_997);
                            float _1001 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                            float _1003 = abs(_991);
                            float _1005 = log2(_1003);
                            float _1007 = abs(_995);
                            float _1009 = log2(_1007);
                            float _1011 = _999 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1013 = _1005 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1015 = exp2(_1011);
                            float _1017 = _1009 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                            float _1019 = exp2(_1013);
                            float _1021 = exp2(_1017);
                            float _1023 = fma(_1001, _1015, 1.0);
                            float _1025 = fma(_1001, _1019, 1.0);
                            float _1027 = 1.0 / _1023;
                            float _1029 = fma(_1001, _1021, 1.0);
                            float _1031 = 1.0 / _1025;
                            float _1033 = 1.0 / _1029;
                            float _1035 = _1027 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1037 = _1027 + _1031;
                            float _1039 = _1031 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1041 = _1033 + _1037;
                            float _1043 = _1033 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1045 = precise::max(_1035, _1039);
                            float _1047 = _1041 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                            float _1049 = precise::max(_1043, _1045);
                            float _1051 = _1047 * 0.3333333432674407958984375;
                            float _1053 = -_1051;
                            float _1055 = _1049 + _1053;
                            float _1057 = fma(_1055, (*spvDescriptorSet0.fp_c3)._m0[7].z, _1051);
                            float _1059 = -_1035;
                            float _1061 = _1059 + _1057;
                            float _1063 = -_1039;
                            float _1065 = _1063 + _1057;
                            float _1067 = -_1043;
                            float _1069 = _1067 + _1057;
                            float _1071 = fma(_1061, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1035);
                            float _1073 = fma(_1065, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1039);
                            float _1075 = fma(_1069, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1043);
                            float _1077 = _365 * _1071;
                            float _1079 = _373 * _1073;
                            float _1081 = _381 * _1075;
                            _527 = _1077;
                            _529 = _1079;
                            _537 = _1081;
                            _539 = true;
                        }
                        else
                        {
                            bool _1083 = _551 != 4.0;
                            bool _1085 = isnan(_551);
                            bool _1087 = _1083 || _1085;
                            bool _1089 = isnan(4.0);
                            bool _1091 = _1087 || _1089;
                            if (!_1091)
                            {
                                bool _1093 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                bool _1095 = isnan(0.0);
                                bool _1097 = _1093 || _1095;
                                bool _1099 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                bool _1101 = _1097 || _1099;
                                float _1123;
                                float _1125;
                                if (!_1101)
                                {
                                    float _1103 = -_365;
                                    float _1105 = _1103 + 1.0;
                                    float _1107 = abs(_1105);
                                    float _1109 = log2(_1107);
                                    float _1111 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1113 = _1109 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1115 = exp2(_1113);
                                    float _1117 = fma(_1111, _1115, 1.0);
                                    float _1119 = 1.0 / _1117;
                                    float _1121 = _1119 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1123 = _1109;
                                    _1125 = _1121;
                                    _1127 = true;
                                }
                                else
                                {
                                    float _1129 = spvFAdd(_365, 9.9999999747524270787835121154785e-07);
                                    bool _1131 = _365 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1133 = isnan(_365);
                                    bool _1135 = _1131 || _1133;
                                    bool _1137 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1139 = _1135 || _1137;
                                    float _1141 = 1.0 / _1129;
                                    if (!_1139)
                                    {
                                        _571 = _365;
                                    }
                                    float _1143 = _571;
                                    bool _1145 = !_1139;
                                    float _1147 = _1143;
                                    _1123 = _1141;
                                    if (!_1145)
                                    {
                                        float _1149 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1151 = _365 + _1149;
                                        float _1153 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1155 = spvFAdd(_1153, 1.00000095367431640625);
                                        float _1157 = 1.0 / _1155;
                                        float _1159 = _1151 * _1157;
                                        float _1161 = -_1159;
                                        float _1163 = _1161 + 1.0;
                                        float _1165 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1167 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1165;
                                        float _1169 = abs(_1163);
                                        float _1171 = log2(_1169);
                                        float _1173 = _1167 * _1157;
                                        float _1175 = _1173 + (-1.0);
                                        float _1177 = _1173 * _1159;
                                        float _1179 = _1171 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1181 = exp2(_1179);
                                        float _1183 = fma(_1175, _1181, 1.0);
                                        float _1185 = 1.0 / _1183;
                                        float _1187 = _1177 * _1185;
                                        float _1189 = fma(_1155, _1187, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1147 = _1189;
                                    }
                                    float _1191 = _1147;
                                    float _1193 = precise::max(0.0, _1191);
                                    float _1195 = precise::min(_1193, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1197 = _1195 * _1141;
                                    _1125 = _1197;
                                }
                                _1127 = false;
                                float _1199 = _1123;
                                float _1201 = _1125;
                                float _1203 = _1199;
                                float _1225;
                                float _1227;
                                if (!_1101)
                                {
                                    float _1205 = -_373;
                                    float _1207 = _1205 + 1.0;
                                    float _1209 = abs(_1207);
                                    float _1211 = log2(_1209);
                                    float _1213 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1215 = _1211 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1217 = exp2(_1215);
                                    float _1219 = fma(_1213, _1217, 1.0);
                                    float _1221 = 1.0 / _1219;
                                    float _1223 = _1221 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1225 = _1211;
                                    _1227 = _1223;
                                    _1229 = true;
                                }
                                else
                                {
                                    float _1231 = spvFAdd(_373, 9.9999999747524270787835121154785e-07);
                                    bool _1233 = _373 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1235 = isnan(_373);
                                    bool _1237 = _1233 || _1235;
                                    bool _1239 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1241 = _1237 || _1239;
                                    float _1243 = 1.0 / _1231;
                                    if (!_1241)
                                    {
                                        _1203 = _373;
                                    }
                                    float _1245 = _1203;
                                    bool _1247 = !_1241;
                                    float _1249 = _1245;
                                    _1225 = _1243;
                                    if (!_1247)
                                    {
                                        float _1251 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1253 = _373 + _1251;
                                        float _1255 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1257 = spvFAdd(_1255, 1.00000095367431640625);
                                        float _1259 = 1.0 / _1257;
                                        float _1261 = _1253 * _1259;
                                        float _1263 = -_1261;
                                        float _1265 = _1263 + 1.0;
                                        float _1267 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1269 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1267;
                                        float _1271 = abs(_1265);
                                        float _1273 = log2(_1271);
                                        float _1275 = _1269 * _1259;
                                        float _1277 = _1275 + (-1.0);
                                        float _1279 = _1275 * _1261;
                                        float _1281 = _1273 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1283 = exp2(_1281);
                                        float _1285 = fma(_1277, _1283, 1.0);
                                        float _1287 = 1.0 / _1285;
                                        float _1289 = _1279 * _1287;
                                        float _1291 = fma(_1257, _1289, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1249 = _1291;
                                    }
                                    float _1293 = _1249;
                                    float _1295 = precise::max(0.0, _1293);
                                    float _1297 = precise::min(_1295, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1299 = _1297 * _1243;
                                    _1227 = _1299;
                                }
                                _1229 = false;
                                float _1301 = _1225;
                                float _1303 = _1227;
                                float _1305 = _1301;
                                float _1327;
                                if (!_1101)
                                {
                                    float _1307 = -_381;
                                    float _1309 = _1307 + 1.0;
                                    float _1311 = abs(_1309);
                                    float _1313 = log2(_1311);
                                    float _1315 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                    float _1317 = _1313 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                    float _1319 = exp2(_1317);
                                    float _1321 = fma(_1315, _1319, 1.0);
                                    float _1323 = 1.0 / _1321;
                                    float _1325 = _1323 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                    _1327 = _1325;
                                    _1329 = true;
                                }
                                else
                                {
                                    float _1331 = spvFAdd(_381, 9.9999999747524270787835121154785e-07);
                                    bool _1333 = _381 >= (*spvDescriptorSet0.fp_c3)._m0[6].y;
                                    bool _1335 = isnan(_381);
                                    bool _1337 = _1333 || _1335;
                                    bool _1339 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].y);
                                    bool _1341 = _1337 || _1339;
                                    float _1343 = 1.0 / _1331;
                                    if (!_1341)
                                    {
                                        _1305 = _381;
                                    }
                                    float _1345 = _1305;
                                    bool _1347 = !_1341;
                                    float _1349 = _1345;
                                    if (!_1347)
                                    {
                                        float _1351 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1353 = _381 + _1351;
                                        float _1355 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1357 = spvFAdd(_1355, 1.00000095367431640625);
                                        float _1359 = 1.0 / _1357;
                                        float _1361 = _1353 * _1359;
                                        float _1363 = -_1361;
                                        float _1365 = _1363 + 1.0;
                                        float _1367 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
                                        float _1369 = (*spvDescriptorSet0.fp_c3)._m0[6].x + _1367;
                                        float _1371 = abs(_1365);
                                        float _1373 = log2(_1371);
                                        float _1375 = _1369 * _1359;
                                        float _1377 = _1375 + (-1.0);
                                        float _1379 = _1375 * _1361;
                                        float _1381 = _1373 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1383 = exp2(_1381);
                                        float _1385 = fma(_1377, _1383, 1.0);
                                        float _1387 = 1.0 / _1385;
                                        float _1389 = _1379 * _1387;
                                        float _1391 = fma(_1357, _1389, (*spvDescriptorSet0.fp_c3)._m0[6].y);
                                        _1349 = _1391;
                                    }
                                    float _1393 = _1349;
                                    float _1395 = precise::max(0.0, _1393);
                                    float _1397 = precise::min(_1395, (*spvDescriptorSet0.fp_c3)._m0[6].x);
                                    float _1399 = _1397 * _1343;
                                    _1327 = _1399;
                                }
                                _1329 = false;
                                float _1401 = _1327;
                                float _1403 = precise::max(_1201, _1303);
                                float _1405 = precise::max(_1403, _1401);
                                float _1407 = -_1201;
                                float _1409 = _1405 + _1407;
                                float _1411 = -_1303;
                                float _1413 = _1405 + _1411;
                                float _1415 = -_1401;
                                float _1417 = _1405 + _1415;
                                float _1419 = fma(_1409, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1201);
                                float _1421 = fma(_1413, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1303);
                                float _1423 = fma(_1417, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1401);
                                float _1425 = _365 * _1419;
                                float _1427 = _373 * _1421;
                                float _1429 = _381 * _1423;
                                _527 = _1425;
                                _529 = _1427;
                                _537 = _1429;
                                _539 = true;
                            }
                            else
                            {
                                bool _1431 = _551 != 5.0;
                                bool _1433 = isnan(_551);
                                bool _1435 = _1431 || _1433;
                                bool _1437 = isnan(5.0);
                                bool _1439 = _1435 || _1437;
                                if (!_1439)
                                {
                                    _573 = _301;
                                }
                                float _1441 = _573;
                                float _1443 = _1441;
                                _527 = _1441;
                                if (!_1439)
                                {
                                    _575 = _303;
                                }
                                float _1445 = _575;
                                float _1447 = _1445;
                                _529 = _1445;
                                if (!_1439)
                                {
                                    _577 = _305;
                                }
                                float _1449 = _577;
                                bool _1451 = !_1439;
                                float _1453 = _1449;
                                _537 = _1449;
                                if (!_1451)
                                {
                                    bool _1455 = _551 != 6.0;
                                    bool _1457 = isnan(_551);
                                    bool _1459 = _1455 || _1457;
                                    bool _1461 = isnan(6.0);
                                    bool _1463 = _1459 || _1461;
                                    if (!_1463)
                                    {
                                        float _1465 = -_365;
                                        float _1467 = _1465 + 1.0;
                                        float _1469 = -_373;
                                        float _1471 = _1469 + 1.0;
                                        float _1473 = -_381;
                                        float _1475 = _1473 + 1.0;
                                        float _1477 = abs(_1467);
                                        float _1479 = log2(_1477);
                                        float _1481 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                        float _1483 = abs(_1471);
                                        float _1485 = log2(_1483);
                                        float _1487 = abs(_1475);
                                        float _1489 = log2(_1487);
                                        float _1491 = _1479 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1493 = _1485 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1495 = exp2(_1491);
                                        float _1497 = _1489 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                        float _1499 = exp2(_1493);
                                        float _1501 = exp2(_1497);
                                        float _1503 = fma(_1481, _1495, 1.0);
                                        float _1505 = fma(_1481, _1499, 1.0);
                                        float _1507 = 1.0 / _1503;
                                        float _1509 = fma(_1481, _1501, 1.0);
                                        float _1511 = 1.0 / _1505;
                                        float _1513 = 1.0 / _1509;
                                        float _1515 = _1507 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1517 = _1511 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1519 = precise::max(_1515, _1517);
                                        float _1521 = _1513 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                        float _1523 = precise::max(_1521, _1519);
                                        float _1525 = -_1515;
                                        float _1527 = _1525 + _1523;
                                        float _1529 = -_1517;
                                        float _1531 = _1529 + _1523;
                                        float _1533 = -_1521;
                                        float _1535 = _1533 + _1523;
                                        float _1537 = fma(_1527, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1515);
                                        float _1539 = fma(_1531, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1517);
                                        float _1541 = fma(_1535, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1521);
                                        float _1543 = _365 * _1537;
                                        float _1545 = _373 * _1539;
                                        float _1547 = _381 * _1541;
                                        _527 = _1543;
                                        _529 = _1545;
                                        _537 = _1547;
                                        _539 = true;
                                    }
                                    else
                                    {
                                        bool _1549 = _551 != 7.0;
                                        bool _1551 = isnan(_551);
                                        bool _1553 = _1549 || _1551;
                                        bool _1555 = isnan(7.0);
                                        bool _1557 = _1553 || _1555;
                                        if (_1557)
                                        {
                                            _1443 = 0.0;
                                            _1447 = 0.0;
                                        }
                                        float _1559 = _1443;
                                        float _1561 = _1447;
                                        _527 = _1559;
                                        _529 = _1561;
                                        if (_1557)
                                        {
                                            _1453 = 0.0;
                                        }
                                        float _1563 = _1453;
                                        _537 = _1563;
                                        if (!_1557)
                                        {
                                            float _1565 = -_365;
                                            float _1567 = _1565 + 1.0;
                                            float _1569 = -_373;
                                            float _1571 = _1569 + 1.0;
                                            float _1573 = -_381;
                                            float _1575 = _1573 + 1.0;
                                            float _1577 = abs(_1567);
                                            float _1579 = log2(_1577);
                                            float _1581 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
                                            float _1583 = abs(_1571);
                                            float _1585 = log2(_1583);
                                            float _1587 = abs(_1575);
                                            float _1589 = log2(_1587);
                                            float _1591 = _1579 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1593 = _1585 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1595 = exp2(_1591);
                                            float _1597 = _1589 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
                                            float _1599 = exp2(_1593);
                                            float _1601 = exp2(_1597);
                                            float _1603 = fma(_1581, _1595, 1.0);
                                            float _1605 = fma(_1581, _1599, 1.0);
                                            float _1607 = 1.0 / _1603;
                                            float _1609 = fma(_1581, _1601, 1.0);
                                            float _1611 = 1.0 / _1605;
                                            float _1613 = 1.0 / _1609;
                                            float _1615 = _1607 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1617 = -_365;
                                            float _1619 = fma(_365, _1615, _1617);
                                            float _1621 = _1611 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1623 = -_373;
                                            float _1625 = fma(_373, _1621, _1623);
                                            float _1627 = _1613 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
                                            float _1629 = _1619 + _1625;
                                            float _1631 = -_381;
                                            float _1633 = fma(_381, _1627, _1631);
                                            float _1635 = _1633 + _1629;
                                            float _1637 = -_1619;
                                            float _1639 = fma(_1635, 0.3333333432674407958984375, _1637);
                                            float _1641 = -_1625;
                                            float _1643 = fma(_1635, 0.3333333432674407958984375, _1641);
                                            float _1645 = -_1633;
                                            float _1647 = fma(_1635, 0.3333333432674407958984375, _1645);
                                            float _1649 = fma(_1639, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1619);
                                            float _1651 = fma(_1643, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1625);
                                            float _1653 = fma(_1647, (*spvDescriptorSet0.fp_c3)._m0[6].w, _1633);
                                            float _1655 = _365 + _1649;
                                            float _1657 = _373 + _1651;
                                            float _1659 = _381 + _1653;
                                            _527 = _1655;
                                            _529 = _1657;
                                            _537 = _1659;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _539 = false;
        float _1661 = _527;
        float _1663 = _529;
        float _1665 = _537;
        _483 = _1661;
        _485 = _1663;
        _487 = _1665;
    }
    _489 = false;
    float _1667 = _483;
    float _1669 = _485;
    float _1671 = _487;
    float _1673 = _1667 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1675 = _1669 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1677 = _1671 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_45.x = _1673;
    out.m_45.y = _1675;
    out.m_45.z = _1677;
    out.m_45.w = _83;
    return out;
}

