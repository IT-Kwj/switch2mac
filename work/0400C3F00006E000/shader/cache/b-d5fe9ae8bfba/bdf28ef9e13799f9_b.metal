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
    constant _16* vp_c4 [[id(0)]];
    constant _16* vp_c3 [[id(1)]];
    texture2d<float> vp_t_tcb_8 [[id(2)]];
    sampler vp_t_tcb_8Smplr [[id(3)]];
    sampler vp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_42 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_36 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_34 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
    float4 m_32 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_29 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_29.y;
    float _64 = in.m_29.z;
    float _66 = in.m_29.x;
    bool _70 = _62 >= 0.100000001490116119384765625;
    bool _72 = isnan(_62);
    bool _74 = _70 || _72;
    bool _76 = isnan(0.100000001490116119384765625);
    bool _78 = _74 || _76;
    float _80 = _62 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _82 = _62 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _84 = fma(_66, (*spvDescriptorSet0.vp_c4)._m0[32].x, _80);
    float _86 = fma(_66, (*spvDescriptorSet0.vp_c4)._m0[33].x, _82);
    float _88 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[32].z, _84);
    float _90 = 0.0;
    if (_78)
    {
        _90 = _62;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_78)
    {
        float _96 = _62 + (-0.007000000216066837310791015625);
        _94 = _96;
    }
    float _98 = _94;
    float _100 = 0.0;
    if (_78)
    {
        _100 = _64;
    }
    float _102 = _100;
    float _104 = _62 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _106 = _102;
    if (!_78)
    {
        float _108 = _64 * 1.0499999523162841796875;
        _106 = _108;
    }
    float _110 = _106;
    float _112 = 0.0;
    if (_78)
    {
        _112 = _66;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_78)
    {
        float _118 = _66 * 1.0499999523162841796875;
        _116 = _118;
    }
    float _120 = _116;
    float _122 = fma(_66, (*spvDescriptorSet0.vp_c4)._m0[34].x, _104);
    float _124 = _110 * _110;
    float _126 = _98 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _128 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[33].z, _86);
    float _130 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[34].z, _122);
    float _132 = fma(_120, _120, _124);
    float _134 = _98 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _136 = fma(_120, (*spvDescriptorSet0.vp_c3)._m0[5].x, _126);
    float _138 = _98 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _140 = _98 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _142 = fma(_120, (*spvDescriptorSet0.vp_c3)._m0[4].x, _134);
    float _144 = sqrt(_132);
    float _146 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[5].z, _136);
    float _148 = fma(_120, (*spvDescriptorSet0.vp_c3)._m0[7].x, _140);
    float _150 = fma(_120, (*spvDescriptorSet0.vp_c3)._m0[6].x, _138);
    float _152 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[4].z, _142);
    float _154 = _146 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _156 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[7].z, _148);
    float _158 = _128 * _128;
    float _160 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[6].z, _150);
    float _162 = _152 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _164 = _154 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _166 = fma(_88, _88, _158);
    float _168 = _160 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _170 = _156 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _172 = fma(_162, (*spvDescriptorSet0.vp_c3)._m0[11].x, _164);
    float _174 = fma(_130, _130, _166);
    bool _176 = _144 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _178 = isnan(_144);
    bool _180 = _176 || _178;
    bool _182 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _184 = _180 || _182;
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[11].z, _172);
    float _188 = rsqrt(_174);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[11].w, _186);
    float _192 = 0.0;
    if (_184)
    {
        _192 = _190;
    }
    float _194 = _192;
    float _196 = _194;
    if (!_184)
    {
        _196 = 0.0;
    }
    float _198 = _196;
    float _200 = -(*spvDescriptorSet0.vp_c4)._m0[40].y;
    float _202 = fma(_198, (*spvDescriptorSet0.vp_c4)._m0[40].x, _200);
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _88 * _188;
    float _208 = _128 * _188;
    float _210 = _130 * _188;
    float _212 = -_204;
    float _214 = _212 + 1.0;
    float _216 = _206 * (*spvDescriptorSet0.vp_c4)._m0[42].x;
    float _218 = abs(_214);
    float _220 = log2(_218);
    float _222 = -_208;
    float _224 = -_216;
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c4)._m0[42].y, _224);
    float _228 = -_210;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c4)._m0[42].z, _226);
    float _232 = fma(_230, -0.5, 0.5);
    float _234 = fma(_230, 0.5, 0.5);
    float _236 = fma(_234, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _238 = sqrt(_232);
    float _240 = _220 * (*spvDescriptorSet0.vp_c4)._m0[41].y;
    float _242 = fma(_234, _236, -0.212114393711090087890625);
    float _244 = fma(_234, _242, 1.570728778839111328125);
    float _246 = exp2(_240);
    float _248 = _238 * 0.636619746685028076171875;
    float _250 = -_244;
    float _252 = fma(_248, _250, 1.0);
    float _254 = fma(_246, 0.5, 0.5);
    float2 _1043 = float2(_252, _254);
    float3 _258 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1043, float2(0.0), isnan(_1043)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1043, float2(0.0), isnan(_1043)), level(0.0)).xyz;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    float _266 = _120 + (-0.5);
    float _268 = _110 + (-0.5);
    bool _270 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _272 = isnan(0.0);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _278 = _274 || _276;
    out.m_32.x = _208;
    float _280 = _266 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _282 = _268 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _284 = _280 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _286 = _282 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _288 = _220 * (*spvDescriptorSet0.vp_c4)._m0[41].x;
    float _290 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _292 = fma(_284, 10.0, _290);
    float _294 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _296 = fma(2.0, _294, 0.5);
    float _298 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _300 = 0.0;
    if (_278)
    {
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _300 = _302;
    }
    float _304 = _300;
    float _306 = _292 * 0.15915493667125701904296875;
    float _308 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _310 = fma(_286, 10.0, _308);
    float _312 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[5].w, _298);
    float _314 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _316 = fma(2.0, _314, 0.5);
    float _318 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _320 = _310 * 0.15915493667125701904296875;
    float _322 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _324 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _326 = fma(_316, (*spvDescriptorSet0.vp_c4)._m0[5].w, _318);
    float _328 = _154 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _330 = _322 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _332 = _306 * 6.283185482025146484375;
    float _334 = sin(_332);
    float _336 = _324 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _338 = _154 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _340 = _154 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _342 = fma(_162, (*spvDescriptorSet0.vp_c3)._m0[10].x, _328);
    bool _344 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _346 = isnan(0.0);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _352 = _348 || _350;
    float _354 = fma(_162, (*spvDescriptorSet0.vp_c3)._m0[8].x, _338);
    float _356 = fma(_162, (*spvDescriptorSet0.vp_c3)._m0[9].x, _340);
    float _358 = _320 * 6.283185482025146484375;
    float _360 = sin(_358);
    float _362 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[10].z, _342);
    float _364 = _338;
    int _367 = as_type<int>(_312);
    int _369 = as_type<int>(_330);
    if (_278)
    {
        float _371 = _144 * _304;
        float _373 = precise::clamp(_371, 0.0, 1.0);
        _364 = _373;
    }
    float _375 = _364;
    out.m_34.x = _312;
    out.m_34.y = _326;
    out.m_34.z = _330;
    out.m_34.w = _336;
    float _377 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[8].z, _354);
    float _379 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[9].z, _356);
    float _381 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[10].w, _362);
    float _383 = _375;
    if (_278)
    {
        float _385 = -_375;
        float _387 = _385 + 1.0;
        _383 = _387;
    }
    float _389 = _383;
    float _391 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[8].w, _377);
    float _393 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[9].w, _379);
    float _395 = fma(_334, 0.0350000001490116119384765625, _284);
    float _397 = exp2(_288);
    int _399 = as_type<int>(_389);
    if (_278)
    {
        float _401 = _389 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _399 = as_type<int>(_401);
    }
    int _403 = _399;
    out.m_36.x = 0.0;
    bool _405 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _413 = _409 || _411;
    float _415 = fma(_360, -0.01750000007450580596923828125, _286);
    if (_278)
    {
        out.m_36.x = as_type<float>(_403);
    }
    bool _417 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _425 = _421 || _423;
    bool _427 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _429 = isnan(0.0);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _435 = _431 || _433;
    float _437 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _439 = fma(_437, (*spvDescriptorSet0.vp_c4)._m0[45].y, _381);
    out.m_38.x = _395;
    out.m_38.y = _415;
    float _441 = 1.0;
    if (!_352)
    {
        _367 = 1065353216;
    }
    int _443 = _367;
    out.gl_Position.x = _391;
    out.gl_Position.y = _393;
    out.gl_Position.z = _439;
    out.gl_Position.w = _190;
    out.m_40.x = 1.0;
    bool _445 = !_352;
    int _447 = _443;
    int _449 = _443;
    if (!_445)
    {
        float _451 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _453 = _110 + _451;
        float _455 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _457 = _120 + _455;
        float _459 = _453 * _453;
        float _461 = fma(_457, _457, _459);
        float _463 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _465 = sqrt(_461);
        bool _467 = _465 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _469 = isnan(_465);
        bool _471 = _467 || _469;
        bool _473 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _475 = _471 || _473;
        float _477 = _465 * _463;
        float _479 = _477;
        if (!_475)
        {
            float _481 = -_477;
            float _483 = _481 + 1.0;
            _479 = _483;
        }
        float _485 = _479;
        float _487 = _485;
        if (_475)
        {
            _447 = 1065353216;
        }
        int _489 = _447;
        int _491 = _489;
        if (!_475)
        {
            float _493 = _485 * _485;
            _487 = _493;
        }
        float _495 = _487;
        if (!_475)
        {
            float _497 = fma(_495, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _491 = as_type<int>(_497);
        }
        int _499 = _491;
        _449 = _499;
        if (!_475)
        {
            out.m_40.x = as_type<float>(_499);
        }
    }
    int _501 = _449;
    float _503 = -_397;
    float _505 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[41].z, (*spvDescriptorSet0.vp_c4)._m0[41].z);
    float _507 = precise::clamp(_505, 0.0, 1.0);
    float _509 = _391 + _198;
    if (!_425)
    {
        _369 = _501;
    }
    int _511 = _369;
    bool _513 = !_425;
    int _515 = _511;
    float _517 = as_type<float>(_511);
    if (!_513)
    {
        float _519 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _521 = _110 + _519;
        float _523 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _525 = _120 + _523;
        float _527 = _521 * _521;
        float _529 = fma(_525, _525, _527);
        float _531 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _533 = sqrt(_529);
        bool _535 = _533 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _537 = isnan(_533);
        bool _539 = _535 || _537;
        bool _541 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _543 = _539 || _541;
        float _545 = _533 * _531;
        float _547 = _545;
        if (!_543)
        {
            float _549 = -_545;
            float _551 = _549 + 1.0;
            _547 = _551;
        }
        float _553 = _547;
        if (_543)
        {
            _515 = _501;
        }
        int _555 = _515;
        int _557 = _555;
        if (!_543)
        {
            float _559 = _553 * _553;
            _441 = _559;
        }
        float _561 = _441;
        if (!_543)
        {
            float _563 = fma(_561, (*spvDescriptorSet0.vp_c4)._m0[22].x, as_type<float>(_501));
            _557 = as_type<int>(_563);
        }
        int _565 = _557;
        _517 = as_type<float>(_565);
        if (!_543)
        {
            out.m_40.x = as_type<float>(_565);
        }
    }
    float _567 = _517;
    float _569 = _198 * 0.5;
    float _571 = _509 * 0.5;
    float _573 = _507 * (*spvDescriptorSet0.vp_c4)._m0[25].w;
    bool _575 = !_413;
    int _577 = as_type<int>(_567);
    float _579 = _567;
    if (!_575)
    {
        float _581 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _583 = _110 + _581;
        float _585 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _587 = _120 + _585;
        float _589 = _583 * _583;
        float _591 = fma(_587, _587, _589);
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _595 = sqrt(_591);
        bool _597 = _595 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _599 = isnan(_595);
        bool _601 = _597 || _599;
        bool _603 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _605 = _601 || _603;
        float _607 = _595 * _593;
        float _609 = _607;
        if (!_605)
        {
            float _611 = -_607;
            float _613 = _611 + 1.0;
            _609 = _613;
        }
        float _615 = _609;
        float _617 = _615;
        if (!_605)
        {
            float _619 = _615 * _615;
            _617 = _619;
        }
        float _621 = _617;
        if (!_605)
        {
            float _623 = fma(_621, (*spvDescriptorSet0.vp_c4)._m0[23].x, _567);
            _577 = as_type<int>(_623);
        }
        int _625 = _577;
        _579 = as_type<float>(_625);
        if (!_605)
        {
            out.m_40.x = as_type<float>(_625);
        }
    }
    float _627 = _579;
    bool _629 = !_435;
    if (!_629)
    {
        float _631 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
        float _633 = _110 + _631;
        float _635 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
        float _637 = _120 + _635;
        float _639 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
        float _641 = _633 * _633;
        float _643 = fma(_637, _637, _641);
        float _645 = sqrt(_643);
        bool _647 = _645 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
        bool _649 = isnan(_645);
        bool _651 = _647 || _649;
        bool _653 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
        bool _655 = _651 || _653;
        float _657 = _645 * _639;
        float _659 = _657;
        if (!_655)
        {
            float _661 = -_657;
            float _663 = _661 + 1.0;
            _659 = _663;
        }
        float _665 = _659;
        float _667 = _665;
        if (!_655)
        {
            float _669 = _665 * _665;
            _667 = _669;
        }
        float _671 = _667;
        int _673 = as_type<int>(_671);
        if (!_655)
        {
            float _675 = fma(_671, (*spvDescriptorSet0.vp_c4)._m0[24].x, _627);
            _673 = as_type<int>(_675);
        }
        int _677 = _673;
        if (!_655)
        {
            out.m_40.x = as_type<float>(_677);
        }
    }
    float _679 = fma(_393, -0.5, _569);
    float _681 = _260 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _683 = _262 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _685 = _264 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    out.m_42.x = _571;
    out.m_44.x = _573;
    out.m_42.y = _679;
    out.m_46.x = _198;
    out.m_42.w = _198;
    out.m_48.x = _681;
    out.m_48.y = _683;
    out.m_48.z = _685;
    if (!_184)
    {
        out.gl_Position.w = 0.0;
    }
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_29.y;
    float _64 = in.m_29.z;
    float _66 = in.m_29.x;
    bool _70 = _62 >= 0.100000001490116119384765625;
    bool _72 = isnan(_62);
    bool _74 = _70 || _72;
    bool _76 = isnan(0.100000001490116119384765625);
    bool _78 = _74 || _76;
    float _80 = _62 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _82 = _62 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _84 = fma(_66, (*spvDescriptorSet0.vp_c4)._m0[32].x, _80);
    float _86 = fma(_66, (*spvDescriptorSet0.vp_c4)._m0[33].x, _82);
    float _88 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[32].z, _84);
    float _90 = 0.0;
    if (_78)
    {
        _90 = _62;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_78)
    {
        float _96 = _62 + (-0.007000000216066837310791015625);
        _94 = _96;
    }
    float _98 = _94;
    float _100 = 0.0;
    if (_78)
    {
        _100 = _64;
    }
    float _102 = _100;
    float _104 = _62 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _106 = _102;
    if (!_78)
    {
        float _108 = _64 * 1.0499999523162841796875;
        _106 = _108;
    }
    float _110 = _106;
    float _112 = 0.0;
    if (_78)
    {
        _112 = _66;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_78)
    {
        float _118 = _66 * 1.0499999523162841796875;
        _116 = _118;
    }
    float _120 = _116;
    float _122 = fma(_66, (*spvDescriptorSet0.vp_c4)._m0[34].x, _104);
    float _124 = _110 * _110;
    float _126 = _98 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _128 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[33].z, _86);
    float _130 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[34].z, _122);
    float _132 = fma(_120, _120, _124);
    float _134 = _98 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _136 = fma(_120, (*spvDescriptorSet0.vp_c3)._m0[5].x, _126);
    float _138 = _98 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _140 = _98 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _142 = fma(_120, (*spvDescriptorSet0.vp_c3)._m0[4].x, _134);
    float _144 = sqrt(_132);
    float _146 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[5].z, _136);
    float _148 = fma(_120, (*spvDescriptorSet0.vp_c3)._m0[7].x, _140);
    float _150 = fma(_120, (*spvDescriptorSet0.vp_c3)._m0[6].x, _138);
    float _152 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[4].z, _142);
    float _154 = _146 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _156 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[7].z, _148);
    float _158 = _128 * _128;
    float _160 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[6].z, _150);
    float _162 = _152 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _164 = _154 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _166 = fma(_88, _88, _158);
    float _168 = _160 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _170 = _156 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _172 = fma(_162, (*spvDescriptorSet0.vp_c3)._m0[11].x, _164);
    float _174 = fma(_130, _130, _166);
    bool _176 = _144 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _178 = isnan(_144);
    bool _180 = _176 || _178;
    bool _182 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _184 = _180 || _182;
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[11].z, _172);
    float _188 = rsqrt(_174);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[11].w, _186);
    float _192 = 0.0;
    if (_184)
    {
        _192 = _190;
    }
    float _194 = _192;
    float _196 = _194;
    if (!_184)
    {
        _196 = 0.0;
    }
    float _198 = _196;
    float _200 = -(*spvDescriptorSet0.vp_c4)._m0[40].y;
    float _202 = fma(_198, (*spvDescriptorSet0.vp_c4)._m0[40].x, _200);
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _88 * _188;
    float _208 = _128 * _188;
    float _210 = _130 * _188;
    float _212 = -_204;
    float _214 = _212 + 1.0;
    float _216 = _206 * (*spvDescriptorSet0.vp_c4)._m0[42].x;
    float _218 = abs(_214);
    float _220 = log2(_218);
    float _222 = -_208;
    float _224 = -_216;
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c4)._m0[42].y, _224);
    float _228 = -_210;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c4)._m0[42].z, _226);
    float _232 = fma(_230, -0.5, 0.5);
    float _234 = fma(_230, 0.5, 0.5);
    float _236 = fma(_234, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _238 = sqrt(_232);
    float _240 = _220 * (*spvDescriptorSet0.vp_c4)._m0[41].y;
    float _242 = fma(_234, _236, -0.212114393711090087890625);
    float _244 = fma(_234, _242, 1.570728778839111328125);
    float _246 = exp2(_240);
    float _248 = _238 * 0.636619746685028076171875;
    float _250 = -_244;
    float _252 = fma(_248, _250, 1.0);
    float _254 = fma(_246, 0.5, 0.5);
    float2 _1043 = float2(_252, _254);
    float3 _258 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1043, float2(0.0), isnan(_1043)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1043, float2(0.0), isnan(_1043)), level(0.0)).xyz;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    float _266 = _120 + (-0.5);
    float _268 = _110 + (-0.5);
    bool _270 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _272 = isnan(0.0);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _278 = _274 || _276;
    out.m_32.x = _208;
    float _280 = _266 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _282 = _268 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _284 = _280 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _286 = _282 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _288 = _220 * (*spvDescriptorSet0.vp_c4)._m0[41].x;
    float _290 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _292 = fma(_284, 10.0, _290);
    float _294 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _296 = fma(2.0, _294, 0.5);
    float _298 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _300 = 0.0;
    if (_278)
    {
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _300 = _302;
    }
    float _304 = _300;
    float _306 = _292 * 0.15915493667125701904296875;
    float _308 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _310 = fma(_286, 10.0, _308);
    float _312 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[5].w, _298);
    float _314 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _316 = fma(2.0, _314, 0.5);
    float _318 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _320 = _310 * 0.15915493667125701904296875;
    float _322 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _324 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _326 = fma(_316, (*spvDescriptorSet0.vp_c4)._m0[5].w, _318);
    float _328 = _154 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _330 = _322 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _332 = _306 * 6.283185482025146484375;
    float _334 = sin(_332);
    float _336 = _324 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _338 = _154 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _340 = _154 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _342 = fma(_162, (*spvDescriptorSet0.vp_c3)._m0[10].x, _328);
    bool _344 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _346 = isnan(0.0);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _352 = _348 || _350;
    float _354 = fma(_162, (*spvDescriptorSet0.vp_c3)._m0[8].x, _338);
    float _356 = fma(_162, (*spvDescriptorSet0.vp_c3)._m0[9].x, _340);
    float _358 = _320 * 6.283185482025146484375;
    float _360 = sin(_358);
    float _362 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[10].z, _342);
    float _364 = _338;
    int _367 = as_type<int>(_312);
    int _369 = as_type<int>(_330);
    if (_278)
    {
        float _371 = _144 * _304;
        float _373 = precise::clamp(_371, 0.0, 1.0);
        _364 = _373;
    }
    float _375 = _364;
    out.m_34.x = _312;
    out.m_34.y = _326;
    out.m_34.z = _330;
    out.m_34.w = _336;
    float _377 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[8].z, _354);
    float _379 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[9].z, _356);
    float _381 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[10].w, _362);
    float _383 = _375;
    if (_278)
    {
        float _385 = -_375;
        float _387 = _385 + 1.0;
        _383 = _387;
    }
    float _389 = _383;
    float _391 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[8].w, _377);
    float _393 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[9].w, _379);
    float _395 = fma(_334, 0.0350000001490116119384765625, _284);
    float _397 = exp2(_288);
    int _399 = as_type<int>(_389);
    if (_278)
    {
        float _401 = _389 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _399 = as_type<int>(_401);
    }
    int _403 = _399;
    out.m_36.x = 0.0;
    bool _405 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _413 = _409 || _411;
    float _415 = fma(_360, -0.01750000007450580596923828125, _286);
    if (_278)
    {
        out.m_36.x = as_type<float>(_403);
    }
    bool _417 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _425 = _421 || _423;
    bool _427 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _429 = isnan(0.0);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _435 = _431 || _433;
    float _437 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _439 = fma(_437, (*spvDescriptorSet0.vp_c4)._m0[45].y, _381);
    out.m_38.x = _395;
    out.m_38.y = _415;
    float _441 = 1.0;
    if (!_352)
    {
        _367 = 1065353216;
    }
    int _443 = _367;
    out.gl_Position.x = _391;
    out.gl_Position.y = _393;
    out.gl_Position.z = _439;
    out.gl_Position.w = _190;
    out.m_40.x = 1.0;
    bool _445 = !_352;
    int _447 = _443;
    int _449 = _443;
    if (!_445)
    {
        float _451 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _453 = _110 + _451;
        float _455 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _457 = _120 + _455;
        float _459 = _453 * _453;
        float _461 = fma(_457, _457, _459);
        float _463 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _465 = sqrt(_461);
        bool _467 = _465 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _469 = isnan(_465);
        bool _471 = _467 || _469;
        bool _473 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _475 = _471 || _473;
        float _477 = _465 * _463;
        float _479 = _477;
        if (!_475)
        {
            float _481 = -_477;
            float _483 = _481 + 1.0;
            _479 = _483;
        }
        float _485 = _479;
        float _487 = _485;
        if (_475)
        {
            _447 = 1065353216;
        }
        int _489 = _447;
        int _491 = _489;
        if (!_475)
        {
            float _493 = _485 * _485;
            _487 = _493;
        }
        float _495 = _487;
        if (!_475)
        {
            float _497 = fma(_495, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _491 = as_type<int>(_497);
        }
        int _499 = _491;
        _449 = _499;
        if (!_475)
        {
            out.m_40.x = as_type<float>(_499);
        }
    }
    int _501 = _449;
    float _503 = -_397;
    float _505 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[41].z, (*spvDescriptorSet0.vp_c4)._m0[41].z);
    float _507 = precise::clamp(_505, 0.0, 1.0);
    float _509 = _391 + _198;
    if (!_425)
    {
        _369 = _501;
    }
    int _511 = _369;
    bool _513 = !_425;
    int _515 = _511;
    float _517 = as_type<float>(_511);
    if (!_513)
    {
        float _519 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _521 = _110 + _519;
        float _523 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _525 = _120 + _523;
        float _527 = _521 * _521;
        float _529 = fma(_525, _525, _527);
        float _531 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _533 = sqrt(_529);
        bool _535 = _533 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _537 = isnan(_533);
        bool _539 = _535 || _537;
        bool _541 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _543 = _539 || _541;
        float _545 = _533 * _531;
        float _547 = _545;
        if (!_543)
        {
            float _549 = -_545;
            float _551 = _549 + 1.0;
            _547 = _551;
        }
        float _553 = _547;
        if (_543)
        {
            _515 = _501;
        }
        int _555 = _515;
        int _557 = _555;
        if (!_543)
        {
            float _559 = _553 * _553;
            _441 = _559;
        }
        float _561 = _441;
        if (!_543)
        {
            float _563 = fma(_561, (*spvDescriptorSet0.vp_c4)._m0[22].x, as_type<float>(_501));
            _557 = as_type<int>(_563);
        }
        int _565 = _557;
        _517 = as_type<float>(_565);
        if (!_543)
        {
            out.m_40.x = as_type<float>(_565);
        }
    }
    float _567 = _517;
    float _569 = _198 * 0.5;
    float _571 = _509 * 0.5;
    float _573 = _507 * (*spvDescriptorSet0.vp_c4)._m0[25].w;
    bool _575 = !_413;
    int _577 = as_type<int>(_567);
    float _579 = _567;
    if (!_575)
    {
        float _581 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _583 = _110 + _581;
        float _585 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _587 = _120 + _585;
        float _589 = _583 * _583;
        float _591 = fma(_587, _587, _589);
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _595 = sqrt(_591);
        bool _597 = _595 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _599 = isnan(_595);
        bool _601 = _597 || _599;
        bool _603 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _605 = _601 || _603;
        float _607 = _595 * _593;
        float _609 = _607;
        if (!_605)
        {
            float _611 = -_607;
            float _613 = _611 + 1.0;
            _609 = _613;
        }
        float _615 = _609;
        float _617 = _615;
        if (!_605)
        {
            float _619 = _615 * _615;
            _617 = _619;
        }
        float _621 = _617;
        if (!_605)
        {
            float _623 = fma(_621, (*spvDescriptorSet0.vp_c4)._m0[23].x, _567);
            _577 = as_type<int>(_623);
        }
        int _625 = _577;
        _579 = as_type<float>(_625);
        if (!_605)
        {
            out.m_40.x = as_type<float>(_625);
        }
    }
    float _627 = _579;
    bool _629 = !_435;
    if (!_629)
    {
        float _631 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
        float _633 = _110 + _631;
        float _635 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
        float _637 = _120 + _635;
        float _639 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
        float _641 = _633 * _633;
        float _643 = fma(_637, _637, _641);
        float _645 = sqrt(_643);
        bool _647 = _645 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
        bool _649 = isnan(_645);
        bool _651 = _647 || _649;
        bool _653 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
        bool _655 = _651 || _653;
        float _657 = _645 * _639;
        float _659 = _657;
        if (!_655)
        {
            float _661 = -_657;
            float _663 = _661 + 1.0;
            _659 = _663;
        }
        float _665 = _659;
        float _667 = _665;
        if (!_655)
        {
            float _669 = _665 * _665;
            _667 = _669;
        }
        float _671 = _667;
        int _673 = as_type<int>(_671);
        if (!_655)
        {
            float _675 = fma(_671, (*spvDescriptorSet0.vp_c4)._m0[24].x, _627);
            _673 = as_type<int>(_675);
        }
        int _677 = _673;
        if (!_655)
        {
            out.m_40.x = as_type<float>(_677);
        }
    }
    float _679 = fma(_393, -0.5, _569);
    float _681 = _260 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _683 = _262 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _685 = _264 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    out.m_42.x = _571;
    out.m_44.x = _573;
    out.m_42.y = _679;
    out.m_46.x = _198;
    out.m_42.w = _198;
    out.m_48.x = _681;
    out.m_48.y = _683;
    out.m_48.z = _685;
    if (!_184)
    {
        out.gl_Position.w = 0.0;
    }
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_32 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _62 = in.m_29.y;
    float _64 = in.m_29.z;
    float _66 = in.m_29.x;
    bool _70 = _62 >= 0.100000001490116119384765625;
    bool _72 = isnan(_62);
    bool _74 = _70 || _72;
    bool _76 = isnan(0.100000001490116119384765625);
    bool _78 = _74 || _76;
    float _80 = _62 * (*spvDescriptorSet0.vp_c4)._m0[32].y;
    float _82 = _62 * (*spvDescriptorSet0.vp_c4)._m0[33].y;
    float _84 = fma(_66, (*spvDescriptorSet0.vp_c4)._m0[32].x, _80);
    float _86 = fma(_66, (*spvDescriptorSet0.vp_c4)._m0[33].x, _82);
    float _88 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[32].z, _84);
    float _90 = 0.0;
    if (_78)
    {
        _90 = _62;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_78)
    {
        float _96 = _62 + (-0.007000000216066837310791015625);
        _94 = _96;
    }
    float _98 = _94;
    float _100 = 0.0;
    if (_78)
    {
        _100 = _64;
    }
    float _102 = _100;
    float _104 = _62 * (*spvDescriptorSet0.vp_c4)._m0[34].y;
    float _106 = _102;
    if (!_78)
    {
        float _108 = _64 * 1.0499999523162841796875;
        _106 = _108;
    }
    float _110 = _106;
    float _112 = 0.0;
    if (_78)
    {
        _112 = _66;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_78)
    {
        float _118 = _66 * 1.0499999523162841796875;
        _116 = _118;
    }
    float _120 = _116;
    float _122 = fma(_66, (*spvDescriptorSet0.vp_c4)._m0[34].x, _104);
    float _124 = _110 * _110;
    float _126 = _98 * (*spvDescriptorSet0.vp_c3)._m0[5].y;
    float _128 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[33].z, _86);
    float _130 = fma(_64, (*spvDescriptorSet0.vp_c4)._m0[34].z, _122);
    float _132 = fma(_120, _120, _124);
    float _134 = _98 * (*spvDescriptorSet0.vp_c3)._m0[4].y;
    float _136 = fma(_120, (*spvDescriptorSet0.vp_c3)._m0[5].x, _126);
    float _138 = _98 * (*spvDescriptorSet0.vp_c3)._m0[6].y;
    float _140 = _98 * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _142 = fma(_120, (*spvDescriptorSet0.vp_c3)._m0[4].x, _134);
    float _144 = sqrt(_132);
    float _146 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[5].z, _136);
    float _148 = fma(_120, (*spvDescriptorSet0.vp_c3)._m0[7].x, _140);
    float _150 = fma(_120, (*spvDescriptorSet0.vp_c3)._m0[6].x, _138);
    float _152 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[4].z, _142);
    float _154 = _146 + (*spvDescriptorSet0.vp_c3)._m0[5].w;
    float _156 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[7].z, _148);
    float _158 = _128 * _128;
    float _160 = fma(_110, (*spvDescriptorSet0.vp_c3)._m0[6].z, _150);
    float _162 = _152 + (*spvDescriptorSet0.vp_c3)._m0[4].w;
    float _164 = _154 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _166 = fma(_88, _88, _158);
    float _168 = _160 + (*spvDescriptorSet0.vp_c3)._m0[6].w;
    float _170 = _156 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _172 = fma(_162, (*spvDescriptorSet0.vp_c3)._m0[11].x, _164);
    float _174 = fma(_130, _130, _166);
    bool _176 = _144 >= (*spvDescriptorSet0.vp_c4)._m0[46].z;
    bool _178 = isnan(_144);
    bool _180 = _176 || _178;
    bool _182 = isnan((*spvDescriptorSet0.vp_c4)._m0[46].z);
    bool _184 = _180 || _182;
    float _186 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[11].z, _172);
    float _188 = rsqrt(_174);
    float _190 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[11].w, _186);
    float _192 = 0.0;
    if (_184)
    {
        _192 = _190;
    }
    float _194 = _192;
    float _196 = _194;
    if (!_184)
    {
        _196 = 0.0;
    }
    float _198 = _196;
    float _200 = -(*spvDescriptorSet0.vp_c4)._m0[40].y;
    float _202 = fma(_198, (*spvDescriptorSet0.vp_c4)._m0[40].x, _200);
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _88 * _188;
    float _208 = _128 * _188;
    float _210 = _130 * _188;
    float _212 = -_204;
    float _214 = _212 + 1.0;
    float _216 = _206 * (*spvDescriptorSet0.vp_c4)._m0[42].x;
    float _218 = abs(_214);
    float _220 = log2(_218);
    float _222 = -_208;
    float _224 = -_216;
    float _226 = fma(_222, (*spvDescriptorSet0.vp_c4)._m0[42].y, _224);
    float _228 = -_210;
    float _230 = fma(_228, (*spvDescriptorSet0.vp_c4)._m0[42].z, _226);
    float _232 = fma(_230, -0.5, 0.5);
    float _234 = fma(_230, 0.5, 0.5);
    float _236 = fma(_234, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _238 = sqrt(_232);
    float _240 = _220 * (*spvDescriptorSet0.vp_c4)._m0[41].y;
    float _242 = fma(_234, _236, -0.212114393711090087890625);
    float _244 = fma(_234, _242, 1.570728778839111328125);
    float _246 = exp2(_240);
    float _248 = _238 * 0.636619746685028076171875;
    float _250 = -_244;
    float _252 = fma(_248, _250, 1.0);
    float _254 = fma(_246, 0.5, 0.5);
    float2 _1043 = float2(_252, _254);
    float3 _258 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1043, float2(0.0), isnan(_1043)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1043, float2(0.0), isnan(_1043)), level(0.0)).xyz;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    float _266 = _120 + (-0.5);
    float _268 = _110 + (-0.5);
    bool _270 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[45].z;
    bool _272 = isnan(0.0);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c4)._m0[45].z);
    bool _278 = _274 || _276;
    out.m_32.x = _208;
    float _280 = _266 + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _282 = _268 + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _284 = _280 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _286 = _282 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _288 = _220 * (*spvDescriptorSet0.vp_c4)._m0[41].x;
    float _290 = -(*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _292 = fma(_284, 10.0, _290);
    float _294 = -(*spvDescriptorSet0.vp_c4)._m0[6].z;
    float _296 = fma(2.0, _294, 0.5);
    float _298 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _300 = 0.0;
    if (_278)
    {
        float _302 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[45].z;
        _300 = _302;
    }
    float _304 = _300;
    float _306 = _292 * 0.15915493667125701904296875;
    float _308 = -(*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _310 = fma(_286, 10.0, _308);
    float _312 = fma(_296, (*spvDescriptorSet0.vp_c4)._m0[5].w, _298);
    float _314 = -(*spvDescriptorSet0.vp_c4)._m0[6].w;
    float _316 = fma(2.0, _314, 0.5);
    float _318 = (*spvDescriptorSet0.vp_c4)._m0[5].w * (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _320 = _310 * 0.15915493667125701904296875;
    float _322 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].x;
    float _324 = (-0.5) + (*spvDescriptorSet0.vp_c4)._m0[6].y;
    float _326 = fma(_316, (*spvDescriptorSet0.vp_c4)._m0[5].w, _318);
    float _328 = _154 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _330 = _322 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _332 = _306 * 6.283185482025146484375;
    float _334 = sin(_332);
    float _336 = _324 * (*spvDescriptorSet0.vp_c4)._m0[5].w;
    float _338 = _154 * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _340 = _154 * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _342 = fma(_162, (*spvDescriptorSet0.vp_c3)._m0[10].x, _328);
    bool _344 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[17].x;
    bool _346 = isnan(0.0);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
    bool _352 = _348 || _350;
    float _354 = fma(_162, (*spvDescriptorSet0.vp_c3)._m0[8].x, _338);
    float _356 = fma(_162, (*spvDescriptorSet0.vp_c3)._m0[9].x, _340);
    float _358 = _320 * 6.283185482025146484375;
    float _360 = sin(_358);
    float _362 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[10].z, _342);
    float _364 = _338;
    int _367 = as_type<int>(_312);
    int _369 = as_type<int>(_330);
    if (_278)
    {
        float _371 = _144 * _304;
        float _373 = precise::clamp(_371, 0.0, 1.0);
        _364 = _373;
    }
    float _375 = _364;
    out.m_34.x = _312;
    out.m_34.y = _326;
    out.m_34.z = _330;
    out.m_34.w = _336;
    float _377 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[8].z, _354);
    float _379 = fma(_168, (*spvDescriptorSet0.vp_c3)._m0[9].z, _356);
    float _381 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[10].w, _362);
    float _383 = _375;
    if (_278)
    {
        float _385 = -_375;
        float _387 = _385 + 1.0;
        _383 = _387;
    }
    float _389 = _383;
    float _391 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[8].w, _377);
    float _393 = fma(_170, (*spvDescriptorSet0.vp_c3)._m0[9].w, _379);
    float _395 = fma(_334, 0.0350000001490116119384765625, _284);
    float _397 = exp2(_288);
    int _399 = as_type<int>(_389);
    if (_278)
    {
        float _401 = _389 * (*spvDescriptorSet0.vp_c4)._m0[45].w;
        _399 = as_type<int>(_401);
    }
    int _403 = _399;
    out.m_36.x = 0.0;
    bool _405 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[19].x;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
    bool _413 = _409 || _411;
    float _415 = fma(_360, -0.01750000007450580596923828125, _286);
    if (_278)
    {
        out.m_36.x = as_type<float>(_403);
    }
    bool _417 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[18].x;
    bool _419 = isnan(0.0);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
    bool _425 = _421 || _423;
    bool _427 = 0.0 != (*spvDescriptorSet0.vp_c4)._m0[20].x;
    bool _429 = isnan(0.0);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
    bool _435 = _431 || _433;
    float _437 = -(*spvDescriptorSet0.vp_c3)._m0[12].x;
    float _439 = fma(_437, (*spvDescriptorSet0.vp_c4)._m0[45].y, _381);
    out.m_38.x = _395;
    out.m_38.y = _415;
    float _441 = 1.0;
    if (!_352)
    {
        _367 = 1065353216;
    }
    int _443 = _367;
    out.gl_Position.x = _391;
    out.gl_Position.y = _393;
    out.gl_Position.z = _439;
    out.gl_Position.w = _190;
    out.m_40.x = 1.0;
    bool _445 = !_352;
    int _447 = _443;
    int _449 = _443;
    if (!_445)
    {
        float _451 = -(*spvDescriptorSet0.vp_c4)._m0[13].x;
        float _453 = _110 + _451;
        float _455 = -(*spvDescriptorSet0.vp_c4)._m0[9].x;
        float _457 = _120 + _455;
        float _459 = _453 * _453;
        float _461 = fma(_457, _457, _459);
        float _463 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[17].x;
        float _465 = sqrt(_461);
        bool _467 = _465 >= (*spvDescriptorSet0.vp_c4)._m0[17].x;
        bool _469 = isnan(_465);
        bool _471 = _467 || _469;
        bool _473 = isnan((*spvDescriptorSet0.vp_c4)._m0[17].x);
        bool _475 = _471 || _473;
        float _477 = _465 * _463;
        float _479 = _477;
        if (!_475)
        {
            float _481 = -_477;
            float _483 = _481 + 1.0;
            _479 = _483;
        }
        float _485 = _479;
        float _487 = _485;
        if (_475)
        {
            _447 = 1065353216;
        }
        int _489 = _447;
        int _491 = _489;
        if (!_475)
        {
            float _493 = _485 * _485;
            _487 = _493;
        }
        float _495 = _487;
        if (!_475)
        {
            float _497 = fma(_495, (*spvDescriptorSet0.vp_c4)._m0[21].x, 1.0);
            _491 = as_type<int>(_497);
        }
        int _499 = _491;
        _449 = _499;
        if (!_475)
        {
            out.m_40.x = as_type<float>(_499);
        }
    }
    int _501 = _449;
    float _503 = -_397;
    float _505 = fma(_503, (*spvDescriptorSet0.vp_c4)._m0[41].z, (*spvDescriptorSet0.vp_c4)._m0[41].z);
    float _507 = precise::clamp(_505, 0.0, 1.0);
    float _509 = _391 + _198;
    if (!_425)
    {
        _369 = _501;
    }
    int _511 = _369;
    bool _513 = !_425;
    int _515 = _511;
    float _517 = as_type<float>(_511);
    if (!_513)
    {
        float _519 = -(*spvDescriptorSet0.vp_c4)._m0[14].x;
        float _521 = _110 + _519;
        float _523 = -(*spvDescriptorSet0.vp_c4)._m0[10].x;
        float _525 = _120 + _523;
        float _527 = _521 * _521;
        float _529 = fma(_525, _525, _527);
        float _531 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[18].x;
        float _533 = sqrt(_529);
        bool _535 = _533 >= (*spvDescriptorSet0.vp_c4)._m0[18].x;
        bool _537 = isnan(_533);
        bool _539 = _535 || _537;
        bool _541 = isnan((*spvDescriptorSet0.vp_c4)._m0[18].x);
        bool _543 = _539 || _541;
        float _545 = _533 * _531;
        float _547 = _545;
        if (!_543)
        {
            float _549 = -_545;
            float _551 = _549 + 1.0;
            _547 = _551;
        }
        float _553 = _547;
        if (_543)
        {
            _515 = _501;
        }
        int _555 = _515;
        int _557 = _555;
        if (!_543)
        {
            float _559 = _553 * _553;
            _441 = _559;
        }
        float _561 = _441;
        if (!_543)
        {
            float _563 = fma(_561, (*spvDescriptorSet0.vp_c4)._m0[22].x, as_type<float>(_501));
            _557 = as_type<int>(_563);
        }
        int _565 = _557;
        _517 = as_type<float>(_565);
        if (!_543)
        {
            out.m_40.x = as_type<float>(_565);
        }
    }
    float _567 = _517;
    float _569 = _198 * 0.5;
    float _571 = _509 * 0.5;
    float _573 = _507 * (*spvDescriptorSet0.vp_c4)._m0[25].w;
    bool _575 = !_413;
    int _577 = as_type<int>(_567);
    float _579 = _567;
    if (!_575)
    {
        float _581 = -(*spvDescriptorSet0.vp_c4)._m0[15].x;
        float _583 = _110 + _581;
        float _585 = -(*spvDescriptorSet0.vp_c4)._m0[11].x;
        float _587 = _120 + _585;
        float _589 = _583 * _583;
        float _591 = fma(_587, _587, _589);
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[19].x;
        float _595 = sqrt(_591);
        bool _597 = _595 >= (*spvDescriptorSet0.vp_c4)._m0[19].x;
        bool _599 = isnan(_595);
        bool _601 = _597 || _599;
        bool _603 = isnan((*spvDescriptorSet0.vp_c4)._m0[19].x);
        bool _605 = _601 || _603;
        float _607 = _595 * _593;
        float _609 = _607;
        if (!_605)
        {
            float _611 = -_607;
            float _613 = _611 + 1.0;
            _609 = _613;
        }
        float _615 = _609;
        float _617 = _615;
        if (!_605)
        {
            float _619 = _615 * _615;
            _617 = _619;
        }
        float _621 = _617;
        if (!_605)
        {
            float _623 = fma(_621, (*spvDescriptorSet0.vp_c4)._m0[23].x, _567);
            _577 = as_type<int>(_623);
        }
        int _625 = _577;
        _579 = as_type<float>(_625);
        if (!_605)
        {
            out.m_40.x = as_type<float>(_625);
        }
    }
    float _627 = _579;
    bool _629 = !_435;
    if (!_629)
    {
        float _631 = -(*spvDescriptorSet0.vp_c4)._m0[16].x;
        float _633 = _110 + _631;
        float _635 = -(*spvDescriptorSet0.vp_c4)._m0[12].x;
        float _637 = _120 + _635;
        float _639 = 1.0 / (*spvDescriptorSet0.vp_c4)._m0[20].x;
        float _641 = _633 * _633;
        float _643 = fma(_637, _637, _641);
        float _645 = sqrt(_643);
        bool _647 = _645 >= (*spvDescriptorSet0.vp_c4)._m0[20].x;
        bool _649 = isnan(_645);
        bool _651 = _647 || _649;
        bool _653 = isnan((*spvDescriptorSet0.vp_c4)._m0[20].x);
        bool _655 = _651 || _653;
        float _657 = _645 * _639;
        float _659 = _657;
        if (!_655)
        {
            float _661 = -_657;
            float _663 = _661 + 1.0;
            _659 = _663;
        }
        float _665 = _659;
        float _667 = _665;
        if (!_655)
        {
            float _669 = _665 * _665;
            _667 = _669;
        }
        float _671 = _667;
        int _673 = as_type<int>(_671);
        if (!_655)
        {
            float _675 = fma(_671, (*spvDescriptorSet0.vp_c4)._m0[24].x, _627);
            _673 = as_type<int>(_675);
        }
        int _677 = _673;
        if (!_655)
        {
            out.m_40.x = as_type<float>(_677);
        }
    }
    float _679 = fma(_393, -0.5, _569);
    float _681 = _260 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _683 = _262 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    float _685 = _264 * (*spvDescriptorSet0.vp_c4)._m0[25].z;
    out.m_42.x = _571;
    out.m_44.x = _573;
    out.m_42.y = _679;
    out.m_46.x = _198;
    out.m_42.w = _198;
    out.m_48.x = _681;
    out.m_48.y = _683;
    out.m_48.z = _685;
    if (!_184)
    {
        out.gl_Position.w = 0.0;
    }
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_32.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_32.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_32.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_32.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

