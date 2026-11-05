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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _864;
    _864.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_69, _71));
    _864.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_69, _71));
    float _73 = _864.x;
    float _75 = _73 * 256.0;
    int _78 = int(_75);
    float _80 = in.m_35.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_35.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = _67 * _84;
    float _94 = _67 * _90;
    float _96 = fma(_92, 0.75, -0.75);
    float _98 = fma(_94, 0.75, -0.75);
    float _100 = _96 * 0.707106769084930419921875;
    float _102 = -_100;
    float _104 = fma(_98, 0.707106769084930419921875, _102);
    float _106 = fma(_98, 0.707106769084930419921875, _100);
    float _108 = _104 + 1.0;
    float _110 = _106 + 1.0;
    float _112 = float(uint(_78));
    float _114 = _112 * 0.00390625;
    float _116 = precise::min(_114, 2.0);
    float2 _926 = float2(_69, _71);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_926, float2(0.0), isnan(_926)), level(_116)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_926, float2(0.0), isnan(_926)), level(_116)).w;
    float2 _938 = float2(_108, _110);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_938, float2(0.0), isnan(_938))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_938, float2(0.0), isnan(_938))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float _131 = in.m_37.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_39.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_41.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _67 * _135;
    float _151 = fma(_149, 0.23999999463558197021484375, 0.00999999977648258209228515625);
    float _153 = in.m_43.z;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    bool _163 = _118 >= _151;
    bool _165 = isnan(_118);
    bool _167 = _163 || _165;
    bool _169 = isnan(_151);
    bool _171 = _167 || _169;
    float _173 = float(_171);
    float _175 = _67 * _141;
    float _177 = _67 * _147;
    float _179 = fma(_175, _129, _173);
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _181 * _177;
    bool _185 = _183 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _187 = isnan(_183);
    bool _189 = _185 || _187;
    bool _191 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _193 = _189 || _191;
    float _195 = in.m_43.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_43.x;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = _157;
    if (!_193)
    {
        discard_fragment();
    }
    float _209 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _211 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _213 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _159);
    float _215 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _209);
    float _217 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _211);
    float _219 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _217);
    float _221 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _213);
    float _223 = _67 * _199;
    float _225 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _215);
    float _227 = _219 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _229 = _67 * _205;
    float _231 = _223 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _233 = _223 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _235 = _223 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _237 = 1.0 / _227;
    float _239 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[0].x, _231);
    float _241 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[1].x, _233);
    float _243 = fma(_229, (*spvDescriptorSet0.fp_c8)._m0[2].x, _235);
    float _245 = _67 * _157;
    float _247 = _221 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _249 = _225 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _251 = fma(_245, (*spvDescriptorSet0.fp_c8)._m0[2].z, _243);
    float _253 = fma(_245, (*spvDescriptorSet0.fp_c8)._m0[0].z, _239);
    float _255 = fma(_245, (*spvDescriptorSet0.fp_c8)._m0[1].z, _241);
    float _257 = _251 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _259 = _253 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _261 = _255 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _263 = _257 * _237;
    float _265 = -_259;
    float _267 = fma(_247, _263, _265);
    float _269 = -_261;
    float _271 = fma(_249, _263, _269);
    float _273 = abs(_267);
    float _275 = abs(_271);
    float _277 = precise::max(_273, _275);
    bool _279 = _277 >= 16.0;
    float _281 = _267;
    float _283 = _271;
    int _285 = as_type<int>(_259);
    if (_279)
    {
        float _287 = _267 * 0.0625;
        _281 = _287;
    }
    float _289 = _281;
    if (_279)
    {
        float _291 = _271 * 0.0625;
        _283 = _291;
    }
    float _293 = _283;
    float _295 = abs(_289);
    bool _297 = _295 != 0.0;
    bool _299 = isnan(_295);
    bool _301 = _297 || _299;
    bool _303 = isnan(0.0);
    bool _305 = _301 || _303;
    float _307 = abs(_293);
    bool _309 = _307 == 0.0;
    float _311 = abs(_293);
    bool _313 = _311 == 0.0;
    bool _315 = !_305;
    bool _317 = _313 && _315;
    bool _319 = false;
    if (_317)
    {
        bool _321 = as_type<int>(_293) >= 0;
        _319 = _321;
    }
    bool _323 = _319;
    int _325 = _323 ? (-1) : 0;
    if (_317)
    {
        int _327 = _323 ? 0 : 1078530011;
        _285 = _327;
    }
    int _329 = _285;
    int _331 = _329;
    if (_317)
    {
        int _333 = int(0x80000000) & as_type<int>(_289);
        int _335 = _329 | _333;
        _207 = as_type<float>(_335);
    }
    float _337 = _207;
    bool _339 = !_305;
    bool _341 = _339 && _309;
    float _343 = _337;
    float _345 = _337;
    if (!_341)
    {
        float _347 = abs(_289);
        bool _349 = _347 != as_type<float>(0x7f800000u /* inf */);
        bool _351 = isnan(_347);
        bool _353 = _349 || _351;
        bool _355 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _357 = _353 || _355;
        float _359 = abs(_293);
        bool _361 = _359 == as_type<float>(0x7f800000u /* inf */);
        float _363 = abs(_293);
        bool _365 = _363 == as_type<float>(0x7f800000u /* inf */);
        bool _367 = !_357;
        bool _369 = _365 && _367;
        if (_369)
        {
            bool _371 = as_type<int>(_293) >= 0;
            _325 = _371 ? (-1) : 0;
        }
        int _373 = _325;
        if (_369)
        {
            _331 = 1075235812;
        }
        int _375 = _331;
        int _377 = _375;
        if (_369)
        {
            int _379 = ~_373;
            int _381 = (_379 != 0) ? _375 : 1061752795;
            _377 = _381;
        }
        int _383 = _377;
        if (_369)
        {
            int _385 = int(0x80000000) & as_type<int>(_289);
            int _387 = _383 | _385;
            _343 = as_type<float>(_387);
        }
        float _389 = _343;
        bool _391 = !_357;
        bool _393 = _391 && _361;
        _345 = _389;
        if (!_393)
        {
            float _395 = abs(_289);
            float _397 = abs(_293);
            float _399 = precise::max(_395, _397);
            float _401 = abs(_289);
            float _403 = abs(_293);
            float _405 = _401 + _403;
            float _407 = abs(_289);
            float _409 = abs(_293);
            float _411 = precise::min(_407, _409);
            float _413 = 1.0 / _399;
            float _415 = abs(_289);
            float _417 = abs(_293);
            bool _419 = _415 > _417;
            bool _421 = as_type<int>(_293) >= 0;
            bool _423 = _405 > as_type<float>(0x7f800000u /* inf */);
            bool _425 = isnan(_405);
            bool _427 = _423 || _425;
            bool _429 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _431 = _427 || _429;
            int _433 = as_type<int>(_289) & int(0x80000000);
            float _435 = _411 * _413;
            float _437 = _435 * _435;
            float _439 = _437 + 11.33538818359375;
            float _441 = fma(_437, _439, 28.84246826171875);
            float _443 = fma(_437, _441, 19.6966705322265625);
            float _445 = fma(_437, -0.82336294651031494140625, -5.674867153167724609375);
            float _447 = fma(_437, _445, -6.565555095672607421875);
            float _449 = 1.0 / _443;
            float _451 = _437 * _447;
            float _453 = _435 * _451;
            float _455 = fma(_453, _449, _435);
            float _457 = _455;
            _345 = _405;
            if (_419)
            {
                float _459 = -_455;
                float _461 = _459 + 1.57079637050628662109375;
                _457 = _461;
            }
            float _463 = _457;
            int _465 = as_type<int>(_463);
            if (!_421)
            {
                float _467 = -_463;
                float _469 = _467 + 3.1415927410125732421875;
                _465 = as_type<int>(_469);
            }
            int _471 = _465;
            if (!_431)
            {
                int _473 = _433 | _471;
                _345 = as_type<float>(_473);
            }
        }
    }
    float _475 = _345;
    float _477 = _123 * _123;
    float _479 = _127 * _127;
    float _481 = -(*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _483 = (*spvDescriptorSet0.fp_c9)._m0[126].w + _481;
    float _485 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _487 = (*spvDescriptorSet0.fp_c9)._m0[124].w + _485;
    float _489 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _491 = _489 + (*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _493 = -(*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _495 = (*spvDescriptorSet0.fp_c9)._m0[128].w + _493;
    float _497 = -(*spvDescriptorSet0.fp_c9)._m0[126].w;
    float _499 = _497 + (*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _501 = 1.0 / _487;
    float _503 = fma(_475, 0.15915493667125701904296875, 0.5);
    float _505 = precise::clamp(_503, 0.0, 1.0);
    float _507 = -(*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _509 = _505 + _507;
    float _511 = -(*spvDescriptorSet0.fp_c9)._m0[126].w;
    float _513 = _505 + _511;
    float _515 = 1.0 / _483;
    float _517 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _519 = _505 + _517;
    bool _521 = _505 >= (*spvDescriptorSet0.fp_c9)._m0[126].w;
    bool _523 = isnan(_505);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.fp_c9)._m0[126].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    bool _533 = _505 >= (*spvDescriptorSet0.fp_c9)._m0[124].w;
    bool _535 = isnan(_505);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.fp_c9)._m0[124].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = -_531;
    float _547 = _545 + 1.0;
    float _549 = 1.0 / _495;
    float _551 = _519 * _501;
    float _553 = -(*spvDescriptorSet0.fp_c9)._m0[127].w;
    float _555 = _505 + _553;
    float _557 = -_543;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.fp_c9)._m0[123].x;
    float _563 = (*spvDescriptorSet0.fp_c9)._m0[124].x + _561;
    float _565 = 1.0 / _491;
    float _567 = _509 * _515;
    float _569 = fma(_563, _551, (*spvDescriptorSet0.fp_c9)._m0[123].x);
    float _571 = -(*spvDescriptorSet0.fp_c9)._m0[127].z;
    float _573 = (*spvDescriptorSet0.fp_c9)._m0[128].z + _571;
    float _575 = -(*spvDescriptorSet0.fp_c9)._m0[123].z;
    float _577 = (*spvDescriptorSet0.fp_c9)._m0[124].z + _575;
    float _579 = 1.0 / _499;
    float _581 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _583 = _505 + _581;
    float _585 = _555 * _549;
    float _587 = -(*spvDescriptorSet0.fp_c9)._m0[124].x;
    float _589 = _587 + (*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _591 = -(*spvDescriptorSet0.fp_c9)._m0[124].z;
    float _593 = _591 + (*spvDescriptorSet0.fp_c9)._m0[125].z;
    float _595 = fma(_577, _551, (*spvDescriptorSet0.fp_c9)._m0[123].z);
    float _597 = -(*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _599 = (*spvDescriptorSet0.fp_c9)._m0[126].x + _597;
    float _601 = _583 * _565;
    float _603 = -(*spvDescriptorSet0.fp_c9)._m0[125].y;
    float _605 = (*spvDescriptorSet0.fp_c9)._m0[126].y + _603;
    float _607 = fma(_599, _567, (*spvDescriptorSet0.fp_c9)._m0[125].x);
    float _609 = fma(_589, _601, (*spvDescriptorSet0.fp_c9)._m0[124].x);
    float _611 = fma(_593, _601, (*spvDescriptorSet0.fp_c9)._m0[124].z);
    float _613 = -(*spvDescriptorSet0.fp_c9)._m0[123].y;
    float _615 = (*spvDescriptorSet0.fp_c9)._m0[124].y + _613;
    float _617 = -(*spvDescriptorSet0.fp_c9)._m0[124].y;
    float _619 = _617 + (*spvDescriptorSet0.fp_c9)._m0[125].y;
    float _621 = _513 * _579;
    float _623 = -(*spvDescriptorSet0.fp_c9)._m0[125].z;
    float _625 = (*spvDescriptorSet0.fp_c9)._m0[126].z + _623;
    float _627 = fma(_615, _551, (*spvDescriptorSet0.fp_c9)._m0[123].y);
    bool _629 = _505 >= (*spvDescriptorSet0.fp_c9)._m0[125].w;
    bool _631 = isnan(_505);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.fp_c9)._m0[125].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = fma(_619, _601, (*spvDescriptorSet0.fp_c9)._m0[124].y);
    float _643 = fma(_605, _567, (*spvDescriptorSet0.fp_c9)._m0[125].y);
    float _645 = fma(_625, _567, (*spvDescriptorSet0.fp_c9)._m0[125].z);
    float _647 = -(*spvDescriptorSet0.fp_c9)._m0[126].y;
    float _649 = _647 + (*spvDescriptorSet0.fp_c9)._m0[127].y;
    float _651 = _639 * _547;
    float _653 = -(*spvDescriptorSet0.fp_c9)._m0[126].x;
    float _655 = _653 + (*spvDescriptorSet0.fp_c9)._m0[127].x;
    float _657 = -_639;
    float _659 = _657 + 1.0;
    bool _661 = _505 >= (*spvDescriptorSet0.fp_c9)._m0[123].w;
    bool _663 = isnan(_505);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.fp_c9)._m0[123].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = fma(_649, _621, (*spvDescriptorSet0.fp_c9)._m0[126].y);
    bool _675 = _505 >= (*spvDescriptorSet0.fp_c9)._m0[127].w;
    bool _677 = isnan(_505);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.fp_c9)._m0[127].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = _543 * _659;
    float _689 = -(*spvDescriptorSet0.fp_c9)._m0[126].z;
    float _691 = _689 + (*spvDescriptorSet0.fp_c9)._m0[127].z;
    float _693 = _671 * _559;
    float _695 = fma(_655, _621, (*spvDescriptorSet0.fp_c9)._m0[126].x);
    float _697 = -_685;
    float _699 = _697 + 1.0;
    float _701 = in.m_39.z;
    float _703 = gl_FragCoord.w;
    float _705 = _701 * _703;
    float _707 = _627 * _693;
    float _709 = _595 * _693;
    float _711 = in.m_39.x;
    float _713 = gl_FragCoord.w;
    float _715 = _711 * _713;
    float _717 = in.m_39.y;
    float _719 = gl_FragCoord.w;
    float _721 = _717 * _719;
    float _723 = fma(_691, _621, (*spvDescriptorSet0.fp_c9)._m0[126].z);
    float _725 = _569 * _693;
    float _727 = -_671;
    float _729 = _727 + 1.0;
    float _731 = _531 * _699;
    float _733 = fma(_729, (*spvDescriptorSet0.fp_c9)._m0[123].x, _725);
    float _735 = fma(_729, (*spvDescriptorSet0.fp_c9)._m0[123].y, _707);
    float _737 = fma(_729, (*spvDescriptorSet0.fp_c9)._m0[123].z, _709);
    bool _739 = _505 >= (*spvDescriptorSet0.fp_c9)._m0[128].w;
    bool _741 = isnan(_505);
    bool _743 = _739 || _741;
    bool _745 = isnan((*spvDescriptorSet0.fp_c9)._m0[128].w);
    bool _747 = _743 || _745;
    float _749 = float(_747);
    float _751 = fma(_609, _687, _733);
    float _753 = fma(_641, _687, _735);
    float _755 = fma(_611, _687, _737);
    float _757 = -(*spvDescriptorSet0.fp_c9)._m0[127].x;
    float _759 = (*spvDescriptorSet0.fp_c9)._m0[128].x + _757;
    float _761 = -(*spvDescriptorSet0.fp_c9)._m0[127].y;
    float _763 = (*spvDescriptorSet0.fp_c9)._m0[128].y + _761;
    float _765 = -_749;
    float _767 = _765 + 1.0;
    float _769 = fma(_607, _651, _751);
    float _771 = fma(_643, _651, _753);
    float _773 = fma(_645, _651, _755);
    float _775 = fma(_759, _585, (*spvDescriptorSet0.fp_c9)._m0[127].x);
    float _777 = fma(_763, _585, (*spvDescriptorSet0.fp_c9)._m0[127].y);
    float _779 = fma(_573, _585, (*spvDescriptorSet0.fp_c9)._m0[127].z);
    float _781 = _685 * _767;
    float _783 = fma(_695, _731, _769);
    float _785 = fma(_673, _731, _771);
    float _787 = fma(_723, _731, _773);
    float _789 = fma(_775, _781, _783);
    float _791 = fma(_777, _781, _785);
    float _793 = fma(_779, _781, _787);
    float _795 = _67 * _715;
    float _797 = _67 * _721;
    float _799 = _67 * _705;
    float _801 = fma(_749, (*spvDescriptorSet0.fp_c9)._m0[128].x, _789);
    float _803 = fma(_749, (*spvDescriptorSet0.fp_c9)._m0[128].y, _791);
    float _805 = fma(_749, (*spvDescriptorSet0.fp_c9)._m0[128].z, _793);
    float _807 = _125 * _125;
    float _809 = -_801;
    float _811 = _809 + _795;
    float _813 = -_803;
    float _815 = _813 + _797;
    float _817 = -_805;
    float _819 = _817 + _799;
    float _821 = fma(_477, _811, _801);
    float _823 = fma(_807, _815, _803);
    float _825 = fma(_479, _819, _805);
    if (!_193)
    {
        out.m_46.x = _821;
        out.m_46.y = _823;
        out.m_46.z = _825;
        out.m_46.w = _181;
        return out;
    }
    float _827 = 0.0 + _183;
    float _829 = precise::clamp(_827, 0.0, 1.0);
    out.m_46.x = _821;
    out.m_46.y = _823;
    out.m_46.z = _825;
    out.m_46.w = _829;
    return out;
}

